#!/usr/bin/env python3
"""Merge env, decompiled, and docs API sources into a single unified JSON file.

Priority: decompiled (3) > env (2) > docs (1)
"""

import json
import sys
from pathlib import Path

BASE = Path(__file__).resolve().parent.parent.parent
TMP = BASE / "tmp"

PRIORITY = {"decompiled": 3, "env": 2, "docs": 1, "old_docs": 1}
DESC_PRIORITY = {"docs": 3, "old_docs": 2, "env": 1, "decompiled": 0}


def normalize_name(name: str) -> str:
    """Normalize API name to Module:Method or Module.Method format."""
    return name


def parse_module_method(name: str) -> tuple:
    """Extract module and method from a name like 'Player:GetNickname' or 'ABTestMgr.ClearABTestAccount'."""
    for sep in (":", "."):
        if sep in name:
            parts = name.split(sep, 1)
            return parts[0], parts[1]
    return name, ""


def build_key(name: str) -> str:
    """Build a normalized key for deduplication.

    Convert Module.Method → Module:Method so entries from different sources
    that refer to the same API get merged together.
    """
    module, method = parse_module_method(name)
    if method:
        return f"{module}:{method}"
    return name


def convert_env_params(params):
    """Convert env params (already list of strings) to standard format."""
    if not params:
        return []
    result = []
    for p in params:
        if isinstance(p, str):
            result.append({"name": p, "type": "any"})
        elif isinstance(p, dict):
            result.append(p)
    return result


def convert_decompiled_params(params):
    """Convert decompiled params (list of strings) to standard format.

    Decompiled params have format "name: type" (e.g., "data: table", "value: unknown").
    Parse the type from the name string.
    """
    if not params:
        return []
    result = []
    for p in params:
        if isinstance(p, str):
            # Parse "name: type" format
            if ": " in p:
                parts = p.split(": ", 1)
                name = parts[0].strip()
                ptype = parts[1].strip()
                # Clean up type - remove trailing stuff like "optional" markers
                ptype = ptype.split()[0] if ptype else "any"
                result.append({"name": name, "type": ptype})
            else:
                result.append({"name": p, "type": "any"})
        elif isinstance(p, dict):
            result.append(p)
    return result


def convert_decompiled_returns(returns):
    """Convert decompiled returns (list of strings) to standard format."""
    if not returns:
        return []
    result = []
    for r in returns:
        if isinstance(r, str):
            result.append({"type": r})
        elif isinstance(r, dict):
            result.append(r)
    return result


def convert_docs_params(params):
    """Convert docs params (list of objects) to standard format."""
    if not params:
        return []
    result = []
    for p in params:
        if isinstance(p, dict):
            result.append(
                {
                    "name": p.get("name", ""),
                    "type": p.get("type", "any"),
                    "desc": p.get("desc", ""),
                }
            )
        elif isinstance(p, str):
            result.append({"name": p, "type": "any"})
    return result


def convert_docs_returns(returns):
    """Convert docs returns (list of objects) to standard format."""
    if not returns:
        return []
    result = []
    for r in returns:
        if isinstance(r, dict):
            result.append(
                {
                    "type": r.get("type", "any"),
                    "desc": r.get("desc", ""),
                }
            )
        elif isinstance(r, str):
            result.append({"type": r})
    return result


def merge_params(existing_params, new_params):
    """Merge params: prefer longer/more-detailed list."""
    if not new_params:
        return existing_params
    if not existing_params:
        return new_params
    # Prefer the one with more entries; if equal, prefer the one with type info
    existing_has_type = any(p.get("type", "any") != "any" for p in existing_params)
    new_has_type = any(p.get("type", "any") != "any" for p in new_params)
    if len(new_params) > len(existing_params):
        return new_params
    if (
        len(new_params) == len(existing_params)
        and new_has_type
        and not existing_has_type
    ):
        return new_params
    return existing_params


def merge_returns(existing_returns, new_returns):
    """Merge returns: prefer longer/more-detailed list."""
    if not new_returns:
        return existing_returns
    if not existing_returns:
        return new_returns
    existing_has_type = any(r.get("type", "any") != "any" for r in existing_returns)
    new_has_type = any(r.get("type", "any") != "any" for r in new_returns)
    if len(new_returns) > len(existing_returns):
        return new_returns
    if (
        len(new_returns) == len(existing_returns)
        and new_has_type
        and not existing_has_type
    ):
        return new_returns
    return existing_returns


def merge_enum_values(existing_values, new_values):
    """Merge enum values: union of all values."""
    if not new_values:
        return existing_values
    if not existing_values:
        return new_values
    merged = dict(existing_values)
    merged.update(new_values)
    return merged


