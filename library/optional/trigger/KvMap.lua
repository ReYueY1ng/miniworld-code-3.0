---@meta

---触发器 KvMap 模块（Trigger.KvMap）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.KvMap
Trigger.KvMap = {}

---读取键值变量中指定键的值
---值类型与 itype 不符时返回 KV_OP_INVALID_VAL 并把值置空
---字符串值会先按存档格式解码再返回
---@param varid integer 键值变量ID
---@param playerid integer 玩家ID，0 表示公共数据
---@param key any 键名，只允许字母数字与英文符号，长度不超过 50
---@param itype number 期望的值类型（VarType），数组类型会转成临时数组对象
---@return number code 错误码（0 成功，4 无此键，5 值类型不匹配，1001 失败）
---@return any value 键对应的值，失败时为 nil
function Trigger.KvMap:GetDataListBykey(varid, playerid, key, itype) end

---按键或名次读取排序数据中的值
---ktype 为 1/2 时按 key 精确查找，3/4 时 key 表示名次
---扩展信息会解码成临时键值表对象返回
---@param varid integer 排序键值变量ID
---@param playerid integer 玩家ID，0 表示公共数据
---@param ktype number 查询方式：1 数字键，2 字符串键，3 升序名次，4 降序名次
---@param key number | string 键名或名次，名次需大于 0
---@return number code 错误码（0 成功，4 无对应数据，1001 失败）
---@return any value 读取到的数值，失败时为 nil
---@return table? map 扩展信息临时表，无扩展信息时为 nil
function Trigger.KvMap:GetOrderDataBykey(varid, playerid, ktype, key) end

---删除键值变量中指定键的数据
---键名非法或变量不存在时返回 1001
---@param varid integer 键值变量ID
---@param playerid integer 玩家ID，0 表示公共数据
---@param key any 键名，只允许字母数字与英文符号
---@return number code 操作错误码（0 成功，1001 失败）
function Trigger.KvMap:RemoveDataListBykey(varid, playerid, key) end

---按排序数据的键删除指定记录
---只支持 ktype 为 1/2 的按键删除，其他取值直接返回失败码
---@param varid integer 排序键值变量ID
---@param playerid integer 玩家ID，0 表示公共数据
---@param ktype number 键类型：1 数字键，2 字符串键
---@param key number | string 键名，需与 ktype 类型一致
---@return number code 操作错误码（0 成功，1001 失败）
function Trigger.KvMap:RemoveOrderDataByKey(varid, playerid, ktype, key) end

---向键值变量写入指定键的值
---数组变量会先编码成存档字符串再写入
---键名非法或值为 nil 时返回 1001
---@param varid integer 键值变量ID
---@param playerid integer 玩家ID，0 表示公共数据
---@param key any 键名，只允许字母数字与英文符号，长度不超过 50
---@param value any 写入值，支持数字、字符串、布尔与数组变量对象
---@return number code 操作错误码（0 成功，1001 失败）
function Trigger.KvMap:SetDataListBykey(varid, playerid, key, value) end

---写入或增减排序数据中的数值
---ktype 为 2 时 key 必须是字符串，为 1 时必须是数字
---只有 ktype 与 key 类型匹配才会真正写入
---@param varid integer 排序键值变量ID
---@param playerid integer 玩家ID，0 表示公共数据
---@param ktype number 键类型：1 数字键，2 字符串键
---@param key number | string 键名，需与 ktype 类型一致
---@param opcode any 操作类型：1 增加，2 减少，3 覆盖设置
---@param value number 要设置或增减的数值
---@param extendinfo string 扩展信息，可传临时键值表对象或已编码字符串
---@return number? code 操作错误码（0 成功，1001 失败），opcode 非法时为 nil
function Trigger.KvMap:SetOrderDataBykey(varid, playerid, ktype, key, opcode, value, extendinfo) end
