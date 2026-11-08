---@meta

---区域组件接口（内置组件 Area）<br>[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/area.html)
---@class Area: Component
Area = {}

---设置区域盒子尺寸
---设置对象区域的未缩放盒子三轴大小；写入底层后由区域OnTick按世界缩放、位置更新到AreaManager。 已初始化的底层组件同时更新组件数据并标记脏；不在本调用内确认区域更新完成。 缺少区域组件或向量分量时不处理，无返回值。
---@param size Mini.Vec3 盒子尺寸{x,y,z}（格），不含对象缩放。
function Area:SetBoxSize(size) end
