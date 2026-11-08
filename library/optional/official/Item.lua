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
---@param playerid any
---@param gridIndex any
---@param partName any
---@param boneName any
---@param modelStr any
---@param offset any
---@param rot any
---@param scale any
function Item:AddModelPartByGrid(playerid, gridIndex, partName, boneName, modelStr, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param itemid any
---@param gridIndex any
function Item:CreateGunInBackpack(playerid, itemid, gridIndex) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param partName any
function Item:DeleteModelPart(playerid, instId, partName) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridIndex any
---@param partName any
function Item:DeleteModelPartByGrid(playerid, gridIndex, partName) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
function Item:GetArrayData(playerid, instId, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridIndex any
---@param key any
function Item:GetArrayDataByGrid(playerid, gridIndex, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
function Item:GetBoolData(playerid, instId, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridIndex any
---@param key any
function Item:GetBoolDataByGrid(playerid, gridIndex, key) end

---官方环境独有接口（未收录于开发环境）
---@param idCraft any
function Item:GetCraftDef(idCraft) end

---官方环境独有接口（未收录于开发环境）
---@param iCraft any
function Item:GetCraftDefByIndex(iCraft) end

---官方环境独有接口（未收录于开发环境）
function Item:GetCraftDefCount() end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Item:GetDropItemNum(objid) end

---官方环境独有接口（未收录于开发环境）
---@param itemid any
function Item:GetEquipBaseDesc(itemid) end

---官方环境独有接口（未收录于开发环境）
---@param itemid any
function Item:GetFoodAddFoodVal(itemid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
function Item:GetGridIndexByInstId(playerid, instId) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
function Item:GetGunAttr(playerid, instId, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridIndex any
---@param key any
function Item:GetGunAttrByGrid(playerid, gridIndex, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
function Item:GetGunGridIndexInBackpack(playerid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
function Item:GetGunInstIdInBackpack(playerid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
function Item:GetGunPrefabAttr(playerid, instId, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridIndex any
---@param key any
function Item:GetGunPrefabAttrByGrid(playerid, gridIndex, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridIndex any
function Item:GetInstIdByGridIndex(playerid, gridIndex) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Item:GetItemId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridIndex any
function Item:GetItemIdByGrid(playerid, gridIndex) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
function Item:GetItemIdByInstId(playerid, instId) end

---官方环境独有接口（未收录于开发环境）
---@param itemid any
function Item:GetItemStackMax(itemid) end

---官方环境独有接口（未收录于开发环境）
---@param itemid any
function Item:GetItemType(itemid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
function Item:GetNumberData(playerid, instId, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridIndex any
---@param key any
function Item:GetNumberDataByGrid(playerid, gridIndex, key) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
function Item:GetPrefabModelPart(playerid, instId) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridIndex any
function Item:GetPrefabModelPartByGrid(playerid, gridIndex) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridIndex any
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
---@param playerid any
---@param gridIndex any
---@param key any
function Item:GetStringDataByGrid(playerid, gridIndex, key) end

---官方环境独有接口（未收录于开发环境）
---@param itemid any
function Item:GetToolBaseDesc(itemid) end

---官方环境独有接口（未收录于开发环境）
---@param itemid any
function Item:GetToolType(itemid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
---@param value any
function Item:ModifyGunAttr(playerid, instId, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridIndex any
---@param key any
---@param value any
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
---@param playerid any
---@param gridIndex any
---@param partName any
---@param boneName any
---@param modelStr any
---@param offset any
---@param rot any
---@param scale any
function Item:ModifyModelPartByGrid(playerid, gridIndex, partName, boneName, modelStr, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param animid any
---@param playmode any
function Item:PlayAct(objid, animid, playmode) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
---@param value any
function Item:SetArrayData(playerid, instId, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridIndex any
---@param key any
---@param value any
function Item:SetArrayDataByGrid(playerid, gridIndex, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
---@param value any
function Item:SetBoolData(playerid, instId, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridIndex any
---@param key any
---@param value any
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
---@param playerid any
---@param gridIndex any
---@param key any
---@param value any
function Item:SetNumberDataByGrid(playerid, gridIndex, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param instId any
---@param key any
---@param value any
function Item:SetStringData(playerid, instId, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridIndex any
---@param key any
---@param value any
function Item:SetStringDataByGrid(playerid, gridIndex, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
---@param partName any
---@param boneName any
---@param modelStr any
---@param offset any
---@param rot any
---@param scale any
function Item:_AddModelPartByGrid(grid, partName, boneName, modelStr, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
function Item:_BeginModifyItemByGrid(grid) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
---@param partName any
function Item:_DeleteModelPartByGrid(grid, partName) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
---@param key any
function Item:_GetArrayDataByGrid(grid, key) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
---@param key any
function Item:_GetBoolDataByGrid(grid, key) end

---官方环境独有接口（未收录于开发环境）
---@param instanceId any
function Item:_GetGridByInstId(instanceId) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
---@param key any
function Item:_GetGunAttrByGrid(grid, key) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
---@param key any
function Item:_GetGunPrefabAttrByGrid(grid, key) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
function Item:_GetItemIdByGrid(grid) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
---@param key any
function Item:_GetNumberDataByGrid(grid, key) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
---@param key any
function Item:_GetObjDataByGrid(grid, key) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
function Item:_GetResIdByGrid(grid) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
---@param key any
function Item:_GetStringDataByGrid(grid, key) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
---@param key any
---@param value any
function Item:_ModifyGunAttributeByGrid(grid, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
---@param partName any
---@param boneName any
---@param modelStr any
---@param offset any
---@param rot any
---@param scale any
function Item:_ModifyModelPartByGrid(grid, partName, boneName, modelStr, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
---@param key any
---@param value any
function Item:_SetArrayDataByGrid(grid, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
---@param key any
---@param value any
function Item:_SetBoolDataByGrid(grid, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
---@param key any
---@param value any
function Item:_SetNumberDataByGrid(grid, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
---@param key any
---@param value any
function Item:_SetObjDataByGrid(grid, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param grid any
---@param key any
---@param value any
function Item:_SetStringDataByGrid(grid, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param craftingDef any
function Item:__TransformCraftingDefToTable(craftingDef) end
