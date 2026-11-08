---@meta

---TerrainFinder（内置组件 TerrainFinder · 角色组件）<br>
---@class TerrainFinder: Component
---@field basicConfig Mini.GroupView
---@field actionId Mini.ModelAction
---@field effectId number | string
---@field effectOffset Mini.Vec3 特效偏移
---@field effectDurationSec number
---@field effectYawOffsetDeg number 特效偏航角偏移角度
---@field radiusChunk number
TerrainFinder = {}

---GetText(9417007, "触发地形寻找")
---@param arg1 number 参数 arg1
---@param num number 数量
---@param arg3 number 参数 arg3
---@param effectid number | string 特效ID
---@param arg5 number 参数 arg5
---@param num2 number 参数 num2
---@return boolean result 是否成功
function TerrainFinder:TriggerFindTerrain(arg1, num, arg3, effectid, arg5, num2) end

---GetText(9417008, "停止地形寻找特效")
function TerrainFinder:StopFindTerrainEffect() end

---GetText(9417009, "是否正在寻找地形")
---@return boolean result 是否满足条件
function TerrainFinder:IsFindingTerrain() end
