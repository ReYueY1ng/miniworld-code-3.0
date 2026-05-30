---@alias s11111 TestCmp
---@class TestCmp: PlayerComponent
---@field fff integer
local test = {}

test.openFnArgs = {
    OnStart = true
}

test.aaa = 2
test.abc = 3


---@protected
function test:OnStart()
    self:GetGameObjectId()
    self:ThreadWait(1)
    local obj = self:GetGameObject()
end

---@type TestCmp
local cmp = GameObject:FindObject(111):GetComponent('s11111')
local s = type(cmp.transform)
cmp.aaa = 1
cmp.def = 2
cmp.fff = 2.1111

local tp = Actor:GetActorMovementMode(111)

local obj = GameObject:FindObject("aaa")

local c = obj:GetComponent('aaa')

local testclass = {}

testclass.abc = 1

---@class aaaa
local tes = Class('aaaa')
tes.type = 111

---@class newtes: aaaa
local newtes = Class('bbbb', 'aaaa')
newtes.type = 333
newtes.aa = 1

---@class newclass
local newclass = Class('newclass')
newclass.aa = 1

local twoclass = Class('twoclass', newclass)

print(twoclass.aa)

local newclassinst = Instance('newclass')

print(copy_table(newclass).aa)

local str = string.gsub("7573171450880807056-90822_8#clone39","7573171450880807056-90822_8","7573171450880807056-90822_9",1)