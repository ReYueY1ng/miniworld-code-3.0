---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Task<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param name any
function Task:AddPlayerInitTaskChain(name) end

---官方环境独有接口（未收录于开发环境）
function Task:CloseNativePlayerGuide() end

---官方环境独有接口（未收录于开发环境）
function Task:GetIsHasSingPlayerGuide() end

---官方环境独有接口（未收录于开发环境）
function Task:GetIsInSingPlayerGuide() end

---官方环境独有接口（未收录于开发环境）
---@param playerId any
---@param name any
---@param isFinish any
function Task:NextTask(playerId, name, isFinish) end

---官方环境独有接口（未收录于开发环境）
---@param taskID any
function Task:OpenMainTaskForTaskID(taskID) end

---官方环境独有接口（未收录于开发环境）
function Task:PassSingPlayerGuide() end

---官方环境独有接口（未收录于开发环境）
---@param playerId any
---@param name any
function Task:PassTaskChain(playerId, name) end

---官方环境独有接口（未收录于开发环境）
---@param name any
---@param cfg any
function Task:SetSingPlayerGuide(name, cfg) end

---官方环境独有接口（未收录于开发环境）
---@param name any
---@param cfg any
function Task:SetTaskCfg(name, cfg) end

---官方环境独有接口（未收录于开发环境）
---@param name any
---@param cfg any
function Task:SetTaskChainCfg(name, cfg) end

---官方环境独有接口（未收录于开发环境）
---@param tips any
---@param okFn any
---@param cancellFn any
function Task:ShowPassGuideMessageBox(tips, okFn, cancellFn) end

---官方环境独有接口（未收录于开发环境）
---@param playerId any
---@param name any
function Task:StartTaskChain(playerId, name) end

---官方环境独有接口（未收录于开发环境）
---@param playerId any
---@param name any
function Task:StopTaskChain(playerId, name) end
