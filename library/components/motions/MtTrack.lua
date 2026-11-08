---@meta

---跟踪运动（内置组件 MtTrack · 运动组件）<br>
---@class MtTrack: Component
---@field beginPos Mini.Vec3 开始位置
---@field direction Mini.Vec3 方向
---@field speed number 速度
---@field targetObjId number
---@field targetPosition Mini.Vec3 目标位置
---@field turnSpeed number 转换速度
---@field maxAngularSpeed number
---@field followDelay number 跟随延迟
---@field beginFollowStrength number 开始跟随强度
---@field midFollowStrength number 中间跟随强度
---@field finalSpeedUp number
---@field lateralDistance number
---@field longitudinalDistance number
---@field targetLostAction number
MtTrack = {}
