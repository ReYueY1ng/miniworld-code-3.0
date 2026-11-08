---@meta

---触发器 Buff 模块（Trigger.Buff）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Buff
Trigger.Buff = {}

---为对象添加指定状态
---内部按 20 tick/秒换算持续时间
---多个对象时任一失败即返回 false
---@param data integer | integer[] 目标对象ID或其数组
---@param buffid number | string 状态ID，末 3 位表示等级
---@param bforever boolean 是否永久，为 true 时忽略 ctime
---@param ctime number 持续秒数
---@return boolean result 是否全部添加成功
function Trigger.Buff:AddBuff(data, buffid, bforever, ctime) end

---比较两个状态ID是否相同
---直接比较原值，数字与字符串形式不同即视为不同
---@param buff1 number | string 状态ID或状态资源ID
---@param buff2 number | string 另一个状态ID或资源ID
---@return boolean result 是否相同
function Trigger.Buff:CompareBuff(buff1, buff2) end

---获取对象身上指定状态的剩余时间
---返回 0 通常表示永久状态
---@param objid number 对象ID
---@param buffid number | string 状态ID，末 3 位表示等级
---@return number? num 剩余秒数，状态不存在或参数非法时为 nil
function Trigger.Buff:GetBuffLeftTime(objid, buffid) end

---判断对象是否带有指定状态
---多个对象时任一对象缺失即返回 false
---@param data integer | integer[] 目标对象ID或其数组
---@param buffid number | string 状态ID，末 3 位表示等级
---@return boolean result 是否全部带有该状态
function Trigger.Buff:HasBuff(data, buffid) end

---移除对象身上的状态
---传数字 1 清除全部状态，2 清除增益状态，3 清除减益状态
---传 userdata 状态数组时逐个移除
---@param data integer | integer[] 目标对象ID或其数组
---@param buffid number | string | userdata 状态ID；数字 1/2/3 分别表示清除全部、增益、减益状态
---@return boolean result 是否全部移除成功
function Trigger.Buff:RemoveBuff(data, buffid) end

---把对象身上的源状态全部替换为目标状态
---按源状态的层数逐个添加目标状态，保持数量一致
---源状态不存在时返回 false
---@param data integer | integer[] 目标对象ID或其数组
---@param buffer1 number | string 源状态ID
---@param buffer2 number | string 目标状态ID
---@param bforever boolean 是否永久，为 true 时忽略 ctime
---@param ctime number 目标状态的持续秒数
---@return boolean result 是否全部替换成功
function Trigger.Buff:ReplaceBuff(data, buffer1, buffer2, bforever, ctime) end
