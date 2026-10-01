"""Tests for the env-dump CLI tools: parse_env, env_diff, extract_env_methods."""

from __future__ import annotations

import importlib.util
import json
import sys
from pathlib import Path

import pytest

TOOLS = Path(__file__).resolve().parents[1]
FIXTURES = Path(__file__).resolve().parent / "fixtures"
sys.path.insert(0, str(TOOLS))

import env_lib  # noqa: E402


def _load(name: str, relative: str):
    spec = importlib.util.spec_from_file_location(name, TOOLS / relative)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


parse_env = _load("parse_env_tool", "api-update/parse_env.py")
env_diff = _load("env_diff_tool", "env_diff.py")
extract_env_methods = _load("extract_env_methods_tool", "extract_env_methods.py")

NEW = FIXTURES / "new_format.lua"
LEGACY = FIXTURES / "legacy_format.txt"


def test_parse_env_entry_schema(tmp_path, capsys):
    out = tmp_path / "env-apis.json"
    sys.argv = ["parse_env.py", "--input", str(NEW), "--output", str(out)]
    assert parse_env.main() == 0
    capsys.readouterr()

    entries = json.loads(out.read_text(encoding="utf-8"))
    by_name = {e["name"]: e for e in entries}

    assert by_name["Player:GetHostUin"]["kind"] == "function"
    assert by_name["Player:GetHostUin"]["params"] == ["self", "uin"]
    assert by_name["Player:GetHostUin"]["source"] == "env"
    assert by_name["Player:GetHostUin"]["service"] == "Player.GetHostUin"
    assert by_name["Player:GetHostUin"]["source_file"].endswith("player.lua:35")
    assert by_name["Enums"]["kind"] == "enum"
    assert by_name["Enums"]["values"] == {"A": "1", "B": "2"}
    assert by_name["Mini"]["kind"] == "module"
    assert by_name["Player:GetFriendList"]["unresolved"] is True

    for entry in entries:
        assert {"name", "kind", "source"} <= set(entry)


def test_parse_env_rejects_missing_input(tmp_path, capsys):
    sys.argv = ["parse_env.py", "--input", str(tmp_path / "nope.lua")]
    assert parse_env.main() == 1
    assert "no export found" in capsys.readouterr().err


def test_parse_env_applies_mod_only_injection(tmp_path, capsys):
    """A DevApiMType.Mod method is re-wrapped with an injected modId argument,
    so its exposed signature has one parameter more than the raw service method."""
    mgr = tmp_path / "mgrenv.lua"
    mgr.write_text(
        "return {\n"
        '    ["modServices"] = {\n'
        '        ["Player"] = { ["GetHostUin"] = true, ["GetFriendList"] = false },\n'
        "    },\n"
        "}\n",
        encoding="utf-8",
    )
    out = tmp_path / "env-apis.json"
    sys.argv = ["parse_env.py", "--input", str(NEW), "--mgr", str(mgr), "--output", str(out)]
    assert parse_env.main() == 0
    capsys.readouterr()

    by_name = {e["name"]: e for e in json.loads(out.read_text(encoding="utf-8"))}
    assert by_name["Player:GetHostUin"]["params"] == ["self", "modId", "uin"]
    assert by_name["Player:GetHostUin"]["inject"] == ["modId"]
    assert by_name["Player:GetFriendList"]["params"] == ["self", "uin", "page"]


def test_parse_env_without_mgr_leaves_params_alone(tmp_path, capsys):
    out = tmp_path / "env-apis.json"
    sys.argv = ["parse_env.py", "--input", str(NEW), "--output", str(out)]
    assert parse_env.main() == 0
    capsys.readouterr()
    by_name = {e["name"]: e for e in json.loads(out.read_text(encoding="utf-8"))}
    assert by_name["Player:GetHostUin"]["params"] == ["self", "uin"]


def test_env_diff_identical_across_formats(tmp_path, capsys):
    migrated = tmp_path / "migrated.lua"
    header, root = env_lib.load(LEGACY)
    migrated.write_text("return " + env_lib.render(root) + "\n", encoding="utf-8")

    sys.argv = ["env_diff.py", str(LEGACY), str(migrated)]
    assert env_diff.main() == 0
    output = capsys.readouterr().out
    assert "changed 0" in output
    assert "added 0 APIs" in output


def test_env_diff_reports_signature_change(tmp_path, capsys):
    before = tmp_path / "before.lua"
    after = tmp_path / "after.lua"
    base = (FIXTURES / "new_format.lua").read_text(encoding="utf-8")
    before.write_text(base, encoding="utf-8")
    after.write_text(
        base.replace("function(self, uin) end", "function(self, uin, extra) end"),
        encoding="utf-8",
    )

    sys.argv = ["env_diff.py", str(before), str(after)]
    assert env_diff.main() == 0
    output = capsys.readouterr().out
    assert "Player:GetHostUin" in output
    assert "(self, uin) -> (self, uin, extra)" in output


