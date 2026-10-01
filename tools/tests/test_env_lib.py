"""Unit tests for the env dump parser, covering both on-disk formats."""

from __future__ import annotations

import shutil
import subprocess
import sys
from pathlib import Path

import pytest

TOOLS = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(TOOLS))

import env_lib  # noqa: E402

FIXTURES = Path(__file__).resolve().parent / "fixtures"
ENV_DIR = env_lib.env_dir()
STUB = ENV_DIR / "tests/stub_env.lua"


@pytest.fixture(scope="module")
def new_tree():
    return env_lib.load(FIXTURES / "new_format.lua")


@pytest.fixture(scope="module")
def legacy_tree():
    return env_lib.load(FIXTURES / "legacy_format.txt")


def test_detects_format(tmp_path):
    assert env_lib.detect_format((FIXTURES / "new_format.lua").read_text()) == env_lib.FORMAT_ID
    assert env_lib.detect_format((FIXTURES / "legacy_format.txt").read_text()) == env_lib.LEGACY_FORMAT_ID


def test_header_fields(new_tree):
    header, _ = new_tree
    assert header.format == env_lib.FORMAT_ID
    assert header.generator == "fixture"
    assert header.face == "dev"
    assert header.game == "9.9.9"
    assert header.stats["tables"] == 10
    assert header.stats["functions"] == 6


def test_legacy_header_defaults(legacy_tree):
    header, _ = legacy_tree
    assert header.format == env_lib.LEGACY_FORMAT_ID
    assert header.face == ""


def test_main_index_unwraps_sandbox_wrapper(new_tree, legacy_tree):
    for header, root in (new_tree, legacy_tree):
        env = env_lib.main_index(root)
        assert isinstance(env, env_lib.Table)
        assert "Player" in env.fields, header.format
        assert "Mini" in env.fields, header.format


def test_reserved_keys_are_escaped(new_tree):
    _, root = new_tree
    escaped = env_lib.main_index(root).fields["Escaped"]
    assert escaped.fields["$meta"] == "a real key that looks reserved"
    assert escaped.fields["$ref"] == "a real key that looks reserved"
    assert escaped.fields["$weird$"] == 3
    assert escaped.meta is None


def test_scalar_round_trip(new_tree):
    _, root = new_tree
    scalars = env_lib.main_index(root).fields["Scalars"]
    assert scalars.fields["ascii"] == "hello"
    assert scalars.fields["ctrl"] == "a\nb\tc"
    assert scalars.fields["quoted"] == 'say "hi"'
    assert scalars.fields["unicode"] == "自定义方块作物"
    assert scalars.fields["num"] == 42
    assert scalars.fields["ratio"] == 1.5
    assert scalars.fields["huge"] == float("inf")


def test_numeric_and_boolean_values(new_tree):
    _, root = new_tree
    env = env_lib.main_index(root)
    totals = env.fields["Totals"]
    assert totals.fields["yes"] is True
    assert totals.fields["limit"].fields == {"name": "调用频繁", "wait": 10}
    assert isinstance(totals.fields["limit"].fields["wait"], int)


def test_legacy_inf_and_builtin(legacy_tree):
    _, root = legacy_tree
    maths = env_lib.main_index(root).fields["math"]
    assert maths.fields["huge"] == float("inf")
    assert maths.fields["max"].native == "builtin"
    assert maths.fields["random"].source is None
    assert maths.fields["broken"].is_unresolved is True


def test_function_metadata(new_tree):
    _, root = new_tree
    player = env_lib.main_index(root).fields["Player"]
    host = player.fields["GetHostUin"]
    assert host.params == ["self", "uin"]
    assert host.service == "Player.GetHostUin"
    assert host.source.endswith("player.lua:35")
    assert host.is_unresolved is False
    assert host.mtype == "ClientData"
    assert host.rtypes == {"Uin_TimeLimit": '(10,"调用频繁，请稍后尝试！")'}

    assert player.fields["GetFriendList"].is_unresolved is True
    assert player.fields["GetFriendList"].mtype is None
    assert player.fields["Native"].native == "C"
    assert player.fields["Builtins"].native == "builtin"

    limited = player.fields["Limited"]
    assert limited.mtype == "SyncPack"
    assert limited.rtypes == {"CompareParam": "(3)", "ResetCompareParam": '(3,"SetScale")'}


