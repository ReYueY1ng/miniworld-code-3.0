---@meta

---触发器 Graphics 模块（Trigger.Graphics）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Graphics
Trigger.Graphics = {}

---按角色创建graphics
---@param data integer | integer[] 数据
---@param info table 信息
---@param dir number 方向
---@param offest any 偏移
---@return boolean result 是否成功
function Trigger.Graphics:CreateGraphicsByActor(data, info, dir, offest) end

---按actor2创建graphics
---@param data integer | integer[] 数据
---@param info table 信息
---@param x any X坐标
---@param y any Y坐标
---@return boolean result 是否成功
function Trigger.Graphics:CreateGraphicsByActor2(data, info, x, y) end

---按位置创建graphics
---@param pos any 位置
---@param GraphicInfo table 参数 GraphicInfo
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.Graphics:CreateGraphicsByPos(pos, GraphicInfo, worldId) end

---按位置创建graphics
---@param pos any 位置
---@param GraphicInfo table 参数 GraphicInfo
---@param x any X坐标
---@param y any Y坐标
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.Graphics:CreateGraphicsByPos2(pos, GraphicInfo, x, y, worldId) end

---获取innergraphics偏移
---@param tuin any 参数 tuin
---@param itype any 类型
function Trigger.Graphics:GetInnerGraphicsOffset(tuin, itype) end

---makegraphicsarrow转换为位置
---@param pos Mini.Vec3 位置
---@param size any 大小
---@param color any 颜色
---@param itype any 类型
---@param worldId any 星球ID
function Trigger.Graphics:MakeGraphicsArrowToPos(pos, size, color, itype, worldId) end

---makegraphicsline转换为位置
---@param pos Mini.Vec3 位置
---@param size any 大小
---@param color any 颜色
---@param itype any 类型
---@param worldId any 星球ID
function Trigger.Graphics:MakeGraphicsLineToPos(pos, size, color, itype, worldId) end

---makegraphicsnavpath转换为位置
---@param pos Mini.Vec3 位置
---@param itype any 类型
---@param canSeePlayersArr integer | integer[] 是否seeplayersarr
function Trigger.Graphics:MakeGraphicsNavPathToPos(pos, itype, canSeePlayersArr) end

---makegraphicssurface转换为位置
---@param pos Mini.Vec3 位置
---@param size any 大小
---@param color any 颜色
---@param itype any 类型
---@param worldId any 星球ID
function Trigger.Graphics:MakeGraphicsSurfaceToPos(pos, size, color, itype, worldId) end

---按对象ID移除graphics
---@param objids integer | integer[] 参数 objids
---@param itype any 类型
---@param graphType any 参数 graphType
---@return boolean result 是否成功
function Trigger.Graphics:RemoveGraphicsByObjID(objids, itype, graphType) end

---按位置移除graphics
---@param pos? Mini.Vec3 位置
---@param itype any 类型
---@param graphType any 参数 graphType
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.Graphics:RemoveGraphicsByPos(pos, itype, graphType, worldId) end
