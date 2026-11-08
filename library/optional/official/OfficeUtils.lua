---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· OfficeUtils<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param callback any
---@param actid any
function OfficeUtils:CheckSummerActActivate(callback, actid) end

---官方环境独有接口（未收录于开发环境）
---@param str_ any
function OfficeUtils:DecodeBase64(str_) end

---官方环境独有接口（未收录于开发环境）
---@param querytype any
---@param param any
---@param callfun any
function OfficeUtils:FishReq(querytype, param, callfun) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param t any
---@param id1 any
---@param id2 any
---@param id3 any
function OfficeUtils:GeneralTaskReported(uin, t, id1, id2, id3) end

---官方环境独有接口（未收录于开发环境）
---@param callback any
function OfficeUtils:GetGlobalTaskCfg(callback) end

---官方环境独有接口（未收录于开发环境）
---@param querytype any
---@param params any
---@param callfun any
function OfficeUtils:MunReq(querytype, params, callfun) end

---官方环境独有接口（未收录于开发环境）
---@param actid any
---@vararg any
function OfficeUtils:ReportActivateData(actid, ...) end

---官方环境独有接口（未收录于开发环境）
---@param sID any
---@param cID any
---@param oID any
---@param event any
---@param eventTb any
---@param uin any
function OfficeUtils:ReportEvent(sID, cID, oID, event, eventTb, uin) end

---官方环境独有接口（未收录于开发环境）
---@param actid any
---@vararg any
function OfficeUtils:SetActivateData(actid, ...) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
function OfficeUtils:ZombieKill(uin) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
function OfficeUtils:ZombieReportData(uin) end
