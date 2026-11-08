---@meta

---方块堆叠效果组件（内置组件 BlockStackingStatusComp · 效果组件）<br>
---定义方块堆叠效果，可在堆叠变化时触发效果。
---@class BlockStackingStatusComp: Component
---@field stackType number 模型展示类型
---@field modelCopyTypeNum table[] 堆叠（放置）层数
---@field modelChooseTypeNum table[] 堆叠（放置）层数
---@field canTakeOut boolean 是否支持取出
---@field takeOutNum number 每次取出层数
---@field placeItem number | string 使用道具
BlockStackingStatusComp = {}
