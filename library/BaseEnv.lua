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

---字符串是否以某字符串为开头
---@param String string
---@param Start string
---@return boolean result
function string.startswith(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

---字符串是否以某字符串为结尾
---@param String string
---@param End string
---@return boolean result
function string.endswith(String, End)
    return End == '' or string.sub(String, -string.len(End)) == End
end

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

---打印表
---@param value any
---@param indent? string 缩进
---@param vmap? table 去重表(无法关闭)
---@return string
local function __tostring(value, indent, vmap)
    local str = ''
    indent = indent or ''
    vmap = vmap or {}

    if type(value) ~= 'table' then
        if type(value) == 'string' then
            if string.byte(value,1) == 91 then
                str = string.format("'%s'", value)
            else
                if value:match('%[') then
                    str = string.format('"%s"', value)
                else
                    str = string.format("[[%s]]", value)
                end
            end
        else
            str = tostring(value)
        end
    else
        if type(vmap) == 'table' then
            if vmap[value] then return '('..tostring(value)..')' end
            vmap[value] = true
        end
        local auxTable = {}
        local iauxTable = {}
        local iiauxTable = {}
        for i, v in pairs(value) do
            if type(i) == 'number' then
                if i == 0 then
                    table.insert(iiauxTable, i)
                else
                    table.insert(iauxTable, i)
                end
            else
                table.insert(auxTable, i)
            end
        end

        table.sort(iauxTable)

        str = str..'{\n'
        local separator = ""
        local entry = "\n"
        local barray = true
        local kk,vv
        for i, k in ipairs (iauxTable) do
            if i == k and barray then
                entry = __tostring(value[k], indent..'    ', vmap)
                str = str..separator..indent..'    '..entry
                separator = ", \n"
            else
                barray = false
                table.insert(iiauxTable, k)
            end
        end
        for i, fieldName in ipairs (iiauxTable) do
            kk = tostring(fieldName)
            if type(fieldName) == "number" then kk = '['..kk.."]" end 
            if type(fieldName) == "string" and (fieldName:match("%.") or fieldName:match("-")) then kk = '["'..kk..'"]' end
            entry = kk .. " = " .. __tostring(value[fieldName],indent..'    ',vmap)

            str = str..separator..indent..'    '..entry
            separator = ", \n"
        end
        for i, fieldName in ipairs (auxTable) do
            kk = tostring(fieldName)
            if type(fieldName) == "number" then kk = '['..kk.."]" end 
            if type(fieldName) == "string" and (fieldName:match("%.") or fieldName:match("-"))then kk = '["'..kk..'"]' end

            vv = value[fieldName]
            entry = kk .. " = " .. __tostring(value[fieldName],indent..'    ',vmap)

            str = str..separator..indent..'    '..entry
            separator = ", \n"
        end
        str = str..'\n'..indent..'}'
    end
    return str
end
table.tostring =  __tostring

---深拷贝表
---@see copy_table
---@param ori_tab table
---@return table new_tab
local function th_table_dup(ori_tab)
    if type(ori_tab) ~= "table" then
---@diagnostic disable-next-line: return-type-mismatch
        return nil
    end
    local new_tab = {}
    for i,v in pairs(ori_tab) do
        local vtyp = type(v)
        if vtyp == "table" then
            new_tab[i] = th_table_dup(v)
        elseif vtyp == "thread" then
            new_tab[i] = v
        elseif vtyp == "userdata" then
            new_tab[i] = v
        else
            new_tab[i] = v
        end
    end
    return new_tab
end
table.clone = th_table_dup

---合并表
---@param dest table 被合并的表
---@param src table 要合并的表
---@param cb? function
---@param path? string
local function th_table_merge(dest, src, cb, path)
    if type(dest) == 'table' then
        for k, v in pairs(src) do
            local tp = type(v)
            local origin = dest[k]
            if tp == 'table' then
                dest[k] = dest[k] or {}
                th_table_merge(dest[k], v, cb, (cb and (path and path..'.'..k or k)) or nil)
            elseif tp == 'boolean' then
                dest[k] = v
            elseif tp == 'string' then
                dest[k] = v
            elseif tp == 'number' then
                dest[k] = v
            elseif tp == 'userdata' then
            elseif tp == 'cdata' then
            elseif tp == 'thread' then
            elseif tp == 'function' then
                dest[k] = v
            else
            end
            if type(cb) == 'function' then
                cb((path and path..'.'..k or k), v, origin)
            end
        end
    end
end
table.merge = th_table_merge

---比较表
---@param a any
---@param b any 
---@return boolean
local function th_table_equal(a, b)
    local ta = type(a)
    local tb = type(b)
    if ta ~= tb then return false end
    if ta == 'table' then
        local n = 0
        for k, v in pairs(a) do
            n = n + 1
            local tp = type(v)
            if tp ~= type(b[k])  then return false end

            if tp == 'string' then
                if v ~= b[k] then return false end
            elseif tp == 'number' then
                if v ~= b[k] then return false end
            elseif tp == 'table' then
                if th_table_equal(v, b[k]) == false then return false end
            else
                return false
            end
        end
        for k, v in pairs(b) do
            n = n - 1
        end
        if n ~= 0 then return false end
        return true
    elseif ta == 'number' or ta == 'string' or ta == 'boolean' then
        if ta == "number" and math.floor(a) < a and math.floor(b) < b then
            if math.abs(a -b) > 1e-6 then
                return false
            end
            return true
        end
        return a == b
    else
        return false
    end
end
table.equal = th_table_equal

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