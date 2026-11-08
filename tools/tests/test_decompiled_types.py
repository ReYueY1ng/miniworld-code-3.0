import sys
from pathlib import Path

TOOLS = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(TOOLS))

from decompiled_types import DecompiledTypes  # noqa: E402


def _framework(tmp_path: Path) -> Path:
    (tmp_path / "services" / "trigger").mkdir(parents=True)
    (tmp_path / "services" / "demo.lua").write_text(
        "local Demo = {}\n"
        "function Demo:Typed(a, b, c, pos)\n"
        "\tif isTypeError(\"number\", a, b) then\n"
        "\t\treturn false\n"
        "\tend\n"
        "\tif type(c) ~= \"string\" then\n"
        "\t\treturn false\n"
        "\tend\n"
        "\tif c == nil then\n"
        "\t\treturn nil\n"
        "\tend\n"
        "\tlocal ok = pos and pos.x and pos.y and pos.z\n"
        "\treturn true\n"
        "end\n"
        "function Demo:Optional(p, q)\n"
        "\tp = p or 0\n"
        "\tif q == nil then\n"
        "\t\tq = false\n"
        "\tend\n"
        "\treturn p\n"
        "end\n"
        "return Demo\n",
        encoding="utf-8",
    )
    (tmp_path / "services" / "gamerules.lua").write_text(
        "local GameRules = {}\nfunction GameRules:Foo()\n\treturn true\nend\nreturn GameRules\n",
        encoding="utf-8",
    )
    (tmp_path / "services" / "trigger" / "world.lua").write_text(
        "local World = {}\n"
        "function World:SetSpawnPoint(objid, pos)\n"
        "\tif pos then\n"
        "\t\treturn ServiceEnv.World:SetSpawnPoint(pos.x, pos.y, pos.z)\n"
        "\tend\n"
        "end\n"
        "return World\n",
        encoding="utf-8",
    )
    return tmp_path


def test_type_guards_and_vector(tmp_path):
    decompiled = DecompiledTypes(_framework(tmp_path))
    record = decompiled.lookup("Demo", "Typed", False)
    assert record is not None
    inference = decompiled.infer(record)
    assert inference.param_types["a"] == "number"
    assert inference.param_types["b"] == "number"
    assert inference.param_types["c"] == "string"
    assert inference.param_types["pos"] == "Mini.Vec3"
    assert inference.return_type == "boolean?"


def test_defaults_mark_optional(tmp_path):
    decompiled = DecompiledTypes(_framework(tmp_path))
    record = decompiled.lookup("Demo", "Optional", False)
    assert record is not None
    inference = decompiled.infer(record)
    assert inference.param_types["p"] == "number"
    assert inference.param_types["q"] == "boolean"
    assert set(inference.optional) == {"p", "q"}
    assert inference.return_type == "number"


def test_trigger_namespace_and_alias(tmp_path):
    decompiled = DecompiledTypes(_framework(tmp_path))
    trigger = decompiled.lookup("Trigger.World", "SetSpawnPoint", True)
    assert trigger is not None
    assert decompiled.infer(trigger).param_types["pos"] == "Mini.Vec3"
    assert decompiled.lookup("GameRule", "Foo", False) is not None


def test_nested_blocks_end_correctly(tmp_path):
    decompiled = DecompiledTypes(_framework(tmp_path))
    record = decompiled.lookup("Demo", "Typed", False)
    assert record is not None
    assert record["body"].rstrip().endswith("end")
    assert "local ok" in record["body"]
