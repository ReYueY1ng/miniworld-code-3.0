---@meta

---触发器 DisplayBoard 模块（Trigger.DisplayBoard）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.DisplayBoard
Trigger.DisplayBoard = {}

---查询显示板在指定玩家视角下是否可见
---通过客户端数据回报结果（ClientData），主机环境可能取不到值
---@param objid integer 显示板对象ID
---@param player any 玩家ID
---@return boolean? result 是否可见，显示板对象不存在时为 nil
function Trigger.DisplayBoard:IsVisible(objid, player) end

---用新配置替换显示板内容并对所有玩家生效
---配置中的 prefab 字段会被忽略
---对象上没有 UIBillboard 组件时返回 false
---@param cfg any 显示板配置表
---@param objid integer 显示板对象ID
---@return boolean result 是否替换成功
function Trigger.DisplayBoard:ReplaceByCfg(cfg, objid) end

---用新配置替换指定玩家看到的显示板内容
---配置中的 prefab 字段会被忽略
---对象上没有 UIBillboard 组件时返回 false
---@param player any 玩家ID，0 表示所有玩家
---@param cfg any 显示板配置表
---@param objid integer 显示板对象ID
---@return boolean result 是否替换成功
function Trigger.DisplayBoard:ReplaceByCfgForPlayer(player, cfg, objid) end

---设置指定玩家是否能看到显示板
---显示板对象不存在时返回 false
---@param player any 玩家ID
---@param visible number 可见性：1 显示，0 隐藏，也可直接传布尔值
---@param objid integer 显示板对象ID
---@return boolean result 是否设置成功
function Trigger.DisplayBoard:SetVisible(player, visible, objid) end
