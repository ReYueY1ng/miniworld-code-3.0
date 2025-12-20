---@meta

---状态模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/buff.html)
---@class Buff
Buff = {}

---给对象附加效果
---@param objid integer 对象ID
---@param buffid integer | string 效果ID
---@param customticks number 效果持续时间(-1表示默认配置，0表示无限)
---@return boolean result
function Buff:AddBuff(objid, buffid, customticks) end

---给对象移除指定效果
---@param objid integer 对象ID
---@param buffid integer | string 效果ID
---@return boolean result
function Buff:RemoveBuff(objid, buffid) end

---给对象清除所有效果
---@param objid integer 对象ID
---@return boolean result
function Buff:ClearAllBuff(objid) end

---为对象清除所有负面效果
---@param objid integer 对象ID
---@return boolean result
function Buff:ClearAllBadBuff(objid) end

---为对象清除所有有益效果
---@param objid integer 对象ID
---@return boolean result
function Buff:ClearAllGoodBuff(objid) end

---判断对象身上是否有指定效果
---@param objid integer 对象ID
---@param buffid integer | string 效果ID
---@return boolean result
function Buff:HasBuff(objid, buffid) end

---获取对象身上效果列表
---@param objid integer 对象ID
---@return integer num 效果数量
---@return (integer | string)[] arr 效果ID数组
function Buff:GetBuffList(objid) end

---获取对象身上指定效果数量
---@param objid integer 对象ID
---@param buffid integer | string 效果ID
---@return integer num 数量
function Buff:GetBuffNumByBuffid(objid, buffid) end

---获取对象身上指定效果剩余时间
---@param objid integer 对象ID
---@param buffid integer | string 效果ID
---@return number time 剩余时间(秒, 0表示永久)
function Buff:GetBuffLeftTime(objid, buffid) end

---获取状态效果名称
---@param buffid integer | string 效果ID
---@return string name 效果名称
function Buff:GetBuffDefName(buffid) end

---获取状态效果描述
---@param buffid integer | string 效果ID
---@return string name 状态效果描述
function Buff:GetBuffDefDesc(buffid) end

---替换已有状态
---@param objid integer 对象ID
---@param buffsrc integer | string 源状态ID
---@param buffdst integer | string 目标状态ID
---@param customticks number 效果持续时间(-1表示默认配置，0表示无限)
---@return boolean result
function Buff:ReplaceBuff(objid, buffsrc, buffdst, customticks) end