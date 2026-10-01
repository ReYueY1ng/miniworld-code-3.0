"""Reader for Mini World UGC environment exports.

Two on-disk shapes are supported and both parse into the same in-memory tree:

``mwenviron/1`` (current)
    Produced by ``miniworld-scripts/3.0/environments/dump_env.lua``.  Valid Lua:
    a chunk that ``return``s one table.  Keys are sorted, memory addresses are
    gone, a repeated table is emitted once and back-referenced.

``legacy`` (the old ``ugcscriptenv.txt`` / ``ugcofficialenv.txt``)
    Emitted by ``threadpool.env.dumptable``.  Not valid Lua - it carries raw
    ``table: 0x...`` addresses, unsorted ``pairs()`` order and dangling
    reference lines.  Still readable so old dumps diff against new ones.

Format conventions recognised here:

===================  =========================================================
``["$meta"]``        metatable of the enclosing table
``["$ref"]``         array of keys locating a table emitted elsewhere
``["$userdata"]``    placeholder for a userdata/thread value
``["$truncated"]``   depth cap reached, the body was dropped
``["$$foo"]``        a real ``$foo`` key (one ``$`` is the escape)
===================  =========================================================
"""

from __future__ import annotations

import os
import re
from dataclasses import dataclass, field as dc_field
from pathlib import Path
from typing import Any

FORMAT_ID = "mwenviron/1"
LEGACY_FORMAT_ID = "legacy-dumptable"
LEGACY_FACE_NAMES = {"script": "dev", "official": "official", "motion": "motion"}

DEFAULT_ENV_DIR = Path("/home/yuey1ng/mini/miniworld-scripts/3.0/environments")
FACE_FILENAMES = {
    "dev": ("devenv.lua", "ugcscriptenv.txt"),
    "official": ("officialenv.lua", "ugcofficialenv.txt"),
    "motion": ("motionenv.lua",),
    "mgr": ("mgrenv.lua",),
}


def env_dir() -> Path:
    return Path(os.environ.get("MW_ENV_DIR", DEFAULT_ENV_DIR))

def face_path(face: str) -> Path | None:
    """Locate an exported face, preferring the new format over a legacy file."""
    d = env_dir()
    for name in FACE_FILENAMES.get(face, (f"{face}env.lua",)):
        candidate = d / name
        if candidate.exists():
            return candidate
    return None


def canonical_name(path: Path) -> str:
    """Map a legacy file name onto the name the current dumper writes."""
    for face, names in FACE_FILENAMES.items():
        if path.name in names[1:]:
            return names[0]
    return path.with_suffix(".lua").name

RESERVED_META = "$meta"
RESERVED_REF = "$ref"
RESERVED_USERDATA = "$userdata"
RESERVED_TRUNCATED = "$truncated"

INTERNAL_KEYS = frozenset(
    {"__metatableX", "__metatable", "__index", "__newindex", "__className_", "__call", "__info"}
)


class EnvParseError(ValueError):
    """Raised when a dump cannot be read."""


@dataclass(eq=False)
class Table:
    """A Lua table.  ``eq=False`` keeps instances hashable by identity, which is
    what Lua table keys need."""

    fields: dict[Any, Any] = dc_field(default_factory=dict)
    meta: Any = None
    ref: list | None = None
    addr: str | None = None
    userdata: str | None = None
    truncated: bool = False

    def get(self, key: Any, default: Any = None) -> Any:
        return self.fields.get(key, default)

    def __contains__(self, key: Any) -> bool:
        return key in self.fields

    def __len__(self) -> int:
        return len(self.fields)


