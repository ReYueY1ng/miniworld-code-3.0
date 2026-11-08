---@meta

---生物格子组件（内置组件 GridContainer · 网格组件）<br>
---为生物添加格子容器能力，可配置物品格子和存取规则。
---@class GridContainer: Component
---@field GriSize number 格子数量
GridContainer = {}

---merge背包
---@vararg any
function GridContainer:MergePack(...) end

---排序格子
---@vararg any
function GridContainer:SortGrid(...) end

---随机掉落one装备道具
---@vararg any
function GridContainer:RandomDropOneEquipItem(...) end

---掉落道具
---@vararg any
function GridContainer:DropItems(...) end

---获取道具统计
---@vararg any
function GridContainer:GetItemCount(...) end

---获取格子统计
---@vararg any
function GridContainer:GetGridCount(...) end

---设置格子数量
---@vararg any
function GridContainer:SetGridsNum(...) end

---掉落
---@vararg any
function GridContainer:Drop(...) end

---随机掉落one
---@vararg any
function GridContainer:RandomDropOne(...) end

---按统计添加道具
---@vararg any
function GridContainer:AddItemByCount(...) end

---添加道具
---@vararg any
function GridContainer:AddItem(...) end

---设置格子信息
---@vararg any
function GridContainer:SetGridInfo(...) end

---获取格子信息
---@vararg any
function GridContainer:GetGridInfo(...) end

---交换
---@vararg any
function GridContainer:Swap(...) end

---设置格子信息
---@vararg any
function GridContainer:SetGridsInfo(...) end

---获取格子信息
---@vararg any
function GridContainer:GetGridsInfo(...) end

---按统计移除道具
---@vararg any
function GridContainer:RemoveItemByCount(...) end
