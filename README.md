# Mini World Code 3.0

迷你世界 UGC 3.0 代码补全工具

## 依赖

- [Lua Language Server](https://luals.github.io)

## 使用方法

1. 克隆项目仓库:

    ```bash
    git clone https://github.com/ReYueY1ng/miniworld-code-3.0.git
    ```

2. 配置 Lua Language Server:

    `.luarc.json` (通用):
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

    或者 `.vscode/settings.json` (VS Code):
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

    插件会提供组件校验诊断（如生命周期方法检查、属性类型检查、openFnArgs 参数校验等），详见 [plugin.lua](plugin.lua)。