@dataclass(eq=False)
class Func:
    """A Lua function value.  Only its signature and annotations survive
    serialisation; ``annotations`` is rebuilt from the typed fields so the two
    can never drift apart."""

    params: list[str] = dc_field(default_factory=list)
    source: str | None = None
    service: str | None = None
    mtype: str | None = None
    rtypes: dict[str, str] = dc_field(default_factory=dict)
    native: str | None = None
    unresolved: str | None = None
    extra: list[str] = dc_field(default_factory=list)

    @property
    def signature(self) -> str:
        return f"function({', '.join(self.params)}) end"

    @property
    def is_unresolved(self) -> bool:
        return self.unresolved is not None

    @property
    def annotations(self) -> list[str]:
        out: list[str] = []
        if self.source:
            out.append(f"@{self.source}")
        if self.service:
            out.append(f"@service {self.service}")
        if self.mtype:
            out.append(f"@mtype {self.mtype}")
        for name, value in self.rtypes.items():
            out.append(f"@rtype {name}={value}")
        if self.unresolved is not None:
            out.append(f"@unresolved {self.unresolved}".rstrip())
        if self.native:
            out.append(f"@{self.native}")
        out.extend(self.extra)
        return out

    @classmethod
    def from_annotations(cls, params: list[str], annotations: list[str]) -> "Func":
        fn = cls(params=list(params))
        for raw in annotations:
            for piece in raw.split(";"):
                piece = piece.strip()
                if piece:
                    fn._absorb(piece)
        return fn

    def _absorb(self, piece: str) -> None:
        body = piece[1:] if piece.startswith("@") else piece
        if body in ("C", "builtin"):
            self.native = body
            return
        # legacy threadpool.env.dumptable markers, written as whole sentences
        if body.startswith("C function"):
            self.native = "C"
            return
        if body.startswith("Builtin function"):
            self.native = "builtin"
            return
        if body.startswith("Failed to get args"):
            self.unresolved = ""
            return

        key, _, value = body.partition(" ")
        value = value.strip()
        if key == "unresolved":
            self.unresolved = value
        elif key == "service":
            self.service = value or None
        elif key == "mtype":
            self.mtype = value or None
        elif key == "rtype":
            name, _, rendered = value.partition("=")
            if name:
                self.rtypes[name] = rendered
        elif body:
            self.source = body


@dataclass(eq=False)
class Userdata:
    """Placeholder for a value that could not be reconstructed."""

    text: str = ""


@dataclass
class Header:
    format: str = LEGACY_FORMAT_ID
    generator: str = ""
    face: str = ""
    game: str = ""
    generated: str = ""
    stats: dict[str, Any] = dc_field(default_factory=dict)


_TOKEN_RE = re.compile(
    r"""
      (?P<ws>[ \t\r]+)
    | (?P<nl>\n)
    | (?P<lcomment>--\[\[.*?\]\])
    | (?P<comment>--[^\n]*)
    | (?P<addr>0x[0-9a-fA-F]+)
    | (?P<dots>\.\.\.)
    | (?P<number>-?\d+\.\d+(?:[eE][-+]?\d+)?|-?\d+)
    | (?P<string>"(?:\\.|[^"\\])*")
    | (?P<name>[A-Za-z_][A-Za-z0-9_]*)
    | (?P<punct>[{}\[\](),;=:./])
    | (?P<other>.)
    """,
    re.VERBOSE | re.DOTALL,
)

_ESCAPES = {"n": "\n", "r": "\r", "t": "\t", "0": "\0", "\\": "\\", '"': '"', "'": "'"}
_ANNOTATION_RE = re.compile(r"^\s*--\[\[(.*?)\]\]\s*$", re.DOTALL)


def _strip_annotation(comment: str) -> str | None:
    m = _ANNOTATION_RE.match(comment)
    if m is not None:
        body = m.group(1).strip()
        return body or None
    if comment.startswith("--"):
        body = comment[2:].strip()
        return body or None
    return None


def _unquote(token: str) -> str:
    body = token[1:-1]
    out: list[str] = []
    i = 0
    while i < len(body):
        ch = body[i]
        if ch != "\\":
            out.append(ch)
            i += 1
            continue
        nxt = body[i + 1] if i + 1 < len(body) else ""
        if nxt.isdigit():
            digits = body[i + 1:i + 4]
            out.append(chr(int(digits, 10)))
            i += 1 + len(digits)
        else:
            out.append(_ESCAPES.get(nxt, nxt))
            i += 2
    return "".join(out)


@dataclass
class _Token:
    kind: str
    value: str
    line: int
    trailing: list[str] = dc_field(default_factory=list)


def _strip_bom(text: str) -> str:
    return text[1:] if text.startswith("\ufeff") else text


def _scan(text: str) -> list[_Token]:
    """Split ``text`` into significant tokens, folding each run of comments that
    ends a line into ``trailing`` on the token that line last produced."""
    text = _strip_bom(text)
    significant: list[_Token] = []
    pending: list[str] = []
    line = 1
    pos = 0
    end = len(text)

    def flush() -> None:
        if pending and significant:
            for raw in pending:
                note = _strip_annotation(raw)
                if note:
                    significant[-1].trailing.append(note)
        pending.clear()

    while pos < end:
        m = _TOKEN_RE.match(text, pos)
        if m is None:
            raise EnvParseError(f"cannot tokenise at offset {pos}: {text[pos:pos+40]!r}")
        pos = m.end()
        kind = m.lastgroup or "other"
        value = m.group()
        if kind == "ws":
            continue
        if kind == "nl":
            flush()
            line += value.count("\n")
            continue
        if kind in ("comment", "lcomment"):
            pending.append(value)
            line += value.count("\n")
            continue
        flush()
        significant.append(_Token(kind, value, line))

    flush()
    significant.append(_Token("eof", "", line))
    return significant


