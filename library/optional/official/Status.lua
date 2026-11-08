---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Status<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class Status
Status = {}

---添加状态
---@param objid any 对象ID
---@param buffid? string 状态ID
---@param bufflv? number 参数 bufflv
---@param customticks? number 参数 customticks
---@return boolean result 是否成功
function Status:AddBuff(objid, buffid, bufflv, customticks) end

---清空全部bad状态
---@param objid any 对象ID
---@return boolean result 是否成功
function Status:ClearAllBadBuff(objid) end

---清空全部状态
---@param objid any 对象ID
---@return boolean result 是否成功
function Status:ClearAllBuff(objid) end

---获取状态配置
---@param buff any 状态
function Status:GetBuffCfg(buff) end

---获取状态数据
---@param buff? string 状态
---@return boolean value 是否成功
function Status:GetBuffData(buff) end

---获取状态defdesc
---@param buffid? string 状态ID
function Status:GetBuffDefDesc(buffid) end

---获取状态def等级
---@param buffid? string 状态ID
function Status:GetBuffDefLevel(buffid) end

---获取状态def名称
---@param buffid? string 状态ID
function Status:GetBuffDefName(buffid) end

---获取状态defticks
---@param buffid? string 状态ID
function Status:GetBuffDefTicks(buffid) end

---获取状态索引
---@param objid any 对象ID
---@param buffid? string 状态ID
function Status:GetBuffIndex(objid, buffid) end

---获取状态left时间
---@param objid any 对象ID
---@param buffid? string 状态ID
function Status:GetBuffLeftTime(objid, buffid) end

---获取状态列表
---@param objid any 对象ID
function Status:GetBuffList(objid) end

---获取状态名称
---@param objid any 对象ID
---@param buffid? string 状态ID
function Status:GetBuffName(objid, buffid) end

---按buffid获取状态数量
---@param objid any 对象ID
---@param buffid? string 状态ID
function Status:GetBuffNumByBuffid(objid, buffid) end

---判断是否拥有状态
---@param objid any 对象ID
---@param buffid? string 状态ID
---@param bufflv? number 参数 bufflv
---@return boolean result 是否满足条件
function Status:HasBuff(objid, buffid, bufflv) end

---刷新全部状态tick
---@param objid any 对象ID
---@return boolean result 是否成功
function Status:RefreshAllBuffTick(objid) end

---移除状态
---@param objid any 对象ID
---@param buffid? string 状态ID
---@return boolean result 是否成功
function Status:RemoveBuff(objid, buffid) end

---替换状态
---@param objid any 对象ID
---@param buffsrc any 参数 buffsrc
---@param buffsrclv any 参数 buffsrclv
---@param buffdst any 参数 buffdst
---@param buffdstlv any 参数 buffdstlv
---@param customticks any 参数 customticks
---@return boolean result 是否成功
function Status:ReplaceBuff(objid, buffsrc, buffsrclv, buffdst, buffdstlv, customticks) end

---设置forbid添加状态
---@param objid any 对象ID
---@param isForbid any 是否forbid
---@return boolean result 是否成功
function Status:SetForbidAddBuff(objid, isForbid) end
