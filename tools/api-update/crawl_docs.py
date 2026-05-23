#!/usr/bin/env python3
"""Crawl Mini World UGC 3.0 API documentation and output structured JSON."""

import json
import os
import re
import sys
import urllib.request
import html as html_mod

BASE_URL = "https://dev-wiki.mini1.cn/ugc-wiki"
OUTPUT_PATH = "/home/yuey1ng/mini/luaaddons/miniworld-code-3.0/tmp/docs-apis.json"
OLD_DOCS_PATH = "/home/yuey1ng/Downloads/迷你世界脚本api.txt"

API_MODULES = [
    ("world", "World"),
    ("gameobject", "GameObject"),
    ("actor", "Actor"),
    ("player", "Player"),
    ("monster", "Monster"),
    ("block", "Block"),
    ("item", "Item"),
    ("backpack", "Backpack"),
    ("customui", "CustomUI"),
    ("graphics", "Graphics"),
    ("area", "Area"),
    ("worldcontainer", "WorldContainer"),
    ("mod", "Mod"),
    ("timer", "Timer"),
    ("buff", "Buff"),
    ("chat", "Chat"),
    ("data", "Data"),
    ("array", "Array"),
    ("table", "Table"),
    ("map", "Map"),
]

EVENT_PAGES = [
    ("triggerevent", "TriggerEvent"),
    ("componentevent", "ComponentEvent"),
]


def fetch_url(url, timeout=30):
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
    with urllib.request.urlopen(req, timeout=timeout) as resp:
        return resp.read().decode("utf-8")


def strip_tags(text):
    text = re.sub(r"<[^>]+>", "", text)
    return html_mod.unescape(text).strip()


def extract_main_content(html_text):
    m = re.search(r'<main class="main"[^>]*>(.*)', html_text, re.DOTALL)
    if m:
        return m.group(1)
    return html_text


LUA_TYPES = [
    "number,string",
    "string,number",
    "number,boolean",
    "bool,number",
    "string,boolean",
    "boolean,string",
    "boolean",
    "number",
    "string",
    "bool",
    "table",
    "integer",
    "function",
    "any",
    "nil",
]


def parse_li_text(li_html):
    """Parse a single <li> element into (name, type, desc) for params/returns.
    Formats:
      name:<a...><strong><code>type</code></strong></a>description
      name:type description
      name:<code>type</code> description
      name:typedescription (merged, e.g. x:number位置X坐标)
    """
    text = strip_tags(li_html).strip()

    m = re.match(r"^([\w,\.]+)\s*[:：]\s*(.*)", text)
    if m:
        name = m.group(1).strip()
        rest = m.group(2).strip()
        # Split at ASCII/non-ASCII boundary to separate type from Chinese desc
        bm = re.match(r"^([A-Za-z0-9,]+)(.*)", rest)
        if bm:
            possible_type = bm.group(1)
            remainder = bm.group(2).strip()
            for t in sorted(LUA_TYPES, key=len, reverse=True):
                if possible_type.startswith(t):
                    desc = possible_type[len(t) :].strip() + remainder
                    return name, t, desc.strip()
        # If rest starts with Chinese, no type prefix exists
        if rest and any("\u4e00" <= c <= "\u9fff" for c in rest[0]):
            return name, "", rest
        for t in sorted(LUA_TYPES, key=len, reverse=True):
            if rest.startswith(t):
                desc = rest[len(t) :].strip()
                return name, t, desc
        return name, rest, ""

    return "", "", text


