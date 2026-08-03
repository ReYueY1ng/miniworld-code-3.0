---@meta

---禁用标准库使用诊断测试文件
--- 此文件测试是否使用了被禁用的标准库函数

---@class TestDisabledLibComponent: WorldComponent
local TestDisabledLibComponent = {}

-- 违反规则的代码 (应触发诊断)
-- 使用了被禁用的标准库
function TestDisabledLibComponent:OnStart()
    -- BUG诊断: 使用了 rawset (已禁用)
    rawset({}, "key", "value")

    -- BUG诊断: 使用了 require (已禁用)
    local module = require("some_module")

    -- BUG诊断: 使用了 io 库 (已禁用)
    local file = io.open("test.txt", "r")

    -- BUG诊断: 使用了 debug 库 (已禁用)
    local info = debug.getinfo(1)

    -- BUG诊断: 使用了 ffi 库 (已禁用)
    local ffi = require("ffi")

    -- BUG诊断: 使用了 jit 库 (已禁用)
    local status = jit.status()

    -- BUG诊断: 使用了 package 库 (已禁用)
    local path = package.path

    -- BUG诊断: 使用了 loadstring (已禁用)
    local func = loadstring("return 1")

    -- BUG诊断: 使用了 loadfile (已禁用)
    local func = loadfile("test.lua")

    -- BUG诊断: 使用了 dofile (已禁用)
    dofile("test.lua")
end

-- 符合规则的代码 (不应触发诊断)
-- 使用了允许的标准库
function TestDisabledLibComponent:OnStart()
    -- 正常: string 库允许使用
    local str = string.format("Hello %s", "World")
    local len = string.len(str)

    -- 正常: table 库允许使用
    local t = {}
    table.insert(t, 1)
    table.remove(t, 1)

    -- 正常: math 库允许使用
    local result = math.floor(3.14)

    -- 正常: os 库允许使用
    local time = os.time()

    -- 正常: print 函数允许使用
    print("Hello World")
end

return TestDisabledLibComponent
