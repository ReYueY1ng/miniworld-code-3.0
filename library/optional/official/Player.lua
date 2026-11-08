---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Player<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param targetid any
---@param damage any
---@param attacktype? any
---@param ignoreResist? boolean
---@param ignoreTriggerEvent any
---@return boolean
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
---@param hp number
---@return boolean
function Player:AddHp(objid, hp) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param attrtype number
---@param value number
---@return boolean
function Player:AddModAttrib(objid, attrtype, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param tags any
---@param icount any
---@return boolean
function Player:AddTags(objid, tags, icount) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
---@return boolean
function Player:AppendSpeed(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Player:BanUseStrength(objid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param targetId any
---@param x any
---@param y any
---@param z any
---@return boolean
function Player:CapturePlayer(playerid, targetId, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param moveMode number
---@return boolean
function Player:ChangActorMoveType(objid, moveMode) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param modleName? any
---@return boolean
function Player:ChangeCustomModel(objid, modleName) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param skinPath? string
---@param partModelName string | table
---@param hideFace boolean
---@param isAvatar any
---@return boolean
function Player:ChangeSkinTextureForMod(playerid, skinPath, partModelName, hideFace, isAvatar) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param viewmode any
---@param islock any
---@return boolean
function Player:ChangeViewModeSurvive(objid, viewmode, islock) end

---官方环境独有接口（未收录于开发环境）
---@param call_back function
---@param uin any
---@param orderids string | table
function Player:CheckCustomOrderID(call_back, uin, orderids) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param gunType number
---@return boolean
function Player:CheckGunType(objid, gunType) end

---官方环境独有接口（未收录于开发环境）
---@param call_back any
---@param uin number
---@param orderid string
---@return boolean
function Player:CheckMapShopOrder(call_back, uin, orderid) end

---官方环境独有接口（未收录于开发环境）
---@return boolean
function Player:CheckRealOwnerIsDeveloper() end

---官方环境独有接口（未收录于开发环境）
---@param actor any
function Player:CheckSyncAction(actor) end

---官方环境独有接口（未收录于开发环境）
---@param actorid? number | string
---@param bkill? boolean
---@param worldId any
---@return boolean
function Player:ClearActorWithId(actorid, bkill, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Player:ClearTags(objid) end

---官方环境独有接口（未收录于开发环境）
---@return boolean
function Player:ClearTaskDirtyState() end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@return boolean
function Player:CloseGunUpgradeFrame(uin) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@return boolean
function Player:CloseRoleAttrFrame(uin) end

---官方环境独有接口（未收录于开发环境）
---@param facade1 string
---@param facade2 string
---@return boolean
function Player:CompareMainModel(facade1, facade2) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param scene any
---@return boolean
function Player:DelMapShopBackOrder(uin, scene) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Player:DisMountActor(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param dir Mini.Vec3
---@param isThrow boolean
---@param speed number
---@param hasInertance boolean
---@return boolean
function Player:DropActor(objid, dir, isThrow, speed, hasInertance) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param emitid number
---@return boolean
function Player:EmitByShooter(objid, emitid) end

---官方环境独有接口（未收录于开发环境）
---@param objidA number
---@param emitid number
---@param objidB number
---@return boolean
function Player:EmitByShooterTarget(objidA, emitid, objidB) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param emitid number
---@param targetPos any
---@return boolean
function Player:EmitByShooterTargetPos(objid, emitid, targetPos) end

---官方环境独有接口（未收录于开发环境）
---@param uin? any
---@param enable any
---@return boolean
function Player:EnableUpdateRun(uin, enable) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Player:EscapePickup(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param blockid? string
---@param blockRange number
function Player:FindLevelNearestBlock(objid, blockid, blockRange) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param blockid? string
---@param blockRange number
function Player:FindLevelRandomsortBlock(objid, blockid, blockRange) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param blockid number | string
---@param blockRange number
function Player:FindNearestBlock(objid, blockid, blockRange) end

---官方环境独有接口（未收录于开发环境）
---@param ishost any
---@param uin number
---@param orderid string
---@return boolean
function Player:FinishMapShopOrder(ishost, uin, orderid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itemid? string
---@param num any
---@param prioritytype any
function Player:GainItems(objid, itemid, num, prioritytype) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param scene any
---@param payment any
---@param paynum any
---@param itemids number | table
---@param itemnums number | table
---@param extends table
---@param call_back any
---@return boolean
function Player:GenMapShopBaseInfo(uin, scene, payment, paynum, itemids, itemnums, extends, call_back) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param actionattr number
function Player:GetActionAttrState(objid, actionattr) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param itype number
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
---@param objid? any
---@param attrtype number
function Player:GetAttr(objid, attrtype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param bodySizeType any
function Player:GetBodySize(objid, bodySizeType) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
function Player:GetBoundSzie(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param varid string
function Player:GetBtreeVarValue(objid, varid) end

---官方环境独有接口（未收录于开发环境）
---@param call_back any
---@param uin any
---@param itemids table
---@return boolean
function Player:GetBuyItemRecoder(call_back, uin, itemids) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
function Player:GetCameraRot(playerid) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
function Player:GetChargingMaxNum(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
function Player:GetChargingMaxTime(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
function Player:GetChargingNum(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
function Player:GetChargingTime(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actionattr number
---@return boolean
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
---@return table?
function Player:GetFaceDirection(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
function Player:GetFacePitch(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
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
---@return number
function Player:GetGunDamageType(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetGunInfo(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetItemId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return number
function Player:GetLastFallSpeed(objid) end

---官方环境独有接口（未收录于开发环境）
function Player:GetLevelMode() end

---官方环境独有接口（未收录于开发环境）
---@param facade string
---@return string?
function Player:GetMainModel(facade) end

---官方环境独有接口（未收录于开发环境）
function Player:GetMainPlayerUin() end

---官方环境独有接口（未收录于开发环境）
---@param reportid any
---@param objid any
---@return boolean
function Player:GetMallModel(reportid, objid) end

---官方环境独有接口（未收录于开发环境）
---@param uin number
---@param call_back any
---@return boolean
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
---@return number
function Player:GetObjWorldId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetOrientation(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
function Player:GetOverlayGravity(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param roleType any
---@return number
function Player:GetPickupObjID(objid, roleType) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:GetPosition(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return number
function Player:GetRidingActorObjId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid? any
---@param itype number
---@return boolean
function Player:GetSettingAbility(playerid, itype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itemid? string
function Player:GetSkillCD(objid, itemid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itemid? string
---@param spellID any
function Player:GetSkillCurCD(objid, itemid, spellID) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
function Player:GetSkillMaxCD(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param horseid any
---@return number
function Player:GetSkinIDByHorseID(horseid) end

---官方环境独有接口（未收录于开发环境）
---@param uin number
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
---@return boolean
function Player:GetTriggerOperateDisable(uin, attr) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@return number
function Player:GetWorldMapId(uin) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param b any
---@return boolean
function Player:GunEnableAds(uin, b) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param b any
---@return boolean
function Player:GunEnableHittedShake(uin, b) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Player:HasActor(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param tags any
---@param mathcmode number
---@param bexactmatch boolean
---@return boolean
function Player:HasTags(objid, tags, mathcmode, bexactmatch) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param atttype any
---@param val number
---@return boolean
function Player:IncreasesAttr(objid, atttype, val) end

---官方环境独有接口（未收录于开发环境）
function Player:InitTriggerGlobalData() end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Player:IsExist(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
---@return boolean?
function Player:IsHaveSkill(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Player:IsMainPlayer(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Player:IsMob(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Player:IsPlayer(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Player:Jump(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
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
---@return boolean
function Player:OnCurToolUsed(objid, num) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param openType any
---@param level any
---@param mcoin any
---@param extraItemOdds any
---@param consumeOdds any
---@return boolean
function Player:OpenEquipFrame(uin, openType, level, mcoin, extraItemOdds, consumeOdds) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@return boolean
function Player:OpenGunUpgradeFrame(uin) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param content? string | table
---@return boolean
function Player:OpenInnerItemTips(objid, content) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@return boolean
function Player:OpenShopMiniCoinView(uin) end

---官方环境独有接口（未收录于开发环境）
---@vararg any
---@return boolean
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
---@param soundId number
---@param pause boolean
---@return boolean
function Player:PauseSoundEffectById(objid, soundId, pause) end

---官方环境独有接口（未收录于开发环境）
---@param ishost any
---@param uin number
---@param scene string
---@param payment number
---@param paynum number
---@param itemids any
---@param itemnums any
---@param extends any
---@param call_back function
---@return boolean
function Player:PayMapShopOrder(ishost, uin, scene, payment, paynum, itemids, itemnums, extends, call_back) end

---官方环境独有接口（未收录于开发环境）
---@param objidA any
---@param objidB any
---@param actionA any
---@param actionB any
---@param offest Mini.Vec3
---@param rotate Mini.Vec3
---@param playemode any
---@param playspeed? number
---@param anchorId? any
---@return boolean
function Player:PickupActor(objidA, objidB, actionA, actionB, offest, rotate, playemode, playspeed, anchorId) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param itemobjid number
---@param bforcepickup? boolean
---@return number
function Player:PickupItem(objid, itemobjid, bforcepickup) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actid number
---@return boolean
function Player:PlayAct(objid, actid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param animid any
---@param playmode any
---@return boolean
function Player:PlayActInHand(playerid, animid, playmode) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param adname any
---@param callback any
---@return boolean
function Player:PlayAdvertisingCallback(objid, adname, callback) end

---官方环境独有接口（未收录于开发环境）
---@param reportid any
---@param objid any
---@param adname any
---@return boolean
function Player:PlayAdvertising_OnClient(reportid, objid, adname) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param animid any
---@param speed any
---@param loop number | boolean
---@return boolean
function Player:PlayAnim(objid, animid, speed, loop) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param id any
---@return boolean
function Player:PlayAnimById(playerid, id) end

---官方环境独有接口（未收录于开发环境）
---@param objidA number
---@param objidB number
---@param breplay any
---@return boolean
function Player:PlayAnimByObj(objidA, objidB, breplay) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itype number | string
---@return boolean
function Player:PlayBodyEffect(objid, itype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param filename string
---@param sync? boolean
---@return boolean
function Player:PlayBodyEffectByFile(objid, filename, sync) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId any
---@param scale? number
---@param ptme any
---@return boolean
function Player:PlayBodyEffectById(objid, particleId, scale, ptme) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId number | string
---@param ptme number
---@param offset? Mini.Vec3
---@param rot? Mini.Vec3
---@param scale? Mini.Vec3
---@return boolean
function Player:PlayBodyParticleById(objid, particleId, ptme, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param uin? any
---@param animid any
---@param speed? number
---@param playmode? number
---@param crassfade? number
---@return boolean
function Player:PlayHandAnim(uin, animid, speed, playmode, crassfade) end

---官方环境独有接口（未收录于开发环境）
---@param uin? any
---@param animid any
---@param speed? number
---@param playmode? number
---@param crassfade? number
---@return boolean
function Player:PlayHandToolAnim(uin, animid, speed, playmode, crassfade) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
---@return boolean
function Player:PlaySkill(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param name string
---@param volume number
---@param pitch number
---@param flag number
---@return boolean
function Player:PlaySoundByName(objid, name, volume, pitch, flag) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param soundId number
---@param volume number
---@param pitch number
---@param isLoop boolean
---@return boolean
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
---@param objid? any
---@return boolean
function Player:RecoverinitialModel(ishost, objid) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param itemData any
---@return boolean
function Player:RefreshItemTips(uin, itemData) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itemid? string
---@param num any
---@return boolean
function Player:RemoveBackpackItem(objid, itemid, num) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param tags any
---@param icount any
---@return boolean
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
---@param index? number
function Player:RequestExchangeCoins(uin, conid, num, index) end

---官方环境独有接口（未收录于开发环境）
function Player:ResetTriggerGlobalData() end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param targetid any
---@return boolean
function Player:RotateFaceToActor(objid, targetid) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param able boolean
---@return boolean
function Player:SetAblePick(objid, able) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actionattr any
---@param switch any
---@return boolean
function Player:SetActionAttrState(objid, actionattr, switch) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param b boolean
---@return boolean
function Player:SetActorControl(objid, b) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param itype number
---@param value any
---@return boolean
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
---@return boolean
function Player:SetAttr(objid, attrtype, val) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param targetid any
---@return boolean
function Player:SetBeHurtTarget(objid, targetid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param value boolean
---@return boolean
function Player:SetBehitDisable(objid, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId any
---@param scale any
---@return boolean
function Player:SetBodyEffectScale(objid, particleId, scale) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param filename any
---@param scale number
---@return boolean
function Player:SetBodyEffectScaleByFile(objid, filename, scale) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param particleId number | string
---@param offset? Mini.Vec3
---@param rot? Mini.Vec3
---@param scale? Mini.Vec3
---@return boolean
function Player:SetBodyParticleTransform(objid, particleId, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param varid string
---@param val any
---@return boolean
function Player:SetBtreeVarValue(objid, varid, val) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param lerpspeed number
---@return boolean
function Player:SetCameraLerpSpeed(playerid, lerpspeed) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param value boolean
---@return boolean
function Player:SetCanCollide(objid, value) end

---官方环境独有接口（未收录于开发环境）
---@param ishost any
---@param playerid any
---@param bThrow any
---@return boolean
function Player:SetCanThrow(ishost, playerid, bThrow) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
---@param ischarging boolean
---@return boolean
function Player:SetCharging(objid, slot, ischarging) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
---@param value number
---@return boolean
function Player:SetChargingValue(objid, slot, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
---@param max number
---@param num number
---@param maxnum number
---@param isauto boolean
---@return boolean
function Player:SetCharginginfo(objid, slot, max, num, maxnum, isauto) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actionattr number
---@param switch boolean
---@return boolean
function Player:SetCmpBaseState(objid, actionattr, switch) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param curnum number
---@param url any
---@param name any
---@param rsetdesc any
---@return boolean
function Player:SetCustomRevieInfo(uin, curnum, url, name, rsetdesc) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param visible any
---@return boolean
function Player:SetDeathFrameVisible(uin, visible) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x number
---@param y number
---@param z number
---@return boolean
function Player:SetFaceDirection(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param pitch number
---@return boolean
function Player:SetFacePitch(objid, pitch) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param yaw number
---@return boolean
function Player:SetFaceYaw(objid, yaw) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param firstsearch boolean
---@return boolean
function Player:SetFirstSearch(objid, firstsearch) end

---官方环境独有接口（未收录于开发环境）
---@param uin? any
---@param x any
---@param y any
---@param z any
---@return boolean
function Player:SetFishLineEndPoint(uin, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param foodLevel any
---@return boolean
function Player:SetFoodLevel(objid, foodLevel) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param score number
---@return boolean
function Player:SetGameScore(objid, score) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param animtype? any
---@param animid any
---@param speed any
---@return boolean
function Player:SetHandOrToolAnimSpeed(uin, animtype, animid, speed) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param immunetype number
---@param isadd boolean
---@return boolean
function Player:SetImmuneType(objid, immunetype, isadd) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param attrtype number
---@param value number
---@return boolean
function Player:SetModAttrib(objid, attrtype, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x number
---@param y number
---@param z number
---@return boolean
function Player:SetMotionChange(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param isRote any
---@param isPlayerContrl any
---@param isCloseAI any
function Player:SetMountActorAttr(objid, isRote, isPlayerContrl, isCloseAI) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param nickname string
---@return boolean
function Player:SetNickName(objid, nickname) end

---官方环境独有接口（未收录于开发环境）
---@param ishost any
---@param uin? any
---@param flag any
---@return boolean
function Player:SetNoClip(ishost, uin, flag) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
---@return boolean
function Player:SetOrientation(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param val number
---@return boolean
function Player:SetOverlayGravity(objid, val) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param bvisible any
---@param hidepto any
function Player:SetPolaroidViewVisible(playerid, bvisible, hidepto) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param x number
---@param y number
---@param z number
---@return boolean
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
---@return boolean
function Player:SetScale(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
---@param maxcd number
---@param isauto boolean
---@return boolean
function Player:SetSkillCDInfo(objid, slot, maxcd, isauto) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param bOpen boolean
---@return boolean
function Player:SetTaskTraceVisible(uin, bOpen) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param teamid any
---@param resetAttr? boolean
---@return boolean
function Player:SetTeam(objid, teamid, resetAttr) end

---官方环境独有接口（未收录于开发环境）
---@param ishost any
---@param uin number
---@param attr number
---@param disable boolean
---@return boolean
function Player:SetTriggerOperateDisable(ishost, uin, attr, disable) end

---官方环境独有接口（未收录于开发环境）
---@param uin? any
---@param bShow? boolean
---@return boolean
function Player:ShowFishLine(uin, bShow) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param bshow? boolean
---@return boolean
function Player:ShowNickName(objid, bshow) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
---@return boolean?
function Player:SkillIsCharging(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Player:StopAllAnim(objid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param id any
---@return boolean
function Player:StopAnimById(playerid, id) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itype number | string
---@return boolean
function Player:StopBodyEffect(objid, itype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId number | string
---@return boolean
function Player:StopBodyEffectById(objid, particleId) end

---官方环境独有接口（未收录于开发环境）
---@param uin? any
---@param animid any
---@return boolean
function Player:StopHandAnim(uin, animid) end

---官方环境独有接口（未收录于开发环境）
---@param uin? any
---@param animid any
---@return boolean
function Player:StopHandToolAnim(uin, animid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param soundId number
---@return boolean
function Player:StopSoundEffectById(objid, soundId) end

---官方环境独有接口（未收录于开发环境）
---@param ishost any
---@param playerid any
---@param customuievent string
---@return boolean
function Player:SyncTriggerData(ishost, playerid, customuievent) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Player:TeleportHome(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param atttype any
---@param val any
---@return boolean
function Player:TriggerAttrChangeEvent(objid, atttype, val) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param skillName string
---@param growPatchName? string
---@return boolean
function Player:TriggerSkillCall(objid, skillName, growPatchName) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param targetObjid number
---@param speed number
---@return boolean
function Player:TryMoveToActor(objid, targetObjid, speed) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param x number
---@param y number
---@param z number
---@return boolean
function Player:TryMoveToNoSearch(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param x number
---@param y number
---@param z number
---@param cancontrol boolean
---@param bshowtip boolean
---@return boolean
function Player:TryMoveToPos(objid, x, y, z, cancontrol, bshowtip) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param distance number
---@return boolean
function Player:TryPickupActorForward(objid, distance) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param _type any
---@param target1 any
---@param target2 any
---@param goalnum any
---@return boolean
function Player:UpdateMainTaskForMod(uin, _type, target1, target2, goalnum) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param skillid any
function Player:WhitList_StopSkill(objid, skillid) end
