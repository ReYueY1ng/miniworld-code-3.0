import json
import sys
from pathlib import Path

TOOLS = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(TOOLS))

import importlib.util  # noqa: E402

import check_doc_overrides  # noqa: E402
from decompiled_types import name_type_hint  # noqa: E402
from doc_text import purpose  # noqa: E402

_spec = importlib.util.spec_from_file_location("gen_lanes", TOOLS / "gen_env_lanes.py")
assert _spec is not None and _spec.loader is not None
lanes = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(lanes)


def _lane(tmp_path: Path, body: str) -> tuple[Path, Path]:
    lane = tmp_path / "lane"
    lane.mkdir()
    (lane / "Demo.lua").write_text(body, encoding="utf-8")
    overrides = tmp_path / "overrides"
    overrides.mkdir()
    return lane, overrides


def _entry(params=("self", "objid", "itemid", "num")):
    return {"name": "Backpack:AddItem", "kind": "function", "params": list(params)}


def _emit(entry, overrides=None, decompiled=None, docs=None, trigger=False):
    lines: list[str] = []
    lanes.emit_function(
        lines, "Backpack", "AddItem", entry, docs or {}, None, decompiled or {},
        trigger, overrides or {},
    )
    return "\n".join(lines)


def test_override_wins_over_wiki_and_decompiled():
    docs = {("Backpack", "AddItem"): {
        "description": "来自 Wiki 的描述",
        "params": [{"name": "num", "type": "number", "description": "Wiki 数量"}],
        "returns": "num: number Wiki 数量",
    }}
    decompiled = {"service": {"Backpack:AddItem": {
        "names": ["objid", "itemid", "num"],
        "params": {"objid": "number", "num": "number"},
        "returns_list": ["boolean"],
    }}}
    overrides = {("Backpack", "AddItem"): {
        "desc": "向背包添加道具",
        "params": {"num": "要添加的数量"},
        "returns": ["integer count 实际放入的数量"],
    }}
    text = _emit(_entry(), overrides, decompiled, docs)
    assert "---向背包添加道具" in text
    assert "来自 Wiki 的描述" not in text
    assert "---@param num number 要添加的数量" in text
    assert "---@return integer count 实际放入的数量" in text
    assert "---@return boolean" not in text


def test_decompiled_defaults_and_enums_reach_the_doc():
    decompiled = {"service": {"Backpack:AddItem": {
        "names": ["objid", "itemid", "num"],
        "params": {"objid": "number"},
        "optional": ["num"],
        "defaults": {"num": "1"},
        "enums": {"num": {"type": "CmpEnvEnum.BackpackType", "values": ["Inventory"]}},
        "bounds": {"num": "> 0"},
        "returns_list": ["integer", "table"],
    }}}
    text = _emit(_entry(), {}, decompiled)
    assert "---@param num? number 数量，取值见 BackpackType，默认 1，需 > 0" in text
    assert "---@return integer result 结果数值" in text
    assert "---@return table result2 结果表" in text


def test_numeric_value_notes_override_boolean_guess():
    entry = _entry(params=("self", "alive"))
    overrides = {("Backpack", "AddItem"): {
        "desc": "按存活状态取出对象",
        "params": {"alive": "玩家状态（1 存活，0 阵亡，-1 全部）"},
    }}
    text = _emit(entry, overrides)
    assert "---@param alive number 玩家状态" in text


def test_override_silences_evidence_duplication():
    decompiled = {"service": {"Backpack:AddItem": {
        "names": ["objid", "itemid", "num"],
        "params": {},
        "bounds": {"num": "> 0"},
        "returns_list": ["boolean"],
    }}}
    overrides = {("Backpack", "AddItem"): {"desc": "添加道具", "params": {"num": "数量，必须大于 0"}}}
    text = _emit(_entry(), overrides, decompiled)
    assert "数量，必须大于 0" in text
    assert "需 > 0" not in text


def test_name_hints_type_unknown_parameters():
    assert name_type_hint("objid", False) == "integer"
    assert name_type_hint("pos", True) == "Mini.Vec3"
    assert name_type_hint("itemid", False) == "number | string"
    assert name_type_hint("gridtype", False) == "number"
    assert name_type_hint("ignoreList", False) == "table"
    assert name_type_hint("data", True) == "integer | integer[]"
    assert name_type_hint("mystery", False) is None


def test_purpose_reads_nested_connectors_and_typos():
    assert purpose("GetAllObjsInAreaRangByTypes") == "按类型在区域范围中获取全部对象"
    assert purpose("GetShurtItemid") == "获取快捷栏道具ID"
    assert purpose("SetNickName") == "设置昵称"
    assert purpose("AddItemToBackpack") == "将道具添加到背包"
    assert purpose("OnSyncServerTime") == "同步服务器时间时触发"
    assert purpose("CalcSin") == "计算正弦"
    assert purpose("ReplaceBluePrint") == "替换蓝图"


def test_checker_reports_stale_keys_and_bad_returns(tmp_path):
    lane, overrides = _lane(
        tmp_path,
        "---@meta\n\n---@class Demo\nDemo = {}\n\n"
        "---添加道具\n---@param objid integer 对象ID\nfunction Demo:AddItem(objid) end\n",
    )
    (overrides / "demo.json").write_text(json.dumps({
        "Demo:AddItem": {
            "desc": "添加道具",
            "params": {"missing": "不存在的参数"},
            "returns": ["objid 没有类型"],
        },
        "Demo:Gone": {"desc": "已移除的方法"},
    }, ensure_ascii=False), encoding="utf-8")

    stats, problems = check_doc_overrides.run((lane,), overrides)
    assert stats == {"functions": 1, "entries": 1, "covered": 1}
    assert any("Gone is not in the generated lanes" in p for p in problems)
    assert any("unknown param 'missing'" in p for p in problems)
    assert any("return expected" in p for p in problems)


def test_checker_accepts_the_real_overrides():
    stats, problems = check_doc_overrides.run()
    assert problems == []
    assert stats["covered"] == stats["entries"]
