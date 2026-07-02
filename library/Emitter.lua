---@meta

---粒子发射器模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/emitter.html)
---@class Emitter
Emitter = {}

---通过位置发射
---@param posbegin PositionTable 起始位置
---@param emitid string 发射器ID
---@param shooter number? 发射者对象ID
function Emitter:EmitByPosition(posbegin, emitid, shooter) end

---通过位置和目标位置发射
---@param posbegin PositionTable 起始位置
---@param emitid string 发射器ID
---@param targetPos PositionTable 目标位置
---@param shooter number? 发射者对象ID
function Emitter:EmitByPositionTargetPos(posbegin, emitid, targetPos, shooter) end

---通过位置和目标对象发射
---@param posbegin PositionTable 起始位置
---@param emitid string 发射器ID
---@param objid number 目标对象ID
---@param shooter number? 发射者对象ID
function Emitter:EmitByPositionTarget(posbegin, emitid, objid, shooter) end

---通过发射者发射
---@param objid number 发射者对象ID
---@param emitid string 发射器ID
function Emitter:EmitByShooter(objid, emitid) end

---通过发射者和目标对象发射
---@param objidA number 发射者对象ID
---@param emitid string 发射器ID
---@param objidB number 目标对象ID
function Emitter:EmitByShooterTarget(objidA, emitid, objidB) end

---通过发射者和目标位置发射
---@param objid number 发射者对象ID
---@param emitid string 发射器ID
---@param targetPos PositionTable 目标位置
function Emitter:EmitByShooterTargetPos(objid, emitid, targetPos) end
