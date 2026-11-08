---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Data.Array<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---清空nil值
---@param varId any 变量ID
---@param playerId any 玩家ID
function Data.Array:ClearNilValue(varId, playerId) end

---转换nomal数组
---@param array any 数组
function Data.Array:ConvertNomalArray(array) end

---deal数组数据
---@param data any 数据
---@param itemType any 道具类型
function Data.Array:DealArrayData(data, itemType) end

---deal标签转换为数组数据
---@param tags? number | string | table 标签
---@param isToC any 是否toc
---@param varType any 参数 varType
---@param outval any 参数 outval
function Data.Array:DealTagToArrayData(tags, isToC, varType, outval) end
