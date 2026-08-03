---@meta

---openFnArgs方法未定义诊断测试文件
--- 此文件测试 openFnArgs 中声明的方法是否有对应的函数定义

---@class TestOpenFnArgsMethodComponent: WorldComponent
local TestOpenFnArgsMethodComponent = {}

-- 违反规则的代码 (应触发诊断)
-- openFnArgs 中声明的方法没有对应的函数定义
TestOpenFnArgsMethodComponent.openFnArgs = {
    -- BUG诊断: 声明了 GetHealth 方法，但没有对应的函数定义
    GetHealth = {
        returnType = Mini.Number,
        displayName = "获取血量",
        params = {},
    },
    -- BUG诊断: 声明了 Add 方法，但没有对应的函数定义
    Add = {
        returnType = Mini.Number,
        displayName = "加法",
        params = {"第一个数", Mini.Number, "第二个数", Mini.Number},
    },
    -- BUG诊断: 声明了简单方法，但没有对应的函数定义
    SimpleMethod = true,
}

-- 符合规则的代码 (不应触发诊断)
-- openFnArgs 中声明的方法有对应的函数定义
TestOpenFnArgsMethodComponent.openFnArgs = {
    -- 正常: 声明的方法有对应的函数定义
    GetSpeed = {
        returnType = Mini.Number,
        displayName = "获取速度",
        params = {},
    },
}

---获取速度
---@return number speed 速度值
function TestOpenFnArgsMethodComponent:GetSpeed()
    return 10
end

return TestOpenFnArgsMethodComponent
