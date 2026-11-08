---@meta

---城市生成组件接口（内置组件 CityGen）<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/citygen.html)
---@class CityGen: Component
CityGen = {}

---查找城镇
---以指定玩家在其当前世界中的位置为中心请求查找城镇，并走现有结果提示路径；不生成城镇，也不使用组件宿主世界代替玩家世界。
---@param uin Mini.Player 玩家数值Uin，不接受玩家对象。
---@param range Mini.Number 搜索范围，单位格，须大于0。
---@return Mini.Bool value true表示底层已受理搜索，或世界不支持查找而已发送未找到提示，不表示找到了城镇。参数无效、无玩家/世界/城镇管理器、远端世界或所需区块提供器缺失时返回false。
function CityGen:FindCity(uin, range) end
