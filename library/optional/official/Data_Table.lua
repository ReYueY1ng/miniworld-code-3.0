---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Data.Table<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---获取表格指定列的道具类型
---变量不存在时返回 nil
---@param varId? integer 变量ID
---@param playerId integer 玩家ID
---@param col number 列号
---@return number? itemType 道具类型
function Data.Table:GetColItemType(varId, playerId, col) end

---按行批量更新表格数据
---@param varId integer 变量ID
---@param playerId integer 玩家ID
---@param value any 行数据表
---@return any? result 底层更新结果
function Data.Table:UpdateLineValues(varId, playerId, value) end
