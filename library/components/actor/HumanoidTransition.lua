---@meta

---HumanoidTransition（内置组件 HumanoidTransition · 角色组件）<br>
---@class HumanoidTransition: Component
---@field basicConfig Mini.GroupView
---@field lyingDurationSec number
---@field lyingAnimId Mini.ModelAction
---@field ascendDurationSec number
---@field disappearDelaySec number
---@field timeoutSec number
---@field phase2MobId number
---@field phase2MobSpawnDelaySec number 二阶生物生成延迟(秒)
---@field destroyBlockGroup (number | string)[] 销毁方块组
---@field destroyBlockRadius number
---@field destroyBlockDelaySec number 方块销毁延迟时间(秒)
---@field destroyBlockEffectProbability number
---@field transitionPos Mini.Vec3
---@field portalEffectId number | string
---@field portalEffectOffset Mini.Vec3 传送门特效偏移(方块坐标)
HumanoidTransition = {}
