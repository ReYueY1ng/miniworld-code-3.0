---@meta

---方块食用组件（内置组件 BlockEatComp · 方块组件）<br>
---为方块添加可食用能力，可配置食用条件和食用效果。
---@class BlockEatComp: Component
BlockEatComp = {}

---添加village区域食物方块
---@vararg any
function BlockEatComp:addVillageAreaFoodBlock(...) end

---按食物显示comp触摸
---@vararg any
function BlockEatComp:TouchByFoodDisplayComp(...) end

---方块点击结束时触发
---@vararg any
function BlockEatComp:OnBlockClickEnd(...) end

---方块点击取消时触发
---@vararg any
function BlockEatComp:OnBlockClickCancel(...) end

---方块点击开始时触发
---@vararg any
function BlockEatComp:OnBlockClickBegin(...) end

---按显示comp方块刻时触发
---@vararg any
function BlockEatComp:OnBlockTickByDisplayComp(...) end

---移除eat触发事件
---@vararg any
function BlockEatComp:RemoveEatTriggerEvent(...) end

---移除village区域食物方块
---@vararg any
function BlockEatComp:removeVillageAreaFoodBlock(...) end
