---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Status<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class Status
Status = {}

---给对象添加指定状态
---持续时间内部乘以 20 换算为 tick
---@param objid integer 对象ID
---@param buffid? string 状态配置ID或资源ID字符串
---@param bufflv? number 状态等级，默认 1
---@param customticks? number 自定义持续时间（秒），省略或 -1 表示使用状态定义时长
---@return boolean result 是否成功
function Status:AddBuff(objid, buffid, bufflv, customticks) end

---清除对象身上的全部负面状态
---@param objid integer 对象ID
---@return boolean result 是否成功
function Status:ClearAllBadBuff(objid) end

---清除对象身上的全部状态
---@param objid integer 对象ID
---@return boolean result 是否成功
function Status:ClearAllBuff(objid) end

---把状态参数规范化为引擎状态配置ID
---自定义状态直接返回状态ID，普通状态返回 buffid*1000+等级
---@param buff any 状态ID（数字编码 buffid*1000+等级、{id, lvl} 表或资源ID字符串）
---@return boolean result 是否解析成功
---@return number? cfgid 规范化后的状态配置ID
function Status:GetBuffCfg(buff) end

---把状态参数拆分为状态ID与等级
---数字按除以 1000 取整与取余拆分，表读取 id 与 lvl 字段
---@param buff? string 状态ID（数字编码 buffid*1000+等级、{id, lvl} 表或资源ID字符串）
---@return boolean result 是否解析成功
---@return number? buffid 状态ID
---@return number? bufflv 状态等级
function Status:GetBuffData(buff) end

---获取状态定义中的描述文本
---内部先经 GetBuffCfg 规范化
---@param buffid? string 状态ID（编码值或资源ID字符串）
---@return string? desc 状态描述，查询失败时为 nil
function Status:GetBuffDefDesc(buffid) end

---获取状态定义中的默认等级
---与 GetBuffDefName 不同，此处不做 buffid*1000+等级 的拆分
---@param buffid? string 状态配置ID（直接传给引擎，不做编码拆分）
---@return number? level 默认等级
function Status:GetBuffDefLevel(buffid) end

---获取状态定义中的名称
---内部先经 GetBuffCfg 规范化
---@param buffid? string 状态ID（编码值或资源ID字符串）
---@return string? name 状态名称
function Status:GetBuffDefName(buffid) end

---获取状态定义中的默认持续时间
---与 GetBuffDefName 不同，此处不做 buffid*1000+等级 的拆分
---@param buffid? string 状态配置ID（直接传给引擎，不做编码拆分）
---@return number? ticks 持续时间（tick）
function Status:GetBuffDefTicks(buffid) end

---获取状态在对象状态列表中的索引
---@param objid integer 对象ID
---@param buffid? string 状态配置ID或资源ID字符串
---@return number? index 状态索引
function Status:GetBuffIndex(objid, buffid) end

---获取状态的剩余持续时间
---引擎返回 tick，接口按 20 tick/秒 换算
---@param objid integer 对象ID
---@param buffid? string 状态配置ID或资源ID字符串
---@return number? seconds 剩余秒数
function Status:GetBuffLeftTime(objid, buffid) end

---获取对象身上的状态列表
---查询失败时无返回值
---@param objid integer 对象ID
---@return number? num 状态数量
---@return table? arr 状态ID数组
function Status:GetBuffList(objid) end

---获取对象身上指定状态的名称
---@param objid integer 对象ID
---@param buffid? string 状态配置ID或资源ID字符串
---@return string? name 状态名称
function Status:GetBuffName(objid, buffid) end

---统计对象身上指定状态的层数
---@param objid integer 对象ID
---@param buffid? string 状态配置ID或资源ID字符串
---@return number? num 状态层数
function Status:GetBuffNumByBuffid(objid, buffid) end

---判断对象是否拥有指定等级的状态
---@param objid integer 对象ID
---@param buffid? string 状态配置ID或资源ID字符串
---@param bufflv? number 状态等级，默认 1
---@return boolean result 是否拥有
function Status:HasBuff(objid, buffid, bufflv) end

---刷新对象身上全部状态的持续时间计时
---@param objid integer 对象ID
---@return boolean result 是否成功
function Status:RefreshAllBuffTick(objid) end

---移除对象身上的指定状态
---@param objid integer 对象ID
---@param buffid? string 状态配置ID或资源ID字符串
---@return boolean result 是否成功
function Status:RemoveBuff(objid, buffid) end

---按层数把对象的源状态替换为目标状态
---源与目标完全相同时直接返回 true
---先移除源状态，再按原有层数逐层添加目标状态，任一层失败即返回 false
---源状态不存在时返回 false
---@param objid integer 对象ID
---@param buffsrc any 源状态ID
---@param buffsrclv any 源状态等级
---@param buffdst any 目标状态ID
---@param buffdstlv any 目标状态等级
---@param customticks number 新状态持续时间（秒），默认 -1 表示使用定义时长
---@return boolean result 是否全部替换成功
function Status:ReplaceBuff(objid, buffsrc, buffsrclv, buffdst, buffdstlv, customticks) end

---设置对象是否免疫新状态
---内部通过添加或移除 -1 号免疫状态实现
---@param objid integer 对象ID
---@param isForbid boolean true 表示禁止添加状态
---@return boolean result 是否成功
function Status:SetForbidAddBuff(objid, isForbid) end
