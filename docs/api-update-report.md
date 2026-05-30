# Mini World API Update Report

## Summary

- **Date:** 2026-05-22
- **Data sources:** Environment dump, decompiled scripts, official docs
- **Total APIs added:** 110
- **Total signatures fixed:** 379
- **Total deprecated:** 8
- **Total enum values added:** 42
- **Files modified:** 22

## Coverage Statistics

| Metric | Count | Percentage |
|--------|-------|------------|
| Environment API coverage | 803 / 1,246 | **64.4%** |
| Signature consistency | 538 / 664 | **81.0%** |
| Uncovered APIs | 443 | 35.6% |
| Mismatched signatures | 126 | 19.0% |

## Changes by Module

### Actor.lua

- **Added:** 11 APIs
  - `Actor:GetActionAttrState`
  - `Actor:GetActorDir`
  - `Actor:GetCmpBaseState`
  - `Actor:GetDefID`
  - `Actor:PlayAnimByObj`
  - `Actor:PlayBodyEffectById`
  - `Actor:SetActionAttrState`
  - `Actor:SetBodyEffectScale`
  - `Actor:SetCmpBaseState`
  - `Actor:SetMountActorAttr`
  - `Actor:WhitList_StopSkill`
- **Fixed:** 46 signatures

### Area.lua

- **Added:** 1 API
  - `Area:CreateAreaRectByLen`
- **Fixed:** 29 signatures

### Backpack.lua

- **Added:** 2 APIs
  - `Backpack:GetGridGunInfo`
  - `Backpack:PlayShortCutItemEffect`
- **Fixed:** 32 signatures

### Block.lua

- **Added:** 14 APIs
  - `Block:BluePrintSaveAsNewId`
  - `Block:BluePrintSetUploadInteral`
  - `Block:CaptureAndUploadScreenshot`
  - `Block:CreateObsBluePrint`
  - `Block:DeleteBluePrint`
  - `Block:GetBluePrintBlockInfo`
  - `Block:GetObsBluePrintPos`
  - `Block:GetObsBluePrintStatus`
  - `Block:LoadObsBluePrint`
  - `Block:PlaceBluePrint`
  - `Block:SaveBluePrintRegionData`
  - `Block:StopPlaceObsBluePrint`
  - `Block:UnbindBluePrintRegion`
  - `Block:UnloadObsBluePrint`
- **Fixed:** 26 signatures

### Buff.lua

- **Fixed:** 4 signatures

### Chat.lua

- **Fixed:** 2 signatures

### CloudSever.lua

- **Added:** 5 APIs
  - `CloudSever:GetRoomCategory`
  - `CloudSever:SetDataListValue`
  - `CloudSever:SetRoomCategory`
  - `CloudSever:TransmitToCategoryRoom`
  - `CloudSever:TransmitToCurMapCategoryRoom`
- **Fixed:** 2 signatures

### Component.lua

- **Deprecated:** 1 API
  - `WorldComponent:AddTriggerEvent` - use `PushCustomEvent` instead
- **Fixed:** 18 signatures

### CustomUI.lua

- **Added:** 15 APIs
  - `CustomUI:GetElementAttrValue`
  - `CustomUI:GetUIViewAttrValue`
  - `CustomUI:RemovePositionBandBlock`
  - `CustomUI:RemovePositionBindActor`
  - `CustomUI:SetBeaconBandPos`
  - `CustomUI:SetBeaconClampType`
  - `CustomUI:SetBeaconMapType`
  - `CustomUI:SetBeaconMargin`
  - `CustomUI:SetBeaconObjId`
  - `CustomUI:SetBeaconOffset`
  - `CustomUI:SetBeaconRadius`
  - `CustomUI:SetPositionBandBlock`
  - `CustomUI:SetPositionBindActor`
  - `CustomUI:SetSysSettingBtnVisible`
  - `CustomUI:SetUrlIcon`
- **Fixed:** 38 signatures

### Data.lua

- **Added:** 3 APIs
  - `Data:Array:CreateTmpArray`
  - `Data:Array:HasIntersectionByTags`
  - `Data:DoPackBluePrint`
- **Fixed:** 2 signatures

### Enum.lua

- **Added:** 11 new enums
  - `AreaCloneType`
  - `BeaconClampType`
  - `BeaconMapType`
  - `GameSetting`
  - `HumanBodyAnchorId`
  - `MiniMapMarkType`
  - `MiniShopDetail`
  - `MiniShopWarehouse`
  - `MiniViewSecondTab`
  - `ObsBluePrintStatus`
  - `RolePickupType`

