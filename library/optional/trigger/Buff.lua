---@meta

---触发器 Buff 模块（Trigger.Buff）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Buff
Trigger.Buff = {}

---添加状态
---@param data integer | integer[] 数据
---@param buffid any 状态ID
---@param bforever any 参数 bforever
---@param ctime any c时间
---@return boolean result 是否成功
function Trigger.Buff:AddBuff(data, buffid, bforever, ctime) end

---比较状态
---@param buff1 any 参数 buff1
---@param buff2 any 参数 buff2
function Trigger.Buff:CompareBuff(buff1, buff2) end

---获取状态left时间
---@param objid any 对象ID
---@param buffid any 状态ID
function Trigger.Buff:GetBuffLeftTime(objid, buffid) end

---判断是否拥有状态
---@param data integer | integer[] 数据
---@param buffid any 状态ID
---@return boolean result 是否满足条件
function Trigger.Buff:HasBuff(data, buffid) end

---移除状态
---@param data integer | integer[] 数据
---@param buffid number | string | userdata 状态ID
---@return boolean result 是否成功
function Trigger.Buff:RemoveBuff(data, buffid) end

---替换状态
---@param data integer | integer[] 数据
---@param buffer1 any 参数 buffer1
---@param buffer2 any 参数 buffer2
---@param bforever any 参数 bforever
---@param ctime any c时间
---@return boolean result 是否成功
function Trigger.Buff:ReplaceBuff(data, buffer1, buffer2, bforever, ctime) end