def parse_wiki_api_page(html_text, module_name):
    apis = []
    content = extract_main_content(html_text)

    # Split by h2 sections
    sections = re.split(r'<h2[^>]*id="([^"]*)"[^>]*>', content)

    for idx in range(1, len(sections), 2):
        func_id = sections[idx].lower().strip()
        section_html = sections[idx + 1] if idx + 1 < len(sections) else ""

        if not func_id or func_id in ("on-this-page",):
            continue

        # Extract function name from the section start
        name_match = re.match(r"\s*(.*?)\s*</h2>", section_html, re.DOTALL)
        if not name_match:
            continue
        func_name = strip_tags(name_match.group(1)).strip()
        if not func_name or len(func_name) > 80:
            continue
        # Remove trailing zero-width chars
        func_name = func_name.rstrip(" \u200b\u00a0")

        # Extract params from <ul> after "参数及类型"
        params = []
        param_block = re.search(
            r"参数及类型\s*[:：]\s*<ul>(.*?)</ul>", section_html, re.DOTALL
        )
        if param_block:
            for li in re.finditer(r"<li>(.*?)</li>", param_block.group(1), re.DOTALL):
                name, ptype, desc = parse_li_text(li.group(1))
                if name or ptype:
                    params.append({"name": name, "type": ptype, "desc": desc})

        # Extract returns
        returns = []
        ret_block = re.search(
            r"返回值及类型\s*[:：]\s*<ul>(.*?)</ul>", section_html, re.DOTALL
        )
        if ret_block:
            for li in re.finditer(r"<li>(.*?)</li>", ret_block.group(1), re.DOTALL):
                name, rtype, desc = parse_li_text(li.group(1))
                if name or rtype:
                    returns.append({"name": name, "type": rtype, "desc": desc})

        # Extract description
        desc = ""
        desc_match = re.search(
            r"该方法的其他说明\s*[:：]\s*(.*?)\s*(?:</li>|<ul|<div|<h2|具体使用案例)",
            section_html,
            re.DOTALL,
        )
        if desc_match:
            desc = strip_tags(desc_match.group(1)).strip()
        if not desc:
            desc_match = re.search(
                r"该方法的主要作用\s*[:：]\s*(.*?)\s*(?:</li>|<ul|<div|<h2|具体使用案例)",
                section_html,
                re.DOTALL,
            )
            if desc_match:
                desc = strip_tags(desc_match.group(1)).strip()

        # Extract code example from <pre><code> blocks
        example = ""
        code_blocks = re.findall(
            r"<pre[^>]*><code>(.*?)</code></pre>", section_html, re.DOTALL
        )
        if code_blocks:
            example = strip_tags(code_blocks[0]).strip()

        api_entry = {
            "name": f"{module_name}:{func_name}",
            "description": desc,
            "params": params,
            "returns": returns,
            "source": "docs",
        }
        if example:
            api_entry["example"] = example
        apis.append(api_entry)

    return apis


def parse_wiki_event_page(html_text, event_prefix):
    events = []
    content = extract_main_content(html_text)

    # Find event table rows
    row_pattern = re.compile(r"<tr>(.*?)</tr>", re.DOTALL)
    for row_match in row_pattern.finditer(content):
        row_html = row_match.group(1)
        cells = re.findall(r"<td[^>]*>(.*?)</td>", row_html, re.DOTALL)
        if len(cells) >= 2:
            event_name = strip_tags(cells[1]).strip()
            event_desc = strip_tags(cells[2]).strip() if len(cells) > 2 else ""
            if "TriggerEvent." in event_name or "ObjectEvent." in event_name:
                events.append(
                    {
                        "name": event_name,
                        "description": event_desc,
                        "params": [],
                        "returns": [],
                        "source": "docs",
                    }
                )

    # Find detailed event sections with params
    sections = re.split(r'<h2[^>]*id="([^"]*)"[^>]*>', content)
    for idx in range(1, len(sections), 2):
        section_html = sections[idx + 1] if idx + 1 < len(sections) else ""
        heading_m = re.match(r"\s*(.*?)\s*</h2>", section_html, re.DOTALL)
        heading = strip_tags(heading_m.group(1)).strip() if heading_m else ""

        param_items = []
        param_tbody = re.search(
            r"事件传参\s*[:：].*?<tbody>(.*?)</tbody>", section_html, re.DOTALL
        )
        if param_tbody:
            for prow in re.finditer(r"<tr>(.*?)</tr>", param_tbody.group(1), re.DOTALL):
                pcells = re.findall(r"<td[^>]*>(.*?)</td>", prow.group(1), re.DOTALL)
                if len(pcells) >= 2:
                    pname = strip_tags(pcells[0]).strip()
                    pdesc = strip_tags(pcells[1]).strip()
                    param_items.append({"name": pname, "type": "any", "desc": pdesc})

        if param_items:
            for evt in events:
                evt_func = evt["name"].split(".")[-1]
                if heading == evt_func or heading.endswith(evt_func):
                    evt["params"] = param_items
                    break

    return events


