#!/usr/bin/env python3
"""
Extract ALL events from TriggerEvent and ObjectEvent wiki pages,
compare with current library/Events.lua, produce diff report.
"""

import re
import os
from collections import OrderedDict

# --- File paths ---
TRIGGER_WIKI = (
    "/home/yuey1ng/.local/share/opencode/tool-output/tool_e555e2237001unNMrsCsfrwulc"
)
OBJECT_WIKI = (
    "/home/yuey1ng/.local/share/opencode/tool-output/tool_e555e25ae001x6QzMBx9s4dU2n"
)
EVENTS_LUA = os.path.join(os.path.dirname(__file__), "..", "library", "Events.lua")
REPORT_FILE = os.path.join(os.path.dirname(__file__), "event_diff_report.txt")


def read_file(path):
    with open(path, "r", encoding="utf-8") as f:
        return f.read()


# ============================================================
# WIKI PARSING
# ============================================================


def parse_wiki_events(text, prefix):
    """
    Parse wiki markdown to extract events.
    prefix: "TriggerEvent" or "ObjectEvent"

    Returns dict: {event_full_name: {desc, params, filters}}
    - params: list of param names (strings)
    - filters: list of filter descriptions
    """
    events = OrderedDict()

    # Split into event detail sections by "### " headers
    # Each event section starts with "### <description>" and contains:
    #   - 事件名： **TriggerEvent.XXX**
    #   - 事件传参： (followed by table or "无")
    sections = re.split(r"\n### ", text)

    for section in sections:
        # Look for event name
        name_match = re.search(
            r"事件名[：:]\s*\*\*" + re.escape(prefix) + r"\.([^*]+)\*\*", section
        )
        if not name_match:
            continue

        event_short = name_match.group(1).strip()
        event_full = f"{prefix}.{event_short}"

        # Extract description (the header before this section's event name)
        desc_match = re.search(r"^(.+?)[\n]", section)
        desc = desc_match.group(1).strip().rstrip("​[]()#") if desc_match else ""
        # Clean up description
        desc = re.sub(r"\[.*?\]", "", desc).strip()
        desc = re.sub(r"[​]", "", desc).strip()

        # Extract parameters
        params = []
        # Look for param table after "事件传参："
        param_section_match = re.search(
            r"事件传参[：:]\s*(.*?)(?=\n###|\n##|\Z)", section, re.DOTALL
        )
        if param_section_match:
            param_text = param_section_match.group(1)
            if "无" in param_text and len(param_text.strip()) < 20:
                params = []
            else:
                # Find all parameter names in the table
                # Tables have format: "参数名" header then alternating param/description rows
                # Params are typically short identifiers like eventobjid, x,y,z, etc.
                # Look for lines that are param names (not "参数名", not "说明", not empty)
                lines = [l.strip() for l in param_text.split("\n") if l.strip()]
                for line in lines:
                    line = line.strip("-").strip()
                    # Skip headers and descriptions
                    if line in ("参数名", "说明", "", "事件名", "事件名描述"):
                        continue
                    # Skip if it's a description (contains Chinese or long text)
                    if re.match(r"^[\u4e00-\u9fff]", line) and len(line) > 5:
                        continue
                    if (
                        "触发事件的对象" in line
                        or "事件中的" in line
                        or "事件中的星球" in line
                    ):
                        continue
                    if "按键" in line and len(line) <= 5:
                        continue
                    if "装备栏" in line and len(line) <= 5:
                        continue
                    # Check if it looks like a param name
                    if re.match(r"^[a-zA-Z][a-zA-Z0-9_,]*$", line):
                        if line not in params:
                            params.append(line)
                    elif line == "```\n  |   事件中的开关\n```":
                        continue
                    elif line.startswith("```") and "事件中" in line:
                        continue

        # Fix: also handle the code block params that have empty name
        # These look like: "```  |   事件中的开关 ```" - skip them
        params = [p for p in params if p and not p.startswith("```")]

        events[event_full] = {"desc": desc, "params": params, "filters": []}

    # Extract filter parameters from the filter section
    # Pattern: self:AddTriggerEvent(TriggerEvent.XXX, eventfunc, ...) or self:AddEvent(ObjectEvent.XXX, eventfunc, ...)
    filter_section_match = re.search(
        r"事件参数添加参数过滤.*?(?=\n## 游戏|\n## 玩家|\n简单示例|\Z)", text, re.DOTALL
    )
    if filter_section_match:
        filter_text = filter_section_match.group(0)
        for m in re.finditer(
            r"self:(?:AddTriggerEvent|AddEvent)\(\s*"
            + re.escape(prefix)
            + r"\.(\w+)\s*,\s*eventfunc\s*(?:,\s*([^)]+))?\)",
            filter_text,
        ):
            event_short = m.group(1)
            filter_info = m.group(2).strip() if m.group(2) else ""
            event_full = f"{prefix}.{event_short}"
            if event_full in events:
                events[event_full]["filters"].append(filter_info)

    return events


