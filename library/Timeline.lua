---@meta

---剧情动画模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/timeline.html)
---@class Timeline
Timeline = {}

---对所有玩家播放Timeline
---@param timelineId string Timeline资源ID
---@return boolean code 是否成功
function Timeline:PlayForAll(timelineId) end

---对指定玩家播放Timeline
---@param uin number 玩家UIN
---@param timelineId string Timeline资源ID
---@param reverse boolean 是否反向播放
---@param playToEnd boolean 是否播放到结尾
---@return boolean code 是否成功
function Timeline:PlayForPlayer(uin, timelineId, reverse, playToEnd) end

---暂停指定玩家的Timeline播放
---@param uin number 玩家UIN
---@param timelineId string Timeline资源ID
---@return boolean code 是否成功
function Timeline:Pause(uin, timelineId) end

---恢复指定玩家的Timeline播放
---@param uin number 玩家UIN
---@param timelineId string Timeline资源ID
---@return boolean code 是否成功
function Timeline:Resume(uin, timelineId) end

---跳过指定玩家当前正在播放的Timeline
---@param uin number 玩家UIN
---@return boolean code 是否成功
function Timeline:SkipForPlayer(uin) end

---获取玩家Timeline播放状态
---@param uin number 玩家UIN
---@param timelineId string Timeline资源ID
---@return number state 播放状态(0空闲 1播放中 2暂停)
function Timeline:GetPlayerState(uin, timelineId) end

---检查所有玩家是否都已播放完成指定Timeline
---@param timelineId string Timeline资源ID
---@return boolean code 是否全部完成
function Timeline:IsAllFinished(timelineId) end
