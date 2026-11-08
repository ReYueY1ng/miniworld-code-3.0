#!/usr/bin/env python3
"""Generate LuaLS type definitions for Mini World UGC 3.0 built-in components.

Fetches the hidden wiki pages under cmpapis/ (listed in HASHMAP_PAGES below),
parses every method section, and writes one ---@meta file per component plus a
manifest. Output is deterministic: the same input HTML always produces
byte-identical files.

Usage:
    python3 tools/gen_builtin_components.py
    python3 tools/gen_builtin_components.py --check
    python3 tools/gen_builtin_components.py --offline
    python3 tools/gen_builtin_components.py --cache-dir tmp/wiki-cmpapis-cache
"""

import argparse
import hashlib
import html
import json
import re
import sys
import time
import urllib.error
import urllib.request
from pathlib import Path

from doc_text import param_desc, purpose, return_info  # noqa: E402

BASE_URL = "https://dev-wiki.mini1.cn/ugc-wiki/"
PAGES = [
    ("Area", "cmpapis/area.html"),
    ("BackpackComponent", "cmpapis/backpackcomponent.html"),
    ("BaseState", "cmpapis/basestate.html"),
    ("Chest", "cmpapis/chest.html"),
    ("CityGen", "cmpapis/citygen.html"),
    ("Effect", "cmpapis/effect.html"),
    ("Model", "cmpapis/model.html"),
    ("Move", "cmpapis/move.html"),
    ("Oxygen", "cmpapis/oxygen.html"),
    ("PlanetBaseEnvSetting", "cmpapis/planetbaseenvsetting.html"),
    ("PlanetEnvironmentSetting", "cmpapis/planetenvironmentsetting.html"),
    ("PlanetRule", "cmpapis/planetrule.html"),
    ("PlanetSoundSetting", "cmpapis/planetsoundsetting.html"),
    ("Ride", "cmpapis/ride.html"),
    ("Sound", "cmpapis/sound.html"),
    ("SummonMobBlock", "cmpapis/summonmobblock.html"),
    ("Tag", "cmpapis/tag.html"),
    ("Transform", "cmpapis/transform.html"),
    ("UIBillboard", "cmpapis/uibillboard.html"),
]
VECTOR_TYPES = {"Mini.Vec3", "Mini.Scale", "Mini.Rotation"}
PRIMITIVE_TYPES = {"any", "boolean", "number", "integer", "string", "table", "nil", "fun", "thread", "userdata"}
TAG_RE = re.compile(r"<[^>]+>")
SPACE_RE = re.compile(r"[ \t\r\f\v]+")

REPO = Path(__file__).resolve().parent.parent


def fetch_page(page, cache_dir, offline, force=False):
    cache_path = cache_dir / page.replace("/", "_")
    if not force and cache_path.is_file() and cache_path.stat().st_size > 0:
        return cache_path.read_text(encoding="utf-8")
    if offline:
        raise SystemExit(f"offline mode: missing cache entry {cache_path}")
    url = BASE_URL + page
    request = urllib.request.Request(url, headers={"User-Agent": "MiniWorldTypeGen/1.0"})
    try:
        with urllib.request.urlopen(request, timeout=60) as response:
            data = response.read().decode("utf-8", "replace")
    except (urllib.error.URLError, urllib.error.HTTPError, TimeoutError) as exc:
        raise SystemExit(f"failed to fetch {url}: {exc}") from exc
    cache_dir.mkdir(parents=True, exist_ok=True)
    cache_path.write_text(data, encoding="utf-8")
    time.sleep(0.2)
    return data


def strip_markup(fragment):
    fragment = re.sub(r"<br\s*/?>", "\n", fragment)
    fragment = re.sub(r"</li>", "\n", fragment)
    fragment = re.sub(r"<li[^>]*>", "\n", fragment)
    fragment = re.sub(r"</p>", "\n", fragment)
    fragment = re.sub(r"</ul>", "\n", fragment)
    fragment = TAG_RE.sub("", fragment)
    fragment = html.unescape(fragment).replace("\u200b", "")
    lines = [SPACE_RE.sub(" ", line).strip() for line in fragment.split("\n")]
    return "\n".join(line for line in lines if line)


