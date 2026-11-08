---@meta

---迷糊花粉瓶（内置组件 ConfusedPollenBottle · 效果组件）<br>
---投掷物命中后，在命中位置播放特效，对玩家附加晕头转向BUFF，对生物持续旋转
---@class ConfusedPollenBottle: Component
---@field effectId number | string 命中特效
---@field effectDuration number 特效播放时间(秒)
---@field radius number 影响半径
---@field buffId number | string 玩家BUFF
---@field buffDuration number
---@field confusedDuration number 生物旋转时长(秒)
---@field confusedInterval number 生物旋转间隔(秒)
---@field rotateSpeed number 生物旋转速度
ConfusedPollenBottle = {}
