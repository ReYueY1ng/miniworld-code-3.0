---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· OfficeUtils<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---检查夏日活动是否已激活
---当前版本为空实现
---@param callback function 回调函数（当前实现未使用）
---@param actid integer 活动ID
---@return boolean result 固定为 false
function OfficeUtils:CheckSummerActActivate(callback, actid) end

---对Base64字符串进行解码
---直接调用引擎 ns_http 的 base64_decode
---@param str_ any 待解码字符串
---@return string result 解码后的字符串
function OfficeUtils:DecodeBase64(str_) end

---向FishServer查询信息
---FishServer 实例不存在时不执行任何操作
---@param querytype number 查询类型
---@param param any 查询参数
---@param callfun any 结果回调
function OfficeUtils:FishReq(querytype, param, callfun) end

---上报通用任务进度
---字符串 id1 未匹配到配置时以 -1 上报并返回 false
---数字 id1 直接透传
---@param uin integer 玩家Uin
---@param t any 任务类型（21 到 35）
---@param id1 string 目标ID，字符串时会按任务类型映射为搜索类型ID
---@param id2 any 进度参数
---@param id3 any 附加参数
---@return boolean result 是否上报成功
function OfficeUtils:GeneralTaskReported(uin, t, id1, id2, id3) end

---请求全局任务配置
---通过 VisualCfgMgr 请求 mod_global_task 表
---@param callback function 配置回调
function OfficeUtils:GetGlobalTaskCfg(callback) end

---向MunServer查询信息
---MunServer 实例不存在时不执行任何操作
---@param querytype number 查询类型
---@param params any 查询参数
---@param callfun any 结果回调
function OfficeUtils:MunReq(querytype, params, callfun) end

---上报活动激活数据
---当前版本为空实现，可变参数不会被使用
---@param actid integer 活动ID
---@vararg any
function OfficeUtils:ReportActivateData(actid, ...) end

---上报自定义埋点事件
---服务器构建下直接返回 true
---会向 eventTb 补充 cid、standby3 到 standby6、standby10 等房间与位置信息
---standReportEvent 不存在时返回 false
---@param sID any 事件一级ID
---@param cID any 事件二级ID
---@param oID any 事件三级ID
---@param event any 事件名
---@param eventTb? table 事件参数表
---@param uin? integer 玩家Uin，默认当前账号
---@return boolean result 是否上报成功
function OfficeUtils:ReportEvent(sID, cID, oID, event, eventTb, uin) end

---设置活动激活数据
---当前版本为空实现，可变参数不会被使用
---@param actid integer 活动ID
---@vararg any
function OfficeUtils:SetActivateData(actid, ...) end

---记录僵尸击杀
---当前版本为空实现
---@param uin integer 玩家Uin
function OfficeUtils:ZombieKill(uin) end

---上报僵尸玩法数据
---当前版本为空实现
---@param uin integer 玩家Uin
function OfficeUtils:ZombieReportData(uin) end
