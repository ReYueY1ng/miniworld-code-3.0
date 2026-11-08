---@meta

---凝胶禁锢（内置组件 GelImmobilizeStatus · 效果组件）<br>
---投掷物命中方块后生成临时凝胶范围，持续刷新范围内目标的禁锢状态。
---@class GelImmobilizeStatus: Component
---@field gelDuration number 凝胶持续时间(秒)
---@field scanInterval number 检测间隔(秒)
---@field scanRadius number 影响半径(格)
---@field surfaceThickness number 贴面厚度(格)
---@field targetStatus number | string 禁锢状态
---@field targetStatusDuration number 状态刷新时长(秒)
---@field attachEffect number | string 贴附特效
---@field hitEffect number | string 命中特效
---@field excludeCaster boolean 排除释放者
GelImmobilizeStatus = {}
