---@meta

---触发器 GameObject 模块（Trigger.GameObject）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.GameObject
Trigger.GameObject = {}

---创建prefab实例
---@param objectType any 对象类型
---@param prefabId any prefabID
---@param num any 数量
---@param pos Mini.Vec3 位置
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.GameObject:CreatePrefabInst(objectType, prefabId, num, pos, worldId) end

---创建prefab实例ex
---@param objectType any 对象类型
---@param var any 参数 var
---@param prefabId any prefabID
---@param num any 数量
---@param pos Mini.Vec3 位置
---@param face any 朝向
---@param scale any 缩放
---@return boolean result 是否成功
function Trigger.GameObject:CreatePrefabInstEx(objectType, var, prefabId, num, pos, face, scale) end

---创建singleprefab实例
---@param objectType any 对象类型
---@param prefabId any prefabID
---@param pos Mini.Vec3 位置
---@param worldId any 星球ID
function Trigger.GameObject:CreateSinglePrefabInst(objectType, prefabId, pos, worldId) end

---获取对象prefab
---@param itype any 类型
---@param objId any 对象ID
function Trigger.GameObject:GetObjectPrefab(itype, objId) end

---获取prefabdes
---@param info? any 信息
---@return string? value 结果，失败时为 nil
function Trigger.GameObject:GetPrefabDes(info) end

---获取prefab名称
---@param info? any 信息
---@return string value 结果字符串
function Trigger.GameObject:GetPrefabName(info) end
