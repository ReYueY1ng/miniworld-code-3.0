#!/usr/bin/env python3
"""Infer Mini World API parameter/return types and value hints from decompiled Lua.

The environment table gives parameter names but not types. The decompiled
services carry explicit guards (`isTypeError("number", hp)`,
`type(pos) ~= "table"`), vector field access (`pos.x/y/z`), default values,
enum comparisons (`bartype == CmpEnvEnum.BackpackType.Shortcut`) and return
statements, which is enough to type a large share of the optional lanes.

Inference runs in two passes so delegation is followed:

  1. every `function Q:M(...)` body is scanned for guards, defaults, enum
     comparisons, bounds and locals;
  2. return expressions are typed, resolving `self:M(...)`,
     `ServiceEnv.X:M(...)` and `Service.X:M(...)` calls through the index
     (Trigger wrappers are mostly thin delegations, so this is where their
     return types come from).

Reads services/ and services/trigger/ under a decompiled framework directory,
and can dump the result to a JSON cache so regeneration does not need the
decompiled tree to be present.

    python3 tools/decompiled_types.py --stats
    python3 tools/decompiled_types.py --dump-cache tools/api-update/decompiled-types.json
    python3 tools/decompiled_types.py --decompiled <framework dir> --stats
"""

from __future__ import annotations

import argparse
import json
import os
import re
import sys
from collections import defaultdict
from dataclasses import dataclass, field
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_CACHE = PROJECT_ROOT / "tools" / "api-update" / "decompiled-types.json"

FRAMEWORK_CANDIDATES = (
    Path("/run/media/yuey1ng/F25A9F0C5A9ECD2B/mini/dump/decompiled/luascript/ugc/framework"),
    Path("/home/yuey1ng/mini/dump/decompiled/luascript/ugc/framework"),
    Path("/home/yuey1ng/Downloads/迷你世界AI助手/pkg_output/script/luascript/ugc/framework"),
)

TYPE_MAP = {
    "number": "number",
    "integer": "integer",
    "int": "integer",
    "boolean": "boolean",
    "bool": "boolean",
    "string": "string",
    "table": "table",
    "function": "function",
    "userdata": "userdata",
}

ORDER = ["Mini.Vec3", "integer | integer[]", "number", "integer",
         "string", "boolean", "table", "function", "userdata", "any"]

ALIASES = {
    "GameRule": ("GameRules",),
    "GameRules": ("GameRule",),
    "Player": ("Actor",),
    "Monster": ("Actor",),
    "Trigger.Player": ("Trigger.Actor",),
    "Trigger.Monster": ("Trigger.Actor",),
}

FUNCTION_HEAD = re.compile(r"^function\s+([A-Za-z_][\w.]*):(\w+)\s*\(([^)]*)\)", re.M)
IS_TYPE_ERROR = re.compile(r"(?:_G\.)?isTypeError\(\s*\"(\w+)\"\s*,([^)]*)\)")
TYPE_NOT_EQUAL = re.compile(r"type\(\s*(\w+)\s*\)\s*~=\s*\"(\w+)\"")
TYPE_EQUAL = re.compile(r"type\(\s*(\w+)\s*\)\s*==\s*\"(\w+)\"")
DEFAULT_OR = re.compile(r"\b(\w+)\s*=\s*\1\s+or\s+([^;\n]+)")
DEFAULT_NIL = re.compile(r"if\s+(\w+)\s*==\s*nil\s+then\s+\1\s*=\s*([^;\n]+?)\s+end")
DEFAULT_TYPE = re.compile(r"if\s+type\(\s*(\w+)\s*\)\s*~=\s*\"(\w+)\"\s+then\s+\1\s*=\s*([^;\n]+?)\s+end")
ENUM_COMPARE = re.compile(r"\b(\w+)\s*[=~]=\s*((?:CmpEnvEnum|CmpEnum|Enum|GameEnum)\.\w+(?:\.\w+)?)")
BOUND = re.compile(r"\b(\w+)\s*(>=|<=|>|<)\s*(-?\d+(?:\.\d+)?)")
LOCAL_ASSIGN = re.compile(r"^\s*local\s+([\w\s,]+?)\s*=\s*(.+)$")
PLAIN_ASSIGN = re.compile(r"^\s*(\w+)\s*=\s*(.+)$")
CALL_EXPR = re.compile(r"^(?:([A-Za-z_][\w.]*)[.:])?([A-Za-z_]\w*)\s*\((.*)\)$", re.S)
STRING_CALL = re.compile(r"\"([^\"]*)\"")

