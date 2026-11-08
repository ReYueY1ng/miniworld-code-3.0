---@meta

---触发器 Area 模块（Trigger.Area）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Area
Trigger.Area = {}

---在区域中方块
---@param blockid any 方块ID
---@param areaid any 区域ID
function Trigger.Area:BlockInArea(blockid, areaid) end

---清空全部方块
---@param areaid any 区域ID
---@param blockids integer | integer[] | table 参数 blockids
---@return boolean result 是否成功
function Trigger.Area:ClearAllBlock(areaid, blockids) end

---克隆区域
---@param itype any 类型
---@param areaid table 区域ID
---@param deststartpos any 参数 deststartpos
function Trigger.Area:CloneArea(itype, areaid, deststartpos) end

---销毁全部方块
---@param areaid any 区域ID
---@param blockids integer | integer[] | table 参数 blockids
---@return boolean result 是否成功
function Trigger.Area:DestroyAllBlock(areaid, blockids) end

---fill方块
---@param blockid any 方块ID
---@param areaid any 区域ID
---@param itype any 类型
---@param face any 朝向
---@param color any 颜色
---@param switch any 开关
function Trigger.Area:FillBlock(blockid, areaid, itype, face, color, switch) end

---获取centerfloat位置
---@param areaid table 区域ID
function Trigger.Area:GetCenterFloatPos(areaid) end

---获取center位置
---@param areaid table 区域ID
function Trigger.Area:GetCenterPos(areaid) end

---获取randomfloat位置
---@param areaid table 区域ID
function Trigger.Area:GetRandomFloatPos(areaid) end

---获取random位置
---@param areaid table 区域ID
function Trigger.Area:GetRandomPos(areaid) end

---在区域中对象
---@param objid any 对象ID
---@param areaid any 区域ID
function Trigger.Area:ObjInArea(objid, areaid) end

---在区域中位置
---@param pos any 位置
---@param areaid any 区域ID
function Trigger.Area:PosInArea(pos, areaid) end

---替换区域方块
---@param destblockid any destblockID
---@param areaid any 区域ID
---@param srcblockid any srcblockID
---@param face any 朝向
---@param color any 颜色
---@param switch any 开关
function Trigger.Area:ReplaceAreaBlock(destblockid, areaid, srcblockid, face, color, switch) end
