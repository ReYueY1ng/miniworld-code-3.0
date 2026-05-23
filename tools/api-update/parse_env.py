#!/usr/bin/env python3
"""Parse Mini World Lua runtime environment dump and extract API definitions."""

import json
import re
import sys
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parents[1]  # miniworld-code-3.0
MINI_ROOT = PROJECT_ROOT.parent.parent  # /home/yuey1ng/mini
INPUT_FILE = MINI_ROOT / "miniworld-scripts/3.0/environments/ugcscriptenv.txt"
OUTPUT_FILE = PROJECT_ROOT / "tmp/env-apis.json"

# Pattern to match function declarations
FUNC_PATTERN = re.compile(r'^(\s*)"(\w+)"\s*=\s*function\(([^)]*)\)\s*end\s*,?\s*$')
# Pattern to match table open with address
TABLE_OPEN_PATTERN = re.compile(r'^(\s*)"(\w+)"\s*=\s*table:\s*0x[0-9a-f]+\s*\{\s*$')
# Pattern to match plain table open (no quotes on key)
TABLE_OPEN_PATTERN2 = re.compile(r"^(\s*)(\w+)\s*=\s*table:\s*0x[0-9a-f]+\s*\{\s*$")
# Pattern to match table close
TABLE_CLOSE_PATTERN = re.compile(r"^(\s*)\}\s*,?\s*$")
# Pattern to match simple key-value: "key" = value,
KV_PATTERN = re.compile(r'^(\s*)"(\w+)"\s*=\s*(.+?)\s*,?\s*$')
# Pattern to match simple key-value without quotes: key = value,
KV_PATTERN2 = re.compile(r"^(\s*)(\w+)\s*=\s*(.+?)\s*,?\s*$")
# Pattern for standalone top-level function
TOP_FUNC_PATTERN = re.compile(r'^(\s*)"(\w+)"\s*=\s*function\(([^)]*)\)\s*end\s*,?\s*$')


def get_indent(line):
    """Return the indentation level (number of leading spaces)."""
    return len(line) - len(line.lstrip())


def parse_params(param_str):
    """Parse function parameter string into list of param names."""
    param_str = param_str.strip()
    if not param_str:
        return []
    params = []
    for p in param_str.split(","):
        p = p.strip()
        if p:
            params.append(p)
    return params


def classify_value(val_str):
    """Classify a value as number, string, boolean, nil, or other."""
    val_str = val_str.strip().rstrip(",")
    if val_str == "nil":
        return "nil"
    if val_str in ("true", "false"):
        return "boolean"
    try:
        float(val_str)
        return "number"
    except ValueError:
        pass
    if val_str.startswith('"') and val_str.endswith('"'):
        return "string"
    if val_str.startswith("table:"):
        return "table"
    if val_str.startswith("function"):
        return "function"
    return "unknown"


