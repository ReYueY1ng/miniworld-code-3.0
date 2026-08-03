---@meta

---禁止开发参数类型诊断测试文件
--- 此文件测试组件属性的 type 是否在 ForbidDevParamType 列表中

---@class TestForbidDevComponent: WorldComponent
local TestForbidDevComponent = {}

-- 违反规则的代码 (应触发诊断)
-- 属性类型在 ForbidDevParamType 列表中 (不允许开发者使用)
TestForbidDevComponent.propertys = {
    -- BUG诊断: CheckList 在 ForbidDevParamType 中
    badProp1 = {
        type = "CheckList",
        default = 0,
    },
    -- BUG诊断: Action 在 ForbidDevParamType 中
    badProp2 = {
        type = "Action",
        default = 0,
    },
    -- BUG诊断: PathPoint 在 ForbidDevParamType 中
    badProp3 = {
        type = "PathPoint",
        default = 0,
    },
    -- BUG诊断: Model 在 ForbidDevParamType 中
    badProp4 = {
        type = "Model",
        default = 0,
    },
    -- BUG诊断: Picture 在 ForbidDevParamType 中
    badProp5 = {
        type = "Picture",
        default = 0,
    },
    -- BUG诊断: Blueprint 在 ForbidDevParamType 中
    badProp6 = {
        type = "Blueprint",
        default = 0,
    },
}

-- 符合规则的代码 (不应触发诊断)
-- 属性类型不在 ForbidDevParamType 列表中
TestForbidDevComponent.propertys = {
    -- 正常: Mini.Number 允许使用
    goodProp1 = {
        type = Mini.Number,
        default = 0,
    },
    -- 正常: Mini.String 允许使用
    goodProp2 = {
        type = Mini.String,
        default = "",
    },
    -- 正常: Mini.Bool 允许使用
    goodProp3 = {
        type = Mini.Bool,
        default = false,
    },
    -- 正常: Mini.Color 允许使用
    goodProp4 = {
        type = Mini.Color,
        default = Mini.Color(255, 0, 0, 255),
    },
}

return TestForbidDevComponent