class _Parser:
    def __init__(self, text: str, source: str = "<string>", names: dict | None = None):
        self.source = source
        self.tokens = _scan(text)
        self.i = 0
        self.last: _Token = self.tokens[0]
        self.names: dict = names if names is not None else {}
        self.allow_names = names is not None

    def _take(self) -> _Token:
        tok = self.tokens[self.i]
        if tok.kind != "eof":
            self.i += 1
        self.last = tok
        return tok

    def _peek(self) -> _Token:
        return self.tokens[self.i]

    def _fail(self, tok: _Token, what: str) -> EnvParseError:
        return EnvParseError(f"{self.source}:{tok.line}: expected {what}, got {tok.kind} {tok.value!r}")

    def skip_to_return(self) -> None:
        while True:
            tok = self._take()
            if tok.kind == "eof":
                raise EnvParseError(f"{self.source}: no trailing `return` statement found")
            if tok.kind == "name" and tok.value == "return":
                return

    def parse_value(self) -> Any:
        tok = self._take()
        if tok.kind == "name":
            if tok.value == "nil":
                return None
            if tok.value == "true":
                return True
            if tok.value == "false":
                return False
            if tok.value == "function":
                return self.parse_function()
            if tok.value == "table":
                return self.parse_legacy_table()
            if self.allow_names and tok.value in self.names:
                return self._resolve_name(tok.value)
            if tok.value in ("inf", "nan"):
                return float(tok.value)
            raise self._fail(tok, "a value")
        if tok.kind == "string":
            return _unquote(tok.value)
        if tok.kind in ("number", "addr"):
            value = self._number(tok)
            if tok.kind == "number" and self._peek().kind == "punct" and self._peek().value == "/":
                self._take()
                divisor_tok = self._take()
                if divisor_tok.kind == "number":
                    divisor = self._number(divisor_tok)
                    if divisor == 0:
                        return float("inf") if value > 0 else float("-inf")
                    return value / divisor
            return value
        if tok.kind == "punct" and tok.value == "{":
            return self.parse_table()
        if tok.kind == "punct" and tok.value == "-":
            value = self.parse_value()
            return -value if isinstance(value, (int, float)) else value
        raise self._fail(tok, "a value")

    def parse_chunk(self) -> Any:
        tok = self._peek()
        if tok.kind == "name" and tok.value == "return":
            self._take()
        elif not (tok.kind == "punct" and tok.value == "{"):
            self.skip_to_return()
        return self.parse_value()

    @staticmethod
    def _number(tok: _Token) -> Any:
        raw = tok.value
        if raw.startswith("0x"):
            return int(raw, 16)
        if "." in raw or "e" in raw or "E" in raw:
            return float(raw)
        return int(raw)

    def parse_function(self) -> Func:
        tok = self._take()
        if not (tok.kind == "punct" and tok.value == "("):
            raise self._fail(tok, "'(' after function")
        params: list[str] = []
        while True:
            tok = self._take()
            if tok.kind == "punct" and tok.value == ")":
                break
            if tok.kind == "punct" and tok.value == ",":
                continue
            if tok.value == "...":
                params.append("...")
                continue
            if tok.kind == "name":
                params.append(tok.value)
                continue
            raise self._fail(tok, "a parameter name")
        tok = self._take()
        if not (tok.kind == "name" and tok.value == "end"):
            raise self._fail(tok, "'end' closing the function stub")
        return Func.from_annotations(params, tok.trailing)

    def parse_legacy_table(self) -> Table:
        """Reads ``table: 0xADDR { ... }`` and the dangling ``table: 0xADDR ,``."""
        tok = self._take()
        if not (tok.kind == "punct" and tok.value == ":"):
            raise self._fail(tok, "':' after `table`")
        addr = self._take()
        if addr.kind != "addr":
            raise self._fail(addr, "an address")
        if self._peek().kind == "punct" and self._peek().value == "{":
            self._take()
            node = self.parse_table()
            node.addr = addr.value
            return node
        return Table(ref=[addr.value])

    def _resolve_name(self, name: str) -> Any:
        """Resolve a qualified ``DevApiMType.Normal`` or a bare ``DevApiMType``
        against the namespace built so far."""
        if self._peek().kind == "punct" and self._peek().value == ".":
            self._take()
            member = self._take()
            head = self.names.get(name)
            if isinstance(head, Table) and member.kind == "name":
                return head.fields.get(member.value)
            return None
        return self.names.get(name)

    def parse_table(self) -> Table:
        node = Table()
        auto = 0
        while True:
            tok = self._peek()
            if tok.kind == "eof":
                return node
            if tok.kind == "punct" and tok.value == "}":
                self._take()
                return node
            if tok.kind == "punct" and tok.value == ",":
                self._take()
                continue

            keyed = False
            key: Any = None
            nxt = self.tokens[min(self.i + 1, len(self.tokens) - 1)]

            if tok.kind == "punct" and tok.value == "[":
                keyed = True
                self._take()
                key = self.parse_value()
                closing = self._take()
                if not (closing.kind == "punct" and closing.value == "]"):
                    raise self._fail(closing, "']' closing a key")
            elif nxt.kind == "punct" and nxt.value == "=" and tok.kind in ("string", "name", "number", "addr"):
                keyed = True
                self._take()
                if tok.kind == "string":
                    key = _unquote(tok.value)
                elif tok.kind == "name":
                    key = tok.value
                else:
                    key = self._number(tok)

            if keyed:
                eq = self._take()
                if not (eq.kind == "punct" and eq.value == "="):
                    raise self._fail(eq, "'=' after a table key")

            value = self.parse_value()
            notes = list(self.last.trailing)

            nxt = self._peek()
            if nxt.kind == "punct" and nxt.value == ",":
                self._take()
                notes += nxt.trailing

            if not keyed:
                auto += 1
                key = auto
            if isinstance(value, Func) and notes:
                merged = list(value.annotations)
                for note in notes:
                    if note not in merged:
                        merged.append(note)
                value = Func.from_annotations(value.params, merged)
            self._store(node, key, value)

    def _store(self, node: Table, key: Any, value: Any) -> None:
        if key == "__metatableX":
            node.meta = value
            return
        if isinstance(key, str) and key.startswith("$"):
            if key == RESERVED_META:
                node.meta = value
                return
            if key == RESERVED_REF:
                if isinstance(value, Table) and value.ref is not None:
                    node.ref = value.ref
                elif isinstance(value, Table):
                    node.ref = list(value.fields.values())
                else:
                    node.ref = [value]
                return
            if key == RESERVED_USERDATA:
                node.userdata = value if isinstance(value, str) else str(value)
                return
            if key == RESERVED_TRUNCATED:
                node.truncated = True
                return
            node.fields[key[1:]] = value
            return
        node.fields[key] = value


