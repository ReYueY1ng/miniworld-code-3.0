---@meta

---仇恨值组件（内置组件 Aggro · 基础组件）<br>
---为生物添加仇恨值能力，可配置和访问目标仇恨相关数据。
---@class Aggro: Component
---@field searchRangeType number 寻敌方向
---@field searchRange number 寻敌范围
---@field searchFrequency number 扫描频率
---@field isPathBlock boolean 路径遮挡
---@field campRelation number 阵营关系
---@field cureAggroFactor number 扫描频率
---@field aggroDecrease number 仇恨值减少
---@field aggroDecreaseTick number 仇恨值减少tick
---@field searchEnable boolean 是否开启仇恨值搜索
Aggro = {}

---添加cureaggro
---@vararg any
function Aggro:AddCureAggro(...) end

---添加造成伤害aggro
---@vararg any
function Aggro:AddHurtAggro(...) end

---获取当前aggroakt对象ID
---@vararg any
function Aggro:getCurAggroAktObjid(...) end

---添加技能aggro
---@vararg any
function Aggro:AddSkillAggro(...) end
