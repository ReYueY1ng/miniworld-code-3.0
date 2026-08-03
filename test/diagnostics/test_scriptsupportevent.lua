---@meta

---ScriptSupportEvent使用诊断测试文件
--- 此文件测试是否使用了 ScriptSupportEvent (应使用 AddTriggerEvent)

---@class TestScriptSupportEventComponent: WorldComponent
local TestScriptSupportEventComponent = {}

-- 违反规则的代码 (应触发诊断)
-- 使用了 ScriptSupportEvent，应该使用 AddTriggerEvent
function TestScriptSupportEventComponent:OnStart()
    -- BUG诊断: 使用了 ScriptSupportEvent 注册事件
    ScriptSupportEvent.RegisterEvent("PlayerClickBlock", self.OnClick)
end

-- 符合规则的代码 (不应触发诊断)
-- 使用了 AddTriggerEvent 注册事件
function TestScriptSupportEventComponent:OnStart()
    -- 正常: 使用 AddTriggerEvent 注册事件
    self:AddTriggerEvent(TriggerEvent.PlayerClickBlock, self.OnClick)
end

return TestScriptSupportEventComponent
