---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Item<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---添加模型部件
---@param playerid any 玩家ID
---@param instId any 实例ID
---@param partName any 部件名称
---@param boneName any 骨骼名称
---@param modelStr any 模型资源
---@param offset any 偏移
---@param rot any 旋转
---@param scale any 缩放
function Item:AddModelPart(playerid, instId, partName, boneName, modelStr, offset, rot, scale) end

---按格子添加模型部件
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param partName string 部件名称
---@param boneName string 骨骼名称
---@param modelStr string 模型资源
---@param offset Mini.Vec3 偏移
---@param rot Mini.Vec3 旋转
---@param scale Mini.Vec3 缩放
function Item:AddModelPartByGrid(playerid, gridIndex, partName, boneName, modelStr, offset, rot, scale) end

---在背包中创建枪械
---@param playerid number 玩家ID
---@param itemid number | string 道具ID
---@param gridIndex number 背包格子索引
function Item:CreateGunInBackpack(playerid, itemid, gridIndex) end

---删除模型部件
---@param playerid any 玩家ID
---@param instId any 实例ID
---@param partName any 部件名称
function Item:DeleteModelPart(playerid, instId, partName) end

---按格子删除模型部件
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param partName string 部件名称
---@return boolean result 是否成功
function Item:DeleteModelPartByGrid(playerid, gridIndex, partName) end

---获取数组数据
---@param playerid any 玩家ID
---@param instId any 实例ID
---@param key any 键名
function Item:GetArrayData(playerid, instId, key) end

---按格子获取数组数据
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 键名
function Item:GetArrayDataByGrid(playerid, gridIndex, key) end

---获取bool数据
---@param playerid any 玩家ID
---@param instId any 实例ID
---@param key any 键名
function Item:GetBoolData(playerid, instId, key) end

---按格子获取bool数据
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 键名
---@return boolean? value 结果，失败时为 nil
function Item:GetBoolDataByGrid(playerid, gridIndex, key) end

---获取craftdef
---@param idCraft? string 参数 idCraft
function Item:GetCraftDef(idCraft) end

---按索引获取craftdef
---@param iCraft? number 参数 iCraft
function Item:GetCraftDefByIndex(iCraft) end

---获取craftdef统计
function Item:GetCraftDefCount() end

---获取掉落道具数量
---@param objid any 对象ID
function Item:GetDropItemNum(objid) end

---获取装备basedesc
---@param itemid? string 道具ID
function Item:GetEquipBaseDesc(itemid) end

---获取food添加foodval
---@param itemid? string 道具ID
---@return number value 结果数值
function Item:GetFoodAddFoodVal(itemid) end

---按实例ID获取格子索引
---@param playerid number 玩家ID
---@param instId string 实例ID
function Item:GetGridIndexByInstId(playerid, instId) end

---获取枪械属性
---@param playerid any 玩家ID
---@param instId any 实例ID
---@param key any 键名
function Item:GetGunAttr(playerid, instId, key) end

---按格子获取枪械属性
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 键名
---@return boolean? value 结果，失败时为 nil
function Item:GetGunAttrByGrid(playerid, gridIndex, key) end

---在背包中获取枪械格子索引
---@param playerid number 玩家ID
function Item:GetGunGridIndexInBackpack(playerid) end

---在背包中获取枪械实例ID
---@param playerid number 玩家ID
function Item:GetGunInstIdInBackpack(playerid) end

---获取枪械prefab属性
---@param playerid any 玩家ID
---@param instId any 实例ID
---@param key any 键名
function Item:GetGunPrefabAttr(playerid, instId, key) end

---按格子获取枪械prefab属性
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 键名
function Item:GetGunPrefabAttrByGrid(playerid, gridIndex, key) end

---按格子索引获取实例ID
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
function Item:GetInstIdByGridIndex(playerid, gridIndex) end

---获取道具ID
---@param objid any 对象ID
function Item:GetItemId(objid) end

---按格子获取道具ID
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
function Item:GetItemIdByGrid(playerid, gridIndex) end

---按实例ID获取道具ID
---@param playerid any 玩家ID
---@param instId any 实例ID
function Item:GetItemIdByInstId(playerid, instId) end

---获取道具stack最大
---@param itemid? string 道具ID
function Item:GetItemStackMax(itemid) end