### GameObject.lua

- **Added:** 1 API
  - `GameObject:GetObjInstanceID`
- **Fixed:** 7 signatures

### Graphics.lua

- **Added:** 2 APIs
  - `Graphics:CreateBrushByPos`
  - `Graphics:RemoveGraphicsByGraphicsID`
- **Fixed:** 26 signatures

### Item.lua

- **Added:** 10 APIs
  - `Item:CreateBindItemInBackpack`
  - `Item:CreateItemInstInBackpack`
  - `Item:GetGunBaseDesc`
  - `Item:GetItemModelComp`
  - `Item:GetObjData`
  - `Item:GetObjDataByGrid`
  - `Item:GetResIdByInstanceId`
  - `Item:IsBindItem`
  - `Item:SetObjData`
  - `Item:SetObjDataByGrid`
- **Fixed:** 28 signatures

### Mod.lua

- **Fixed:** 1 signature

### Monster.lua

- **Added:** 3 APIs
  - `Monster:GetMonsterDefName`
  - `Monster:SetAIActive`
  - `Monster:SetPersistance`
- **Fixed:** 9 signatures

### Object.lua

- **Deprecated:** 7 APIs
  - `ActorObject:Destroy`
  - `Object:AddComponent`
  - `Object:GetComponent`
  - `Object:GetId`
  - `Object:GetObjType`
  - `Object:IsValid`
  - `Object:RemoveComponent`

### Player.lua

- **Added:** 29 APIs
  - `Player:AddMagazine`
  - `Player:ChangeViewModeForMod`
  - `Player:CheckActionAttrState`
  - `Player:GetBlockAtlasInfo`
  - `Player:GetCurShotcut`
  - `Player:GetFriendList`
  - `Player:GetHorseRealID`
  - `Player:GetMiniCurrency`
  - `Player:GetPersonInfo`
  - `Player:GetSkinSeatInfos`
  - `Player:GetSkinlist`
  - `Player:GetVisibleRange`
  - `Player:GunGetMagazine`
  - `Player:HasHandheldGun`
  - `Player:MountActor`
  - `Player:OpenActView`
  - `Player:OpenFriendChatPage`
  - `Player:OpenMiniShopItemPage`
  - `Player:OpenMiniShopPage`
  - `Player:OpenMiniShopWarehousePage`
  - `Player:OpenShopGiveGiftView`
  - `Player:OpenShopSkinBuyDialog`
  - `Player:OpenShopTryOnView`
  - `Player:RotateMainModel`
  - `Player:SetCameraShake`
  - `Player:SetCrawl`
  - `Player:SetSettingAbility`
  - `Player:SetSettingEnable`
  - `Player:SetVisibleRange`
  - `Player:UseItem`
- **Fixed:** 30 signatures

### Timer.lua

- **Fixed:** 12 signatures

### World.lua

- **Fixed:** 42 signatures

### WorldContainer.lua

- **Fixed:** 16 signatures

### threadpool.lua

- **Added:** 2 APIs
  - `threadpool:Wait`
  - `threadpool:Work`
- **Fixed:** 2 signatures

## Deprecated Methods

| Method | Reason |
|--------|--------|
| `WorldComponent:AddTriggerEvent` | Replaced by `PushCustomEvent` |
| `ActorObject:Destroy` | Legacy API, use `GameObject:Destroy` |
| `Object:AddComponent` | Legacy API, use `Component:AddComponent` |
| `Object:GetComponent` | Legacy API, use `Component:GetComponent` |
| `Object:GetId` | Legacy API, use `Component:GetGameObjectId` |
| `Object:GetObjType` | Legacy API, use `Component` hierarchy |
| `Object:IsValid` | Legacy API, use `Component:IsValid` |
| `Object:RemoveComponent` | Legacy API, use `Component` methods |

## Enum Updates

### New Enums Added (Enum.lua)

| Enum | Description |
|------|-------------|
| `AreaCloneType` | Area clone operation types |
| `BeaconClampType` | Beacon clamp behavior types |
| `BeaconMapType` | Beacon map display types |
| `GameSetting` | Game setting identifiers |
| `HumanBodyAnchorId` | Human body anchor point IDs |
| `MiniMapMarkType` | Minimap marker types |
| `MiniShopDetail` | Mini shop detail view types |
| `MiniShopWarehouse` | Mini shop warehouse types |
| `MiniViewSecondTab` | Mini view secondary tab types |
| `ObsBluePrintStatus` | Observable blueprint status codes |
| `RolePickupType` | Role pickup behavior types |

### New Enum Values

