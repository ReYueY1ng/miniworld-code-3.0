---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Item<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param partName any
---@param boneName any
---@param modelStr any
---@param offset any
---@param rot any
---@param scale any
function Item:AddModelPart(playerid, instId, partName, boneName, modelStr, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
---@param partName string
---@param boneName string
---@param modelStr string
---@param offset Mini.Vec3
---@param rot Mini.Vec3
---@param scale Mini.Vec3
function Item:AddModelPartByGrid(playerid, gridIndex, partName, boneName, modelStr, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param itemid number | string
---@param gridIndex number
function Item:CreateGunInBackpack(playerid, itemid, gridIndex) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param partName any
function Item:DeleteModelPart(playerid, instId, partName) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
---@param partName string
---@return boolean
function Item:DeleteModelPartByGrid(playerid, gridIndex, partName) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
function Item:GetArrayData(playerid, instId, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
---@param key string
function Item:GetArrayDataByGrid(playerid, gridIndex, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
function Item:GetBoolData(playerid, instId, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
---@param key string
---@return boolean?
function Item:GetBoolDataByGrid(playerid, gridIndex, key) end

---官方环境独有接口（未收录于开发环境）
---@param idCraft? string
function Item:GetCraftDef(idCraft) end

---官方环境独有接口（未收录于开发环境）
---@param iCraft? number
function Item:GetCraftDefByIndex(iCraft) end

---官方环境独有接口（未收录于开发环境）
function Item:GetCraftDefCount() end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Item:GetDropItemNum(objid) end

---官方环境独有接口（未收录于开发环境）
---@param itemid? string
function Item:GetEquipBaseDesc(itemid) end

---官方环境独有接口（未收录于开发环境）
---@param itemid? string
---@return number
function Item:GetFoodAddFoodVal(itemid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param instId string
function Item:GetGridIndexByInstId(playerid, instId) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
function Item:GetGunAttr(playerid, instId, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
---@param key string
---@return boolean?
function Item:GetGunAttrByGrid(playerid, gridIndex, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
function Item:GetGunGridIndexInBackpack(playerid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
function Item:GetGunInstIdInBackpack(playerid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
function Item:GetGunPrefabAttr(playerid, instId, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
---@param key string
function Item:GetGunPrefabAttrByGrid(playerid, gridIndex, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
function Item:GetInstIdByGridIndex(playerid, gridIndex) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Item:GetItemId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
function Item:GetItemIdByGrid(playerid, gridIndex) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
function Item:GetItemIdByInstId(playerid, instId) end

---官方环境独有接口（未收录于开发环境）
---@param itemid? string
function Item:GetItemStackMax(itemid) end

---官方环境独有接口（未收录于开发环境）
---@param itemid? string
function Item:GetItemType(itemid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
function Item:GetNumberData(playerid, instId, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
---@param key string
function Item:GetNumberDataByGrid(playerid, gridIndex, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
function Item:GetPrefabModelPart(playerid, instId) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
function Item:GetPrefabModelPartByGrid(playerid, gridIndex) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
function Item:GetResIdByGrid(playerid, gridIndex) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
function Item:GetResIdByInstId(playerid, instId) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
function Item:GetStringData(playerid, instId, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
---@param key string
function Item:GetStringDataByGrid(playerid, gridIndex, key) end

---官方环境独有接口（未收录于开发环境）
---@param itemid? string
function Item:GetToolBaseDesc(itemid) end

---官方环境独有接口（未收录于开发环境）
---@param itemid? string
---@return number
function Item:GetToolType(itemid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
---@param value any
function Item:ModifyGunAttr(playerid, instId, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
---@param key string
---@param value any
---@return boolean
function Item:ModifyGunAttrByGrid(playerid, gridIndex, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param partName any
---@param boneName any
---@param modelStr any
---@param offset any
---@param rot any
---@param scale any
function Item:ModifyModelPart(playerid, instId, partName, boneName, modelStr, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
---@param partName string
---@param boneName string
---@param modelStr string
---@param offset Mini.Vec3
---@param rot Mini.Vec3
---@param scale Mini.Vec3
---@return boolean
function Item:ModifyModelPartByGrid(playerid, gridIndex, partName, boneName, modelStr, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param animid any
---@param playmode any
---@return boolean
function Item:PlayAct(objid, animid, playmode) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
---@param value any
function Item:SetArrayData(playerid, instId, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
---@param key string
---@param value table
---@return boolean
function Item:SetArrayDataByGrid(playerid, gridIndex, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
---@param value any
function Item:SetBoolData(playerid, instId, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
---@param key string
---@param value boolean
---@return boolean
function Item:SetBoolDataByGrid(playerid, gridIndex, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param attr any
---@param value any
function Item:SetGridAttr(objid, attr, value) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
---@param value any
function Item:SetNumberData(playerid, instId, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
---@param key string
---@param value number
---@return boolean
function Item:SetNumberDataByGrid(playerid, gridIndex, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
---@param value any
function Item:SetStringData(playerid, instId, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param gridIndex number
---@param key string
---@param value string
---@return boolean
function Item:SetStringDataByGrid(playerid, gridIndex, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
---@param partName string
---@param boneName string
---@param modelStr string
---@param offset Mini.Vec3
---@param rot Mini.Vec3
---@param scale Mini.Vec3
function Item:_AddModelPartByGrid(grid, partName, boneName, modelStr, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
---@return boolean
function Item:_BeginModifyItemByGrid(grid) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
---@param partName string
---@return boolean
function Item:_DeleteModelPartByGrid(grid, partName) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
---@param key string
function Item:_GetArrayDataByGrid(grid, key) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
---@param key string
---@return boolean?
function Item:_GetBoolDataByGrid(grid, key) end

---官方环境独有接口（未收录于开发环境）
---@param instanceId? any
function Item:_GetGridByInstId(instanceId) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
---@param key string
---@return boolean?
function Item:_GetGunAttrByGrid(grid, key) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
---@param key string
function Item:_GetGunPrefabAttrByGrid(grid, key) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
function Item:_GetItemIdByGrid(grid) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
---@param key string
function Item:_GetNumberDataByGrid(grid, key) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
---@param key string
function Item:_GetObjDataByGrid(grid, key) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
function Item:_GetResIdByGrid(grid) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
---@param key string
function Item:_GetStringDataByGrid(grid, key) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
---@param key string
---@param value any
---@return boolean
function Item:_ModifyGunAttributeByGrid(grid, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
---@param partName string
---@param boneName string
---@param modelStr string
---@param offset Mini.Vec3
---@param rot Mini.Vec3
---@param scale Mini.Vec3
---@return boolean
function Item:_ModifyModelPartByGrid(grid, partName, boneName, modelStr, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
---@param key string
---@param value table
---@return boolean
function Item:_SetArrayDataByGrid(grid, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
---@param key string
---@param value boolean
---@return boolean
function Item:_SetBoolDataByGrid(grid, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
---@param key string
---@param value any
---@return boolean
function Item:_SetNumberDataByGrid(grid, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
---@param key string
---@param value table
---@return boolean
function Item:_SetObjDataByGrid(grid, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param grid userdata
---@param key string
---@param value string
---@return boolean
function Item:_SetStringDataByGrid(grid, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param craftingDef? any
function Item:__TransformCraftingDefToTable(craftingDef) end