---获取道具类型
---@param itemid? string 道具ID
function Item:GetItemType(itemid) end

---获取number数据
---@param playerid any 玩家ID
---@param instId any 实例ID
---@param key any 键名
function Item:GetNumberData(playerid, instId, key) end

---按格子获取number数据
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 键名
function Item:GetNumberDataByGrid(playerid, gridIndex, key) end

---获取prefab模型部件
---@param playerid any 玩家ID
---@param instId any 实例ID
function Item:GetPrefabModelPart(playerid, instId) end

---按格子获取prefab模型部件
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
function Item:GetPrefabModelPartByGrid(playerid, gridIndex) end

---按格子获取resID
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
function Item:GetResIdByGrid(playerid, gridIndex) end

---按实例ID获取resID
---@param playerid any 玩家ID
---@param instId any 实例ID
function Item:GetResIdByInstId(playerid, instId) end

---获取string数据
---@param playerid any 玩家ID
---@param instId any 实例ID
---@param key any 键名
function Item:GetStringData(playerid, instId, key) end

---按格子获取string数据
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 键名
function Item:GetStringDataByGrid(playerid, gridIndex, key) end

---获取toolbasedesc
---@param itemid? string 道具ID
function Item:GetToolBaseDesc(itemid) end

---获取tool类型
---@param itemid? string 道具ID
---@return number value 结果数值
function Item:GetToolType(itemid) end

---modify枪械属性
---@param playerid any 玩家ID
---@param instId any 实例ID
---@param key any 键名
---@param value any 值
function Item:ModifyGunAttr(playerid, instId, key, value) end

---按格子modify枪械属性
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 键名
---@param value any 值
---@return boolean result 是否成功
function Item:ModifyGunAttrByGrid(playerid, gridIndex, key, value) end

---modify模型部件
---@param playerid any 玩家ID
---@param instId any 实例ID
---@param partName any 部件名称
---@param boneName any 骨骼名称
---@param modelStr any 模型资源
---@param offset any 偏移
---@param rot any 旋转
---@param scale any 缩放
function Item:ModifyModelPart(playerid, instId, partName, boneName, modelStr, offset, rot, scale) end

---按格子modify模型部件
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param partName string 部件名称
---@param boneName string 骨骼名称
---@param modelStr string 模型资源
---@param offset Mini.Vec3 偏移
---@param rot Mini.Vec3 旋转
---@param scale Mini.Vec3 缩放
---@return boolean result 是否成功
function Item:ModifyModelPartByGrid(playerid, gridIndex, partName, boneName, modelStr, offset, rot, scale) end

---播放动作
---@param objid any 对象ID
---@param animid any 动画ID
---@param playmode any 播放模式
---@return boolean result 是否成功
function Item:PlayAct(objid, animid, playmode) end

---设置数组数据
---@param playerid any 玩家ID
---@param instId any 实例ID
---@param key any 键名
---@param value any 值
function Item:SetArrayData(playerid, instId, key, value) end

---按格子设置数组数据
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 键名
---@param value table 值
---@return boolean result 是否成功
function Item:SetArrayDataByGrid(playerid, gridIndex, key, value) end

---设置bool数据
---@param playerid any 玩家ID
---@param instId any 实例ID
---@param key any 键名
---@param value any 值
function Item:SetBoolData(playerid, instId, key, value) end

---按格子设置bool数据
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 键名
---@param value boolean 值
---@return boolean result 是否成功
function Item:SetBoolDataByGrid(playerid, gridIndex, key, value) end

---设置格子属性
---@param objid any 对象ID
---@param attr any 属性
---@param value any 值
function Item:SetGridAttr(objid, attr, value) end

---设置number数据
---@param playerid any 玩家ID
---@param instId any 实例ID
---@param key any 键名
---@param value any 值
function Item:SetNumberData(playerid, instId, key, value) end

---按格子设置number数据
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 键名
---@param value number 值
---@return boolean result 是否成功
function Item:SetNumberDataByGrid(playerid, gridIndex, key, value) end

---设置string数据
---@param playerid any 玩家ID
---@param instId any 实例ID
---@param key any 键名
---@param value any 值
function Item:SetStringData(playerid, instId, key, value) end