def doc_region(page_html):
    start = page_html.find('<div style="position:relative;" class="vp-doc')
    if start < 0:
        start = page_html.find('class="vp-doc')
    end = page_html.find("</main>", start)
    if start < 0 or end < 0:
        raise SystemExit("unexpected page layout: vp-doc body not found")
    return page_html[start:end]


def parse_summary(region):
    table = re.search(r"<table[^>]*>(.*?)</table>", region, re.S)
    if not table:
        return []
    rows = []
    for row in re.findall(r"<tr[^>]*>(.*?)</tr>", table.group(1), re.S):
        cells = [strip_markup(cell) for cell in re.findall(r"<t[hd][^>]*>(.*?)</t[hd]>", row, re.S)]
        if len(cells) >= 3 and cells[0] != "序号":
            name = re.sub(r"\(.*\)$", "", cells[1]).strip()
            rows.append((name, cells[2].strip()))
    return rows


def split_sections(region):
    chunks = [c for c in re.split(r'(?=<h2 id=")', region) if c.startswith("<h2")]
    sections = []
    for chunk in chunks:
        heading = re.search(r"<h2[^>]*>(.*?)</h2>", chunk, re.S)
        if not heading:
            continue
        name = strip_markup(heading.group(1))
        example = chunk.find("具体使用案例如下")
        core = chunk if example < 0 else chunk[:example]
        core = re.sub(r"<h2[^>]*>.*?</h2>", "", core, count=1, flags=re.S)
        sections.append((name, strip_markup(core)))
    return sections


def split_marker(text, marker, terminators):
    index = text.find(marker)
    if index < 0:
        return None
    rest = text[index + len(marker):]
    for terminator in terminators:
        cut = rest.find(terminator)
        if cut >= 0:
            rest = rest[:cut]
    return rest.strip()


def normalize_text(value):
    return SPACE_RE.sub(" ", value.replace("\n", " ")).strip()


def parse_param_items(block):
    if block is None or block in ("", "无"):
        return []
    items = []
    for line in block.split("\n"):
        line = line.strip()
        if not line or line == "无":
            continue
        match = re.match(r"^([A-Za-z_][A-Za-z0-9_]*)\s*:\s*([^\s（]+)\s*(.*)$", line)
        if not match:
            continue
        name = match.group(1)
        items.append({"name": name, "type": match.group(2).strip(), "desc": match.group(3).strip()})
    return items


def parse_return_items(block):
    if block is None:
        return []
    result = []
    for line in block.split("\n"):
        line = line.strip()
        match = re.match(r"^([A-Za-z_][A-Za-z0-9_]*)\s*:\s*([^\s（]+)\s*(.*)$", line)
        if not match or match.group(1) in ("返回说明", "开放方式"):
            continue
        if match.group(2) in ("未声明",):
            continue
        result.append({"name": match.group(1), "type": match.group(2).strip(), "desc": match.group(3).strip()})
    return result


def parse_method_body(core):
    params_block = split_marker(core, "参数及类型：", ["返回值及类型："])
    returns_block = split_marker(core, "返回值及类型：", ["该方法的其他说明："])
    notes_block = split_marker(core, "该方法的其他说明：", [])
    notes = [normalize_text(notes_block or "")]
    if returns_block:
        flat = normalize_text(returns_block)
        if flat.startswith("未声明"):
            notes.append("返回值类型未在 wiki 声明。")
        elif flat.startswith("无"):
            prefix = "无（未配置 returnType）。"
            tail = flat[len(prefix):].strip() if flat.startswith(prefix) else flat[1:].strip()
            if re.search(r"\b(true|false|nil)\b", tail):
                notes.append(tail if tail.startswith("返回说明：") else "返回说明：" + tail)
    note = " ".join(part for part in notes if part).strip()
    return parse_param_items(params_block), parse_return_items(returns_block), note


def load_known_types():
    known = set(PRIMITIVE_TYPES)
    for name in ("Mini.lua", "World.lua"):
        path = REPO / "library" / name
        if not path.is_file():
            continue
        source = path.read_text(encoding="utf-8")
        for match in re.finditer(r"^---@(class|alias)\s+([\w.]+)", source, re.M):
            known.add(match.group(2))
    return known


