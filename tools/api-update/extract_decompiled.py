#!/usr/bin/env python3
"""Extract function definitions from decompiled Lua scripts."""

import os
import re
import json
import sys
from pathlib import Path
from collections import defaultdict

# ORIGINAL: Full decompiled directory (too many entries)
# INPUT_DIR = "/run/media/yuey1ng/F25A9F0C5A9ECD2B/mini/dump/script_decompiled"
# FIXED: Only scan ugc/framework/ directory
INPUT_DIR = "/run/media/yuey1ng/F25A9F0C5A9ECD2B/mini/dump/script_decompiled/luascript/ugc/framework"
OUTPUT_FILE = "/home/yuey1ng/mini/luaaddons/miniworld-code-3.0/tmp/decompiled-apis.json"

# Regex patterns for function definitions
FUNC_METHOD = re.compile(
    r"^function\s+([A-Za-z_][A-Za-z0-9_]*)\s*:\s*([A-Za-z_][A-Za-z0-9_]*)\s*\(([^)]*)\)"
)
FUNC_DOT = re.compile(
    r"^function\s+([A-Za-z_][A-Za-z0-9_]*)\s*\.\s*([A-Za-z_][A-Za-z0-9_]*)\s*\(([^)]*)\)"
)
FUNC_LOCAL = re.compile(r"^local\s+function\s+([A-Za-z_][A-Za-z0-9_]*)\s*\(([^)]*)\)")
FUNC_GLOBAL = re.compile(r"^function\s+([A-Za-z_][A-Za-z0-9_]*)\s*\(([^)]*)\)")


def infer_param_type(param_name, func_body):
    """Infer parameter type from code usage patterns and name heuristics."""
    param_lower = param_name.lower()

    # Name-based heuristics
    if param_lower in (
        "id",
        "objid",
        "actorid",
        "userid",
        "playerid",
        "worldid",
        "uin",
        "mapid",
        "mapid",
        "uiid",
        "elementid",
        "areaid",
        "varid",
        "instid",
        "itemid",
        "animid",
        "gridindex",
        "timerid",
        "eventworldid",
        "itype",
        "dir",
        "type",
    ):
        return "integer"
    if param_lower in ("name", "key", "event", "msg", "tag", "attr"):
        return "string"
    if param_lower in (
        "num",
        "count",
        "index",
        "size",
        "len",
        "width",
        "height",
        "depth",
        "gridindex",
        "modelindex",
        "hp",
        "mp",
        "exp",
        "level",
        "damage",
        "attack",
        "defense",
        "speed",
        "radius",
        "range",
    ):
        return "integer"
    if param_lower in (
        "x",
        "y",
        "z",
        "vx",
        "vy",
        "vz",
        "yaw",
        "pitch",
        "roll",
        "scale",
        "opacity",
        "alpha",
        "r",
        "g",
        "b",
        "a",
    ):
        return "number"
    if param_lower in (
        "pos",
        "position",
        "posfrom",
        "posto",
        "center",
        "posbeg",
        "posend",
    ):
        return "number"
    if param_lower in (
        "flag",
        "enable",
        "is",
        "b",
        "isenable",
        "isneed",
        "ischeck",
        "isload",
        "issave",
        "isenter",
        "iseditor",
        "islocal",
    ):
        return "boolean"
    if param_lower in ("callback", "func", "handler", "fn", "listener"):
        return "function"
    if param_lower in ("str", "text", "desc", "fmt", "format"):
        return "string"
    if param_lower in (
        "table",
        "data",
        "list",
        "arr",
        "t",
        "params",
        "args",
        "config",
        "info",
        "param",
        "eventdata",
        "grid",
    ):
        return "table"
    if param_lower in (
        "time",
        "delta",
        "duration",
        "delay",
        "interval",
        "timeout",
        "dt",
        "scale",
        "offset",
    ):
        return "number"
    if param_lower in ("value", "val"):
        return "unknown"

    # Code usage patterns
    if not func_body:
        return "unknown"

    # Check for tonumber(param)
    if re.search(r"tonumber\s*\(\s*" + re.escape(param_name) + r"\s*\)", func_body):
        return "number"

    # Check for tostring(param)
    if re.search(r"tostring\s*\(\s*" + re.escape(param_name) + r"\s*\)", func_body):
        return "string"

    # Check for type(param) == "number"
    if re.search(
        r"type\s*\(\s*" + re.escape(param_name) + r'\s*\)\s*==\s*"number"', func_body
    ):
        return "number"
    if re.search(
        r"type\s*\(\s*" + re.escape(param_name) + r'\s*\)\s*==\s*"string"', func_body
    ):
        return "string"
    if re.search(
        r"type\s*\(\s*" + re.escape(param_name) + r'\s*\)\s*==\s*"table"', func_body
    ):
        return "table"
    if re.search(
        r"type\s*\(\s*" + re.escape(param_name) + r'\s*\)\s*==\s*"boolean"', func_body
    ):
        return "boolean"
    if re.search(
        r"type\s*\(\s*" + re.escape(param_name) + r'\s*\)\s*==\s*"function"', func_body
    ):
        return "function"

    # Check for #param (table length)
    if re.search(r"#" + re.escape(param_name) + r"\b", func_body):
        return "table"

    # Check for param:Method() (table method call)
    if re.search(re.escape(param_name) + r"\s*:", func_body):
        return "table"

    # Check for param ~= nil / param == nil (boolean-ish)
    if re.search(re.escape(param_name) + r"\s*[~=!]=\s*nil", func_body):
        return "unknown"

    # Check for param and / or not param (boolean usage)
    if re.search(r"\bif\b\s+" + re.escape(param_name) + r"\b", func_body):
        return "unknown"

    return "unknown"