def main():
    print("Loading source files...")
    env_data = json.loads((TMP / "env-apis.json").read_text(encoding="utf-8"))
    dec_data = json.loads((TMP / "decompiled-apis.json").read_text(encoding="utf-8"))
    docs_data = json.loads((TMP / "docs-apis.json").read_text(encoding="utf-8"))

    print(f"  env: {len(env_data)} entries")
    print(f"  decompiled: {len(dec_data)} entries")
    print(f"  docs: {len(docs_data)} entries")

    merged = {}  # key → entry

    def get_source_name(entry):
        return entry.get("source", "unknown")

    def process_entry(entry, source_name):
        raw_name = entry["name"]
        key = build_key(raw_name)
        src = source_name
        src_priority = PRIORITY.get(src, 0)

        kind = entry.get("kind", "function")
        module, method = parse_module_method(raw_name)

        entry_desc = entry.get("description", "")
        src_desc_priority = DESC_PRIORITY.get(src, 0)

        if key not in merged:
            merged[key] = {
                "name": raw_name,
                "kind": kind,
                "module": module,
                "sources": [src],
                "priority": src_priority,
                "params": [],
                "returns": [],
                "description": entry_desc,
                "desc_priority": src_desc_priority,
                "values": {},
                "example": entry.get("example", ""),
            }
        else:
            existing = merged[key]
            if src not in existing["sources"]:
                existing["sources"].append(src)
            if src_priority > existing["priority"]:
                existing["priority"] = src_priority
                existing["name"] = raw_name
                if entry.get("example"):
                    existing["example"] = entry["example"]
            # Merge description with priority: docs > old_docs > env > decompiled
            if entry_desc and src_desc_priority > existing.get("desc_priority", 0):
                existing["description"] = entry_desc
                existing["desc_priority"] = src_desc_priority
            elif entry_desc and not existing.get("description"):
                existing["description"] = entry_desc
                existing["desc_priority"] = src_desc_priority
            if not existing.get("example") and entry.get("example"):
                existing["example"] = entry["example"]
            # Keep the most descriptive name (prefer colon format)
            if ":" in raw_name and ":" not in existing["name"]:
                existing["name"] = raw_name

        entry_data = merged[key]

        # Merge params and returns based on source
        if src == "env":
            entry_data["params"] = merge_params(
                entry_data["params"], convert_env_params(entry.get("params", []))
            )
            if entry.get("values"):
                entry_data["values"] = merge_enum_values(
                    entry_data["values"], entry["values"]
                )
        elif src == "decompiled":
            entry_data["params"] = merge_params(
                entry_data["params"], convert_decompiled_params(entry.get("params", []))
            )
            entry_data["returns"] = merge_returns(
                entry_data["returns"],
                convert_decompiled_returns(entry.get("returns", [])),
            )
        elif src in ("docs", "old_docs"):
            entry_data["params"] = merge_params(
                entry_data["params"], convert_docs_params(entry.get("params", []))
            )
            entry_data["returns"] = merge_returns(
                entry_data["returns"], convert_docs_returns(entry.get("returns", []))
            )

    # Process all entries
    print("Processing env entries...")
    for entry in env_data:
        process_entry(entry, "env")

    print("Processing decompiled entries...")
    for entry in dec_data:
        process_entry(entry, "decompiled")

    print("Processing docs entries...")
    for entry in docs_data:
        process_entry(entry, get_source_name(entry))

    # Convert to list and clean up
    result = []
    for entry in merged.values():
        if entry["kind"] != "enum" or not entry["values"]:
            entry.pop("values", None)
        if not entry.get("example"):
            entry.pop("example", None)
        entry.pop("desc_priority", None)
        result.append(entry)

    # Sort by module then name
    result.sort(key=lambda e: (e.get("module") or "", e["name"]))

    output_path = TMP / "api-sources.json"
    output_path.write_text(
        json.dumps(result, ensure_ascii=False, indent=2), encoding="utf-8"
    )

    # Stats
    source_counts = {"env": 0, "decompiled": 0, "docs": 0}
    kind_counts = {}
    for entry in result:
        for s in entry["sources"]:
            source_counts[s] = source_counts.get(s, 0) + 1
        k = entry["kind"]
        kind_counts[k] = kind_counts.get(k, 0) + 1

    print(f"\nMerged {len(result)} unique APIs → {output_path}")
    print(f"  Source overlap: {source_counts}")
    print(f"  By kind: {kind_counts}")

    # Validate
    assert len(result) > 100, f"Expected >100 entries, got {len(result)}"
    print(f"\n✓ Verification passed: {len(result)} entries")


if __name__ == "__main__":
    main()
