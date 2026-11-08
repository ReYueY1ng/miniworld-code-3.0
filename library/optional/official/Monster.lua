---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Monster<br>
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
function Monster:ActorHurt(objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param areaid any
---@param damage any
---@param attacktype any
---@param ignoreList any
---@param ignoreResist any
---@param ignoreTriggerEvent any
function Monster:ActorHurtArea(objid, areaid, damage, attacktype, ignoreList, ignoreResist, ignoreTriggerEvent) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param hp any
function Monster:AddHp(objid, hp) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param attrtype any
---@param value any
function Monster:AddModAttrib(objid, attrtype, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param tags any
---@param icount any
function Monster:AddTags(objid, tags, icount) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param vx any
---@param vy any
---@param vz any
function Monster:AppendSpeed(objid, vx, vy, vz) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:AquaticMobAISet(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param moveMode any
function Monster:ChangActorMoveType(objid, moveMode) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param modleName any
function Monster:ChangeCustomModel(objid, modleName) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param treeid any
function Monster:ChangeTree(objid, treeid) end

---官方环境独有接口（未收录于开发环境）
---@param actor any
function Monster:CheckSyncAction(actor) end

---官方环境独有接口（未收录于开发环境）
---@param actorid any
---@param bkill any
---@param worldId any
function Monster:ClearActorWithId(actorid, bkill, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:ClearTags(objid) end

---官方环境独有接口（未收录于开发环境）
---@param facade1 any
---@param facade2 any
function Monster:CompareMainModel(facade1, facade2) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:DisMountActor(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param dir any
---@param isThrow any
---@param speed any
---@param hasInertance any
function Monster:DropActor(objid, dir, isThrow, speed, hasInertance) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param emitid any
function Monster:EmitByShooter(objid, emitid) end

---官方环境独有接口（未收录于开发环境）
---@param objidA any
---@param emitid any
---@param objidB any
function Monster:EmitByShooterTarget(objidA, emitid, objidB) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param emitid any
---@param targetPos any
function Monster:EmitByShooterTargetPos(objid, emitid, targetPos) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:EscapePickup(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param blockid any
---@param blockRange any
function Monster:FindLevelNearestBlock(objid, blockid, blockRange) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param blockid any
---@param blockRange any
function Monster:FindLevelRandomsortBlock(objid, blockid, blockRange) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param blockid any
---@param blockRange any
function Monster:FindNearestBlock(objid, blockid, blockRange) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actionattr any
function Monster:GetActionAttrState(objid, actionattr) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itype any
function Monster:GetActorDir(objid, itype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param bhasequip any
function Monster:GetActorFacade(objid, bhasequip) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetActorMovementMode(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param ability any
function Monster:GetActorPermissions(objid, ability) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param atttype any
function Monster:GetAttr(objid, atttype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param bodySizeType any
function Monster:GetBodySize(objid, bodySizeType) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetBoundSzie(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param varid any
function Monster:GetBtreeVarValue(objid, varid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Monster:GetChargingMaxNum(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Monster:GetChargingMaxTime(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Monster:GetChargingNum(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Monster:GetChargingTime(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actionattr any
function Monster:GetCmpBaseState(objid, actionattr) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetCurMapId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetCurrMapId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetDefID(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetDropItemInstanceId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetDropItemNum(objid) end

---官方环境独有接口（未收录于开发环境）
---@param prefab any
function Monster:GetEntityFacade(prefab) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetEyeHeight(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetFaceDirection(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetFacePitch(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetFaceYaw(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetGunInfo(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetItemId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetLastFallSpeed(objid) end

---官方环境独有接口（未收录于开发环境）
function Monster:GetLevelMode() end

---官方环境独有接口（未收录于开发环境）
---@param facade any
function Monster:GetMainModel(facade) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetMaxHP(objid) end

---官方环境独有接口（未收录于开发环境）
---@param actorid any
function Monster:GetMonsterDefDesc(actorid) end

---官方环境独有接口（未收录于开发环境）
---@param monsterid any
function Monster:GetMonsterIcon(monsterid) end

---官方环境独有接口（未收录于开发环境）
---@param actorid any
function Monster:GetMonsterMass(actorid) end

---官方环境独有接口（未收录于开发环境）
---@param monsterid any
function Monster:GetMonsterType(monsterid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetMotion(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetNickName(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetObjType(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetObjWorldId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetOrientation(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetOverlayGravity(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param roleType any
function Monster:GetPickupObjID(objid, roleType) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetPosition(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetRidingActorObjId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Monster:GetSkillCD(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Monster:GetSkillMaxCD(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetTeam(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetTickForever(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:HasActor(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param tags any
---@param mathcmode any
---@param bexactmatch any
function Monster:HasTags(objid, tags, mathcmode, bexactmatch) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param atttype any
---@param val any
function Monster:IncreasesAttr(objid, atttype, val) end

---官方环境独有接口（未收录于开发环境）
function Monster:InitTriggerGlobalData() end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:IsExist(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Monster:IsHaveSkill(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:IsMob(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:IsPlayer(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:Jump(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:KillSelf(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param rideobjid any
---@param isContrl any
---@param isCloseAI any
function Monster:MountActor(objid, rideobjid, isContrl, isCloseAI) end

---官方环境独有接口（未收录于开发环境）
function Monster:OrganizeFacadeList() end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param soundId any
---@param pause any
function Monster:PauseSoundEffectById(objid, soundId, pause) end

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
function Monster:PickupActor(objidA, objidB, actionA, actionB, offest, rotate, playemode, playspeed, anchorId) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itemobjid any
---@param bforcepickup any
function Monster:PickupItem(objid, itemobjid, bforcepickup) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actid any
function Monster:PlayAct(objid, actid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param animid any
---@param speed any
---@param loop any
function Monster:PlayAnim(objid, animid, speed, loop) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param animid any
---@param inputloopmode any
---@param playLayer any
---@param crossfade any
function Monster:PlayAnimById(objid, animid, inputloopmode, playLayer, crossfade) end

---官方环境独有接口（未收录于开发环境）
---@param objidA any
---@param objidB any
---@param breplay any
function Monster:PlayAnimByObj(objidA, objidB, breplay) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itype any
function Monster:PlayBodyEffect(objid, itype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param filename any
---@param sync any
function Monster:PlayBodyEffectByFile(objid, filename, sync) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId any
---@param scale any
---@param ptme any
function Monster:PlayBodyEffectById(objid, particleId, scale, ptme) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId any
---@param ptme any
---@param offset any
---@param rot any
---@param scale any
function Monster:PlayBodyParticleById(objid, particleId, ptme, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param animid any
---@param speed any
---@param loop any
function Monster:PlayHandAnim(objid, animid, speed, loop) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Monster:PlaySkill(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param name any
---@param volume any
---@param pitch any
---@param flag any
function Monster:PlaySoundByName(objid, name, volume, pitch, flag) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param soundId any
---@param volume any
---@param pitch any
---@param isLoop any
function Monster:PlaySoundEffectById(objid, soundId, volume, pitch, isLoop) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param targetid any
---@param damage any
---@param attacktype any
---@param ignoreResist any
---@param ignoreTriggerEvent any
function Monster:PlayerHurt(objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end

---官方环境独有接口（未收录于开发环境）
function Monster:RandomFacadeID() end

---官方环境独有接口（未收录于开发环境）
function Monster:RandomName() end

---官方环境独有接口（未收录于开发环境）
---@param ishost any
---@param objid any
function Monster:RecoverinitialModel(ishost, objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param tags any
---@param icount any
function Monster:RemoveTags(objid, tags, icount) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param targetid any
function Monster:RotateFaceToActor(objid, targetid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param able any
function Monster:SetAblePick(objid, able) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actionattr any
---@param switch any
function Monster:SetActionAttrState(objid, actionattr, switch) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param b any
function Monster:SetActorControl(objid, b) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itype any
---@param value any
function Monster:SetActorDir(objid, itype, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param ability any
---@param switch any
function Monster:SetActorPermissions(objid, ability, switch) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param atttype any
---@param val any
function Monster:SetAttr(objid, atttype, val) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param targetid any
function Monster:SetBeHurtTarget(objid, targetid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param value any
function Monster:SetBehitDisable(objid, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId any
---@param scale any
function Monster:SetBodyEffectScale(objid, particleId, scale) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param filename any
---@param scale any
function Monster:SetBodyEffectScaleByFile(objid, filename, scale) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId any
---@param offset any
---@param rot any
---@param scale any
function Monster:SetBodyParticleTransform(objid, particleId, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param varid any
---@param val any
function Monster:SetBtreeVarValue(objid, varid, val) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param value any
function Monster:SetCanCollide(objid, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
---@param ischarging any
function Monster:SetCharging(objid, slot, ischarging) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
---@param value any
function Monster:SetChargingValue(objid, slot, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
---@param max any
---@param num any
---@param maxnum any
---@param isauto any
function Monster:SetCharginginfo(objid, slot, max, num, maxnum, isauto) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actionattr any
---@param switch any
function Monster:SetCmpBaseState(objid, actionattr, switch) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Monster:SetFaceDirection(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param pitch any
function Monster:SetFacePitch(objid, pitch) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param yaw any
function Monster:SetFaceYaw(objid, yaw) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param firstsearch any
function Monster:SetFirstSearch(objid, firstsearch) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param immunetype any
---@param isadd any
function Monster:SetImmuneType(objid, immunetype, isadd) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param attrtype any
---@param value any
function Monster:SetModAttrib(objid, attrtype, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Monster:SetMotionChange(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param isRote any
---@param isPlayerContrl any
---@param isCloseAI any
function Monster:SetMountActorAttr(objid, isRote, isPlayerContrl, isCloseAI) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param nickname any
function Monster:SetNickName(objid, nickname) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Monster:SetOrientation(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param val any
function Monster:SetOverlayGravity(objid, val) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Monster:SetPosition(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Monster:SetRidePosition(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Monster:SetScale(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
---@param cd any
function Monster:SetSkillCD(objid, slot, cd) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
---@param maxcd any
---@param isauto any
function Monster:SetSkillCDInfo(objid, slot, maxcd, isauto) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param teamid any
---@param bResetAttr any
function Monster:SetTeam(objid, teamid, bResetAttr) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param tickForever any
function Monster:SetTickForever(objid, tickForever) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param bshow any
function Monster:ShowNickName(objid, bshow) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Monster:SkillIsCharging(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:StopAllAnim(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itype any
function Monster:StopBodyEffect(objid, itype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId any
function Monster:StopBodyEffectById(objid, particleId) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param soundId any
function Monster:StopSoundEffectById(objid, soundId) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param atttype any
---@param val any
function Monster:TriggerAttrChangeEvent(objid, atttype, val) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param skillName any
---@param growPatchName any
function Monster:TriggerSkillCall(objid, skillName, growPatchName) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param targetObjid any
---@param speed any
function Monster:TryMoveToActor(objid, targetObjid, speed) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Monster:TryMoveToNoSearch(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
---@param cancontrol any
---@param bshowtip any
function Monster:TryMoveToPos(objid, x, y, z, cancontrol, bshowtip) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param distance any
function Monster:TryPickupActorForward(objid, distance) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param skillid any
function Monster:WhitList_StopSkill(objid, skillid) end

---官方环境独有接口（未收录于开发环境）
---@param varmgr any
function Monster:_GenVarids(varmgr) end