def test_annotations_rebuild_in_canonical_order(new_tree):
    _, root = new_tree
    host = env_lib.main_index(root).fields["Player"].fields["GetHostUin"]
    assert host.annotations == [
        "@F:/Script/luascript/ugc/framework/services/player.lua:35",
        "@service Player.GetHostUin",
        "@mtype ClientData",
        '@rtype Uin_TimeLimit=(10,"调用频繁，请稍后尝试！")',
    ]


def test_back_references_resolve(new_tree, legacy_tree):
    _, root = new_tree
    env = env_lib.main_index(root)
    cyclic = env.fields["Cyclic"]
    assert env_lib.deref(root, cyclic.fields["parent"]) is cyclic
    assert env_lib.deref(root, cyclic.fields["sibling"]) is env.fields["Shared"]

    _, old_root = legacy_tree
    old_env = env_lib.main_index(old_root)
    old_cyclic = old_env.fields["Cyclic"]
    addrs = env_lib.address_map(old_root)
    assert env_lib.deref(old_root, old_cyclic.fields["parent"], addrs) is old_cyclic
    assert env_lib.deref(old_root, old_cyclic.fields["friend"], addrs) is old_env.fields["Player"]
    alias = old_env.fields["Player"].fields["GetHostUinAlias"]
    assert env_lib.deref(old_root, alias, addrs) is old_env.fields["Player"]


def test_truncated_and_userdata(new_tree):
    _, root = new_tree
    env = env_lib.main_index(root)
    leaf_meta = env.fields["Cyclic"].fields["leaf"].meta
    assert leaf_meta.fields["__index"].truncated is True
    assert env.fields["Udata"].userdata == "file (0x1)"


def test_surface_entries_classification(new_tree):
    _, root = new_tree
    entries = {e["name"]: e for e in env_lib.surface_entries(root)}
    assert entries["Player"]["kind"] == "module"
    assert entries["Player:GetHostUin"]["params"] == ["self", "uin"]
    assert entries["Mini:Class"]["kind"] == "function"
    assert entries["Enums"]["kind"] == "enum"
    assert entries["Enums"]["values"] == {"A": "1", "B": "2"}
    assert entries["Scalars"]["values"]["unicode"] == "自定义方块作物"


def test_surface_skips_internal_keys(legacy_tree):
    _, root = legacy_tree
    names = {e["name"] for e in env_lib.surface_entries(root)}
    assert "Player:GetHostUinAlias" not in names
    assert "BackpackStartIndex" in names
    assert not any(n.startswith("Player:__") for n in names)


def test_surface_entries_resolve_legacy_aliases(legacy_tree):
    _, root = legacy_tree
    entries = {e["name"]: e for e in env_lib.surface_entries(root)}
    assert entries["Player"]["kind"] == "module"
    assert entries["Player:GetHostUin"]["params"] == ["self", "uin"]
    assert entries["math:max"]["kind"] == "function"
    assert entries["Enums"]["values"] == {"A": "1", "B": "2"}
    assert entries["Cyclic"]["kind"] == "module"


def test_render_round_trip_is_stable(new_tree, legacy_tree):
    for header, root in (new_tree, legacy_tree):
        text = "return " + env_lib.render(root) + "\n"
        reparsed_header, reparsed = env_lib.parse(text, source="roundtrip")
        assert env_lib.surface_entries(reparsed) == env_lib.surface_entries(root)
        assert env_lib.count_stats(reparsed) == env_lib.count_stats(root)


def test_escaped_keys_survive_round_trip(new_tree):
    _, root = new_tree
    _, reparsed = env_lib.parse("return " + env_lib.render(root) + "\n")
    escaped = env_lib.main_index(reparsed).fields["Escaped"]
    assert escaped.fields == {"$meta": "a real key that looks reserved",
                              "$ref": "a real key that looks reserved",
                              "$weird$": 3}


