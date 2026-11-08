---@meta

---触发器 API（Trigger 命名空间）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量；全局接口请使用 World / Actor 等模块。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger
---@field Actor Trigger.Actor 角色模块
---@field Area Trigger.Area 区域模块
---@field ArrayTmp Trigger.ArrayTmp 临时数组模块
---@field Backpack Trigger.Backpack 背包模块
---@field Block Trigger.Block 方块模块
---@field Buff Trigger.Buff 状态模块
---@field Component Trigger.Component 组件模块
---@field CustomUI Trigger.CustomUI 界面模块
---@field DisplayBoard Trigger.DisplayBoard 显示板模块
---@field GameObject Trigger.GameObject 对象模块
---@field Graphics Trigger.Graphics 图文信息模块
---@field Item Trigger.Item 道具模块
---@field KvMap Trigger.KvMap KV 表模块
---@field Math Trigger.Math 数学模块
---@field Monster Trigger.Monster 生物模块
---@field Player Trigger.Player 玩家模块
---@field Timeline Trigger.Timeline 时间轴模块
---@field World Trigger.World 世界模块
Trigger = {}

---全部攻击类型
---@return number result 结果数值
function Trigger:AllAttackType() end

---全部音效
---@return number result 结果数值
function Trigger:AllSound() end

---全部状态
---@param data any 数据
function Trigger:AllStatus(data) end

---将任意值转换为字符串
---@param value table 值
function Trigger:AnyValue2Str(value) end

---对对象或对象数组执行操作
---@param src integer | integer[] | number 参数 src
---@param fn function 回调函数
function Trigger:DoObjOrArrayAction(src, fn) end

---获取属性值
---@param param table 参数
function Trigger:GetAttrVal(param) end

---获取特效参数
---@param cmp any 组件
function Trigger:GetEffectParams(cmp) end

---获取元件ID
---@param uiID any 界面ID
---@param elementid? any 元件ID
---@return string value 结果字符串
function Trigger:GetElementID(uiID, elementid) end

---获取最后创建的方块ID
function Trigger:GetLastCreateBlockId() end

---获取最后创建的生物ID
function Trigger:GetLastCreateCreatureId() end

---获取最后创建的生物对象ID
function Trigger:GetLastCreateCreatureObjId() end

---获取最后创建的特效ID
function Trigger:GetLastCreateEffectId() end

---获取最后创建的道具ID
function Trigger:GetLastCreateItemId() end

---获取生物ID
---@param cmp any 组件
function Trigger:GetMobId(cmp) end

---获取玩家ID
---@param cmp any 组件
function Trigger:GetPlayerId(cmp) end

---获取预制体ID字符串
---@param id any ID
function Trigger:GetPrefabIdStr(id) end

---获取预制体信息
---@param id any ID
---@param objType any 对象类型
---@return table value 结果表
function Trigger:GetPrefabInfo(id, objType) end

---获取随机颜色
function Trigger:GetRandomColor() end

---获取字符串长度
---@param str string 字符串
---@return number value 长度
function Trigger:GetStringLength(str) end

---获取界面对象
---@param id any ID
function Trigger:GetUIObject(id) end

---获取世界对象
function Trigger:GetWorld() end

---打印标签
---@param tag any 标签
---@vararg any
function Trigger:PrintTag(tag, ...) end

---设置最后创建的方块ID
---@param blockid any 方块ID
function Trigger:SetLastCreateBlockId(blockid) end

---设置最后创建的生物ID
---@param actorid any 角色ID
function Trigger:SetLastCreateCreatureId(actorid) end

---设置最后创建的特效ID
---@param effectid any 特效ID
function Trigger:SetLastCreateEffectId(effectid) end

---设置最后创建的道具ID
---@param itemid any 道具ID
function Trigger:SetLastCreateItemId(itemid) end

---拆分字符串
---@param str string 字符串
---@param mark string 分隔符
---@param index number 索引
function Trigger:SplitStr(str, mark, index) end

---将字符串转换为对象
---@param itype any 类型
---@param str any 字符串
function Trigger:Str2Obj(itype, str) end

---将字符串转换为玩家ID
---@param str any 字符串
function Trigger:String2Playerid(str) end

---截取子字符串
---@param content string 内容
---@param startIdx any 起始索引
---@param endIdx any 结束索引
---@return string result 结果字符串
function Trigger:Substring(content, startIdx, endIdx) end

---转换为生物ID
---@param id number ID
---@return number result 结果数值
function Trigger:ToMobId(id) end

---转换为玩家ID
---@param id number ID
---@return number result 结果数值
function Trigger:ToPlayerId(id) end

---传送到分类房间
---**调用限制**: 仅白名单用户可用
---@vararg any
function Trigger:TransmitToCategoryRoom(...) end

---等待
---@param second number 秒数
---@param cmp any 组件
---@return boolean result 是否成功
function Trigger:Wait(second, cmp) end
