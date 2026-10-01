#!/usr/bin/env python3
"""Extract API definitions from a Mini World UGC environment dump.

Reads whichever export is present in ``miniworld-scripts/3.0/environments``
(the current ``devenv.lua``, or a legacy ``ugcscriptenv.txt``) and writes the
flattened ``tmp/env-apis.json`` consumed by ``check_coverage.py`` and
``merge_sources.py``.

    python3 tools/api-update/parse_env.py [--face dev|official|motion] [--input F] [--output F]
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parents[1]
TOOLS_DIR = SCRIPT_DIR.parent
sys.path.insert(0, str(TOOLS_DIR))

import env_lib  # noqa: E402

OUTPUT_FILE = PROJECT_ROOT / "tmp" / "env-apis.json"


def parse_env_dump(filepath: Path, mgr_path: Path | None = None) -> list[dict]:
    """Flatten one exported face into the ``env-apis.json`` entry list."""
    header, root = env_lib.load(filepath)
    entries = env_lib.surface_entries(root)
    details, mod_only = _function_details(root)
    for entry in entries:
        if entry["kind"] == "function" and entry["name"] in details:
            entry.update(details[entry["name"]])
    _apply_service_injection(entries, mod_only | _mod_only_methods(mgr_path))
    return entries


def _mod_only_methods(mgr_path: Path | None) -> set[str]:
    """``Module.Method`` names the engine exposes as DevApiMType.Mod.

    ``ScriptEnvMgr:CreateModEvnService`` re-wraps those with
    ``function(sev, ...) value(sev, modId, ...) end``, so their exposed
    signature carries one extra argument the raw service function does not show.
    Requires the ``mgr`` face exported by dump_env.lua.
    """
    names: set[str] = set()
    if mgr_path is None or not mgr_path.exists():
        return names
    _, root = env_lib.load(mgr_path)
    if not isinstance(root, env_lib.Table):
        return names
    mod_services = root.fields.get("modServices")
    if not isinstance(mod_services, env_lib.Table):
        return names

    def collect(node, prefix: str) -> None:
        for key in env_lib.sorted_keys(node):
            value = node.fields[key]
            path = f"{prefix}.{key}" if prefix else str(key)
            if isinstance(value, env_lib.Table):
                collect(value, path)
            elif value is True:
                names.add(path)

    collect(mod_services, "")
    return names


def _apply_service_injection(entries: list[dict], mod_only: set[str]) -> None:
    for entry in entries:
        if entry["kind"] != "function" or not entry.get("module"):
            continue
        service = f"{entry['module']}.{entry['name'].rpartition(':')[2]}"
        if service not in mod_only:
            continue
        params = list(entry.get("params") or [])
        if params and params[0] == "self":
            params.insert(1, "modId")
        else:
            params.insert(0, "modId")
        entry["params"] = params
        entry["inject"] = ["modId"]


def _function_details(root) -> tuple[dict[str, dict], set[str]]:
    """Signature metadata keyed by ``Module:Method``, plus the dotted names the
    dump marked as ``DevApiMType.Mod``.

    ``params`` comes from the environment; these extras only exist in the new
    format and are ignored by consumers that do not ask for them.
    """
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
                if value.native:
                    info["native"] = value.native
                if value.service:
                    info["service"] = value.service
                if value.source:
                    info["source_file"] = value.source
                if value.mtype:
                    info["mtype"] = value.mtype
                    if value.mtype == "Mod" and value.service:
                        mod_only.add(value.service)
                if value.rtypes:
                    info["rtypes"] = dict(value.rtypes)
                if value.is_unresolved:
                    info["unresolved"] = True
                if info:
                    details[name] = info
            elif isinstance(value, env_lib.Table) and value.ref is None:
                kind = env_lib._classify(value)
                if kind == "module":
                    walk(value, name)

    walk(env, None)
    return details, mod_only


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--face", default="dev", choices=sorted(env_lib.FACE_FILENAMES))
    parser.add_argument("--input", type=Path, default=None)
    parser.add_argument("--mgr", type=Path, default=None)
    parser.add_argument("--output", type=Path, default=OUTPUT_FILE)
    args = parser.parse_args()

    input_file = args.input or env_lib.face_path(args.face)
    if input_file is None or not input_file.exists():
        print(f"Error: no export found for face {args.face!r} in {env_lib.env_dir()}", file=sys.stderr)
        return 1

    mgr_file = args.mgr
    if mgr_file is None:
        candidate = env_lib.face_path("mgr")
        if candidate is not None and candidate.parent == input_file.parent:
            mgr_file = candidate

    print(f"Parsing: {input_file}  ({env_lib.detect_format(input_file.read_text(encoding='utf-8', errors='replace'))})")
    if mgr_file is not None and mgr_file.exists():
        print(f"Service metadata: {mgr_file.name}")
    entries = parse_env_dump(input_file, mgr_file)

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(entries, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"Extracted {len(entries)} API entries")
    print(f"Output: {args.output}")

    kinds: dict[str, int] = {}
    for entry in entries:
        kinds[entry["kind"]] = kinds.get(entry["kind"], 0) + 1
    for kind, count in sorted(kinds.items()):
        print(f"  {kind}: {count}")

    modules: dict[str, int] = {}
    for entry in entries:
        module = entry.get("module") or "(top-level)"
        modules[module] = modules.get(module, 0) + 1
    print(f"\nTop modules ({len(modules)}):")
    for module, count in sorted(modules.items(), key=lambda kv: -kv[1])[:20]:
        print(f"  {module}: {count}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
