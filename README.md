# Mini World Code 3.0

迷你世界 UGC 3.0 Lua 代码补全与组件校验工具。

基于 [Lua Language Server](https://luals.github.io) (LuaLS) 的类型定义库和插件，为 Mini World 脚本开发提供代码补全、类型检查和组件编写校验。

## 目录

- [项目内容](#项目内容)
- [快速开始](#快速开始)
- [配置](#配置)
- [插件诊断](#插件诊断)
- [项目结构](#项目结构)
- [组件编写示例](#组件编写示例)
- [测试文件](#测试文件)
- [相关资源](#相关资源)

## 项目内容

| 组件 | 说明 |
|------|------|
| **类型定义** (`library/`) | 32 个 Lua 文件，覆盖 Mini World UGC 3.0 全部 API 的类型注解 |
| **LuaLS 插件** (`plugin.lua`) | 25+ 个自定义诊断，实时校验组件编写规范 |
| **测试文件** (`test/diagnostics/`) | 15 个测试组件文件，覆盖每个诊断规则 |

## 快速开始

### 1. 克隆项目

```bash
git clone https://github.com/ReYueY1ng/miniworld-code-3.0.git
```

### 2. 配置 Lua Language Server

推荐使用 `LLS-Addons` 自动安装，或手动配置：

**`.luarc.json`**（通用，推荐）:
```json
{
    "workspace.library": [
        "<仓库目录>/library"
    ],
    "runtime.version": "LuaJIT",
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
    },
    "completion.autoRequire": false,
    "runtime.plugin": "plugin.lua"
}
```

**`.vscode/settings.json`**（VS Code）:
```json
{
    "Lua.workspace.library": [
        "<仓库目录>/library"
    ],
    "Lua.runtime.builtin": {
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
    },
    "Lua.completion.autoRequire": false,
    "Lua.runtime.version": "LuaJIT",
    "Lua.runtime.plugin": "plugin.lua"
}
```

> **注意**: 不需要 `--develop=true` 参数，插件在 LuaLS 正常模式下即可加载运行。

## 插件诊断

插件提供 25 个自定义诊断，在编辑器中实时提示组件编写问题。分为以下几类：

### 属性定义 (`propertys`)

| 诊断名 | 严重度 | 说明 |
|--------|--------|------|
| `miniworld-keyword` | Warning | 属性名不能使用保留关键字（`isValid`, `OnStart`, `gameObject` 等） |
| `miniworld-property-type` | Warning | 属性 `type` 字段必须为可解析的类型 |
| `miniworld-forbid-dev-type` | Warning | 属性不能使用开发者禁止的类型（`CheckList`, `Action`, `Entity` 等） |
| `miniworld-customdata-missing-def` | Warning | `CustomData` 类型必须提供 `customDef` 定义 |
| `miniworld-property-outside` | Warning | 非 `propertys` 中定义的属性应在 `OnStart` 中赋值 |

### 生命周期方法

| 诊断名 | 严重度 | 说明 |
|--------|--------|------|
| `miniworld-lifecycle` | Warning | 生命周期方法（`OnStart`, `OnEnable` 等）必须为函数类型 |
| `miniworld-onupdate-ineffective` | Information | `OnUpdate` 对自定义组件无效，应使用 `OnTick` |
| `miniworld-lifecycle-signature` | Hint | 建议使用完整签名（如 `OnStart(isFirstCreate)`） |

### 开放函数 (`openFnArgs`)

| 诊断名 | 严重度 | 说明 |
|--------|--------|------|
| `miniworld-openfnargs-missing` | Warning | `openFnArgs` 中声明的方法必须有对应的函数定义 |
| `miniworld-openfnargs-type` | Warning | `openFnArgs` 值必须为 `true` 或 `table` |
| `miniworld-openfnargs-params` | Warning | `params` 参数类型必须为有效的 `Mini.*` 类型 |
| `miniworld-openfnargs-displayname` | Warning | `displayName` 必须为字符串 |
| `miniworld-openfnargs-returntype` | Warning | `returnType` 必须为有效的 `Mini.*` 类型 |
| `miniworld-openfnargs-invalid-value` | Warning | `openFnArgs` 值不能为 `false`、`number` 或 `string` |
| `miniworld-openfnargs-invalid-field` | Warning | 只支持 `displayName`/`params`/`returnType`/`itemType` 字段 |
| `miniworld-openfnargs-params-format` | Hint | `params` 建议使用标签+类型交替格式 |
| `miniworld-openfnargs-params-array` | Warning | `params` 中禁止使用 `Mini.Array` |
| `miniworld-openfnargs-array-no-itemtype` | Warning | `Mini.Array` 必须指定 `itemType` |
| `miniworld-array-itemtype` | Warning | `itemType` 类型无效 |

### 组件结构

| 诊断名 | 严重度 | 说明 |
|--------|--------|------|
| `miniworld-official` | Warning | 不能重定义官方基类方法（`GetComponent`, `DoTaskInTime` 等） |
| `miniworld-missing-return` | Warning | 组件文件末尾必须 `return` 组件表 |
| `miniworld-return-type` | Warning | `return` 的值必须为表 |
| `miniworld-missing-isvalid` | Warning | `GetComponent` 获取的组件应做有效性检查（`IsValid` 或 nil 检查） |
| `miniworld-triggerevent-restriction` | Warning | `AddTriggerEvent` 仅在 `WorldComponent`/`PlayerComponent` 中有效 |

### 运行时限制

| 诊断名 | 严重度 | 说明 |
|--------|--------|------|
| `miniworld-disabled-stdlib` | Warning | 检测使用了被禁用的标准库（`io`, `debug`, `ffi`, `require` 等） |
| `miniworld-script-support-event` | Information | 建议使用 `AddTriggerEvent` 替代 `ScriptSupportEvent` |

## 项目结构

```
miniworld-code-3.0/
├── library/              # 类型定义文件（32 个 .lua 文件）
│   ├── Component.lua     # 组件体系（Component → WorldComponent → PlayerComponent 等）
│   ├── Player.lua        # 玩家 API（~100 个方法）
│   ├── World.lua         # 世界 API（~80 个方法）
│   ├── Enum.lua          # 枚举类型（~100+ 个枚举，含 PascalCase + UPPER_SNAKE_CASE 双体系）
│   ├── Events.lua        # 事件枚举（TriggerEvent + ObjectEvent）
│   ├── Mini.lua          # Mini 类型系统（Mini.Number, Mini.String, Mini.Vec3 等）
│   ├── GameObject.lua    # 对象创建/查找 API
│   ├── GlobalFunc.lua    # 全局工具函数
│   ├── BaseEnv.lua       # 基础环境扩展
│   └── ...               # 其他模块
├── skills/               # AI 辅助开发 skill
│   ├── miniworld-coding/          # 写游戏脚本
│   └── miniworld-code-api-update/ # 更新类型定义库
├── test/diagnostics/     # 诊断测试文件（15 个，每个诊断一个）
├── docs/
│   └── example.lua       # 完整组件编写示例
├── plugin.lua            # LuaLS 插件（25 个自定义诊断）
├── config.json           # LLS-Addons 插件配置
├── .luarc.json           # LuaLS 推荐配置
└── README.md
```

## 组件编写示例

完整的组件示例见 [docs/example.lua](docs/example.lua)。核心模式：

```lua
---@meta
---@class MyComponent: WorldComponent
local MyComponent = {}

-- 属性定义
MyComponent.propertys = {
    health = { type = Mini.Number, default = 100 },
    speed  = { type = Mini.Number, default = 10 },
}

-- 开放函数
MyComponent.openFnArgs = {
    GetHealth = {
        returnType = Mini.Number,
        displayName = "获取血量",
        params = {},
    },
}

function MyComponent:OnStart()
    self.health = self:GetHealth()
end

return MyComponent
```

## 测试文件

`test/diagnostics/` 目录包含 15 个测试文件，每个文件测试一个或一组诊断规则，同时包含违规代码和合规代码：

| 文件 | 测试内容 |
|------|----------|
| `test_lifecycle.lua` | 生命周期方法必须为函数 |
| `test_official.lua` | 不能重定义官方方法 |
| `test_keyword.lua` | 属性名不能使用保留关键字 |
| `test_property_type.lua` | 属性 type 必须可解析 |
| `test_forbid_dev.lua` | 禁止使用的属性类型 |
| `test_customdata.lua` | CustomData 必须提供 customDef |
| `test_openfnargs_method.lua` | openFnArgs 方法必须有定义 |
| `test_openfnargs_params.lua` | params 类型必须有效 |
| `test_openfnargs_value.lua` | openFnArgs 值类型必须正确 |
| `test_displayname.lua` | displayName 必须为字符串 |
| `test_returntype.lua` | returnType 必须有效 |
| `test_array_itemtype.lua` | Array 的 itemType 必须有效 |
| `test_disabled_lib.lua` | 禁用标准库检测 |
| `test_isvalid.lua` | GetComponent 后有效性检查 |
| `test_scriptsupportevent.lua` | ScriptSupportEvent 检测 |

## AI 辅助开发

项目提供了两个 OpenCode Skill，用于 AI 辅助开发时需要手动引用：

- **`miniworld-coding`** — 编写游戏脚本时使用，提供组件编写规范、API 使用指南
- **`miniworld-code-api-update`** — 更新类型定义库时使用，提供 API 来源优先级、参数签名获取流程

使用方式：在 OpenCode 中通过 `skill(name="miniworld-coding")` 或 `/miniworld-coding` 加载。

## 相关资源

- [Mini World UGC 开发文档](https://dev-wiki.mini1.cn/ugc-wiki/)
- [Lua Language Server](https://luals.github.io)
- [LLS-Addons](https://github.com/LuaLS/LLS-Addons)