# ============================================================
# LUA PARSING
# ============================================================


def parse_lua_events(text, enum_name):
    """
    Parse Events.lua to extract events from a specific enum.
    enum_name: "TriggerEvent" or "ObjectEvent"

    Returns dict: {event_full_name: {lua_name, value, params, filters}}
    """
    events = OrderedDict()

    # Find the enum block
    enum_start = text.find(f"---@enum {enum_name}")
    if enum_start == -1:
        return events

    # Find the opening brace
    brace_start = text.find("{", enum_start)
    if brace_start == -1:
        return events

    # Find matching closing brace
    depth = 0
    brace_end = -1
    for i in range(brace_start, len(text)):
        if text[i] == "{":
            depth += 1
        elif text[i] == "}":
            depth -= 1
            if depth == 0:
                brace_end = i
                break

    if brace_end == -1:
        return events

    enum_text = text[brace_start + 1 : brace_end]

    # Split into lines for manual parsing
    lines = enum_text.split("\n")

    current_comments = []
    i = 0
    while i < len(lines):
        line = lines[i].strip()

        # Collect comment lines
        if line.startswith("---"):
            current_comments.append(line)
            i += 1
            continue

        # Check for entry: LuaName = "Value" or LuaName = number
        entry_match = re.match(r'(\w+)\s*=\s*(?:"([^"]+)"|(\d+))\s*,?\s*$', line)
        if entry_match:
            lua_name = entry_match.group(1)
            value_str = (
                entry_match.group(2)
                if entry_match.group(2) is not None
                else str(entry_match.group(3))
            )
            full_name = f"{enum_name}.{lua_name}"

            # Parse params from collected comments
            comments_text = "\n".join(current_comments)
            params = []
            filters = []

            # Extract filter params (between 过滤参数 and 传参)
            if "过滤参数" in comments_text:
                filter_parts = comments_text.split("过滤参数")
                if len(filter_parts) > 1:
                    filter_section = (
                        filter_parts[1].split("传参")[0]
                        if "传参" in filter_parts[1]
                        else filter_parts[1]
                    )
                    filter_params = re.findall(
                        r"---```(\w+)```\s*—\s*([^\n<]+)", filter_section
                    )
                    for fname, fdesc in filter_params:
                        filters.append(f"{fname} — {fdesc.strip()}")

            # Extract event params (after 传参 marker)
            if "传参" in comments_text:
                param_parts = re.split(r"传参", comments_text)
                if len(param_parts) > 1:
                    param_section = param_parts[-1]
                    param_matches = re.findall(
                        r"---```([a-zA-Z][a-zA-Z0-9_,]*)```\s*—", param_section
                    )
                    params = list(param_matches)

                    # Check for "参数未知" or "无参数"
                    if "参数未知" in param_section:
                        params = ["参数未知"]
                    elif "无参数" in param_section:
                        params = []

            events[full_name] = {
                "lua_name": lua_name,
                "value": value_str,
                "params": params,
                "filters": filters,
                "full_name": full_name,
            }

            current_comments = []
            i += 1
            continue

        # Skip other lines (empty lines, region markers, etc.)
        current_comments = []
        i += 1

    return events


# ============================================================
# COMPARISON
# ============================================================