---按格子设置string数据
---@param playerid number 玩家ID
---@param gridIndex number 背包格子索引
---@param key string 键名
---@param value string 值
---@return boolean result 是否成功
function Item:SetStringDataByGrid(playerid, gridIndex, key, value) end

---按格子添加模型部件
---@param grid userdata 格子
---@param partName string 部件名称
---@param boneName string 骨骼名称
---@param modelStr string 模型资源
---@param offset Mini.Vec3 偏移
---@param rot Mini.Vec3 旋转
---@param scale Mini.Vec3 缩放
function Item:_AddModelPartByGrid(grid, partName, boneName, modelStr, offset, rot, scale) end

---按格子beginmodify道具
---@param grid userdata 格子
---@return boolean result 是否成功
function Item:_BeginModifyItemByGrid(grid) end

---按格子删除模型部件
---@param grid userdata 格子
---@param partName string 部件名称
---@return boolean result 是否成功
function Item:_DeleteModelPartByGrid(grid, partName) end

---按格子获取数组数据
---@param grid userdata 格子
---@param key string 键名
function Item:_GetArrayDataByGrid(grid, key) end

---按格子获取bool数据
---@param grid userdata 格子
---@param key string 键名
---@return boolean? result 结果，失败时为 nil
function Item:_GetBoolDataByGrid(grid, key) end

---按实例ID获取格子
---@param instanceId? any 实例ID
function Item:_GetGridByInstId(instanceId) end

---按格子获取枪械属性
---@param grid userdata 格子
---@param key string 键名
---@return boolean? result 结果，失败时为 nil
function Item:_GetGunAttrByGrid(grid, key) end

---按格子获取枪械prefab属性
---@param grid userdata 格子
---@param key string 键名
function Item:_GetGunPrefabAttrByGrid(grid, key) end

---按格子获取道具ID
---@param grid userdata 格子
function Item:_GetItemIdByGrid(grid) end

---按格子获取number数据
---@param grid userdata 格子
---@param key string 键名
function Item:_GetNumberDataByGrid(grid, key) end

---按格子获取对象数据
---@param grid userdata 格子
---@param key string 键名
function Item:_GetObjDataByGrid(grid, key) end

---按格子获取resID
---@param grid userdata 格子
function Item:_GetResIdByGrid(grid) end

---按格子获取string数据
---@param grid userdata 格子
---@param key string 键名
function Item:_GetStringDataByGrid(grid, key) end

---按格子modify枪械属性
---@param grid userdata 格子
---@param key string 键名
---@param value any 值
---@return boolean result 是否成功
function Item:_ModifyGunAttributeByGrid(grid, key, value) end

---按格子modify模型部件
---@param grid userdata 格子
---@param partName string 部件名称
---@param boneName string 骨骼名称
---@param modelStr string 模型资源
---@param offset Mini.Vec3 偏移
---@param rot Mini.Vec3 旋转
---@param scale Mini.Vec3 缩放
---@return boolean result 是否成功
function Item:_ModifyModelPartByGrid(grid, partName, boneName, modelStr, offset, rot, scale) end

---按格子设置数组数据
---@param grid userdata 格子
---@param key string 键名
---@param value table 值
---@return boolean result 是否成功
function Item:_SetArrayDataByGrid(grid, key, value) end

---按格子设置bool数据
---@param grid userdata 格子
---@param key string 键名
---@param value boolean 值
---@return boolean result 是否成功
function Item:_SetBoolDataByGrid(grid, key, value) end

---按格子设置number数据
---@param grid userdata 格子
---@param key string 键名
---@param value any 值
---@return boolean result 是否成功
function Item:_SetNumberDataByGrid(grid, key, value) end

---按格子设置对象数据
---@param grid userdata 格子
---@param key string 键名
---@param value table 值
---@return boolean result 是否成功
function Item:_SetObjDataByGrid(grid, key, value) end

---按格子设置string数据
---@param grid userdata 格子
---@param key string 键名
---@param value string 值
---@return boolean result 是否成功
function Item:_SetStringDataByGrid(grid, key, value) end

---transformcraftingdef转换为表
---@param craftingDef? any 参数 craftingDef
function Item:__TransformCraftingDefToTable(craftingDef) end
