---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Item<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---按道具实例ID为道具添加模型部件
---先用 GetGridIndexByInstId 定位格子，再转发 AddModelPartByGrid
---偏移量以格为单位，内部乘 100 转换为引擎单位
---修改约 0.5 秒后才会同步到客机，界面模型需等同步后再刷新
---@param playerid integer 玩家ID
---@param instId integer 道具实例ID
---@param partName string 子部件名称
---@param boneName string 挂点骨骼名称
---@param modelStr string 模型资源名
---@param offset Mini.Vec3 位置偏移，默认 {x=0,y=0,z=0}
---@param rot Mini.Vec3 旋转角度，默认全 0
---@param scale number 缩放比例，默认全 1
---@return string? partName 子部件名称，失败时为 nil
function Item:AddModelPart(playerid, instId, partName, boneName, modelStr, offset, rot, scale) end

---按背包格子索引为道具添加模型部件
---仅对带模型组件的道具实例有效
---partName、boneName、modelStr 必须为字符串，offset/rot/scale 必须为 table 或省略
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param partName string 子部件名称
---@param boneName string 挂点骨骼名称
---@param modelStr string 模型资源名
---@param offset Mini.Vec3 位置偏移，默认 {x=0,y=0,z=0}
---@param rot Mini.Vec3 旋转角度，默认全 0
---@param scale Mini.Vec3 缩放比例，默认全 1
---@return string? partName 子部件名称，失败时为 nil
function Item:AddModelPartByGrid(playerid, gridIndex, partName, boneName, modelStr, offset, rot, scale) end

---在玩家背包中创建一把实例化枪械
---仅对允许脚本使用的枪械道具有效
---目标格子不可用或背包已满时创建失败
---@param playerid number 玩家ID
---@param itemid number | string 道具ID（数字配置ID或资源ID字符串）
---@param gridIndex number 目标格子索引，省略或传 -1 时自动选择
---@return string? instId 道具实例ID，失败时为 nil
function Item:CreateGunInBackpack(playerid, itemid, gridIndex) end

---按道具实例ID删除模型部件
---先用 GetGridIndexByInstId 定位格子，再转发 DeleteModelPartByGrid
---@param playerid integer 玩家ID
---@param instId integer 道具实例ID
---@param partName string 子部件名称
---@return boolean result 是否删除成功
function Item:DeleteModelPart(playerid, instId, partName) end

---按背包格子索引删除道具模型部件
---仅对带模型组件的道具实例有效
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param partName string 子部件名称
---@return boolean result 是否删除成功
function Item:DeleteModelPartByGrid(playerid, gridIndex, partName) end

---按道具实例ID读取自定义数组数据
---返回的是引擎 JSON 数组转换出的 table 副本
---@param playerid integer 玩家ID
---@param instId integer 道具实例ID
---@param key any 数据键名
---@return table? value 数组数据，实例无效或键不存在时为 nil
function Item:GetArrayData(playerid, instId, key) end

---按背包格子索引读取道具的自定义数组数据
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 数据键名
---@return table? value 数组数据，读取失败时为 nil
function Item:GetArrayDataByGrid(playerid, gridIndex, key) end

---按道具实例ID读取自定义布尔数据
---@param playerid integer 玩家ID
---@param instId integer 道具实例ID
---@param key any 数据键名
---@return boolean? value 布尔值，读取失败时为 nil
function Item:GetBoolData(playerid, instId, key) end

---按背包格子索引读取道具的自定义布尔数据
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 数据键名
---@return boolean? value 布尔值，读取失败时为 nil
function Item:GetBoolDataByGrid(playerid, gridIndex, key) end

---获取配方定义并转换为 Lua 表
---返回字段：id 配方ID、rid 产物道具ID、rc 产物数量、craftingItemId 制作道具ID、aMaterials 材料数组、type 配方类型
---aMaterials 元素为 {id = 材料道具ID, c = 数量}
---@param idCraft? string 配方ID（数字配置ID或资源ID字符串）
---@return table? craft 配方表，失败时为 nil
function Item:GetCraftDef(idCraft) end

---按序号获取配方定义
---内部按 iCraft-1 访问配置数组
---@param iCraft? number 配方序号，从 1 开始
---@return table? craft 配方表，序号非法或配方无效时为 nil
function Item:GetCraftDefByIndex(iCraft) end