| Enum | New Values | Count |
|------|-----------|-------|
| `Ability` | `EnableInputRotate = 200003` | 1 |
| `ComponentUIStyle` | `Curve`, `SunMoonTexture`, `SkyTexture` | 3 |
| `ElementAttr` | `GlobalPos = 106`, `GlobalPosY = 15`, `GlobalPosX = 14` | 3 |
| `GraphicsType` | `Brush = 12` | 1 |
| `InnerPopUpview` | `FollowTheAuthor`, `MiniMap`, `AnimView`, `Atlas`, `MiniShop`, `InscriptionTable` | 6 |
| `MiniShopData` | `AllMountLevel = 4` | 1 |
| `ObjectEvent` | `MobUseItem`, `OnNotify`, `MobBeInteract`, `CaptureAndUploadScreenshot`, `PlayerTouchObj`, `ObjBeTouched`, `BlockBeTouched`, `PlayerTouchBlock`, `PayMapShopOrder`, `OnInteractLowPriority`, `OnTame` | 11 |
| `TriggerEvent` | `PlayerTouchBlock`, `ObsBluePrintLoaded`, `MobBeInteract`, `PlayerAnimFinish`, `PlayerCloseInnerView`, `PlayerOpenInnerView`, `MiniMapIconClick`, `UIScrollPaneScrollEnd`, `UIScrollPaneTouchEnd`, `UIScrollPaneTouchBegin`, `ObjBeTouched`, `PlayerTouchObj`, `BlockBeTouched`, `CaptureAndUploadScreenshot`, `PayMapShopOrder`, `PlayerSaveSkinSeat`, `ObsBluePrintBuildEnd` | 17 |

## Mismatched Signatures

The following APIs have parameter mismatches between the library definitions and the source:

### Player APIs

| API | Library Params | Source Params |
|-----|---------------|---------------|
| `Player:ShakeCamera` | `objid, power, duration` | `objid, duration, power` |
| `Player:OpenDevGoodsPage` | `objid, pagetype, pagetitle` | `playerid, pagetype, pagetitle` |
| `Player:ChangPlayerMoveType` | `objid, moveType` | `uin, moveType` |
| `Player:OpenShopTryOnView` | `playerid` | `...` |
| `Player:OpenShopSkinBuyDialog` | `playerid, skins` | `...` |
| `Player:OpenShopGiveGiftView` | `playerid, giveuin` | `...` |
| `Player:HasHandheldGun` | `objid` | `...` |
| `Player:GunGetMagazine` | `uin` | `...` |
| `Player:ChangeViewModeForMod` | `objid, viewmode, islock` | `...` |
| `Player:SetCrawl` | `ishost, playerid, bCrawl` | `...` |
| `Player:AddMagazine` | `uin, num` | `...` |
| `Player:GetVisibleRange` | `reportid, objid` | `...` |
| `Player:SetCameraShake` | `objid, shake` | `...` |
| `Player:OpenActView` | `uin, actid, activatename` | `...` |
| `Player:GetSkinlist` | `call_back, uin, itype` | `...` |
| `Player:GetSkinSeatInfos` | `reportid, uin, index, size` | `...` |
| `Player:OpenFriendChatPage` | `playerid, uin2` | `...` |
| `Player:OpenMiniShopPage` | `playerid, itype, itype2, itemid` | `...` |
| `Player:OpenMiniShopItemPage` | `playerid, itype, itemid` | `...` |
| `Player:OpenMiniShopWarehousePage` | `playerid, itype, itype2, itemid` | `...` |
| `Player:GetHorseRealID` | `reportid, playerid, horseid` | `...` |
| `Player:GetPersonInfo` | `reportid, uin` | `...` |
| `Player:GetBlockAtlasInfo` | `reportid, playerid, islock` | `...` |
| `Player:SetVisibleRange` | `objid, range` | `...` |

### Data APIs

