---@meta

---基础环境（内置组件 WorldRuleBaseSetting · 世界组件）<br>
---为世界添加基础环境规则，可配置时间、天气等基础设置。
---@class WorldRuleBaseSetting: Component
---@field curTime number 当前时间
---@field timeLocked boolean 时间锁定
---@field timeSpeed number 时间速度
---@field weather number 天气
---@field isCreateSnow boolean 判断是否创建雪
---@field gravity number 重力
---@field temperature boolean
WorldRuleBaseSetting = {}
