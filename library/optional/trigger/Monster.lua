---@meta

---触发器 Monster 模块（Trigger.Monster）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Monster
Trigger.Monster = {}

---获取生物类型对应的外观资源名
---字符串参数直接拼成 mobprefab_<参数>
---数字参数先查自定义资源ID，再回退为 mob_<类型ID>
---@param monsterid integer 生物ID或生物预制资源ID
---@return string? result 外观名，形如 mobprefab_<资源ID> 或 mob_<类型ID>，无法解析时为 nil
function Trigger.Monster:GetMonsterFacade(monsterid) end