def compare_events(wiki_events, lua_events, prefix):
    """
    Compare wiki events with lua events.
    Returns structured comparison results.

    wiki_events: dict keyed by "TriggerEvent.XXX"
    lua_events: dict keyed by "TriggerEvent.LuaName" (full_name)
    """
    results = {
        "missing_from_lua": [],  # In wiki but not in Lua
        "extra_in_lua": [],  # In Lua but not in wiki
        "param_diffs": [],  # Events in both but params differ
        "filter_events": [],  # Events with filter params in wiki
    }

    # Build a set of matched lua keys
    matched_lua_keys = set()

    # Check wiki events against lua
    for wiki_name, wiki_info in wiki_events.items():
        # Strategy 1: wiki name exactly matches lua full_name
        lua_match = lua_events.get(wiki_name)

        if not lua_match:
            # Strategy 2: wiki name "TriggerEvent.XXX" where XXX matches a lua_name
            # This handles cases like wiki "TriggerEvent.MobAreaIn" matching lua "TriggerEvent.MobAreaIn"
            # already covered by strategy 1 since full_name is the key

            # Strategy 3: wiki event value might match lua value
            # We need to check if wiki event's value matches any lua event's value
            # But wiki doesn't store the raw value explicitly in our parsed data
            # So we match by wiki_short against lua_name
            wiki_short = wiki_name.replace(f"{prefix}.", "")
            candidate_key = f"{prefix}.{wiki_short}"
            lua_match = lua_events.get(candidate_key)

        if lua_match:
            matched_lua_keys.add(lua_match["full_name"])

            # Compare params
            wiki_params = set(wiki_info["params"])
            lua_params = set(lua_match["params"])

            # Filter out "参数未知" from comparison
            wiki_params.discard("参数未知")
            lua_params.discard("参数未知")

            if wiki_params != lua_params:
                results["param_diffs"].append(
                    {
                        "name": wiki_name,
                        "lua_name": lua_match["full_name"],
                        "wiki_params": sorted(wiki_info["params"]),
                        "lua_params": sorted(lua_match["params"]),
                        "missing_in_lua": sorted(wiki_params - lua_params),
                        "extra_in_lua": sorted(lua_params - wiki_params),
                    }
                )

            # Track filter events
            if wiki_info["filters"]:
                results["filter_events"].append(
                    {
                        "name": wiki_name,
                        "filters": wiki_info["filters"],
                    }
                )
        else:
            results["missing_from_lua"].append(
                {
                    "name": wiki_name,
                    "desc": wiki_info["desc"],
                    "params": wiki_info["params"],
                    "filters": wiki_info["filters"],
                }
            )

    # Find lua events not in wiki
    for full_name, info in lua_events.items():
        if full_name not in matched_lua_keys:
            results["extra_in_lua"].append(
                {
                    "lua_name": full_name,
                    "value": info["value"],
                    "params": info["params"],
                }
            )

    return results


# ============================================================
# REPORT GENERATION
# ============================================================