def test_env_diff_reports_added_and_removed(tmp_path, capsys):
    before = tmp_path / "before.lua"
    after = tmp_path / "after.lua"
    base = (FIXTURES / "new_format.lua").read_text(encoding="utf-8")
    before.write_text(base, encoding="utf-8")
    after.write_text(base.replace('["Native"] = function() end, --[[@C]]', ""), encoding="utf-8")

    sys.argv = ["env_diff.py", str(before), str(after), "--json"]
    assert env_diff.main() == 0
    output = capsys.readouterr().out
    assert "Player:Native" in output


def test_extract_env_methods(tmp_path, capsys):
    library = tmp_path / "library"
    library.mkdir()
    (library / "Player.lua").write_text(
        "---@meta\nPlayer = {}\nfunction Player:GetHostUin(uin) end\nfunction Player:Retired(a) end\n",
        encoding="utf-8",
    )
    sys.argv = ["extract_env_methods.py", str(NEW), "--library", str(library)]
    assert extract_env_methods.main() == 0
    output = capsys.readouterr().out
    assert "+ GetFriendList" in output
    assert "- Retired" in output
    assert "新增: " in output


def test_env_modules_ignores_non_function_entries():
    modules = extract_env_methods.env_modules(NEW)
    assert "GetHostUin" in modules["Player"]
    assert "Enums" not in modules


@pytest.mark.parametrize("face", ["dev", "official", "motion", "mgr"])
def test_real_exports_parse(face):
    path = env_lib.face_path(face)
    if path is None:
        pytest.skip(f"no {face} export installed")
    header, root = env_lib.load(path)
    assert header.format in (env_lib.FORMAT_ID, env_lib.LEGACY_FORMAT_ID)
    if face == "mgr":
        assert isinstance(root.fields.get("limitcfg"), env_lib.Table)
        return
    entries = env_lib.surface_entries(root)
    assert len(entries) > 20
    assert any(e["kind"] == "function" and e.get("module") for e in entries)


def test_real_export_annotations_match_runtime_limitcfg():
    """Whatever a face claims about DevApiRType must agree with ScriptEnvMgr's
    runtime limitcfg, which is the configuration the engine actually enforces."""
    dev = env_lib.face_path("dev")
    mgr = env_lib.face_path("mgr")
    if dev is None or mgr is None:
        pytest.skip("dev and mgr exports both required")

    _, root = env_lib.load(dev)
    _, mgr_root = env_lib.load(mgr)
    limitcfg = mgr_root.fields.get("limitcfg")
    if not isinstance(limitcfg, env_lib.Table) or not limitcfg.fields:
        pytest.skip("limitcfg empty")

    names = {2: "Uin_TimeLimit", 3: "WhiteList", 4: "TimeLimit"}
    checked = 0
    checked_keys = set()
    for key in env_lib.sorted_keys(limitcfg):
        entry = limitcfg.fields[key]
        if not isinstance(entry, env_lib.Table):
            continue
        func = _find_function(root, key)
        if func is None or func.params[:1] == ["..."]:
            # A method the running account is not whitelisted for is replaced by
            # `function(...) ShowGameTips(...)`, so the dump annotates nothing.
            continue
        checked_keys.add(key)
        for itype in env_lib.sorted_keys(entry):
            label = names.get(itype, f"RType{itype}")
            value = entry.fields[itype]
            if isinstance(value, env_lib.Table):
                rendered = "(" + ",".join(
                    env_lib.lua_value_text(value.fields[i]) for i in env_lib.sorted_keys(value)
                ) + ")"
            else:
                rendered = env_lib.lua_value_text(value)
            assert label in func.rtypes, f"{key} missing {label}"
            if label == "ResetCompareParam":
                # the static config names the methods, the runtime substitutes msgids
                continue
            assert func.rtypes[label] == rendered, f"{key} {label}"
            checked += 1
    assert checked > 5, f"only {checked} limitcfg entries lined up with a dumped function"
    assert len(checked_keys) > 5


def _find_function(root, dotted: str):
    service, _, method = dotted.rpartition(".")
    env = env_lib.main_index(root)
    if not isinstance(env, env_lib.Table):
        return None
    node = env
    for part in service.split("."):
        node = node.fields.get(part)
        if not isinstance(node, env_lib.Table):
            return None
    found = node.fields.get(method)
    return found if isinstance(found, env_lib.Func) else None


