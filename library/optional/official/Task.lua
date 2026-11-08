---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Task<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---注册玩家初始化时自动开始的taskchain
---任务链配置需先通过 SetTaskChainCfg 注册
---@param name string 任务链名称
---@return boolean result 是否注册成功
function Task:AddPlayerInitTaskChain(name) end

---关闭原生新手引导
---@return boolean result 是否成功
function Task:CloseNativePlayerGuide() end

---判断是否已配置单人新手引导
---@return boolean value 是否存在引导
function Task:GetIsHasSingPlayerGuide() end

---判断当前是否处于单人新手引导中
---@return boolean value 是否处于引导中
function Task:GetIsInSingPlayerGuide() end

---推进玩家任务链中的下一个task
---玩家不存在或没有 Task 组件时静默忽略
---@param playerId integer 玩家ID
---@param name string 任务链名称
---@param isFinish boolean 是否把当前task标记为完成
function Task:NextTask(playerId, name, isFinish) end

---打开主线任务追踪面板
---固定调用 AdventureMode_OperCtrlPanel 打开任务追踪
---@param taskID any 任务ID（当前实现未使用）
function Task:OpenMainTaskForTaskID(taskID) end

---跳过单人新手引导
---@return boolean result 是否成功
function Task:PassSingPlayerGuide() end

---让玩家直接通过整个taskchain
---玩家不存在或没有 Task 组件时静默忽略
---@param playerId integer 玩家ID
---@param name string 任务链名称
function Task:PassTaskChain(playerId, name) end

---配置单人新手引导
---只检查任务管理器是否存在，不校验参数
---@param name string 引导名称
---@param cfg any 引导配置表
---@return boolean result 是否成功
function Task:SetSingPlayerGuide(name, cfg) end

---注册task配置
---name 或 cfg 为空时返回 false
---@param name string 任务名称
---@param cfg any 任务配置表
---@return boolean result 是否注册成功
function Task:SetTaskCfg(name, cfg) end

---注册taskchain配置
---name 或 cfg 为空时返回 false
---@param name string 任务链名称
---@param cfg any 任务链配置表
---@return boolean result 是否注册成功
function Task:SetTaskChainCfg(name, cfg) end

---弹出跳过引导的确认框
---使用 MessageBox(5) 弹窗，回调通过 pcall 调用，异常不会抛给调用方
---@param tips any 提示文本，默认空串
---@param okFn any 左侧按钮回调
---@param cancellFn any 右侧按钮回调
function Task:ShowPassGuideMessageBox(tips, okFn, cancellFn) end

---为玩家开始指定taskchain
---玩家没有 Task 组件时会自动添加
---@param playerId integer 玩家ID
---@param name string 任务链名称
function Task:StartTaskChain(playerId, name) end

---停止玩家正在进行的taskchain
---玩家不存在或没有 Task 组件时静默忽略
---@param playerId integer 玩家ID
---@param name string 任务链名称
function Task:StopTaskChain(playerId, name) end
