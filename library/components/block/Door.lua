---@meta

---Door（内置组件 Door · 方块组件）<br>
---为方块添加门能力，可配置开关状态、星能控制和自动变形表现。
---@class Door: Component
---@field controlMode number 控制模式
---@field autoTransform boolean 自动变换
---@field linkedOperation boolean
---@field openAnimId number
---@field closeAnimId number
---@field openSound number | string 打开音效
---@field closeSound number | string 关闭音效
Door = {}
