---@meta

---IsValid检查缺失诊断测试文件
--- 此文件测试通过 GetComponent 获取组件后是否调用了 IsValid 检查

---@class TestIsValidComponent: WorldComponent
local TestIsValidComponent = {}

-- 违反规则的代码 (应触发诊断)
-- 通过 GetComponent 获取组件后没有调用 IsValid 检查
function TestIsValidComponent:OnStart()
    -- BUG诊断: 获取组件后直接使用，没有检查 IsValid
    local cmp = self:GetComponent("otherComponent")
    cmp:DoSomething()
end

function TestIsValidComponent:OnTick(dt)
    -- BUG诊断: 获取组件后直接读取属性，没有检查 IsValid
    local cmp = self:GetComponent("anotherComponent")
    local value = cmp.value
end

-- 符合规则的代码 (不应触发诊断)
-- 通过 GetComponent 获取组件后调用了 IsValid 检查
function TestIsValidComponent:OnStart()
    -- 正常: 获取组件后检查 IsValid
    local cmp = self:GetComponent("otherComponent")
    if cmp and cmp:IsValid() then
        cmp:DoSomething()
    end
end

function TestIsValidComponent:OnTick(dt)
    -- 正常: 获取组件后检查 IsValid
    local cmp = self:GetComponent("anotherComponent")
    if cmp and cmp:IsValid() then
        local value = cmp.value
    end
end

return TestIsValidComponent