def annotate_functions(root: Any, meta: "ApiMeta | None") -> int:
    """Stamp ``mtype`` / ``rtypes`` onto every service wrapper in a tree.

    A function's service is taken from its ``@service`` annotation when it has
    one, otherwise from the tree path (``env.Player.GetHostUin`` ->
    ``Player.GetHostUin``), which is what makes a legacy dump annotatable.
    Candidates are filtered through the config, so non-service tables such as
    ``Mini`` or ``math`` are left alone.  Methods the config does not list default
    to ``Normal``, mirroring ``ScriptEnvMgr:LoadServicesApi``.
    """
    if meta is None:
        return 0
    stamped = 0
    addrs = address_map(root)
    visited: set = set()

    def stamp(fn: Func, candidate: str | None) -> None:
        nonlocal stamped
        if fn.mtype:
            return
        if not fn.params or fn.params[0] == "...":
            # A method the running account is not whitelisted for is replaced by
            # `function(...) ShowGameTips('权限不足') return false end`, which is not a
            # service wrapper and must not inherit the config's types.
            return
        for name in (fn.service, fn.unresolved or None, candidate):
            if not name:
                continue
            info = meta.flat.get(name)
            if info is not None:
                fn.mtype = info.mtype
                fn.rtypes = dict(info.rtypes)
                stamped += 1
                return
            service, _, _ = name.rpartition(".")
            if service in meta.services:
                fn.mtype = "Normal"
                stamped += 1
                return

    def walk(node: Table, prefix: str) -> None:
        if node in visited:
            return
        visited.add(node)
        for key in sorted_keys(node):
            value = node.fields[key]
            if isinstance(value, Table) and value.ref is not None:
                continue
            name = f"{prefix}.{key}" if prefix else str(key)
            resolved = deref(root, value, addrs)
            if isinstance(resolved, Func):
                stamp(resolved, name)
            elif isinstance(resolved, Table) and isinstance(key, str):
                walk(resolved, name)

    env = main_index(root)
    if isinstance(env, Table):
        walk(env, "")
    return stamped


def load_devapicfg(path: str | Path) -> "ApiMeta":
    """Read the engine's ``DevApiCfg.lua`` into the same flat map dump_env.lua
    builds at runtime, so an export made before that existed can be enriched."""
    p = Path(path)
    return parse_devapicfg(p.read_text(encoding="utf-8", errors="replace"), source=p.name)


