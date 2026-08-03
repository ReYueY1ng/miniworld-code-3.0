---@meta

---openFnArgs值类型错误诊断测试文件
--- 此文件测试 openFnArgs 中方法的值是否为合法类型 (table 或 boolean)

---@class TestOpenFnArgsValueComponent: WorldComponent
local TestOpenFnArgsValueComponent = {}

-- 违反规则的代码 (应触发诊断)
-- openFnArgs 中方法的值类型不正确
TestOpenFnArgsValueComponent.openFnArgs = {
    -- BUG诊断: 值为 number 类型，应该是 table 或 boolean
    BadMethod1 = 123,
    -- BUG诊断: 值为 string 类型，应该是 table 或 boolean
    BadMethod2 = "hello",
    -- BUG诊断: 值为 nil，应该是 table 或 boolean
    BadMethod3 = nil,
}

-- 符合规则的代码 (不应触发诊断)
-- openFnArgs 中方法的值类型正确
TestOpenFnArgsValueComponent.openFnArgs = {
    -- 正常: 值为 boolean 类型
    GoodMethod1 = true,
    -- 正常: 值为 table 类型
    GoodMethod2 = {
        returnType = Mini.Number,
        displayName = "测试方法",
        params = {},
    },
    -- 正常: 值为空 table
    GoodMethod3 = {},
}

return TestOpenFnArgsValueComponent
