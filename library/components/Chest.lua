---@meta

---Chest组件接口（内置组件 Chest）<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/chest.html)
---@class Chest: Component
Chest = {}

---打开储物箱
---按玩家和方块坐标请求打开储物箱；位置各轴向下取整，不读取 pos.worldId/mapId，返回值不确认客户端界面最终显示。 返回说明：开箱请求成功返回 true；位置缺失、玩家 ID 无效或下游开箱失败为 false；编辑模式为 nil。现有元数据未声明返回槽。
---@param pos any 方块坐标（触发器自动传入，脚本调用时需提供）。（wiki 未声明类型，此处用 any）
---@param playerId Mini.Player 玩家ID，可传数值字符串。
function Chest:OpenBox(pos, playerId) end

---关闭储物箱
---关闭指定玩家当前打开的容器并通知界面，pos 只是触发器注入占位，不要求玩家打开的是该位置箱子。 返回说明：找到玩家且调用 closeContainerAndNotifyUI 后为 true；玩家 ID 无效、玩家或方法不存在为 false；编辑模式为 nil，不等待客户端关闭完成。
---@param pos any 方块坐标（触发器自动传入，脚本调用时需提供）。（wiki 未声明类型，此处用 any）
---@param playerId Mini.Player 玩家ID，可传数值字符串。
function Chest:CloseBox(pos, playerId) end

---清空储物箱
---清空目标位置储物箱；坐标向下取整，世界按 pos.worldId、pos.mapId、组件对象世界、当前主机世界依次回退。 返回说明：找到容器并执行 clear 后为 true；位置无效、世界或容器不存在等失败为 false；编辑模式为 nil。
---@param pos any 方块坐标（触发器自动传入，脚本调用时需提供）。（wiki 未声明类型，此处用 any）
function Chest:ClearBox(pos) end

---生成物品
---向目标位置储物箱凭空加入道具，不扣除任何玩家背包；请求数量须大于 0，实际加入量受容器容量等条件限制。
---@param pos any 方块坐标（触发器自动传入，脚本调用时需提供）。（wiki 未声明类型，此处用 any）
---@param itemType Mini.Item 道具配置ID或自定义资源AssetId。
---@param count Mini.Number 生成数量，大于0。
---@return Mini.Number result 正常下游调用返回实际加入数量（可能为 0）；位置/数量检查失败或道具禁止脚本使用为 false；资源转换失败、世界/容器不存在或编辑模式等情况为 nil。
function Chest:SpawnItem(pos, itemType, count) end

---移除物品
---从目标位置储物箱按道具类型移除请求数量；本函数实际透传下游执行标志，不返回实际移除数量。
---@param pos any 方块坐标（触发器自动传入，脚本调用时需提供）。（wiki 未声明类型，此处用 any）
---@param itemType Mini.Item 道具配置ID或自定义资源AssetId。
---@param count Mini.Number 移除数量，大于0。
---@return Mini.Number result 实际 Lua 返回 boolean：找到容器并调用移除为 true，位置/数量/资源/世界/容器无效等为 false；编辑模式为 nil。原 Mini.Number 返回槽保留，true 不表示移除了请求数量。
function Chest:RemoveItem(pos, itemType, count) end

---放入物品
---先向目标储物箱加入玩家持有的道具，再请求从玩家背包扣除实际入箱数量；未检查扣除结果，不保证完整转移成功。
---@param pos any 方块坐标（触发器自动传入，脚本调用时需提供）。（wiki 未声明类型，此处用 any）
---@param playerId Mini.Player 玩家ID，可传数值字符串。
---@param itemType Mini.Item 道具配置ID或自定义资源AssetId。
---@param count Mini.Number 放入数量，大于0，受持有量和箱子容量限制。
---@return Mini.Number result 返回实际入箱数量（正数）；位置/参数/资源检查失败、无持有量或未实际入箱时为 false；编辑模式为 nil。数量不代表玩家背包实际扣除已核验。
function Chest:PutItem(pos, playerId, itemType, count) end

---取出物品
---按请求量、背包剩余容量和箱内存量的最小值尝试给玩家道具，再请求从箱内扣除实际给出量；未检查箱内扣除结果。
---@param pos any 方块坐标（触发器自动传入，脚本调用时需提供）。（wiki 未声明类型，此处用 any）
---@param playerId Mini.Player 玩家ID，可传数值字符串。
---@param itemType Mini.Item 道具配置ID或自定义资源AssetId。
---@param count Mini.Number 取出数量，大于0，受存量和背包空间限制。
---@return Mini.Number result 返回实际加入玩家背包的数量（正数）；位置/参数/资源检查失败、无空间/存量或未实际加入时为 false；编辑模式为 nil。数量不代表箱内实际扣除已核验。
function Chest:TakeItem(pos, playerId, itemType, count) end

---获取格子数量
---读取类型级 maxgridcount 属性，不按 pos 查询实际容器；pos 是触发器注入占位且被忽略。
---@param pos any 方块坐标（触发器自动传入，脚本调用时需提供）。（wiki 未声明类型，此处用 any）
---@return Mini.Number value 原样返回 maxgridcount；预设枚举为 5、10、30、60。没有额外的容器存在性检查。
function Chest:GetGridCount(pos) end

---已使用格子数量
---按目标位置查询被道具占用的格子数量；最多扫描索引 0～199，遇到首个无效格子或查询失败即停止。
---@param pos any 方块坐标（触发器自动传入，脚本调用时需提供）。（wiki 未声明类型，此处用 any）
---@return Mini.Number value 返回扫描范围内道具 ID 非 0 且数量大于 0 的格子数；位置无效或首格查询失败为 0，不区分空箱与查询失败。
function Chest:GetUsedGridCount(pos) end

---剩余空格数量
---按扫描得到的总格数减去已占用格数计算空格，最小为 0；最多扫描索引 0～199，首个无效格子或查询失败时停止。
---@param pos any 方块坐标（触发器自动传入，脚本调用时需提供）。（wiki 未声明类型，此处用 any）
---@return Mini.Number value 返回扫描范围内剩余空格数；位置无效或首格查询失败为 0，不区分满箱与查询失败。
function Chest:GetFreeGridCount(pos) end
