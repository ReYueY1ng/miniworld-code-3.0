---@meta

---触发器 Component 模块（Trigger.Component）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Component
Trigger.Component = {}

---为对象添加组件
---对象不存在或组件创建失败时返回 false
---@param object? any 对象ID或对象表
---@param cmpName string 组件名
---@return boolean result 是否添加成功
function Trigger.Component:AddComponent(object, cmpName) end

---向对象注册事件回调
---@param cmp any 组件实例，作为回调的 self
---@param object? any 对象ID或对象表
---@param event any 事件枚举，不能为空
---@param fn function 回调函数
---@param priority any 监听优先级
---@vararg any
---@return boolean result 是否注册成功
function Trigger.Component:AddEvent(cmp, object, event, fn, priority, ...) end

---调用坐标处方块组件上的函数
---坐标处没有方块或组件函数未启用时返回 false
---@param pos Mini.Vec3 坐标 {x,y,z}，可带 worldId 或 mapId
---@param cmpName string 组件名
---@param fnName string 函数名
---@vararg any
---@return boolean result 是否调用成功
function Trigger.Component:CallBlockComponentFunctionByPos(pos, cmpName, fnName, ...) end

---调用坐标处方块组件函数并返回结果
---以 cmp:fnName(pos, ...) 形式调用
---@param pos Mini.Vec3 坐标 {x,y,z}，可带 worldId 或 mapId
---@param cmpName string 组件名
---@param fnName string 函数名
---@vararg any
---@return any? result 函数返回值，失败或函数未启用时为 nil
function Trigger.Component:CallBlockComponentFunctionByPosVar(pos, cmpName, fnName, ...) end

---调用对象组件上的函数
---函数必须存在且事件已启用
---@param object? any 对象ID或对象表
---@param cmpName string 组件名
---@param fnName string 函数名
---@vararg any
---@return boolean result 是否调用成功
function Trigger.Component:CallComponentFunction(object, cmpName, fnName, ...) end

---调用对象组件函数并返回结果
---@param object? any 对象ID或对象表
---@param cmpName string 组件名
---@param fnName string 函数名
---@vararg any
---@return any? result 函数返回值，失败或函数未启用时为 nil
function Trigger.Component:CallComponentFunctionVar(object, cmpName, fnName, ...) end

---按返回类型标记调用组件函数
---@param fun any 组件函数
---@param cmp any 组件实例
---@param checkType number 期望的返回类型标记
---@vararg any
---@return any? result 第二个返回值等于 checkType 时返回第一个返回值，否则为 nil
function Trigger.Component:CheckCmpFunctionCallType(fun, cmp, checkType, ...) end

---读取坐标处方块组件的属性
---@param pos Mini.Vec3 坐标 {x,y,z}，可带 worldId 或 mapId
---@param cmpName string 组件名
---@param property string 属性名
---@return any? value 属性值，方块或组件不存在时为 nil
function Trigger.Component:GetBlockComponentPropertyByPos(pos, cmpName, property) end

---读取对象组件的属性
---@param object? any 对象ID或对象表
---@param cmpName string 组件名
---@param property string 属性名
---@return any? value 属性值，组件不存在时为 nil
function Trigger.Component:GetComponentProperty(object, cmpName, property) end

---判断对象是否挂载了指定组件
---对象查不到或已失效时返回 false
---@param object any 对象ID或对象表
---@param cmpName string 组件名
---@return boolean result 是否拥有该组件
function Trigger.Component:GetIsHasCmp(object, cmpName) end

---在组件属性上累加数值
---属性必须已存在且为数字，否则调用会报错
---@param object? any 对象ID或对象表
---@param cmpName string 组件名
---@param property string 属性名
---@param value number 增量，可为负数
---@return boolean result 是否累加成功
function Trigger.Component:IncreasesComponentProperty(object, cmpName, property, value) end

---判断组件的某个事件函数是否启用
---@param funcname string 组件上的函数名
---@param cmp any 组件实例
---@return boolean? result 是否启用，组件或函数不存在时为 nil
function Trigger.Component:IsEventEnable(funcname, cmp) end

---移除对象上的指定组件
---只要对象可访问就返回 true，不校验组件是否真的存在
---@param object? any 对象ID或对象表
---@param cmpName string 组件名
---@return boolean result 是否执行成功
function Trigger.Component:RemoveComponent(object, cmpName) end

---以保护模式执行组件的基础事件函数
---函数未启用时不执行
---线程池可用时投递到线程池执行
---@param cmp any 组件实例
---@param fn function 要执行的函数
---@vararg any
function Trigger.Component:RunCmpBaseFn(cmp, fn, ...) end

---设置对象组件的属性
---组件不存在时返回 false
---@param object? any 对象ID或对象表
---@param cmpName string 组件名
---@param property string 属性名
---@param value any 属性值
---@return boolean result 是否设置成功
function Trigger.Component:SetComponentProperty(object, cmpName, property, value) end

---启用或禁用组件的某个事件函数
---组件或函数不存在时返回 false
---@param funcname string 组件上的函数名
---@param enable boolean 是否启用
---@param cmp any 组件实例
---@return boolean result 是否设置成功
function Trigger.Component:SetEventIsEnable(funcname, enable, cmp) end
