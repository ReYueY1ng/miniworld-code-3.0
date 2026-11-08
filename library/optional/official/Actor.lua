---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Actor<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param areaid any
---@param damage any
---@param attacktype any
---@param ignoreList any
---@param ignoreResist any
---@param ignoreTriggerEvent any
function Actor:ActorHurtArea(objid, areaid, damage, attacktype, ignoreList, ignoreResist, ignoreTriggerEvent) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param attrtype any
---@param value any
function Actor:AddModAttrib(objid, attrtype, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param blockid any
---@param blockRange any
function Actor:FindLevelNearestBlock(objid, blockid, blockRange) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param blockid any
---@param blockRange any
function Actor:FindLevelRandomsortBlock(objid, blockid, blockRange) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param bodySizeType any
function Actor:GetBodySize(objid, bodySizeType) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Actor:GetChargingMaxNum(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Actor:GetChargingMaxTime(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Actor:GetChargingNum(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Actor:GetChargingTime(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Actor:GetCurrMapId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Actor:GetGunInfo(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Actor:GetLastFallSpeed(objid) end

---官方环境独有接口（未收录于开发环境）
function Actor:GetLevelMode() end

---官方环境独有接口（未收录于开发环境）
---@param facade any
function Actor:GetMainModel(facade) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Actor:GetOrientation(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Actor:GetOverlayGravity(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Actor:GetSkillCD(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Actor:GetSkillMaxCD(objid, slot) end

---官方环境独有接口（未收录于开发环境）
function Actor:InitTriggerGlobalData() end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Actor:IsHaveSkill(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Actor:IsMob(objid) end

---官方环境独有接口（未收录于开发环境）
function Actor:OrganizeFacadeList() end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param actid any
function Actor:PlayAct(objid, actid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param animid any
---@param inputloopmode any
---@param playLayer any
---@param crossfade any
function Actor:PlayAnimById(objid, animid, inputloopmode, playLayer, crossfade) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itype any
function Actor:PlayBodyEffect(objid, itype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param filename any
---@param sync any
function Actor:PlayBodyEffectByFile(objid, filename, sync) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Actor:PlaySkill(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param name any
---@param volume any
---@param pitch any
---@param flag any
function Actor:PlaySoundByName(objid, name, volume, pitch, flag) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param targetid any
---@param damage any
---@param attacktype any
---@param ignoreResist any
---@param ignoreTriggerEvent any
function Actor:PlayerHurt(objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param b any
function Actor:SetActorControl(objid, b) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itype any
---@param value any
function Actor:SetActorDir(objid, itype, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param value any
function Actor:SetBehitDisable(objid, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param filename any
---@param scale any
function Actor:SetBodyEffectScaleByFile(objid, filename, scale) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param value any
function Actor:SetCanCollide(objid, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
---@param ischarging any
function Actor:SetCharging(objid, slot, ischarging) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
---@param value any
function Actor:SetChargingValue(objid, slot, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
---@param max any
---@param num any
---@param maxnum any
---@param isauto any
function Actor:SetCharginginfo(objid, slot, max, num, maxnum, isauto) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param firstsearch any
function Actor:SetFirstSearch(objid, firstsearch) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param attrtype any
---@param value any
function Actor:SetModAttrib(objid, attrtype, value) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Actor:SetMotionChange(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Actor:SetOrientation(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param val any
function Actor:SetOverlayGravity(objid, val) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Actor:SetRidePosition(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Actor:SetScale(objid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
---@param cd any
function Actor:SetSkillCD(objid, slot, cd) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
---@param maxcd any
---@param isauto any
function Actor:SetSkillCDInfo(objid, slot, maxcd, isauto) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param slot any
function Actor:SkillIsCharging(objid, slot) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Actor:StopAllAnim(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param itype any
function Actor:StopBodyEffect(objid, itype) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param atttype any
---@param val any
function Actor:TriggerAttrChangeEvent(objid, atttype, val) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
function Actor:TryMoveToNoSearch(objid, x, y, z) end
