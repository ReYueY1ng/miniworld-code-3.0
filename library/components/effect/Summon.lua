---@meta

---召唤术（内置组件 Summon · 效果组件）<br>
---召唤术自定义效果
---@class Summon: Component
---@field animId number 动作ID
---@field bodyParticleId number | string 自身特效
---@field spawnRadius number 召唤半径
---@field spawnMobId number 召唤生物ID
---@field spawnCount number 召唤次数
---@field summonParticleId number | string 召唤点特效
---@field particleDuration number 特效播放时间(秒)
---@field spawnFront boolean 前方召唤
Summon = {}