def parse_old_docs(filepath):
    """Parse the old documentation text file."""
    apis = []
    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()

    lines = content.split("\n")
    i = 0
    current_module = ""

    while i < len(lines):
        line = lines[i].strip()

        # Detect module headers like "玩家模块管理接口 Player"
        module_match = re.match(r".+模块管理接口\s+(\w+)", line)
        if module_match:
            current_module = module_match.group(1)
            i += 1
            continue

        # Detect function: standalone PascalCase name followed by param info
        if re.match(r"^[A-Z][A-Za-z0-9]+$", line) and current_module:
            func_name = line
            # Verify next lines look like function metadata
            look_ahead = ""
            for k in range(i + 1, min(i + 5, len(lines))):
                look_ahead += lines[k].strip()
            if (
                "参数及类型" not in look_ahead
                and "返回值及类型" not in look_ahead
                and "该方法" not in look_ahead
            ):
                i += 1
                continue

            desc = ""
            params = []
            returns = []
            example = ""
            j = i + 1

            while j < len(lines) and j < i + 50:
                lline = lines[j].strip()

                # Parameters block
                if lline.startswith("参数及类型"):
                    after_colon = (
                        lline.split("：", 1)[-1].strip() if "：" in lline else ""
                    )
                    if after_colon and after_colon != "无":
                        for part in re.split(r"[,，]", after_colon):
                            part = part.strip()
                            pm = re.match(
                                r"(\w+)\s*[:：]\s*(\w[\w,]*)\s*[:：]\s*(.*)", part
                            )
                            if pm:
                                params.append(
                                    {
                                        "name": pm.group(1),
                                        "type": pm.group(2),
                                        "desc": pm.group(3).strip(),
                                    }
                                )
                    j += 1
                    # Multi-line params
                    while j < len(lines):
                        pl = lines[j].strip()
                        if (
                            not pl
                            or pl.startswith("返回值")
                            or pl.startswith("该方法")
                            or pl.startswith("具体使用")
                        ):
                            break
                        pm = re.match(
                            r"^(\w+)\s*[:：]\s*(number|string|boolean|bool|integer|table|function|any|nil|number,boolean|bool,number|number,string|string,number|number,boolean|string,boolean)\s*(.*)",
                            pl,
                        )
                        if pm:
                            params.append(
                                {
                                    "name": pm.group(1),
                                    "type": pm.group(2),
                                    "desc": pm.group(3).strip(),
                                }
                            )
                        j += 1
                    continue

                # Returns block
                if lline.startswith("返回值及类型"):
                    after_colon = (
                        lline.split("：", 1)[-1].strip() if "：" in lline else ""
                    )
                    if after_colon:
                        rm = re.match(r"(\w+)\s*[:：]\s*(\w[\w,]*)\s*(.*)", after_colon)
                        if rm:
                            returns.append(
                                {
                                    "name": rm.group(1),
                                    "type": rm.group(2),
                                    "desc": rm.group(3).strip(),
                                }
                            )
                    j += 1
                    while j < len(lines):
                        rl = lines[j].strip()
                        if (
                            not rl
                            or rl.startswith("该方法")
                            or rl.startswith("具体使用")
                        ):
                            break
                        rm = re.match(
                            r"^(\w+)\s*[:：]\s*(number|string|boolean|bool|integer|table|function|any|nil|number,boolean|bool,number|number,string|string,number|number,boolean|string,boolean)\s*(.*)",
                            rl,
                        )
                        if rm:
                            returns.append(
                                {
                                    "name": rm.group(1),
                                    "type": rm.group(2),
                                    "desc": rm.group(3).strip(),
                                }
                            )
                        j += 1
                    continue

                # Description
                if lline.startswith("该方法的主要作用"):
                    desc = lline.split("：", 1)[-1].strip()
                    j += 1
                    continue

                # Example code
                if lline.startswith("具体使用案例如下"):
                    j += 1
                    code_lines = []
                    while j < len(lines):
                        el = lines[j]
                        stripped = el.strip()
                        # Stop at next function definition
                        if stripped and re.match(r"^[A-Z][A-Za-z0-9]+$", stripped):
                            # Check if it's a known module or function
                            if stripped in (
                                "Player",
                                "World",
                                "Block",
                                "Actor",
                                "GameObject",
                                "Item",
                                "Monster",
                                "Buff",
                                "Backpack",
                                "CustomUI",
                                "Graphics",
                                "Area",
                                "WorldContainer",
                                "Mod",
                                "Timer",
                                "Chat",
                                "Data",
                                "Array",
                                "Table",
                                "Map",
                                "TriggerEvent",
                                "ComponentEvent",
                                "Events",
                            ):
                                break
                            # Check if next few lines have param info
                            has_params = False
                            for k in range(j + 1, min(j + 4, len(lines))):
                                if (
                                    "参数及类型" in lines[k]
                                    or "返回值及类型" in lines[k]
                                ):
                                    has_params = True
                                    break
                            if has_params:
                                break
                        if stripped:
                            code_lines.append(stripped)
                        j += 1
                    example = "\n".join(code_lines).strip()
                    break

                j += 1

            if func_name:
                api_entry = {
                    "name": f"{current_module}:{func_name}",
                    "description": desc,
                    "params": params,
                    "returns": returns,
                    "source": "old_docs",
                }
                if example:
                    api_entry["example"] = example
                apis.append(api_entry)

            i = j
            continue

        i += 1

    return apis


