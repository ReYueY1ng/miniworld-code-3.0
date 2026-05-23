---@meta

---官方工具接口
---@class OfficeUtils
OfficeUtils = {}

---获取激活进度
---@param reportid any 同步报告ID
---@param uin integer 玩家Uin
---@param taskid integer 任务ID
---@return nil
function OfficeUtils:GetActivateProgress(reportid, uin, taskid) end

---获取激活奖励
---@param reportid any 同步报告ID
---@param uin integer 玩家Uin
---@param taskid integer 任务ID
---@return nil
function OfficeUtils:GetActivateReward(reportid, uin, taskid) end

---获取商店物品信息
---@param itype integer 物品类型
---@param itemid integer 物品ID
---@return table? info 物品信息
function OfficeUtils:GetShopItemInfo(itype, itemid) end

---上报激活数据
---@param uin integer 玩家Uin
---@param eventid any 事件ID
---@param ... any 参数
---@return boolean result
function OfficeUtils:ReportActivateDataForUin(uin, eventid, ...) end

---发送客户端上报事件
---@param uin integer 玩家Uin
---@param sID any 服务器ID
---@param cID any 客户端ID
---@param oID any 对象ID
---@param event string 事件名
---@param eventTb? table 事件数据
---@return boolean result
function OfficeUtils:SendClientReportEvent(uin, sID, cID, oID, event, eventTb) end