def infer_return_type(func_name, lines, start_idx):
    """Infer return type from function body."""
    returns = []
    brace_depth = 0
    i = start_idx

    # Find the end of the function (look for 'end' keyword at same indentation)
    func_line = lines[start_idx]
    indent = len(func_line) - len(func_line.lstrip())

    while i < len(lines):
        line = lines[i].strip()
        i += 1

        # Check for return statement
        if line.startswith("return ") or line == "return":
            ret_expr = line[7:].strip() if line.startswith("return ") else ""
            if not ret_expr:
                returns.append("nil")
                continue

            # Try to infer type from return expression
            if ret_expr in ("true", "false"):
                returns.append("boolean")
            elif re.match(r"^-?\d+$", ret_expr):
                returns.append("integer")
            elif re.match(r"^-?\d+\.\d+$", ret_expr):
                returns.append("number")
            elif re.match(r'^"[^"]*"$', ret_expr) or re.match(r"^'[^']*'$", ret_expr):
                returns.append("string")
            elif re.match(r"^\{\s*\}$", ret_expr) or re.match(r"^\{.*=.*\}$", ret_expr):
                returns.append("table")
            elif ret_expr == "nil":
                returns.append("nil")
            elif re.match(r"^\w+:\w+\(", ret_expr):
                returns.append("unknown")
            elif re.match(r"^\w+$", ret_expr):
                # Single variable return - try to infer from name
                var_name = ret_expr.lower()
                if (
                    var_name.startswith("is_")
                    or var_name.startswith("has_")
                    or var_name.startswith("can_")
                ):
                    returns.append("boolean")
                elif (
                    var_name.startswith("count")
                    or var_name.startswith("num")
                    or var_name.startswith("size")
                ):
                    returns.append("integer")
                elif (
                    var_name.startswith("str")
                    or var_name.startswith("name")
                    or var_name.startswith("msg")
                ):
                    returns.append("string")
                elif (
                    var_name.startswith("list")
                    or var_name.startswith("arr")
                    or var_name.startswith("tbl")
                ):
                    returns.append("table")
                else:
                    returns.append("unknown")
            else:
                returns.append("unknown")

        # Check for end of function
        if line == "end" or (line.startswith("end") and not line.startswith("end,")):
            curr_indent = len(lines[i - 1]) - len(lines[i - 1].lstrip())
            if curr_indent <= indent:
                break

    # Filter out 'nil' returns (they mean no return value)
    returns = [r for r in returns if r != "nil"]

    if not returns:
        return []
    if len(returns) == 1:
        return returns
    # Multiple different return types - use unknown
    if len(set(returns)) > 1:
        return ["unknown"]
    return list(set(returns))


def extract_module_from_path(filepath, base_dir):
    """Extract module name from file path."""
    rel_path = os.path.relpath(filepath, base_dir)
    parts = rel_path.split(os.sep)

    # Remove file extension
    if parts:
        parts[-1] = os.path.splitext(parts[-1])[0]

    # Use directory structure as module hint
    if len(parts) > 1:
        return parts[-2]  # Parent directory name
    return parts[0] if parts else "unknown"


def parse_params(param_str):
    """Parse parameter string into list of parameter names."""
    if not param_str or not param_str.strip():
        return []

    params = []
    for p in param_str.split(","):
        p = p.strip()
        if p:
            # Handle varargs
            if p == "...":
                params.append("...")
            else:
                # Remove default values, type annotations, etc.
                p = re.split(r"\s*[=:]", p)[0].strip()
                if p:
                    params.append(p)
    return params


