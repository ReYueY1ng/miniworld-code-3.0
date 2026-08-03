---@meta

---Array itemType无效诊断测试文件
--- 此文件测试 openFnArgs 中 returnType = Mini.Array 时 itemType 是否有效

---@class TestArrayItemTypeComponent: WorldComponent
local TestArrayItemTypeComponent = {}

-- 违反规则的代码 (应触发诊断)
-- openFnArgs 中 Array 的 itemType 无效
TestArrayItemTypeComponent.openFnArgs = {
    -- BUG诊断: returnType = Mini.Array 但 itemType 缺失
    BadArray1 = {
        returnType = Mini.Array,
        displayName = "错误数组",
        params = {},
    },
    -- BUG诊断: returnType = Mini.Array 但 itemType 是 ForbidDevParamType
    BadArray2 = {
        returnType = Mini.Array,
        itemType = "CheckList", -- 在 ForbidDevParamType 中
        displayName = "错误数组",
        params = {},
    },
    -- BUG诊断: returnType = Mini.Array 但 itemType 是 ForbidDevArrayParamType
    BadArray3 = {
        returnType = Mini.Array,
        itemType = "ModelAction", -- 在 ForbidDevArrayParamType 中
        displayName = "错误数组",
        params = {},
    },
    -- BUG诊断: returnType = Mini.Array 但 itemType 是无效类型
    BadArray4 = {
        returnType = Mini.Array,
        itemType = "NonExistentType",
        displayName = "错误数组",
        params = {},
    },
}

-- 符合规则的代码 (不应触发诊断)
-- openFnArgs 中 Array 的 itemType 有效
TestArrayItemTypeComponent.openFnArgs = {
    -- 正常: returnType = Mini.Array 且 itemType 是 Mini.Number
    GoodArray1 = {
        returnType = Mini.Array,
        itemType = Mini.Number,
        displayName = "正确数组",
        params = {},
    },
    -- 正常: returnType = Mini.Array 且 itemType 是 Mini.String
    GoodArray2 = {
        returnType = Mini.Array,
        itemType = Mini.String,
        displayName = "正确数组",
        params = {},
    },
    -- 正常: 不使用 Mini.Array
    NoArray = {
        returnType = Mini.Number,
        displayName = "非数组",
        params = {},
    },
}

return TestArrayItemTypeComponent
