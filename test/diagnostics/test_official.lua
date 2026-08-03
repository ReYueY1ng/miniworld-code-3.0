---@meta

---重定义官方方法诊断测试文件
--- 此文件测试是否重定义了 baseComponent 的官方方法 (除 Init 外)

---@class TestOfficialComponent: WorldComponent
local TestOfficialComponent = {}

-- 违反规则的代码 (应触发诊断)
-- 重定义了 baseComponent 的官方方法
-- BUG诊断: 重定义了 GetComponent 方法
function TestOfficialComponent:GetComponent(cmpid)
    return nil
end

-- BUG诊断: 重定义了 AddTriggerEvent 方法
function TestOfficialComponent:AddTriggerEvent(eventType, handler)
    print("重定义的 AddTriggerEvent")
end

-- BUG诊断: 重定义了 PushCustomEvent 方法
function TestOfficialComponent:PushCustomEvent(eventType, ...)
    print("重定义的 PushCustomEvent")
end

-- BUG诊断: 重定义了 DoTaskInTime 方法
function TestOfficialComponent:DoTaskInTime(handler, seconds)
    print("重定义的 DoTaskInTime")
end

-- BUG诊断: 重定义了 ThreadWork 方法
function TestOfficialComponent:ThreadWork(handler)
    print("重定义的 ThreadWork")
end

-- 符合规则的代码 (不应触发诊断)
-- Init 方法允许重定义
function TestOfficialComponent:Init()
    print("Init 方法可以重定义")
end

-- 自定义方法不会触发诊断
function TestOfficialComponent:MyCustomMethod()
    print("自定义方法不会触发诊断")
end

return TestOfficialComponent