def generate_report(
    trigger_results,
    object_results,
    trigger_wiki_events,
    object_wiki_events,
    trigger_lua_count,
    object_lua_count,
):
    """Generate the diff report."""
    lines = []
    lines.append("=" * 70)
    lines.append("EVENT DIFF REPORT: Wiki vs Events.lua")
    lines.append("=" * 70)
    lines.append("")

    # --- TRIGGEREVENT ---
    lines.append("=" * 70)
    lines.append("=== TRIGGEREVENT ===")
    lines.append("=" * 70)
    lines.append("")

    r = trigger_results

    lines.append(f"Total wiki events: {len(trigger_wiki_events)}")
    lines.append(f"Total lua events: {trigger_lua_count}")
    lines.append(
        f"Missing from Lua (in wiki but not in Events.lua): {len(r['missing_from_lua'])}"
    )
    lines.append(f"Extra in Lua (not in wiki): {len(r['extra_in_lua'])}")
    lines.append(f"Parameter differences: {len(r['param_diffs'])}")
    lines.append(f"Events with filter parameters: {len(r['filter_events'])}")
    lines.append("")

    lines.append("-" * 70)
    lines.append("MISSING FROM LUA (in wiki but not in Events.lua):")
    lines.append("-" * 70)
    if r["missing_from_lua"]:
        for item in r["missing_from_lua"]:
            params_str = ", ".join(item["params"]) if item["params"] else "(无参数)"
            lines.append(f"  - {item['name']} — {item['desc']}")
            lines.append(f"    params: {params_str}")
            if item["filters"]:
                for f in item["filters"]:
                    lines.append(f"    filter: {f}")
    else:
        lines.append("  (none)")
    lines.append("")

    lines.append("-" * 70)
    lines.append("EXTRA IN LUA (not in wiki, likely from environment table):")
    lines.append("-" * 70)
    if r["extra_in_lua"]:
        for item in r["extra_in_lua"]:
            params_str = ", ".join(item["params"]) if item["params"] else "(无参数)"
            lines.append(f'  - {item["lua_name"]} = "{item["value"]}"')
            lines.append(f"    params: {params_str}")
    else:
        lines.append("  (none)")
    lines.append("")

    lines.append("-" * 70)
    lines.append("PARAMETER DIFFERENCES (events in both, but params differ):")
    lines.append("-" * 70)
    if r["param_diffs"]:
        for item in r["param_diffs"]:
            lines.append(f"  - {item['name']} ({item['lua_name']}):")
            lines.append(f"    Wiki params: {', '.join(item['wiki_params'])}")
            lines.append(f"    Lua params:  {', '.join(item['lua_params'])}")
            if item["missing_in_lua"]:
                lines.append(
                    f"    >>> Missing in Lua: {', '.join(item['missing_in_lua'])}"
                )
            if item["extra_in_lua"]:
                lines.append(
                    f"    <<< Extra in Lua:   {', '.join(item['extra_in_lua'])}"
                )
    else:
        lines.append("  (none)")
    lines.append("")

    lines.append("-" * 70)
    lines.append("FILTER PARAMETER EVENTS (events that support filtering):")
    lines.append("-" * 70)
    if r["filter_events"]:
        for item in r["filter_events"]:
            for f in item["filters"]:
                lines.append(f"  - {item['name']} — filter: {f}")
    else:
        lines.append("  (none)")
    lines.append("")

    # --- OBJECTEVENT ---
    lines.append("=" * 70)
    lines.append("=== OBJECTEVENT ===")
    lines.append("=" * 70)
    lines.append("")

    r = object_results

    lines.append(f"Total wiki events: {len(object_wiki_events)}")
    lines.append(f"Total lua events: {object_lua_count}")
    lines.append(
        f"Missing from Lua (in wiki but not in Events.lua): {len(r['missing_from_lua'])}"
    )
    lines.append(f"Extra in Lua (not in wiki): {len(r['extra_in_lua'])}")
    lines.append(f"Parameter differences: {len(r['param_diffs'])}")
    lines.append(f"Events with filter parameters: {len(r['filter_events'])}")
    lines.append("")

    lines.append("-" * 70)
    lines.append("MISSING FROM LUA (in wiki but not in Events.lua):")
    lines.append("-" * 70)
    if r["missing_from_lua"]:
        for item in r["missing_from_lua"]:
            params_str = ", ".join(item["params"]) if item["params"] else "(无参数)"
            lines.append(f"  - {item['name']} — {item['desc']}")
            lines.append(f"    params: {params_str}")
            if item["filters"]:
                for f in item["filters"]:
                    lines.append(f"    filter: {f}")
    else:
        lines.append("  (none)")
    lines.append("")

    lines.append("-" * 70)
    lines.append("EXTRA IN LUA (not in wiki, likely from environment table):")
    lines.append("-" * 70)
    if r["extra_in_lua"]:
        for item in r["extra_in_lua"]:
            params_str = ", ".join(item["params"]) if item["params"] else "(无参数)"
            lines.append(f'  - {item["lua_name"]} = "{item["value"]}"')
            lines.append(f"    params: {params_str}")
    else:
        lines.append("  (none)")
    lines.append("")

    lines.append("-" * 70)
    lines.append("PARAMETER DIFFERENCES (events in both, but params differ):")
    lines.append("-" * 70)
    if r["param_diffs"]:
        for item in r["param_diffs"]:
            lines.append(f"  - {item['name']} ({item['lua_name']}):")
            lines.append(f"    Wiki params: {', '.join(item['wiki_params'])}")
            lines.append(f"    Lua params:  {', '.join(item['lua_params'])}")
            if item["missing_in_lua"]:
                lines.append(
                    f"    >>> Missing in Lua: {', '.join(item['missing_in_lua'])}"
                )
            if item["extra_in_lua"]:
                lines.append(
                    f"    <<< Extra in Lua:   {', '.join(item['extra_in_lua'])}"
                )
    else:
        lines.append("  (none)")
    lines.append("")

    lines.append("-" * 70)
    lines.append("FILTER PARAMETER EVENTS (events that support filtering):")
    lines.append("-" * 70)
    if r["filter_events"]:
        for item in r["filter_events"]:
            for f in item["filters"]:
                lines.append(f"  - {item['name']} — filter: {f}")
    else:
        lines.append("  (none)")
    lines.append("")

    lines.append("=" * 70)
    lines.append("END OF REPORT")
    lines.append("=" * 70)

    return "\n".join(lines)


