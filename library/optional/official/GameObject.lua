---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· GameObject<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---创建editempty角色
function GameObject:CreateEditEmptyActor() end

---为internal查找方块对象
---@param id number ID
function GameObject:FindBlockObjectForInternal(id) end

---获取对象类型
---@param objId any 对象ID
function GameObject:GetObjType(objId) end

---获取世界对象
function GameObject:GetWorld() end
