---@meta

---触发器 Backpack 模块（Trigger.Backpack）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Backpack
Trigger.Backpack = {}

---动作destruct装备
---@param data integer | integer[] 数据
---@param equipid any 装备ID
---@return boolean result 是否成功
function Trigger.Backpack:ActDestructEquip(data, equipid) end

---按装备ID动作装备off
---@param data integer | integer[] 数据
---@param equipid any 装备ID
---@return boolean result 是否成功
function Trigger.Backpack:ActEquipOffByEquipID(data, equipid) end

---按resID动作装备up
---@param data integer | integer[] 数据
---@param itemid any 道具ID
---@return boolean result 是否成功
function Trigger.Backpack:ActEquipUpByResID(data, itemid) end

---添加道具
---@param num number 数量
---@param itemid any 道具ID
---@param data integer | integer[] 数据
---@return boolean result 是否成功
function Trigger.Backpack:AddItem(num, itemid, data) end

---创建道具ID
---@param itemnum number 道具数量
---@param itemid any 道具ID
---@param data integer | integer[] 数据
---@param ipos any 参数 ipos
---@return boolean result 是否成功
function Trigger.Backpack:CreateItemID(itemnum, itemid, data, ipos) end

---按IDdiscard道具
---@param data integer | integer[] 数据
---@param itemnum number 道具数量
---@param itemid any 道具ID
---@return boolean result 是否成功
function Trigger.Backpack:DiscardItemByID(data, itemnum, itemid) end

---为道具enoughspace
---@param objid any 对象ID
---@param itemnum any 道具数量
---@param itemid any 道具ID
function Trigger.Backpack:EnoughSpaceForItem(objid, itemnum, itemid) end

---获取shurtitemid
---@param playerid any 玩家ID
---@param gridtype number 格子类型
---@param index number 索引
function Trigger.Backpack:GetShurtItemid(playerid, gridtype, index) end

---获取shurt道具数量
---@param playerid any 玩家ID
---@param gridtype number 格子类型
---@param index number 索引
function Trigger.Backpack:GetShurtItemnum(playerid, gridtype, index) end

---播放shortcut道具特效
---@param data integer | integer[] 数据
---@param itemid any 道具ID
---@param effectid any 特效ID
---@param scale any 缩放
---@return boolean result 是否成功
function Trigger.Backpack:PlayShortCutItemEffect(data, itemid, effectid, scale) end

---播放shortcut道具粒子
---@param data integer | integer[] 数据
---@param itemid any 道具ID
---@param effectids integer | integer[] 参数 effectids
---@param offset? table 偏移
---@param rot? table 旋转
---@param scale? table 缩放
---@return boolean result 是否成功
function Trigger.Backpack:PlayShortCutItemParticle(data, itemid, effectids, offset, rot, scale) end

---播放shortcutix特效
---@param data integer | integer[] 数据
---@param effectid any 特效ID
---@param scale any 缩放
---@return boolean result 是否成功
function Trigger.Backpack:PlayShortCutIxEffect(data, effectid, scale) end

---播放shortcutix粒子
---@param data integer | integer[] 数据
---@param effectids integer | integer[] 参数 effectids
---@param offset? table 偏移
---@param rot? table 旋转
---@param scale? table 缩放
---@return boolean result 是否成功
function Trigger.Backpack:PlayShortCutIxParticle(data, effectids, offset, rot, scale) end

---移除格子道具
---@param data integer | integer[] 数据
---@param gridid any 格子ID
---@param itemnum number 道具数量
---@return boolean result 是否成功
function Trigger.Backpack:RemoveGridItem(data, gridid, itemnum) end

---移除道具
---@param data integer | integer[] 数据
---@param itemnum number 道具数量
---@param itemid any 道具ID
---@return boolean result 是否成功
function Trigger.Backpack:RemoveItem(data, itemnum, itemid) end

---设置格子道具
---@param data integer | integer[] 数据
---@param gridid any 格子ID
---@param itemid any 道具ID
---@param itemnum number 道具数量
---@return boolean result 是否成功
function Trigger.Backpack:SetGridItem(data, gridid, itemid, itemnum) end

---停止shortcut道具特效
---@param data integer | integer[] 数据
---@param itemid any 道具ID
---@param effectids integer | integer[] 参数 effectids
---@return boolean result 是否成功
function Trigger.Backpack:StopShortCutItemEffect(data, itemid, effectids) end

---停止shortcutix特效
---@param data integer | integer[] 数据
---@param effectids integer | integer[] 参数 effectids
---@return boolean result 是否成功
function Trigger.Backpack:StopShortCutIxEffect(data, effectids) end
