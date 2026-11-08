---@meta

---运动组合组件（内置组件 MotionGroup · 通用组件）<br>
---为对象添加自定义运动组合能力，可按顺序配置多个运动单元及其启动、循环和等待规则。
---@class MotionGroup: Component
---@field motions table[] 运动列表
MotionGroup = {}

---创建运动配置
---@vararg any
function MotionGroup:CreateMotionCfg(...) end

---添加运动
---@vararg any
function MotionGroup:AddMotion(...) end

---清空运动
---@vararg any
function MotionGroup:ClearMotions(...) end

---设置运动列表
---@vararg any
function MotionGroup:SetMotionList(...) end