| API | Library Params | Source Params |
|-----|---------------|---------------|
| `Data:Table:InsertValueByRow` | `varId, value` | `varId, playerId, value, row` |
| `Data:Table:GetValuesByCol` | `varId, col` | `varId, playerId, col` |
| `Data:Table:GetRowIndex` | `varId, col, value, cmp` | `varId, playerId, col, value, cmp` |
| `Data:Table:InsertValue` | `varId` | `varId, playerId, ...` |
| `Data:Table:GetColIndex` | `varId, colname` | `varId, playerId, key` |
| `Data:Table:UpdateAllValue` | `varId, value` | `varId, playerId, value` |
| `Data:Table:GetAllValue` | `varId` | `varId, playerId` |
| `Data:Table:GetRows` | `varId` | `varId, playerId` |
| `Data:Table:SetValue` | `varId, row, col, value` | `varId, playerId, row, col, value` |
| `Data:Table:Clear` | `varId` | `varId, playerId` |
| `Data:Table:GetRowIndexs` | `varId, col, value, cmp` | `varId, playerId, col, value, cmp` |
| `Data:Table:GetCols` | `varId` | `varId, playerId` |
| `Data:Table:GetValue` | `varId, row, col` | `varId, playerId, row, col` |
| `Data:Table:RemoveRow` | `varId, row` | `varId, playerId, row` |
| `Data:Array:ReplaceValue` | `varId, playerId, newvalue, oldvalue` | `varId, playerId, value, oldValue` |
| `Data:Array:RemoveByValues` | `varId, playerId, removevarId, removeplayerId` | `varId1, playerId1, varId2, playerId2` |
| `Data:Array:HasValueByNo` | `varId, playerId, index` | `varId, playerId, ix` |
| `Data:Array:InsertValue` | `varId, playerId, value` | `varId, playerId, value, index` |
| `Data:Array:InsertValues` | `varId, playerId, index, mergevarId, mergeplayerId` | `varId1, playerId1, index, varId2, playerId2` |
| `Data:DoPackBluePrint` | `varId, playerId, x, y, z, x2, y2, z2` | `...` |
| `Data:Map:*` (13 methods) | Various | Missing `playerId` param |

### CustomUI APIs

| API | Library Params | Source Params |
|-----|---------------|---------------|
| `CustomUI:SetBeaconMapType` | `playerid, uiid, elementid, mapType` | `playerid, elementid, mapType` |
| `CustomUI:SetBeaconBandPos` | `playerid, uiid, elementid, bandPosX, bandPosY, bandPosZ` | `playerid, elementid, bandPosX, bandPosY, bandPosZ` |
| `CustomUI:SetBeaconObjId` | `playerid, uiid, elementid, objId` | `playerid, elementid, objId` |
| `CustomUI:SetBeaconOffset` | `playerid, uiid, elementid, offsetX, offsetY, offsetZ` | `playerid, elementid, offsetX, offsetY, offsetZ` |
| `CustomUI:SetBeaconClampType` | `playerid, uiid, elementid, clampRange` | `playerid, elementid, clampType` |
| `CustomUI:SetBeaconRadius` | `playerid, uiid, elementid, radius` | `playerid, elementid, radius` |
| `CustomUI:SetUrlIcon` | `objid, uiid, elementid, url` | `...` |
| `CustomUI:SetSysSettingBtnVisible` | `objid, visible` | `...` |
| `CustomUI:GetMonsterIcon` | `actor` | `actorid` |

### Other APIs

| API | Library Params | Source Params |
|-----|---------------|---------------|
| `json:encode` | `table` | `tab` |
| `json:decode` | `data` | `jstr` |
| `threadpool:wait` | `event, time, frame_func` | `vir, ...` |
| `threadpool:Work` | `vir` | `vir, ...` |
| `threadpool:work` | `f` | `vir, ...` |
| `threadpool:Wait` | `vir` | `vir, ...` |
| `Class` | `classname` | `className, super, isSingle` |
| `Actor:SetImmuneType` | `objid, immunetype, enable` | `objid, immunetype, isadd` |
| `Actor:AppendSpeed` | `objid, x, y, z` | `objid, vx, vy, vz` |
| `Actor:WhitList_StopSkill` | `objid, skillid` | `...` |
| `Backpack:GetGridGunInfo` | `itemid, num` | `...` |
| `Backpack:StopShortCutIxEffect` | `playerid, effectid` | `playerid, effectids` |
| `Backpack:StopShortCutItemEffect` | `playerid, itemid, effectid` | `playerid, itemid, effectids` |
| `Timer:HideTimerWnd` | `playerids, timerid` | `playerids` |
| `Timer:DeleteTimer` | `name, timerid` | `id` |
| `Monster:SetPersistance` | `objid, b` | `...` |
| `Monster:SetMonsterDefLevelExp` | `actorid, exp` | `actorid, levelExp` |
| `Monster:SetTameTarget` | `objid, playerid` | `objidA, objidB` |
| `Monster:GetFacade` | `monsterid, string` | `monsterid` |
| `Item:GetFacade` | `itemid, string` | `itemid` |
| `World:SetGravity` | `gravity` | `value` |
| `World:SetSkyBoxTemplate` | `skyboxid` | `value` |
| `World:SetSkyBoxMaps` | `time, itype, url` | `itype, url` |
| `World:CalcDistance` | `posSrc, y, z, posDst, y, z` | `posSrc, posDst` |
| `World:SetSkyBoxFilter*` (3 methods) | `uin, ...` | `playerid, ...` |
| `Graphics:GetInnerGraphicsOffset` | `objid, itype, callback` | `tuin, itype, callback` |
| `Graphics:CreateGraphicsSurfaceByActorToActor` | `objid, info, dir, offest` | `objid, info, dir, offset` |

