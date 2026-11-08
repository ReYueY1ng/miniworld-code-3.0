---@meta

---播撒孢子（内置组件 SporeScatterStatus · 效果组件）<br>
---佩戴期间定时在角色周围生成配置种子掉落物。
---@class SporeScatterStatus: Component
---@field interval number 播撒间隔(秒)
---@field seedItem number | string 种子道具
---@field seedNum number 每点数量
---@field scatterCount number 落点个数
---@field scatterRadius number 播撒半径
---@field heightOffset number 高度偏移
---@field scatterEffect number | string 播撒特效
---@field activeEffect number | string 持续特效
---@field activeEffectInterval number 持续特效间隔(秒)
SporeScatterStatus = {}
