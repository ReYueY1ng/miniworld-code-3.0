---@meta

---CustomData缺少customDef诊断测试文件
--- 此文件测试组件属性 type 为 CustomData 时是否有 customDef 字段

---@class TestCustomDataComponent: WorldComponent
local TestCustomDataComponent = {}

-- 违反规则的代码 (应触发诊断)
-- 属性 type 为 CustomData 但缺少 customDef
TestCustomDataComponent.propertys = {
    -- BUG诊断: type 是 CustomData 但缺少 customDef
    badProp1 = {
        type = "CustomData",
        default = 0,
    },
    -- BUG诊断: type 是 CustomData 但 customDef 是 nil
    badProp2 = {
        type = "CustomData",
        customDef = nil,
        default = 0,
    },
}

-- 符合规则的代码 (不应触发诊断)
-- 属性 type 为 CustomData 且有 customDef
TestCustomDataComponent.propertys = {
    -- 正常: type 是 CustomData 且有 customDef
    goodProp1 = {
        type = "CustomData",
        customDef = {
            health = 100,
            name = "default",
        },
        default = 0,
    },
    -- 正常: 非 CustomData 类型不需要 customDef
    normalProp = {
        type = Mini.Number,
        default = 0,
    },
}

return TestCustomDataComponent
