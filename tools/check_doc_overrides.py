#!/usr/bin/env python3
"""Validate the hand-curated doc overrides against the generated API lanes.

`tools/api-update/doc_overrides/*.json` supplies Chinese descriptions, parameter
notes and return values for the official / trigger lanes. Because it is written
by hand, drift is the real risk: a renamed method, a stale key, a parameter that
no longer exists, or a return line that breaks the `---@return <type> <name>
<desc>` contract LuaLS needs.

    python3 tools/check_doc_overrides.py            # full report
    python3 tools/check_doc_overrides.py --quiet    # errors only
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parents[1]
LANE_DIRS = (
    PROJECT_ROOT / "library" / "optional" / "official",
    PROJECT_ROOT / "library" / "optional" / "trigger",
)
OVERRIDES_DIR = PROJECT_ROOT / "tools" / "api-update" / "doc_overrides"

FUNCTION_HEAD = re.compile(r"^function\s+([\w.]+):(\w+)\s*\(")
RETURN_LINE = re.compile(r"^([\w.|\[\]?]+)\s+(\w+)\s+(\S.*)$")
ALLOWED_TYPES = {
    "number", "integer", "string", "boolean", "table", "function", "userdata",
    "any", "nil", "true", "false", "Mini.Vec3",
}
BAD_DESC_PREFIXES = ("函数", "接口", "方法")


def lane_functions(lane_dirs: tuple[Path, ...] = LANE_DIRS) -> dict[tuple[str, str], list[str]]:
    functions: dict[tuple[str, str], list[str]] = {}
    for directory in lane_dirs:
        for path in sorted(directory.glob("*.lua")):
            params: list[str] | None = None
            head: tuple[str, str] | None = None
            for line in path.read_text(encoding="utf-8").splitlines():
                match = FUNCTION_HEAD.match(line)
                if match:
                    head = (match.group(1), match.group(2))
                    params = []
                    remainder = line[match.end():]
                    if ")" in remainder:
                        params = _params(remainder.split(")")[0])
                        functions[head] = params
                        head = None
                    continue
                if head is not None and params is not None:
                    params.append(line.strip().rstrip(","))
                    if ")" in line:
                        functions[head] = [p for p in params if p]
                        head = None
    return functions


def _params(text: str) -> list[str]:
    cleaned = text.replace("...", " vararg ").strip()
    return [part.strip() for part in cleaned.split(",") if part.strip()]


def load_overrides(overrides_dir: Path = OVERRIDES_DIR) -> tuple[dict[tuple[str, str], dict], list[str]]:
    merged: dict[tuple[str, str], dict] = {}
    problems: list[str] = []
    if not overrides_dir.is_dir():
        return merged, problems
    for path in sorted(overrides_dir.glob("*.json")):
        try:
            data = json.loads(path.read_text(encoding="utf-8"))
        except json.JSONDecodeError as error:
            problems.append(f"{path.name}: invalid JSON ({error})")
            continue
        for key, value in data.items():
            qualifier, _, method = key.rpartition(":")
            if not qualifier or not method:
                problems.append(f"{path.name}: malformed key {key!r}")
                continue
            if (qualifier, method) in merged:
                problems.append(f"{path.name}: duplicate key {key!r}")
                continue
            merged[(qualifier, method)] = {"value": value, "file": path.name}
    return merged, problems


def check_return(payload: str) -> str | None:
    match = RETURN_LINE.match(payload.strip())
    if not match:
        return "expected '<type> <name> <description>'"
    type_text = match.group(1)
    for part in re.split(r"[|]", type_text):
        token = part.strip().rstrip("?")
        if token.startswith("[]"):
            token = token[2:]
        if token and token not in ALLOWED_TYPES:
            return f"unknown type {token!r}"
    return None


def check_desc(desc: str) -> str | None:
    if not desc.strip():
        return "empty description"
    if "<br>" in desc or "<br/>" in desc:
        return "<br> belongs on its own line"
    if desc.strip().endswith(("。", ".", "；", ";", "，", ",")):
        return "trailing punctuation"
    if desc.lstrip().startswith(BAD_DESC_PREFIXES):
        return "description starts with 函数/接口/方法"
    return None


def run(lane_dirs: tuple[Path, ...] = LANE_DIRS,
        overrides_dir: Path = OVERRIDES_DIR) -> tuple[dict[str, int], list[str]]:
    functions = lane_functions(lane_dirs)
    overrides, problems = load_overrides(overrides_dir)
    entries_checked = 0

    for (qualifier, method), record in sorted(overrides.items()):
        value, filename = record["value"], record["file"]
        key = f"{qualifier}:{method}"
        if (qualifier, method) not in functions:
            problems.append(f"{filename}: {key} is not in the generated lanes")
            continue
        params = functions[(qualifier, method)]
        entries_checked += 1

        desc = value.get("desc")
        if desc is None:
            problems.append(f"{filename}: {key} has no desc")
        else:
            issue = check_desc(str(desc))
            if issue:
                problems.append(f"{filename}: {key} desc {issue}")

        for name in (value.get("params") or {}):
            if name not in params:
                problems.append(f"{filename}: {key} documents unknown param {name!r}")
        for name, text in (value.get("params") or {}).items():
            if not str(text).strip():
                problems.append(f"{filename}: {key} param {name!r} has an empty description")

        for payload in value.get("returns") or []:
            issue = check_return(str(payload))
            if issue:
                problems.append(f"{filename}: {key} return {issue}: {payload!r}")

        for note in value.get("notes") or []:
            if "<br>" in str(note):
                problems.append(f"{filename}: {key} note contains <br>")

    covered = sum(1 for key in functions if key in overrides)
    stats = {"functions": len(functions), "entries": entries_checked, "covered": covered}
    return stats, problems


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--quiet", action="store_true", help="print errors only")
    args = parser.parse_args()

    stats, problems = run()
    if not args.quiet:
        print(f"lane functions: {stats['functions']}")
        print(f"override entries: {stats['entries']} ({stats['covered']} functions covered)")
        print(f"problems: {len(problems)}")

    for problem in problems:
        print(f"  {problem}", file=sys.stderr)
    return 1 if problems else 0


if __name__ == "__main__":
    raise SystemExit(main())
