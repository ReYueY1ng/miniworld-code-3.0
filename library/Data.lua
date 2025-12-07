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

---设置组对应索引的值，索引值不允许大于数组当前大小
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value any 具体值
---@param index integer 索引
---@return boolean result
function Data.Array:SetValue(varId, playerId, value, index) end

---插入数据到数组，index为空就加到最后
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value any 具体值
---@param index integer 索引
---@return boolean result
function Data.Array:InsertValue(varId, playerId, value, index) end

---替换组中的值
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param newvalue any 具体值
---@param oldvalue any 具体值
---@return boolean result
function Data.Array:ReplaceValue(varId, playerId, newvalue, oldvalue) end

---获取对应索引数据
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param index integer 索引
---@return any value 返回值
function Data.Array:GetValue(varId, playerId, index) end

---获取数据对应索引
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value any 具体值
---@return integer index 索引
function Data.Array:GetIndexByValue(varId, playerId, value) end

---删除数组中该值的所有数据
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value any 具体值
---@return boolean result
function Data.Array:RemoveByValue(varId, playerId, value) end

---删除索引的值
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param index integer 索引
---@return boolean result
function Data.Array:Remove(varId, playerId, index) end

---清理数组数据
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@return boolean result
function Data.Array:Clear(varId, playerId) end

---数组排序
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param isUp integer 排序方式(SortType)
---@return boolean result
function Data.Array:Sort(varId, playerId, isUp) end

---获取数组长度
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@return integer num 数量
function Data.Array:GetSize(varId, playerId) end

---获取数组所有数据
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@return table array 数组
function Data.Array:GetAllValue(varId, playerId) end

---获取数组最大值
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@return number max 数值
function Data.Array:GetMax(varId, playerId) end

---获取数组最小值
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@return number min 数值
function Data.Array:GetMin(varId, playerId) end

---组是否有值
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value any 具体值
---@return boolean result
function Data.Array:HasValue(varId, playerId, value) end

---任意组索引是否有任意值
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param index integer 索引
---@return boolean result
function Data.Array:HasValueByNo(varId, playerId, index) end

---组合并
---@param varId string 被合并的组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param index integer 索引
---@param mergevarId string 合并组ID
---@param mergeplayerId integer? 玩家ID（全局变量传nil）
---@return boolean result
function Data.Array:InsertValues(varId, playerId, index, mergevarId, mergeplayerId) end

---删除组中对应组的值
---@param varId string 被删除的组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param removevarId string 删除组ID
---@param removeplayerId integer? 玩家ID（全局变量传nil）
---@return boolean result
function Data.Array:RemoveByValues(varId, playerId, removevarId, removeplayerId) end

---获取任意组种任意值的数量
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value any 具体值
---@return integer num 数量
function Data.Array:GetCountByValue(varId, playerId, value) end

---数值组指定索引值增加指定值
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value any 具体值
---@param index integer 索引
---@return boolean result
function Data.Array:IncreasesValue(varId, playerId, value, index) end

---二维表变量数据管理接口
---@class Data.Table
Data.Table = {}

---一维(kv)表/排行榜 变量数据管理接口
---@class Data.Map
Data.Map = {}