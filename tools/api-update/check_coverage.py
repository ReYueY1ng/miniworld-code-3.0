#!/usr/bin/env python3
"""Check API coverage and signature consistency between library and env sources."""

import json
import re
import sys
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parents[1]
LIBRARY_DIR = PROJECT_ROOT / "library"
ENV_APIS_FILE = PROJECT_ROOT / "tmp" / "env-apis.json"
OUTPUT_FILE = PROJECT_ROOT / "tmp" / "api-check-report.json"

# Match: function ClassName:MethodName(p1, p2, ...) end
# Match: function ClassName.MethodName(p1, p2, ...) end
# Match: function MethodName(p1, p2, ...) end
FUNC_PATTERN = re.compile(
    r"^function\s+([\w.:]+)\s*\(([^)]*)\)\s*(?:return\s+.+)?\s*end\s*$"
)

# Match: ---@param name type description
PARAM_ANNOTATION = re.compile(r"^---@param\s+(\w+)\s+(\S+)")


def parse_library_functions():
    """Parse all library/*.lua files and extract function definitions with signatures."""
    functions = {}  # "ClassName:MethodName" -> [param_names]
    annotations = {}  # "ClassName:MethodName" -> [(param_name, param_type), ...]

    for lua_file in sorted(LIBRARY_DIR.glob("*.lua")):
        lines = lua_file.read_text(encoding="utf-8").splitlines()
        pending_params = []  # collected from ---@param annotations

        for line in lines:
            line = line.strip()

            # Collect param annotations
            m = PARAM_ANNOTATION.match(line)
            if m:
                pending_params.append((m.group(1), m.group(2)))
                continue

            # Match function definition
            m = FUNC_PATTERN.match(line)
            if m:
                full_name = m.group(1)
                param_str = m.group(2).strip()

                # Normalize: ClassName.MethodName -> ClassName:MethodName
                full_name = full_name.replace(".", ":")

                # Extract param names from function signature
                if param_str:
                    sig_params = [p.strip() for p in param_str.split(",")]
                else:
                    sig_params = []

                functions[full_name] = sig_params

                # Store annotation-based params if available
                if pending_params:
                    annotations[full_name] = pending_params
                    pending_params = []
                else:
                    annotations[full_name] = [(p, "any") for p in sig_params]
            elif not line.startswith("---@"):
                # Reset pending params if we hit non-annotation, non-function line
                if line and not line.startswith("---"):
                    pending_params = []

    return functions, annotations


def load_json(path):
    """Load JSON file."""
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def check_coverage(env_apis, lib_functions):
    """Check which env APIs are covered in the library."""
    covered = []
    uncovered = []

    for api in env_apis:
        name = api["name"]
        kind = api["kind"]

        # Skip modules and classes - they are structural, not callable APIs
        if kind in ("module", "class"):
            continue

        # For enums, check if they exist in library (Enum.lua has them)
        if kind == "enum":
            # Enums are defined differently; check if name appears anywhere
            found = False
            for lib_name in lib_functions:
                if lib_name == name or lib_name.startswith(name + ":"):
                    found = True
                    break
            # Also check if it's a standalone variable in library
            if not found:
                # Enums might be defined as tables, not functions
                # Check Enum.lua content
                enum_file = LIBRARY_DIR / "Enum.lua"
                if enum_file.exists():
                    content = enum_file.read_text(encoding="utf-8")
                    # Look for ---@enum Name or Name = {} patterns
                    if re.search(
                        rf"---@enum\s+{re.escape(name)}\b", content
                    ) or re.search(
                        rf"^{re.escape(name)}\s*=\s*\{{", content, re.MULTILINE
                    ):
                        found = True
            if found:
                covered.append(name)
            else:
                uncovered.append(name)
            continue

        # For functions: check both Module:Method and Module.Method forms
        if kind == "function":
            # env-apis uses "Module:Method" for methods, bare "Name" for globals
            if ":" in name:
                # Method: e.g., "Chat:SendChat"
                if name in lib_functions:
                    covered.append(name)
                else:
                    uncovered.append(name)
            else:
                # Global function
                # Check direct match, or Module:Name form
                if name in lib_functions:
                    covered.append(name)
                else:
                    # Try matching as a method of any module
                    found = False
                    for lib_name in lib_functions:
                        if lib_name.endswith(":" + name):
                            found = True
                            break
                        if lib_name == name:
                            found = True
                            break
                    if found:
                        covered.append(name)
                    else:
                        uncovered.append(name)

    return covered, uncovered


