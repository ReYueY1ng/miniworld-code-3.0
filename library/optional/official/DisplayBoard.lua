---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· DisplayBoard<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---获取显示板对象上的公告板组件
---@param objId integer 对象ID
---@return userdata? component UIBillboard 组件，对象或组件不存在时为 nil
function DisplayBoard:GetBillboard(objId) end

---获取显示板属性对应的元件ID
---格式为 DisplayBoard@<对象ID>_image1/_text1/_progress1
---@param objId integer 对象ID
---@param property any 属性类型：0 图片、1 文本、2 进度条
---@return string? elementid 元件ID，属性非法时为 nil
function DisplayBoard:GetElementID(objId, property) end

---用快照数据刷新显示板组件
---组件已存在时直接返回 true
---快照组件名不是 UIBillboard 时返回 false
---@param objId number 对象ID
---@param snapshot table 组件快照表；传 false 表示移除组件
---@param version any 快照版本号
---@return boolean result 是否成功
function DisplayBoard:RefreshComponent(objId, snapshot, version) end
