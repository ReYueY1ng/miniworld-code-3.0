---@meta

---食物展示容器组件（内置组件 FoodDisplayComp · 方块组件）<br>
---为方块添加食物展示容器能力，可配置展示内容和交互规则。
---@class FoodDisplayComp: Component
---@field containerShowType number 展示容器类型
---@field canFoodStack boolean 是否支持方块堆叠组件
---@field canFoodEat boolean 是否支持方块食用组件
---@field canOnlyPlaceFood boolean 是否仅支持放置食物
---@field position Mini.Vec3 位置
---@field rotation Mini.Vec3 旋转
---@field scale Mini.Vec3 缩放
---@field multipleFood table[] 多挂点配置
---@field specialLocations table[] 特殊位置列表
---@field gridStringArray table[] 格子字符串数组
---@field singleFoodId number
---@field lengthNum number 长度数量
---@field bHaveStackComp boolean
---@field bHaveEatComp boolean
---@field bHaveDoor boolean 是否有门
---@field openAnimId number
---@field closeAnimId number
---@field openSound number | string 打开音效
---@field closeSound number | string 关闭音效
FoodDisplayComp = {}

---获取方块显示食物ID
---@vararg any
function FoodDisplayComp:GetBlockDisplayFoodId(...) end

---获取方块拥有comp
---@vararg any
function FoodDisplayComp:GetBlockHaveComp(...) end

---方块点击时触发
---@vararg any
function FoodDisplayComp:OnBlockClick(...) end

---方块为ate时触发
---@vararg any
function FoodDisplayComp:OnBlockBeAte(...) end

---获取speciallocation
---@vararg any
function FoodDisplayComp:GetSpecialLocation(...) end

---获取变换信息
---@vararg any
function FoodDisplayComp:GetTransformInfo(...) end
