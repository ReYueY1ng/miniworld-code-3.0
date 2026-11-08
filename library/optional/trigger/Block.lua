---@meta

---触发器 Block 模块（Trigger.Block）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Block
Trigger.Block = {}

---检查方块方向
---@param pos Mini.Vec3 位置
---@param dir any 方向
---@param val any 值
---@param worldId any 星球ID
---@return boolean result 检查结果
function Trigger.Block:CheckBlockDir(pos, dir, val, worldId) end

---比较方块ID
---@param pos table 位置
---@param flag any 开关
---@param blockid any 方块ID
---@param worldId any 星球ID
---@return boolean result 检查结果
function Trigger.Block:CompareBlockID(pos, flag, blockid, worldId) end

---创建方块
---@param pos Mini.Vec3 位置
---@param blockid any 方块ID
---@param face? number 朝向
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.Block:CreateBlock(pos, blockid, face, worldId) end

---创建spc方块
---@param pos? Mini.Vec3 位置
---@param blockid any 方块ID
---@param face? number 朝向
---@param color any 颜色
---@param switch any 开关
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.Block:CreateSpcBlock(pos, blockid, face, color, switch, worldId) end

---销毁方块
---@param pos? Mini.Vec3 位置
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.Block:DestroyBlock(pos, worldId) end

---销毁方块掉落
---@param pos? Mini.Vec3 位置
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.Block:DestroyBlockDrop(pos, worldId) end

---获取方块ID
---@param pos Mini.Vec3 位置
---@param worldId any 星球ID
---@return boolean value 是否成功
function Trigger.Block:GetBlockID(pos, worldId) end

---获取方块开关status
---@param pos Mini.Vec3 位置
---@param flag any 开关
---@param worldId any 星球ID
---@return boolean value 是否成功
function Trigger.Block:GetBlockSwitchStatus(pos, flag, worldId) end

---获取外观
---@param blockid any 方块ID
function Trigger.Block:GetFacade(blockid) end

---替换blue打印
---@param pos Mini.Vec3 位置
---@param blueprint any 参数 blueprint
---@param angle any 角度
---@param mirror any 参数 mirror
---@param placeMode any 参数 placeMode
---@param worldId? any 星球ID
---@return boolean result 是否成功
function Trigger.Block:ReplaceBluePrint(pos, blueprint, angle, mirror, placeMode, worldId) end

---设置方块颜色
---@param pos Mini.Vec3 位置
---@param color any 颜色
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.Block:SetBlockColor(pos, color, worldId) end

---设置方块方向
---@param pos Mini.Vec3 位置
---@param dir any 方向
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.Block:SetBlockDir(pos, dir, worldId) end

---设置方块swich状态
---@param pos Mini.Vec3 位置
---@param switch any 开关
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.Block:SetBlockSwichState(pos, switch, worldId) end
