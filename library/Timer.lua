---@meta

---计时器模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/timer.html)
---@class Timer
Timer = {}

---判断计时器是否存在
---@param timerid string | integer 计时器ID
---@return boolean result
function Timer:IsExist(timerid) end

---添加计时器
---@param name string 计时器名称
---@return integer timerid 计时器ID
function Timer:CreateTimer(name) end

---删除计时器
---@param timerid string | integer 计时器ID
---@return boolean result
function Timer:DeleteTimer(timerid) end

---启动倒计时
---@param timerid string | integer 计时器ID
---@param interval number 开始倒计时时间
---@param repeated boolean 是否重复
---@return boolean result
function Timer:StartBackwardTimer(timerid, interval, repeated) end

---启动正向计时
---@param timerid string | integer 计时器ID
---@return boolean result
function Timer:StartForwardTimer(timerid) end

---暂停计时器
---@param timerid string | integer 计时器ID
---@return boolean result
function Timer:PauseTimer(timerid) end

---恢复计时器
---@param timerid string | integer 计时器ID
---@return boolean result
function Timer:ResumeTimer(timerid) end

---停止计时器
---@param timerid string | integer 计时器ID
---@return boolean result
function Timer:StopTimer(timerid) end

---改变计时器计时
---@param timerid string | integer 计时器ID
---@param curtime number 计时器当前时刻
---@return boolean result
function Timer:ChangeTimerTime(timerid, curtime) end

---获取计时器时间
---@param timerid string | integer 计时器ID
---@return number runtime 当前倒计时时间
function Timer:GetTimerTime(timerid) end

---显示计时器窗口(若其他计时器已经显示，则替换显示)
---@param playerid integer | integer[] 玩家ID/玩家id数组
---@param timerid string | integer 计时器ID
---@param title string 计时器窗口显示的标题
---@return boolean result
function Timer:ShowTimerWnd(playerid, timerid, title) end

---隐藏计时器窗口
---@param playerid integer | integer[] 玩家ID/玩家id数组
---@return boolean result
function Timer:HideTimerWnd(playerid) end