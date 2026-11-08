---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Timeline<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---暂停或继续玩家的时间轴播放
---时间轴管理器缺失或参数为空时返回 false
---@param uin integer 玩家Uin
---@param timelineId any 时间轴ID
---@param pause any 是否暂停
---@return boolean result 是否调用成功
function Timeline:PauseForPlayer(uin, timelineId, pause) end
