---@meta

---触发器 Timeline 模块（Trigger.Timeline）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Timeline
Trigger.Timeline = {}

---获取 Timeline 资源在编辑器中的显示名称
---filename 为空时返回空字符串
---当前地图资源未加载时同样返回传入的 ID
---@param filename? string Timeline 资源ID或文件路径
---@return string name 显示名称，找不到资源时返回传入的 ID
function Trigger.Timeline:GetDisplayName(filename) end

---暂停玩家正在播放的 Timeline
---data 或 filename 为空时返回 false
---不校验该 Timeline 是否正在播放
---@param data? integer | integer[] 玩家ID或其数组
---@param filename string Timeline 资源ID或文件名
---@return boolean result 参数齐全即返回 true
function Trigger.Timeline:Pause(data, filename) end

---为玩家播放 Timeline
---playRef 缺省按 0 处理
---Timeline 参考系与 playRef 不匹配时提示并返回 false
---按玩家参考制作时只能用 0 或 2，按世界坐标制作时只能用 0 或 1
---@param data? integer | integer[] 玩家ID或其数组
---@param filename string Timeline 资源ID或文件名
---@param playRef any 播放参考：0 默认，1 参考世界坐标，2 参考玩家
---@param a any playRef 为 1 时是参考坐标表（方块坐标），为 2 时是参考玩家ID
---@param b any playRef 为 1 时的参考朝向 yaw
---@return boolean result 是否开始播放
function Trigger.Timeline:PlayForPlayer(data, filename, playRef, a, b) end

---恢复玩家被暂停的 Timeline
---data 或 filename 为空时返回 false
---@param data? integer | integer[] 玩家ID或其数组
---@param filename string Timeline 资源ID或文件名
---@return boolean result 参数齐全即返回 true
function Trigger.Timeline:Resume(data, filename) end

---跳过玩家当前播放的 Timeline
---不需要指定 Timeline，会跳过该玩家所有正在播放的 Timeline
---data 为空时返回 false
---@param data? integer | integer[] 玩家ID或其数组
---@return boolean result data 不为空即返回 true
function Trigger.Timeline:SkipForPlayer(data) end
