#!/usr/bin/env python3
"""Apply API updates to library files based on the update plan."""

import json
import re
import sys
from pathlib import Path
from collections import defaultdict

REPO_ROOT = Path(__file__).resolve().parents[2]
LIBRARY_DIR = REPO_ROOT / "library"
PLAN_FILE = REPO_ROOT / "tmp" / "api-update-plan.json"
CHANGES_FILE = REPO_ROOT / "tmp" / "api-changes.txt"


def load_plan():
    """Load the update plan."""
    with open(PLAN_FILE, "r", encoding="utf-8") as f:
        return json.load(f)


def load_library_file(filepath):
    """Load a library file and return its content."""
    with open(filepath, "r", encoding="utf-8") as f:
        return f.read()


def save_library_file(filepath, content):
    """Save content to a library file."""
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(content)


def format_param_annotation(param):
    """Format a parameter annotation line."""
    name = param.get("name", "")
    ptype = param.get("type", "any")
    optional = param.get("optional", False)
    desc = param.get("desc", "")

    if optional:
        return f"---@param? {name} {ptype} {desc}".strip()
    return f"---@param {name} {ptype} {desc}".strip()


def format_return_annotation(ret):
    """Format a return annotation line."""
    rtype = ret.get("type", "any")
    desc = ret.get("desc", "")
    return f"---@return {rtype} {desc}".strip()


def generate_function_stub(entry):
    """Generate a function stub with annotations."""
    name = entry.get("name", "")
    params = entry.get("params", [])
    returns = entry.get("returns", [])
    description = entry.get("description", "")

    lines = []

    if description:
        lines.append(f"---{description}")

    non_self_params = [p for p in params if p.get("name") != "self"]

    for param in non_self_params:
        lines.append(format_param_annotation(param))

    for ret in returns:
        lines.append(format_return_annotation(ret))

    param_names = []
    for param in params:
        pname = param.get("name", "")
        if pname == "self":
            continue
        param_names.append(pname)

    param_str = ", ".join(param_names)

    is_method = any(p.get("name") == "self" for p in params) or ":" in name

    if is_method:
        if name.count(":") >= 2:
            parts = name.split(":")
            module = parts[0]
            method = ":".join(parts[1:])
            func_name = f"{module}:{method}"
            func_name = func_name.replace(":", ".", 1)
        elif ":" in name:
            module, method = name.split(":", 1)
            func_name = f"{module}:{method}"
        elif "." in name:
            module, method = name.split(".", 1)
            func_name = f"{module}.{method}"
        else:
            func_name = name

        if not any(p.get("name") == "self" for p in params) and param_str:
            param_str = "self, " + param_str
        elif not any(p.get("name") == "self" for p in params) and not param_str:
            param_str = "self"
        lines.append(f"function {func_name}({param_str}) end")
    else:
        if "." in name:
            func_name = name
        elif ":" in name:
            func_name = name.replace(":", ".")
        else:
            func_name = name
        lines.append(f"function {func_name}({param_str}) end")

    return "\n".join(lines)

    return "\n".join(lines)


def find_insert_position(content, module_name):
    """Find the position to insert new functions for a module.

    Returns the line number (0-indexed) where new functions should be inserted.
    """
    lines = content.split("\n")

    # Look for existing functions in this module
    last_func_line = -1
    for i, line in enumerate(lines):
        if re.match(rf"^function\s+{re.escape(module_name)}[.:]", line):
            last_func_line = i

    if last_func_line >= 0:
        # Find the end of this function (look for 'end' at same indentation)
        func_indent = len(lines[last_func_line]) - len(lines[last_func_line].lstrip())
        i = last_func_line + 1
        while i < len(lines):
            line = lines[i]
            if line.strip() == "end" or (
                line.strip().startswith("end") and not line.strip().startswith("end,")
            ):
                curr_indent = len(line) - len(line.lstrip())
                if curr_indent <= func_indent:
                    return i + 1
            i += 1
        return last_func_line + 1

    # Look for class definition
    for i, line in enumerate(lines):
        if re.match(rf"^---@class\s+{re.escape(module_name)}\b", line):
            # Find the class table definition
            for j in range(i, min(i + 10, len(lines))):
                if re.match(rf"^{re.escape(module_name)}\s*=\s*\{{", lines[j]):
                    # Find the end of the table
                    brace_count = 0
                    for k in range(j, len(lines)):
                        brace_count += lines[k].count("{") - lines[k].count("}")
                        if brace_count == 0:
                            return k + 1
            break

    # If no existing functions, find the end of the file
    return len(lines)


def apply_adds(content, adds):
    """Apply add entries to the content."""
    changes = []

    # Group adds by module
    by_module = defaultdict(list)
    for entry in adds:
        module = entry.get("module", "")
        by_module[module].append(entry)

    for module, entries in by_module.items():
        # Generate all function stubs for this module
        stubs = []
        for entry in entries:
            stub = generate_function_stub(entry)
            stubs.append(stub)
            changes.append(f"ADD: {entry['name']}")

        # Find insert position
        insert_pos = find_insert_position(content, module)

        # Insert the stubs
        lines = content.split("\n")
        new_lines = lines[:insert_pos] + stubs + lines[insert_pos:]
        content = "\n".join(new_lines)

    return content, changes


