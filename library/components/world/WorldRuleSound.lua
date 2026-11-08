---@meta

---声音（内置组件 WorldRuleSound · 世界组件）<br>
---为世界添加声音规则，可配置背景音乐和环境音效。
---@class WorldRuleSound: Component
---@field backgroundMusic number
---@field soundEffect Mini.GroupView 音效
---@field stepSound boolean
---@field hurtSound boolean 造成伤害音效
---@field mobSound boolean 生物音效
---@field musicPlayer boolean 音乐玩家
---@field spaceVoice boolean
---@field attenuationGrid number
---@field attenuationRatio number
WorldRuleSound = {}
