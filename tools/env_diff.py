#!/usr/bin/env python3
"""Structural diff between two Mini World UGC environment exports.

Both sides may be any mix of formats: the current ``mwenviron/1`` Lua export and
the legacy ``ugcscriptenv.txt``.  The comparison runs on the parsed tree, so
unlike a line diff it reports added/removed modules and methods, signature
changes and moved members, not just changed text.

    python3 tools/env_diff.py [old] [new] [--summary] [--json]

Defaults: old = ~/Downloads/ugcscriptenv.txt, new = the export in
``miniworld-scripts/3.0/environments`` (``devenv.lua`` preferred).
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
sys.path.insert(0, str(SCRIPT_DIR))

import env_lib  # noqa: E402

DEFAULT_OLD = Path.home() / "Downloads/ugcscriptenv.txt"


def surface(path: Path) -> tuple[env_lib.Header, dict[str, dict]]:
    header, root = env_lib.load(path)
    entries = env_lib.surface_entries(root)
    details, _ = _function_meta(root)
    for entry in entries:
        if entry["kind"] == "function" and entry["name"] in details:
            entry.update(details[entry["name"]])
    return header, {entry["name"]: entry for entry in entries}


def _function_meta(root) -> tuple[dict[str, dict], set[str]]:
    """Attach ``mtype``/``rtypes`` from each function's annotations."""
    env = env_lib.main_index(root)
    details: dict[str, dict] = {}
    mod_only: set[str] = set()
    if not isinstance(env, env_lib.Table):
        return details, mod_only
    addrs = env_lib.address_map(root)
    visited: set = set()

    def walk(node: env_lib.Table, module: str | None) -> None:
        if node in visited:
            return
        visited.add(node)
        for key in env_lib.sorted_keys(node):
            if not isinstance(key, str) or key in env_lib.INTERNAL_KEYS:
                continue
            value = env_lib.deref(root, node.fields[key], addrs)
            name = f"{module}:{key}" if module else key
            if isinstance(value, env_lib.Func):
                info: dict = {}
                if value.mtype:
                    info["mtype"] = value.mtype
                    if value.mtype == "Mod" and value.service:
                        mod_only.add(value.service)
                if value.rtypes:
                    info["rtypes"] = dict(value.rtypes)
                if info:
                    details[name] = info
            elif isinstance(value, env_lib.Table) and value.ref is None:
                if env_lib._classify(value) == "module":
                    walk(value, name)

    walk(env, None)
    return details, mod_only


def _signature(entry: dict) -> tuple:
    return (
        entry.get("kind"),
        tuple(entry.get("params") or ()),
        tuple(sorted((entry.get("values") or {}).items())),
        entry.get("mtype"),
        tuple(sorted((entry.get("rtypes") or {}).items())),
    )


def diff(old: dict[str, dict], new: dict[str, dict]) -> dict:
    added = sorted(set(new) - set(old))
    removed = sorted(set(old) - set(new))
    changed = []
    for name in sorted(set(old) & set(new)):
        before, after = _signature(old[name]), _signature(new[name])
        if before != after:
            changed.append({
                "name": name,
                "kind_old": old[name].get("kind"),
                "kind_new": new[name].get("kind"),
                "params_old": old[name].get("params"),
                "params_new": new[name].get("params"),
                "values_old": old[name].get("values"),
                "values_new": new[name].get("values"),
                "mtype_old": old[name].get("mtype"),
                "mtype_new": new[name].get("mtype"),
                "rtypes_old": old[name].get("rtypes"),
                "rtypes_new": new[name].get("rtypes"),
            })
    return {"added": added, "removed": removed, "changed": changed}


def describe(result: dict, old: dict, new: dict, summary_only: bool) -> None:
    added = [n for n in result["added"] if new[n].get("kind") in ("function", "variable")]
    new_modules = [n for n in result["added"] if new[n].get("kind") in ("module", "class", "enum")]
    removed = [n for n in result["removed"] if old[n].get("kind") in ("function", "variable")]
    gone_modules = [n for n in result["removed"] if old[n].get("kind") in ("module", "class", "enum")]

    print(f"old: {len(old)} entries    new: {len(new)} entries")
    print(f"added {len(added)} APIs / {len(new_modules)} types   "
          f"removed {len(removed)} APIs / {len(gone_modules)} types   "
          f"changed {len(result['changed'])}")
    if summary_only:
        return

    def section(title: str, names: list[str]) -> None:
        if not names:
            return
        print(f"\n--- {title} ({len(names)}) ---")
        for name in names:
            print(f"+ {name}" if title.startswith("added") else f"- {name}")

    section("added APIs", added)
    section("removed APIs", removed)
    section("added types", new_modules)
    section("removed types", gone_modules)

    if result["changed"]:
        print(f"\n--- signature changes ({len(result['changed'])}) ---")
        for item in result["changed"]:
            if item["params_old"] != item["params_new"]:
                print(f"~ {item['name']}  ({', '.join(item['params_old'] or [])})"
                      f" -> ({', '.join(item['params_new'] or [])})")
            elif item["mtype_old"] != item["mtype_new"]:
                print(f"~ {item['name']}  mtype {item['mtype_old']} -> {item['mtype_new']}")
            elif item["rtypes_old"] != item["rtypes_new"]:
                print(f"~ {item['name']}  rtype {describe_rtypes(item['rtypes_old'])}"
                      f" -> {describe_rtypes(item['rtypes_new'])}")
            else:
                print(f"~ {item['name']}  {item['kind_old']} -> {item['kind_new']}")


def describe_rtypes(rtypes: dict | None) -> str:
    if not rtypes:
        return "(none)"
    return "{" + ", ".join(f"{k}={v}" for k, v in sorted(rtypes.items())) + "}"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("old", nargs="?", type=Path, default=DEFAULT_OLD)
    parser.add_argument("new", nargs="?", type=Path, default=None)
    parser.add_argument("--summary", action="store_true")
    parser.add_argument("--json", action="store_true")
    args = parser.parse_args()

    old_path = args.old.expanduser()
    new_path = args.new or env_lib.face_path("dev")

    for label, path in (("old", old_path), ("new", new_path)):
        if path is None or not path.exists():
            print(f"错误: {label} 文件不存在 {path}", file=sys.stderr)
            return 1

    assert old_path is not None and new_path is not None
    header_old, old = surface(old_path)
    header_new, new = surface(new_path)
    result = diff(old, new)

    print(f"对比: {old_path.name} (旧) vs {new_path.name} (新)")
    if header_old.game and header_new.game and header_old.game != header_new.game:
        print(f"版本变更: {header_old.game} -> {header_new.game}")
    print()
    describe(result, old, new, args.summary)

    if args.json:
        print("\n=== JSON ===")
        print(json.dumps(result, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
