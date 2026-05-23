#!/usr/bin/env python3
"""
Compare unified API sources (api-sources.json) with current library/*.lua files.
Generates an update plan with categories: add, fix, deprecated, enum_merge.
"""

import json
import os
import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[2]
LIBRARY_DIR = REPO_ROOT / "library"
SOURCES_FILE = REPO_ROOT / "tmp" / "api-sources.json"
OUTPUT_FILE = REPO_ROOT / "tmp" / "api-update-plan.json"


def parse_library_files():
    """Parse all library/*.lua files to extract existing API definitions."""
    functions = {}  # "Module:Method" -> {params, returns, protected, file}
    enums = {}  # "EnumName" -> {values: {key: val}, file}
    classes = set()  # set of class names
    protected_set = set()

    for lua_file in sorted(LIBRARY_DIR.glob("*.lua")):
        content = lua_file.read_text(encoding="utf-8")
        lines = content.split("\n")
        fname = f"library/{lua_file.name}"

        # Track protected annotations
        for i, line in enumerate(lines):
            if "---@protected" in line:
                # Look ahead for the function definition
                for j in range(i + 1, min(i + 5, len(lines))):
                    m = re.search(r"function\s+(\w+):(\w+)\(", lines[j])
                    if m:
                        protected_set.add(f"{m.group(1)}:{m.group(2)}")
                        break

        # Extract classes
        for m in re.finditer(r"---@class\s+(\w+)", content):
            classes.add(m.group(1))

        # Extract enums with their values
        # Pattern: ---@enum EnumName\n---description?\nEnumName = {\n  key = val,\n...\n}
        enum_pattern = re.compile(
            r"---@enum\s+(\w+)\s*\n"
            r"(?:---[^\n]*\n)*"
            r"\w+\s*=\s*\{([^}]*)\}",
            re.DOTALL,
        )
        for m in enum_pattern.finditer(content):
            enum_name = m.group(1)
            body = m.group(2)
            values = {}
            for vm in re.finditer(r"(\w+)\s*=\s*([^,}]+)", body):
                key = vm.group(1).strip()
                val = vm.group(2).strip()
                # Remove inline comments
                val = re.sub(r"\s*--.*$", "", val)
                values[key] = val
            enums[enum_name] = {"values": values, "file": fname}

        # Extract function definitions with their annotations
        # We'll walk through lines looking for function defs and collect preceding annotations
        func_pattern = re.compile(r"function\s+(\w+):(\w+)\(([^)]*)\)")

        for i, line in enumerate(lines):
            fm = func_pattern.search(line)
            if not fm:
                continue

            module_name = fm.group(1)
            method_name = fm.group(2)
            raw_params = fm.group(3).strip()
            func_key = f"{module_name}:{method_name}"

            # Collect annotations from preceding lines
            params = []
            returns = []
            description_lines = []
            is_protected = func_key in protected_set

            # Walk backwards from function line to collect annotations
            for j in range(i - 1, max(i - 30, -1), -1):
                aline = lines[j].strip()
                if not aline.startswith("---"):
                    break

                # Parse ---@param name type desc
                pm = re.match(r"---@param\s+(\??)(\w+)\s+(.+?)(?:\s+.*)?$", aline)
                if pm:
                    optional = pm.group(1) == "?"
                    pname = pm.group(2)
                    ptype = pm.group(3).strip()
                    params.insert(
                        0, {"name": pname, "type": ptype, "optional": optional}
                    )
                    continue

                # Parse ---@return type desc
                rm = re.match(r"---@return\s+(\w+(?:\|[\w]+)*)\s*(.*)?$", aline)
                if rm:
                    rtype = rm.group(1).strip()
                    returns.insert(0, {"type": rtype})
                    continue

                # Description lines (not annotations)
                if aline.startswith("---") and not aline.startswith("---@"):
                    desc = aline[3:].strip()
                    if desc:
                        description_lines.insert(0, desc)

            description = " ".join(description_lines)

            # Parse raw params from function signature for comparison
            raw_param_names = []
            if raw_params:
                for rp in raw_params.split(","):
                    rp = rp.strip()
                    if rp:
                        raw_param_names.append(rp)

            functions[func_key] = {
                "module": module_name,
                "method": method_name,
                "params": params,
                "raw_params": raw_param_names,
                "returns": returns,
                "description": description,
                "protected": is_protected,
                "file": fname,
            }

    return functions, enums, classes, protected_set


