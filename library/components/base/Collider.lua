---@meta

---Collider（内置组件 Collider · 基础组件）<br>
---为对象添加碰撞能力，可配置碰撞体和碰撞检测相关行为。
---@class Collider: Component
---@field physicsType number
---@field physicShapeEnter Mini.GroupView
---@field nonePhysicShapeEnter Mini.GroupView
---@field physicColliderShape number
---@field noPhysicColliderShape number
---@field radius number
---@field width number
---@field height number 高度
---@field isUseGravity boolean 判断是否使用重力
---@field isCanCollide boolean 判断是否判断能否碰撞
Collider = {}
