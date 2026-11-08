---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Data.Array<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param varId any
---@param playerId any
function Data.Array:ClearNilValue(varId, playerId) end

---官方环境独有接口（未收录于开发环境）
---@param array any
function Data.Array:ConvertNomalArray(array) end

---官方环境独有接口（未收录于开发环境）
---@param data any
---@param itemType any
function Data.Array:DealArrayData(data, itemType) end

---官方环境独有接口（未收录于开发环境）
---@param tags? number | string | table
---@param isToC any
---@param varType any
---@param outval any
function Data.Array:DealTagToArrayData(tags, isToC, varType, outval) end
