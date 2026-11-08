---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Data<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param filename any
---@param col any
---@param value any
function Data:GetRowByColIndex(filename, col, value) end

---官方环境独有接口（未收录于开发环境）
---@param filename any
---@param name any
---@param value any
function Data:GetRowByColName(filename, name, value) end

---官方环境独有接口（未收录于开发环境）
---@param filename any
---@param row any
function Data:GetRowByIndex(filename, row) end

---官方环境独有接口（未收录于开发环境）
---@param filename any
function Data:GetRows(filename) end

---官方环境独有接口（未收录于开发环境）
---@param varname any
function Data:GetVarID(varname) end

---官方环境独有接口（未收录于开发环境）
---@param filename any
---@param colkey any
---@param istartrow any
---@param istartcol any
---@param ingnoremask any
function Data:LoadCsv2Table(filename, colkey, istartrow, istartcol, ingnoremask) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param filename any
function Data:ReadPlayerData(uin, filename) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param filename any
function Data:ReadPlayerDataToMap(uin, filename) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param filename any
---@param tabval any
function Data:SavePlayerData(uin, filename, tabval) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param filename any
---@param tabval any
function Data:SavePlayerDataToMap(uin, filename, tabval) end
