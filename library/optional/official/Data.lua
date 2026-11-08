---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Data<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---按col索引获取row
---@param filename any 文件名
---@param col any 列
---@param value any 值
function Data:GetRowByColIndex(filename, col, value) end

---按col名称获取row
---@param filename any 文件名
---@param name any 名称
---@param value any 值
function Data:GetRowByColName(filename, name, value) end

---按索引获取row
---@param filename any 文件名
---@param row any 参数 row
function Data:GetRowByIndex(filename, row) end

---获取rows
---@param filename any 文件名
function Data:GetRows(filename) end

---获取varID
---@param varname any var名称
function Data:GetVarID(varname) end

---加载csv2表
---@param filename any 文件名
---@param colkey any 参数 colkey
---@param istartrow any 是否tartrow
---@param istartcol any 是否tartcol
---@param ingnoremask any 参数 ingnoremask
function Data:LoadCsv2Table(filename, colkey, istartrow, istartcol, ingnoremask) end

---读取玩家数据
---@param uin any 玩家Uin
---@param filename any 文件名
function Data:ReadPlayerData(uin, filename) end

---读取玩家数据转换为地图
---@param uin any 玩家Uin
---@param filename any 文件名
function Data:ReadPlayerDataToMap(uin, filename) end

---保存玩家数据
---@param uin any 玩家Uin
---@param filename any 文件名
---@param tabval any 表数据
function Data:SavePlayerData(uin, filename, tabval) end

---保存玩家数据转换为地图
---@param uin any 玩家Uin
---@param filename any 文件名
---@param tabval any 表数据
function Data:SavePlayerDataToMap(uin, filename, tabval) end
