"""Tests for the built-in component generator: parsing and deterministic rendering."""

from __future__ import annotations

import importlib.util
import json
import sys
from pathlib import Path

TOOLS = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(TOOLS))


def _load(name: str, relative: str):
    spec = importlib.util.spec_from_file_location(name, TOOLS / relative)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


gen = _load("gen_builtin_components_tool", "gen_builtin_components.py")

KNOWN = gen.PRIMITIVE_TYPES | {"Mini.Vec3", "Mini.Number"}

FIXTURE = """
<div style="position:relative;" class="vp-doc _demo">
<h1 id="demo">演示组件接口 <code>Demo</code> <a class="header-anchor" href="#demo">&#x200B;</a></h1>
<p><strong>具体函数名及描述如下:</strong></p>
<table tabindex="0"><thead><tr><th>序号</th><th>函数名</th><th>函数描述</th></tr></thead>
<tbody>
<tr><td>1</td><td><a href="#setpos">SetPos(...)</a></td><td>设置坐标</td></tr>
<tr><td>2</td><td><a href="#bad">Bad(...)</a></td><td>Bad</td></tr>
</tbody></table>
<h2 id="setpos" tabindex="-1">SetPos <a class="header-anchor" href="#setpos">&#x200B;</a></h2>
<ul>
<li>参数及类型： <ul>
<li>x:<a href="./../introduction/componentattr.html#mini-vec3"><strong><code>Mini.Vec3</code></strong></a> 局部坐标，含数值x、y、z；触发器传一个向量，脚本也可传x、y、z三个数值。无默认值。</li>
<li>y:未声明</li>
<li>z:未声明</li>
</ul></li>
<li>返回值及类型： <ul><li>result:Mini.Nope 返回说明文字。</li></ul></li>
<li>该方法的其他说明：坐标以格为单位。</li>
</ul>
<p>具体使用案例如下：</p>
<div class="language-lua"><pre>local component = self:GetComponent("Demo")</pre></div>
<h2 id="bad" tabindex="-1">Bad <a class="header-anchor" href="#bad">&#x200B;</a></h2>
<ul>
<li>参数及类型： <ul><li>count:Mini.Number 数量，默认1。</li></ul></li>
<li>返回值及类型：未声明（简写开放配置未提供返回类型）。开放方式：仅配置了脚本访问。</li>
<li>该方法的其他说明：保留原有拼写。</li>
</ul>
</main>
"""


def render():
    return gen.build_component_file("Demo", "cmpapis/demo.html", FIXTURE, KNOWN)


def test_summary_matches_sections():
    content, methods, warnings, summary, order = render()
    assert [name for name, _ in summary] == ["SetPos", "Bad"]
    assert [method["name"] for method in methods] == ["SetPos", "Bad"]
    assert order == ["SetPos", "Bad"]
    assert warnings == ["Demo:SetPos: （wiki 类型 Mini.Nope 不在类型库中，此处用 any）"]


def test_vector_triple_and_unknown_type():
    content, _, _, _, _ = render()
    assert "---@class Demo: Component" in content
    assert content.startswith("---@meta\n")
    assert "---@param x Mini.Vec3 | number" in content
    assert "---@param y? number" in content
    assert "---@param z? number" in content
    assert "function Demo:SetPos(x, y, z) end" in content
    assert "---@return any result 返回说明文字。（wiki 类型 Mini.Nope 不在类型库中，此处用 any）" in content
    assert "---演示组件接口（内置组件 Demo）<br>\n---[查看文档]" in content


def test_undeclared_and_default_params():
    content, _, _, _, _ = render()
    assert "---@param count? number 数量，默认1。" in content
    assert "返回值类型未在 wiki 声明。" in content
    assert "---保留原有拼写" in content
    bad_block = content.split("function Demo:SetPos(x, y, z) end", 1)[1].split("function Demo:Bad")[0]
    assert "---@return" not in bad_block


COMPONENT_FIXTURE = """
local Demo = ComponentClass("Demo")

Demo.displayName = "演示"
Demo._cmpTips = "演示组件说明。"
Demo.propertys = {
	position = {
		sort = 1,
		type = Mini.Vec3,
		default = Mini.Vec3(0, 0, 0),
		displayName = "位置"
	},
	speed = {
		sort = 2,
		type = Mini.Number,
		displayName = UGCTools.GetS(1001)
	},
	items = {
		sort = 3,
		type = Mini.Array,
		itemType = Mini.Item,
		tips = "道具列表"
	}
}
Demo.openFnArgs = {
	SetSpeed = {
		tips = "设置速度。",
		displayName = "设置速度",
		params = {
			Mini.Number
		},
		paramsTips = {
			"目标速度。"
		},
		returnType = Mini.Bool,
		returnTips = "是否设置成功。"
	},
	Refresh = true
}

function Demo:OnDestroy()
end

return Demo
"""


def _decompiled(tmp_path):
    root = tmp_path / "components"
    (root / "actor").mkdir(parents=True)
    (root / "actor" / "demo.lua").write_text(COMPONENT_FIXTURE, encoding="utf-8")
    return root


def test_decompiled_meta_parser(tmp_path):
    root = _decompiled(tmp_path)
    meta = gen.parse_component_file(root / "actor" / "demo.lua", root, set())
    assert meta["name"] == "Demo"
    assert meta["category"] == "actor"
    assert meta["display"] == "演示"
    assert meta["tips"] == "演示组件说明。"
    fields = {prop["name"]: (prop["type"], prop["desc"]) for prop in meta["properties"]}
    assert fields == {
        "position": ("Mini.Vec3", "位置"),
        "speed": ("number", ""),
        "items": ("(number | string)[]", "道具列表"),
    }
    methods = {method["name"]: method for method in meta["methods"]}
    assert methods["SetSpeed"]["params"] == ["Mini.Number"]
    assert methods["SetSpeed"]["param_tips"] == ["目标速度。"]
    assert methods["SetSpeed"]["return_type"] == "Mini.Bool"
    assert methods["Refresh"]["kind"] == "scalar"


def test_decompiled_render_uses_fields_and_methods(tmp_path):
    root = _decompiled(tmp_path)
    meta = gen.parse_component_file(root / "actor" / "demo.lua", root, set())
    content, methods, warnings, _, _ = gen.render_component(meta)
    assert warnings == []
    assert "---演示（内置组件 Demo · 角色组件）<br>" in content
    assert "---演示组件说明。" in content
    assert "---@field position Mini.Vec3 位置" in content
    assert "---@field speed number 速度" in content
    assert "---@field items (number | string)[] 道具列表" in content
    assert "---@param num number 目标速度。" in content
    assert "---@return boolean result 是否设置成功。" in content
    assert "function Demo:SetSpeed(num) end" in content
    assert "---@vararg any\nfunction Demo:Refresh(...) end" in content
    assert [method["name"] for method in methods] == ["SetSpeed", "Refresh"]


def test_component_manifest_groups_by_category(tmp_path):
    root = _decompiled(tmp_path)
    results, duplicates = gen.build_all_decompiled(root, tmp_path / "cache", set(), use_wiki=False)
    assert duplicates == []
    manifest = json.loads(gen.render_component_manifest(results))
    assert manifest["categories"] == [{"key": "actor", "label": "角色组件", "components": ["Demo"]}]
    assert manifest["components"][0]["file"] == "library/components/actor/Demo.lua"
    assert manifest["components"][0]["property_count"] == 3


def test_render_is_deterministic():
    first, _, _, _, _ = render()
    second, _, _, _, _ = render()
    assert first == second
