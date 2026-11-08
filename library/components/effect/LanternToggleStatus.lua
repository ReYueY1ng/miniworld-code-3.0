---@meta

---提灯开关（内置组件 LanternToggleStatus · 效果组件）<br>
---手持提灯时持续发光，切走后关闭。
---@class LanternToggleStatus: Component
---@field lightBuff number | string 光照状态
---@field handEffect number | string 手持发光特效
---@field effectOffsetY number 特效高度偏移
---@field effectScale number 特效缩放
---@field consumeInterval number 扣除间隔(秒)
---@field consumeValue number 每次扣除耐久
LanternToggleStatus = {}
