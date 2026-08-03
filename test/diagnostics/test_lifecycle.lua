---@meta

---生命周期方法必须为函数诊断测试文件
--- 此文件测试生命周期方法是否为函数类型

---@class TestLifecycleComponent: WorldComponent
local TestLifecycleComponent = {}

-- 违反规则的代码 (应触发诊断)
-- 生命周期方法不是函数类型
-- BUG诊断: OnStart 不是函数，应该是 function
TestLifecycleComponent.OnStart = "hello"
-- BUG诊断: OnEnable 不是函数，应该是 function
TestLifecycleComponent.OnEnable = 123
-- BUG诊断: OnDisable 不是函数，应该是 function
TestLifecycleComponent.OnDisable = true
-- BUG诊断: OnDestroy 不是函数，应该是 function
TestLifecycleComponent.OnDestroy = {}
-- BUG诊断: OnTick 不是函数，应该是 function
TestLifecycleComponent.OnTick = nil

-- 符合规则的代码 (不应触发诊断)
-- 生命周期方法是函数类型
---组件启动时调用
function TestLifecycleComponent:OnStart()
    print("OnStart")
end

---组件启用时调用
function TestLifecycleComponent:OnEnable()
    print("OnEnable")
end

---组件禁用时调用
function TestLifecycleComponent:OnDisable()
    print("OnDisable")
end

---组件销毁时调用
function TestLifecycleComponent:OnDestroy()
    print("OnDestroy")
end

---组件更新时调用
---@param dt integer gametick
function TestLifecycleComponent:OnTick(dt)
    print("OnTick", dt)
end

return TestLifecycleComponent
