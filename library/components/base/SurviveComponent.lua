---@meta

---SurviveComponent（内置组件 SurviveComponent · 基础组件）<br>
---为生物添加生存能力，可配置体力、饥饿等生存属性。
---@class SurviveComponent: Component
---@field oxygenSwitch boolean
---@field oxygenBaseValue number
---@field oxygenMaxValue number
---@field oxygenRecoveryRate number
---@field oxygenUseRate number
---@field addAttrType number 添加属性类型
---@field ableSubHP boolean 能够减法血量
---@field strenBaseValue number
---@field strenMaxValue number
---@field strenRecoverValue number
---@field strenNatureCost number 体力自然消耗量
---@field strenNatureCostInterval number 体力自然消耗间隔
---@field hungryBaseValue number
---@field hungryMaxValue number
SurviveComponent = {}
