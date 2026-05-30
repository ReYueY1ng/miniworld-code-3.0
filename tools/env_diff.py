#!/usr/bin/env python3
"""
对比两个 ugcscriptenv 环境表文件，去除内存地址后排序对比。

使用方法:
    python3 tools/env_diff.py [旧文件] [新文件]

默认路径:
    旧: ~/Downloads/ugcscriptenv.txt
    新: ~/mini/miniworld-scripts/3.0/environments/ugcscriptenv.txt

选项:
    --save     将排序后的文件保存到 tmp/ 目录
    --summary  仅输出统计摘要，不输出详细 diff
"""

import re
import sys
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent

DEFAULT_OLD = Path.home() / "Downloads/ugcscriptenv.txt"
DEFAULT_NEW = Path.home() / "mini/miniworld-scripts/3.0/environments/ugcscriptenv.txt"


def strip_addresses(text: str) -> str:
    """移除内存地址 (table: 0xHEX → table)"""
    return re.sub(r'table:\s*0x[0-9a-fA-F]+', 'table', text)


def read_and_sort(filepath: Path) -> list[str]:
    """读取文件，去掉地址，排序行，返回行列表"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    stripped = strip_addresses(content)
    lines = stripped.split('\n')
    return sorted(lines)


def save_sorted(lines: list[str], filepath: Path):
    """保存排序后的行到文件"""
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))


def print_diff(old_lines: list[str], new_lines: list[str], summary_only: bool = False):
    """输出结构化 diff"""
    old_set = set(old_lines)
    new_set = set(new_lines)

    added = sorted(new_set - old_set)
    removed = sorted(old_set - new_set)

    print(f"{'=' * 60}")
    print(f"旧文件: {len(old_lines)} 行 ({len(old_set)} 唯一)")
    print(f"新文件: {len(new_lines)} 行 ({len(new_set)} 唯一)")
    print(f"{'=' * 60}")
    print()

    if summary_only:
        print(f"新增: {len(added)} 行")
        print(f"删除: {len(removed)} 行")
        return

    if added:
        print(f"--- 新增 ({len(added)} 行) ---")
        for line in added:
            print(f"+ {line}")
        print()

    if removed:
        print(f"--- 删除 ({len(removed)} 行) ---")
        for line in removed:
            print(f"- {line}")
        print()

    if not added and not removed:
        print("两文件内容一致（仅地址差异）")
        return

    # 版本行检测
    old_ver = [l for l in old_lines if l.startswith('-- UGC Script Environment')]
    new_ver = [l for l in new_lines if l.startswith('-- UGC Script Environment')]
    if old_ver and new_ver and old_ver != new_ver:
        print(f"版本变更: {old_ver[0]} → {new_ver[0]}")


def main():
    args = sys.argv[1:]
    old_path = DEFAULT_OLD
    new_path = DEFAULT_NEW
    save = False
    summary_only = False

    # Parse args
    positional = []
    for arg in args:
        if arg == '--save':
            save = True
        elif arg == '--summary':
            summary_only = True
        else:
            positional.append(arg)

    if len(positional) >= 1:
        old_path = Path(positional[0])
    if len(positional) >= 2:
        new_path = Path(positional[1])

    if not old_path.exists():
        print(f"错误: 文件不存在 {old_path}", file=sys.stderr)
        sys.exit(1)
    if not new_path.exists():
        print(f"错误: 文件不存在 {new_path}", file=sys.stderr)
        sys.exit(1)

    print(f"对比: {old_path.name} (旧) vs {new_path.name} (新)")
    print()

    old_sorted = read_and_sort(old_path)
    new_sorted = read_and_sort(new_path)

    if save:
        tmp_dir = PROJECT_ROOT / "tmp"
        tmp_dir.mkdir(parents=True, exist_ok=True)
        if old_path.name == new_path.name:
            save_sorted(old_sorted, tmp_dir / f"{old_path.stem}_old_sorted.txt")
            save_sorted(new_sorted, tmp_dir / f"{new_path.stem}_new_sorted.txt")
        else:
            save_sorted(old_sorted, tmp_dir / f"{old_path.stem}_sorted.txt")
            save_sorted(new_sorted, tmp_dir / f"{new_path.stem}_sorted.txt")
        print(f"排序后文件已保存到: {tmp_dir}/")
        print()

    print_diff(old_sorted, new_sorted, summary_only=summary_only)


if __name__ == "__main__":
    main()
