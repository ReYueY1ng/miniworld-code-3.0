---@meta

---Sleep（内置组件 Sleep · 角色组件）<br>
---为生物添加睡眠能力，可配置睡眠状态和相关行为。
---@class Sleep: Component
---@field animGroup table[] 动画组
---@field wakeAnimGroup table[]
---@field sleepEffectEnter Mini.GroupView
---@field sleepEffect number | string
---@field sleepEffectOffset Mini.Vec3
---@field sleepEffectScale number
---@field sleepEffectTime number
---@field sleepSoundEnter Mini.GroupView
---@field sleepSound number | string
---@field sleepSoundInterval number
---@field sleepTimeEnter Mini.GroupView 睡觉时间
---@field sleepMinTime number 最小睡眠时间（秒）
---@field sleepMaxTime number 最大睡眠时间（秒）
Sleep = {}
