---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Log<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class Log
Log = {}

---把多个参数拼接为一条日志文本
---表会递归序列化，userdata 会尝试转换为数组
---表最多展开 100 项
---@vararg any
---@return string result 以逗号拼接的文本
function Log:GetAllMessage(...) end

---按当前日志级别输出日志
---仅在日志级别大于等于 5 时输出
---移动端走 MiniLogError，PC 端走 MiniLog
---@vararg any
function Log:Print(...) end

---输出表内容
---当前版本为空实现，不输出任何内容
---@vararg any
function Log:PrintTable(...) end

---开关开发者日志输出
---@param isOpen boolean 是否开启
function Log:RefreshOpenLog(isOpen) end

---上报脚本错误
---当前版本为空实现
---@param modId any 模组ID
---@param msg string 错误信息
function Log:ReportError(modId, msg) end

---把表递归格式化为可读字符串
---字符串用 %q 加引号，嵌套表按四空格缩进
---@param value table 待格式化的表
---@param maxItems? number 最多展开的项数，默认 100
---@param indent? number 初始缩进层级，默认 0
---@return string result 格式化文本
function Log:TableToString(value, maxItems, indent) end