def resolve_type(type_name, known, *, optional_suffix=False):
    note = ""
    if type_name in COMPONENT_TYPES:
        type_name = COMPONENT_TYPES[type_name]
    resolved = type_name
    if type_name in ("", "未声明"):
        resolved = "any"
        note = "（wiki 未声明类型，此处用 any）"
    elif type_name not in known and " | " not in type_name:
        note = f"（wiki 类型 {type_name} 不在类型库中，此处用 any）"
        resolved = "any"
    if optional_suffix:
        resolved += "?"
    return resolved, note


def is_three_number_vector(params):
    if len(params) != 3:
        return False
    names = [p["name"] for p in params]
    if names != ["x", "y", "z"]:
        return False
    return params[0]["type"] in VECTOR_TYPES and params[1]["type"] in ("未声明", "") and params[2]["type"] in ("未声明", "")


def is_optional_param(description):
    if "必填" in description:
        return False
    return "省略" in description or re.search(r"(?<!无)默认", description) is not None


def build_method(component, method_name, description, params, returns, note, known,
                 fallback_types=None):
    warnings = []
    lines = [f"---{description}" if description else f"---{method_name}"]
    if note:
        lines.append(f"---{note}")
    if is_three_number_vector(params):
        base = params[0]["type"]
        resolved, type_note = resolve_type(base, known)
        if type_note:
            warnings.append(type_note)
        lines.append(f"---@param x {resolved} | number {params[0]['desc']}{type_note}")
        lines.append("---@param y? number 脚本按 x、y、z 三个数值传参时的 y 分量")
        lines.append("---@param z? number 脚本按 x、y、z 三个数值传参时的 z 分量")
        signature = "x, y, z"
    else:
        signature_names = []
        for index, param in enumerate(params):
            optional = is_optional_param(param["desc"])
            declared = param["type"]
            if declared in ("", "未声明") and fallback_types and index < len(fallback_types):
                declared = fallback_types[index] or declared
            resolved, type_note = resolve_type(declared, known)
            if type_note and type_note not in warnings:
                warnings.append(type_note)
            marker = "?" if optional else ""
            desc = param["desc"] + type_note
            desc = desc.strip()
            if not desc:
                desc = param_desc(param["name"])
            lines.append(f"---@param {param['name']}{marker} {resolved}{(' ' + desc) if desc else ''}")
            signature_names.append(param["name"])
        signature = ", ".join(signature_names)

    if returns:
        param_names = [param["name"] for param in params]
        for item in returns:
            resolved, type_note = resolve_type(item["type"], known)
            if type_note and type_note not in warnings:
                warnings.append(type_note)
            desc = (item["desc"] + type_note).strip()
            if not desc:
                _, desc = return_info(resolved, method_name, param_names)
            result_name, _ = return_info(resolved, method_name, param_names)
            lines.append(f"---@return {resolved} {result_name} {desc}")
    lines.append(f"function {component}:{method_name}({signature}) end")
    return lines, warnings


def first_clause(text):
    if not text:
        return ""
    return re.split(r"[；。]", text, maxsplit=1)[0].strip()


# ---------------------------------------------------------------------------
# Decompiled component metadata
#
# The framework tree is the authority for what a component exposes to scripts:
#   ComponentClass("Name")   class id
#   Name.displayName         literal label (localised ids are ignored)
#   Name._cmpTips            component description
#   Name.propertys           script-visible attributes (Get/Set, type, default)
#   Name.openFnArgs          script-callable functions; table entries carry
#                            tips/params/paramsTips/returnType/returnTips,
#                            scalars only declare "exposed, no metadata"
#
# Components are emitted into one directory per engine category.
# ---------------------------------------------------------------------------

COMPONENT_ROOT_CANDIDATES = (
    Path("/run/media/yuey1ng/F25A9F0C5A9ECD2B/mini/dump/decompiled/luascript/ugc/framework/components"),
    Path("/home/yuey1ng/mini/dump/decompiled/luascript/ugc/framework/components"),
    Path("/home/yuey1ng/Downloads/迷你世界AI助手/pkg_output/script/luascript/ugc/framework/components"),
)

CATEGORY_LABELS = {
    "base": "基础组件",
    "actor": "角色组件",
    "block": "方块组件",
    "world": "世界组件",
    "ui": "界面组件",
    "effect": "效果组件",
    "grid": "网格组件",
    "ai": "AI 组件",
    "skill": "技能组件",
    "motions": "运动组件",
    "projectiles": "投掷物组件",
    "pos": "位置组件",
    "player": "玩家组件",
    "area": "区域组件",
    "core": "通用组件",
    "demo": "示例组件",
}

