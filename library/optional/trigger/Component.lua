---@meta

---触发器 Component 模块（Trigger.Component）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Component
Trigger.Component = {}

---添加component
---@param object? any 对象
---@param cmpName string 组件名称
---@return boolean result 是否成功
function Trigger.Component:AddComponent(object, cmpName) end

---添加事件
---@param cmp any 组件
---@param object? any 对象
---@param event any 事件
---@param fn function 回调函数
---@param priority any 参数 priority
---@vararg any
---@return boolean result 是否成功
function Trigger.Component:AddEvent(cmp, object, event, fn, priority, ...) end

---按位置调用方块componentfunction
---@param pos any 位置
---@param cmpName any 组件名称
---@param fnName string 函数名称
---@vararg any
---@return boolean result 是否成功
function Trigger.Component:CallBlockComponentFunctionByPos(pos, cmpName, fnName, ...) end

---按位置var调用方块componentfunction
---@param pos any 位置
---@param cmpName any 组件名称
---@param fnName string 函数名称
---@vararg any
function Trigger.Component:CallBlockComponentFunctionByPosVar(pos, cmpName, fnName, ...) end

---调用componentfunction
---@param object? any 对象
---@param cmpName string 组件名称
---@param fnName string 函数名称
---@vararg any
---@return boolean result 是否成功
function Trigger.Component:CallComponentFunction(object, cmpName, fnName, ...) end

---调用componentfunctionvar
---@param object? any 对象
---@param cmpName string 组件名称
---@param fnName string 函数名称
---@vararg any
function Trigger.Component:CallComponentFunctionVar(object, cmpName, fnName, ...) end

---检查cmpfunction调用类型
---@param fun any 参数 fun
---@param cmp any 组件
---@param checkType any 参数 checkType
---@vararg any
function Trigger.Component:CheckCmpFunctionCallType(fun, cmp, checkType, ...) end

---按位置获取方块component属性
---@param pos any 位置
---@param cmpName any 组件名称
---@param property string 属性
function Trigger.Component:GetBlockComponentPropertyByPos(pos, cmpName, property) end

---获取component属性
---@param object? any 对象
---@param cmpName string 组件名称
---@param property string 属性
function Trigger.Component:GetComponentProperty(object, cmpName, property) end

---获取判断是否判断是否拥有cmp
---@param object any 对象
---@param cmpName string 组件名称
---@return boolean value 是否成功
function Trigger.Component:GetIsHasCmp(object, cmpName) end

---增加component属性
---@param object? any 对象
---@param cmpName string 组件名称
---@param property string 属性
---@param value number 值
---@return boolean result 是否成功
function Trigger.Component:IncreasesComponentProperty(object, cmpName, property, value) end

---判断是否事件启用
---@param funcname any 函数名称
---@param cmp any 组件
function Trigger.Component:IsEventEnable(funcname, cmp) end

---移除component
---@param object? any 对象
---@param cmpName string 组件名称
---@return boolean result 是否成功
function Trigger.Component:RemoveComponent(object, cmpName) end

---runcmpbase函数
---@param cmp any 组件
---@param fn any 回调函数
---@vararg any
function Trigger.Component:RunCmpBaseFn(cmp, fn, ...) end

---设置component属性
---@param object? any 对象
---@param cmpName string 组件名称
---@param property string 属性
---@param value any 值
---@return boolean result 是否成功
function Trigger.Component:SetComponentProperty(object, cmpName, property, value) end

---设置事件判断是否启用
---@param funcname any 函数名称
---@param enable any 是否启用
---@param cmp any 组件
---@return boolean result 是否成功
function Trigger.Component:SetEventIsEnable(funcname, enable, cmp) end