def test_parse_env_exposes_api_types_and_limits(tmp_path, capsys):
    out = tmp_path / "env-apis.json"
    sys.argv = ["parse_env.py", "--input", str(NEW), "--output", str(out)]
    assert parse_env.main() == 0
    capsys.readouterr()
    by_name = {e["name"]: e for e in json.loads(out.read_text(encoding="utf-8"))}

    host = by_name["Player:GetHostUin"]
    assert host["mtype"] == "ClientData"
    assert host["rtypes"] == {"Uin_TimeLimit": '(10,"调用频繁，请稍后尝试！")'}

    limited = by_name["Player:Limited"]
    assert limited["mtype"] == "SyncPack"
    assert limited["rtypes"] == {"CompareParam": "(3)", "ResetCompareParam": '(3,"SetScale")'}


def test_parse_env_applies_mod_only_injection_from_annotation(tmp_path, capsys):
    """``@mtype Mod`` alone is enough; the mgr face is only a fallback."""
    face = tmp_path / "face.lua"
    face.write_text(
        "return {\n"
        '  ["$meta"] = { ["__index"] = {\n'
        '    ["Svc"] = { ["Do"] = function(self, x) end, --[[@service Svc.Do; @mtype Mod]] },\n'
        "  } },\n"
        "}\n",
        encoding="utf-8",
    )
    out = tmp_path / "env-apis.json"
    sys.argv = ["parse_env.py", "--input", str(face), "--output", str(out)]
    assert parse_env.main() == 0
    capsys.readouterr()
    entries = {e["name"]: e for e in json.loads(out.read_text(encoding="utf-8"))}
    assert entries["Svc:Do"]["params"] == ["self", "modId", "x"]
    assert entries["Svc:Do"]["inject"] == ["modId"]


def test_env_diff_reports_api_type_change(tmp_path, capsys):
    before = tmp_path / "before.lua"
    after = tmp_path / "after.lua"
    base = (FIXTURES / "new_format.lua").read_text(encoding="utf-8")
    before.write_text(base, encoding="utf-8")
    after.write_text(base.replace("@mtype SyncPack", "@mtype BoardCast"), encoding="utf-8")

    sys.argv = ["env_diff.py", str(before), str(after)]
    assert env_diff.main() == 0
    output = capsys.readouterr().out
    assert "Player:Limited  mtype SyncPack -> BoardCast" in output


def test_env_diff_reports_rate_limit_change(tmp_path, capsys):
    before = tmp_path / "before.lua"
    after = tmp_path / "after.lua"
    base = (FIXTURES / "new_format.lua").read_text(encoding="utf-8")
    before.write_text(base, encoding="utf-8")
    after.write_text(base.replace("Uin_TimeLimit=(10,", "Uin_TimeLimit=(30,"), encoding="utf-8")

    sys.argv = ["env_diff.py", str(before), str(after)]
    assert env_diff.main() == 0
    output = capsys.readouterr().out
    assert "Player:GetHostUin" in output
    assert "Uin_TimeLimit=(10," in output and "Uin_TimeLimit=(30," in output


def test_migrate_enriches_from_devapicfg(tmp_path):
    migrate = _load("migrate_env_dump_tool", "migrate_env_dump.py")
    cfg = tmp_path / "devapicfg.lua"
    cfg.write_text(
        "DevApiMType = { Normal = 0, SyncPack = 4 }\n"
        "DevApiRType = { TimeLimit = 4 }\n"
        "DevApiCfg = { services = { Player = { ix = 1, methods = {\n"
        '  { "GetHostUin", DevApiMType.SyncPack, { [DevApiRType.TimeLimit] = 30 } },\n'
        "} } } }\n",
        encoding="utf-8",
    )
    target = tmp_path / "converted.lua"
    stats = migrate.migrate(LEGACY, target, cfg)
    assert stats["annotated"] >= 1

    _, root = env_lib.load(target)
    host = env_lib.main_index(root).fields["Player"].fields["GetHostUin"]
    assert host.mtype == "SyncPack"
    assert host.rtypes == {"TimeLimit": "30"}
    header = env_lib.parse_header(target.read_text(encoding="utf-8"))
    assert header.stats["annotated"] == stats["annotated"]


def test_migrate_round_trip(tmp_path):
    migrate = _load("migrate_env_dump_tool", "migrate_env_dump.py")
    target = tmp_path / "converted.lua"
    migrate.migrate(LEGACY, target)

    _, root = env_lib.load(target)
    assert env_lib.surface_entries(root) == env_lib.surface_entries(env_lib.load(LEGACY)[1])
    header = env_lib.parse_header(target.read_text(encoding="utf-8"))
    assert header.format == env_lib.FORMAT_ID