def main():
    all_apis = {}

    # 1. Crawl wiki API module pages
    print("Crawling wiki API pages...")
    for slug, module_name in API_MODULES:
        url = f"{BASE_URL}/apis/{slug}.html"
        print(f"  Fetching {module_name}...")
        try:
            html_text = fetch_url(url)
            apis = parse_wiki_api_page(html_text, module_name)
            print(f"    Found {len(apis)} APIs")
            for api in apis:
                all_apis[api["name"]] = api
        except Exception as e:
            print(f"    Error: {e}")

    # 2. Crawl wiki event pages
    print("\nCrawling wiki event pages...")
    for slug, prefix in EVENT_PAGES:
        url = f"{BASE_URL}/apis/{slug}.html"
        print(f"  Fetching {prefix} events...")
        try:
            html_text = fetch_url(url)
            events = parse_wiki_event_page(html_text, prefix)
            print(f"    Found {len(events)} events")
            for evt in events:
                all_apis[evt["name"]] = evt
        except Exception as e:
            print(f"    Error: {e}")

    # 3. Parse old documentation and merge (new docs always win)
    print(f"\nParsing old docs...")
    try:
        old_apis = parse_old_docs(OLD_DOCS_PATH)
        print(f"  Found {len(old_apis)} APIs from old docs")
        added = 0
        supplemented = 0
        for api in old_apis:
            if api["name"] not in all_apis:
                all_apis[api["name"]] = api
                added += 1
            else:
                existing = all_apis[api["name"]]
                if existing.get("source") == "docs":
                    supplemented += 1
                    continue
                if not existing.get("description") and api.get("description"):
                    existing["description"] = api["description"]
                if not existing.get("params") and api.get("params"):
                    existing["params"] = api["params"]
                if not existing.get("returns") and api.get("returns"):
                    existing["returns"] = api["returns"]
                if not existing.get("example") and api.get("example"):
                    existing["example"] = api["example"]
        print(f"  Added {added} new, skipped {supplemented} (new docs wins)")
    except Exception as e:
        print(f"  Error: {e}")

    # 4. Output JSON
    result = sorted(all_apis.values(), key=lambda x: x["name"])
    os.makedirs(os.path.dirname(OUTPUT_PATH), exist_ok=True)
    with open(OUTPUT_PATH, "w", encoding="utf-8") as f:
        json.dump(result, f, ensure_ascii=False, indent=2)
    print(f"\nWrote {len(result)} APIs to {OUTPUT_PATH}")


if __name__ == "__main__":
    main()
