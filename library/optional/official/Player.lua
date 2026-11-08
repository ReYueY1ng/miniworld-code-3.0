---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Player<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param targetid any
---@param damage any
---@param attacktype any
---@param ignoreResist any
---@param ignoreTriggerEvent any
function Player:ActorHurt(objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param areaid any
---@param damage any
---@param attacktype any
---@param ignoreList any
---@param ignoreResist any
---@param ignoreTriggerEvent any
function Player:ActorHurtArea(objid, areaid, damage, attacktype, ignoreList, ignoreResist, ignoreTriggerEvent) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param hp any
function Player:AddHp(objid, hp) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param attrtype any
---@param value any
function Player:AddModAttrib(objid, attrtype, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param tags any
---@param icount any
function Player:AddTags(objid, tags, icount) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Player:AppendSpeed(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:BanUseStrength(objid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param targetId any
---@param x any
---@param y any
---@param z any
function Player:CapturePlayer(playerid, targetId, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param moveMode any
function Player:ChangActorMoveType(objid, moveMode) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param modleName any
function Player:ChangeCustomModel(objid, modleName) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param skinPath any
---@param partModelName any
---@param hideFace any
---@param isAvatar any
function Player:ChangeSkinTextureForMod(playerid, skinPath, partModelName, hideFace, isAvatar) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param viewmode any
---@param islock any
function Player:ChangeViewModeSurvive(objid, viewmode, islock) end

---官方环境独有接口（未收录于开发环境）
---@param call_back any
---@param uin any
---@param orderids any
function Player:CheckCustomOrderID(call_back, uin, orderids) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param gunType any
function Player:CheckGunType(objid, gunType) end

---官方环境独有接口（未收录于开发环境）
---@param call_back any
---@param uin any
---@param orderid any
function Player:CheckMapShopOrder(call_back, uin, orderid) end

---官方环境独有接口（未收录于开发环境）
function Player:CheckRealOwnerIsDeveloper() end

---官方环境独有接口（未收录于开发环境）
---@param actor any
function Player:CheckSyncAction(actor) end

---官方环境独有接口（未收录于开发环境）
---@param actorid any
---@param bkill any
---@param worldId any
function Player:ClearActorWithId(actorid, bkill, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:ClearTags(objid) end

---官方环境独有接口（未收录于开发环境）
function Player:ClearTaskDirtyState() end

---官方环境独有接口（未收录于开发环境）
---@param uin any
function Player:CloseGunUpgradeFrame(uin) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
function Player:CloseRoleAttrFrame(uin) end

---官方环境独有接口（未收录于开发环境）
---@param facade1 any
---@param facade2 any
function Player:CompareMainModel(facade1, facade2) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param scene any
function Player:DelMapShopBackOrder(uin, scene) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:DisMountActor(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param dir any
---@param isThrow any
---@param speed any
---@param hasInertance any
function Player:DropActor(objid, dir, isThrow, speed, hasInertance) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param emitid any
function Player:EmitByShooter(objid, emitid) end

---官方环境独有接口（未收录于开发环境）
---@param objidA any
---@param emitid any
---@param objidB any
function Player:EmitByShooterTarget(objidA, emitid, objidB) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param emitid any
---@param targetPos any
function Player:EmitByShooterTargetPos(objid, emitid, targetPos) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param enable any
function Player:EnableUpdateRun(uin, enable) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:EscapePickup(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param blockid any
---@param blockRange any
function Player:FindLevelNearestBlock(objid, blockid, blockRange) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param blockid any
---@param blockRange any
function Player:FindLevelRandomsortBlock(objid, blockid, blockRange) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param blockid any
---@param blockRange any
function Player:FindNearestBlock(objid, blockid, blockRange) end

---官方环境独有接口（未收录于开发环境）
---@param ishost any
---@param uin any
---@param orderid any
function Player:FinishMapShopOrder(ishost, uin, orderid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itemid any
---@param num any
---@param prioritytype any
function Player:GainItems(objid, itemid, num, prioritytype) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param scene any
---@param payment any
---@param paynum any
---@param itemids any
---@param itemnums any
---@param extends any
---@param call_back any
function Player:GenMapShopBaseInfo(uin, scene, payment, paynum, itemids, itemnums, extends, call_back) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actionattr any
function Player:GetActionAttrState(objid, actionattr) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itype any
function Player:GetActorDir(objid, itype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param bhasequip any
function Player:GetActorFacade(objid, bhasequip) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetActorMovementMode(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param ability any
function Player:GetActorPermissions(objid, ability) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param attrtype any
function Player:GetAttr(objid, attrtype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param bodySizeType any
function Player:GetBodySize(objid, bodySizeType) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetBoundSzie(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param varid any
function Player:GetBtreeVarValue(objid, varid) end

---官方环境独有接口（未收录于开发环境）
---@param call_back any
---@param uin any
---@param itemids any
function Player:GetBuyItemRecoder(call_back, uin, itemids) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
function Player:GetCameraRot(playerid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Player:GetChargingMaxNum(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Player:GetChargingMaxTime(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Player:GetChargingNum(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Player:GetChargingTime(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actionattr any
function Player:GetCmpBaseState(objid, actionattr) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetCurMapId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetCurrMapId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetDefID(objid) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
function Player:GetDirtyObjectiveTaskInfo(uin) end

---官方环境独有接口（未收录于开发环境）
function Player:GetDirtyObjectiveTaskUins() end

---官方环境独有接口（未收录于开发环境）
---@param uin any
function Player:GetDirtyTaskInfo(uin) end

---官方环境独有接口（未收录于开发环境）
function Player:GetDirtyTaskUins() end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetDropItemInstanceId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetDropItemNum(objid) end

---官方环境独有接口（未收录于开发环境）
---@param prefab any
function Player:GetEntityFacade(prefab) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetEyeHeight(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetFaceDirection(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetFacePitch(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetFaceYaw(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetFoodLevel(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetGameResults(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetGameScore(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetGunDamageType(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetGunInfo(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetItemId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetLastFallSpeed(objid) end

---官方环境独有接口（未收录于开发环境）
function Player:GetLevelMode() end

---官方环境独有接口（未收录于开发环境）
---@param facade any
function Player:GetMainModel(facade) end

---官方环境独有接口（未收录于开发环境）
function Player:GetMainPlayerUin() end

---官方环境独有接口（未收录于开发环境）
---@param reportid any
---@param objid any
function Player:GetMallModel(reportid, objid) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param call_back any
function Player:GetMapShopAllNoFinishOrder(uin, call_back) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetMaxHP(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetMotion(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetNickName(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetObjType(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetObjWorldId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetOrientation(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetOverlayGravity(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param roleType any
function Player:GetPickupObjID(objid, roleType) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetPosition(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetRidingActorObjId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param itype any
function Player:GetSettingAbility(playerid, itype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itemid any
function Player:GetSkillCD(objid, itemid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itemid any
---@param spellID any
function Player:GetSkillCurCD(objid, itemid, spellID) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Player:GetSkillMaxCD(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param horseid any
function Player:GetSkinIDByHorseID(horseid) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
function Player:GetSkinModelId(uin) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetTags(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetTeam(objid) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param attr any
function Player:GetTriggerOperateDisable(uin, attr) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
function Player:GetWorldMapId(uin) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param b any
function Player:GunEnableAds(uin, b) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param b any
function Player:GunEnableHittedShake(uin, b) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:HasActor(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param tags any
---@param mathcmode any
---@param bexactmatch any
function Player:HasTags(objid, tags, mathcmode, bexactmatch) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param atttype any
---@param val any
function Player:IncreasesAttr(objid, atttype, val) end

---官方环境独有接口（未收录于开发环境）
function Player:InitTriggerGlobalData() end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:IsExist(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Player:IsHaveSkill(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:IsMainPlayer(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:IsMob(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:IsPlayer(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:Jump(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:KillSelf(objid) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param jsonstr any
function Player:LoadObjectiveTaskInfoByCloudVar(uin, jsonstr) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param jsonstr any
function Player:LoadTaskInfoByCloudVar(uin, jsonstr) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param info any
function Player:NotifySystemMsg2Self(objid, info) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param num any
function Player:OnCurToolUsed(objid, num) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param openType any
---@param level any
---@param mcoin any
---@param extraItemOdds any
---@param consumeOdds any
function Player:OpenEquipFrame(uin, openType, level, mcoin, extraItemOdds, consumeOdds) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
function Player:OpenGunUpgradeFrame(uin) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param content any
function Player:OpenInnerItemTips(objid, content) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
function Player:OpenShopMiniCoinView(uin) end

---官方环境独有接口（未收录于开发环境）
---@vararg any
function Player:OpenSummerActView(...) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
function Player:OpenTaskMainUI(uin) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
function Player:OpenTaskTraceUI(uin) end

---官方环境独有接口（未收录于开发环境）
function Player:OrganizeFacadeList() end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param soundId any
---@param pause any
function Player:PauseSoundEffectById(objid, soundId, pause) end

---官方环境独有接口（未收录于开发环境）
---@param ishost any
---@param uin any
---@param scene any
---@param payment any
---@param paynum any
---@param itemids any
---@param itemnums any
---@param extends any
---@param call_back any
function Player:PayMapShopOrder(ishost, uin, scene, payment, paynum, itemids, itemnums, extends, call_back) end

---官方环境独有接口（未收录于开发环境）
---@param objidA any
---@param objidB any
---@param actionA any
---@param actionB any
---@param offest any
---@param rotate any
---@param playemode any
---@param playspeed any
---@param anchorId any
function Player:PickupActor(objidA, objidB, actionA, actionB, offest, rotate, playemode, playspeed, anchorId) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itemobjid any
---@param bforcepickup any
function Player:PickupItem(objid, itemobjid, bforcepickup) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actid any
function Player:PlayAct(objid, actid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param animid any
---@param playmode any
function Player:PlayActInHand(playerid, animid, playmode) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param adname any
---@param callback any
function Player:PlayAdvertisingCallback(objid, adname, callback) end

---官方环境独有接口（未收录于开发环境）
---@param reportid any
---@param objid any
---@param adname any
function Player:PlayAdvertising_OnClient(reportid, objid, adname) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param animid any
---@param speed any
---@param loop any
function Player:PlayAnim(objid, animid, speed, loop) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param id any
function Player:PlayAnimById(playerid, id) end

---官方环境独有接口（未收录于开发环境）
---@param objidA any
---@param objidB any
---@param breplay any
function Player:PlayAnimByObj(objidA, objidB, breplay) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itype any
function Player:PlayBodyEffect(objid, itype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param filename any
---@param sync any
function Player:PlayBodyEffectByFile(objid, filename, sync) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId any
---@param scale any
---@param ptme any
function Player:PlayBodyEffectById(objid, particleId, scale, ptme) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId any
---@param ptme any
---@param offset any
---@param rot any
---@param scale any
function Player:PlayBodyParticleById(objid, particleId, ptme, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param animid any
---@param speed any
---@param playmode any
---@param crassfade any
function Player:PlayHandAnim(uin, animid, speed, playmode, crassfade) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param animid any
---@param speed any
---@param playmode any
---@param crassfade any
function Player:PlayHandToolAnim(uin, animid, speed, playmode, crassfade) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Player:PlaySkill(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param name any
---@param volume any
---@param pitch any
---@param flag any
function Player:PlaySoundByName(objid, name, volume, pitch, flag) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param soundId any
---@param volume any
---@param pitch any
---@param isLoop any
function Player:PlaySoundEffectById(objid, soundId, volume, pitch, isLoop) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param targetid any
---@param damage any
---@param attacktype any
---@param ignoreResist any
---@param ignoreTriggerEvent any
function Player:PlayerHurt(objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end

---官方环境独有接口（未收录于开发环境）
function Player:RandomFacadeID() end

---官方环境独有接口（未收录于开发环境）
---@param ishost any
---@param objid any
function Player:RecoverinitialModel(ishost, objid) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param itemData any
function Player:RefreshItemTips(uin, itemData) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itemid any
---@param num any
function Player:RemoveBackpackItem(objid, itemid, num) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param tags any
---@param icount any
function Player:RemoveTags(objid, tags, icount) end

---官方环境独有接口（未收录于开发环境）
---@param reportid any
---@param uin any
---@param conid any
---@param num any
---@param orderid any
function Player:RequestCostCoin(reportid, uin, conid, num, orderid) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param conid any
---@param num any
---@param index any
function Player:RequestExchangeCoins(uin, conid, num, index) end

---官方环境独有接口（未收录于开发环境）
function Player:ResetTriggerGlobalData() end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param targetid any
function Player:RotateFaceToActor(objid, targetid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param able any
function Player:SetAblePick(objid, able) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actionattr any
---@param switch any
function Player:SetActionAttrState(objid, actionattr, switch) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param b any
function Player:SetActorControl(objid, b) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itype any
---@param value any
function Player:SetActorDir(objid, itype, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param ability any
---@param switch any
function Player:SetActorPermissions(objid, ability, switch) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param attrtype any
---@param val any
function Player:SetAttr(objid, attrtype, val) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param targetid any
function Player:SetBeHurtTarget(objid, targetid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param value any
function Player:SetBehitDisable(objid, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId any
---@param scale any
function Player:SetBodyEffectScale(objid, particleId, scale) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param filename any
---@param scale any
function Player:SetBodyEffectScaleByFile(objid, filename, scale) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId any
---@param offset any
---@param rot any
---@param scale any
function Player:SetBodyParticleTransform(objid, particleId, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param varid any
---@param val any
function Player:SetBtreeVarValue(objid, varid, val) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param lerpspeed any
function Player:SetCameraLerpSpeed(playerid, lerpspeed) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param value any
function Player:SetCanCollide(objid, value) end

---官方环境独有接口（未收录于开发环境）
---@param ishost any
---@param playerid any
---@param bThrow any
function Player:SetCanThrow(ishost, playerid, bThrow) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
---@param ischarging any
function Player:SetCharging(objid, slot, ischarging) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
---@param value any
function Player:SetChargingValue(objid, slot, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
---@param max any
---@param num any
---@param maxnum any
---@param isauto any
function Player:SetCharginginfo(objid, slot, max, num, maxnum, isauto) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actionattr any
---@param switch any
function Player:SetCmpBaseState(objid, actionattr, switch) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param curnum any
---@param url any
---@param name any
---@param rsetdesc any
function Player:SetCustomRevieInfo(uin, curnum, url, name, rsetdesc) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param visible any
function Player:SetDeathFrameVisible(uin, visible) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Player:SetFaceDirection(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param pitch any
function Player:SetFacePitch(objid, pitch) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param yaw any
function Player:SetFaceYaw(objid, yaw) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param firstsearch any
function Player:SetFirstSearch(objid, firstsearch) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param x any
---@param y any
---@param z any
function Player:SetFishLineEndPoint(uin, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param foodLevel any
function Player:SetFoodLevel(objid, foodLevel) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param score any
function Player:SetGameScore(objid, score) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param animtype any
---@param animid any
---@param speed any
function Player:SetHandOrToolAnimSpeed(uin, animtype, animid, speed) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param immunetype any
---@param isadd any
function Player:SetImmuneType(objid, immunetype, isadd) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param attrtype any
---@param value any
function Player:SetModAttrib(objid, attrtype, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Player:SetMotionChange(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param isRote any
---@param isPlayerContrl any
---@param isCloseAI any
function Player:SetMountActorAttr(objid, isRote, isPlayerContrl, isCloseAI) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param nickname any
function Player:SetNickName(objid, nickname) end

---官方环境独有接口（未收录于开发环境）
---@param ishost any
---@param uin any
---@param flag any
function Player:SetNoClip(ishost, uin, flag) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Player:SetOrientation(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param val any
function Player:SetOverlayGravity(objid, val) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param bvisible any
---@param hidepto any
function Player:SetPolaroidViewVisible(playerid, bvisible, hidepto) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Player:SetPosition(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Player:SetRidePosition(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Player:SetScale(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
---@param maxcd any
---@param isauto any
function Player:SetSkillCDInfo(objid, slot, maxcd, isauto) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param bOpen any
function Player:SetTaskTraceVisible(uin, bOpen) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param teamid any
---@param resetAttr any
function Player:SetTeam(objid, teamid, resetAttr) end

---官方环境独有接口（未收录于开发环境）
---@param ishost any
---@param uin any
---@param attr any
---@param disable any
function Player:SetTriggerOperateDisable(ishost, uin, attr, disable) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param bShow any
function Player:ShowFishLine(uin, bShow) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param bshow any
function Player:ShowNickName(objid, bshow) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Player:SkillIsCharging(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:StopAllAnim(objid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param id any
function Player:StopAnimById(playerid, id) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itype any
function Player:StopBodyEffect(objid, itype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId any
function Player:StopBodyEffectById(objid, particleId) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param animid any
function Player:StopHandAnim(uin, animid) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param animid any
function Player:StopHandToolAnim(uin, animid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param soundId any
function Player:StopSoundEffectById(objid, soundId) end

---官方环境独有接口（未收录于开发环境）
---@param ishost any
---@param playerid any
---@param customuievent any
function Player:SyncTriggerData(ishost, playerid, customuievent) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:TeleportHome(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param atttype any
---@param val any
function Player:TriggerAttrChangeEvent(objid, atttype, val) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param skillName any
---@param growPatchName any
function Player:TriggerSkillCall(objid, skillName, growPatchName) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param targetObjid any
---@param speed any
function Player:TryMoveToActor(objid, targetObjid, speed) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Player:TryMoveToNoSearch(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
---@param cancontrol any
---@param bshowtip any
function Player:TryMoveToPos(objid, x, y, z, cancontrol, bshowtip) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param distance any
function Player:TryPickupActorForward(objid, distance) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param _type any
---@param target1 any
---@param target2 any
---@param goalnum any
function Player:UpdateMainTaskForMod(uin, _type, target1, target2, goalnum) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param skillid any
function Player:WhitList_StopSkill(objid, skillid) end
