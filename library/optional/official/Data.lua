---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Data<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---按列序号和值查找 CSV 表中的行
---@param filename string CSV 文件名
---@param col number 列序号
---@param value any 要匹配的值
---@return table? row 匹配到的行数据
function Data:GetRowByColIndex(filename, col, value) end

---按列名和值查找 CSV 表中的行
---@param filename string CSV 文件名
---@param name string 列名
---@param value any 要匹配的值
---@return table? row 匹配到的行数据
function Data:GetRowByColName(filename, name, value) end

---按行号读取 CSV 表的一行
---@param filename string CSV 文件名
---@param row any 行号
---@return table? row 行数据
function Data:GetRowByIndex(filename, row) end

---获取 CSV 表的全部行
---@param filename string CSV 文件名
---@return table? rows 行数组
function Data:GetRows(filename) end

---按变量名获取变量ID
---变量不存在时返回 nil
---@param varname string 变量名
---@return number? varId 变量ID
function Data:GetVarID(varname) end

---把 CSV 文件加载为可查询的二维表
---失败时会向玩家 0 推送 "文件名 Load File" 提示
---@param filename string CSV 文件名
---@param colkey any 作为列键的行号
---@param istartrow any 起始行
---@param istartcol any 起始列
---@param ingnoremask any 忽略遮罩标记
---@return boolean? result 是否加载成功
function Data:LoadCsv2Table(filename, colkey, istartrow, istartcol, ingnoremask) end

---读取玩家的存档数据
---uin 或文件名缺失时不读取
---@param uin integer 玩家Uin
---@param filename string 存档文件名
---@return table? data 存档数据表
function Data:ReadPlayerData(uin, filename) end

---读取玩家存档并转换为键值表
---与 ReadPlayerData 的区别是结果按键值对组织
---@param uin integer 玩家Uin
---@param filename string 存档文件名
---@return table? data 存档数据表
function Data:ReadPlayerDataToMap(uin, filename) end

---保存玩家的存档数据
---三个参数缺一不可
---@param uin integer 玩家Uin
---@param filename string 存档文件名
---@param tabval any 要保存的表数据
---@return boolean? result 是否保存成功
function Data:SavePlayerData(uin, filename, tabval) end

---把表数据按键值对保存为玩家存档
---三个参数缺一不可
---@param uin integer 玩家Uin
---@param filename string 存档文件名
---@param tabval any 要保存的表数据
---@return boolean? result 是否保存成功
function Data:SavePlayerDataToMap(uin, filename, tabval) end
