---@meta

---星球极光（内置组件 PlanetAurora · 世界组件）<br>
---为星球添加极光规则，可按地形、天气、时间和概率切换极光表现。
---@class PlanetAurora: Component
---@field enableAurora boolean 启用极光规则
---@field checkInterval number 检查间隔
---@field auroraRules table[] 极光规则
---@field runtimeAuroraRulesPayload string RuntimeAuroraRulesPayload
---@field auroraRulesPersisted boolean AuroraRulesPersisted
PlanetAurora = {}
