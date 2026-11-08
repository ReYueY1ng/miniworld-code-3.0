---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Monster<br>
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
---@param hp number
---@return boolean
function Monster:AddHp(objid, hp) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param attrtype number
---@param value number
---@return boolean
function Monster:AddModAttrib(objid, attrtype, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param tags any
---@param icount any
---@return boolean
function Monster:AddTags(objid, tags, icount) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param vx number
---@param vy number
---@param vz number
---@return boolean
function Monster:AppendSpeed(objid, vx, vy, vz) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Monster:AquaticMobAISet(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param moveMode number
---@return boolean
function Monster:ChangActorMoveType(objid, moveMode) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param modleName? any
---@return boolean
function Monster:ChangeCustomModel(objid, modleName) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param treeid any
function Monster:ChangeTree(objid, treeid) end

---官方环境独有接口（未收录于开发环境）
---@param actor any
function Monster:CheckSyncAction(actor) end

---官方环境独有接口（未收录于开发环境）
---@param actorid? number | string
---@param bkill? boolean
---@param worldId any
---@return boolean
function Monster:ClearActorWithId(actorid, bkill, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Monster:ClearTags(objid) end

---官方环境独有接口（未收录于开发环境）
---@param facade1 string
---@param facade2 string
---@return boolean
function Monster:CompareMainModel(facade1, facade2) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Monster:DisMountActor(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param dir Mini.Vec3
---@param isThrow boolean
---@param speed number
---@param hasInertance boolean
---@return boolean
function Monster:DropActor(objid, dir, isThrow, speed, hasInertance) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param emitid number
---@return boolean
function Monster:EmitByShooter(objid, emitid) end

---官方环境独有接口（未收录于开发环境）
---@param objidA number
---@param emitid number
---@param objidB number
---@return boolean
function Monster:EmitByShooterTarget(objidA, emitid, objidB) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param emitid number
---@param targetPos any
---@return boolean
function Monster:EmitByShooterTargetPos(objid, emitid, targetPos) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Monster:EscapePickup(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param blockid? string
---@param blockRange number
function Monster:FindLevelNearestBlock(objid, blockid, blockRange) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param blockid? string
---@param blockRange number
function Monster:FindLevelRandomsortBlock(objid, blockid, blockRange) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param blockid number | string
---@param blockRange number
function Monster:FindNearestBlock(objid, blockid, blockRange) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param actionattr number
function Monster:GetActionAttrState(objid, actionattr) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param itype number
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
---@param objid? any
---@param atttype number
function Monster:GetAttr(objid, atttype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param bodySizeType any
function Monster:GetBodySize(objid, bodySizeType) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
function Monster:GetBoundSzie(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param varid string
function Monster:GetBtreeVarValue(objid, varid) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
function Monster:GetChargingMaxNum(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
function Monster:GetChargingMaxTime(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
function Monster:GetChargingNum(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
function Monster:GetChargingTime(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actionattr number
---@return boolean
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
---@return table?
function Monster:GetFaceDirection(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
function Monster:GetFacePitch(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
function Monster:GetFaceYaw(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetGunInfo(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetItemId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return number
function Monster:GetLastFallSpeed(objid) end

---官方环境独有接口（未收录于开发环境）
function Monster:GetLevelMode() end

---官方环境独有接口（未收录于开发环境）
---@param facade string
---@return string?
function Monster:GetMainModel(facade) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetMaxHP(objid) end

---官方环境独有接口（未收录于开发环境）
---@param actorid? number | string
function Monster:GetMonsterDefDesc(actorid) end

---官方环境独有接口（未收录于开发环境）
---@param monsterid? string
function Monster:GetMonsterIcon(monsterid) end

---官方环境独有接口（未收录于开发环境）
---@param actorid? number | string
function Monster:GetMonsterMass(actorid) end

---官方环境独有接口（未收录于开发环境）
---@param monsterid? string
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
---@return number
function Monster:GetObjWorldId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetOrientation(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
function Monster:GetOverlayGravity(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param roleType any
---@return number
function Monster:GetPickupObjID(objid, roleType) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetPosition(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return number
function Monster:GetRidingActorObjId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
function Monster:GetSkillCD(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
function Monster:GetSkillMaxCD(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:GetTeam(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Monster:GetTickForever(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Monster:HasActor(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param tags any
---@param mathcmode number
---@param bexactmatch boolean
---@return boolean
function Monster:HasTags(objid, tags, mathcmode, bexactmatch) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param atttype any
---@param val number
---@return boolean
function Monster:IncreasesAttr(objid, atttype, val) end

---官方环境独有接口（未收录于开发环境）
function Monster:InitTriggerGlobalData() end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Monster:IsExist(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
---@return boolean?
function Monster:IsHaveSkill(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Monster:IsMob(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Monster:IsPlayer(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Monster:Jump(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Monster:KillSelf(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param rideobjid any
---@param isContrl boolean
---@param isCloseAI boolean
---@return boolean
function Monster:MountActor(objid, rideobjid, isContrl, isCloseAI) end

---官方环境独有接口（未收录于开发环境）
function Monster:OrganizeFacadeList() end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param soundId number
---@param pause boolean
---@return boolean
function Monster:PauseSoundEffectById(objid, soundId, pause) end

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
function Monster:PickupActor(objidA, objidB, actionA, actionB, offest, rotate, playemode, playspeed, anchorId) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param itemobjid number
---@param bforcepickup? boolean
---@return number
function Monster:PickupItem(objid, itemobjid, bforcepickup) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actid number
---@return boolean
function Monster:PlayAct(objid, actid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param animid any
---@param speed any
---@param loop number | boolean
---@return boolean
function Monster:PlayAnim(objid, animid, speed, loop) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param animid any
---@param inputloopmode any
---@param playLayer any
---@param crossfade any
---@return boolean
function Monster:PlayAnimById(objid, animid, inputloopmode, playLayer, crossfade) end

---官方环境独有接口（未收录于开发环境）
---@param objidA number
---@param objidB number
---@param breplay any
---@return boolean
function Monster:PlayAnimByObj(objidA, objidB, breplay) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itype number | string
---@return boolean
function Monster:PlayBodyEffect(objid, itype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param filename string
---@param sync? boolean
---@return boolean
function Monster:PlayBodyEffectByFile(objid, filename, sync) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId any
---@param scale? number
---@param ptme any
---@return boolean
function Monster:PlayBodyEffectById(objid, particleId, scale, ptme) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId number | string
---@param ptme number
---@param offset? Mini.Vec3
---@param rot? Mini.Vec3
---@param scale? Mini.Vec3
---@return boolean
function Monster:PlayBodyParticleById(objid, particleId, ptme, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param animid any
---@param speed any
---@param loop number | boolean
---@return boolean
function Monster:PlayHandAnim(objid, animid, speed, loop) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
---@return boolean
function Monster:PlaySkill(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param name string
---@param volume number
---@param pitch number
---@param flag number
---@return boolean
function Monster:PlaySoundByName(objid, name, volume, pitch, flag) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param soundId number
---@param volume number
---@param pitch number
---@param isLoop boolean
---@return boolean
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
---@param objid? any
---@return boolean
function Monster:RecoverinitialModel(ishost, objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param tags any
---@param icount any
---@return boolean
function Monster:RemoveTags(objid, tags, icount) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param targetid any
---@return boolean
function Monster:RotateFaceToActor(objid, targetid) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param able boolean
---@return boolean
function Monster:SetAblePick(objid, able) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actionattr number
---@param switch boolean
---@return boolean
function Monster:SetActionAttrState(objid, actionattr, switch) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param b boolean
---@return boolean
function Monster:SetActorControl(objid, b) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param itype number
---@param value any
---@return boolean
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
---@return boolean
function Monster:SetAttr(objid, atttype, val) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param targetid any
---@return boolean
function Monster:SetBeHurtTarget(objid, targetid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param value boolean
---@return boolean
function Monster:SetBehitDisable(objid, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId any
---@param scale any
---@return boolean
function Monster:SetBodyEffectScale(objid, particleId, scale) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param filename any
---@param scale number
---@return boolean
function Monster:SetBodyEffectScaleByFile(objid, filename, scale) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param particleId number | string
---@param offset? Mini.Vec3
---@param rot? Mini.Vec3
---@param scale? Mini.Vec3
---@return boolean
function Monster:SetBodyParticleTransform(objid, particleId, offset, rot, scale) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param varid string
---@param val any
---@return boolean
function Monster:SetBtreeVarValue(objid, varid, val) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param value boolean
---@return boolean
function Monster:SetCanCollide(objid, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
---@param ischarging boolean
---@return boolean
function Monster:SetCharging(objid, slot, ischarging) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
---@param value number
---@return boolean
function Monster:SetChargingValue(objid, slot, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
---@param max number
---@param num number
---@param maxnum number
---@param isauto boolean
---@return boolean
function Monster:SetCharginginfo(objid, slot, max, num, maxnum, isauto) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actionattr number
---@param switch boolean
---@return boolean
function Monster:SetCmpBaseState(objid, actionattr, switch) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x number
---@param y number
---@param z number
---@return boolean
function Monster:SetFaceDirection(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param pitch number
---@return boolean
function Monster:SetFacePitch(objid, pitch) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param yaw number
---@return boolean
function Monster:SetFaceYaw(objid, yaw) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param firstsearch boolean
---@return boolean
function Monster:SetFirstSearch(objid, firstsearch) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param immunetype number
---@param isadd boolean
---@return boolean
function Monster:SetImmuneType(objid, immunetype, isadd) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param attrtype number
---@param value number
---@return boolean
function Monster:SetModAttrib(objid, attrtype, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x number
---@param y number
---@param z number
---@return boolean
function Monster:SetMotionChange(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param isRote any
---@param isPlayerContrl any
---@param isCloseAI any
function Monster:SetMountActorAttr(objid, isRote, isPlayerContrl, isCloseAI) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param nickname string
---@return boolean
function Monster:SetNickName(objid, nickname) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
---@return boolean
function Monster:SetOrientation(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param val number
---@return boolean
function Monster:SetOverlayGravity(objid, val) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param x number
---@param y number
---@param z number
---@return boolean
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
---@return boolean
function Monster:SetScale(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
---@param cd number
---@return boolean
function Monster:SetSkillCD(objid, slot, cd) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
---@param maxcd number
---@param isauto boolean
---@return boolean
function Monster:SetSkillCDInfo(objid, slot, maxcd, isauto) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param teamid any
---@param bResetAttr? boolean
---@return boolean
function Monster:SetTeam(objid, teamid, bResetAttr) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param tickForever any
---@return boolean
function Monster:SetTickForever(objid, tickForever) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param bshow? boolean
---@return boolean
function Monster:ShowNickName(objid, bshow) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param slot number
---@return boolean?
function Monster:SkillIsCharging(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Monster:StopAllAnim(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itype number | string
---@return boolean
function Monster:StopBodyEffect(objid, itype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param particleId number | string
---@return boolean
function Monster:StopBodyEffectById(objid, particleId) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param soundId number
---@return boolean
function Monster:StopSoundEffectById(objid, soundId) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param atttype any
---@param val any
---@return boolean
function Monster:TriggerAttrChangeEvent(objid, atttype, val) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param skillName string
---@param growPatchName? string
---@return boolean
function Monster:TriggerSkillCall(objid, skillName, growPatchName) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param targetObjid number
---@param speed number
---@return boolean
function Monster:TryMoveToActor(objid, targetObjid, speed) end

---官方环境独有接口（未收录于开发环境）
---@param objid? any
---@param x number
---@param y number
---@param z number
---@return boolean
function Monster:TryMoveToNoSearch(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid number
---@param x number
---@param y number
---@param z number
---@param cancontrol boolean
---@param bshowtip boolean
---@return boolean
function Monster:TryMoveToPos(objid, x, y, z, cancontrol, bshowtip) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param distance number
---@return boolean
function Monster:TryPickupActorForward(objid, distance) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param skillid any
function Monster:WhitList_StopSkill(objid, skillid) end

---官方环境独有接口（未收录于开发环境）
---@param varmgr any
function Monster:_GenVarids(varmgr) end
