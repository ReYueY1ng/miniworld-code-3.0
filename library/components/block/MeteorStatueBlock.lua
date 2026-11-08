---@meta

---流星神像（内置组件 MeteorStatueBlock · 方块组件）<br>
---为流星神像方块添加交互召唤流星雨、冷却和破损状态。
---@class MeteorStatueBlock: Component
---@field meteorItem number | string 流星道具
---@field statueCooldown number 神像冷却秒
---@field successEffect number | string 成功特效
---@field successEffectDuration number 成功特效时长秒
---@field successEffectOffset Mini.Vec3 成功特效偏移
---@field successEffectScale Mini.Vec3 成功特效缩放
MeteorStatueBlock = {}
