---@meta

---脚本事件支持接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/triggerevent.html)
---@class ScriptSupportEvent
ScriptSupportEvent = {}

---注册事件监听
---@param eventname string 事件名称
---@param fun fun(param: table) 回调函数
---@return integer? funcid 事件函数ID
function ScriptSupportEvent:registerEvent(eventname, fun) end

---注册事件监听（不带SSMod）
---@param eventname string 事件名称
---@param fun fun(param: table) 回调函数
---@return integer? funcid 事件函数ID
function ScriptSupportEvent:registerEvent_NoSSMod(eventname, fun) end

---注册事件监听（不报错）
---@param eventname string 事件名称
---@param fun fun(param: table) 回调函数
---@return integer? funcid 事件函数ID
function ScriptSupportEvent:registerEvent_NoError(eventname, fun) end

---动态注册一次性事件监听
---@param eventname string 事件名称
---@param fun fun(param: table) 回调函数
---@return integer? funcid 事件函数ID
function ScriptSupportEvent:regDynamicEventOnce(eventname, fun) end
