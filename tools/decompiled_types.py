#!/usr/bin/env python3
"""Infer Mini World API parameter/return types from decompiled framework Lua.

The environment table gives parameter names but not types. The decompiled
services carry explicit guards (`isTypeError("number", hp)`,
`type(pos) ~= "table"`), vector field access (`pos.x/y/z`), default values and
return literals, which are enough to type a large share of the optional lanes.

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
         "string", "boolean", "table", "function", "userdata"]

ALIASES = {
    "GameRule": ("GameRules",),
    "Player": ("Actor",),
    "Monster": ("Actor",),
    "Trigger.Player": ("Trigger.Actor",),
    "Trigger.Monster": ("Trigger.Actor",),
    "GameRules": ("GameRule",),
}

FUNCTION_HEAD = re.compile(r"^function\s+([A-Za-z_][\w.]*):(\w+)\s*\(([^)]*)\)", re.M)
IS_TYPE_ERROR = re.compile(r"(?:_G\.)?isTypeError\(\s*\"(\w+)\"\s*,([^)]*)\)")
TYPE_NOT_EQUAL = re.compile(r"type\(\s*(\w+)\s*\)\s*~=\s*\"(\w+)\"")
TYPE_EQUAL = re.compile(r"type\(\s*(\w+)\s*\)\s*==\s*\"(\w+)\"")


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


def _extract_returns(body: str) -> list[str]:
    returns: list[str] = []
    stack: list[str] = []
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
            word = body[index:end]
            if word in ("function", "if", "for", "while", "repeat"):
                stack.append(word)
            elif word in ("end", "until"):
                if stack:
                    stack.pop()
            elif word == "return" and stack.count("function") == 1:
                newline = body.find("\n", end)
                returns.append(body[end:newline if newline >= 0 else length].strip())
            index = end
            continue
        index += 1
    return returns


def _join_types(types: set[str]) -> str:
    types = set(types)
    if "Mini.Vec3" in types:
        types.discard("table")
    if "number" in types:
        types.discard("integer")
    return " | ".join(sorted(types, key=lambda t: ORDER.index(t) if t in ORDER else len(ORDER)))


def _return_type(expressions: list[str], param_types: dict[str, str],
                 bool_locals: set[str]) -> str | None:
    found: set[str] = set()
    has_nil = False
    for expr in expressions:
        value = expr.strip().rstrip(",")
        if not value:
            continue
        if value.startswith("nil"):
            has_nil = True
        elif value in ("true", "false"):
            found.add("boolean")
        elif re.fullmatch(r"-?\d+(\.\d+)?", value):
            found.add("number")
        elif re.fullmatch(r"\"[^\"]*\"|'[^']*'", value):
            found.add("string")
        elif value.startswith("{"):
            found.add("table")
        elif value in bool_locals:
            found.add("boolean")
        elif value in param_types:
            for part in param_types[value].split(" | "):
                found.add(part)
    if not found:
        return None
    if len(found) > 1 and found != {"number", "integer"}:
        return None
    base = _join_types(found)
    return base + "?" if has_nil else base


@dataclass
class Inference:
    param_names: list[str]
    param_types: dict[str, str] = field(default_factory=dict)
    optional: list[str] = field(default_factory=list)
    return_type: str | None = None

    def to_dict(self) -> dict:
        return {
            "names": self.param_names,
            "params": self.param_types,
            "optional": self.optional,
            "returns": self.return_type,
        }


class DecompiledTypes:
    def __init__(self, framework_dir: Path):
        self.framework_dir = framework_dir
        self.services = self._index(framework_dir / "services", lambda receiver: receiver)
        self.triggers = self._index(
            framework_dir / "services" / "trigger",
            lambda receiver: "Trigger" if receiver == "Trigger" else "Trigger." + receiver,
        )

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

    def infer(self, record: dict) -> Inference:
        body = record["body"]
        params = record["params"]
        types: dict[str, set[str]] = defaultdict(set)
        required: set[str] = set()
        optional: set[str] = set()

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
            if mapped and match.group(1) in params:
                types[match.group(1)].add(mapped)

        for match in TYPE_EQUAL.finditer(body):
            mapped = TYPE_MAP.get(match.group(2))
            if mapped and match.group(1) in params:
                types[match.group(1)].add(mapped)

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
            default = re.search(r"\b" + re.escape(name) + r"\s*=\s*" + re.escape(name)
                                + r"\s+or\s+(\S+)", body)
            if not default:
                default = re.search(r"if\s+" + re.escape(name) + r"\s*==\s*nil\s+then\s+"
                                    + re.escape(name) + r"\s*=\s*(\S+)", body)
            if default:
                value = default.group(1)
                if re.fullmatch(r"-?\d+(\.\d+)?", value):
                    types[name].add("number")
                elif value in ("true", "false"):
                    types[name].add("boolean")
                elif value.startswith(("\"", "'")):
                    types[name].add("string")
                elif value.startswith("{"):
                    types[name].add("table")
            if (re.search(r"\bif\s+not\s+" + re.escape(name) + r"\b", body)
                    or re.search(r"\bif\s+" + re.escape(name) + r"\s*==\s*nil\b", body)
                    or re.search(r"\b" + re.escape(name) + r"\s*=\s*" + re.escape(name) + r"\s+or\b", body)):
                optional.add(name)

        optional = {name for name in optional if name not in required}

        return_lines = _extract_returns(body)
        bool_locals = set(re.findall(r"\b(\w+)\s*=\s*(?:true|false)\b", body))
        param_types = {name: _join_types(values) for name, values in types.items() if values}
        return Inference(
            param_names=params,
            param_types=param_types,
            optional=sorted(optional),
            return_type=_return_type(return_lines, param_types, bool_locals),
        )

    def dump(self) -> dict:
        def dump_index(index: dict[tuple[str, str], list[dict]]) -> dict[str, dict]:
            entries: dict[str, dict] = {}
            for (qualifier, method), records in sorted(index.items()):
                inference = self.infer(records[0])
                if not inference.param_types and not inference.return_type and not inference.optional:
                    continue
                entries[f"{qualifier}:{method}"] = inference.to_dict()
            return entries

        return {
            "version": 1,
            "source": str(self.framework_dir),
            "service": dump_index(self.services),
            "trigger": dump_index(self.triggers),
        }


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
        args.dump_cache.write_text(json.dumps(data, ensure_ascii=False, indent=1) + "\n", encoding="utf-8")
        print(f"cache written: {args.dump_cache}")

    if args.stats or not args.dump_cache:
        for lane in ("service", "trigger"):
            entries = data[lane]
            params = sum(len(v["params"]) for v in entries.values())
            optional = sum(len(v["optional"]) for v in entries.values())
            returns = sum(1 for v in entries.values() if v.get("returns"))
            print(f"{lane}: functions={len(entries)} typed_params={params} "
                  f"optional={optional} return_types={returns}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