SKIPPED_CATEGORIES = {"demo"}

COMPONENT_TYPES = {
    "Mini.Number": "number",
    "Mini.Bool": "boolean",
    "Mini.String": "string",
    "Mini.Vec2": "Mini.Vec2",
    "Mini.Vec3": "Mini.Vec3",
    "Mini.Scale": "Mini.Scale",
    "Mini.Rotation": "Mini.Rotation",
    "Mini.Color": "number",
    "Mini.Tag": "string",
    "Mini.Picture": "string",
    "Mini.Model": "string",
    "Mini.MobType": "number",
    "Mini.Block": "number | string",
    "Mini.Item": "number | string",
    "Mini.Effect": "number | string",
    "Mini.Buff": "number | string",
    "Mini.Sound": "number | string",
    "Mini.Player": "integer",
    "Mini.Array": "table",
    "Mini.CustomData": "table",
    "Mini.GroupView": "Mini.GroupView",
    "Mini.ModelAction": "Mini.ModelAction",
    "Mini.SkyBox": "Mini.SkyBox",
    "Mini.SkeletonPoint": "Mini.SkeletonPoint",
    "Mini.Material": "Mini.Material",
    "Mini.CustomMsg": "Mini.CustomMsg",
}

PARAM_NAMES = {
    "Mini.Player": "playerid",
    "Mini.Item": "itemid",
    "Mini.Block": "blockid",
    "Mini.Buff": "buffid",
    "Mini.Effect": "effectid",
    "Mini.Sound": "soundid",
    "Mini.Model": "model",
    "Mini.Mob": "mobid",
    "Mini.MobType": "mobtype",
    "Mini.Tag": "tag",
    "Mini.Vec3": "pos",
    "Mini.Scale": "scale",
    "Mini.Rotation": "rot",
    "Mini.Array": "list",
    "Mini.Color": "color",
    "Mini.String": "text",
    "Mini.Bool": "flag",
    "Mini.Number": "num",
}

CLASS_RE = re.compile(r'ComponentClass\(\s*"([^"]+)"\s*\)')
DISPLAY_RE = re.compile(r'(?m)^\w+\.displayName\s*=\s*"((?:[^"\\]|\\.)*)"')
TIPS_RE = re.compile(r'(?m)^\w+\._cmpTips\s*=\s*"((?:[^"\\]|\\.)*)"')


def find_component_root(path=None):
    if path:
        return Path(path)
    for candidate in COMPONENT_ROOT_CANDIDATES:
        if candidate.is_dir():
            return candidate
    return None


def decode_lua_string(raw):
    body = raw.strip().rstrip(",")
    if len(body) >= 2 and body[0] in "\"'" and body[-1] == body[0]:
        body = body[1:-1]
    return (body.replace("\\n", " ")
                .replace('\\"', '"')
                .replace("\\'", "'")
                .replace("\\\\", "\\"))


def lua_block(text, key):
    match = re.search(r"(?m)^\s*(?:[\w.]+\.)?" + re.escape(key) + r"\s*=\s*\{", text)
    if not match:
        return None
    start = text.index("{", match.end() - 1)
    depth = 0
    index = start
    while index < len(text):
        char = text[index]
        if char == "-" and text.startswith("--", index):
            newline = text.find("\n", index)
            index = len(text) if newline < 0 else newline
            continue
        if char in "\"'":
            quote = char
            index += 1
            while index < len(text):
                if text[index] == "\\":
                    index += 2
                    continue
                if text[index] == quote:
                    index += 1
                    break
                index += 1
            continue
        if char == "{":
            depth += 1
        elif char == "}":
            depth -= 1
            if depth == 0:
                return text[start + 1:index]
        index += 1
    return None


def lua_entries(block):
    entries = []
    lines = block.split("\n")
    index = 0
    while index < len(lines):
        match = re.match(r"^\t([A-Za-z_]\w*)\s*=\s*(.*)$", lines[index])
        if not match:
            index += 1
            continue
        name, rest = match.group(1), match.group(2).strip()
        if not rest.startswith("{"):
            entries.append((name, None))
            index += 1
            continue
        depth = rest.count("{") - rest.count("}")
        body = []
        index += 1
        while index < len(lines):
            line = lines[index]
            body.append(line)
            depth += line.count("{") - line.count("}")
            index += 1
            if depth <= 0:
                break
        entries.append((name, "\n".join(body)))
    return entries


