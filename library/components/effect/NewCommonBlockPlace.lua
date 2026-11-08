---@meta

---新通用方块放置组件（内置组件 NewCommonBlockPlace · 效果组件）<br>
---定义通用方块放置效果，可配置多个可放置目标方块，不影响旧通用方块放置组件。
---@class NewCommonBlockPlace: Component
---@field placeType number 放置类型
---@field canPlaceOnBlock (number | string)[] 可放置此方块上
---@field placeBlock number | string 放置方块
---@field placeCost number 放置消耗
NewCommonBlockPlace = {}