---获取配方配置的总数量
---@return number count 配方数量，配置管理器不可用时为 0
function Item:GetCraftDefCount() end

---获取掉落物对象携带的道具数量
---@param objid integer 掉落物对象ID
---@return number? num 道具数量，对象无效时为 nil
function Item:GetDropItemNum(objid) end

---获取装备的基础属性描述文本
---只输出数值非零的属性，包括生命、伤害、防御、移动速度
---@param itemid? string 道具ID（数字配置ID或资源ID字符串）
---@return table? descs 属性描述数组，非装备或未配置时为 nil
function Item:GetEquipBaseDesc(itemid) end

---获取食物增加饱食度的数值
---@param itemid? string 道具ID（数字配置ID或资源ID字符串）
---@return number value 增加的饱食度，道具不存在或非食物时为 0
function Item:GetFoodAddFoodVal(itemid) end

---按道具实例ID查询其所在的背包格子索引
---只在该玩家的背包范围内查找
---@param playerid number 玩家ID
---@param instId string 道具实例ID
---@return number? gridIndex 背包格子索引，未找到时为 nil
function Item:GetGridIndexByInstId(playerid, instId) end

---按实例ID获取枪械实例属性
---按 GunAttr 配置的类型分别读取 number/enum/string/boolean
---先用 GetGridIndexByInstId 定位格子
---@param playerid integer 玩家ID
---@param instId integer 道具实例ID
---@param key any 属性键（GunAttr）
---@return any value 属性值，键非法或读取失败时为 nil
function Item:GetGunAttr(playerid, instId, key) end

---按背包格子索引获取枪械实例属性
---按 GunAttr 配置的类型分别读取 number/enum/string/boolean
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 属性键（GunAttr）
---@return any value 属性值，键非法或读取失败时为 nil
function Item:GetGunAttrByGrid(playerid, gridIndex, key) end

---获取玩家背包中所有枪械所在的格子索引
---@param playerid number 玩家ID
---@return table? gridIndexes 格子索引数组，背包内没有枪械时为 nil
function Item:GetGunGridIndexInBackpack(playerid) end

---获取玩家背包中所有枪械的道具实例ID
---@param playerid number 玩家ID
---@return table? instIds 道具实例ID数组，背包内没有枪械时为 nil
function Item:GetGunInstIdInBackpack(playerid) end

---获取枪械预制体上的属性值
---仅自定义枪械有效
---读取的是道具模板（预制）配置值，不是实例被修改后的值
---@param playerid integer 玩家ID
---@param instId integer 道具实例ID
---@param key any 属性键（GunAttr）
---@return any value 预制属性值，键非法或读取失败时为 nil
function Item:GetGunPrefabAttr(playerid, instId, key) end

---按背包格子索引获取枪械预制体属性
---仅自定义枪械有效
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 属性键（GunAttr）
---@return any value 预制属性值，键非法或读取失败时为 nil
function Item:GetGunPrefabAttrByGrid(playerid, gridIndex, key) end

---获取背包格子中道具的实例ID
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@return string? instId 道具实例ID，格子无实例时为 nil
function Item:GetInstIdByGridIndex(playerid, gridIndex) end

---获取掉落物对象对应的道具ID
---自定义资源掉落物会直接返回资源ID字符串
---@param objid integer 掉落物对象ID
---@return number|string? itemid 道具ID，对象无效时为 nil
function Item:GetItemId(objid) end

---按背包格子索引获取道具ID
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@return number? itemid 道具ID，格子为空或读取失败时为 nil
function Item:GetItemIdByGrid(playerid, gridIndex) end

---按道具实例ID获取道具ID
---@param playerid integer 玩家ID
---@param instId integer 道具实例ID
---@return number? itemid 道具ID，实例无效时为 nil
function Item:GetItemIdByInstId(playerid, instId) end

---获取道具的最大堆叠数量
---@param itemid? string 道具ID（数字配置ID或资源ID字符串）
---@return number? stackMax 最大堆叠数，道具不存在时为 nil
function Item:GetItemStackMax(itemid) end

---获取道具的类型枚举值
---@param itemid? string 道具ID（数字配置ID或资源ID字符串）
---@return number? itemType 道具类型，道具不存在时为 nil
function Item:GetItemType(itemid) end

---按道具实例ID读取自定义 number 数据
---@param playerid integer 玩家ID
---@param instId integer 道具实例ID
---@param key any 数据键名
---@return number? value 数值，读取失败时为 nil
function Item:GetNumberData(playerid, instId, key) end