def lua_fields(body):
    fields = {}
    lines = body.split("\n")
    index = 0
    while index < len(lines):
        match = re.match(r"^\t\t(\w+)\s*=\s*(.*)$", lines[index])
        if not match:
            index += 1
            continue
        key, rest = match.group(1), match.group(2).strip()
        if rest.startswith("{"):
            depth = rest.count("{") - rest.count("}")
            children = []
            index += 1
            while index < len(lines):
                line = lines[index]
                depth += line.count("{") - line.count("}")
                index += 1
                if depth <= 0:
                    break
                children.append(line.strip().rstrip(","))
            fields[key] = ("table", [child for child in children if child])
            continue
        if rest.startswith(("\"", "'")):
            fields[key] = ("str", decode_lua_string(rest))
        else:
            fields[key] = ("raw", rest.rstrip(","))
        index += 1
    return fields


def raw_value(fields, key):
    kind, value = fields.get(key, ("", ""))
    return value if kind in ("str", "raw") else ""


def resolve_component_type(type_name, item_type="", known=None):
    known = known or set()
    if not type_name:
        return "any", "（引擎未声明类型）"
    if type_name == "Mini.Array":
        if item_type:
            base, _ = resolve_component_type(item_type)
            if base != "any":
                wrapped = f"({base})[]" if " | " in base else f"{base}[]"
                return wrapped, ""
        return "table", ""
    if type_name in COMPONENT_TYPES:
        return COMPONENT_TYPES[type_name], ""
    if type_name in known:
        return type_name, ""
    if type_name.startswith("Mini."):
        return "any", f"（组件类型 {type_name} 未映射，此处用 any）"
    return "number", ""


def param_name_for(type_name, index, used):
    base = PARAM_NAMES.get(type_name) or f"arg{index + 1}"
    name = base
    suffix = 2
    while name in used:
        name = f"{base}{suffix}"
        suffix += 1
    used.add(name)
    return name


def clean_label(value):
    if not value:
        return ""
    if re.match(r"^[A-Za-z_][\w.]*\(.*\)$", value.strip()):
        return ""
    return value.strip()


def parse_component_file(path, root, known=None):
    text = path.read_text(encoding="utf-8", errors="replace").lstrip("\ufeff")
    class_match = CLASS_RE.search(text)
    if not class_match:
        return None
    name = class_match.group(1)
    relative = path.relative_to(root)
    category = relative.parts[0] if len(relative.parts) > 1 else "core"
    if category.endswith(".lua"):
        category = "core"

    display_match = DISPLAY_RE.search(text)
    tips_match = TIPS_RE.search(text)

    properties = []
    props_block = lua_block(text, "propertys")
    if props_block:
        for prop_name, body in lua_entries(props_block):
            if body is None:
                continue
            fields = lua_fields(body)
            type_value = raw_value(fields, "type")
            item_value = raw_value(fields, "itemType")
            resolved, _ = resolve_component_type(type_value, item_value, known)
            label = clean_label(raw_value(fields, "displayName")) or clean_label(raw_value(fields, "tips"))
            properties.append({
                "name": prop_name,
                "type": resolved,
                "desc": label,
                "readonly": raw_value(fields, "Set") == "" and raw_value(fields, "Get") != "",
                "default": raw_value(fields, "default"),
            })

    methods = []
    fn_block = lua_block(text, "openFnArgs")
    if fn_block:
        for fn_name, body in lua_entries(fn_block):
            if body is None:
                methods.append({"name": fn_name, "kind": "scalar", "params": [],
                                "returns": [], "desc": "", "tips": "",
                                "param_tips": [], "return_type": ""})
                continue
            fields = lua_fields(body)
            param_types = fields.get("params", ("table", []))[1]
            param_tips = fields.get("paramsTips", ("table", []))[1]
            return_type = raw_value(fields, "returnType")
            methods.append({
                "name": fn_name,
                "kind": "table",
                "params": [decode_lua_string(item) for item in param_types],
                "param_tips": [decode_lua_string(item) for item in param_tips],
                "return_type": return_type,
                "tips": raw_value(fields, "tips"),
                "return_tips": raw_value(fields, "returnTips"),
                "desc": raw_value(fields, "displayName"),
            })

    return {
        "name": name,
        "category": category,
        "file": str(relative),
        "display": clean_label(decode_lua_string(display_match.group(1))) if display_match else "",
        "tips": clean_label(decode_lua_string(tips_match.group(1))) if tips_match else "",
        "properties": properties,
        "methods": methods,
    }


