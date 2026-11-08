---@meta

---特效组件接口（内置组件 Effect）<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/effect.html)
---@class Effect: Component
Effect = {}

---设置特效并播放
---设置对象的粒子特效资源及循环状态并请求播放；资源相同且force不为true时直接跳过，包括循环状态更新。缺少底层组件时不处理，无返回值，最终显示取决于资源和客户端条件。
---@param value Mini.Effect 特效ID或路径；none、0、-1002或空串停止。
---@param force? Mini.Bool 是否强制重播，默认false。
---@param offsetY Mini.Number Y轴偏移（格），必填。
---@param bLoop? Mini.Bool 是否循环播放，默认false。
function Effect:PlayParticle(value, force, offsetY, bLoop) end

---设置粒子循环
---修改对象粒子循环标志；标志改变且已有资源时，底层会强制重新播放该资源，偏移使用底层默认0。 参数非boolean或底层组件缺失时不处理，无返回值。
---@param value Mini.Bool 是否循环播放，true循环、false不循环。
function Effect:SetIsLoop(value) end

---播放身体特效
---请求在对象身上播放指定特效，并走底层的追踪玩家广播路径；最终加载与显示不由返回值确认。 播放分支取决于对象类别及模型是否就绪。
---@param value Mini.Effect 特效ID或名称。
---@param scale? Mini.Number 缩放倍率，默认1。
---@param ptime? Mini.Number 时长（秒），默认-1。
---@return Mini.Bool result 找到特效名称且底层组件存在、已调用播放接口时为true；资源类型错误、数字ID无定义或组件缺失时为false。
function Effect:PlayBodyEffectById(value, scale, ptime) end

---停止身体特效
---请求停止对象身上的指定特效，并走底层追踪玩家广播路径；不确认原先存在该特效或已完成停止。
---@param value Mini.Effect 特效ID或名称。
---@return Mini.Bool result 找到特效名称且底层组件存在、已调用停止接口时为true；资源类型错误、数字ID无定义或组件缺失时为false。
function Effect:StopBodyEffectById(value) end

---为指定玩家播放粒子特效
---请求为指定玩家播放此对象的粒子特效；本机目标直接设置，非本机目标仅主机且网络可用时发送定向消息。 返回true仅表示Lua已调用底层，不保证消息发送或资源显示。
---@param uin Mini.Player 目标玩家uin。
---@param particleId Mini.Effect 特效ID或路径；0或空串不处理。
---@return Mini.Bool result 底层组件存在且particleId为number或string时为true；组件缺失或类型不符时为false。
function Effect:PlayEffectParticleForUin(uin, particleId) end

---请求停止指定玩家粒子特效
---以空资源参数调用指定玩家粒子接口；当前底层SetParticleIdForUin会对数字0和空字符串直接返回，因此本调用不实际停止特效。 不能将返回true解释为已停止或消息已发送。
---@param uin Mini.Player 目标玩家uin。
---@return Mini.Bool result 始终为true，包括底层组件缺失或底层忽略空资源请求的情况。
function Effect:StopEffectParticleForUin(uin) end

---设置粒子特效资源
---设置对象粒子资源、Y偏移和循环标志。 相同资源且force不为true时直接跳过，连循环标志也不更新；组件缺失或资源类型错误时不处理，无返回值。 底层请求播放并标记属性待同步；资源加载、客户端可见条件决定最终表现，不提供成功确认。
---@param value Mini.Effect 特效ID或路径；none、0、-1002或空串停止。
---@param force? Mini.Bool 是否强制重播，默认false。
---@param offsetY? Mini.Number Y轴偏移（底层单位），默认0。
---@param bLoop? Mini.Bool 是否循环播放，默认false。
function Effect:SetParticleId(value, force, offsetY, bLoop) end