def test_parse_lua_globals_resolves_named_constants():
    text = (
        "DevApiMType = { Normal = 0, SyncPack = 4 }\n"
        "DevApiRType = { TimeLimit = 4 }\n"
        "Cfg = {\n"
        '  svc = { [DevApiMType.SyncPack] = 1, plain = DevApiMType.Normal },\n'
        "}\n"
        "Cfg.extra = { [DevApiRType.TimeLimit] = 30 }\n"
    )
    parsed = env_lib.parse_lua_globals(text, source="inline")
    assert parsed["DevApiMType"].fields["SyncPack"] == 4
    assert parsed["Cfg"].fields["svc"].fields[4] == 1
    assert parsed["Cfg"].fields["svc"].fields["plain"] == 0
    assert parsed["Cfg"].fields["extra"].fields[4] == 30


def test_load_devapicfg_expands_nested_services_and_rtypes():
    meta = env_lib.parse_devapicfg(
        """
DevApiMType = { Block = 1, Normal = 0, SyncPack = 4 }
DevApiRType = { TimeLimit = 4, WhiteList = 3, Uin_TimeLimit = 2 }
DevApiCfg = {
  services = {
    Player = {
      ix = 1,
      methods = {
        { "Slow", DevApiMType.Normal, {
            [DevApiRType.Uin_TimeLimit] = { 10, "慢一点" },
            [DevApiRType.WhiteList] = "LuaApi3_Slow",
        } },
        "Fast",
      },
    },
    Trigger = {
      ix = 2,
      methods = {},
      items = {
        Inner = { methods = { { "Nested", DevApiMType.Block, { [DevApiRType.TimeLimit] = 30 } } } },
      },
    },
  },
}
""",
        source="inline",
    )
    assert meta.services == {"Player", "Trigger", "Trigger.Inner"}
    assert meta.flat["Player.Fast"].mtype == "Normal"
    assert meta.flat["Player.Slow"].mtype == "Normal"
    assert meta.flat["Player.Slow"].rtypes == {
        "Uin_TimeLimit": '(10,"慢一点")',
        "WhiteList": '"LuaApi3_Slow"',
    }
    assert meta.flat["Trigger.Inner.Nested"].mtype == "Block"
    assert meta.flat["Trigger.Inner.Nested"].rtypes == {"TimeLimit": "30"}
    assert meta.services == {"Player", "Trigger", "Trigger.Inner"}


def _api_meta() -> env_lib.ApiMeta:
    return env_lib.ApiMeta(
        flat={
            "Player.GetHostUin": env_lib.ApiMethod("ClientData", {"Uin_TimeLimit": '(10,"slow")'}),
        },
        services={"Player"},
    )


def test_annotate_functions_never_overwrites_existing_annotations(new_tree):
    _, root = new_tree
    env_lib.annotate_functions(root, _api_meta())
    player = env_lib.main_index(root).fields["Player"]
    host = player.fields["GetHostUin"]
    assert host.mtype == "ClientData"
    assert host.rtypes == {"Uin_TimeLimit": '(10,"调用频繁，请稍后尝试！")'}
    assert player.fields["Limited"].mtype == "SyncPack"


def test_annotate_functions_derives_service_from_tree_path(legacy_tree):
    """A legacy dump carries no @service, so the path `Player.GetHostUin` is used,
    and a service the config knows but does not list defaults to Normal."""
    _, root = legacy_tree
    stamped = env_lib.annotate_functions(root, _api_meta())
    env = env_lib.main_index(root)
    assert env.fields["Player"].fields["GetHostUin"].mtype == "ClientData"
    assert env.fields["Player"].fields["GetFriendList"].mtype == "Normal"
    assert env.fields["math"].fields["max"].mtype is None, "non-service module"
    assert env.fields["Cyclic"].fields["name"] == "cyclic"
    assert stamped == 2