def scan_file(filepath):
    """Scan a Lua file for function definitions."""
    results = []

    try:
        with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
            content = f.read()
            lines = content.split("\n")
    except Exception:
        return results

    # Track which module the file defines (from file path)
    file_module = os.path.splitext(os.path.basename(filepath))[0]

    i = 0
    while i < len(lines):
        line = lines[i].strip()

        # Try Module:Method pattern
        m = FUNC_METHOD.match(line)
        if m:
            module = m.group(1)
            method = m.group(2)
            params_str = m.group(3)
            params = parse_params(params_str)

            # For colon syntax, 'self' is implicit
            if "self" not in params:
                params = ["self"] + params

            # Extract function body for inference
            func_body_start = i
            func_body_end = min(i + 50, len(lines))
            func_body = "\n".join(lines[func_body_start:func_body_end])

            # Infer parameter types (skip 'self')
            param_types = []
            for p in params:
                if p == "self" or p == "...":
                    param_types.append(p)
                else:
                    param_types.append(f"{p}: {infer_param_type(p, func_body)}")

            # Infer return types
            returns = infer_return_type(f"{module}:{method}", lines, i)

            results.append(
                {
                    "name": f"{module}:{method}",
                    "params": param_types,
                    "returns": returns,
                    "source": "decompiled",
                    "file": filepath,
                }
            )
            i += 1
            continue

        # Try Module.Method pattern
        m = FUNC_DOT.match(line)
        if m:
            module = m.group(1)
            method = m.group(2)
            params_str = m.group(3)
            params = parse_params(params_str)

            # Extract function body for inference
            func_body_start = i
            func_body_end = min(i + 50, len(lines))
            func_body = "\n".join(lines[func_body_start:func_body_end])

            # Infer parameter types (skip 'self')
            param_types = []
            for p in params:
                if p == "self" or p == "...":
                    param_types.append(p)
                else:
                    param_types.append(f"{p}: {infer_param_type(p, func_body)}")

            # Infer return types
            returns = infer_return_type(f"{module}.{method}", lines, i)

            results.append(
                {
                    "name": f"{module}.{method}",
                    "params": param_types,
                    "returns": returns,
                    "source": "decompiled",
                    "file": filepath,
                }
            )
            i += 1
            continue

        # Try local function pattern
        m = FUNC_LOCAL.match(line)
        if m:
            func_name = m.group(1)
            params_str = m.group(2)
            params = parse_params(params_str)

            # Extract function body for inference
            func_body_start = i
            func_body_end = min(i + 50, len(lines))
            func_body = "\n".join(lines[func_body_start:func_body_end])

            # Infer parameter types
            param_types = []
            for p in params:
                if p == "...":
                    param_types.append(p)
                else:
                    param_types.append(f"{p}: {infer_param_type(p, func_body)}")

            # Infer return types
            returns = infer_return_type(func_name, lines, i)

            # Use file module as prefix for local functions
            full_name = f"{file_module}.{func_name}"
            results.append(
                {
                    "name": full_name,
                    "params": param_types,
                    "returns": returns,
                    "source": "decompiled",
                    "file": filepath,
                }
            )
            i += 1
            continue

        # Try global function pattern
        m = FUNC_GLOBAL.match(line)
        if m:
            func_name = m.group(1)
            params_str = m.group(2)
            params = parse_params(params_str)

            # Extract function body for inference
            func_body_start = i
            func_body_end = min(i + 50, len(lines))
            func_body = "\n".join(lines[func_body_start:func_body_end])

            # Infer parameter types
            param_types = []
            for p in params:
                if p == "...":
                    param_types.append(p)
                else:
                    param_types.append(f"{p}: {infer_param_type(p, func_body)}")

            # Infer return types
            returns = infer_return_type(func_name, lines, i)

            results.append(
                {
                    "name": func_name,
                    "params": param_types,
                    "returns": returns,
                    "source": "decompiled",
                    "file": filepath,
                }
            )
            i += 1
            continue

        i += 1

    return results


def main():
    """Main entry point."""
    print(f"Scanning: {INPUT_DIR}")

    all_results = []
    file_count = 0
    error_count = 0

    # Walk directory tree
    for root, dirs, files in os.walk(INPUT_DIR):
        for filename in files:
            if filename.endswith(".lua") or filename.endswith(".bil"):
                filepath = os.path.join(root, filename)
                file_count += 1

                try:
                    results = scan_file(filepath)
                    all_results.extend(results)
                except Exception as e:
                    error_count += 1
                    if error_count <= 5:
                        print(f"Error processing {filepath}: {e}")

    # Remove file path from output (internal only)
    for entry in all_results:
        del entry["file"]

    # Deduplicate by name
    seen = set()
    unique_results = []
    for entry in all_results:
        if entry["name"] not in seen:
            seen.add(entry["name"])
            unique_results.append(entry)

    # Sort by name
    unique_results.sort(key=lambda x: x["name"])

    # Write output
    os.makedirs(os.path.dirname(OUTPUT_FILE), exist_ok=True)
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        json.dump(unique_results, f, indent=2, ensure_ascii=False)

    print(f"Files scanned: {file_count}")
    print(f"Functions found: {len(all_results)}")
    print(f"Unique functions: {len(unique_results)}")
    print(f"Errors: {error_count}")
    print(f"Output: {OUTPUT_FILE}")

    # Verify constraints
    if len(unique_results) >= 5000:
        print(f"WARNING: {len(unique_results)} entries exceeds 5000 limit")

    # Check for any/default types
    any_count = sum(
        1 for e in unique_results if any("any" in str(p) for p in e["params"])
    )
    unknown_count = sum(1 for e in unique_results if "unknown" in e["returns"])
    print(f"Params with 'any': {any_count}")
    print(f"Returns with 'unknown': {unknown_count}")


if __name__ == "__main__":
    main()