---按背包格子索引读取道具的自定义 number 数据
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 数据键名
---@return number? value 数值，读取失败时为 nil
function Item:GetNumberDataByGrid(playerid, gridIndex, key) end

---获取道具预制的模型部件列表
---元素字段：boneName、modelStr、offset、rot、scale
---每个元素均为新建的 table 副本
---@param playerid integer 玩家ID
---@param instId integer 道具实例ID
---@return table? parts 部件数组，没有部件时为 nil
function Item:GetPrefabModelPart(playerid, instId) end

---按背包格子索引获取道具预制的模型部件列表
---元素字段：boneName、modelStr、offset、rot、scale
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@return table? parts 部件数组，没有部件时为 nil
function Item:GetPrefabModelPartByGrid(playerid, gridIndex) end

---按背包格子索引获取道具实例的预制资源ID
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@return string? resId 预制资源ID，读取失败时为 nil
function Item:GetResIdByGrid(playerid, gridIndex) end

---按道具实例ID获取预制资源ID
---@param playerid integer 玩家ID
---@param instId integer 道具实例ID
---@return string? resId 预制资源ID，实例无效时为 nil
function Item:GetResIdByInstId(playerid, instId) end

---按道具实例ID读取自定义字符串数据
---@param playerid integer 玩家ID
---@param instId integer 道具实例ID
---@param key any 数据键名
---@return string? value 字符串值，读取失败时为 nil
function Item:GetStringData(playerid, instId, key) end

---按背包格子索引读取道具的自定义字符串数据
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 数据键名
---@return string? value 字符串值，读取失败时为 nil
function Item:GetStringDataByGrid(playerid, gridIndex, key) end

---获取工具或武器的基础属性描述文本
---包含攻击、各类防御、移速、游泳速度、温度抗性等非零属性
---Type 为 14 的投掷类武器读取投掷物配置的攻击属性
---@param itemid? string 道具ID（数字配置ID或资源ID字符串）
---@return table? descs 属性描述数组，非工具或未配置时为 nil
function Item:GetToolBaseDesc(itemid) end

---获取工具类型枚举值
---@param itemid? string 道具ID（数字配置ID或资源ID字符串）
---@return number type 工具类型，道具不存在或非工具时为 0
function Item:GetToolType(itemid) end

---按实例ID修改枪械实例属性
---value 的类型必须与 GunAttr 配置一致，枚举值会做合法性校验
---先用 GetGridIndexByInstId 定位格子
---@param playerid integer 玩家ID
---@param instId integer 道具实例ID
---@param key any 属性键（GunAttr）
---@param value any 新属性值
---@return boolean result 是否修改成功
function Item:ModifyGunAttr(playerid, instId, key, value) end

---按背包格子索引修改枪械实例属性
---value 的类型必须与 GunAttr 配置一致
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 属性键（GunAttr）
---@param value any 新属性值
---@return boolean result 是否修改成功
function Item:ModifyGunAttrByGrid(playerid, gridIndex, key, value) end

---按道具实例ID修改模型部件
---只修改传入的参数，未传的字段保持原值
---部件不存在或道具没有模型部件时返回 false
---@param playerid integer 玩家ID
---@param instId integer 道具实例ID
---@param partName string 子部件名称
---@param boneName string 挂点骨骼名称
---@param modelStr string 模型资源名
---@param offset Mini.Vec3 位置偏移
---@param rot Mini.Vec3 旋转角度
---@param scale number 缩放比例
---@return boolean result 是否修改成功
function Item:ModifyModelPart(playerid, instId, partName, boneName, modelStr, offset, rot, scale) end

---按背包格子索引修改模型部件
---只修改传入的参数，未传的字段保持原值
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param partName string 子部件名称
---@param boneName string 挂点骨骼名称
---@param modelStr string 模型资源名
---@param offset Mini.Vec3 位置偏移
---@param rot Mini.Vec3 旋转角度
---@param scale Mini.Vec3 缩放比例
---@return boolean result 是否修改成功
function Item:ModifyModelPartByGrid(playerid, gridIndex, partName, boneName, modelStr, offset, rot, scale) end

---让道具对象播放指定动作
---道具需要配置对应动作
---@param objid integer 道具对象ID
---@param animid number | string 动作ID
---@param playmode any 播放模式（AnimMode）
---@return boolean result 是否播放成功
function Item:PlayAct(objid, animid, playmode) end

