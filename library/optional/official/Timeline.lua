---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Timeline<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param timelineId any
---@param pause any
---@return boolean
function Timeline:PauseForPlayer(uin, timelineId, pause) end
