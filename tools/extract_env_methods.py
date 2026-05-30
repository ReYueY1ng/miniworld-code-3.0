#!/usr/bin/env python3
"""
从环境表中提取顶级模块的方法列表
排除 Trigger 子表和 Data 子表

使用方法:
    python3 tools/extract_env_methods.py [环境表路径]

默认路径: /home/yuey1ng/mini/miniworld-scripts/3.0/environments/ugcscriptenv.txt
"""

import re
import sys
import json
from pathlib import Path

DEFAULT_ENV_PATH = "/home/yuey1ng/mini/miniworld-scripts/3.0/environments/ugcscriptenv.txt"


def extract_top_level_methods(env_path: str) -> dict[str, set[str]]:
    """从环境表中提取顶级模块的方法 - 缩进级别:
       indent=8: _G 及 _G 基类
       indent=12: 顶级模块定义 (Player, World, Data, Trigger 等)
       indent=16: 方法定义 或 子模块 (Data.Table, Trigger.Graphics 等)
       indent=20+: 子模块内部
    """
    with open(env_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    modules: dict[str, set[str]] = {}
    current_module = None
    in_trigger = False
    trigger_indent = 0
    skip_submodule = False
    skip_submodule_indent = 0
    
    for line in lines:
        stripped = line.rstrip()
        indent = len(stripped) - len(stripped.lstrip())
        content = stripped.strip()
        
        # --- Trigger 排除 ---
        if indent == 12 and content.startswith('"Trigger" = table:'):
            in_trigger = True
            trigger_indent = indent
            current_module = None
            skip_submodule = False
            continue
        
        if in_trigger and indent <= trigger_indent and content.startswith('}'):
            in_trigger = False
            current_module = None
            continue
        
        if in_trigger:
            continue
        
        # --- 顶级模块检测 (indent 12) ---
        if indent == 12:
            match = re.match(r'"(\w+)"\s*=\s*table:\s*0x', content)
            if match is not None:
                current_module = match.group(1)
                if current_module not in modules:
                    modules[current_module] = set()
                skip_submodule = False
                continue
        
        # --- 子模块跳过 ---
        # indent 16 且匹配 table: 的子模块定义 (如 Data.Table, Trigger.Graphics)
        if indent == 16 and current_module:
            sub_match = re.match(r'"(\w+)"\s*=\s*table:\s*0x', content)
            if sub_match is not None:
                skip_submodule = True
                skip_submodule_indent = indent
                continue
        
        # 子模块区间结束 (indent 16 的 })
        if skip_submodule and indent <= skip_submodule_indent and content.startswith('}'):
            skip_submodule = False
            continue
        
        # 跳过子模块内部区域 (indent 16 的 table 定义之后的所有行)
        if skip_submodule:
            continue
        
        # --- 方法检测 (indent 16, 在顶级模块内部但不是子模块) ---
        if indent == 16 and current_module:
            m1 = re.match(r'"(\w+)"\s*=\s*function\s*\(\s*self', content)
            m2 = re.match(r'"(\w+)"\s*=\s*function\s*\(\s*\.\.\.\s*\)', content)
            
            matched = m1 if m1 is not None else m2
            if matched is not None:
                method_name = matched.group(1)
                modules[current_module].add(method_name)
    
    return modules


def load_library_methods(lib_dir: str) -> dict[str, set[str]]:
    """从 library 目录加载已有的方法定义"""
    modules: dict[str, set[str]] = {}
    lib_path = Path(lib_dir)
    
    for lua_file in lib_path.glob("*.lua"):
        with open(lua_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        for match in re.finditer(r'function\s+(\w+):(\w+)', content):
            module = match.group(1)
            method = match.group(2)
            if module not in modules:
                modules[module] = set()
            modules[module].add(method)
    
    return modules


def compare_methods(env_modules: dict, lib_modules: dict) -> dict[str, dict]:
    """比较环境表和 library 的方法差异"""
    all_modules = set(env_modules.keys()) | set(lib_modules.keys())
    result = {}
    
    for module in sorted(all_modules):
        env_methods = env_modules.get(module, set())
        lib_methods = lib_modules.get(module, set())
        
        new_methods = sorted(env_methods - lib_methods)
        removed_methods = sorted(lib_methods - env_methods)
        
        if new_methods or removed_methods:
            result[module] = {
                'new': new_methods,
                'removed': removed_methods,
                'env_count': len(env_methods),
                'lib_count': len(lib_methods)
            }
    
    return result


def main():
    env_path = sys.argv[1] if len(sys.argv) > 1 else DEFAULT_ENV_PATH
    lib_dir = str(Path(__file__).parent.parent / "library")
    
    print(f"环境表: {env_path}")
    print(f"Library: {lib_dir}")
    print()
    
    env_modules = extract_top_level_methods(env_path)
    lib_modules = load_library_methods(lib_dir)
    
    diff = compare_methods(env_modules, lib_modules)
    
    print("=== 顶级模块方法对比 ===")
    print()
    
    total_new = 0
    total_removed = 0
    
    for module, info in sorted(diff.items()):
        print(f"### {module} (env: {info['env_count']}, lib: {info['lib_count']})")
        
        if info['new']:
            print(f"  NEW ({len(info['new'])}):")
            for m in info['new']:
                print(f"    + {m}")
            total_new += len(info['new'])
        
        if info['removed']:
            print(f"  REMOVED ({len(info['removed'])}):")
            for m in info['removed']:
                print(f"    - {m}")
            total_removed += len(info['removed'])
        
        print()
    
    print(f"=== 总计 ===")
    print(f"新增: {total_new}")
    print(f"删除: {total_removed}")
    
    if "--json" in sys.argv:
        json_output = {
            module: {
                'new': info['new'],
                'removed': info['removed'],
                'env_count': info['env_count'],
                'lib_count': info['lib_count']
            }
            for module, info in diff.items()
        }
        print("\n=== JSON ===")
        print(json.dumps(json_output, indent=2, ensure_ascii=False))


if __name__ == "__main__":
    main()
