---@meta

---标签组件接口（内置组件 Tag · 基础组件）<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/tag.html)
---@class Tag: Component
---@field tags string[] 标签组
Tag = {}

---添加标签
---给非方块对象添加一个或多个标签的引用计数，已有同名标签则累加；首次访问可能创建底层标签组件。仅处理不含非法字符的字符串，部分成功即返回true。
---@param tags string 标签字符串或数组；仅含字母、数字、下划线和点。
---@param icount? number 引用计数，默认1；小于等于0按1处理。
---@return boolean result 至少一个字符串标签被底层添加时返回true（包含已有标签计数增加）；方块对象、无组件、标签无法转换或没有可添加项时返回false。
function Tag:AddTag(tags, icount) end

---删除标签
---从非方块对象删除一个或多个标签的引用计数；计数减至0时移除标签。首次访问可能创建底层标签组件，任一标签存在并被处理即返回true。
---@param tags string 要删除的标签字符串或数组。
---@param icount? number 删除的引用计数，默认0；小于等于0完整删除。
---@return boolean result 至少一个指定标签存在且被底层处理时为true，不代表所有标签都存在或均已完全移除；方块、无组件、输入无法转换或全未命中时为false。
function Tag:DeleteTag(tags, icount) end

---清空标签
---清空非方块对象的所有标签及引用计数；首次访问可能创建底层标签组件。当前成功分支调用void接口，不返回成功布尔值。
---@return boolean result 底层标签组件存在并调用Clear后返回nil；方块对象或组件不可用时返回false。现有Mini.Bool声明保留，实际成功分支不是true。
function Tag:ClearTag() end

---查找标签
---查询对象标签是否按全部或任意条件命中；非方块首次访问可能创建标签组件，运行时方块查询道具配置标签，编辑中的方块预制对象不支持。
---@param tags string 要查找的标签字符串或数组。
---@param mathcmode number 匹配方式：1（All）全部，2（Any）任意，必填。
---@param bexactmatch boolean true精确匹配，false前缀匹配，必填。
---@return boolean result 符合所选全部/任意及精确/前缀规则时为true；未命中、标签为空或无法转换、匹配方式非number、精确标志非boolean、方块预制编辑对象或无组件时为false。
function Tag:HasTag(tags, mathcmode, bexactmatch) end

---获取标签
---获取标签名称列表，不返回引用计数；非方块首次访问可能创建标签组件，运行时方块返回道具配置标签。
---@return table value （元素类型：Mini.Tag） 非方块有标签时返回字符串数组table，顺序未保证；无标签或无组件时返回nil。方块预制编辑对象返回nil，其他方块转发Service.Item:GetTags的数组或nil。
function Tag:GetTag() end

---获取编辑标签
---@vararg any
function Tag:GetEditTags(...) end

---同步编辑转换为ccomp
---@vararg any
function Tag:SyncEditToCComp(...) end

---获取标签compc
---@vararg any
function Tag:GetTagCompC(...) end

---设置编辑标签
---@vararg any
function Tag:SetEditTags(...) end
