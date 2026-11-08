---@meta

---生成生物（内置组件 WorldRuleMobGen · 世界组件）<br>
---为世界添加生物生成规则，可配置生物刷新和生成内容。
---@class WorldRuleMobGen: Component
---@field hostileGen boolean 自动生成怪物
---@field animalGen boolean 自动生成动物
---@field passiveGen boolean 自动生成常见动物
---@field rareGen boolean 自动生成稀有动物
---@field waterGen boolean 自动生成水生动物
---@field flyGen boolean 自动生成飞行动物
---@field trixenieGen boolean 自动生成三栖动物
---@field autoRandomClear boolean 自动随机清空
WorldRuleMobGen = {}
