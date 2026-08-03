---@meta

---openFnArgs参数类型无效诊断测试文件
--- 此文件测试 openFnArgs 中 params 数组的元素是否为合法类型

---@class TestOpenFnArgsParamsComponent: WorldComponent
local TestOpenFnArgsParamsComponent = {}

-- 违反规则的代码 (应触发诊断)
-- openFnArgs 中 params 数组包含非法类型
TestOpenFnArgsParamsComponent.openFnArgs = {
    -- BUG诊断: params 中包含 number 类型，应该是 string 或 Mini.* 类型
    BadParams1 = {
        returnType = Mini.Number,
        displayName = "错误参数",
        params = {123, Mini.Number}, -- 123 是非法的
    },
    -- BUG诊断: params 中包含 table 类型
    BadParams2 = {
        returnType = Mini.Number,
        displayName = "错误参数",
        params = {{}, Mini.Number}, -- {} 是非法的
    },
    -- BUG诊断: params 中包含 boolean 类型
    BadParams3 = {
        returnType = Mini.Number,
        displayName = "错误参数",
        params = {true, Mini.Number}, -- true 是非法的
    },
}

-- 符合规则的代码 (不应触发诊断)
-- openFnArgs 中 params 数组包含合法类型
TestOpenFnArgsParamsComponent.openFnArgs = {
    -- 正常: params 只包含 string 和 Mini.* 类型
    GoodParams = {
        returnType = Mini.Number,
        displayName = "正确参数",
        params = {"第一个数", Mini.Number, "第二个数", Mini.Number},
    },
    -- 正常: params 只包含 Mini.* 类型
    SimpleParams = {
        returnType = Mini.Bool,
        displayName = "简单参数",
        params = {Mini.Player, Mini.Number},
    },
}

return TestOpenFnArgsParamsComponent
