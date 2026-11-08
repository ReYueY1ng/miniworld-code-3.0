---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· ClientPositive<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class ClientPositive
ClientPositive = {}

---执行客户端自动化测试指令
---仅在 IsCanOpenAutoTest 为真时执行
---世界对象上不存在该组件时会自动添加
---结果通过 DataSycMgr 回传主机，表结果会再包一层
---@param reportid integer 同步报告ID
---@param uin integer 玩家Uin，作为首个参数传给被测函数
---@param cmpName string 组件名
---@param fnName string 组件方法名
---@vararg any
function ClientPositive:DealAutoTestCmd(reportid, uin, cmpName, fnName, ...) end

---导出自动化测试报告
---由 AutoTestLogMgr 负责导出
---@param uin integer 玩家Uin
---@param runResults any 运行结果
---@param logs any 日志
function ClientPositive:ExportReportV2(uin, runResults, logs) end

---派发普通触发事件
---事件名不在客户端可派发列表时返回 false
---解析 observer 事件失败时无返回值
---@param content string 事件内容，eventmsg 字段为事件名
---@return boolean? result 是否已派发
function ClientPositive:OnDispathTriggerNomalEvent(content) end

---同步铭文台解锁的法术列表
---uin 非当前账号或参数不是表时返回 false
---铭文台界面未打开时直接返回 true
---@param uin integer 玩家Uin
---@param unlockSpellList table 已解锁法术列表
---@return boolean result 是否处理成功
function ClientPositive:OnSyncInscriptionTableUnlockSpellList(uin, unlockSpellList) end

---同步服务器时间到客户端
---@param uin integer 玩家Uin
---@param data any 服务器时间数据
function ClientPositive:OnSyncServerTime(uin, data) end
