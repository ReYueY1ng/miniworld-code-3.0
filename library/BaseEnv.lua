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