## Uncovered APIs (443 total)

The following environment APIs are not yet covered by the library:

### Global Functions & Utilities (27)

- `LuaPanda:BP`, `__CallComponentDebugFn`, `Import`, `Export`, `GetModId`, `TriggerEvent`
- `SetDebugInfo`, `ObjectEvent`, `copy_table`, `require`
- `pairs`, `ipairs`
- `debug:traceback`
- `os:timeMs`
- `string:endswith`, `string:startswith`, `string:Trim`, `string:IsBlank`, `string:split`, `string:len`, `string:Contains`
- `math:approximately`, `math:clamp`, `math:deg`, `math:rad`, `math:mod`, `math:lerp`
- `table:foreachi`, `table:foreach`, `table:getn`, `table:remove`, `table:move`, `table:merge`, `table:clone`, `table:equal`, `table:tostring`, `table:show`, `table:num_pairs`

### Listen Module (1)

- `Listen:AddGraphicsListenParam`

### Trigger Namespace (308)

- `Trigger:GetEffectParams`, `Trigger:GetUIObject`, `Trigger:GetElementID`, `Trigger:GetLastCreateCreatureObjId`, `Trigger:Substring`, `Trigger:GetLastCreateCreatureId`, `Trigger:String2Playerid`, `Trigger:GetStringLength`, `Trigger:Wait`, `Trigger:Str2Obj`, `Trigger:AnyValue2Str`, `Trigger:GetRandomColor`, `Trigger:GetLastCreateBlockId`, `Trigger:SetLastCreateBlockId`, `Trigger:GetLastCreateEffectId`, `Trigger:SetLastCreateEffectId`, `Trigger:SetLastCreateItemId`, `Trigger:GetLastCreateItemId`, `Trigger:SplitStr`, `Trigger:GetWorld`, `Trigger:TransmitToCategoryRoom`, `Trigger:DoObjOrArrayAction`, `Trigger:GetPrefabIdStr`, `Trigger:GetPrefabInfo`, `Trigger:AllSound`, `Trigger:AllAttackType`, `Trigger:AllStatus`, `Trigger:SetLastCreateCreatureId`, `Trigger:GetPlayerId`, `Trigger:GetMobId`, `Trigger:ToPlayerId`, `Trigger:ToMobId`, `Trigger:PrintTag`
- `Trigger:ArrayTmp:*` (29 methods)
- `Trigger:Buff:*` (6 methods)
- `Trigger:Monster:GetMonsterFacade`
- `Trigger:Component:*` (14 methods)
- `Trigger:GameObject:*` (6 methods)
- `Trigger:Item:*` (7 methods)
- `Trigger:Math:*` (53 methods)
- `Trigger:Block:*` (13 methods)
- `Trigger:Backpack:*` (19 methods)
- `Trigger:Area:*` (13 methods)
- `Trigger:Graphics:*` (11 methods)
- `Trigger:Player:*` (53 methods)
- `Trigger:World:*` (40 methods)
- `Trigger:Actor:*` (35 methods)
- `Trigger:CustomUI:*` (13 methods)
- `Trigger:KvMap:*` (6 methods)

### OfficeUtils (5)

- `OfficeUtils:ReportActivateDataForUin`, `OfficeUtils:GetShopItemInfo`, `OfficeUtils:GetActivateProgress`, `OfficeUtils:GetActivateReward`, `OfficeUtils:SendClientReportEvent`

### World Additional (15)

- `World:FindNearActorListByObjType`, `World:GetHostWorldId`, `World:AddGameTimes`, `World:CalcDirectionByCoord`, `World:SetSkyBoxAttrWithNoTime`, `World:GetTimeFromDateString`, `World:GetDateStringFromTime`, `World:IsChunkLoaded`, `World:PlayParticleEffect`, `World:StopParticleEffectOnPos`, `World:SetParticleEffectScale`, `World:GetLocalDateString`, `World:GetServerDateString`

---

*Report generated on 2026-05-22 from `api-changes.txt`, `api-check-report.json`, `enum-merge-report.txt`, and `api-update-plan.json`.*
