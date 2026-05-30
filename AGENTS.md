# AGENTS.md

## What This Repo Is

Lua type definition library for Mini World (迷你世界) UGC 3.0 game engine. Provides code completion and type checking for the Lua Language Server (LuaLS).

## Key Facts

- **No build system** - This is a type definition library only, no compilation needed
- **Runtime**: LuaJIT (Mini World uses LuaJIT)
- **Required tool**: [Lua Language Server](https://luals.github.io) for code completion

## Structure

```
library/           # 25 Lua files with type definitions using ---@meta annotations
config.json        # LLS-Addons addon configuration schema
test.lua           # Manual test file (not automated tests)
```

Each file in `library/` corresponds to a Mini World API module:
- `GameObject.lua` - Object creation, finding, and management
- `Component.lua` - Component hierarchy (Component → WorldComponent → PlayerComponent, etc.)
- `Player.lua` - Player-specific API (camera, inventory, UI, etc.)
- `Enum.lua` - All enumeration types (~100+ enums)
- `Events.lua` - TriggerEvent enum for game events
- Other files: Actor, Area, Backpack, Block, Buff, Chat, CustomUI, Data, GlobalFunc, Graphics, Item, Mod, Monster, Object, threadpool, Timer, World, WorldContainer

## LuaLS Annotation Patterns

All files use `---@meta` at top. Follow these patterns exactly:

```lua
---@meta

---Description<br>[Link](url)
---@class ClassName
---@field protected fieldName type Description
ClassName = {}

---Description
---@param param type Description
---@return type description
function ClassName:MethodName(param) end
```

Key conventions:
- `---@protected` on methods only accessible within the class hierarchy
- `---@generic` for type parameters (see Component.lua for examples)
- Chinese comments for API documentation
- HTML `<br>` tags in doc comments for line breaks

## Runtime Builtin Disables

The game engine disables many standard Lua/JIT builtins:
```json
"runtime.builtin": {
    "debug": "disable",
    "ffi": "disable",
    "io": "disable",
    "jit": "disable",
    "jit.profile": "disable",
    "jit.util": "disable",
    "package": "disable",
    "table.clear": "disable",
    "table.new": "disable",
    "string.buffer": "disable"
}
```

## Adding New Types

1. Create or edit file in `library/` directory
2. Start with `---@meta` annotation
3. Use `---@class` for types, `---@enum` for enumerations
4. Follow existing patterns in similar files
5. Reference Mini World API docs: https://dev-wiki.mini1.cn/ugc-wiki/

## Dual Enum System

`Enum.lua` has two sections:
- **Modern (PascalCase)**: `Ability`, `BlockAttr`, `CreatureAttr` (top of file)
- **Legacy (UPPER_SNAKE_CASE)**: `CREATUREATTR`, `HURTTYPE`, `ITEMATTR` (inside `--#region hiddenenum` block)

Both must be maintained for backward compatibility.

## Method Stubs vs Implementations

Most method bodies are **empty stubs** for type-checking only:
```lua
function GameObject:FindObject(id) end  -- Empty stub
```

A few files have real implementations (utility functions):
- `GlobalFunc.lua`: `copy_table`, `Class`, `Instance`, `GetInst`, `GetWorld`
- `BaseEnv.lua`: `string.split`, `string.startswith`, `string.endswith`, `math.approximately`, `math.clamp`, `math.lerp`
- `World.lua`: `World:CalcDirectionByCoord`, `World:GetLocalDateString`

Don't accidentally "complete" stubs that should stay empty.

## Component Lifecycle Pattern

Components declare lifecycle methods via `openFnArgs`:
```lua
local test = {}
test.openFnArgs = {
    OnStart = true
}

function test:OnStart()
    -- Implementation here
end
```

## Generic Type Parameters

Component access uses LLS generics for type safety:
```lua
---@generic cmp: Component
---@param cmpid `cmp` Component ID
---@return cmp cmp Component object
function Component:GetComponent(cmpid) end
```

## Verification

No automated tests. Verify by:
1. Opening a `.lua` file in VS Code with LuaLS configured
2. Check that autocompletion works for Mini World APIs
3. Verify type errors appear for invalid API usage
4. Use `test.lua` to validate type resolution works correctly

## API Update Constraints

### 1. Environment Table Authority
**环境表 (ugcscriptenv.txt) 为唯一权威** — 所有新增 API 必须在环境中存在。

```bash
# 环境表位置
/home/yuey1ng/mini/miniworld-scripts/3.0/environments/ugcscriptenv.txt
```

### 2. Spelling Errors — Do NOT Fix
不修改拼写错误 (如 ColorGrandient, Lenght, toFistTime)，这是官方问题。
- 可以添加注释说明
- 保留引擎原始拼写

### 3. API Source Priority (优先级)
API 来源优先级 (从高到低):

| 优先级 | 来源 | 用途 |
|--------|------|------|
| 1 | 环境表 (ugcscriptenv.txt) | 唯一权威，确认 API 存在 |
| 2 | 反编译文件 | 获取深层信息/具体参数 |
| 3 | 新版文档 (dev-wiki.mini1.cn) | 获取基本信息 |
| 4 | 旧版文档 (迷你世界脚本api.txt) | 备用参考 |

```bash
# 反编译文件位置
/run/media/yuey1ng/F25A9F0C5A9ECD2B/mini/dump/script_decompiled/luascript/ugc/framework

# 文档
新版: https://dev-wiki.mini1.cn/ugc-wiki/
旧版: /home/yuey1ng/Downloads/迷你世界脚本api.txt
```

**注意**: 文档用于基本信息，反编译文件获取参数签名 (参数可能不一致，以反编译为准)

### 4. Chinese Comments Required
所有函数必须有中文文档注释，BaseEnv 函数除外。

```lua
---获取玩家背包物品数量
---@param objid number 玩家ID
---@return number count 物品数量
function Player:GetBackpackItemNum(objid) end
```

### 5. BaseEnv Verification
基本环境内的函数 (如 math.*, string.*, table.*)，用脚本验证是否在 LuaJIT 内存在：
- **存在** → 不添加 (LuaLS 已内置定义)
- **不存在** → 添加到 BaseEnv.lua
