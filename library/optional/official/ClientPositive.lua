---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· ClientPositive<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class ClientPositive
ClientPositive = {}

---dealautotestcmd
---@param reportid any 同步报告ID
---@param uin any 玩家Uin
---@param cmpName any 组件名称
---@param fnName any 函数名称
---@vararg any
function ClientPositive:DealAutoTestCmd(reportid, uin, cmpName, fnName, ...) end

---export上报v2
---@param uin any 玩家Uin
---@param runResults any 参数 runResults
---@param logs any 参数 logs
function ClientPositive:ExportReportV2(uin, runResults, logs) end

---ondispath触发nomal事件
---@param content any 内容
---@return boolean result 是否成功
function ClientPositive:OnDispathTriggerNomalEvent(content) end

---on同步inscription表解锁spell列表
---@param uin any 玩家Uin
---@param unlockSpellList table 参数 unlockSpellList
---@return boolean result 是否成功
function ClientPositive:OnSyncInscriptionTableUnlockSpellList(uin, unlockSpellList) end

---on同步服务器时间
---@param uin any 玩家Uin
---@param data any 数据
function ClientPositive:OnSyncServerTime(uin, data) end