def apply_fixes(content, fixes):
    """Apply fix entries to the content."""
    changes = []

    for fix in fixes:
        name = fix.get("name", "")
        module = fix.get("module", "")
        new_params = fix.get("new_params", [])
        new_returns = fix.get("new_returns", [])

        # Find the function in the file
        lines = content.split("\n")
        func_start = -1
        func_end = -1

        for i, line in enumerate(lines):
            if re.match(rf"^function\s+{re.escape(module)}[.:]", line):
                # Check if this is the right function
                if (
                    name.split(":", 1)[-1]
                    if ":" in name
                    else name.split(".", 1)[-1] in line
                ):
                    func_start = i
                    # Find end of function
                    func_indent = len(line) - len(line.lstrip())
                    for j in range(i + 1, len(lines)):
                        if lines[j].strip() == "end" or (
                            lines[j].strip().startswith("end")
                            and not lines[j].strip().startswith("end,")
                        ):
                            curr_indent = len(lines[j]) - len(lines[j].lstrip())
                            if curr_indent <= func_indent:
                                func_end = j
                                break
                    break

        if func_start < 0 or func_end < 0:
            continue

        # Find the annotation block (lines before the function)
        ann_start = func_start
        for i in range(func_start - 1, max(func_start - 30, -1), -1):
            if lines[i].strip().startswith("---"):
                ann_start = i
            else:
                break

        # Remove old annotations
        old_annotations = lines[ann_start:func_start]

        # Generate new annotations
        new_annotations = []

        # Get description from old annotations
        description = ""
        for line in old_annotations:
            if line.strip().startswith("---") and not line.strip().startswith("---@"):
                desc = line.strip()[3:].strip()
                if desc:
                    description = desc
                    break

        if description:
            new_annotations.append(f"---{description}")

        # Filter out 'self' from params
        non_self_params = [p for p in new_params if p.get("name") != "self"]

        for param in non_self_params:
            new_annotations.append(format_param_annotation(param))

        for ret in new_returns:
            new_annotations.append(format_return_annotation(ret))

        # Reconstruct the function signature
        line = lines[func_start]
        # Extract existing signature
        match = re.match(r"^(function\s+\w+[.:]\w+\()([^)]*)(\)\s*end)$", line)
        if match:
            prefix = match.group(1)
            suffix = match.group(3)

            # Build new param list
            param_names = []
            for param in new_params:
                pname = param.get("name", "")
                if pname == "self":
                    continue
                param_names.append(pname)

            new_param_str = ", ".join(param_names)
            new_line = f"{prefix}{new_param_str}{suffix}"

            # Replace the section
            lines[ann_start : func_end + 1] = new_annotations + [new_line]
            content = "\n".join(lines)
            changes.append(f"FIX: {name}")

    return content, changes


def apply_updates():
    """Main function to apply all updates."""
    print("Loading update plan...")
    plan = load_plan()

    adds = plan.get("add", [])
    fixes = plan.get("fix", [])
    deprecated = plan.get("deprecated", [])

    print(f"  Adds: {len(adds)}")
    print(f"  Fixes: {len(fixes)}")
    print(f"  Deprecated: {len(deprecated)}")

    all_changes = []

    file_changes = defaultdict(lambda: {"adds": [], "fixes": []})

    for entry in adds:
        source_file = entry.get("source_file", "")
        if "(may need new file)" in source_file:
            module = entry.get("module", "")
            source_file = f"library/{module}.lua"
        file_changes[source_file]["adds"].append(entry)

    for fix in fixes:
        source_file = fix.get("source_file", "")
        file_changes[source_file]["fixes"].append(fix)

    for source_file, changes in sorted(file_changes.items()):
        filepath = REPO_ROOT / source_file
        if not filepath.exists():
            continue

        print(f"\nProcessing {source_file}...")
        content = load_library_file(filepath)
        file_change_log = []

        if changes["adds"]:
            content, add_changes = apply_adds(content, changes["adds"])
            file_change_log.extend(add_changes)
            print(f"  Added {len(changes['adds'])} functions")

        if changes["fixes"]:
            content, fix_changes = apply_fixes(content, changes["fixes"])
            file_change_log.extend(fix_changes)
            print(f"  Fixed {len(changes['fixes'])} functions")

        save_library_file(filepath, content)
        all_changes.extend(file_change_log)

    print(f"\nWriting change log to {CHANGES_FILE}...")
    with open(CHANGES_FILE, "w", encoding="utf-8") as f:
        f.write("API Update Changes Log\n")
        f.write("=" * 50 + "\n\n")
        f.write(f"Total changes: {len(all_changes)}\n\n")
        f.write("Changes:\n")
        for change in all_changes:
            f.write(f"  - {change}\n")

    print(f"\nDone! {len(all_changes)} changes applied.")
    with open(CHANGES_FILE, "w", encoding="utf-8") as f:
        f.write("API Update Changes Log\n")
        f.write("=" * 50 + "\n\n")
        f.write(f"Total changes: {len(all_changes)}\n\n")
        f.write("Changes:\n")
        for change in all_changes:
            f.write(f"  - {change}\n")

    print(f"\nDone! {len(all_changes)} changes applied.")


if __name__ == "__main__":
    apply_updates()
