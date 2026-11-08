---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Log<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class Log
Log = {}

---获取全部消息
---@vararg any
function Log:GetAllMessage(...) end

---打印
---@vararg any
function Log:Print(...) end

---打印表
---@vararg any
function Log:PrintTable(...) end

---刷新打开记录
---@param isOpen any 是否打开
function Log:RefreshOpenLog(isOpen) end

---上报error
---@param modId any 模组ID
---@param msg any 消息
function Log:ReportError(modId, msg) end

---表转换为string
---@param value table 值
---@param maxItems? number 最大道具
---@param indent? number 参数 indent
function Log:TableToString(value, maxItems, indent) end
