---@meta

---关键字冲突诊断测试文件
--- 此文件测试属性名是否使用了保留关键字

---@class TestKeywordComponent: WorldComponent
local TestKeywordComponent = {}

-- 违反规则的代码 (应触发诊断)
-- 属性名使用了保留关键字，这些名称在框架内部使用
TestKeywordComponent.propertys = {
    -- BUG诊断: 使用了保留关键字 'isValid'
    isValid = false,
    -- BUG诊断: 使用了保留关键字 '__isEnable'
    __isEnable = true,
    -- BUG诊断: 使用了保留关键字 '__className_'
    __className_ = "TestKeywordComponent",
    -- BUG诊断: 使用了保留关键字 'OnDestroy'
    OnDestroy = nil,
    -- BUG诊断: 使用了保留关键字 'OnTick'
    OnTick = 0,
    -- BUG诊断: 使用了保留关键字 'OnDisable'
    OnDisable = nil,
    -- BUG诊断: 使用了保留关键字 'OnEnable'
    OnEnable = nil,
    -- BUG诊断: 使用了保留关键字 'OnStart'
    OnStart = nil,
    -- BUG诊断: 使用了保留关键字 'transform'
    transform = nil,
    -- BUG诊断: 使用了保留关键字 'gameObject'
    gameObject = nil,
    -- BUG诊断: 使用了保留关键字 '__PropertysChangeEventList'
    __PropertysChangeEventList = nil,
    -- BUG诊断: 使用了保留关键字 'OnUpdate'
    OnUpdate = nil,
}

-- 符合规则的代码 (不应触发诊断)
-- 属性名不使用保留关键字
TestKeywordComponent.propertys = {
    -- 正常属性
    health = 100,
    speed = 10,
    name = "Test",
    isValid_custom = false, -- 带后缀是允许的
}

return TestKeywordComponent