# ============================================================
# MAIN
# ============================================================


def main():
    print("Reading wiki files...")
    trigger_wiki_text = read_file(TRIGGER_WIKI)
    object_wiki_text = read_file(OBJECT_WIKI)
    events_lua_text = read_file(EVENTS_LUA)

    print("Parsing TriggerEvent wiki...")
    trigger_wiki_events = parse_wiki_events(trigger_wiki_text, "TriggerEvent")
    print(f"  Found {len(trigger_wiki_events)} TriggerEvent entries in wiki")

    print("Parsing ObjectEvent wiki...")
    object_wiki_events = parse_wiki_events(object_wiki_text, "ObjectEvent")
    print(f"  Found {len(object_wiki_events)} ObjectEvent entries in wiki")

    print("Parsing Events.lua TriggerEvent enum...")
    trigger_lua_events = parse_lua_events(events_lua_text, "TriggerEvent")
    print(f"  Found {len(trigger_lua_events)} TriggerEvent entries in Lua")

    print("Parsing Events.lua ObjectEvent enum...")
    object_lua_events = parse_lua_events(events_lua_text, "ObjectEvent")
    print(f"  Found {len(object_lua_events)} ObjectEvent entries in Lua")

    print("\nComparing TriggerEvent...")
    trigger_results = compare_events(
        trigger_wiki_events, trigger_lua_events, "TriggerEvent"
    )
    print(f"  Missing from Lua: {len(trigger_results['missing_from_lua'])}")
    print(f"  Extra in Lua: {len(trigger_results['extra_in_lua'])}")
    print(f"  Param diffs: {len(trigger_results['param_diffs'])}")
    print(f"  Filter events: {len(trigger_results['filter_events'])}")

    print("\nComparing ObjectEvent...")
    object_results = compare_events(
        object_wiki_events, object_lua_events, "ObjectEvent"
    )
    print(f"  Missing from Lua: {len(object_results['missing_from_lua'])}")
    print(f"  Extra in Lua: {len(object_results['extra_in_lua'])}")
    print(f"  Param diffs: {len(object_results['param_diffs'])}")
    print(f"  Filter events: {len(object_results['filter_events'])}")

    print("\nGenerating report...")
    report = generate_report(
        trigger_results,
        object_results,
        trigger_wiki_events,
        object_wiki_events,
        len(trigger_lua_events),
        len(object_lua_events),
    )

    with open(REPORT_FILE, "w", encoding="utf-8") as f:
        f.write(report)

    print(f"\nReport saved to: {REPORT_FILE}")
    print(f"Report length: {len(report)} chars, {report.count(chr(10))} lines")

    # Also print summary
    print("\n" + "=" * 50)
    print("SUMMARY")
    print("=" * 50)
    print(
        f"TriggerEvent: {len(trigger_wiki_events)} wiki, {len(trigger_lua_events)} lua"
    )
    print(f"  Missing: {len(trigger_results['missing_from_lua'])}")
    print(f"  Extra:   {len(trigger_results['extra_in_lua'])}")
    print(f"  Diffs:   {len(trigger_results['param_diffs'])}")
    print(f"  Filters: {len(trigger_results['filter_events'])}")
    print(f"ObjectEvent: {len(object_wiki_events)} wiki, {len(object_lua_events)} lua")
    print(f"  Missing: {len(object_results['missing_from_lua'])}")
    print(f"  Extra:   {len(object_results['extra_in_lua'])}")
    print(f"  Diffs:   {len(object_results['param_diffs'])}")
    print(f"  Filters: {len(object_results['filter_events'])}")


if __name__ == "__main__":
    main()
