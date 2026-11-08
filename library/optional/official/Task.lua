---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Task<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---添加玩家初始化taskchain
---@param name any 名称
---@return boolean result 是否成功
function Task:AddPlayerInitTaskChain(name) end

---关闭native玩家guide
---@return boolean result 是否成功
function Task:CloseNativePlayerGuide() end

---获取判断是否判断是否拥有sing玩家guide
---@return boolean value 是否成功
function Task:GetIsHasSingPlayerGuide() end

---在sing玩家guide中获取判断是否
---@return boolean value 是否成功
function Task:GetIsInSingPlayerGuide() end

---nexttask
---@param playerId any 玩家ID
---@param name any 名称
---@param isFinish any 是否finish
function Task:NextTask(playerId, name, isFinish) end

---为taskID打开主task
---@param taskID any taskID
function Task:OpenMainTaskForTaskID(taskID) end

---passsing玩家guide
---@return boolean result 是否成功
function Task:PassSingPlayerGuide() end

---passtaskchain
---@param playerId any 玩家ID
---@param name any 名称
function Task:PassTaskChain(playerId, name) end

---设置sing玩家guide
---@param name any 名称
---@param cfg any 配置
---@return boolean result 是否成功
function Task:SetSingPlayerGuide(name, cfg) end

---设置task配置
---@param name any 名称
---@param cfg any 配置
---@return boolean result 是否成功
function Task:SetTaskCfg(name, cfg) end

---设置taskchain配置
---@param name any 名称
---@param cfg any 配置
---@return boolean result 是否成功
function Task:SetTaskChainCfg(name, cfg) end

---显示passguide消息box
---@param tips any 参数 tips
---@param okFn any 参数 okFn
---@param cancellFn any 是否cellfn
function Task:ShowPassGuideMessageBox(tips, okFn, cancellFn) end

---开始taskchain
---@param playerId any 玩家ID
---@param name any 名称
function Task:StartTaskChain(playerId, name) end

---停止taskchain
---@param playerId any 玩家ID
---@param name any 名称
function Task:StopTaskChain(playerId, name) end