@pytest.mark.skipif(shutil.which("luajit") is None, reason="luajit not installed")
def test_dumper_output_is_byte_stable(tmp_path):
    """Two runs of the same build must produce identical bytes: that is the whole
    point of dropping memory addresses from the format."""
    if not STUB.exists():
        pytest.skip("stub harness missing")

    runs = []
    for index in (1, 2):
        target = tmp_path / f"run{index}"
        target.mkdir()
        result = subprocess.run(
            ["luajit", str(STUB), str(target)],
            capture_output=True, text=True, cwd=str(ENV_DIR), check=False,
        )
        assert result.returncode == 0, result.stdout + result.stderr
        runs.append(target)

    for face in ("dev", "official", "motion", "mgr"):
        name = f"{face}env.lua"
        first = _without_timestamp((runs[0] / name).read_text(encoding="utf-8"))
        second = _without_timestamp((runs[1] / name).read_text(encoding="utf-8"))
        assert first == second, f"{name} is not reproducible"


def _without_timestamp(text: str) -> str:
    return "\n".join(line for line in text.split("\n") if not line.startswith("-- generated:"))


@pytest.mark.skipif(shutil.which("luajit") is None, reason="luajit not installed")
def test_rendered_output_is_valid_lua(new_tree, tmp_path):
    _, root = new_tree
    target = tmp_path / "rendered.lua"
    target.write_text("return " + env_lib.render(root) + "\n", encoding="utf-8")
    result = subprocess.run(
        ["luajit", "-e", f"local f,e=loadfile('{target}'); print(f and 'OK' or e)"],
        capture_output=True, text=True, check=False,
    )
    assert result.stdout.strip() == "OK", result.stdout + result.stderr


@pytest.mark.skipif(shutil.which("luajit") is None, reason="luajit not installed")
def test_dumper_output_round_trips(tmp_path):
    if not STUB.exists():
        pytest.skip("stub harness missing")
    if not shutil.which("luajit"):
        pytest.skip("luajit not installed")

    run = subprocess.run(
        ["luajit", str(STUB), str(tmp_path)],
        capture_output=True, text=True, cwd=str(ENV_DIR), check=False,
    )
    assert run.returncode == 0, run.stdout + run.stderr

    for face in ("dev", "official", "motion", "mgr"):
        produced = tmp_path / f"{face}env.lua"
        assert produced.exists(), f"{face} not dumped"

    header, root = env_lib.load(tmp_path / "devenv.lua")
    assert header.format == env_lib.FORMAT_ID
    assert header.stats["unresolved"] == 1

    load = subprocess.run(
        ["luajit", "-e",
         f"local f,e=loadfile('{tmp_path / 'devenv.lua'}'); print(f and 'OK' or e)"],
        capture_output=True, text=True, check=False,
    )
    assert load.stdout.strip() == "OK", load.stdout + load.stderr

    entries = {e["name"]: e for e in env_lib.surface_entries(root)}
    assert entries["Player:GetHostUin"]["params"] == ["self", "uin"]
    assert entries["Broken:NoTarget"]["params"] == ["sev", "..."]

    text = (tmp_path / "devenv.lua").read_text(encoding="utf-8")
    assert "table: 0x" not in text


def test_dumper_emits_api_type_annotations(tmp_path):
    """@mtype/@rtype come from the runtime DevApiCfg the engine loads."""
    if not STUB.exists() or not shutil.which("luajit"):
        pytest.skip("luajit or stub harness missing")
    result = subprocess.run(
        ["luajit", str(STUB), str(tmp_path)],
        capture_output=True, text=True, cwd=str(ENV_DIR), check=False,
    )
    assert result.returncode == 0, result.stdout + result.stderr
    assert "api metadata: DevApiCfg" in result.stdout

    _, root = env_lib.load(tmp_path / "devenv.lua")
    env = env_lib.main_index(root)

    assert env.fields["Player"].fields["GetHostUin"].mtype == "Mod"
    assert env.fields["Ghost"].fields["Untracked"].mtype == "Normal"

    secret = env.fields["World"].fields["Secret"]
    assert secret.mtype == "SyncPack"
    assert secret.rtypes["WhiteList"] == '"LuaApi3_Stub\\"quote"'
    assert secret.rtypes["CompareParam"] == "(3)"
    assert secret.rtypes["ResetCompareParam"] == '(3,"SetScale","SmoothScaleTo")'

    nested = env.fields["Trigger"].fields["Inner"].fields["Nested"]
    assert nested.mtype == "Block"
    assert nested.rtypes == {"TimeLimit": "30"}
