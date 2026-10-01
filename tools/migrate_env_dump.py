#!/usr/bin/env python3
"""Convert a legacy ``ugc*env.txt`` dump into the current ``mwenviron/1`` format.

Use it on the dumps that predate ``dump_env.lua`` (for example the copy in
``~/Downloads``) so they can be diffed against a fresh export, or to move the
files in ``miniworld-scripts/3.0/environments`` over to the new format.

    python3 tools/migrate_env_dump.py <input.txt> [output.lua]
    python3 tools/migrate_env_dump.py --face official

Migrating is lossless for everything the legacy dump recorded: memory addresses
are rewritten into real ``$ref`` key paths by matching each dangling reference
against the table that was first emitted at that address.
"""

from __future__ import annotations

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

import env_lib  # noqa: E402


def migrate(source: Path, target: Path, devapicfg: Path | None = None) -> dict:
    header, root = env_lib.load(source)
    annotated = 0
    if devapicfg is not None and Path(devapicfg).exists():
        annotated = env_lib.annotate_functions(root, env_lib.load_devapicfg(devapicfg))
    stats = env_lib.count_stats(root)
    body = env_lib.render(root)
    stats["bytes"] = len(body)
    stats["annotated"] = annotated

    out_header = env_lib.Header(
        format=env_lib.FORMAT_ID,
        generator=f"migrate_env_dump.py (from {source.name})",
        face=header.face,
        game=header.game or "unknown",
        generated=header.generated,
    )
    text = env_lib.render_header(out_header, stats) + "\nreturn " + body + "\n"
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(text, encoding="utf-8")
    return stats


def _is_live_export(path: Path) -> bool:
    """True when dump_env.lua wrote the file inside the game rather than this
    migrator producing it; overwriting one throws away @source/@service."""
    header = env_lib.parse_header(path.read_text(encoding="utf-8", errors="replace"))
    return header.generator.startswith("dump_env.lua")


def main() -> int:
    args = [a for a in sys.argv[1:] if a not in ("--force", "--no-devapicfg")]

    def default_devapicfg() -> Path | None:
        if "--no-devapicfg" in sys.argv:
            return None
        candidate = env_lib.env_dir() / "devapicfg.lua"
        return candidate if candidate.exists() else None

    devapicfg = default_devapicfg()
    if "--devapicfg" in args:
        idx = args.index("--devapicfg")
        devapicfg = Path(args[idx + 1]).expanduser()
        args = args[:idx] + args[idx + 2:]

    if "--face" in args:
        idx = args.index("--face")
        face = args[idx + 1]
        args = args[:idx] + args[idx + 2:]
        src = env_lib.face_path(face)
        if src is None:
            print(f"no export found for face {face!r} in {env_lib.env_dir()}", file=sys.stderr)
            return 1
        target = src.with_name(env_lib.canonical_name(src))
    elif args:
        src = Path(args[0]).expanduser()
        target = Path(args[1]).expanduser() if len(args) > 1 else src.with_name(env_lib.canonical_name(src))
    else:
        src = env_lib.face_path("dev")
        if src is None:
            print("usage: migrate_env_dump.py <input.txt> [output.lua]", file=sys.stderr)
            return 1
        target = src.with_name(env_lib.canonical_name(src))

    if not src.exists():
        print(f"input not found: {src}", file=sys.stderr)
        return 1
    if src.suffix == ".lua" and env_lib.detect_format(src.read_text(encoding="utf-8", errors="replace")) == env_lib.FORMAT_ID:
        print(f"{src} is already {env_lib.FORMAT_ID}", file=sys.stderr)
        return 0
    if target.exists() and "--force" not in sys.argv:
        print(f"refusing to overwrite {target} (pass --force)", file=sys.stderr)
        return 1
    if target.exists() and "--force" not in sys.argv and _is_live_export(target):
        print(f"refusing to overwrite {target}: it is a live dump_env.lua export", file=sys.stderr)
        return 1

    stats = migrate(src, target, devapicfg)
    print(f"{src} -> {target}")
    if devapicfg is not None:
        print(f"  api metadata: {devapicfg}")
    print("  " + " ".join(f"{k}={v}" for k, v in stats.items()))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
