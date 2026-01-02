---@meta

---基本对象<br>
---[对象介绍](https://dev-wiki.mini1.cn/ugc-wiki/introduction/obj.html)
---@class Object
local Object = {}

---获取该对象实例id
---@return string | integer objid 对象id
function Object:GetId() end

---获取对象类型
---@return ObjType objtype 对象类型枚举
function Object:GetObjType() end

---获取对象是否有效
---@return boolean isvalid 是否有效
function Object:IsValid() end

---对象上添加组件(对象已经存在相同id组件的则添加不上返回空)
---@generic cmp: Component
---@param cmpid `cmp` 组件id
---@return cmp cmp 组件对象
function Object:AddComponent(cmpid) end

---删除对象上的指定组件
---@param cmpid string 组件id
function Object:RemoveComponent(cmpid) end

---获取对象上的指定组件
---@generic cmp: Component
---@param cmpid `cmp` 组件id
---@return cmp cmp 组件对象
function Object:GetComponent(cmpid) end

---@class WorldObject: Object
local WorldObject = {}

---@class UIObject: WorldObject
local UIObject = {}

---@class BlockObject: Object
local BlockObject = {}

---@class ActorObject: Object
local ActorObject = {}

---销毁对象
---@param kill? boolean 是否杀死(只有生物有效，默认false)
function ActorObject:Destroy(kill) end

---@class PlayerObject: ActorObject
local PlayerObject = {}

---@class EntityObject: ActorObject
local EntityObject = {}

---@class MobObject: ActorObject
local MobObject = {}
