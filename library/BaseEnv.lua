---基本环境
---@meta
---@diagnostic disable: assign-type-mismatch, duplicate-set-field

function dofile() end

function loadstring() end

function loadfile() end

---@type nil
rawset = nil
io = {}
package = {}

debug = {}

---@return ''
function debug.traceback()
    return ''
end

---@type oslib
local os_origin = os

---@class os
local os_new = {}
os_new.time = os_origin.time
os_new.date = os_origin.date

---获取毫秒时间戳
---@return number time
function os_new.timeMs() end

os = os_new

---去除字符串首尾空白字符
---@param self string
---@return string result 去除空白后的字符串
function string:Trim() end

---分割字符串
---@param input any 被分割的字符串
---@param delimiter any 分隔符(不能为 "")
---@return string[] strs 字符串组
function string.split(input, delimiter)
    input = tostring(input)
    delimiter = tostring(delimiter)

    if delimiter == '' then
        ---@diagnostic disable-next-line: return-type-mismatch
        return false
    end

    local ret = {}
    local pos = 0
    for st, sp in function() return string.find(input, delimiter, pos, true) end do
        table.insert(ret, string.sub(input, pos, st - 1))
        pos = sp + 1
    end

    table.insert(ret, string.sub(input, pos))
    return ret
end

---比较两数值是否相似
---@param a number
---@param b number
---@return boolean
function math.approximately(a, b)
    if type(a) ~= "number" or type(b) ~= "number" then
        return false
    end

    return math.abs(b - a) < math.max(1e-06 * math.max(math.abs(a), math.abs(b)), 9.4039548e-38)
end

---限制数值范围
---@param value number
---@param min number
---@param max number
---@return number
function math.clamp(value, min, max)
    if type(value) ~= "number" or type(min) ~= "number" or type(max) ~= "number" then
        return value
    end

    if value < min then
        return min
    elseif max < value then
        return max
    else
        return value
    end
end

---在 from 与 to 之间按 t 进行线性插值
---@param from number
---@param to number
---@param t number 范围0-1
---@return number
function math.lerp(from, to, t)
    if type(from) ~= "number" or type(to) ~= "number" or type(t) ~= "number" then
        return from
    end

    t = math.clamp(t, 0, 1)

    return from * (1 - t) + to * t
end

---数值取余 (x % y)
---@param x number
---@param y number
---@return number
function math.mod(x, y)
    return x % y
end
