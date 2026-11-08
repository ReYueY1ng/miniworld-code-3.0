---@meta

---触发器 DisplayBoard 模块（Trigger.DisplayBoard）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.DisplayBoard
Trigger.DisplayBoard = {}

---判断是否visible
---@param objid any 对象ID
---@param player any 玩家
function Trigger.DisplayBoard:IsVisible(objid, player) end

---按配置替换
---@param cfg any 配置
---@param objid any 对象ID
function Trigger.DisplayBoard:ReplaceByCfg(cfg, objid) end

---按配置for玩家替换
---@param player any 玩家
---@param cfg any 配置
---@param objid any 对象ID
function Trigger.DisplayBoard:ReplaceByCfgForPlayer(player, cfg, objid) end

---设置visible
---@param player any 玩家
---@param visible number 参数 visible
---@param objid any 对象ID
function Trigger.DisplayBoard:SetVisible(player, visible, objid) end
