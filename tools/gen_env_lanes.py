#!/usr/bin/env python3
"""Generate the optional official-environment and Trigger API type definitions.

Sources (in priority order, per AGENTS.md):
  1. environment exports in miniworld-scripts/3.0/environments
     - officialenv.lua (face=official) -> official-only APIs
     - devenv.lua (face=dev)           -> Trigger namespace
  2. decompiled-type cache (tools/api-update/decompiled-types.json, produced by
     tools/decompiled_types.py from the decompiled framework) for parameter
     types, optionality and return types
  3. official wiki crawl cache (tmp/wiki_data/all_api.json) for doc text/param types

Outputs:
  library/optional/official/<Module>.lua   (default disabled)
  library/optional/trigger/Trigger.lua     (default disabled)

The plugin (plugin.lua) blanks these files unless the matching
Lua.runtime.pluginArgs switch is set to enable.

Usage:
    python3 tools/gen_env_lanes.py              # write both lanes
    python3 tools/gen_env_lanes.py --verify     # only count, no writes
    python3 tools/gen_env_lanes.py --only official|trigger
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import re
import sys
from collections import defaultdict
from pathlib import Path

TOOLS_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = TOOLS_DIR.parent
LIBRARY_DIR = PROJECT_ROOT / "library"
OFFICIAL_DIR = LIBRARY_DIR / "optional" / "official"
TRIGGER_DIR = LIBRARY_DIR / "optional" / "trigger"
WIKI_DOCS = PROJECT_ROOT / "tmp" / "wiki_data" / "all_api.json"
DECOMPILED_CACHE = TOOLS_DIR / "api-update" / "decompiled-types.json"

sys.path.insert(0, str(TOOLS_DIR))
import env_lib  # noqa: E402
from decompiled_types import ALIASES as DECOMPILED_ALIASES  # noqa: E402


def _load_parse_env():
    path = TOOLS_DIR / "api-update" / "parse_env.py"
    spec = importlib.util.spec_from_file_location("parse_env_lane", path)
    if spec is None or spec.loader is None:
        raise SystemExit(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


parse_env = _load_parse_env()

TYPE_MAP = {
    "": "any",
    "number": "number",
    "integer": "integer",
    "int": "integer",
    "string": "string",
    "boolean": "boolean",
    "bool": "boolean",
    "table": "table",
    "function": "function",
    "userdata": "userdata",
    "any": "any",
}

TRIGGER_MODULES = {
    "Actor": "角色模块",
    "Area": "区域模块",
    "ArrayTmp": "临时数组模块",
    "Backpack": "背包模块",
    "Block": "方块模块",
    "Buff": "状态模块",
    "Component": "组件模块",
    "CustomUI": "界面模块",
    "DisplayBoard": "显示板模块",
    "GameObject": "对象模块",
    "Graphics": "图文信息模块",
    "Item": "道具模块",
    "KvMap": "KV 表模块",
    "Math": "数学模块",
    "Monster": "生物模块",
    "Player": "玩家模块",
    "Timeline": "时间轴模块",
    "World": "世界模块",
}

RESERVED_PARAM_NAMES = {"function", "local", "end", "then", "repeat", "until", "goto"}


def load_face(face: str) -> list[dict]:
    path = env_lib.face_path(face)
    if path is None or not path.exists():
        raise SystemExit(f"environment export not found for face {face!r} in {env_lib.env_dir()}")
    mgr = env_lib.face_path("mgr")
    return parse_env.parse_env_dump(path, mgr)


def load_wiki_docs() -> dict[tuple[str, str], dict]:
    docs: dict[tuple[str, str], dict] = {}
    if not WIKI_DOCS.exists():
        return docs
    data = json.loads(WIKI_DOCS.read_text(encoding="utf-8"))
    for module, page in data.items():
        for item in page.get("items", []):
            name = str(item.get("name", ""))
            method = re.split(r"[.:]", name)[-1]
            for key in {module, module.split(".")[-1]}:
                docs.setdefault((key, method), item)
    return docs


def wiki_item(docs: dict[tuple[str, str], dict], qualifier: str, method: str) -> dict | None:
    for key in (qualifier, qualifier.split(".")[-1]):
        item = docs.get((key, method))
        if item:
            return item
    return None


def param_type(item: dict | None, name: str) -> tuple[str, str]:
    if not item:
        return "any", ""
    for param in item.get("params", []):
        if not isinstance(param, dict):
            continue
        if param.get("name") != name:
            continue
        raw = str(param.get("type", "")).strip()
        return TYPE_MAP.get(raw, "any"), str(param.get("description", "")).strip()
    return "any", ""


def clean_desc(text: str) -> str:
    return re.sub(r"\s+", " ", str(text)).strip().replace("\n", " ")


def param_names(entry: dict) -> list[str]:
    names = [str(p) for p in entry.get("params") or [] if p != "self"]
    cleaned: list[str] = []
    used: set[str] = set()
    for index, name in enumerate(names):
        if name == "...":
            cleaned.append("...")
            continue
        fixed = re.sub(r"[^A-Za-z0-9_]", "_", name)
        if not fixed or fixed[0].isdigit() or fixed in RESERVED_PARAM_NAMES:
            fixed = f"arg{index + 1}"
        base = fixed
        suffix = 2
        while fixed in used:
            fixed = f"{base}_{suffix}"
            suffix += 1
        used.add(fixed)
        cleaned.append(fixed)
    return cleaned


def is_whitelisted(entry: dict, whitelist_names: set[str] | None = None) -> bool:
    if whitelist_names and entry.get("name") in whitelist_names:
        return True
    return any("WhiteList" in key for key in (entry.get("rtypes") or {}))


def load_whitelist_names() -> set[str]:
    names: set[str] = set()
    for face in ("dev", "official"):
        for entry in load_face(face):
            if entry["kind"] == "function" and is_whitelisted(entry):
                names.add(entry["name"])
    return names


def load_decompiled_cache() -> dict:
    if not DECOMPILED_CACHE.exists():
        return {}
    try:
        return json.loads(DECOMPILED_CACHE.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError):
        return {}


def decompiled_inference(cache: dict, qualifier: str, method: str,
                         env_params: list[str], is_trigger: bool) -> tuple[dict, set, str | None]:
    lane = cache.get("trigger" if is_trigger else "service", {})
    entry = None
    for candidate in (qualifier, *DECOMPILED_ALIASES.get(qualifier, ()), qualifier.split(".")[-1]):
        entry = lane.get(f"{candidate}:{method}")
        if entry:
            break
    if not entry:
        return {}, set(), None

    names = entry.get("names") or []
    source_types = entry.get("params") or {}
    aligned: dict[str, str] = {}
    if len(names) == len(env_params):
        for env_name, source_name in zip(env_params, names):
            value = source_types.get(source_name)
            if value:
                aligned[env_name] = value
    else:
        aligned = {k: v for k, v in source_types.items() if k in env_params}
    return aligned, set(entry.get("optional") or []), entry.get("returns")


def emit_function(lines: list[str], qualifier: str, method: str, entry: dict,
                  docs: dict[tuple[str, str], dict], fallback: str,
                  whitelist_names: set[str] | None = None,
                  decompiled: dict | None = None,
                  is_trigger: bool = False) -> None:
    params = param_names(entry)
    item = wiki_item(docs, qualifier, method)
    desc = clean_desc(item.get("description", "")) if item else ""
    if desc:
        lines.append(f"---{desc}")
    else:
        lines.append(f"---{fallback}")
    if is_whitelisted(entry, whitelist_names):
        lines.append("---**调用限制**: 仅白名单用户可用")
    source_types, source_optional, source_return = decompiled_inference(
        decompiled or {}, qualifier, method, params, is_trigger)
    for name in params:
        if name == "...":
            lines.append("---@vararg any")
            continue
        ptype, pdesc = param_type(item, name)
        if name in source_types:
            ptype = source_types[name]
        marker = "?" if name in source_optional else ""
        suffix = f" {pdesc}" if pdesc else ""
        lines.append(f"---@param {name}{marker} {ptype}{suffix}")
    if source_return:
        lines.append(f"---@return {source_return}")
    signature = ", ".join(params)
    call = f"function {qualifier}:{method}({signature}) end"
    if len(call) <= 120 or not params:
        lines.append(call)
    else:
        lines.append(f"function {qualifier}:{method}(")
        for index, name in enumerate(params):
            suffix = "," if index < len(params) - 1 else ""
            lines.append(f"    {name}{suffix}")
        lines.append(")")
        lines.append("end")
    lines.append("")


def library_classes() -> set[str]:
    classes: set[str] = set()
    for path in sorted(LIBRARY_DIR.glob("*.lua")):
        text = path.read_text(encoding="utf-8", errors="replace")
        classes.update(re.findall(r"^---@class\s+([\w.]+)", text, re.M))
    return classes


def official_entries() -> list[dict]:
    dev = load_face("dev")
    official = load_face("official")
    dev_names = {entry["name"] for entry in dev}
    added = [
        entry
        for entry in official
        if entry["kind"] == "function"
        and entry["name"] not in dev_names
        and not (entry.get("module") or "").startswith("Trigger")
    ]
    return added


def qualifier_of(name: str) -> str:
    qualifier = name.rpartition(":")[0]
    return qualifier.replace(":", ".")

def method_of(name: str) -> str:
    return name.rpartition(":")[2]


def generate_official(entries: list[dict], docs: dict[tuple[str, str], dict],
                      write: bool, whitelist_names: set[str] | None = None,
                      decompiled: dict | None = None) -> dict:
    grouped: dict[str, list[dict]] = defaultdict(list)
    for entry in entries:
        grouped[qualifier_of(entry["name"])].append(entry)

    classes = library_classes()
    emitted = 0
    if write:
        OFFICIAL_DIR.mkdir(parents=True, exist_ok=True)
        for stale in OFFICIAL_DIR.glob("*.lua"):
            stale.unlink()

    for qualifier in sorted(grouped):
        methods = sorted(grouped[qualifier], key=lambda e: method_of(e["name"]))
        filename = qualifier.replace(".", "_") + ".lua"
        lines = [
            "---@meta",
            "",
            f"---官方环境独有接口（环境表 face=official，1.60.0）· {qualifier}<br>",
            "---这些接口仅存在于官方环境，默认关闭。",
            "---在 Lua.runtime.pluginArgs 中设置 \"officialApi=enable\" 开启。<br>",
            "---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)",
        ]
        if qualifier not in classes:
            lines.append(f"---@class {qualifier}")
            lines.append(f"{qualifier} = {{}}")
        lines.append("")
        for entry in methods:
            emit_function(
                lines,
                qualifier,
                method_of(entry["name"]),
                entry,
                docs,
                "官方环境独有接口（未收录于开发环境）",
                whitelist_names,
                decompiled,
                False,
            )
        emitted += len(methods)
        if write:
            (OFFICIAL_DIR / filename).write_text(render_file(lines), encoding="utf-8")

    return {"expected": len(entries), "emitted": emitted, "files": len(grouped),
            "qualifiers": sorted(grouped)}


def trigger_entries() -> tuple[list[dict], list[dict]]:
    dev = load_face("dev")
    functions = [
        entry
        for entry in dev
        if entry["kind"] == "function" and (entry.get("module") or "").startswith("Trigger")
    ]
    modules = [
        entry
        for entry in dev
        if entry["kind"] == "module" and (entry.get("module") or "") == "Trigger"
    ]
    return functions, modules


def trigger_parts(name: str) -> tuple[str | None, str]:
    parts = name.split(":")
    if len(parts) == 3:
        return parts[1], parts[2]
    return None, parts[-1]


def trigger_submodules(functions: list[dict], modules: list[dict]) -> list[str]:
    names = set(TRIGGER_MODULES)
    for entry in modules:
        tail = entry["name"].rpartition(":")[2]
        if tail and tail != "Trigger":
            names.add(tail)
    for entry in functions:
        sub, _ = trigger_parts(entry["name"])
        if sub:
            names.add(sub)
    return sorted(names)


def generate_trigger(functions: list[dict], modules: list[dict], write: bool,
                     whitelist_names: set[str] | None = None,
                     decompiled: dict | None = None) -> dict:
    submodules = trigger_submodules(functions, modules)
    top_level = [e for e in functions if trigger_parts(e["name"])[0] is None]
    by_sub: dict[str, list[dict]] = defaultdict(list)
    for entry in functions:
        sub, method = trigger_parts(entry["name"])
        if sub:
            by_sub[sub].append(entry)

    lines = [
        "---@meta",
        "",
        "---触发器 API（Trigger 命名空间）<br>",
        "---仅在触发器环境中可用，坐标参数使用 pos 向量；全局接口请使用 World / Actor 等模块。",
        "---默认关闭：在 Lua.runtime.pluginArgs 中设置 \"triggerApi=enable\" 开启。<br>",
        "---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)",
        "---@class Trigger",
    ]
    for sub in submodules:
        note = TRIGGER_MODULES.get(sub, "触发器模块")
        lines.append(f"---@field {sub} Trigger.{sub} {note}")
    lines.append("Trigger = {}")
    lines.append("")

    for sub in submodules:
        lines.append(f"---@class Trigger.{sub}")
        lines.append(f"Trigger.{sub} = {{}}")
        lines.append("")
        for entry in sorted(by_sub.get(sub, []), key=lambda e: trigger_parts(e["name"])[1]):
            emit_function(
                lines,
                f"Trigger.{sub}",
                trigger_parts(entry["name"])[1],
                entry,
                {},
                "触发器接口（环境表导出）",
                whitelist_names,
                decompiled,
                True,
            )

    if top_level:
        for entry in sorted(top_level, key=lambda e: trigger_parts(e["name"])[1]):
            emit_function(
                lines,
                "Trigger",
                trigger_parts(entry["name"])[1],
                entry,
                {},
                "触发器接口（环境表导出）",
                whitelist_names,
                decompiled,
                True,
            )

    if write:
        TRIGGER_DIR.mkdir(parents=True, exist_ok=True)
        (TRIGGER_DIR / "Trigger.lua").write_text(render_file(lines), encoding="utf-8")

    return {
        "expected": len(functions),
        "emitted": len(functions),
        "submodules": submodules,
        "top_level": len(top_level),
    }


def render_file(lines: list[str]) -> str:
    while lines and lines[-1] == "":
        lines.pop()
    return "\n".join(lines) + "\n"


def count_functions(directory: Path) -> int:
    if not directory.exists():
        return 0
    total = 0
    for path in directory.rglob("*.lua"):
        text = path.read_text(encoding="utf-8", errors="replace")
        total += len(re.findall(r"^function\s+[\w.]+[:.][\w]+", text, re.M))
    return total


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--verify", action="store_true", help="only count, do not write")
    parser.add_argument("--only", choices=("official", "trigger"), default=None)
    args = parser.parse_args()
    write = not args.verify

    docs = load_wiki_docs()
    whitelist_names = load_whitelist_names()
    decompiled = load_decompiled_cache()

    if args.only in (None, "official"):
        entries = official_entries()
        stats = generate_official(entries, docs, write, whitelist_names, decompiled)
        print("official lane:", json.dumps(stats, ensure_ascii=False))
        if args.verify:
            print(f"  emitted {count_functions(OFFICIAL_DIR)}/{stats['expected']} functions on disk")

    if args.only in (None, "trigger"):
        functions, modules = trigger_entries()
        stats = generate_trigger(functions, modules, write, whitelist_names, decompiled)
        print("trigger lane:", json.dumps(stats, ensure_ascii=False))
        if args.verify:
            print(f"  emitted {count_functions(TRIGGER_DIR)}/{stats['expected']} functions on disk")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
