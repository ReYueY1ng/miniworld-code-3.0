---@meta

---拳套效果（内置组件 GauntletStatus · 效果组件）<br>
---定义拳套击出效果，可配置动画、音效、击飞、破块和最大距离。
---@class GauntletStatus: Component
---@field launchSpeed number 击出速度
---@field launchAnimation Mini.ModelAction 击出动画
---@field launchSound number | string 击出音效
---@field returnSpeed number 收回速度
---@field returnAnimation Mini.ModelAction 收回动画
---@field returnSound number | string 收回音效
---@field hitEffect number | string 击中特效
---@field hitSound number | string 击中音效
---@field blowUpPower number 击飞力度
---@field breakBlock boolean 是否击碎方块
---@field maxDistance number 最大距离
---@field durabilityCost number 每次耐久消耗
GauntletStatus = {}
