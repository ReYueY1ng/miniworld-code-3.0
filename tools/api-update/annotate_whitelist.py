#!/usr/bin/env python3
"""Ensure every whitelist-only API in library/ carries the call-restriction note.

Whitelisted APIs are the environment entries whose ``@rtype`` includes
``WhiteList`` (DevApiRType value 3), collected from both ``devenv.lua`` and
``officialenv.lua``. The note text matches what the library already uses:

    ---**调用限制**: 仅白名单用户可用

Usage:
    python3 tools/api-update/annotate_whitelist.py --check   # report only
    python3 tools/api-update/annotate_whitelist.py           # apply
"""

from __future__ import annotations

import argparse
import importlib.util
import re
import sys
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parents[1]
TOOLS_DIR = SCRIPT_DIR.parent
LIBRARY_DIR = PROJECT_ROOT / "library"
NOTE = "---**调用限制**: 仅白名单用户可用"

sys.path.insert(0, str(TOOLS_DIR))
import env_lib  # noqa: E402


def _load_parse_env():
    path = SCRIPT_DIR / "parse_env.py"
    spec = importlib.util.spec_from_file_location("parse_env_whitelist", path)
    if spec is None or spec.loader is None:
        raise SystemExit(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


parse_env = _load_parse_env()


def whitelist_entries() -> dict[str, dict]:
    entries: dict[str, dict] = {}
    for face in ("dev", "official"):
        path = env_lib.face_path(face)
        if path is None or not path.exists():
            continue
        for entry in parse_env.parse_env_dump(path, env_lib.face_path("mgr")):
            if entry["kind"] != "function":
                continue
            if not any("WhiteList" in key for key in (entry.get("rtypes") or {})):
                continue
            previous = entries.get(entry["name"])
            if previous is None or len(entry.get("params") or []) > len(previous.get("params") or []):
                entries[entry["name"]] = entry
    return entries


def qualifier_of(name: str) -> str:
    return name.rpartition(":")[0].replace(":", ".")


def method_of(name: str) -> str:
    return name.rpartition(":")[2]


def find_definition(text: str, qualifier: str, method: str) -> int | None:
    pattern = re.compile(
        r"^function\s+" + re.escape(qualifier) + r"[:.]" + re.escape(method) + r"\s*\(",
        re.M,
    )
    match = pattern.search(text)
    return match.start() if match else None


def doc_block(lines: list[str], function_line: int) -> tuple[int, int]:
    end = function_line
    start = end
    while start > 0 and lines[start - 1].startswith("---"):
        start -= 1
    return start, end


def apply_note(text: str, position: int) -> tuple[str, bool]:
    lines = text.splitlines(keepends=True)
    function_line = text[:position].count("\n")
    start, end = doc_block(lines, function_line)
    for index in range(start, end):
        if "白名单" in lines[index]:
            return text, False
    insert_at = function_line
    for index in range(start, end):
        if lines[index].lstrip().startswith("---@"):
            insert_at = index
            break
    lines.insert(insert_at, NOTE + "\n")
    return "".join(lines), True


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="report missing notes without writing")
    args = parser.parse_args()

    entries = whitelist_entries()
    files = sorted(LIBRARY_DIR.rglob("*.lua"))
    texts = {path: path.read_text(encoding="utf-8", errors="replace") for path in files}

    annotated = 0
    pending: list[Path] = []
    missing_definition: list[str] = []
    for name, entry in sorted(entries.items()):
        qualifier, method = qualifier_of(name), method_of(name)
        hits = 0
        for path, text in texts.items():
            position = find_definition(text, qualifier, method)
            if position is None:
                continue
            hits += 1
            updated, changed = apply_note(text, position)
            if changed:
                texts[path] = updated
                pending.append(path)
            else:
                annotated += 1
        if hits == 0:
            missing_definition.append(name)

    if not args.check:
        for path in set(pending):
            path.write_text(texts[path], encoding="utf-8")

    total = len(entries)
    if args.check:
        print(f"whitelist APIs: {total}, already annotated: {annotated}, "
              f"missing note: {len(pending)}, no definition: {len(missing_definition)}")
    else:
        print(f"whitelist APIs: {total}, already annotated: {annotated}, "
              f"notes added: {len(pending)}, no definition: {len(missing_definition)}")
    for name in missing_definition:
        print("  no definition:", name)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
