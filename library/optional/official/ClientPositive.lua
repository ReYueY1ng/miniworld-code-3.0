---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· ClientPositive<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class ClientPositive
ClientPositive = {}

---官方环境独有接口（未收录于开发环境）
---@param reportid any
---@param uin any
---@param cmpName any
---@param fnName any
---@vararg any
function ClientPositive:DealAutoTestCmd(reportid, uin, cmpName, fnName, ...) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param runResults any
---@param logs any
function ClientPositive:ExportReportV2(uin, runResults, logs) end

---官方环境独有接口（未收录于开发环境）
---@param content any
function ClientPositive:OnDispathTriggerNomalEvent(content) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param unlockSpellList any
function ClientPositive:OnSyncInscriptionTableUnlockSpellList(uin, unlockSpellList) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param data any
function ClientPositive:OnSyncServerTime(uin, data) end
