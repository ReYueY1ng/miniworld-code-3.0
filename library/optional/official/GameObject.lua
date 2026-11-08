---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· GameObject<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
function GameObject:CreateEditEmptyActor() end

---官方环境独有接口（未收录于开发环境）
---@param id number
function GameObject:FindBlockObjectForInternal(id) end

---官方环境独有接口（未收录于开发环境）
---@param objId any
function GameObject:GetObjType(objId) end

---官方环境独有接口（未收录于开发环境）
function GameObject:GetWorld() end
