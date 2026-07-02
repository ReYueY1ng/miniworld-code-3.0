---@meta

---脚本事件支持接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/triggerevent.html)
---@class ScriptSupportEvent
ScriptSupportEvent = {}

---注册事件监听
---@param eventname string 事件名称
---@param fun fun(param: table) 回调函数
---@return integer? funcid 事件函数ID
function ScriptSupportEvent:RegisterEvent(eventname, fun) end

---注册事件监听（不带SSMod）
---@param eventname string 事件名称
---@param fun fun(param: table) 回调函数
---@return integer? funcid 事件函数ID
function ScriptSupportEvent:RegisterEvent_NoSSMod(eventname, fun) end

---注册事件监听（不报错）
---@param eventname string 事件名称
---@param fun fun(param: table) 回调函数
---@return integer? funcid 事件函数ID
function ScriptSupportEvent:RegisterEvent_NoError(eventname, fun) end

---动态注册一次性事件监听
---@param eventname string 事件名称
---@param fun fun(param: table) 回调函数
---@return integer? funcid 事件函数ID
function ScriptSupportEvent:RegDynamicEventOnce(eventname, fun) end

---注册方块事件监听
---@param eventname string 事件名称
---@param fun fun(param: table) 回调函数
---@param conditions number|number[] 方块ID或方块ID数组
function ScriptSupportEvent:RegisterEvent_Block(eventname, fun, conditions) end

---注销事件监听
---@param eventname string 事件名称
---@param funcid integer 事件函数ID
function ScriptSupportEvent:UnregEvent(eventname, funcid) end

---注销所有事件监听
function ScriptSupportEvent:UnregAllEvent() end

---触发自定义事件
---@param eventname string 事件名称
---@param eventparams table? 事件参数
function ScriptSupportEvent:TriggerCustomEvent(eventname, eventparams) end

---添加自定义事件函数
---@param eventname string 事件名称
---@param fun fun(param: table) 回调函数
function ScriptSupportEvent:AddCustomEventFunc(eventname, fun) end

---移除自定义事件函数
---@param eventname string 事件名称
---@param fun fun(param: table) 回调函数
function ScriptSupportEvent:RemoveCustomEventFunc(eventname, fun) end

---获取自定义事件函数列表
---@param eventname string 事件名称
---@return table? funclist 函数列表
function ScriptSupportEvent:GetCustomEventFuncList(eventname) end

---清空自定义事件函数列表
---@param eventname string 事件名称
function ScriptSupportEvent:ClearCustomEventFuncList(eventname) end

---清空所有自定义事件函数列表
function ScriptSupportEvent:ClearAllCustomEventFuncList() end

---判断是否为自定义事件
---@param event string 事件名称
---@return boolean result 是否为自定义事件
function ScriptSupportEvent:IsCustomEvent(event) end
