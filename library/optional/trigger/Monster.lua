---@meta

---触发器 Monster 模块（Trigger.Monster）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Monster
Trigger.Monster = {}

---获取生物外观
---@param monsterid any 生物ID
function Trigger.Monster:GetMonsterFacade(monsterid) end
