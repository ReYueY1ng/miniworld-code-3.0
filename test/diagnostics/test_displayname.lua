---@meta

---displayName非字符串诊断测试文件
--- 此文件测试 openFnArgs 中 displayName 是否为字符串类型

---@class TestDisplayNameComponent: WorldComponent
local TestDisplayNameComponent = {}

-- 违反规则的代码 (应触发诊断)
-- openFnArgs 中 displayName 不是字符串类型
TestDisplayNameComponent.openFnArgs = {
    -- BUG诊断: displayName 是 number 类型，应该是 string
    BadDisplay1 = {
        returnType = Mini.Number,
        displayName = 123,
        params = {},
    },
    -- BUG诊断: displayName 是 table 类型，应该是 string
    BadDisplay2 = {
        returnType = Mini.Number,
        displayName = {},
        params = {},
    },
    -- BUG诊断: displayName 是 boolean 类型，应该是 string
    BadDisplay3 = {
        returnType = Mini.Number,
        displayName = true,
        params = {},
    },
}

-- 符合规则的代码 (不应触发诊断)
-- openFnArgs 中 displayName 是字符串类型
TestDisplayNameComponent.openFnArgs = {
    -- 正常: displayName 是字符串类型
    GoodDisplay = {
        returnType = Mini.Number,
        displayName = "正确显示名",
        params = {},
    },
    -- 正常: 没有 displayName 也会使用方法名
    NoDisplay = {
        returnType = Mini.Number,
        params = {},
    },
}

return TestDisplayNameComponent
