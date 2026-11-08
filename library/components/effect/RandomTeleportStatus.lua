---@meta

---随机传送（内置组件 RandomTeleportStatus · 效果组件）<br>
---在玩家周围随机寻找可站立位置，将玩家传送过去。
---@class RandomTeleportStatus: Component
---@field minRadius number 最小搜索半径
---@field maxRadius number 最大搜索半径
---@field maxAttempts number 最大尝试次数
---@field searchHeight number Y方向向下搜索范围（从玩家高度往下搜）
---@field screenEffectSpeed number 闭眼前屏幕闪烁速度
---@field gainR number 闭眼红色增益
---@field gainG number 闭眼绿色增益
---@field gainB number 闭眼蓝色增益
---@field contrast number 闭眼对比度
---@field saturation number 闭眼饱和度
---@field bloomIntensity number 闭眼泛光强度
---@field exposureIntensity number 闭眼曝光强度
---@field vignetteIntensity number 闭眼暗角强度
---@field openDuration number 睁眼淡出时长（秒，0=瞬间恢复）
RandomTeleportStatus = {}
