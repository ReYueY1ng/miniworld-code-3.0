"""Tests for the built-in component generator: parsing and deterministic rendering."""

from __future__ import annotations

import importlib.util
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
    assert "---@param count? Mini.Number 数量，默认1。" in content
    assert "返回值类型未在 wiki 声明。" in content
    assert "---保留原有拼写" in content
    bad_block = content.split("function Demo:SetPos(x, y, z) end", 1)[1].split("function Demo:Bad")[0]
    assert "---@return" not in bad_block


def test_render_is_deterministic():
    first, _, _, _, _ = render()
    second, _, _, _, _ = render()
    assert first == second
