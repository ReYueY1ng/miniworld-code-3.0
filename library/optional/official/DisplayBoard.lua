---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· DisplayBoard<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---获取billboard
---@param objId any 对象ID
function DisplayBoard:GetBillboard(objId) end

---获取元件ID
---@param objId any 对象ID
---@param property any 属性
function DisplayBoard:GetElementID(objId, property) end

---刷新component
---@param objId number 对象ID
---@param snapshot table 快照数据
---@param version any 版本号
---@return boolean result 是否成功
function DisplayBoard:RefreshComponent(objId, snapshot, version) end