def parse_devapicfg(text: str, source: str = "<string>") -> "ApiMeta":
    globals_ = parse_lua_globals(text, source)
    mtype_names = _reverse(globals_.get("DevApiMType"), M_TYPE_NAMES)
    rtype_names = _reverse(globals_.get("DevApiRType"), R_TYPE_NAMES)

    flat: dict[str, ApiMethod] = {}
    services: set[str] = set()
    cfg = globals_.get("DevApiCfg")
    roots = cfg.fields.get("services") if isinstance(cfg, Table) else None

    def collect(prefix: str, node: Any) -> None:
        if not isinstance(node, Table):
            return
        if prefix:
            services.add(prefix)
        methods = node.fields.get("methods")
        if isinstance(methods, Table):
            for index in sorted_keys(methods):
                entry = methods.fields[index]
                name, mtype, rtypes = None, 0, None
                if isinstance(entry, str):
                    name = entry
                elif isinstance(entry, Table):
                    name = entry.fields.get(1)
                    raw = entry.fields.get(2)
                    mtype = raw if isinstance(raw, int) and not isinstance(raw, bool) else 0
                    rtypes = entry.fields.get(3)
                if not isinstance(name, str) or not prefix:
                    continue
                info = ApiMethod(mtype=mtype_names.get(mtype, f"MType{mtype}"))
                if isinstance(rtypes, Table):
                    for itype in sorted_keys(rtypes):
                        label = rtype_names.get(itype, f"RType{itype}")
                        info.rtypes[label] = lua_value_text(rtypes.fields[itype])
                flat[f"{prefix}.{name}"] = info
        items = node.fields.get("items")
        if isinstance(items, Table):
            for sub in sorted_keys(items):
                collect(f"{prefix}.{sub}" if prefix else str(sub), items.fields[sub])

    if isinstance(roots, Table):
        for service in sorted_keys(roots):
            collect(str(service), roots.fields[service])
    return ApiMeta(flat=flat, services=services)


def _reverse(live: Any, fallback: dict[int, str]) -> dict[int, str]:
    out = dict(fallback)
    if isinstance(live, Table):
        for name, value in live.fields.items():
            if isinstance(value, int) and not isinstance(value, bool) and isinstance(name, str):
                out[value] = name
    return out


M_TYPE_NAMES = {
    0: "Normal", 1: "Block", 2: "NoBlock", 3: "Sync", 4: "SyncPack",
    5: "ClientData", 6: "ReportHost", 7: "HostAndClient", 8: "BoardCast", 9: "Mod",
}
R_TYPE_NAMES = {
    2: "Uin_TimeLimit", 3: "WhiteList", 4: "TimeLimit",
    5: "CompareParam", 6: "ResetCompareParam", 7: "ResendMsg",
}


def parse_lua_globals(text: str, source: str = "<string>") -> dict[str, Any]:
    """Parse a Lua data file made of ``Name = <constant>`` statements, resolving
    references to names defined earlier in the same file.  ``Name.Field = ...``
    assignments extend an already-defined table."""
    names: dict[str, Any] = {}
    parser = _Parser(text, source, names=names)
    while True:
        tok = parser._peek()
        if tok.kind == "eof":
            return names
        if tok.kind != "name":
            raise parser._fail(tok, "an assignment name")
        parser._take()

        target: Any = None
        if parser._peek().kind == "punct" and parser._peek().value == ".":
            parser._take()
            member = parser._take()
            if member.kind != "name":
                raise parser._fail(member, "a field name")
            target = names.get(tok.value)
            if not isinstance(target, Table):
                raise parser._fail(member, f"a table already defined as {tok.value}")
            member_name = member.value

        eq = parser._take()
        if not (eq.kind == "punct" and eq.value == "="):
            raise parser._fail(eq, "'=' after an assignment name")
        value = parser.parse_value()

        if target is None:
            names[tok.value] = value
        else:
            target.fields[member_name] = value


@dataclass
class ApiMethod:
    mtype: str = "Normal"
    rtypes: dict[str, str] = dc_field(default_factory=dict)


@dataclass
class ApiMeta:
    """``flat`` is keyed by dotted ``Service.Method``; ``services`` holds every
    dotted service prefix the config knows, for the unlisted-defaults-to-Normal rule."""

    flat: dict[str, ApiMethod] = dc_field(default_factory=dict)
    services: set[str] = dc_field(default_factory=set)


def parse(text: str, source: str = "<string>") -> tuple[Header, Any]:
    """Parse either dump flavour.  Returns ``(header, root_value)``."""
    return parse_header(text), _Parser(text, source).parse_chunk()


