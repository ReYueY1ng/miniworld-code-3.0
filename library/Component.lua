---@meta

---基本组件<br>
---[组件说明](https://dev-wiki.mini1.cn/ugc-wiki/introduction/cmpIntroduce.html)<br>
---[组件函数](https://dev-wiki.mini1.cn/ugc-wiki/introduction/componentapi.html)<br>
---[组件属性](https://dev-wiki.mini1.cn/ugc-wiki/introduction/componentattr.html)
---@class Component
---@field protected isValid boolean 是否有效
---@field protected __isEnable boolean 是否启用
---@field protected __className_ string 组件id
---@field protected gameObject Object 挂载对象
---@field protected displayName string 显示名称
local Component = {}

---获取该组件挂载的对象实例
---@protected
---@return Object object 挂载对象
function Component:GetGameObject() end

---获取组件挂载的对象实例id
---@protected
---@return string | integer id 对象实例id
function Component:GetGameObjectId() end

---获取组件是否有效
---@protected
---@return boolean isvalid
function Component:IsValid() end

---在组件所在的对象上添加指定组件(对象已经存在相同id组件的则添加不上)
---@protected
---@generic cmp: Component
---@param cmpid `cmp` 组件id
---@return cmp cmp 组件对象
function Component:AddComponent(cmpid) end

---删除在组件所在的对象上的指定组件
---@protected
---@param cmpid string 组件id
function Component:RemoveComponent(cmpid) end

---获取组件所在对象上的指定组件
---@protected
---@generic cmp: Component
---@param cmpid `cmp` 组件id
---@return cmp cmp 组件对象
function Component:GetComponent(cmpid) end

---发送自定义消息(异步)
---@protected
---@param msgid string 消息id
---@param ... any 消息内容
function Component:PushCustomEvent(msgid, ...) end

---发送自定义消息(同步)
---@protected
---@param msgid string 消息id
---@param ... any 消息内容
function Component:PushCustomEventSync(msgid, ...) end

---监听自定义消息（广播）
---@protected
---@param msgid string 消息id
---@param callfunc fun(self: self, ...) 回调函数
function Component:AddCustomEvent(msgid, callfunc) end

---移除自定义事件监听
---@protected
---@param msgid string 消息id
function Component:RemoveCustomEvent(msgid) end

---发送对象事件(异步)，只有同个对象上监听的组件才能收到事件
---@protected
---@param event string 自定义事件类型
---@param ... any 事件内容
function Component:PushEvent(event, ...) end

---发送对象事件(同步)，只有同个对象上监听的组件才能收到事件
---@protected
---@param event string 自定义事件类型
---@param ... any 事件内容
function Component:PushEventSync(event, ...) end

---监听对象事件（可以监听自定义的，也能监听官方内置对象事件）
---@protected
---@param event string | ObjectEvent 消息id
---@param callfunc fun(self: self, ...) 回调函数
function Component:AddEvent(event, callfunc) end

---移除对象的事件监听
---@protected
---@param event string | ObjectEvent 消息id
function Component:RemoveCustomEvent(event) end

---启动定时器在指定时间执行任务
---@protected
---@param callfunc fun(self: self) 回调函数
---@param time number 时间间隔（秒）
function Component:DoTaskInTime(callfunc, time) end

---启动定时器周期性执行任务
---@protected
---@param callfunc fun(self: self) 回调函数
---@param delay number 间隔时间（秒）
---@param waittime? number 延迟开始第一次执行时间（默认0）
---@param count? integer 执行次数（默认无限次）
function Component:DoPeriodicTask(callfunc, delay, waittime, count) end

---清除所有定时器任务
---@protected
function Component:ClearAllTask() end

---设置是否启用事件
---@protected
---@param callfunc fun(self: self, ...) 回调函数
---@param enabled boolean 是否启用
function Component:SetEventIsEnable(callfunc, enabled) end

---启动新协程
---@protected
---@see threadpool.work
---@param callfunc fun(self: self, ...) 回调函数
---@param ... any
function Component:ThreadWork(callfunc, ...) end

---等待一段时间后执行
---@protected
---@param time number 等待时间
---@return 1000
function Component:ThreadWait(time) end

---发送云服广播消息(异步)
---@protected
---@param msgid string 消息id
---@param ... any 消息内容
function Component:PushCloudServerMsg(msgid, ...) end

---接收云服事件
---@protected
---@param msgid string 消息id
---@param callfunc fun(self: self, ...) 回调函数
function Component:AddCloudSeverEvent(msgid, callfunc) end

---移除云服消息监听
---@protected
---@param msgid string 消息id
function Component:RemoveCloudSeverEvent(msgid) end

---世界组件
---@class WorldComponent: Component
---@field protected gameObject WorldObject 挂载对象
local WorldComponent = {}

---获取该组件挂载的对象实例
---@protected
---@return WorldObject object 挂载对象
function WorldComponent:GetGameObject() end

---添加触发事件
---@protected
---@param event TriggerEvent 事件类型
---@param callfunc fun(self: self, ...) 回调函数
function WorldComponent:AddTriggerEvent(event, callfunc) end

---移除触发事件监听
---@protected
---@param event TriggerEvent 事件类型
function WorldComponent:RemoveTriggerEvent(event) end

---UI组件
---@class UIComponent: WorldComponent
---@field protected gameObject UIObject 挂载对象
local UIComponent = {}

---获取该组件挂载的对象实例
---@protected
---@return UIObject object 挂载对象
function UIComponent:GetGameObject() end

---方块组件
---@class BlockComponent: Component
---@field protected gameObject BlockObject 挂载对象
local BlockComponent = {}

---获取该组件挂载的对象实例
---@protected
---@return BlockObject object 挂载对象
function BlockComponent:GetGameObject() end

---角色基本组件
---@class ActorComponent: Component
---@field transform table 变换
---@field protected gameObject ActorObject 挂载对象
local ActorComponent = {}

---获取该组件挂载的对象实例
---@protected
---@return ActorObject object 挂载对象
function ActorComponent:GetGameObject() end

---生物组件
---@class MobComponent: ActorComponent
---@field protected gameObject MobObject 挂载对象
local MobComponent = {}

---获取该组件挂载的对象实例
---@protected
---@return MobObject object 挂载对象
function MobComponent:GetGameObject() end

---玩家组件
---@class PlayerComponent: ActorComponent
---@field protected gameObject PlayerObject 挂载对象
local PlayerComponent = {}

---获取该组件挂载的对象实例
---@protected
---@return PlayerObject object 挂载对象
function PlayerComponent:GetGameObject() end

---实体组件
---@class EntityComponent: ActorComponent
---@field protected gameObject EntityObject 挂载对象
local EntityComponent = {}

---获取该组件挂载的对象实例
---@protected
---@return EntityObject object 挂载对象
function EntityComponent:GetGameObject() end

---瞬时效果组件
---@class InstantaneousBuffComponent: ActorComponent
local InstantaneousBuffComponent = {}

---持续效果组件
---@class ContinuousBuffComponent: ActorComponent
local ContinuousBuffComponent = {}
