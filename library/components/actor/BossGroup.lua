---@meta

---BossGroup（内置组件 BossGroup · 角色组件）<br>
---@class BossGroup: Component
---@field deathPolicy table
---@field linkLineConfig table 主子生物连线
---@field childrenConfig Mini.GroupView
---@field children table[]
---@field bossGroupConfigJson string BossGroupConfigJson
---@field taskGroupsConfig Mini.GroupView 任务组配置
---@field taskGroups table[] 任务组
BossGroup = {}

---获取当前剩余子生物数量
---@return number value 获取当前剩余子生物数量
function BossGroup:GetCurrentChildCount() end