def collect_components(root, known=None):
    components = {}
    duplicates = []
    for path in sorted(root.rglob("*.lua")):
        meta = parse_component_file(path, root, known)
        if meta is None:
            continue
        if meta["category"] in SKIPPED_CATEGORIES:
            continue
        existing = components.get(meta["name"])
        if existing is not None:
            duplicates.append(f"{meta['name']}: {existing['file']} / {meta['file']}")
            if len(meta["methods"]) + len(meta["properties"]) <= len(existing["methods"]) + len(existing["properties"]):
                continue
        components[meta["name"]] = meta
    if duplicates and not components:
        raise SystemExit("duplicate components: " + ", ".join(duplicates))
    return sorted(components.values(), key=lambda item: (item["category"], item["name"])), duplicates


def wiki_cache_file(cache_dir, component):
    candidates = [
        cache_dir / f"cmpapis_{component.lower()}.html",
        cache_dir / f"cmpapis_{component}.html",
    ]
    for candidate in candidates:
        if candidate.is_file() and candidate.stat().st_size > 0:
            return candidate
    return None


def build_decompiled_method(component, method, used_names, known=None):
    type_name = method.get("return_type", "")
    param_types = method["params"]
    param_tips = method["param_tips"] + [""] * max(0, len(param_types) - len(method["param_tips"]))
    lines = []
    desc = method.get("tips") or method.get("desc") or purpose(method["name"])
    lines.append(f"---{desc}")
    if method["kind"] == "scalar":
        lines.append("---@vararg any")
        lines.append(f"function {component}:{method['name']}(...) end")
        return lines, []
    signature = []
    for index, declared in enumerate(param_types):
        name = param_name_for(declared, index, used_names)
        resolved, note = resolve_component_type(declared, known=known)
        tip = param_tips[index].strip()
        text = f"{tip}{note}".strip() or param_desc(name)
        lines.append(f"---@param {name} {resolved}{(' ' + text) if text else ''}")
        signature.append(name)
    if type_name:
        resolved, note = resolve_component_type(type_name, known=known)
        result_name, fallback = return_info(resolved, method["name"], signature)
        text = (method.get("return_tips") or fallback) + note
        lines.append(f"---@return {resolved} {result_name} {text.strip()}")
    lines.append(f"function {component}:{method['name']}({', '.join(signature)}) end")
    return lines, []


