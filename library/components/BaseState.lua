---@meta

---基础状态组件接口（内置组件 BaseState）<br>[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/basestate.html)
---@class BaseState: Component
BaseState = {}

---设置能力组开关
---设置生物的内置能力组开关，并由底层标记状态及同步；需要已有标签条件组件，编辑预制体时跳过。此开关不表示能力当前已激活。
---@param abilityGroupId Mini.Number 能力组ID，见EDefaultAbilityGroupID（0～3）。
---@param bOpen Mini.Bool true启用能力组，false禁用。
function BaseState:SetAbilityGroupState(abilityGroupId, bOpen) end

---获取能力组开关
---查询生物内置能力组的启用开关；不判断该组内各能力是否满足标签条件或正在执行。
---@param abilityGroupId Mini.Number 能力组ID，见EDefaultAbilityGroupID（0～3）。
---@return Mini.Bool 返回组开关boolean；没有生物对象时返回false；编辑预制体时返回nil；越界组ID会触发底层断言，断言禁用时返回false。
function BaseState:GetAbilityGroupState(abilityGroupId) end

---设置能力开关
---设置生物的单个内置能力开关，并由底层标记状态及同步；需要标签条件组件，编辑预制体时跳过。启用后仍受所属组与标签条件限制。
---@param abilityId Mini.Number 能力ID，见EDefaultAbilityID（0～40）。
---@param bOpen Mini.Bool true启用能力，false禁用。
function BaseState:SetAbilityState(abilityId, bOpen) end

---获取能力开关
---查询生物单个内置能力的启用开关；不判断所属组、标签条件或能力当前执行状态。
---@param abilityId Mini.Number 能力ID，见EDefaultAbilityID（0～40）。
---@return Mini.Bool 返回能力开关boolean；没有生物对象时返回false；编辑预制体时返回nil；越界能力ID会触发底层断言，断言禁用时返回false。
function BaseState:GetAbilityState(abilityId) end
