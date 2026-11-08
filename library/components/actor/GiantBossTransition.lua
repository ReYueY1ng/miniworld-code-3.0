---@meta

---巨型Boss过渡演出（内置组件 GiantBossTransition · 角色组件）<br>
---@class GiantBossTransition: Component
---@field basicConfig Mini.GroupView 基础配置
---@field effectId number | string 播放特效
---@field actionId Mini.ModelAction 播放动作ID
---@field waitTimeSec number 等待时间(秒)
---@field deathOffset Mini.Vec3 死亡后移动偏移(方块坐标)
---@field moveDurationSec number 死亡后移动时间(秒)
---@field summonMobId number 召唤生物ID
GiantBossTransition = {}