def render_component(meta, component=None, page=None, page_html=None, known=None):
    known = known or set()
    if component is None and meta is not None:
        component = meta["name"]
    methods = []
    warnings = []
    summary = []
    order = []
    title = ""
    wiki_names = set()
    meta_methods = {method["name"]: method for method in meta["methods"]} if meta is not None else {}

    if page_html:
        region = doc_region(page_html)
        heading = re.search(r"<h1[^>]*>(.*?)</h1>", region, re.S)
        heading_code = re.search(r"<h1[^>]*>[^<]*<code>([^<]+)</code>", region)
        if not heading or not heading_code:
            raise SystemExit(f"{page}: component id <code> not found in <h1>")
        wiki_id = heading_code.group(1).strip()
        if wiki_id != component:
            raise SystemExit(f"{page}: expected component {component}, page declares {wiki_id}")
        title = strip_markup(re.sub(r"<code>.*?</code>", "", heading.group(1), flags=re.S)).strip()
        summary = parse_summary(region)
        sections = split_sections(region)
        by_name = {name: core for name, core in sections}
        order = [name for name, _ in sections]
        descriptions = dict(summary)
        if summary:
            order = [name for name, _ in summary if name in by_name] + [n for n in order if n not in descriptions]
        for name in order:
            core = by_name.get(name)
            if core is None:
                raise SystemExit(f"{page}: summary lists {name} but no section found")
            params, returns, note = parse_method_body(core)
            description = descriptions.get(name, "")
            if not description or description == name:
                desc_source = note if note and not note.startswith("返回值类型未在 wiki 声明") else ""
                description = first_clause(desc_source) or purpose(name)
            fallback = None
            candidate = meta_methods.get(name)
            if candidate and len(candidate["params"]) == len(params):
                fallback = candidate["params"]
            lines, method_warnings = build_method(component, name, description, params, returns, note, known,
                                                  fallback_types=fallback)
            warnings.extend(f"{component}:{name}: {w}" for w in method_warnings)
            methods.append({"name": name, "params": params, "returns": returns, "lines": lines})
            wiki_names.add(name)

    if meta is not None:
        decompiled_by_name = {method["name"]: method for method in meta["methods"]}
        for method in meta["methods"]:
            if method["name"] in wiki_names:
                continue
            lines, method_warnings = build_decompiled_method(component, method, set(wiki_names), known)
            warnings.extend(f"{component}:{method['name']}: {w}" for w in method_warnings)
            methods.append({
                "name": method["name"],
                "params": [{"name": "", "type": t, "desc": ""} for t in method["params"]],
                "returns": [{"name": "", "type": method["return_type"], "desc": ""}] if method["return_type"] else [],
                "lines": lines,
            })

    label = CATEGORY_LABELS.get(meta["category"], "组件") if meta else "内置组件"
    if page_html:
        label_suffix = f" · {label}" if meta is not None else ""
        header = [
            "---@meta",
            "",
            f"---{title}（内置组件 {component}{label_suffix}）<br>",
            f"---[查看文档]({BASE_URL}{page})",
        ]
    else:
        heading_text = meta["display"] or component if meta else component
        header = [
            "---@meta",
            "",
            f"---{heading_text}（内置组件 {component} · {label}）<br>",
        ]
        if meta and meta["tips"]:
            header.append(f"---{meta['tips']}")
    header.append(f"---@class {component}: Component")
    if meta is not None:
        for prop in meta["properties"]:
            desc = prop["desc"]
            if not desc:
                phrase = purpose(prop["name"])
                desc = "" if re.search(r"[A-Za-z]", phrase) else phrase
            if prop["readonly"]:
                desc = f"{desc}（只读）" if desc else "只读"
            header.append(f"---@field {prop['name']} {prop['type']} {desc}".rstrip())
    header.append(f"{component} = {{}}")
    header.append("")

    body = []
    for method in methods:
        body.extend(method["lines"])
        body.append("")
    content = "\n".join(header + body)
    if not content.endswith("\n"):
        content += "\n"
    return content, methods, warnings, summary, order


def build_component_file(component, page, page_html, known):
    return render_component(None, component, page, page_html, known)


def component_entry(meta, rel_file, methods, warnings):
    return {
        "component": meta["name"],
        "category": meta["category"],
        "category_label": CATEGORY_LABELS.get(meta["category"], ""),
        "source": meta["file"],
        "file": rel_file,
        "property_count": len(meta["properties"]),
        "method_count": len(methods),
        "warnings": warnings,
        "properties": [f"{prop['name']}: {prop['type']}" for prop in meta["properties"]],
        "methods": [
            {
                "name": method["name"],
                "params": [f"{p['name']}: {p['type']}" for p in method["params"]],
                "returns": [f"{r['name']}: {r['type']}" for r in method["returns"]],
            }
            for method in methods
        ],
    }


def build_all_decompiled(root, cache_dir, known, use_wiki=True):
    components, duplicates = collect_components(root, known)
    results = []
    for meta in components:
        page = None
        page_html = None
        if use_wiki:
            cache_file = wiki_cache_file(cache_dir, meta["name"])
            if cache_file is not None:
                page_html = cache_file.read_text(encoding="utf-8")
                page = "cmpapis/" + meta["name"].lower() + ".html"
        content, methods, warnings, summary, order = render_component(
            meta, page=page, page_html=page_html, known=known)
        rel_file = f"library/components/{meta['category']}/{meta['name']}.lua"
        results.append({
            "component": meta["name"],
            "category": meta["category"],
            "page": page,
            "content": content,
            "methods": methods,
            "warnings": warnings,
            "meta": meta,
            "file": rel_file,
            "summary": summary,
            "order": order,
        })
    return results, duplicates


