# AGENTS.md

## What This Repo Is

Lua type definition library for Mini World (迷你世界) UGC 3.0 game engine. Provides code completion and type checking for the Lua Language Server (LuaLS).

## Key Facts

- **No build system** - This is a type definition library only, no compilation needed
- **Runtime**: LuaJIT (Mini World uses LuaJIT)
- **Required tool**: [Lua Language Server](https://luals.github.io) for code completion

## Structure

```
library/                # generated and hand-written ---@meta definitions
library/optional/       # official + trigger lanes (default off, see plugin.lua)
library/components/     # built-in component definitions, one directory per category
config.json             # LLS-Addons addon configuration schema
plugin.lua              # gated lanes + custom diagnostics
tools/                  # generators, parsers and their pytest suite
test.lua                # Manual test file (not automated tests)
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

Automated checks (all run from the repo root):

```bash
python3 -m pytest tools/tests -q                 # tools, doc format, override validation
python3 tools/gen_env_lanes.py --verify          # regeneration dry run
python3 tools/check_doc_overrides.py             # curated docs vs generated lanes
luac -p library/optional/official/*.lua library/optional/trigger/*.lua
```

Then, manually:
1. Opening a `.lua` file in VS Code with LuaLS configured
2. Check that autocompletion works for Mini World APIs
3. Verify type errors appear for invalid API usage
4. Use `test.lua` to validate type resolution works correctly

## Built-in Components (library/components)

Components are generated from the decompiled framework, not from the wiki: every
`ComponentClass("Name")` declaration carries `displayName`, `_cmpTips`, `propertys`
(script-visible attributes with `type`/`itemType`/`Get`/`Set`) and `openFnArgs`
(script-callable functions with `tips`/`params`/`paramsTips`/`returnType`/`returnTips`).
The wiki `cmpapis/*.html` pages are merged in where they document the same component.

```bash
python3 tools/gen_builtin_components.py            # regenerate library/components
python3 tools/gen_builtin_components.py --check    # counts + drift, no writes
python3 tools/gen_builtin_components.py --offline  # ignore the wiki cache
python3 tools/gen_builtin_components.py --refresh-wiki   # re-download cmpapis pages
```

Layout mirrors the engine's own `framework/components/` tree, so a component's
directory is its category:

| directory | category | directory | category |
|-----------|----------|-----------|----------|
| `base/` | 基础组件 | `effect/` | 效果组件 |
| `actor/` | 角色组件 | `grid/` | 网格组件 |
| `block/` | 方块组件 | `motions/` | 运动组件 |
| `world/` | 世界组件 | `projectiles/` | 投掷物组件 |
| `ui/` | 界面组件 | `skill/` `pos/` `player/` `area/` | 对应分类 |
| `core/` | 通用组件 | | |

Rules that keep the generated files valid:

- Every component is `---@class <Name>: Component`, so `self:GetComponent("<Name>")`
  resolves through the `---@generic cmp: Component` / `` cmpid `cmp` `` trick.
- Modifiable attributes are `---@field` lines on the class; engine descriptors are
  mapped to script types (`Mini.Number` -> `number`, `Mini.Bool` -> `boolean`,
  `Mini.Player` -> `integer`, `Mini.Item`/`Mini.Block`/... -> `number | string`,
  `Mini.Array` + `itemType` -> `<item>[]`, vectors stay `Mini.Vec3`/`Mini.Scale`).
- `openFnArgs` entries without metadata are emitted as `(...)` varargs so a call with
  any arguments is never a false positive.
- Component ids collide with three existing module classes (`Area`, `Block`, `Task`).
  Keep the component id as the class name; it is what `GetComponent("<id>")` resolves.
- The plugin gates the whole `library/components/` subtree by URI prefix, so nested
  category directories need no extra configuration.

## Optional Lane Docs (official / trigger)

`library/optional/official/*.lua` and `library/optional/trigger/*.lua` are generated by
`tools/gen_env_lanes.py`. Never hand-edit them; edit the sources below and regenerate.

Doc comments are composed from four sources, highest priority first:

1. `tools/api-update/doc_overrides/*.json` — hand-written Chinese description, parameter
   notes, return values and `notes`, each inferred from the decompiled implementation.
2. Wiki crawl `tmp/wiki_data/all_api.json` — description, parameter text and returns for
   methods the wiki documents.
3. `tools/api-update/decompiled-types.json` — parameter types, optionality, defaults,
   enum references, numeric bounds and return types extracted from the framework Lua.
4. `tools/doc_text.py` — name-derived vocabulary fallback when nothing above applies.

Rebuild after the decompiled tree or an override file changes:

```bash
python3 tools/decompiled_types.py --dump-cache tools/api-update/decompiled-types.json
python3 tools/gen_env_lanes.py
python3 tools/check_doc_overrides.py
```

The decompiled framework is read from `MW_DECOMPILED_DIR` when set, otherwise from the
candidate paths at the top of `tools/decompiled_types.py`.

## API Update Constraints

### 1. Environment Table Authority
**环境表 (devenv.lua) 为唯一权威** — 所有新增 API 必须在环境中存在。

```bash
# 环境表位置（mwenviron/1 格式，合法 Lua，可直接 loadfile）
/home/yuey1ng/mini/miniworld-scripts/3.0/environments/devenv.lua

# 取一张扁平清单（Module:Method + params + mtype + rtypes），供逐项比对
python3 tools/api-update/parse_env.py --face dev   # -> tmp/env-apis.json

# 看两个版本之间新增/删除/签名与调用限制变化
python3 tools/env_diff.py <旧环境表> <新环境表>
```

每个函数尾部带 `--[[...]]` 注释，其中 `@mtype <DevApiMType>` 是调用类型（`Normal` /
`Sync` / `Block` / `ClientData` / `HostAndClient` / `BoardCast` / `Mod` ...），
`@rtype <DevApiRType>=<值>` 是调用限制（`Uin_TimeLimit` / `TimeLimit` / `WhiteList` /
`CompareParam` / `ResetCompareParam` / `ResendMsg`）。这两个决定 API 是否走网络、
**会注入哪些额外参数**（`Mod` → `modId`，`HostAndClient` → `isHost`，`Block` →
`runcallback`，`ReportHost` → `playerid`），写类型定义时必须计入。

> 旧的 `ugcscriptenv.txt` 已改名为 `devenv.lua` 并换成 `mwenviron/1` 格式；旧格式的副本可用
> `python3 tools/migrate_env_dump.py <旧文件.txt>` 转换，`tools/env_lib.py` 两种格式都能读。

### 2. Spelling Errors — Do NOT Fix
不修改拼写错误 (如 ColorGrandient, Lenght, toFistTime)，这是官方问题。
- 可以添加注释说明
- 保留引擎原始拼写

### 3. API Source Priority (优先级)
API 来源优先级 (从高到低):

| 优先级 | 来源 | 用途 |
|--------|------|------|
| 1 | 环境表 (devenv.lua) | 唯一权威，确认 API 存在 |
| 2 | 反编译文件 | 获取深层信息/具体参数 |
| 3 | 新版文档 (dev-wiki.mini1.cn) | 获取基本信息 |
| 4 | 旧版文档 (迷你世界脚本api.txt) | 备用参考 |

```bash
# 反编译文件位置
/run/media/yuey1ng/F25A9F0C5A9ECD2B/mini/dump/decompiled/luascript/ugc/framework

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
