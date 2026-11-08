import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO / "tools"))

from doc_text import param_desc, purpose, return_info  # noqa: E402

RETURN_LINE = re.compile(r"^---@return\s+(.+?)\s+(\w+)\s+(\S.*)$")


def test_purpose_rewrites_connectors():
    assert purpose("AddModelPartByGrid") == "按格子添加模型部件"
    assert purpose("CreateGunInBackpack") == "在背包中创建枪械"
    assert purpose("CalcHorizontalAngle") == "计算水平角度"
    assert purpose("SetSpawnPoint") == "设置出生点"
    assert purpose("GetWorld") == "获取世界对象"


def test_param_and_return_descriptions():
    assert param_desc("playerid") == "玩家ID"
    assert param_desc("gridIndex") == "背包格子索引"
    assert param_desc("posSrc") == "起点位置"
    name, desc = return_info("boolean", "SetSpawnPoint", ["obiid", "pos"])
    assert (name, desc) == ("result", "是否成功")
    name, desc = return_info("boolean", "HasTag", ["tags"])
    assert (name, desc) == ("result", "是否满足条件")
    name, desc = return_info("number", "CalcAngle", ["a"])
    assert (name, desc) == ("result", "计算结果")


def generated_files():
    return sorted((REPO / "library" / "optional").rglob("*.lua")) + sorted(
        (REPO / "library" / "components").glob("*.lua"))


def test_returns_name_and_description():
    for path in generated_files():
        for line in path.read_text(encoding="utf-8").splitlines():
            if not line.startswith("---@return"):
                continue
            match = RETURN_LINE.match(line)
            assert match, f"{path.name}: {line}"
            assert match.group(3).strip(), f"{path.name}: missing return description"


def test_br_ends_the_line():
    for path in generated_files():
        for line in path.read_text(encoding="utf-8").splitlines():
            if "<br>" not in line:
                continue
            assert line.rstrip().endswith("<br>"), f"{path.name}: text after <br>: {line}"