VECTOR_NAMES = {
    "pos", "position", "pos1", "pos2", "posbegin", "posend", "possrc", "posdst",
    "posbeg", "vec", "vec1", "vec2", "vector", "origin", "center",
    "offset", "rot", "dir", "direction", "sigdir", "targetpos",
}
OBJECT_ID_SUFFIX = re.compile(r"(?:objid|objida|objidb|obiid|targetobjid|instid|instanceid|uin|reportid|targetid|doobj|"
                              r"playerid|actorid|mobid|monsterid|teamid|areaid|"
                              r"cmpid|uiid|elementid|libobjid|gridid|worldid|varid|"
                              r"libvarid|conid|treeid|anchorid|actid|equipid)$")
ASSET_ID_SUFFIX = re.compile(r"(?:itemid|blockid|buffid|buff\d|buffer\d|effectid|"
                             r"particleid|animid|musicid|modelid|prefabid|resid|cfgid|"
                             r"defid|assetid)$")
NUMBER_SUFFIX = re.compile(r"(?:num|count|index|idx|time|ticks|interval|delay|speed|"
                           r"scale|radius|angle|hp|damage|level|exp|volume|pitch|"
                           r"frame|duration|percent|rate|weight|size|width|height|"
                           r"length|distance)$")
BOOLEAN_PREFIX = re.compile(r"^(?:is|has|can|allow|enable|ignore|b|no|not)[A-Z_]")
BOOLEAN_NAMES = {
    "badd", "bshow", "bopen", "bkill", "bsync", "bexactmatch", "bvisible",
    "cancontrol", "isall", "isloop", "ishost", "isadd", "isequal", "isauto",
    "isvalid", "isopen", "switch", "enable", "flag", "alive", "needshare",
    "breplay", "bforever", "btriggerevent", "bhasequip",
}
TRIGGER_ARRAY_PARAMS = {"data", "actorids", "playerids", "objids", "itemids"}


def name_type_hint(name: str, is_trigger: bool) -> str | None:
    """Type a parameter from its name when the body carries no evidence.

    Only well-established Mini World naming conventions are used here; anything
    unrecognised stays ``any`` so the lane never claims a type it cannot back.
    """
    lowered = name.lower()
    if lowered in TRIGGER_ARRAY_PARAMS and is_trigger:
        return "integer | integer[]"
    if lowered in VECTOR_NAMES:
        return "Mini.Vec3"
    if lowered in ("x", "y", "z", "n", "i", "k", "len", "col") or re.fullmatch(r"v\d+", lowered):
        return "number"
    if OBJECT_ID_SUFFIX.search(lowered):
        return "integer"
    if ASSET_ID_SUFFIX.search(lowered):
        return "number | string"
    if lowered == "tags":
        return "string | string[]"
    if NUMBER_SUFFIX.search(lowered):
        return "number"
    if lowered.endswith("type"):
        return "number"
    if lowered.endswith(("list", "arr", "array", "table")):
        return "table"
    if lowered in ("callback", "fn", "func", "cb", "call_back"):
        return "function"
    if lowered in BOOLEAN_NAMES or (BOOLEAN_PREFIX.match(name) and len(name) > 2):
        return "boolean"
    if (lowered.endswith(("name", "str"))
            or lowered in ("text", "msg", "content", "url", "file", "desc")):
        return "string"
    return None


def find_framework_dir() -> Path | None:
    override = os.environ.get("MW_DECOMPILED_DIR")
    candidates = ([Path(override)] if override else []) + list(FRAMEWORK_CANDIDATES)
    for candidate in candidates:
        if (candidate / "services").is_dir():
            return candidate
    return None


