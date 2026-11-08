---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· World<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param iconName any
---@param name any
---@param x any
---@param z any
---@param level any
---@param trace any
---@param des any
---@param desColor any
---@param iconMask any
---@param desc any
---@param type any
function World:AddCustomMarker(uin, iconName, name, x, z, level, trace, des, desColor, iconMask, desc, type) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
---@param msgSubId any
---@param mapid any
---@param content any
function World:BroadcastModBlockDataEx(x, y, z, msgSubId, mapid, content) end

---官方环境独有接口（未收录于开发环境）
---@param mapid any
---@param x any
---@param y any
---@param z any
function World:CheckBlockIsReplaceable(mapid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param callback any
---@param activatename any
function World:CheckSummerActActivate(callback, activatename) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param iconName any
function World:ClearCustomMarkerByResName(uin, iconName) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
function World:CloseStorageBoxFrame(uin) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param x any
---@param y any
---@param z any
---@param explosionRadius any
---@param flaming any
---@param smoking any
---@param dirmask any
---@param damageType any
function World:CreateExplosion(objid, x, y, z, explosionRadius, flaming, smoking, dirmask, damageType) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
---@param radius any
---@param upHalf any
---@param atkValue any
---@param isDestroyBlock any
function World:CreateExplosionNew(x, y, z, radius, upHalf, atkValue, isDestroyBlock) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param iconName any
---@param name any
---@param x any
---@param z any
---@param level any
function World:DelCustomMarker(uin, iconName, name, x, z, level) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param iconName any
---@param name any
---@param x any
---@param z any
---@param level any
---@param trace any
---@param des any
---@param desColor any
---@param iconMask any
---@param desc any
---@param type any
function World:EditCustomMarker(uin, iconName, name, x, z, level, trace, des, desColor, iconMask, desc, type) end

---官方环境独有接口（未收录于开发环境）
---@param centerX any
---@param centerY any
---@param centerZ any
---@param radius any
---@param defId any
---@param worldId any
function World:FindNearActorListByDefId(centerX, centerY, centerZ, radius, defId, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param centerX any
---@param centerY any
---@param centerZ any
---@param radius any
---@param team any
---@param worldId any
function World:FindNearActorListByTeam(centerX, centerY, centerZ, radius, team, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param centerX any
---@param centerY any
---@param centerZ any
---@param radius any
---@param includeCenterPos any
---@param worldId any
function World:FindNearCanSpawnMobPosList(centerX, centerY, centerZ, radius, includeCenterPos, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param posX any
---@param posY any
---@param posZ any
---@param radius any
---@param defId any
---@param worldId any
function World:FindNearestActorByDefId(posX, posY, posZ, radius, defId, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param biomeId any
function World:GetBiomeDesc(biomeId) end

---官方环境独有接口（未收录于开发环境）
function World:GetCurrMapId() end

---官方环境独有接口（未收录于开发环境）
---@param iview any
function World:GetInnerViewEnable(iview) end

---官方环境独有接口（未收录于开发环境）
function World:GetLoginSvrTime() end

---官方环境独有接口（未收录于开发环境）
function World:GetMainPlayerPos() end

---官方环境独有接口（未收录于开发环境）
function World:GetMidJoin() end

---官方环境独有接口（未收录于开发环境）
---@param key any
function World:GetMiniMapFlagPos(key) end

---官方环境独有接口（未收录于开发环境）
---@param worldId any
---@param cmpName any
function World:GetPlanetComponent(worldId, cmpName) end

---官方环境独有接口（未收录于开发环境）
function World:GetServerTimeMs() end

---官方环境独有接口（未收录于开发环境）
---@param time any
function World:GetSkyBoxtime(time) end

---官方环境独有接口（未收录于开发环境）
---@param dt any
function World:GetSnapshot(dt) end

---官方环境独有接口（未收录于开发环境）
---@param stBlockPos any
---@param bCreateActorTree any
function World:GetTreeModel(stBlockPos, bCreateActorTree) end

---官方环境独有接口（未收录于开发环境）
---@param stBlockPosList any
---@param bCreateActorTree any
function World:GetTreeModelMod(stBlockPosList, bCreateActorTree) end

---官方环境独有接口（未收录于开发环境）
function World:GetWorldid() end

---官方环境独有接口（未收录于开发环境）
---@param info any
---@param objids any
function World:NotifyGameInfo2All(info, objids) end

---官方环境独有接口（未收录于开发环境）
---@param content any
function World:ReceiveModBlockDataEx(content) end

---官方环境独有接口（未收录于开发环境）
---@param content any
function World:RegisterMatchTeleport(content) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param mapid any
---@param srcGateId any
function World:SendToClientOpenTransferStationUI(playerid, mapid, srcGateId) end

---官方环境独有接口（未收录于开发环境）
---@param value any
---@param worldId any
function World:SetIsCreateSnow(value, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param cfg any
function World:SetMapIconSettingCfg(cfg) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param fileName any
---@param needShare any
function World:SetPicAndShare(uin, fileName, needShare) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param itype any
---@param value any
function World:SetSkyBoxFilterForMod(playerid, itype, value) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param itype any
---@param value any
---@param worldId any
function World:SetSkyBoxFilterSwitch(playerid, itype, value, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param wtype any
function World:SetWeatherType(wtype) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param mapid any
---@param srcGateId any
function World:ShowTransferView(playerid, mapid, srcGateId) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param needShare any
function World:SnapShortAndOpenShareFrame(uin, needShare) end

---官方环境独有接口（未收录于开发环境）
---@param w any
---@param h any
function World:Snapshot(w, h) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
---@param itemid any
---@param worldId any
function World:SpawnEquipOrGun(x, y, z, itemid, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
---@param itemid any
---@param num any
---@param worldId any
function World:SpawnItem(x, y, z, itemid, num, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param playerUin any
---@param toUin any
function World:UseTransferTo(playerUin, toUin) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
function World:getChunkRandomSpawnPos(x, y, z) end