def render_component_manifest(results):
    entries = [
        component_entry(result["meta"], result["file"], result["methods"], result["warnings"])
        for result in results
    ]
    payload = {
        "generator": "tools/gen_builtin_components.py",
        "source": "decompiled framework components + wiki cmpapis pages",
        "categories": [
            {
                "key": key,
                "label": label,
                "components": sorted(r["component"] for r in results if r["category"] == key),
            }
            for key, label in CATEGORY_LABELS.items()
            if any(r["category"] == key for r in results)
        ],
        "components": entries,
    }
    return json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=False) + "\n"


def report_components(results, output_dir):
    by_category = {}
    for result in results:
        by_category.setdefault(result["category"], []).append(result)
    print(f"{'category':14} {'components':>10} {'properties':>10} {'methods':>8}")
    for key in sorted(by_category, key=lambda k: list(CATEGORY_LABELS).index(k) if k in CATEGORY_LABELS else 99):
        group = by_category[key]
        properties = sum(len(r["meta"]["properties"]) for r in group)
        methods = sum(len(r["methods"]) for r in group)
        print(f"{key:14} {len(group):>10} {properties:>10} {methods:>8}  {CATEGORY_LABELS.get(key, '')}")
    total_props = sum(len(r["meta"]["properties"]) for r in results)
    total_methods = sum(len(r["methods"]) for r in results)
    print(f"total components={len(results)} properties={total_props} methods={total_methods}")

    problems = 0
    for result in results:
        target = output_dir / result["category"] / (result["component"] + ".lua")
        if not target.is_file() or target.read_text(encoding="utf-8") != result["content"]:
            problems += 1
            print(f"  drift: {target.relative_to(output_dir.parent.parent)}")
    for result in results:
        for warning in result["warnings"]:
            print(f"  warning: {warning}")
    return problems


def main(argv=None):
    parser = argparse.ArgumentParser(description="Generate Mini World built-in component type definitions.")
    parser.add_argument("--check", action="store_true", help="report counts and file drift without writing")
    parser.add_argument("--offline", action="store_true", help="ignore the wiki cache, use decompiled metadata only")
    parser.add_argument("--refresh-wiki", action="store_true", help="re-download the cmpapis pages before building")
    parser.add_argument("--decompiled", default=None, help="path to the decompiled components directory")
    parser.add_argument("--cache-dir", default=str(REPO / "tmp" / "wiki-cmpapis-cache"))
    parser.add_argument("--output-dir", default=str(REPO / "library" / "components"))
    parser.add_argument("--manifest", default=str(REPO / ".omo" / "evidence" / "api-lanes" / "components-manifest.json"))
    args = parser.parse_args(argv)

    root = find_component_root(args.decompiled)
    if root is None:
        raise SystemExit("decompiled components directory not found (set --decompiled)")
    cache_dir = Path(args.cache_dir)
    output_dir = Path(args.output_dir)
    manifest_path = Path(args.manifest)

    if args.refresh_wiki:
        cache_dir.mkdir(parents=True, exist_ok=True)
        for _component, page in PAGES:
            try:
                fetch_page(page, cache_dir, False, force=True)
            except SystemExit as error:
                print(f"warning: {error}")

    results, duplicates = build_all_decompiled(root, cache_dir, load_known_types(), not args.offline)
    for duplicate in duplicates:
        print(f"duplicate component id: {duplicate}")
    expected_manifest = render_component_manifest(results)

    if args.check:
        problems = report_components(results, output_dir)
        manifest_state = "same"
        if not manifest_path.is_file() or manifest_path.read_text(encoding="utf-8") != expected_manifest:
            manifest_state = "changed"
            problems += 1
        print(f"manifest: {manifest_state}")
        return 1 if problems else 0

    for stale in output_dir.rglob("*.lua"):
        stale.unlink()
    for result in results:
        target = output_dir / result["category"] / (result["component"] + ".lua")
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(result["content"], encoding="utf-8")
    manifest_path.parent.mkdir(parents=True, exist_ok=True)
    manifest_path.write_text(expected_manifest, encoding="utf-8")
    report_components(results, output_dir)
    return 0


if __name__ == "__main__":
    sys.exit(main())
