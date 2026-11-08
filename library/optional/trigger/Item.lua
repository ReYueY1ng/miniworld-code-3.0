---@meta

---触发器 Item 模块（Trigger.Item）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Item
Trigger.Item = {}

---清空storagebox
---@param pos Mini.Vec3 位置
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.Item:ClearStorageBox(pos, worldId) end

---比较itemid
---@param itemid? any 道具ID
---@param itemid2 any 参数 itemid2
---@return boolean result 检查结果
function Trigger.Item:CompareItemid(itemid, itemid2) end

---创建道具转换为storagebox
---@param itemid any 道具ID
---@param num any 数量
---@param pos Mini.Vec3 位置
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.Item:CreateItemToStorageBox(itemid, num, pos, worldId) end

---从storagebox移除道具
---@param itemid any 道具ID
---@param num any 数量
---@param pos Mini.Vec3 位置
---@param worldId any 星球ID
function Trigger.Item:DespawnItemFromStorageBox(itemid, num, pos, worldId) end

---获取外观
---@param itemid any 道具ID
function Trigger.Item:GetFacade(itemid) end

---转换为道具ID
---@param itemid any 道具ID
function Trigger.Item:ToItemID(itemid) end
