---@meta

---线程池库（基于协程）
---@class threadpool
threadpool = {}

--[[
等待某段时间后继续运行<br>
time为nil时会将event赋值到time，并且生成线程id<br>
event为nil时将会一直等待下去(99999999s) 直到退出地图<br>
frame_func为function时 每等待1tick(约为0.05s)会执行<br>
为table时 其中的 update 每等待1tick会执行 tick 等待时间超时后先执行<br>
执行顺序: update, tick, 主线程
]]
---@param event? number 线程id（可选，若time为nil且event为number，则event的值会赋给time，event自动生成）
---@param time? number 等待时间（可选，默认为99999999）
---@param frame_func? function | {update: function?, tick: function?} 每等待1tick执行的函数（table时update每tick执行，tick超时后执行）
function threadpool:wait(event, time, frame_func) end

---启动协程并传参
---@param func function 要执行的函数
---@param ... any 传参到函数
function threadpool:work(func, ...) end

threadpool.Work = threadpool.work
threadpool.Wait = threadpool.wait