def parse_header(text: str) -> Header:
    head = Header()
    stats: dict[str, Any] = {}
    for line in _strip_bom(text).split("\n"):
        stripped = line.strip()
        if stripped.startswith("--"):
            body = stripped[2:].strip()
        elif stripped:
            break
        else:
            continue

        m = re.match(r"^format:\s*(\S+)(?:\s+generator:\s*(.*))?$", body)
        if m:
            head.format = m.group(1)
            head.generator = (m.group(2) or "").strip()
            continue
        m = re.match(r"^face:\s*(\S+)$", body)
        if m:
            head.face = m.group(1)
            continue
        m = re.match(r"^game:\s*(.*)$", body)
        if m:
            head.game = m.group(1).strip()
            continue
        m = re.match(r"^generated:\s*(.*)$", body)
        if m:
            head.generated = m.group(1).strip()
            continue
        m = re.match(r"^UGC (\w+) Environment\s*(\S*)$", body)
        if m:
            head.face = LEGACY_FACE_NAMES.get(m.group(1).lower(), m.group(1).lower())
            head.game = m.group(2)
            continue
        m = re.match(r"^stats:\s*(.*)$", body)
        if m:
            for pair in m.group(1).split():
                if "=" not in pair:
                    continue
                k, v = pair.split("=", 1)
                key = re.match(r"^([A-Za-z_]+)", k)
                try:
                    stats[key.group(1) if key else k] = int(v)
                except ValueError:
                    stats[k] = v
    head.stats = stats
    return head


def detect_format(text: str) -> str:
    m = re.search(r"^--\s*format:\s*(\S+)", text, re.MULTILINE)
    return m.group(1) if m else LEGACY_FORMAT_ID


def load(path: str | Path) -> tuple[Header, Any]:
    p = Path(path)
    return parse(p.read_text(encoding="utf-8", errors="replace"), source=p.name)


def resolve(root: Any, path: list) -> Any:
    """Follow a ``["$ref"]`` key path from ``root``.  Returns ``None`` when the
    path cannot be walked (a composite table key was crossed, or a legacy
    address stands in for a real path)."""
    node = root
    for seg in path:
        if not isinstance(node, Table):
            return None
        if seg == RESERVED_META:
            node = node.meta
            continue
        if isinstance(seg, str) and seg.startswith("#k"):
            return None
        if isinstance(seg, str) and seg.startswith("$"):
            node = node.fields.get(seg[1:])
        else:
            node = node.fields.get(seg)
        if node is None:
            return None
    return node


_ADDR_RE = re.compile(r"^0x[0-9a-fA-F]+$")


def address_map(root: Any) -> dict:
    """Map legacy memory addresses onto the table first emitted at them."""
    found: dict = {}
    seen: set = set()

    def walk(node: Any) -> None:
        if not isinstance(node, Table) or node in seen:
            return
        seen.add(node)
        if node.addr and node.addr not in found:
            found[node.addr] = node
        for value in node.fields.values():
            walk(value)
        walk(node.meta)

    walk(root)
    return found


def deref(root: Any, node: Any, addrs: dict | None = None) -> Any:
    """Resolve a node that is a back-reference; identity otherwise.

    ``mwenviron/1`` references carry a key path; a legacy dump only carries the
    memory address, so ``addrs`` (see ``address_map``) is needed for those.
    """
    hops = 0
    while isinstance(node, Table) and node.ref is not None and hops < 32:
        target = node.ref
        nxt = None
        if addrs and len(target) == 1 and isinstance(target[0], str) and _ADDR_RE.match(target[0]):
            nxt = addrs.get(target[0])
        if nxt is None:
            nxt = resolve(root, target)
        if nxt is None or nxt is node:
            return node
        node = nxt
        hops += 1
    return node


def main_index(root: Any) -> Any:
    """The table holding the sandbox globals.

    ``GetScriptFenv`` hands back a wrapper whose metatable ``__index`` is the real
    environment, so the API surface sits one hop down."""
    addrs = address_map(root)
    node = deref(root, root, addrs)
    if not isinstance(node, Table):
        return node
    meta = deref(root, node.meta, addrs)
    if isinstance(meta, Table):
        inner = deref(root, meta.fields.get("__index"), addrs)
        if isinstance(inner, Table):
            return inner
    return node


def _is_scalar(value: Any) -> bool:
    return isinstance(value, (str, int, float, bool)) or value is None


def _format_scalar(value: Any) -> str:
    if value is None:
        return "nil"
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, float) and value.is_integer():
        return str(int(value))
    return str(value)


def _python_type_name(value: Any) -> str:
    if value is None:
        return "nil"
    if isinstance(value, bool):
        return "boolean"
    if isinstance(value, (int, float)):
        return "number"
    if isinstance(value, str):
        return "string"
    return "other"


