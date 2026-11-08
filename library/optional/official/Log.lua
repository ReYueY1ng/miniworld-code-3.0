---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Log<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class Log
Log = {}

---官方环境独有接口（未收录于开发环境）
---@vararg any
function Log:GetAllMessage(...) end

---官方环境独有接口（未收录于开发环境）
---@vararg any
function Log:Print(...) end

---官方环境独有接口（未收录于开发环境）
---@vararg any
function Log:PrintTable(...) end

---官方环境独有接口（未收录于开发环境）
---@param isOpen any
function Log:RefreshOpenLog(isOpen) end

---官方环境独有接口（未收录于开发环境）
---@param modId any
---@param msg any
function Log:ReportError(modId, msg) end

---官方环境独有接口（未收录于开发环境）
---@param value any
---@param maxItems any
---@param indent any
function Log:TableToString(value, maxItems, indent) end
