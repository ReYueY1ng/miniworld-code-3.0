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


def fetch_page(page, cache_dir, offline):
    cache_path = cache_dir / page.replace("/", "_")
    if cache_path.is_file() and cache_path.stat().st_size > 0:
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
    resolved = type_name
    if type_name in ("", "未声明"):
        resolved = "any"
        note = "（wiki 未声明类型，此处用 any）"
    elif type_name not in known:
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


def build_method(component, method_name, description, params, returns, note, known):
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
        for param in params:
            optional = is_optional_param(param["desc"])
            resolved, type_note = resolve_type(param["type"], known)
            if type_note and type_note not in warnings:
                warnings.append(type_note)
            marker = "?" if optional else ""
            desc = param["desc"] + type_note
            desc = desc.strip()
            lines.append(f"---@param {param['name']}{marker} {resolved}{(' ' + desc) if desc else ''}")
            signature_names.append(param["name"])
        signature = ", ".join(signature_names)

    if returns:
        for item in returns:
            resolved, type_note = resolve_type(item["type"], known)
            if type_note and type_note not in warnings:
                warnings.append(type_note)
            desc = (item["desc"] + type_note).strip()
            lines.append(f"---@return {resolved}{(' ' + desc) if desc else ''}")
    lines.append(f"function {component}:{method_name}({signature}) end")
    return lines, warnings


def build_component_file(component, page, page_html, known):
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
    by_name = {}
    order = []
    for name, core in sections:
        by_name[name] = core
        order.append(name)
    descriptions = dict(summary)
    if summary:
        order = [name for name, _ in summary if name in by_name] + [n for n in order if n not in descriptions]
    methods = []
    warnings = []
    for name in order:
        core = by_name.get(name)
        if core is None:
            raise SystemExit(f"{page}: summary lists {name} but no section found")
        params, returns, note = parse_method_body(core)
        description = descriptions.get(name, "")
        if not description or description == name:
            desc_source = note if note and not note.startswith("返回值类型未在 wiki 声明") else ""
            description = first_clause(desc_source) or f"{name}（wiki 未提供函数描述）"
        lines, method_warnings = build_method(component, name, description, params, returns, note, known)
        warnings.extend(f"{component}:{name}: {w}" for w in method_warnings)
        methods.append(
            {
                "name": name,
                "params": params,
                "returns": returns,
                "lines": lines,
            }
        )
    header = [
        "---@meta",
        "",
        f"---{title}（内置组件 {component}）<br>[查看文档]({BASE_URL}{page})",
        f"---@class {component}: Component",
        f"{component} = {{}}",
        "",
    ]
    body = []
    for method in methods:
        body.extend(method["lines"])
        body.append("")
    content = "\n".join(header + body)
    if not content.endswith("\n"):
        content += "\n"
    return content, methods, warnings, summary, order


def first_clause(text):
    if not text:
        return ""
    return re.split(r"[；。]", text, maxsplit=1)[0].strip()


def manifest_entry(component, page, rel_file, methods):
    return {
        "component": component,
        "page": BASE_URL + page,
        "file": rel_file,
        "method_count": len(methods),
        "methods": [
            {
                "name": method["name"],
                "params": [f"{p['name']}: {p['type']}" for p in method["params"]],
                "returns": [f"{r['name']}: {r['type']}" for r in method["returns"]],
            }
            for method in methods
        ],
    }


def render_manifest(entries):
    payload = {
        "generator": "tools/gen_builtin_components.py",
        "source": BASE_URL + "hashmap.json",
        "components": entries,
    }
    return json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=False) + "\n"


def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def build_all(cache_dir, offline):
    known = load_known_types()
    results = []
    for component, page in PAGES:
        page_html = fetch_page(page, cache_dir, offline)
        content, methods, warnings, summary, order = build_component_file(component, page, page_html, known)
        results.append(
            {
                "component": component,
                "page": page,
                "content": content,
                "methods": methods,
                "warnings": warnings,
                "summary": summary,
                "order": order,
            }
        )
    return results


def render_report(results, output_dir):
    print(f"{'component':26} {'summary':>7} {'parsed':>6} {'file':>5}  status")
    problems = 0
    for result in results:
        component = result["component"]
        summary_names = [name for name, _ in result["summary"]]
        parsed_names = [m["name"] for m in result["methods"]]
        status = "ok"
        if summary_names and summary_names != parsed_names:
            missing = [n for n in summary_names if n not in parsed_names]
            extra = [n for n in parsed_names if n not in summary_names]
            status = f"mismatch missing={missing} extra={extra}"
            problems += 1
        target = output_dir / f"{component}.lua"
        drift = "changed" if not target.is_file() or target.read_text(encoding="utf-8") != result["content"] else "same"
        if drift == "changed":
            problems += 1
        print(
            f"{component:26} {len(summary_names):>7} {len(parsed_names):>6} {drift:>5}  {status}"
        )
        for warning in result["warnings"]:
            print(f"  warning: {warning}")
    total = sum(len(r["methods"]) for r in results)
    print(f"total components={len(results)} methods={total} problems={problems}")
    return problems


def main(argv=None):
    parser = argparse.ArgumentParser(description="Generate Mini World built-in component type definitions.")
    parser.add_argument("--check", action="store_true", help="report method counts and file drift without writing")
    parser.add_argument("--offline", action="store_true", help="use only the local HTML cache")
    parser.add_argument("--cache-dir", default=str(REPO / "tmp" / "wiki-cmpapis-cache"))
    parser.add_argument("--output-dir", default=str(REPO / "library" / "components"))
    parser.add_argument("--manifest", default=str(REPO / ".omo" / "evidence" / "api-lanes" / "components-manifest.json"))
    args = parser.parse_args(argv)

    cache_dir = Path(args.cache_dir)
    output_dir = Path(args.output_dir)
    manifest_path = Path(args.manifest)
    results = build_all(cache_dir, args.offline)

    if args.check:
        problems = render_report(results, output_dir)
        expected_manifest = render_manifest(
            [manifest_entry(r["component"], r["page"], f"library/components/{r['component']}.lua", r["methods"]) for r in results]
        )
        manifest_state = "same"
        if not manifest_path.is_file() or manifest_path.read_text(encoding="utf-8") != expected_manifest:
            manifest_state = "changed"
            problems += 1
        print(f"manifest: {manifest_state}")
        return 1 if problems else 0

    output_dir.mkdir(parents=True, exist_ok=True)
    for result in results:
        (output_dir / f"{result['component']}.lua").write_text(result["content"], encoding="utf-8")
    manifest_path.parent.mkdir(parents=True, exist_ok=True)
    manifest_path.write_text(
        render_manifest(
            [manifest_entry(r["component"], r["page"], f"library/components/{r['component']}.lua", r["methods"]) for r in results]
        ),
        encoding="utf-8",
    )
    for result in results:
        print(f"{result['component']:26} methods={len(result['methods']):>3} sha256={sha256(output_dir / (result['component'] + '.lua'))}")
    print(f"total components={len(results)} methods={sum(len(r['methods']) for r in results)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
