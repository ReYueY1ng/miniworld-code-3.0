---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Data.Table<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---获取col道具类型
---@param varId? any 变量ID
---@param playerId any 玩家ID
---@param col any 列
function Data.Table:GetColItemType(varId, playerId, col) end

---更新linevalues
---@param varId any 变量ID
---@param playerId any 玩家ID
---@param value any 值
function Data.Table:UpdateLineValues(varId, playerId, value) end
