---@meta

---生物装备组件（内置组件 EquipGridContainer · 网格组件）<br>
---为生物添加装备格子能力，可配置装备槽位和装备容器。
---@class EquipGridContainer: Component
EquipGridContainer = {}

---随机掉落one装备道具
---@vararg any
function EquipGridContainer:RandomDropOneEquipItem(...) end

---获取装备格子信息
---@vararg any
function EquipGridContainer:GetEquipGridInfo(...) end

---获取格子统计
---@vararg any
function EquipGridContainer:GetGridCount(...) end

---获取格子信息
---@vararg any
function EquipGridContainer:GetGridInfo(...) end

---设置格子信息
---@vararg any
function EquipGridContainer:SetGridInfo(...) end

---获取枪械造成伤害
---@vararg any
function EquipGridContainer:GetGunDamage(...) end

---设置武器可见
---@vararg any
function EquipGridContainer:SetWeaponVisible(...) end

---获取道具统计
---@vararg any
function EquipGridContainer:GetItemCount(...) end

---交换
---@vararg any
function EquipGridContainer:Swap(...) end

---掉落全部装备
---@vararg any
function EquipGridContainer:DropAllEquip(...) end

---设置装备格子信息
---@vararg any
function EquipGridContainer:SetEquipGridInfo(...) end

---掉落one装备道具
---@vararg any
function EquipGridContainer:DropOneEquipItem(...) end

---装备
---@vararg any
function EquipGridContainer:Equip(...) end