def _function_body(text: str, start: int) -> str:
    depth = 0
    index = start
    length = len(text)
    while index < length:
        char = text[index]
        if char == "-" and text.startswith("--", index):
            newline = text.find("\n", index)
            index = length if newline < 0 else newline
            continue
        if char in "\"'":
            quote = char
            index += 1
            while index < length:
                if text[index] == "\\":
                    index += 2
                    continue
                if text[index] == quote:
                    index += 1
                    break
                index += 1
            continue
        if text.startswith("[[", index):
            close = text.find("]]", index + 2)
            index = length if close < 0 else close + 2
            continue
        if char.isalpha() or char == "_":
            end = index
            while end < length and (text[end].isalnum() or text[end] == "_"):
                end += 1
            word = text[index:end]
            if word in ("function", "if", "for", "while", "repeat"):
                depth += 1
            elif word in ("end", "until"):
                depth -= 1
                if depth == 0:
                    return text[start:end]
            index = end
            continue
        index += 1
    return text[start:]


def _iter_words(body: str):
    """Yield (word, index) for code words outside strings and comments."""
    index = 0
    length = len(body)
    while index < length:
        char = body[index]
        if char == "-" and body.startswith("--", index):
            newline = body.find("\n", index)
            index = length if newline < 0 else newline
            continue
        if char in "\"'":
            quote = char
            index += 1
            while index < length:
                if body[index] == "\\":
                    index += 2
                    continue
                if body[index] == quote:
                    index += 1
                    break
                index += 1
            continue
        if body.startswith("[[", index):
            close = body.find("]]", index + 2)
            index = length if close < 0 else close + 2
            continue
        if char.isalpha() or char == "_":
            end = index
            while end < length and (body[end].isalnum() or body[end] == "_"):
                end += 1
            yield body[index:end], index
            index = end
            continue
        index += 1


def _extract_returns(body: str) -> list[str]:
    returns: list[str] = []
    stack: list[str] = []
    for word, index in _iter_words(body):
        if word in ("function", "if", "for", "while", "repeat"):
            stack.append(word)
        elif word in ("end", "until"):
            if stack:
                stack.pop()
        elif word == "return" and stack.count("function") == 1:
            end = index + len("return")
            newline = body.find("\n", end)
            returns.append(body[end:newline if newline >= 0 else len(body)].strip())
    return returns


def _split_top_level(expression: str) -> list[str]:
    parts: list[str] = []
    depth = 0
    current: list[str] = []
    index = 0
    length = len(expression)
    while index < length:
        char = expression[index]
        if char in "\"'":
            quote = char
            current.append(char)
            index += 1
            while index < length:
                current.append(expression[index])
                if expression[index] == "\\" and index + 1 < length:
                    current.append(expression[index + 1])
                    index += 2
                    continue
                if expression[index] == quote:
                    index += 1
                    break
                index += 1
            continue
        if char in "({[":
            depth += 1
        elif char in ")}]":
            depth -= 1
        if char == "," and depth == 0:
            parts.append("".join(current).strip())
            current = []
            index += 1
            continue
        current.append(char)
        index += 1
    tail = "".join(current).strip()
    if tail:
        parts.append(tail)
    return parts


def _join_types(types: set[str]) -> str:
    types = set(types)
    if "Mini.Vec3" in types:
        types.discard("table")
    if "number" in types:
        types.discard("integer")
    return " | ".join(sorted(types, key=lambda t: ORDER.index(t) if t in ORDER else len(ORDER)))


def _split_type(joined: str) -> set[str]:
    return {part.strip() for part in joined.split("|") if part.strip()}


