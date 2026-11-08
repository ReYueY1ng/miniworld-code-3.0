---@meta

---触发器 KvMap 模块（Trigger.KvMap）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.KvMap
Trigger.KvMap = {}

---获取数据列表bykey
---@param varid any 变量ID
---@param playerid any 玩家ID
---@param key any 键名
---@param itype any 类型
function Trigger.KvMap:GetDataListBykey(varid, playerid, key, itype) end

---获取order数据bykey
---@param varid any 变量ID
---@param playerid any 玩家ID
---@param ktype any 键类型
---@param key number | string 键名
function Trigger.KvMap:GetOrderDataBykey(varid, playerid, ktype, key) end

---移除数据列表bykey
---@param varid any 变量ID
---@param playerid any 玩家ID
---@param key any 键名
function Trigger.KvMap:RemoveDataListBykey(varid, playerid, key) end

---按键移除order数据
---@param varid any 变量ID
---@param playerid any 玩家ID
---@param ktype any 键类型
---@param key number | string 键名
function Trigger.KvMap:RemoveOrderDataByKey(varid, playerid, ktype, key) end

---设置数据列表bykey
---@param varid any 变量ID
---@param playerid any 玩家ID
---@param key any 键名
---@param value any 值
function Trigger.KvMap:SetDataListBykey(varid, playerid, key, value) end

---设置order数据bykey
---@param varid any 变量ID
---@param playerid any 玩家ID
---@param ktype any 键类型
---@param key number | string 键名
---@param opcode any 参数 opcode
---@param value number 值
---@param extendinfo string 参数 extendinfo
function Trigger.KvMap:SetOrderDataBykey(varid, playerid, ktype, key, opcode, value, extendinfo) end
