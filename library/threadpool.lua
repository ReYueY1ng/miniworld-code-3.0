---@meta

---线程池库（基于协程）
---@class threadpool
threadpool = {}

--[[
等待某段时间后继续运行  
time为nil时会将event赋值到time，并且生成线程id  
event为nil时将会一直等待下去(9999999s) 直到退出地图  
frame_func为function时 每等待1tick(约为0.05s)会执行  
为table时 其中的 \_frame_ 每等待1tick会执行 \_tick_ 等待时间超时后先执行  
执行顺序: \_frame_, \_tick_, 主线程
]]
---@param event? number 线程id
---@param time? number 等待时间
---@param frame_func? function | {_frame_: function?, _tick_: function?} 每等待1tick执行的函数
function threadpool:wait(event, time, frame_func) end

---启动协程并传参
---@param func function 要执行的函数
---@param ... any 传参到函数
function threadpool:work(func, ...) end

threadpool.Work = threadpool.work
threadpool.Wait = threadpool.wait