@dataclass
class Inference:
    param_names: list[str]
    param_types: dict[str, str] = field(default_factory=dict)
    optional: list[str] = field(default_factory=list)
    return_type: str | None = None
    returns_list: list[str] = field(default_factory=list)
    defaults: dict[str, str] = field(default_factory=dict)
    enums: dict[str, dict] = field(default_factory=dict)
    bounds: dict[str, str] = field(default_factory=dict)
    delegates: str | None = None

    def to_dict(self) -> dict:
        return {
            "names": self.param_names,
            "params": self.param_types,
            "optional": self.optional,
            "returns": self.return_type,
            "returns_list": self.returns_list,
            "defaults": self.defaults,
            "enums": self.enums,
            "bounds": self.bounds,
            "delegates": self.delegates,
        }


class DecompiledTypes:
    def __init__(self, framework_dir: Path):
        self.framework_dir = framework_dir
        self.services = self._index(framework_dir / "services", lambda receiver: receiver)
        self.triggers = self._index(
            framework_dir / "services" / "trigger",
            lambda receiver: "Trigger" if receiver == "Trigger" else "Trigger." + receiver,
        )
        self._return_cache: dict[tuple[str, str, bool], list[str] | None] = {}

    @staticmethod
    def _index(directory: Path, qualifier) -> dict[tuple[str, str], list[dict]]:
        index: dict[tuple[str, str], list[dict]] = {}
        if not directory.is_dir():
            return index
        for path in sorted(directory.rglob("*.lua")):
            try:
                text = path.read_text(encoding="utf-8", errors="replace")
            except OSError:
                continue
            for match in FUNCTION_HEAD.finditer(text):
                receiver, method, params = match.group(1), match.group(2), match.group(3)
                key = (qualifier(receiver), method)
                index.setdefault(key, []).append({
                    "qualifier": qualifier(receiver),
                    "file": path.name,
                    "line": text.count("\n", 0, match.start()) + 1,
                    "params": [p.strip() for p in params.split(",") if p.strip()],
                    "body": _function_body(text, match.start()),
                })
        return index

    def lookup(self, qualifier: str, method: str, trigger: bool) -> dict | None:
        index = self.triggers if trigger else self.services
        for candidate in (qualifier, *ALIASES.get(qualifier, ())):
            records = index.get((candidate, method))
            if records:
                return records[0]
        records = index.get((qualifier.split(".")[-1], method))
        return records[0] if records else None

    def _resolve_call(self, receiver: str | None, method: str, qualifier: str,
                      trigger: bool) -> tuple[str, str, bool] | None:
        if receiver is None or receiver == "self":
            return (qualifier, method, trigger)
        parts = receiver.split(".")
        if parts[0] in ("ServiceEnv", "Service") and len(parts) == 2:
            return (parts[1], method, False)
        return None

    def _returns_of(self, qualifier: str, method: str, trigger: bool,
                    seen: set[tuple[str, str, bool]]) -> list[str] | None:
        key = (qualifier, method, trigger)
        if key in self._return_cache:
            return self._return_cache[key]
        if key in seen:
            return None
        seen.add(key)
        record = self.lookup(qualifier, method, trigger)
        if record is None:
            return None
        result = self._infer_record(record, qualifier, trigger, seen).returns_list or None
        if result:
            self._return_cache[key] = result
        return result

    def _type_call(self, expression: str, ctx: "Context") -> set[str]:
        match = CALL_EXPR.match(expression.strip())
        if not match:
            return set()
        receiver, method = match.group(1), match.group(2)
        target = self._resolve_call(receiver, method, ctx.qualifier, ctx.trigger)
        if target is None:
            return set()
        resolved = self._returns_of(target[0], target[1], target[2], ctx.seen)
        if not resolved:
            return set()
        types: set[str] = set()
        for part in resolved:
            types |= _split_type(part.rstrip("?"))
        return types

    def _type_expr(self, expression: str, ctx: "Context") -> set[str]:
        value = expression.strip()
        if not value or value == "nil":
            return set()
        if value in ("true", "false"):
            return {"boolean"}
        if re.fullmatch(r"-?\d+", value):
            return {"integer"}
        if re.fullmatch(r"-?\d+\.\d+", value):
            return {"number"}
        if re.fullmatch(r"\"[^\"]*\"|'[^']*'", value):
            return {"string"}
        if value.startswith("{") or value.startswith("setmetatable("):
            return {"table"}
        if value.startswith("#"):
            return {"integer"}
        if value.startswith("not "):
            return {"boolean"}
        if value.startswith("(") and value.endswith(")"):
            return self._type_expr(value[1:-1], ctx)
        if re.search(r"(?:^|[^<>~=])(?:==|~=|<|>|<=|>=)", value):
            return {"boolean"}
        if ".." in value:
            return {"string"}
        if re.fullmatch(r"[\w.]+", value):
            if value in ctx.locals:
                return set(ctx.locals[value])
            if value in ctx.param_types:
                return _split_type(ctx.param_types[value])
            if value.endswith(".new") or re.fullmatch(r"class\.[\w.]+", value):
                return {"table"}
            base = value.split(".")[0]
            if base in ctx.locals:
                return _split_type(ctx.locals[base][0]) if ctx.locals[base] else set()
            return set()
        call_types = self._type_call(value, ctx)
        if call_types:
            return call_types
        method_call = re.search(r"[\w.]*:(\w+)\s*\(", value)
        if method_call:
            target = self._resolve_call(None, method_call.group(1), ctx.qualifier, ctx.trigger)
            if target:
                resolved = self._returns_of(target[0], target[1], target[2], ctx.seen)
                if resolved:
                    types: set[str] = set()
                    for part in resolved:
                        types |= _split_type(part.rstrip("?"))
                    return types
        if re.search(r"[+*/%]|(?<![=\w])-(?![=-])", value):
            return {"number"}
        return set()

    def _collect_returns(self, body: str, ctx: "Context") -> tuple[list[str], bool]:
        statements = _extract_returns(body)
        if not statements:
            return [], False
        largest = max(len(_split_top_level(s)) for s in statements)
        positions: list[set[str]] = [set() for _ in range(largest)]
        unknown = [False] * largest
        short_returns = False
        saw_nil = [False] * largest
        for statement in statements:
            parts = _split_top_level(statement)
            if len(parts) < largest:
                short_returns = True
            for index, part in enumerate(parts):
                if part.strip().startswith("nil"):
                    saw_nil[index] = True
                    continue
                inferred = self._type_expr(part, ctx)
                if not inferred:
                    unknown[index] = True
                positions[index] |= inferred
        if any(unknown):
            return [], False
        results: list[str] = []
        for index, types in enumerate(positions):
            optional = saw_nil[index] or (short_returns and index > 0)
            if not types:
                if optional:
                    continue
                results.append("any")
                continue
            joined = _join_types(types)
            results.append(joined + "?" if optional else joined)
        return results, short_returns

    def infer(self, record: dict, qualifier: str | None = None,
              trigger: bool = False, seen: set | None = None) -> Inference:
        if qualifier is None:
            qualifier = record.get("qualifier") or ""
        
        return self._infer_record(record, qualifier, trigger, seen or set())

    def _infer_record(self, record: dict, qualifier: str, trigger: bool,
                      seen: set) -> Inference:
        body = record["body"]
        params = record["params"]
        types: dict[str, set[str]] = defaultdict(set)
        required: set[str] = set()
        optional: set[str] = set()
        defaults: dict[str, str] = {}
        enums: dict[str, dict] = {}
        bounds: dict[str, str] = {}

        def add_type(name: str, value: str) -> None:
            if name in params:
                types[name].update(_split_type(value))

        for match in IS_TYPE_ERROR.finditer(body):
            mapped = TYPE_MAP.get(match.group(1))
            if not mapped:
                continue
            for name in (x.strip() for x in match.group(2).split(",")):
                if name in params:
                    types[name].add(mapped)
                    required.add(name)

        for match in TYPE_NOT_EQUAL.finditer(body):
            mapped = TYPE_MAP.get(match.group(2))
            if mapped:
                add_type(match.group(1), mapped)

        for match in TYPE_EQUAL.finditer(body):
            mapped = TYPE_MAP.get(match.group(2))
            if mapped:
                add_type(match.group(1), mapped)

        for match in DEFAULT_OR.finditer(body):
            name, value = match.group(1), match.group(2).strip()
            if name in params:
                defaults.setdefault(name, value)
                self._type_default(name, value, types)
        for match in DEFAULT_NIL.finditer(body):
            name, value = match.group(1), match.group(2).strip()
            if name in params:
                defaults.setdefault(name, value)
                self._type_default(name, value, types)
        for match in DEFAULT_TYPE.finditer(body):
            name, declared, value = match.group(1), match.group(2), match.group(3).strip()
            if name in params:
                defaults.setdefault(name, value)
                mapped = TYPE_MAP.get(declared)
                if mapped:
                    types[name].add(mapped)
                self._type_default(name, value, types)

        for match in ENUM_COMPARE.finditer(body):
            name, reference = match.group(1), match.group(2)
            if name not in params:
                continue
            parts = reference.split(".")
            if len(parts) < 3:
                continue
            enum_type, value = ".".join(parts[:2]), parts[2]
            bucket = enums.setdefault(name, {"type": enum_type, "values": []})
            if value not in bucket["values"]:
                bucket["values"].append(value)
            types[name].discard("string")
            types[name].add("number")

        for match in BOUND.finditer(body):
            name, operator, value = match.group(1), match.group(2), match.group(3)
            if name in params and name not in bounds:
                bounds[name] = f"{operator} {value}"
                types[name].update({"number"})

        for name in params:
            if (re.search(r"\b" + re.escape(name) + r"\.x\b", body)
                    and re.search(r"\b" + re.escape(name) + r"\.y\b", body)
                    and re.search(r"\b" + re.escape(name) + r"\.z\b", body)):
                types[name].discard("table")
                types[name].add("Mini.Vec3")
            if (re.search(r"\bfor\s+\w+\s*=\s*[^,]+,\s*" + re.escape(name) + r"\b", body)
                    or re.search(r"\bmath\.\w+\(\s*" + re.escape(name) + r"\s*\)", body)):
                types[name].add("number")
            if re.search(r"\b(?:pairs|ipairs)\(\s*" + re.escape(name) + r"\s*\)", body):
                types[name].add("table")
            if re.search(r"\b" + re.escape(name)
                         + r":(?:sub|find|gsub|match|lower|upper|len|byte|char|format|rep)\b", body):
                types[name].add("string")
            if re.search(r"\bDoObjOrArrayAction\(\s*" + re.escape(name) + r"\s*,", body):
                types[name].add("integer | integer[]")
            if (re.search(r"\bif\s+not\s+" + re.escape(name) + r"\b", body)
                    or re.search(r"\bif\s+" + re.escape(name) + r"\s*==\s*nil\b", body)
                    or re.search(r"\b" + re.escape(name) + r"\s*=\s*" + re.escape(name) + r"\s+or\b", body)
                    or name in defaults):
                optional.add(name)

        local_types = self._infer_locals(types, body)
        ctx = Context(qualifier=qualifier, trigger=trigger,
                      param_types=joined_types(types), locals=local_types, seen=set(seen))

        returns_list, _ = self._collect_returns(body, ctx)
        optional = {name for name in optional if name not in required}
        delegates = self._delegate_target(body)

        return Inference(
            param_names=params,
            param_types=joined_types(types),
            optional=sorted(optional),
            return_type=returns_list[0] if len(returns_list) == 1 else (
                ", ".join(returns_list) if returns_list else None),
            returns_list=returns_list,
            defaults=defaults,
            enums=enums,
            bounds=bounds,
            delegates=delegates,
        )

    def _type_default(self, name: str, value: str, types: dict[str, set[str]]) -> None:
        if re.fullmatch(r"-?\d+(?:\.\d+)?", value):
            types[name].add("number")
        elif value in ("true", "false"):
            types[name].add("boolean")
        elif value.startswith(("\"", "'")):
            types[name].add("string")
        elif value.startswith("{"):
            types[name].add("table")

    def _infer_locals(self, param_types_map: dict[str, set[str]],
                      body: str) -> dict[str, list[str]]:
        known = joined_types(param_types_map)
        local_exprs: dict[str, str] = {}
        for line in body.splitlines():
            stripped = line.strip()
            match = LOCAL_ASSIGN.match(stripped) or PLAIN_ASSIGN.match(stripped)
            if not match:
                continue
            names = [n.strip() for n in match.group(1).split(",") if n.strip()]
            if len(names) != 1 or any(" " in n for n in names):
                continue
            expression = match.group(2).strip()
            if re.search(r"\b(?:and|or)\b", expression):
                continue
            local_exprs[names[0]] = expression
        locals_: dict[str, list[str]] = {}
        for name, expression in local_exprs.items():
            if re.fullmatch(r"-?\d+", expression):
                locals_[name] = ["integer"]
            elif expression in ("true", "false"):
                locals_[name] = ["boolean"]
            elif re.fullmatch(r"\"[^\"]*\"|'[^']*'", expression):
                locals_[name] = ["string"]
            elif expression.startswith("{"):
                locals_[name] = ["table"]
            elif name in known:
                locals_[name] = [known[name]]
        return locals_

    def _delegate_target(self, body: str) -> str | None:
        calls = re.findall(r"\b(?:return\s+)?(ServiceEnv|Service)\.(\w+):(\w+)\(", body)
        if not calls:
            return None
        return f"{calls[0][0]}.{calls[0][1]}:{calls[0][2]}"

    def dump(self) -> dict:
        def dump_index(index: dict[tuple[str, str], list[dict]],
                       trigger: bool) -> dict[str, dict]:
            entries: dict[str, dict] = {}
            for (qualifier, method), records in sorted(index.items()):
                inference = self._infer_record(records[0], qualifier, trigger, set())
                if (not inference.param_types and not not inference.returns_list
                        and not inference.optional and not inference.defaults
                        and not inference.enums):
                    continue
                entries[f"{qualifier}:{method}"] = inference.to_dict()
            return entries

        return {
            "version": 2,
            "source": str(self.framework_dir),
            "service": dump_index(self.services, False),
            "trigger": dump_index(self.triggers, True),
        }