def _classify(node: Table) -> str:
    if "__className_" in node.fields:
        return "class"
    has_func = any(isinstance(v, Func) for v in node.fields.values())
    has_table = any(isinstance(v, Table) for v in node.fields.values())
    scalars_only = all(_is_scalar(v) for v in node.fields.values())
    if has_func or (has_table and not scalars_only):
        return "module"
    if scalars_only and node.fields and node.meta is None and node.userdata is None:
        return "enum"
    return "unknown"


def sorted_keys(node: Table) -> list:
    """Reproduce the dumper's ordering: strings, then numbers, then the rest."""
    strings = sorted(k for k in node.fields if isinstance(k, str))
    numbers = sorted(
        k for k in node.fields if isinstance(k, (int, float)) and not isinstance(k, bool)
    )
    rest = [k for k in node.fields if not isinstance(k, str) and k not in numbers]
    return strings + numbers + rest


def surface_entries(root: Any, skip_modules: frozenset[str] = frozenset()) -> list[dict]:
    """Flatten an environment tree into the ``tmp/env-apis.json`` entry schema
    (``{name, kind, module, params|values, source}``), keeping the downstream
    consumers of that file working unchanged."""
    env = main_index(root)
    if not isinstance(env, Table):
        return []

    addrs = address_map(root)
    visited: set = set()
    entries: list[dict] = []

    def walk(node: Table, module: str | None) -> None:
        if node in visited:
            return
        visited.add(node)
        for key in sorted_keys(node):
            if not isinstance(key, str) or key in INTERNAL_KEYS or key == "_G":
                continue
            value = node.fields[key]
            name = f"{module}:{key}" if module else key

            if isinstance(value, Func):
                entries.append({
                    "name": name,
                    "kind": "function",
                    "module": module,
                    "params": list(value.params),
                    "source": "env",
                })
                continue

            if isinstance(value, Table) and value.ref is not None:
                continue

            resolved = deref(root, value, addrs)

            if isinstance(resolved, Func):
                entries.append({
                    "name": name,
                    "kind": "function",
                    "module": module,
                    "params": list(resolved.params),
                    "source": "env",
                })
                continue

            if isinstance(resolved, Table):
                kind = _classify(resolved)
                if kind == "class":
                    entries.append({"name": name, "kind": "class", "module": module, "source": "env"})
                elif kind == "module":
                    entries.append({"name": name, "kind": "module", "module": module, "source": "env"})
                    if key not in skip_modules:
                        walk(resolved, name)
                elif kind == "enum":
                    values = {
                        str(k): _format_scalar(v)
                        for k, v in resolved.fields.items()
                        if _is_scalar(v)
                    }
                    entries.append({
                        "name": name,
                        "kind": "enum",
                        "module": module,
                        "values": values,
                        "source": "env",
                    })
                continue

            if module is None and _is_scalar(value):
                entries.append({
                    "name": key,
                    "kind": "variable",
                    "module": None,
                    "type": _python_type_name(value),
                    "value": _format_scalar(value),
                    "source": "env",
                })

    walk(env, None)
    return entries


def _lua_string(text: str) -> str:
    out: list[str] = []
    for ch in text:
        code = ord(ch)
        if ch == "\\":
            out.append("\\\\")
        elif ch == '"':
            out.append('\\"')
        elif ch == "\n":
            out.append("\\n")
        elif ch == "\r":
            out.append("\\r")
        elif ch == "\t":
            out.append("\\t")
        elif code < 32:
            out.append(f"\\{code:03d}")
        else:
            out.append(ch)
    return '"' + "".join(out) + '"'


def _lua_number(value: Any) -> str:
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, int):
        return str(value)
    if value != value:
        return "0/0"
    if value == float("inf"):
        return "1/0"
    if value == float("-inf"):
        return "-1/0"
    if float(value).is_integer() and abs(value) < 1e15:
        return str(int(value))
    return f"{value:.14g}"


def lua_value_text(value: Any) -> str:
    """Render a constant compactly the way dump_env.lua's valueText() does:
    scalars bare, arrays as ``(a,b)``, hashes as ``(k=v)``."""
    if value is None:
        return "nil"
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, (int, float)):
        return _lua_number(value)
    if isinstance(value, str):
        return _lua_string(value)
    if isinstance(value, Table):
        keys = sorted_keys(value)
        numbers = [k for k in keys if isinstance(k, int) and not isinstance(k, bool)]
        if numbers and len(numbers) == len(keys):
            return "(" + ",".join(lua_value_text(value.fields[k]) for k in numbers) + ")"
        parts = [f"{k}={lua_value_text(value.fields[k])}" for k in keys]
        return "(" + ",".join(parts) + ")"
    return str(value)