def check_signatures(env_apis, lib_functions, lib_annotations):
    """Compare signatures between env APIs and library definitions."""
    consistent = []
    mismatched = []

    for api in env_apis:
        if api["kind"] != "function":
            continue

        name = api["name"]
        env_params = api.get("params", [])

        # Find matching library function
        lib_name = None
        if name in lib_functions:
            lib_name = name
        else:
            # Try finding as method
            for ln in lib_functions:
                if ln.endswith(":" + name.split(":")[-1]) and (
                    ":" not in name or ln == name
                ):
                    lib_name = ln
                    break

        if lib_name is None:
            continue  # Not covered, skip

        lib_ann = lib_annotations.get(lib_name, [])
        lib_param_names = (
            [p[0] for p in lib_ann] if lib_ann else lib_functions[lib_name]
        )

        # Normalize env params - can be strings or objects
        env_param_names = []
        for p in env_params:
            if isinstance(p, str):
                env_param_names.append(p)
            elif isinstance(p, dict):
                env_param_names.append(p.get("name", "?"))

        # Strip leading "self" from env params (Lua method implicit param)
        if env_param_names and env_param_names[0] == "self":
            env_param_names = env_param_names[1:]

        # Strip leading "self" from lib params
        if lib_param_names and lib_param_names[0] == "self":
            lib_param_names = lib_param_names[1:]

        # Compare param count and names (case-insensitive)
        is_consistent = True
        if len(env_param_names) != len(lib_param_names):
            is_consistent = False
        else:
            for ep, lp in zip(env_param_names, lib_param_names):
                if ep.lower() != lp.lower():
                    is_consistent = False
                    break

        if not is_consistent:
            mismatched.append(
                {
                    "name": name,
                    "library_params": lib_param_names,
                    "source_params": env_param_names,
                }
            )
        else:
            consistent.append(name)

    return consistent, mismatched


def main():
    print("Loading env-apis.json...")
    env_apis = load_json(ENV_APIS_FILE)
    print(f"  Loaded {len(env_apis)} environment APIs")

    print("Parsing library/*.lua files...")
    lib_functions, lib_annotations = parse_library_functions()
    print(f"  Found {len(lib_functions)} function definitions")

    print("Checking coverage...")
    covered, uncovered = check_coverage(env_apis, lib_functions)

    # Count only function and enum env APIs (skip modules/classes)
    checkable = [a for a in env_apis if a["kind"] in ("function", "enum")]
    total_env = len(checkable)
    covered_count = len(covered)
    uncovered_count = len(uncovered)
    pct = round(covered_count / total_env * 100, 1) if total_env > 0 else 0.0

    print(f"  Total checkable: {total_env}")
    print(f"  Covered: {covered_count} ({pct}%)")
    print(f"  Uncovered: {uncovered_count}")

    print("Checking signature consistency...")
    consistent, mismatched = check_signatures(env_apis, lib_functions, lib_annotations)
    total_compared = len(consistent) + len(mismatched)
    print(f"  Compared: {total_compared}")
    print(f"  Consistent: {len(consistent)}")
    print(f"  Mismatched: {len(mismatched)}")

    report = {
        "coverage": {
            "total_env_apis": total_env,
            "covered": covered_count,
            "uncovered": uncovered_count,
            "percentage": pct,
        },
        "signature_consistency": {
            "total_compared": total_compared,
            "consistent": len(consistent),
            "mismatched": len(mismatched),
        },
        "uncovered_apis": uncovered,
        "mismatched_signatures": mismatched,
    }

    OUTPUT_FILE.parent.mkdir(parents=True, exist_ok=True)
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        json.dump(report, f, indent=2, ensure_ascii=False)
    print(f"\nReport written to {OUTPUT_FILE}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
