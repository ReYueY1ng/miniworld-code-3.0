#!/usr/bin/env python3
"""
迷你世界UGC3.0 Wiki API爬虫 v3
爬取 https://dev-wiki.mini1.cn/ugc-wiki/ 中的：
- 组件函数
- 触发器事件
- 组件事件
- 函数库（GameObject, Actor, Player, Monster, Block 等）
- 枚举库
"""

import json
import re
import time
from pathlib import Path

import requests
from bs4 import BeautifulSoup
from bs4.element import NavigableString

BASE_URL = "https://dev-wiki.mini1.cn"

PAGES = {
    "component_api": "/ugc-wiki/introduction/componentapi.html",
    "component_attr": "/ugc-wiki/introduction/componentattr.html",
    "trigger_event": "/ugc-wiki/apis/triggerevent.html",
    "component_event": "/ugc-wiki/apis/componentevent.html",
    "GameObject": "/ugc-wiki/apis/gameobject.html",
    "Actor": "/ugc-wiki/apis/actor.html",
    "Player": "/ugc-wiki/apis/player.html",
    "Monster": "/ugc-wiki/apis/monster.html",
    "Block": "/ugc-wiki/apis/block.html",
    "Backpack": "/ugc-wiki/apis/backpack.html",
    "CustomUI": "/ugc-wiki/apis/customui.html",
    "Graphics": "/ugc-wiki/apis/graphics.html",
    "Area": "/ugc-wiki/apis/area.html",
    "WorldContainer": "/ugc-wiki/apis/worldcontainer.html",
    "Mod": "/ugc-wiki/apis/mod.html",
    "Timer": "/ugc-wiki/apis/timer.html",
    "Buff": "/ugc-wiki/apis/buff.html",
    "Chat": "/ugc-wiki/apis/chat.html",
    "Data": "/ugc-wiki/apis/data.html",
    "Array": "/ugc-wiki/apis/array.html",
    "Table": "/ugc-wiki/apis/table.html",
    "Map": "/ugc-wiki/apis/map.html",
    "World": "/ugc-wiki/apis/world.html",
    "Item": "/ugc-wiki/apis/item.html",
    "GlobalFunc": "/ugc-wiki/introduction/globalfunc.html",
    "Enum": "/ugc-wiki/apis/global.html",
}

HEADERS = {
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    "Accept-Language": "zh-CN,zh;q=0.9,en;q=0.8",
}


def fetch_page(url: str) -> str:
    resp = requests.get(url, headers=HEADERS, timeout=30)
    resp.raise_for_status()
    resp.encoding = "utf-8"
    return resp.text


def get_text(element) -> str:
    if element is None:
        return ""
    return element.get_text(separator=" ", strip=True)


def extract_code(pre_element) -> str:
    if pre_element is None:
        return ""
    texts = []
    for child in pre_element.descendants:
        if isinstance(child, NavigableString):
            texts.append(str(child))
    return "".join(texts).strip()


def clean_name(name: str) -> str:
    return name.replace("编辑", "").replace("\u200b", "").strip()


def parse_api_page(soup: BeautifulSoup, page_type: str) -> dict:
    result = {"title": "", "description": "", "items": []}

    h1 = soup.find("h1")
    if h1:
        result["title"] = clean_name(h1.get_text())

    vp = soup.find("div", id="VPContent")
    if not vp:
        vp = soup.find("div", class_="vp-doc") or soup.body

    if not vp:
        return result

    if page_type in ("component_api", "component_attr", "GlobalFunc"):
        result["items"] = parse_functions(vp)
    elif page_type in ("trigger_event", "component_event"):
        result["items"], extra = parse_events(vp)
        result["extra"] = extra
    elif page_type == "Enum":
        result["items"] = parse_enums(vp)
    else:
        result["items"] = parse_functions(vp)

    return result


def parse_functions(vp) -> list:
    """解析函数页面 - h2标题后跟ul和div(code)
    UL结构：
    - LI 0: "参数及类型： param1 param2 ..." (所有参数在一个li里)
    - LI 1: "返回值及类型： return_info"
    - LI 2: "该方法的说明： description"
    - LI 3: "具体使用案例如下："
    """
    functions = []
    h2s = vp.find_all("h2")

    for h2 in h2s:
        name = clean_name(h2.get_text())
        if not name or name in ("目录", "On this page", "组件函数", "组件属性"):
            continue

        func = {"name": name, "params": [], "returns": "", "description": "", "example": ""}

        # 获取h2后的ul
        ul = h2.find_next_sibling("ul")
        if ul:
            for li in ul.find_all("li", recursive=False):
                text = get_text(li)

                if text.startswith("参数及类型"):
                    param_part = text.replace("参数及类型：", "").replace("参数及类型:", "").strip()
                    if param_part and param_part != "无":
                        # 解析 "name:type desc" 格式的参数
                        pattern = r'(\w+):\s*(number|string|boolean|table|function)\s*(.*?)(?=\w+:|$)'
                        matches = re.findall(pattern, param_part)
                        if matches:
                            func["params"] = [
                                {"name": m[0], "type": m[1], "description": m[2].strip()}
                                for m in matches
                            ]
                        else:
                            func["params"] = [{"raw": param_part}]

                elif text.startswith("返回值及类型"):
                    func["returns"] = text.replace("返回值及类型：", "").replace("返回值及类型:", "").strip()

                elif text.startswith("该方法的") and ("说明" in text or "作用" in text):
                    func["description"] = text.split("：", 1)[-1].split(":", 1)[-1].strip()

        # 获取代码示例
        div = h2.find_next_sibling("div")
        if div:
            pre = div.find("pre")
            if pre:
                func["example"] = extract_code(pre)

        functions.append(func)

    return functions


