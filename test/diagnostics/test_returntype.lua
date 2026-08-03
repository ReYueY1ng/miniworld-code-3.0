---@meta

---returnType无效诊断测试文件
--- 此文件测试 openFnArgs 中 returnType 是否为有效的 ParamType

---@class TestReturnTypeComponent: WorldComponent
local TestReturnTypeComponent = {}

-- 违反规则的代码 (应触发诊断)
-- openFnArgs 中 returnType 不是有效的 ParamType
TestReturnTypeComponent.openFnArgs = {
    -- BUG诊断: returnType 是 string 类型，应该是 Mini.* 类型
    BadReturn1 = {
        returnType = "string",
        displayName = "错误返回类型",
        params = {},
    },
    -- BUG诊断: returnType 是 number 类型，应该是 Mini.* 类型
    BadReturn2 = {
        returnType = 123,
        displayName = "错误返回类型",
        params = {},
    },
    -- BUG诊断: returnType 是 table 类型，应该是 Mini.* 类型
    BadReturn3 = {
        returnType = {},
        displayName = "错误返回类型",
        params = {},
    },
}

-- 符合规则的代码 (不应触发诊断)
-- openFnArgs 中 returnType 是有效的 ParamType
TestReturnTypeComponent.openFnArgs = {
    -- 正常: returnType 是 Mini.Number
    GoodReturn1 = {
        returnType = Mini.Number,
        displayName = "正确返回类型",
        params = {},
    },
    -- 正常: returnType 是 Mini.Bool
    GoodReturn2 = {
        returnType = Mini.Bool,
        displayName = "正确返回类型",
        params = {},
    },
    -- 正常: returnType 是 Mini.String
    GoodReturn3 = {
        returnType = Mini.String,
        displayName = "正确返回类型",
        params = {},
    },
}

return TestReturnTypeComponent
