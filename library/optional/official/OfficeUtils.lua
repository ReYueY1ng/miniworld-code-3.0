---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· OfficeUtils<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---检查summer动作activate
---@param callback any 回调函数
---@param actid any 动作ID
---@return boolean result 检查结果
function OfficeUtils:CheckSummerActActivate(callback, actid) end

---decodebase64
---@param str_ any 参数 str_
function OfficeUtils:DecodeBase64(str_) end

---fishreq
---@param querytype any 参数 querytype
---@param param any 参数
---@param callfun any 参数 callfun
function OfficeUtils:FishReq(querytype, param, callfun) end

---generaltaskreported
---@param uin any 玩家Uin
---@param t any 参数 t
---@param id1 string 参数 id1
---@param id2 any 参数 id2
---@param id3 any 参数 id3
---@return boolean result 是否成功
function OfficeUtils:GeneralTaskReported(uin, t, id1, id2, id3) end

---获取全局task配置
---@param callback any 回调函数
function OfficeUtils:GetGlobalTaskCfg(callback) end

---munreq
---@param querytype any 参数 querytype
---@param params any 参数
---@param callfun any 参数 callfun
function OfficeUtils:MunReq(querytype, params, callfun) end

---上报activate数据
---@param actid any 动作ID
---@vararg any
function OfficeUtils:ReportActivateData(actid, ...) end

---上报事件
---@param sID any sID
---@param cID any cID
---@param oID any oID
---@param event any 事件
---@param eventTb? table 参数 eventTb
---@param uin? any 玩家Uin
---@return boolean result 是否成功
function OfficeUtils:ReportEvent(sID, cID, oID, event, eventTb, uin) end

---设置activate数据
---@param actid any 动作ID
---@vararg any
function OfficeUtils:SetActivateData(actid, ...) end

---zombie击杀
---@param uin any 玩家Uin
function OfficeUtils:ZombieKill(uin) end

---zombie上报数据
---@param uin any 玩家Uin
function OfficeUtils:ZombieReportData(uin) end
