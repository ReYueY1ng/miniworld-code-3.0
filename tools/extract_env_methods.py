#!/usr/bin/env python3
"""Compare the environment export against the LuaLS type library.

Lists, per top-level module, the methods the environment exposes but the
``library/*.lua`` files do not declare, and the declared methods the environment
no longer exposes.

    python3 tools/extract_env_methods.py [env-file] [--face dev|official] [--json]

Sub-modules under ``Trigger`` and ``Data`` are reported separately so the flat
``library/`` layout stays comparable.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent
LIBRARY_DIR = PROJECT_ROOT / "library"
sys.path.insert(0, str(SCRIPT_DIR))

import env_lib  # noqa: E402

SEPARATE_PREFIXES = ("Trigger", "Data")

_FUNC_RE = re.compile(r"function\s+(\w+)[.:](\w+)")


def env_modules(path: Path) -> dict[str, set[str]]:
    """``{module: {method, ...}}`` for every module in the export."""
    _, root = env_lib.load(path)
    modules: dict[str, set[str]] = {}
    for entry in env_lib.surface_entries(root):
        if entry["kind"] != "function" or not entry.get("module"):
            continue
        module, _, method = entry["name"].rpartition(":")
        modules.setdefault(module, set()).add(method)
    return modules


def library_methods(lib_dir: Path) -> dict[str, set[str]]:
    modules: dict[str, set[str]] = {}
    for lua_file in lib_dir.glob("*.lua"):
        for module, method in _FUNC_RE.findall(lua_file.read_text(encoding="utf-8")):
            modules.setdefault(module, set()).add(method)
    return modules


def compare(env: dict[str, set[str]], lib: dict[str, set[str]]) -> dict[str, dict]:
    result: dict[str, dict] = {}
    for module in sorted(set(env) | set(lib)):
        env_methods = env.get(module, set())
        lib_methods = lib.get(module, set())
        added = sorted(env_methods - lib_methods)
        removed = sorted(lib_methods - env_methods)
        if added or removed:
            result[module] = {
                "new": added,
                "removed": removed,
                "env_count": len(env_methods),
                "lib_count": len(lib_methods),
            }
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("env", nargs="?", type=Path, default=None)
    parser.add_argument("--face", default="dev", choices=sorted(env_lib.FACE_FILENAMES))
    parser.add_argument("--library", type=Path, default=LIBRARY_DIR)
    parser.add_argument("--json", action="store_true")
    args = parser.parse_args()

    env_path = args.env or env_lib.face_path(args.face)
    if env_path is None or not env_path.exists():
        print(f"环境表不存在: {env_path}", file=sys.stderr)
        return 1

    print(f"环境表: {env_path}")
    print(f"Library: {args.library}")
    print()

    diff = compare(env_modules(env_path), library_methods(args.library))

    primary = {m: v for m, v in diff.items() if not m.startswith(SEPARATE_PREFIXES)}
    secondary = {m: v for m, v in diff.items() if m.startswith(SEPARATE_PREFIXES)}

    total_new = total_removed = 0
    for group, table in (("顶级模块", primary), (f"{'/'.join(SEPARATE_PREFIXES)} 子模块", secondary)):
        if not table:
            continue
        print(f"=== {group} ===")
        print()
        for module, info in sorted(table.items()):
            print(f"### {module} (env: {info['env_count']}, lib: {info['lib_count']})")
            if info["new"]:
                print(f"  NEW ({len(info['new'])}):")
                for method in info["new"]:
                    print(f"    + {method}")
            if info["removed"]:
                print(f"  REMOVED ({len(info['removed'])}):")
                for method in info["removed"]:
                    print(f"    - {method}")
            print()
            total_new += len(info["new"])
            total_removed += len(info["removed"])

    print("=== 总计 ===")
    print(f"新增: {total_new}")
    print(f"删除: {total_removed}")

    if args.json:
        print("\n=== JSON ===")
        print(json.dumps(diff, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
