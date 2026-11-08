---@meta

---触发器 Area 模块（Trigger.Area）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Area
Trigger.Area = {}

---判断区域内是否存在指定类型的方块
---区域内任意一个该类型方块即返回 true
---@param blockid number | string 方块类型ID，自定义方块可传资源ID字符串
---@param areaid number 区域唯一ID
---@return boolean? bool 是否存在，参数类型非法或区域不存在时为 nil
function Trigger.Area:BlockInArea(blockid, areaid) end

---清空区域内指定类型的方块且不触发事件
---内部按最大数量 0（不限制）清除，且不触发方块事件
---传入数组时逐个类型清除，任一成功即返回 true
---@param areaid number 区域唯一ID
---@param blockids integer | integer[] | table 方块类型ID或其数组，传 0 表示所有类型
---@return boolean bool 是否至少有一个清除操作成功
function Trigger.Area:ClearAllBlock(areaid, blockids) end

---把区域内的方块整体复制到目标位置
---复制方式取值由引擎 CopyAllBlockAreaRangeToArea 解释，常用 1
---传范围表时使用当前所在星球，不解析星球ID
---@param itype number 复制方式，默认 1
---@param areaid table 区域ID，或 {posbeg=起点, posend=终点} 范围表
---@param deststartpos any 目标起始坐标表，需含 x/y/z
---@return boolean bool 是否复制成功
function Trigger.Area:CloneArea(itype, areaid, deststartpos) end

---破坏区域内的方块并掉落物品
---内部固定按数量 0（全部）、允许掉落、触发事件处理
---传入数组时逐个类型破坏，任一成功即返回 true
---@param areaid number 区域唯一ID
---@param blockids integer | integer[] | table 方块类型ID或其数组，传 0 表示所有类型
---@return boolean bool 是否至少有一个破坏操作成功
function Trigger.Area:DestroyAllBlock(areaid, blockids) end

---用指定方块填充整个区域
---填充分帧执行，当前帧内可能还查不到新方块
---开关参数不会写入方块，需要另行调用 Trigger.Block:SetBlockSwichState
---@param blockid number | string 填充用的方块类型ID，自定义方块可传资源ID字符串
---@param areaid integer 区域唯一ID
---@param itype number 填充类型（AreaFillType：1 删除，2 破坏），默认 1
---@param face any 新方块朝向，默认 0
---@param color any 颜色值，仅颜色方块生效
---@param switch boolean 开关状态，当前实现未使用
---@return boolean bool 是否提交填充成功
function Trigger.Area:FillBlock(blockid, areaid, itype, face, color, switch) end

---获取区域包围盒中心点坐标
---与 GetCenterPos 实现完全相同
---返回值保留对角坐标相加后除以 2 的小数部分
---@param areaid table 区域ID，或 {posbeg=起点, posend=终点} 范围表
---@return table? value 中心点坐标 {x,y,z}，区域不存在时为 nil
function Trigger.Area:GetCenterFloatPos(areaid) end

---获取区域包围盒中心点坐标
---与 GetCenterFloatPos 实现完全相同
---坐标并未取整，可能带小数
---@param areaid table 区域ID，或 {posbeg=起点, posend=终点} 范围表
---@return table? value 中心点坐标 {x,y,z}，区域不存在时为 nil
function Trigger.Area:GetCenterPos(areaid) end

---在区域内随机取一个坐标点
---实现与 GetRandomPos 完全相同，按对角坐标取整后随机
---每次调用都会用 os.time 重新设置全局随机种子
---@param areaid table 区域ID，或 {posbeg=起点, posend=终点} 范围表
---@return table? value 随机坐标 {x,y,z}，区域不存在时为 nil
function Trigger.Area:GetRandomFloatPos(areaid) end

---在区域内随机取一个整数坐标
---对角坐标向下取整后分别在三个轴向上取随机整数
---每次调用都会用 os.time 重新设置全局随机种子
---@param areaid table 区域ID，或 {posbeg=起点, posend=终点} 范围表
---@return table? value 随机坐标 {x,y,z}，区域不存在时为 nil
function Trigger.Area:GetRandomPos(areaid) end

---判断对象当前是否位于区域内
---@param objid number 对象ID
---@param areaid number 区域唯一ID
---@return boolean? bool 是否在区域内，参数类型非法或区域不存在时为 nil
function Trigger.Area:ObjInArea(objid, areaid) end

---判断坐标点是否位于区域内
---星球由区域自身决定，无需传 worldId
---@param pos table 待判断坐标表，需含 x/y/z
---@param areaid number 区域唯一ID
---@return boolean? bool 是否在区域内，参数类型非法或区域不存在时为 nil
function Trigger.Area:PosInArea(pos, areaid) end

---把区域内某种方块批量替换为另一种方块
---引擎固定按包括空气方块处理，区域内空气位置也会被填充为目标方块
---目标方块为 4095（空气）时返回 false
---@param destblockid number | string 替换后的方块类型ID
---@param areaid number 区域唯一ID
---@param srcblockid number | string 区域内的待替换方块类型ID，传 0 表示所有类型
---@param face number 新方块朝向，默认 0
---@param color string | number 颜色值，仅颜色方块生效
---@param switch boolean 开关状态，当前实现未使用
---@return boolean bool 是否提交替换成功
function Trigger.Area:ReplaceAreaBlock(destblockid, areaid, srcblockid, face, color, switch) end