---按道具实例ID写入自定义数组数据
---value 必须是 table，内部序列化为 JSON 数组
---@param playerid integer 玩家ID
---@param instId integer 道具实例ID
---@param key any 数据键名
---@param value any 数组表
---@return boolean result 是否写入成功
function Item:SetArrayData(playerid, instId, key, value) end

---按背包格子索引写入自定义数组数据
---value 必须是 table
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 数据键名
---@param value table 数组表
---@return boolean result 是否写入成功
function Item:SetArrayDataByGrid(playerid, gridIndex, key, value) end

---按道具实例ID写入自定义布尔数据
---@param playerid integer 玩家ID
---@param instId integer 道具实例ID
---@param key any 数据键名
---@param value any 布尔值
---@return boolean result 是否写入成功
function Item:SetBoolData(playerid, instId, key, value) end

---按背包格子索引写入自定义布尔数据
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 数据键名
---@param value boolean 布尔值
---@return boolean result 是否写入成功
function Item:SetBoolDataByGrid(playerid, gridIndex, key, value) end

---设置掉落物或投掷物的格子属性
---物品数量超过最大堆叠时会按上限截断，小于等于 0 时清空格子
---耐久度与韧性会被限制在 0 到上限之间
---投掷物不支持数量和韧性属性，设置数量直接返回 false
---@param objid integer 掉落物或投掷物对象ID
---@param attr number 格子属性（GridAttr.ItemNum/Durable/Toughness）
---@param value number 属性值
---@return boolean|number? result 设置结果：成功为 true，数量清零返回 0，失败为 false 或 nil
function Item:SetGridAttr(objid, attr, value) end

---按道具实例ID写入自定义 number 数据
---value 必须是 number
---@param playerid integer 玩家ID
---@param instId integer 道具实例ID
---@param key any 数据键名
---@param value any 数值
---@return boolean result 是否写入成功
function Item:SetNumberData(playerid, instId, key, value) end

---按背包格子索引写入自定义 number 数据
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 数据键名
---@param value number 数值
---@return boolean result 是否写入成功
function Item:SetNumberDataByGrid(playerid, gridIndex, key, value) end

---按道具实例ID写入自定义字符串数据
---value 必须是 string
---@param playerid integer 玩家ID
---@param instId integer 道具实例ID
---@param key any 数据键名
---@param value any 字符串值
---@return boolean result 是否写入成功
function Item:SetStringData(playerid, instId, key, value) end

---按背包格子索引写入自定义字符串数据
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 数据键名
---@param value string 字符串值
---@return boolean result 是否写入成功
function Item:SetStringDataByGrid(playerid, gridIndex, key, value) end

---直接按格子对象为道具添加模型部件
---内部接口，modelStr 为空字符串时直接失败
---偏移量内部乘 100 转换为引擎单位
---@param grid userdata 背包格子对象
---@param partName string 子部件名称
---@param boneName string 挂点骨骼名称
---@param modelStr string 模型资源名
---@param offset Mini.Vec3 位置偏移，默认 {x=0,y=0,z=0}
---@param rot Mini.Vec3 旋转角度，默认全 0
---@param scale Mini.Vec3 缩放比例，默认全 1
---@return string? partName 子部件名称，失败时为 nil
function Item:_AddModelPartByGrid(grid, partName, boneName, modelStr, offset, rot, scale) end

---锁定格子中的道具以开始一次修改
---成功后必须调用 GunSmithMgr:EndModifyItem 结束修改
---@param grid userdata 背包格子对象
---@return boolean result 是否成功进入修改状态
function Item:_BeginModifyItemByGrid(grid) end

---直接从格子对象删除道具模型部件
---@param grid userdata 背包格子对象
---@param partName string 子部件名称
---@return boolean result 是否删除成功
function Item:_DeleteModelPartByGrid(grid, partName) end

---直接从格子对象读取自定义数组数据
---@param grid userdata 背包格子对象
---@param key string 数据键名
---@return table? value 数组数据，读取失败时为 nil
function Item:_GetArrayDataByGrid(grid, key) end

---直接从格子对象读取自定义布尔数据
---@param grid userdata 背包格子对象
---@param key string 数据键名
---@return boolean? value 布尔值，读取失败时为 nil
function Item:_GetBoolDataByGrid(grid, key) end