def load_api_sources():
    """Load the unified API sources from api-sources.json."""
    with open(SOURCES_FILE, "r", encoding="utf-8") as f:
        data = json.load(f)

    functions = {}  # "Module:Method" -> entry
    enums = {}  # "EnumName" -> entry

    for entry in data:
        kind = entry.get("kind", "")
        name = entry.get("name", "")
        module = entry.get("module", "")
        sources = entry.get("sources", [])

        if kind == "function":
            # name is "Module.Method"
            key = name.replace(".", ":")
            functions[key] = entry
        elif kind == "enum":
            enums[name] = entry

    return functions, enums


def normalize_type(t):
    """Normalize a type string for comparison."""
    if not t:
        return ""
    t = t.strip().lower()
    # Normalize common type aliases
    t = t.replace("integer", "number")
    t = t.replace("int", "number")
    t = t.replace("float", "number")
    t = t.replace("double", "number")
    t = t.replace("boolean", "bool")
    t = t.replace("void", "nil")
    return t


def params_signature_match(lib_params, src_params):
    """Check if parameter signatures are compatible."""
    lib_count = len(lib_params)
    src_count = len(src_params)

    # Filter out optional params for min count
    lib_required = sum(1 for p in lib_params if not p.get("optional"))
    src_required = sum(1 for p in src_params if not p.get("optional", False))

    # If source has no params and lib has no params, match
    if src_count == 0 and lib_count == 0:
        return True

    # If source has params but lib doesn't (or vice versa), mismatch
    if src_count == 0 and lib_count > 0:
        return False
    if src_count > 0 and lib_count == 0:
        return False

    # Check param count compatibility (allowing optional params)
    if lib_count != src_count:
        # Check if the difference is explained by optional params
        if lib_required <= src_count <= lib_count:
            pass  # Compatible
        elif src_required <= lib_count <= src_count:
            pass  # Compatible
        else:
            return False

    # Check type compatibility for overlapping params
    for i in range(min(lib_count, src_count)):
        lib_type = normalize_type(lib_params[i].get("type", ""))
        src_type = normalize_type(src_params[i].get("type", ""))

        # 'any' type matches anything
        if lib_type == "any" or src_type == "any":
            continue

        # Check if types are compatible (allowing union types)
        lib_types = set(lib_type.split("|"))
        src_types = set(src_type.split("|"))

        if not lib_types.intersection(src_types):
            return False

    return True


