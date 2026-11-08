---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Data.Map<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---创建tmp地图
---@param varType any 参数 varType
---@param data any 数据
function Data.Map:CreateTmpMap(varType, data) end

---获取全部值
---@param varId any 变量ID
---@param playerId any 玩家ID
function Data.Map:GetAllValue(varId, playerId) end

---获取地图值
---@param varId? any 变量ID
---@param playerId any 玩家ID
---@param key any 键名
function Data.Map:GetMapValue(varId, playerId, key) end

---获取显示run数据
---@param varId any 变量ID
---@param playerId any 玩家ID
function Data.Map:GetShowRunData(varId, playerId) end

---获取user数据值
---@param key any 键名
function Data.Map:GetUserDataValue(key) end

---在地图中获取user数据值
---@param key any 键名
function Data.Map:GetUserDataValueInMap(key) end

---移除地图值
---@param varId? any 变量ID
---@param playerId any 玩家ID
---@param key any 键名
function Data.Map:RemoveMapValue(varId, playerId, key) end

---设置地图值
---@param varId? any 变量ID
---@param playerId any 玩家ID
---@param key any 键名
---@param value any 值
function Data.Map:SetMapValue(varId, playerId, key, value) end

---设置user数据值
---@param key any 键名
---@param value any 值
function Data.Map:SetUserDataValue(key, value) end

---在地图中设置user数据值
---@param key any 键名
---@param value any 值
function Data.Map:SetUserDataValueInMap(key, value) end

---检查键
---@param key any 键名
function Data.Map:__CheckKey(key) end
