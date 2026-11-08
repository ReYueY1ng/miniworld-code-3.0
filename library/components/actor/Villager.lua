---@meta

---村民（内置组件 Villager · 角色组件）<br>
---为村民添加职业和扩展道具能力，可配置职业列表和携带道具。
---@class Villager: Component
---@field professions table[] 添加职业
---@field originalMaxHp number 原始最大血量
---@field originalAttack number 原始攻击力
---@field originalDefPhysical number 原始物理防御
---@field originalAnchorMeshGroup table[] 原始模型锚点组
---@field originalAITrees string 原始AI树
---@field hasSavedOriginalAttributes boolean 是否已保存原始属性
---@field changeProfessionAnimId Mini.ModelAction 转职成功动画ID
---@field acceptAnimId number 接受道具动画ID
---@field clearProfessionAnimId number 清除职业动画ID
---@field rejectAnimId number 拒绝动画ID
---@field criticalHealth number 濒死值
---@field extendItem number | string 扩展道具
Villager = {}

---设置村民携带或展示的扩展道具。
---@param itemid number | string 扩展道具。
function Villager:SetExtraItem(itemid) end

---获取村民当前的扩展道具。
---@return number | string value 返回当前扩展道具，未设置时可能返回 nil。
function Villager:GetExtraItem() end