def parse_env_dump(filepath):
    """Parse the environment dump file and extract API entries."""
    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.readlines()

    entries = []
    # Stack to track nesting: (indent, name, is_enum_candidate, enum_values)
    # is_enum_candidate: True if all children seen so far are simple KV pairs
    stack = []

    # The file structure:
    # {                           (line 5, indent 0) - root
    #   "__metatableX" = table:   (line 6, indent 4) - metatable
    #     "__index" = table: {    (line 8, indent 8) - main index
    #       ...entries...         (indent 12+) - API entries

    # We need to find the __index table and parse its contents
    in_main_index = False
    main_index_indent = 0
    skip_until_close_indent = None  # for skipping __metatableX sub-tables

    # Track current module context
    current_module = None
    module_stack = []  # stack of (module_name, indent)

    i = 0
    while i < len(lines):
        line = lines[i].rstrip("\n")
        stripped = line.strip()
        indent = get_indent(line)

        # Skip empty lines and comments
        if not stripped or stripped.startswith("--"):
            i += 1
            continue

        # Detect the main __index table
        if not in_main_index:
            if '"__index" = table:' in stripped and indent >= 8:
                in_main_index = True
                main_index_indent = indent
                stack.append((indent, "__index", True, {}))
                i += 1
                continue
            i += 1
            continue

        # Check if we've exited the main __index table
        close_match = TABLE_CLOSE_PATTERN.match(line)
        if close_match:
            close_indent = get_indent(line)
            # Pop stack entries that are at or deeper than this indent
            while stack and stack[-1][0] >= close_indent:
                popped = stack.pop()
                # If we're closing a module-level table
                if module_stack and module_stack[-1][1] >= close_indent:
                    module_stack.pop()
                    current_module = module_stack[-1][0] if module_stack else None

            if not stack:
                # We've closed the root, done
                break
            i += 1
            continue

        # We're inside the main __index table
        # Check indentation to determine nesting level
        # Main __index entries are at indent > main_index_indent

        # Try to match function
        func_match = FUNC_PATTERN.match(line)
        if func_match:
            func_indent = get_indent(line)
            func_name = func_match.group(2)
            params_str = func_match.group(3)
            params = parse_params(params_str)

            # Determine the module context
            module = None
            if module_stack:
                # Find the closest module at a lower indent level
                for m_name, m_indent in reversed(module_stack):
                    if m_indent < func_indent:
                        module = m_name
                        break

            kind = "function"
            name = func_name
            if module:
                name = f"{module}:{func_name}"

            entry = {
                "name": name,
                "kind": kind,
                "module": module,
                "params": params,
                "source": "env",
            }
            entries.append(entry)
            i += 1
            continue

        # Try to match table open
        table_match = TABLE_OPEN_PATTERN.match(line)
        if not table_match:
            table_match = TABLE_OPEN_PATTERN.match(
                line.replace('"', '"').replace('"', '"')
            )
        if not table_match:
            table_match = TABLE_OPEN_PATTERN2.match(line)

        if table_match:
            table_indent = get_indent(line)
            table_name = table_match.group(2)

            # Check if this is a __metatableX internal table - skip it
            if table_name == "__metatableX":
                # Skip until matching close brace
                depth = 1
                i += 1
                while i < len(lines) and depth > 0:
                    l = lines[i].strip()
                    if l.endswith("{"):
                        depth += 1
                    if l.startswith("}"):
                        depth -= 1
                    i += 1
                continue

            # Check if this is __info table (enum metadata) - skip it
            if table_name == "__info":
                depth = 1
                i += 1
                while i < len(lines) and depth > 0:
                    l = lines[i].strip()
                    if l.endswith("{"):
                        depth += 1
                    if l.startswith("}"):
                        depth -= 1
                    i += 1
                continue

            # Check if this is a class definition (has __className_ inside)
            # We'll peek ahead to see
            is_class = False
            peek_i = i + 1
            peek_depth = 1
            while peek_i < len(lines) and peek_depth > 0 and peek_i < i + 30:
                peek_line = lines[peek_i].strip()
                if '"__className_"' in peek_line:
                    is_class = True
                    break
                if peek_line.endswith("{"):
                    peek_depth += 1
                if peek_line.startswith("}"):
                    peek_depth -= 1
                peek_i += 1

            if is_class:
                # This is a class definition, record as class
                module = None
                if module_stack:
                    for m_name, m_indent in reversed(module_stack):
                        if m_indent < table_indent:
                            module = m_name
                            break

                name = table_name
                if module:
                    name = f"{module}:{table_name}"

                entry = {
                    "name": name,
                    "kind": "class",
                    "module": module,
                    "source": "env",
                }
                entries.append(entry)

                # Skip the entire class table
                depth = 1
                i += 1
                while i < len(lines) and depth > 0:
                    l = lines[i].strip()
                    if l.endswith("{"):
                        depth += 1
                    if l.startswith("}"):
                        depth -= 1
                    i += 1
                continue

            # Check if this is a module table (contains functions)
            # or an enum table (contains only simple values)
            # We'll determine by peeking at contents
            is_module = False
            is_enum = True
            peek_i = i + 1
            peek_depth = 1
            enum_values = {}
            has_sub_tables = False

            while peek_i < len(lines) and peek_depth > 0 and peek_i < i + 200:
                peek_line = lines[peek_i].rstrip("\n")
                peek_stripped = peek_line.strip()

                if not peek_stripped or peek_stripped.startswith("--"):
                    peek_i += 1
                    continue

                if peek_stripped.endswith("{"):
                    peek_depth += 1
                    has_sub_tables = True
                if peek_stripped.startswith("}"):
                    peek_depth -= 1
                    if peek_depth == 0:
                        break

                # Check for function entries
                if "function(" in peek_stripped:
                    is_module = True
                    is_enum = False

                # Check for simple KV pairs at the immediate child level
                kv_match = KV_PATTERN.match(peek_line)
                if not kv_match:
                    kv_match = KV_PATTERN2.match(peek_line)
                if kv_match and peek_depth == 1:
                    k = kv_match.group(2)
                    v = kv_match.group(3).strip().rstrip(",")
                    if k not in ("__metatableX", "__info", "__className_"):
                        val_type = classify_value(v)
                        if val_type in ("number", "string"):
                            enum_values[k] = v
                        elif val_type == "function":
                            is_enum = False

                peek_i += 1

            # If it has __metatableX = nil at the top and only number/string values, it's an enum
            # Check if first child is __metatableX = nil
            has_metatable_nil = False
            if i + 1 < len(lines):
                next_line = lines[i + 1].strip()
                if "__metatableX" in next_line and "nil" in next_line:
                    has_metatable_nil = True

            module = None
            if module_stack:
                for m_name, m_indent in reversed(module_stack):
                    if m_indent < table_indent:
                        module = m_name
                        break

            name = table_name
            if module:
                name = f"{module}:{table_name}"

            if is_module or (has_sub_tables and not is_enum):
                # This is a module/namespace table
                entry = {
                    "name": name,
                    "kind": "module",
                    "module": module,
                    "source": "env",
                }
                entries.append(entry)
                module_stack.append((name, table_indent))
                current_module = name
                stack.append((table_indent, table_name, False, {}))
                i += 1
                continue
            elif is_enum and enum_values and has_metatable_nil:
                # This is an enum table
                entry = {
                    "name": name,
                    "kind": "enum",
                    "module": module,
                    "values": enum_values,
                    "source": "env",
                }
                entries.append(entry)
                # Skip the entire enum table
                depth = 1
                i += 1
                while i < len(lines) and depth > 0:
                    l = lines[i].strip()
                    if l.endswith("{"):
                        depth += 1
                    if l.startswith("}"):
                        depth -= 1
                    i += 1
                continue
            else:
                # Unknown table type, skip it
                stack.append((table_indent, table_name, True, {}))
                i += 1
                continue

        # Try to match KV pairs (variables/properties)
        kv_match = KV_PATTERN.match(line)
        if not kv_match:
            kv_match = KV_PATTERN2.match(line)
        if kv_match:
            key = kv_match.group(2)
            val = kv_match.group(3).strip().rstrip(",")

            # Skip internal keys
            if key in (
                "__metatableX",
                "__metatable",
                "__index",
                "__newindex",
                "__className_",
                "__call",
                "__info",
            ):
                i += 1
                continue

            # Skip _G table
            if key == "_G":
                i += 1
                continue

            val_type = classify_value(val)

            if val_type == "function":
                # This shouldn't happen (func_pattern should catch it), but handle it
                i += 1
                continue

            # For simple values at the top level of __index, these are standalone variables
            if indent <= main_index_indent + 4:
                module = None
                if module_stack:
                    for m_name, m_indent in reversed(module_stack):
                        if m_indent < indent:
                            module = m_name
                            break

                name = key
                if module:
                    name = f"{module}:{key}"

                entry = {
                    "name": name,
                    "kind": "variable",
                    "module": module,
                    "type": val_type,
                    "value": val,
                    "source": "env",
                }
                entries.append(entry)

        i += 1

    return entries


def main():
    if not INPUT_FILE.exists():
        print(f"Error: Input file not found: {INPUT_FILE}", file=sys.stderr)
        sys.exit(1)

    print(f"Parsing: {INPUT_FILE}")
    entries = parse_env_dump(INPUT_FILE)

    # Ensure output directory exists
    OUTPUT_FILE.parent.mkdir(parents=True, exist_ok=True)

    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        json.dump(entries, f, ensure_ascii=False, indent=2)

    print(f"Extracted {len(entries)} API entries")
    print(f"Output: {OUTPUT_FILE}")

    # Print summary by kind
    kinds = {}
    for e in entries:
        k = e["kind"]
        kinds[k] = kinds.get(k, 0) + 1
    for k, v in sorted(kinds.items()):
        print(f"  {k}: {v}")

    # Print top modules
    modules = {}
    for e in entries:
        m = e.get("module") or "(top-level)"
        modules[m] = modules.get(m, 0) + 1
    print(f"\nTop modules ({len(modules)}):")
    for m, v in sorted(modules.items(), key=lambda x: -x[1])[:20]:
        print(f"  {m}: {v}")


if __name__ == "__main__":
    main()
