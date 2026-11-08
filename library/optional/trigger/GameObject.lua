---@meta

---触发器 GameObject 模块（Trigger.GameObject）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.GameObject
Trigger.GameObject = {}

---在指定坐标批量创建预制体对象
---生物与掉落物会记录最近创建的ID，供触发器读取
---生物和掉落物要求 y 坐标大于 0
---@param objectType number 对象类型（ObjType 枚举）
---@param prefabId string 预制体ID，可为配置ID或资源ID
---@param num number 创建数量
---@param pos Mini.Vec3 生成坐标表，需含 x/y/z
---@param worldId number 星球ID，不填表示当前星球
---@return boolean result 是否创建成功
function Trigger.GameObject:CreatePrefabInst(objectType, prefabId, num, pos, worldId) end

---批量创建预制体对象，扩展参数当前不生效
---实现只透传对象类型、预制体、数量、坐标，var/face/scale 不参与创建
---创建固定发生在当前星球
---@param objectType number 对象类型（ObjType 枚举）
---@param var any 预留参数，当前未使用
---@param prefabId number | string 预制体ID，可为配置ID或资源ID
---@param num number 创建数量
---@param pos Mini.Vec3 生成坐标表，需含 x/y/z
---@param face any 预留朝向，当前未使用
---@param scale number 预留缩放，当前未使用
---@return boolean result 是否创建成功
function Trigger.GameObject:CreatePrefabInstEx(objectType, var, prefabId, num, pos, face, scale) end

---在指定坐标创建单个预制体并返回对象ID
---@param objectType number 对象类型（ObjType 枚举）
---@param prefabId number | string 预制体ID，可为配置ID或资源ID
---@param pos Mini.Vec3 生成坐标表，需含 x/y/z
---@param worldId integer 星球ID，不填表示当前星球
---@return number? objid 新对象的对象ID，创建失败时为 nil
function Trigger.GameObject:CreateSinglePrefabInst(objectType, prefabId, pos, worldId) end

---获取对象的预制ID，类型不匹配时返回 nil
---只有传入类型与实际对象类型一致时才返回结果
---@param itype number 期望的对象类型（ObjType 枚举）
---@param objId number 对象ID
---@return string|number? id 预制资源ID或配置ID，类型不符或对象不存在时为 nil
function Trigger.GameObject:GetObjectPrefab(itype, objId) end

---获取预制体的描述文本
---生物、掉落物、投掷物分别查对应配置表
---其他对象类型返回空字符串
---@param info? any 预制体信息表 {id=预制ID, type=对象类型}
---@return string? desc 描述文本，对象或配置不存在时为 nil
function Trigger.GameObject:GetPrefabDes(info) end

---获取预制体的名称
---字符串ID直接返回资源文件名
---其他对象类型返回空字符串
---@param info? any 预制体信息表 {id=预制ID, type=对象类型}
---@return string? name 名称，对象或配置不存在时为 nil
function Trigger.GameObject:GetPrefabName(info) end
