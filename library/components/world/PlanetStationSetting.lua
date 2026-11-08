---@meta

---星站（内置组件 PlanetStationSetting · 世界组件）<br>
---为星球添加星站配置，可配置星站解锁、传送消耗等。
---@class PlanetStationSetting: Component
---@field useStationMgmt boolean 使用星站管理
---@field unlock number 星站解锁
---@field unlockItem number | string 解锁道具
---@field unlockHint string 未解锁提示
---@field teleportCost number 传送消耗
---@field teleportCostStar number 传送费用（星星）
---@field teleportCostItem number | string 消耗道具类型
---@field teleportCostItemNum number 传送道具数量
PlanetStationSetting = {}