---按道具实例ID定位其所在的格子对象
---实例属于方块时按方块坐标取格子，属于角色时按角色格子接口取
---@param instanceId? integer 道具实例ID（数字或数字字符串）
---@return userdata? grid 格子对象，实例不存在时为 nil
function Item:_GetGridByInstId(instanceId) end

---直接从格子对象读取枪械实例属性
---@param grid userdata 背包格子对象
---@param key string 属性键（GunAttr）
---@return any value 属性值，键非法或读取失败时为 nil
function Item:_GetGunAttrByGrid(grid, key) end

---直接从格子对象读取枪械预制属性
---@param grid userdata 背包格子对象
---@param key string 属性键（GunAttr）
---@return any value 预制属性值，键非法或读取失败时为 nil
function Item:_GetGunPrefabAttrByGrid(grid, key) end

---直接从格子对象读取道具ID
---@param grid userdata 背包格子对象
---@return number? itemid 道具ID，读取失败时为 nil
function Item:_GetItemIdByGrid(grid) end

---直接从格子对象读取自定义 number 数据
---@param grid userdata 背包格子对象
---@param key string 数据键名
---@return number? value 数值，读取失败时为 nil
function Item:_GetNumberDataByGrid(grid, key) end

---直接从格子对象读取 Object 自定义数据
---@param grid userdata 背包格子对象
---@param key string 数据键名
---@return table? value 对象数据转换出的 table，读取失败时为 nil
function Item:_GetObjDataByGrid(grid, key) end

---直接从格子对象读取预制资源ID
---@param grid userdata 背包格子对象
---@return string? resId 预制资源ID，读取失败时为 nil
function Item:_GetResIdByGrid(grid) end

---直接从格子对象读取自定义字符串数据
---@param grid userdata 背包格子对象
---@param key string 数据键名
---@return string? value 字符串值，读取失败时为 nil
function Item:_GetStringDataByGrid(grid, key) end

---直接从格子对象修改枪械属性
---value 的类型必须与 GunAttr 配置一致
---@param grid userdata 背包格子对象
---@param key string 属性键（GunAttr）
---@param value any 新属性值
---@return boolean result 是否修改成功
function Item:_ModifyGunAttributeByGrid(grid, key, value) end

---直接从格子对象修改模型部件
---只修改传入的参数，未传的字段保持原值
---@param grid userdata 背包格子对象
---@param partName string 子部件名称
---@param boneName string 挂点骨骼名称
---@param modelStr string 模型资源名
---@param offset Mini.Vec3 位置偏移
---@param rot Mini.Vec3 旋转角度
---@param scale Mini.Vec3 缩放比例
---@return boolean result 是否修改成功
function Item:_ModifyModelPartByGrid(grid, partName, boneName, modelStr, offset, rot, scale) end

---直接从格子对象写入自定义数组数据
---@param grid userdata 背包格子对象
---@param key string 数据键名
---@param value table 数组表
---@return boolean result 是否写入成功
function Item:_SetArrayDataByGrid(grid, key, value) end

---直接从格子对象写入自定义布尔数据
---@param grid userdata 背包格子对象
---@param key string 数据键名
---@param value boolean 布尔值
---@return boolean result 是否写入成功
function Item:_SetBoolDataByGrid(grid, key, value) end

---直接从格子对象写入自定义 number 数据
---@param grid userdata 背包格子对象
---@param key string 数据键名
---@param value any 数值
---@return boolean result 是否写入成功
function Item:_SetNumberDataByGrid(grid, key, value) end

---直接从格子对象写入 Object 自定义数据
---value 必须是 table，内部序列化为 JSON 对象
---@param grid userdata 背包格子对象
---@param key string 数据键名
---@param value table 对象表
---@return boolean result 是否写入成功
function Item:_SetObjDataByGrid(grid, key, value) end

---直接从格子对象写入自定义字符串数据
---@param grid userdata 背包格子对象
---@param key string 数据键名
---@param value string 字符串值
---@return boolean result 是否写入成功
function Item:_SetStringDataByGrid(grid, key, value) end

---把引擎配方定义转换为纯 Lua 表
---缺少产物ID或材料数量小于等于 0 时返回 nil
---结果字段：id、rid、rc、craftingItemId、aMaterials、type
---@param craftingDef? any 引擎配方定义对象
---@return table? craft 配方表，定义无效时为 nil
function Item:__TransformCraftingDefToTable(craftingDef) end
