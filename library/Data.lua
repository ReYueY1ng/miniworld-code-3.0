---@meta

---普通变量数据管理接口
---@class Data
Data = {}

---设置变量值
---@param varId string 变量ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value any 设置的值
---@return boolean result
function Data:SetValue(varId, playerId, value) end

---获取变量值
---@param varId string 变量ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@return any value 返回值
function Data:GetValue(varId, playerId) end

---数值变量增加值
---@param varId string 变量ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value number 设置的值
---@return number value 返回值
function Data:IncreasesValue(varId, playerId, value) end

---数组变量数据管理接口
---@class Data.Array
Data.Array = {}

---二维表变量数据管理接口
---@class Data.Table
Data.Table = {}

---一维(kv)表/排行榜 变量数据管理接口
---@class Data.Map
Data.Map = {}