def generate_plan():
    """Generate the update plan comparing sources with library."""
    print("Parsing library files...")
    lib_funcs, lib_enums, lib_classes, protected = parse_library_files()
    print(
        f"  Found {len(lib_funcs)} functions, {len(lib_enums)} enums, {len(lib_classes)} classes"
    )
    print(f"  Protected methods: {len(protected)}")

    print("Loading API sources...")
    src_funcs, src_enums = load_api_sources()
    print(f"  Found {len(src_funcs)} source functions, {len(src_enums)} source enums")

    add_list = []
    fix_list = []
    deprecated_list = []
    enum_merge_list = []

    # --- Categorize functions ---
    lib_keys = set(lib_funcs.keys())
    src_keys = set(src_funcs.keys())

    # ADD: functions in sources but not in library
    for key in sorted(src_keys - lib_keys):
        entry = src_funcs[key]
        module = entry.get("module", "")
        method = (
            entry.get("name", "").split(".")[-1]
            if "." in entry.get("name", "")
            else entry.get("name", "")
        )
        source_file = f"library/{module}.lua"

        # Check if source file exists, if not try to find the right module
        if not (LIBRARY_DIR / f"{module}.lua").exists():
            # Try to find which file might contain this module
            source_file = f"library/{module}.lua (may need new file)"

        add_list.append(
            {
                "name": key,
                "module": module,
                "params": entry.get("params", []),
                "returns": entry.get("returns", []),
                "description": entry.get("description", ""),
                "source_file": source_file,
                "sources": entry.get("sources", []),
            }
        )

    # FIX: functions in both but signatures differ
    for key in sorted(lib_keys & src_keys):
        lib_entry = lib_funcs[key]
        src_entry = src_funcs[key]

        # Compare params
        lib_params = lib_entry["params"]
        src_params_raw = src_entry.get("params", [])

        # Normalize source params to same format, filter out implicit 'self'
        src_params = []
        for p in src_params_raw:
            pname = p.get("name", "")
            if pname == "self":
                continue  # implicit method param, not part of annotation
            src_params.append(
                {
                    "name": pname,
                    "type": p.get("type", ""),
                    "optional": p.get("optional", False),
                }
            )

        # Compare returns
        lib_returns = lib_entry["returns"]
        src_returns_raw = src_entry.get("returns", [])
        src_returns = [{"type": r.get("type", "")} for r in src_returns_raw]

        # Check if signatures differ
        params_match = params_signature_match(lib_params, src_params)
        returns_match = True

        if lib_returns and src_returns:
            lib_ret_types = {normalize_type(r["type"]) for r in lib_returns}
            src_ret_types = {normalize_type(r["type"]) for r in src_returns}
            if lib_ret_types != src_ret_types:
                # Allow 'any' to match anything
                if "any" not in lib_ret_types and "any" not in src_ret_types:
                    returns_match = False

        if not params_match or not returns_match:
            fix_list.append(
                {
                    "name": key,
                    "module": lib_entry["module"],
                    "current_params": lib_params,
                    "new_params": src_params,
                    "current_returns": lib_returns,
                    "new_returns": src_returns,
                    "source_file": lib_entry["file"],
                    "sources": src_entry.get("sources", []),
                    "params_match": params_match,
                    "returns_match": returns_match,
                }
            )

    # DEPRECATED: functions in library but not in sources (excluding protected)
    for key in sorted(lib_keys - src_keys):
        lib_entry = lib_funcs[key]
        # Skip protected methods
        if lib_entry["protected"]:
            continue
        deprecated_list.append(
            {
                "name": key,
                "module": lib_entry["module"],
                "source_file": lib_entry["file"],
                "params": lib_entry["params"],
                "returns": lib_entry["returns"],
            }
        )

    # ENUM_MERGE: enum values in sources but not in library
    for enum_name in sorted(set(src_enums.keys()) & set(lib_enums.keys())):
        src_enum = src_enums[enum_name]
        lib_enum = lib_enums[enum_name]

        src_values = src_enum.get("values", {})
        lib_values = lib_enum.get("values", {})

        # Normalize source values (they're strings in sources, may be numbers in lib)
        # Compare by finding values in source that aren't in library
        new_values = {}

        # Build a lookup of library values (normalized)
        lib_val_set = set()
        for lk, lv in lib_values.items():
            lib_val_set.add(lk.lower())
            lib_val_set.add(str(lv).strip().strip('"').strip("'"))

        for sk, sv in src_values.items():
            # Check if this key exists in library (case-insensitive for UPPER_SNAKE_CASE)
            sk_lower = sk.lower()
            found = False
            for lk in lib_values:
                if lk.lower() == sk_lower:
                    found = True
                    break
            if not found:
                # Convert source value for display
                new_values[sk] = sv

        if new_values:
            enum_merge_list.append(
                {
                    "name": enum_name,
                    "existing_values": lib_values,
                    "new_values": new_values,
                    "source_file": lib_enum["file"],
                    "sources": src_enum.get("sources", []),
                }
            )

    # Also check for enums in sources but not in library at all (treat as add)
    for enum_name in sorted(set(src_enums.keys()) - set(lib_enums.keys())):
        src_enum = src_enums[enum_name]
        add_list.append(
            {
                "name": enum_name,
                "module": "Enum",
                "kind": "enum",
                "params": [],
                "returns": [],
                "description": src_enum.get("description", ""),
                "source_file": "library/Enum.lua",
                "sources": src_enum.get("sources", []),
                "values": src_enum.get("values", {}),
            }
        )

    plan = {
        "add": add_list,
        "fix": fix_list,
        "deprecated": deprecated_list,
        "enum_merge": enum_merge_list,
    }

    return plan


def main():
    plan = generate_plan()

    # Write output
    OUTPUT_FILE.parent.mkdir(parents=True, exist_ok=True)
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        json.dump(plan, f, ensure_ascii=False, indent=2)

    # Print summary
    print(f"\nUpdate plan written to {OUTPUT_FILE}")
    print(f"  add:         {len(plan['add'])}")
    print(f"  fix:         {len(plan['fix'])}")
    print(f"  deprecated:  {len(plan['deprecated'])}")
    print(f"  enum_merge:  {len(plan['enum_merge'])}")

    # Show some samples
    if plan["add"]:
        print(f"\nSample ADD entries (first 5):")
        for entry in plan["add"][:5]:
            print(f"  {entry['name']} ({entry.get('sources', [])})")

    if plan["fix"]:
        print(f"\nSample FIX entries (first 5):")
        for entry in plan["fix"][:5]:
            print(
                f"  {entry['name']} (params_match={entry['params_match']}, returns_match={entry['returns_match']})"
            )

    if plan["deprecated"]:
        print(f"\nSample DEPRECATED entries (first 5):")
        for entry in plan["deprecated"][:5]:
            print(f"  {entry['name']}")

    if plan["enum_merge"]:
        print(f"\nSample ENUM_MERGE entries (first 5):")
        for entry in plan["enum_merge"][:5]:
            print(f"  {entry['name']}: {len(entry['new_values'])} new values")


if __name__ == "__main__":
    main()