def _collect_paths(node: Any, path: list, paths: dict, addrs: dict) -> None:
    if not isinstance(node, Table) or node in paths:
        return
    paths[node] = path
    if node.addr and node.addr not in addrs:
        addrs[node.addr] = path
    for key in sorted_keys(node):
        _collect_paths(node.fields[key], path + [key], paths, addrs)
    _collect_paths(node.meta, path + [RESERVED_META], paths, addrs)


def render(root: Any, indent: str = "    ") -> str:
    """Serialise a tree back into an ``mwenviron/1`` chunk body.

    Legacy dumps tag every table with its memory address; those are matched
    against the address of the table each dangling reference points at, so a
    migrated legacy dump gets real ``$ref`` key paths.
    """
    paths: dict = {}
    addrs: dict = {}
    _collect_paths(root, [], paths, addrs)
    seen: set = set()
    out: list[str] = []

    def emit(node: Any, depth: int) -> Any:
        if node is None:
            return "nil"
        if isinstance(node, bool):
            return "true" if node else "false"
        if isinstance(node, (int, float)):
            return _lua_number(node)
        if isinstance(node, str):
            return _lua_string(node)
        if isinstance(node, Userdata):
            return '{ ["$userdata"] = ' + _lua_string(node.text) + " }"
        if isinstance(node, Func):
            body = f"function({', '.join(node.params)}) end"
            if node.annotations:
                return body, "; ".join(node.annotations)
            return body
        if not isinstance(node, Table):
            return _lua_string(str(node))

        if node.ref is not None:
            target = node.ref
            if addrs and target and target[0] in addrs:
                target = addrs[target[0]]
            parts = ", ".join(_lua_string(str(seg)) for seg in target)
            return f'{{ ["$ref"] = {{{parts}}} }}'
        if node in seen:
            parts = ", ".join(_lua_string(str(seg)) for seg in paths.get(node, []))
            return f'{{ ["$ref"] = {{{parts}}} }}'
        if node.truncated:
            return '{ ["$truncated"] = true }'
        seen.add(node)

        pad = indent * (depth + 1)
        close = indent * depth
        lines = ["{"]

        def line(key_literal: str, value: Any) -> None:
            rendered = emit(value, depth + 1)
            if isinstance(rendered, tuple):
                body, note = rendered
                lines.append(f"{pad}{key_literal} = {body}, --[[{note}]]")
            else:
                lines.append(f"{pad}{key_literal} = {rendered},")

        if node.meta is not None:
            line('["$meta"]', node.meta)
        for key in sorted_keys(node):
            value = node.fields[key]
            if isinstance(key, str):
                literal = "[" + _lua_string(("$" + key) if key.startswith("$") else key) + "]"
            elif isinstance(key, (int, float)) and not isinstance(key, bool):
                literal = "[" + _lua_number(key) + "]"
            else:
                inner = emit(key, depth + 1)
                literal = "[" + (inner[0] if isinstance(inner, tuple) else str(inner)) + "]"
            line(literal, value)
        lines.append(close + "}")
        return "\n".join(lines)

    body = emit(root, 0)
    return body[0] if isinstance(body, tuple) else str(body)


def render_header(header: Header, stats: dict) -> str:
    parts = [
        f"format: {FORMAT_ID}",
        f"generator: {header.generator or 'env_lib.render'}",
    ]
    lines = [
        "-- ============================================================================",
        "-- Mini World UGC environment export",
        "-- " + "   ".join(parts),
    ]
    if header.face:
        lines.append(f"-- face: {header.face}")
    if header.game:
        lines.append(f"-- game: {header.game}")
    if header.generated:
        lines.append(f"-- generated: {header.generated}")
    rendered = " ".join(f"{k}={v}" for k, v in stats.items())
    lines.append(f"-- stats: {rendered}")
    lines.append("-- ============================================================================")
    return "\n".join(lines)


def count_stats(root: Any) -> dict:
    counts = {"tables": 0, "functions": 0, "refs": 0, "userdata": 0, "truncated": 0, "unresolved": 0}
    seen: set = set()

    def walk(node: Any) -> None:
        if isinstance(node, Func):
            counts["functions"] += 1
            if node.unresolved:
                counts["unresolved"] += 1
            return
        if isinstance(node, Userdata):
            counts["userdata"] += 1
            return
        if not isinstance(node, Table):
            return
        if node.ref is not None or node in seen:
            counts["refs"] += 1
            return
        seen.add(node)
        if node.truncated:
            counts["truncated"] += 1
            return
        counts["tables"] += 1
        for value in node.fields.values():
            walk(value)
        walk(node.meta)

    walk(root)
    return counts
