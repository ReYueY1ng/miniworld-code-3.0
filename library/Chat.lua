---@meta

---消息模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/chat.html)
---@class Chat
Chat = {}

---发送聊天消息(前面会附带房主的名字)
---@param content string 消息
---@param playerID integer? 玩家ID 0或nil表示发给所有玩家
---@return boolean result
function Chat:SendChat(content, playerID) end

---发送系统消息
---@param content string 消息
---@param playerID integer? 玩家ID 0或nil表示发给所有玩家
---@return boolean result
function Chat:SendSystemMsg(content, playerID) end