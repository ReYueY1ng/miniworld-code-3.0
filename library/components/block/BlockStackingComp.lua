---@meta

---方块堆叠组件（内置组件 BlockStackingComp · 方块组件）<br>
---为方块添加堆叠能力，可配置堆叠层数和交互规则。
---@class BlockStackingComp: Component
---@field stackNumber number 堆叠数字
BlockStackingComp = {}

---为stacked
---@vararg any
function BlockStackingComp:BeStacked(...) end

---为ate
---@vararg any
function BlockStackingComp:BeAte(...) end

---获取堆叠数量
---@vararg any
function BlockStackingComp:GetStackNum(...) end

---设置方块数据
---@vararg any
function BlockStackingComp:SetBlockData(...) end

---获取方块数据
---@vararg any
function BlockStackingComp:GetBlockData(...) end

---创建字符串键
---@vararg any
function BlockStackingComp:CreateStringKey(...) end

---方块离开世界时触发
---@vararg any
function BlockStackingComp:OnBlockLeaveWorld(...) end

---方块进入世界时触发
---@vararg any
function BlockStackingComp:OnBlockEnterWorld(...) end

---方块点击时触发
---@vararg any
function BlockStackingComp:OnBlockClick(...) end

---移除全部数据
---@vararg any
function BlockStackingComp:RemoveAllData(...) end

---设置place配置
---@vararg any
function BlockStackingComp:SetPlaceCfg(...) end

---判断是否place道具
---@vararg any
function BlockStackingComp:IsPlaceItem(...) end

---为takeout
---@vararg any
function BlockStackingComp:BeTakeOut(...) end
