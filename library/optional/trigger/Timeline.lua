---@meta

---触发器 Timeline 模块（Trigger.Timeline）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Timeline
Trigger.Timeline = {}

---获取display名称
---@param filename? any 文件名
---@return string value 结果字符串
function Trigger.Timeline:GetDisplayName(filename) end

---暂停
---@param data? integer | integer[] 数据
---@param filename any 文件名
---@return boolean result 是否成功
function Trigger.Timeline:Pause(data, filename) end

---为玩家播放
---@param data? integer | integer[] 数据
---@param filename any 文件名
---@param playRef any 参数 playRef
---@param a any 参数 a
---@param b any 参数 B
---@return boolean result 是否成功
function Trigger.Timeline:PlayForPlayer(data, filename, playRef, a, b) end

---恢复
---@param data? integer | integer[] 数据
---@param filename any 文件名
---@return boolean result 是否成功
function Trigger.Timeline:Resume(data, filename) end

---为玩家skip
---@param data? integer | integer[] 数据
---@return boolean result 是否成功
function Trigger.Timeline:SkipForPlayer(data) end