def parse_events(vp) -> tuple:
    """解析事件页面 - 事件详情在h3+ul结构中"""
    events = []

    # 先解析过滤示例，建立事件名到过滤参数的映射
    filter_map = {}
    h2s = vp.find_all("h2")
    for h2 in h2s:
        text = clean_name(h2.get_text())
        if "事件参数" in text and "过滤" in text:
            div = h2.find_next_sibling("div")
            if div:
                code = extract_code(div.find("pre")) if div.find("pre") else get_text(div)
                # AddTriggerEvent(Event, func, filter1, filter2, ...) 或 AddEvent(Event, func, priority, filter1, ...)
                for m in re.finditer(r'AddTriggerEvent\((\w+\.\w+),\s*\w+((?:,\s*\w+(?:\.\w+)?)*)', code):
                    filters = [f.strip() for f in m.group(2).split(',') if f.strip()]
                    filter_map[m.group(1)] = filters if len(filters) > 1 else filters[0] if filters else None
                for m in re.finditer(r'AddEvent\((\w+\.\w+),\s*\w+,\s*\w+((?:,\s*\w+(?:\.\w+)?)*)', code):
                    filters = [f.strip() for f in m.group(2).split(',') if f.strip()]
                    filter_map[m.group(1)] = filters if len(filters) > 1 else filters[0] if filters else None
            break

    h3s = vp.find_all("h3")
    for h3 in h3s:
        name = clean_name(h3.get_text())
        if not name:
            continue

        # 提取正式事件名
        formal_name = name
        if name.startswith("triggerevent-") or name.startswith("objectevent-"):
            formal = name.replace("triggerevent-", "TriggerEvent.").replace("objectevent-", "ObjectEvent.")
            parts = formal.split(".")
            if len(parts) == 2:
                formal = parts[0] + "." + parts[1].capitalize()
            formal_name = formal

        event = {"name": formal_name, "description": "", "params": []}

        # 获取h3后的ul
        ul = h3.find_next_sibling("ul")
        if ul:
            full_text = get_text(ul)

            # 提取事件描述
            m = re.search(r"事件描述[：:]\s*(.+?)事件名", full_text)
            if m:
                event["description"] = m.group(1).strip()

            # 提取事件名
            m = re.search(r"事件名[：:]\s*\*?\*?(TriggerEvent\.\w+|ObjectEvent\.\w+)", full_text)
            if m:
                event["name"] = m.group(1).strip()

            # 提取参数表格
            table = ul.find("table")
            if table:
                rows = table.find_all("tr")
                for row in rows[1:]:
                    cols = row.find_all("td")
                    if len(cols) >= 2:
                        pname = get_text(cols[0])
                        pdesc = get_text(cols[1])
                        if pname and pname not in ("参数名", "说明"):
                            event["params"].append({"name": pname, "description": pdesc})

        # 添加过滤参数信息
        if event["name"] in filter_map:
            event["filter"] = filter_map[event["name"]]

        events.append(event)

    return events, {}


def parse_enums(vp) -> list:
    """解析枚举页面 - h2标题后跟table"""
    enums = []
    h2s = vp.find_all("h2")

    for h2 in h2s:
        name = clean_name(h2.get_text())
        if not name or name in ("目录", "On this page", "lua_type", "内置枚举库"):
            continue

        enum = {"name": name, "values": []}

        table = h2.find_next_sibling("table")
        if table:
            rows = table.find_all("tr")
            for row in rows[1:]:
                cols = row.find_all("td")
                if len(cols) >= 2:
                    vname = get_text(cols[0])
                    vdesc = get_text(cols[1])
                    if vname and vname not in ("名称", "数据名称", "用法描述"):
                        enum["values"].append({"name": vname, "description": vdesc})

        enums.append(enum)

    return enums


def crawl_all():
    output_dir = Path("../tmp/wiki_data")
    output_dir.mkdir(exist_ok=True)

    all_data = {}

    for key, path in PAGES.items():
        url = BASE_URL + path
        print(f"[*] 爬取: {key}")

        try:
            html = fetch_page(url)
            soup = BeautifulSoup(html, "html.parser")
            data = parse_api_page(soup, key)
            all_data[key] = data

            filepath = output_dir / f"{key}.json"
            with open(filepath, "w", encoding="utf-8") as f:
                json.dump(data, f, ensure_ascii=False, indent=2)

            count = len(data.get("items", []))
            print(f"    [OK] {count} 条")
            time.sleep(0.3)

        except Exception as e:
            print(f"    [ERROR] {e}")
            all_data[key] = {"error": str(e)}

    summary_path = output_dir / "all_api.json"
    with open(summary_path, "w", encoding="utf-8") as f:
        json.dump(all_data, f, ensure_ascii=False, indent=2)

    print(f"\n[完成] 数据已保存到 {output_dir}/")
    print("\n[统计]")
    total = 0
    for key, data in all_data.items():
        if isinstance(data, dict) and "items" in data:
            count = len(data["items"])
            total += count
            print(f"  {key}: {count} 条")
    print(f"  ---")
    print(f"  总计: {total} 条")


if __name__ == "__main__":
    crawl_all()