@dataclass
class Context:
    qualifier: str
    trigger: bool
    param_types: dict[str, str]
    locals: dict[str, list[str]]
    seen: set


def joined_types(types: dict[str, set[str]]) -> dict[str, str]:
    return {name: _join_types(values) for name, values in types.items() if values}


def load_cache(path: Path) -> dict:
    if not path.exists():
        return {}
    return json.loads(path.read_text(encoding="utf-8"))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--decompiled", type=Path, default=None)
    parser.add_argument("--stats", action="store_true", help="print inference coverage")
    parser.add_argument("--dump-cache", type=Path, default=None)
    args = parser.parse_args()

    framework = args.decompiled or find_framework_dir()
    if framework is None or not (framework / "services").is_dir():
        print(f"decompiled framework not found (tried {FRAMEWORK_CANDIDATES})", file=sys.stderr)
        return 1

    decompiled = DecompiledTypes(framework)
    data = decompiled.dump()

    if args.dump_cache:
        args.dump_cache.parent.mkdir(parents=True, exist_ok=True)
        args.dump_cache.write_text(json.dumps(data, ensure_ascii=False, indent=1) + "\n",
                                   encoding="utf-8")
        print(f"cache written: {args.dump_cache}")

    if args.stats or not args.dump_cache:
        for lane in ("service", "trigger"):
            entries = data[lane]
            params = sum(len(v["params"]) for v in entries.values())
            optional = sum(len(v["optional"]) for v in entries.values())
            returns = sum(1 for v in entries.values() if v.get("returns_list"))
            multi = sum(1 for v in entries.values() if len(v.get("returns_list") or []) > 1)
            defaults = sum(len(v.get("defaults") or {}) for v in entries.values())
            enums = sum(len(v.get("enums") or {}) for v in entries.values())
            print(f"{lane}: functions={len(entries)} typed_params={params} "
                  f"optional={optional} return_types={returns} multi_returns={multi} "
                  f"defaults={defaults} enums={enums}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
