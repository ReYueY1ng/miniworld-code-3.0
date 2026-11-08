---@meta

---MobOutfitGen（内置组件 MobOutfitGen · 基础组件）<br>
---为生物添加随机外观生成能力，可配置外观生成规则。
---@class MobOutfitGen: Component
---@field modelGroup table[] 随机参数
---@field scaleData number 缩放数据
MobOutfitGen = {}

---设置缩放数据
---@vararg any
function MobOutfitGen:SetScaleData(...) end

---获取缩放数据
---@vararg any
function MobOutfitGen:GetScaleData(...) end

---获取缩放
---@vararg any
function MobOutfitGen:GetScale(...) end

---按表设置outfit
---@vararg any
function MobOutfitGen:SetOutfitByTable(...) end
