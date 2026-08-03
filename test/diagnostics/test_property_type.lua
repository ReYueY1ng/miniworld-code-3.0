---@meta

---属性类型无效诊断测试文件
--- 此文件测试组件属性的 type 字段是否可以解析

---@class TestPropertyTypeComponent: WorldComponent
local TestPropertyTypeComponent = {}

-- 违反规则的代码 (应触发诊断)
-- 属性的 type 字段无法解析
TestPropertyTypeComponent.propertys = {
    -- BUG诊断: type 是 nil，无法解析
    badProp1 = {
        type = nil,
        default = 0,
    },
    -- BUG诊断: type 是不存在的类型
    badProp2 = {
        type = "NonExistentType",
        default = 0,
    },
    -- BUG诊断: type 是空字符串
    badProp3 = {
        type = "",
        default = 0,
    },
    -- BUG诊断: type 是 number
    badProp4 = {
        type = 123,
        default = 0,
    },
}

-- 符合规则的代码 (不应触发诊断)
-- 属性的 type 字段可以解析
TestPropertyTypeComponent.propertys = {
    -- 正常: 使用 Mini.Number
    goodProp1 = {
        type = Mini.Number,
        default = 0,
    },
    -- 正常: 使用 Mini.String
    goodProp2 = {
        type = Mini.String,
        default = "",
    },
    -- 正常: 使用 Mini.Bool
    goodProp3 = {
        type = Mini.Bool,
        default = false,
    },
    -- 正常: 简单定义 (type 可推导)
    simpleProp = 100,
}

return TestPropertyTypeComponent
