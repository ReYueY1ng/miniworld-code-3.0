---@meta

---背包组件接口（内置组件 BackpackComponent）<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/backpackcomponent.html)
---@class BackpackComponent: Component
BackpackComponent = {}

---按道具配置设置外观部位
---将道具定义的AvatarPartID加11000000组装为newModel资源，以优先级11提交给对象的指定Avatar部位。 只提交外观，不修改背包格子或装备道具；管理器按优先级刷新并按底层条件广播，最终显示取决于资源加载和部位有效性。 本函数未转发管理器SetAvatarModel的失败结果。
---@param index Mini.Number Avatar部位ID，0（BODY）至10（SKIN）。
---@param itemid Mini.Item 用于提供AvatarPartID的道具配置ID。
---@return Mini.Bool result 找到Actor和ToolDef且已调用外观管理器时为true，即使管理器拒绝部位也仍为true；Actor或ToolDef不存在时为false。
function BackpackComponent:SetAvaterEquipModel(index, itemid) end
