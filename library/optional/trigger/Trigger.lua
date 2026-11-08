---@meta

---触发器 API（Trigger 命名空间）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量；全局接口请使用 World / Actor 等模块。
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger
---@field Actor Trigger.Actor 角色模块
---@field Area Trigger.Area 区域模块
---@field ArrayTmp Trigger.ArrayTmp 临时数组模块
---@field Backpack Trigger.Backpack 背包模块
---@field Block Trigger.Block 方块模块
---@field Buff Trigger.Buff 状态模块
---@field Component Trigger.Component 组件模块
---@field CustomUI Trigger.CustomUI 界面模块
---@field DisplayBoard Trigger.DisplayBoard 显示板模块
---@field GameObject Trigger.GameObject 对象模块
---@field Graphics Trigger.Graphics 图文信息模块
---@field Item Trigger.Item 道具模块
---@field KvMap Trigger.KvMap KV 表模块
---@field Math Trigger.Math 数学模块
---@field Monster Trigger.Monster 生物模块
---@field Player Trigger.Player 玩家模块
---@field Timeline Trigger.Timeline 时间轴模块
---@field World Trigger.World 世界模块
Trigger = {}

---@class Trigger.Actor
Trigger.Actor = {}

---触发器接口（环境表导出）
---@param doobj any
---@param data any
---@param value any
---@param itype any
function Trigger.Actor:ActorDoHurt(doobj, data, value, itype) end

---触发器接口（环境表导出）
---@param actorids any
---@param badd any
---@param tags any
---@param icount any
function Trigger.Actor:AddOrRemoveTags(actorids, badd, tags, icount) end

---触发器接口（环境表导出）
---@param data any
---@param dir any
---@param speed any
function Trigger.Actor:AppendSpeed(data, dir, speed) end

---触发器接口（环境表导出）
---@param data any
---@param moveType any
function Trigger.Actor:ChangActorMoveType(data, moveType) end

---触发器接口（环境表导出）
---@param data any
---@param modtype any
function Trigger.Actor:ChangeCustomModel(data, modtype) end

---触发器接口（环境表导出）
---@param objid any
---@param itype any
function Trigger.Actor:CheckActorType(objid, itype) end

---触发器接口（环境表导出）
---@param param any
---@param actor1Type any
---@param pickupType any
---@param actor2Type any
function Trigger.Actor:CheckPickupActionValid(param, actor1Type, pickupType, actor2Type) end

---触发器接口（环境表导出）
---@param objid any
---@param itype any
---@param ret any
function Trigger.Actor:CheckTargetActorType(objid, itype, ret) end

---触发器接口（环境表导出）
---@param killtype any
---@param actorids any
---@param worldId any
function Trigger.Actor:ClearActorWithId(killtype, actorids, worldId) end

---触发器接口（环境表导出）
---@param objid any
---@param movementMode any
function Trigger.Actor:CompareMovementMode(objid, movementMode) end

---触发器接口（环境表导出）
---@param data any
---@param team any
function Trigger.Actor:CompareTeam(data, team) end

---触发器接口（环境表导出）
---@param objid any
---@param blockid any
---@param blockRange any
function Trigger.Actor:FindNearestBlock(objid, blockid, blockRange) end

---触发器接口（环境表导出）
---@param obj any
---@param ix any
function Trigger.Actor:GetBoundSzie(obj, ix) end

---触发器接口（环境表导出）
---@param objid any
---@param treeId any
---@param varid any
function Trigger.Actor:GetBtreeVarValue(objid, treeId, varid) end

---触发器接口（环境表导出）
---@param objid any
---@param roleType any
function Trigger.Actor:GetPickupActorID(objid, roleType) end

---触发器接口（环境表导出）
---@param objid any
function Trigger.Actor:GetPosition(objid) end

---触发器接口（环境表导出）
---@param data any
function Trigger.Actor:GetProjectileShootMob(data) end

---触发器接口（环境表导出）
---@param data any
function Trigger.Actor:GetProjectileShootPlayer(data) end

---触发器接口（环境表导出）
---@param data any
---@param atttype any
---@param itype any
---@param val any
function Trigger.Actor:IncreasesAttr(data, atttype, itype, val) end

---触发器接口（环境表导出）
---@param data any
function Trigger.Actor:KillSelf(data) end

---触发器接口（环境表导出）
---@param objid any
---@param roletype any
function Trigger.Actor:ObjToAnyObj(objid, roletype) end

---触发器接口（环境表导出）
---@param data any
---@param musicId any
function Trigger.Actor:PaseOrResumeSoundEffectById(data, musicId) end

---触发器接口（环境表导出）
---@param data any
---@param musicId any
function Trigger.Actor:PauseSoundEffectById(data, musicId) end

---触发器接口（环境表导出）
---@param actorids any
---@param objidB any
function Trigger.Actor:PlayAnimByObj(actorids, objidB) end

---触发器接口（环境表导出）
---@param data any
---@param effectids any
---@param scale any
---@param ptme any
function Trigger.Actor:PlayBodyEffectById(data, effectids, scale, ptme) end

---触发器接口（环境表导出）
---@param data any
---@param effectids any
---@param ptme any
---@param offset any
---@param rot any
---@param scale any
function Trigger.Actor:PlayBodyParticleById(data, effectids, ptme, offset, rot, scale) end

---触发器接口（环境表导出）
---@param data any
---@param soundId any
---@param volume any
---@param pitch any
---@param isLoop any
function Trigger.Actor:PlaySoundEffectById(data, soundId, volume, pitch, isLoop) end

---触发器接口（环境表导出）
---@param data any
function Trigger.Actor:RecoverinitialModel(data) end

---触发器接口（环境表导出）
---@param data any
---@param vlues any
function Trigger.Actor:RemoveImmuneAttackType(data, vlues) end

---触发器接口（环境表导出）
---@param data any
---@param musicId any
function Trigger.Actor:ResumeSoundEffectById(data, musicId) end

---触发器接口（环境表导出）
---@param objid any
---@param roletype any
function Trigger.Actor:RoleToAnyObj(objid, roletype) end

---触发器接口（环境表导出）
---@param data any
---@param itype any
---@param value any
function Trigger.Actor:SetActorDir(data, itype, value) end

---触发器接口（环境表导出）
---@param data any
---@param atttype any
---@param val any
function Trigger.Actor:SetAttr(data, atttype, val) end

---触发器接口（环境表导出）
---@param data any
---@param effectids any
---@param size any
function Trigger.Actor:SetBodyEffectScale(data, effectids, size) end

---触发器接口（环境表导出）
---@param data any
---@param effectids any
---@param offset any
---@param rot any
---@param scale any
function Trigger.Actor:SetBodyParticleTransform(data, effectids, offset, rot, scale) end

---触发器接口（环境表导出）
---@param objid any
---@param treeId any
---@param varid any
---@param val any
function Trigger.Actor:SetBtreeVarValue(objid, treeId, varid, val) end

---触发器接口（环境表导出）
---@param data any
---@param attr any
---@param switch any
function Trigger.Actor:SetCmpBaseState(data, attr, switch) end

---触发器接口（环境表导出）
---@param data any
---@param facedir any
function Trigger.Actor:SetFaceDir(data, facedir) end

---触发器接口（环境表导出）
---@param data any
---@param value any
function Trigger.Actor:SetFaceYaw(data, value) end

---触发器接口（环境表导出）
---@param data any
---@param vlues any
function Trigger.Actor:SetImmuneAttackType(data, vlues) end

---触发器接口（环境表导出）
---@param data any
---@param nick any
function Trigger.Actor:SetNickName(data, nick) end

---触发器接口（环境表导出）
---@param data any
---@param position any
function Trigger.Actor:SetPosition(data, position) end

---触发器接口（环境表导出）
---@param data any
---@param teamid any
function Trigger.Actor:SetTeam(data, teamid) end

---触发器接口（环境表导出）
---@param data any
---@param effectids any
function Trigger.Actor:StopBodyEffectById(data, effectids) end

---触发器接口（环境表导出）
---@param data any
---@param soundId any
function Trigger.Actor:StopSoundEffectById(data, soundId) end

---触发器接口（环境表导出）
---@param objid any
---@param action any
---@param speed any
---@param dir any
---@param hasInertance any
function Trigger.Actor:TryInteractActor(objid, action, speed, dir, hasInertance) end

---触发器接口（环境表导出）
---@param objid any
---@param position any
---@param cancontrol any
function Trigger.Actor:TryMoveToPos(objid, position, cancontrol) end

---@class Trigger.Area
Trigger.Area = {}

---触发器接口（环境表导出）
---@param blockid any
---@param areaid any
function Trigger.Area:BlockInArea(blockid, areaid) end

---触发器接口（环境表导出）
---@param areaid any
---@param blockids any
function Trigger.Area:ClearAllBlock(areaid, blockids) end

---触发器接口（环境表导出）
---@param itype any
---@param areaid any
---@param deststartpos any
function Trigger.Area:CloneArea(itype, areaid, deststartpos) end

---触发器接口（环境表导出）
---@param areaid any
---@param blockids any
function Trigger.Area:DestroyAllBlock(areaid, blockids) end

---触发器接口（环境表导出）
---@param blockid any
---@param areaid any
---@param itype any
---@param face any
---@param color any
---@param switch any
function Trigger.Area:FillBlock(blockid, areaid, itype, face, color, switch) end

---触发器接口（环境表导出）
---@param areaid any
function Trigger.Area:GetCenterFloatPos(areaid) end

---触发器接口（环境表导出）
---@param areaid any
function Trigger.Area:GetCenterPos(areaid) end

---触发器接口（环境表导出）
---@param areaid any
function Trigger.Area:GetRandomFloatPos(areaid) end

---触发器接口（环境表导出）
---@param areaid any
function Trigger.Area:GetRandomPos(areaid) end

---触发器接口（环境表导出）
---@param objid any
---@param areaid any
function Trigger.Area:ObjInArea(objid, areaid) end

---触发器接口（环境表导出）
---@param pos any
---@param areaid any
function Trigger.Area:PosInArea(pos, areaid) end

---触发器接口（环境表导出）
---@param destblockid any
---@param areaid any
---@param srcblockid any
---@param face any
---@param color any
---@param switch any
function Trigger.Area:ReplaceAreaBlock(destblockid, areaid, srcblockid, face, color, switch) end

---@class Trigger.ArrayTmp
Trigger.ArrayTmp = {}

---触发器接口（环境表导出）
---@param areaid any
---@param mathcmode any
---@param tags any
---@param itype any
---@param bexactmatch any
function Trigger.ArrayTmp:GetActorsByTags(areaid, mathcmode, tags, itype, bexactmatch) end

---触发器接口（环境表导出）
---@param alive any
function Trigger.ArrayTmp:GetAllPlayers(alive) end

---触发器接口（环境表导出）
---@param areaid any
function Trigger.ArrayTmp:GetAreaBlocks(areaid) end

---触发器接口（环境表导出）
---@param areaid any
function Trigger.ArrayTmp:GetAreaCreatures(areaid) end

---触发器接口（环境表导出）
---@param areaid any
function Trigger.ArrayTmp:GetAreaDropItems(areaid) end

---触发器接口（环境表导出）
---@param areaid any
function Trigger.ArrayTmp:GetAreaEntity(areaid) end

---触发器接口（环境表导出）
---@param areaid any
function Trigger.ArrayTmp:GetAreaMisssile(areaid) end

---触发器接口（环境表导出）
---@param areaid any
function Trigger.ArrayTmp:GetAreaObjEntity(areaid) end

---触发器接口（环境表导出）
---@param areaid any
function Trigger.ArrayTmp:GetAreaPlayers(areaid) end

---触发器接口（环境表导出）
---@param areaid any
---@param uin any
---@param relativing any
---@param actortype any
function Trigger.ArrayTmp:GetAreaRelativeActors(areaid, uin, relativing, actortype) end

---触发器接口（环境表导出）
---@param playerid any
function Trigger.ArrayTmp:GetNewInviteGroup(playerid) end

---触发器接口（环境表导出）
---@param uin any
---@param relativing any
---@param actortype any
function Trigger.ArrayTmp:GetRelativeActor(uin, relativing, actortype) end

---触发器接口（环境表导出）
---@param varId any
---@param playerId any
---@param col any
---@param itype any
---@param value any
function Trigger.ArrayTmp:GetTableRowIndex(varId, playerId, col, itype, value) end

---触发器接口（环境表导出）
---@param varId any
---@param playerId any
---@param col any
---@param itype any
---@param value any
function Trigger.ArrayTmp:GetTableRowIndexs(varId, playerId, col, itype, value) end

---触发器接口（环境表导出）
---@param varId any
---@param playerId any
---@param col any
function Trigger.ArrayTmp:GetTableValuesByCol(varId, playerId, col) end

---触发器接口（环境表导出）
---@param teamid any
function Trigger.ArrayTmp:GetTeamCreatures(teamid) end

---触发器接口（环境表导出）
---@param teamid any
function Trigger.ArrayTmp:GetTeamLivingActor(teamid) end

---触发器接口（环境表导出）
---@param teamid any
function Trigger.ArrayTmp:GetTeamMobs(teamid) end

---触发器接口（环境表导出）
---@param teamid any
---@param alive any
function Trigger.ArrayTmp:GetTeamPlayers(teamid, alive) end

---触发器接口（环境表导出）
---@param varId any
---@param playerId any
---@param col any
---@param rows any
---@param value any
function Trigger.ArrayTmp:GetVarTabValue(varId, playerId, col, rows, value) end

---触发器接口（环境表导出）
---@param value any
---@param varid any
---@param playerid any
function Trigger.ArrayTmp:InsertValue(value, varid, playerid) end

---触发器接口（环境表导出）
---@param varId any
---@param playerId any
---@param index any
---@param value any
function Trigger.ArrayTmp:InsertValueToArray(varId, playerId, index, value) end

---触发器接口（环境表导出）
---@param varId any
---@param playerId any
---@param varId2 any
---@param playerId2 any
function Trigger.ArrayTmp:InsertValuesToArray(varId, playerId, varId2, playerId2) end

---触发器接口（环境表导出）
---@param varId any
---@param playerId any
---@param index any
---@vararg any
function Trigger.ArrayTmp:InsertVarTabValue(varId, playerId, index, ...) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.ArrayTmp:ObjInTmpGroup(v1, v2) end

---触发器接口（环境表导出）
---@param value any
---@param varid any
---@param playerid any
function Trigger.ArrayTmp:RemoveByValue(value, varid, playerid) end

---触发器接口（环境表导出）
---@param varId any
---@param playerId any
---@param value any
---@param oldValue any
function Trigger.ArrayTmp:ReplaceValueToArray(varId, playerId, value, oldValue) end

---触发器接口（环境表导出）
---@param varId any
---@param playerId any
---@param frow any
---@param itype any
---@param fvalue any
---@param col any
---@param value any
function Trigger.ArrayTmp:SetTableRows(varId, playerId, frow, itype, fvalue, col, value) end

---触发器接口（环境表导出）
---@param varId any
---@param playerId any
---@param index any
---@param value any
function Trigger.ArrayTmp:SetValueToArray(varId, playerId, index, value) end

---触发器接口（环境表导出）
---@param varId any
---@param playerId any
---@param col any
---@param rows any
---@param value any
function Trigger.ArrayTmp:SetVarTabValue(varId, playerId, col, rows, value) end

---触发器接口（环境表导出）
---@param str any
---@param mark any
function Trigger.ArrayTmp:SplitStrArray(str, mark) end

---@class Trigger.Backpack
Trigger.Backpack = {}

---触发器接口（环境表导出）
---@param data any
---@param equipid any
function Trigger.Backpack:ActDestructEquip(data, equipid) end

---触发器接口（环境表导出）
---@param data any
---@param equipid any
function Trigger.Backpack:ActEquipOffByEquipID(data, equipid) end

---触发器接口（环境表导出）
---@param data any
---@param itemid any
function Trigger.Backpack:ActEquipUpByResID(data, itemid) end

---触发器接口（环境表导出）
---@param num any
---@param itemid any
---@param data any
function Trigger.Backpack:AddItem(num, itemid, data) end

---触发器接口（环境表导出）
---@param itemnum any
---@param itemid any
---@param data any
---@param ipos any
function Trigger.Backpack:CreateItemID(itemnum, itemid, data, ipos) end

---触发器接口（环境表导出）
---@param data any
---@param itemnum any
---@param itemid any
function Trigger.Backpack:DiscardItemByID(data, itemnum, itemid) end

---触发器接口（环境表导出）
---@param objid any
---@param itemnum any
---@param itemid any
function Trigger.Backpack:EnoughSpaceForItem(objid, itemnum, itemid) end

---触发器接口（环境表导出）
---@param playerid any
---@param gridtype any
---@param index any
function Trigger.Backpack:GetShurtItemid(playerid, gridtype, index) end

---触发器接口（环境表导出）
---@param playerid any
---@param gridtype any
---@param index any
function Trigger.Backpack:GetShurtItemnum(playerid, gridtype, index) end

---触发器接口（环境表导出）
---@param data any
---@param itemid any
---@param effectid any
---@param scale any
function Trigger.Backpack:PlayShortCutItemEffect(data, itemid, effectid, scale) end

---触发器接口（环境表导出）
---@param data any
---@param itemid any
---@param effectids any
---@param offset any
---@param rot any
---@param scale any
function Trigger.Backpack:PlayShortCutItemParticle(data, itemid, effectids, offset, rot, scale) end

---触发器接口（环境表导出）
---@param data any
---@param effectid any
---@param scale any
function Trigger.Backpack:PlayShortCutIxEffect(data, effectid, scale) end

---触发器接口（环境表导出）
---@param data any
---@param effectids any
---@param offset any
---@param rot any
---@param scale any
function Trigger.Backpack:PlayShortCutIxParticle(data, effectids, offset, rot, scale) end

---触发器接口（环境表导出）
---@param data any
---@param gridid any
---@param itemnum any
function Trigger.Backpack:RemoveGridItem(data, gridid, itemnum) end

---触发器接口（环境表导出）
---@param data any
---@param itemnum any
---@param itemid any
function Trigger.Backpack:RemoveItem(data, itemnum, itemid) end

---触发器接口（环境表导出）
---@param data any
---@param gridid any
---@param itemid any
---@param itemnum any
function Trigger.Backpack:SetGridItem(data, gridid, itemid, itemnum) end

---触发器接口（环境表导出）
---@param data any
---@param itemid any
---@param effectids any
function Trigger.Backpack:StopShortCutItemEffect(data, itemid, effectids) end

---触发器接口（环境表导出）
---@param data any
---@param effectids any
function Trigger.Backpack:StopShortCutIxEffect(data, effectids) end

---@class Trigger.Block
Trigger.Block = {}

---触发器接口（环境表导出）
---@param pos any
---@param dir any
---@param val any
---@param worldId any
function Trigger.Block:CheckBlockDir(pos, dir, val, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param flag any
---@param blockid any
---@param worldId any
function Trigger.Block:CompareBlockID(pos, flag, blockid, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param blockid any
---@param face any
---@param worldId any
function Trigger.Block:CreateBlock(pos, blockid, face, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param blockid any
---@param face any
---@param color any
---@param switch any
---@param worldId any
function Trigger.Block:CreateSpcBlock(pos, blockid, face, color, switch, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param worldId any
function Trigger.Block:DestroyBlock(pos, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param worldId any
function Trigger.Block:DestroyBlockDrop(pos, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param worldId any
function Trigger.Block:GetBlockID(pos, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param flag any
---@param worldId any
function Trigger.Block:GetBlockSwitchStatus(pos, flag, worldId) end

---触发器接口（环境表导出）
---@param blockid any
function Trigger.Block:GetFacade(blockid) end

---触发器接口（环境表导出）
---@param pos any
---@param blueprint any
---@param angle any
---@param mirror any
---@param placeMode any
---@param worldId any
function Trigger.Block:ReplaceBluePrint(pos, blueprint, angle, mirror, placeMode, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param color any
---@param worldId any
function Trigger.Block:SetBlockColor(pos, color, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param dir any
---@param worldId any
function Trigger.Block:SetBlockDir(pos, dir, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param switch any
---@param worldId any
function Trigger.Block:SetBlockSwichState(pos, switch, worldId) end

---@class Trigger.Buff
Trigger.Buff = {}

---触发器接口（环境表导出）
---@param data any
---@param buffid any
---@param bforever any
---@param ctime any
function Trigger.Buff:AddBuff(data, buffid, bforever, ctime) end

---触发器接口（环境表导出）
---@param buff1 any
---@param buff2 any
function Trigger.Buff:CompareBuff(buff1, buff2) end

---触发器接口（环境表导出）
---@param objid any
---@param buffid any
function Trigger.Buff:GetBuffLeftTime(objid, buffid) end

---触发器接口（环境表导出）
---@param data any
---@param buffid any
function Trigger.Buff:HasBuff(data, buffid) end

---触发器接口（环境表导出）
---@param data any
---@param buffid any
function Trigger.Buff:RemoveBuff(data, buffid) end

---触发器接口（环境表导出）
---@param data any
---@param buffer1 any
---@param buffer2 any
---@param bforever any
---@param ctime any
function Trigger.Buff:ReplaceBuff(data, buffer1, buffer2, bforever, ctime) end

---@class Trigger.Component
Trigger.Component = {}

---触发器接口（环境表导出）
---@param object any
---@param cmpName any
function Trigger.Component:AddComponent(object, cmpName) end

---触发器接口（环境表导出）
---@param cmp any
---@param object any
---@param event any
---@param fn any
---@param priority any
---@vararg any
function Trigger.Component:AddEvent(cmp, object, event, fn, priority, ...) end

---触发器接口（环境表导出）
---@param pos any
---@param cmpName any
---@param fnName any
---@vararg any
function Trigger.Component:CallBlockComponentFunctionByPos(pos, cmpName, fnName, ...) end

---触发器接口（环境表导出）
---@param pos any
---@param cmpName any
---@param fnName any
---@vararg any
function Trigger.Component:CallBlockComponentFunctionByPosVar(pos, cmpName, fnName, ...) end

---触发器接口（环境表导出）
---@param object any
---@param cmpName any
---@param fnName any
---@vararg any
function Trigger.Component:CallComponentFunction(object, cmpName, fnName, ...) end

---触发器接口（环境表导出）
---@param object any
---@param cmpName any
---@param fnName any
---@vararg any
function Trigger.Component:CallComponentFunctionVar(object, cmpName, fnName, ...) end

---触发器接口（环境表导出）
---@param fun any
---@param cmp any
---@param checkType any
---@vararg any
function Trigger.Component:CheckCmpFunctionCallType(fun, cmp, checkType, ...) end

---触发器接口（环境表导出）
---@param pos any
---@param cmpName any
---@param property any
function Trigger.Component:GetBlockComponentPropertyByPos(pos, cmpName, property) end

---触发器接口（环境表导出）
---@param object any
---@param cmpName any
---@param property any
function Trigger.Component:GetComponentProperty(object, cmpName, property) end

---触发器接口（环境表导出）
---@param object any
---@param cmpName any
function Trigger.Component:GetIsHasCmp(object, cmpName) end

---触发器接口（环境表导出）
---@param object any
---@param cmpName any
---@param property any
---@param value any
function Trigger.Component:IncreasesComponentProperty(object, cmpName, property, value) end

---触发器接口（环境表导出）
---@param funcname any
---@param cmp any
function Trigger.Component:IsEventEnable(funcname, cmp) end

---触发器接口（环境表导出）
---@param object any
---@param cmpName any
function Trigger.Component:RemoveComponent(object, cmpName) end

---触发器接口（环境表导出）
---@param cmp any
---@param fn any
---@vararg any
function Trigger.Component:RunCmpBaseFn(cmp, fn, ...) end

---触发器接口（环境表导出）
---@param object any
---@param cmpName any
---@param property any
---@param value any
function Trigger.Component:SetComponentProperty(object, cmpName, property, value) end

---触发器接口（环境表导出）
---@param funcname any
---@param enable any
---@param cmp any
function Trigger.Component:SetEventIsEnable(funcname, enable, cmp) end

---@class Trigger.CustomUI
Trigger.CustomUI = {}

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param parentElementid any
function Trigger.CustomUI:ChangeParent(playerid, uiid, elementid, parentElementid) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param widget3DObjId any
function Trigger.CustomUI:CloneElement(playerid, uiid, elementid, widget3DObjId) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementType any
---@param widget3DObjId any
function Trigger.CustomUI:CreateElement(playerid, uiid, elementType, widget3DObjId) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
function Trigger.CustomUI:DeleteElement(playerid, uiid, elementid) end

---触发器接口（环境表导出）
---@param playerid any
---@param elementid any
---@param enumId any
function Trigger.CustomUI:GetElementAttrValue(playerid, elementid, enumId) end

---触发器接口（环境表导出）
---@param objid any
---@param uiid any
---@param elementid any
---@param itype any
function Trigger.CustomUI:GetProgressBarValue(objid, uiid, elementid, itype) end

---触发器接口（环境表导出）
---@param objid any
---@param ix any
function Trigger.CustomUI:GetScreenSize(objid, ix) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param effectid any
---@param time any
function Trigger.CustomUI:HideElement(playerid, uiid, elementid, effectid, time) end

---触发器接口（环境表导出）
---@param animid any
---@param time any
---@param mode any
function Trigger.CustomUI:MakeElementAnim(animid, time, mode) end

---触发器接口（环境表导出）
---@param time any
---@param dir any
---@param isadd any
---@param len any
function Trigger.CustomUI:MakeSmoothMoveBy(time, dir, isadd, len) end

---触发器接口（环境表导出）
---@param time any
---@param x any
---@param y any
function Trigger.CustomUI:MakeSmoothMoveTo(time, x, y) end

---触发器接口（环境表导出）
---@param time any
---@param isadd any
---@param angle any
function Trigger.CustomUI:MakeSmoothRotateBy(time, isadd, angle) end

---触发器接口（环境表导出）
---@param time any
---@param angle any
function Trigger.CustomUI:MakeSmoothRotateTo(time, angle) end

---触发器接口（环境表导出）
---@param time any
---@param dir any
---@param isadd any
---@param len any
function Trigger.CustomUI:MakeSmoothScaleBy(time, dir, isadd, len) end

---触发器接口（环境表导出）
---@param time any
---@param w any
---@param h any
function Trigger.CustomUI:MakeSmoothScaleTo(time, w, h) end

---触发器接口（环境表导出）
---@param animid any
---@param time any
function Trigger.CustomUI:MakeUITextAnim(animid, time) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param info any
function Trigger.CustomUI:PlayAnim(playerid, uiid, elementid, info) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param info any
function Trigger.CustomUI:PlaySmoothAnim(playerid, uiid, elementid, info) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param rotate any
function Trigger.CustomUI:RotateElement(playerid, uiid, elementid, rotate) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param alpha any
function Trigger.CustomUI:SetAlpha(playerid, uiid, elementid, alpha) end

---触发器接口（环境表导出）
---@param playerid any
---@param elementid any
---@param itype any
---@param param any
---@param uiid any
function Trigger.CustomUI:SetBeaconBand(playerid, elementid, itype, param, uiid) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param color any
function Trigger.CustomUI:SetColor(playerid, uiid, elementid, color) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param size any
function Trigger.CustomUI:SetFontSize(playerid, uiid, elementid, size) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param modelName any
function Trigger.CustomUI:SetLoaderModel(playerid, uiid, elementid, modelName) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param animid any
---@param speed any
---@param playmode any
function Trigger.CustomUI:SetLoaderModelAct(playerid, uiid, elementid, animid, speed, playmode) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param yaw any
function Trigger.CustomUI:SetLoaderModelDir(playerid, uiid, elementid, yaw) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param scale any
function Trigger.CustomUI:SetLoaderModelScale(playerid, uiid, elementid, scale) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param x any
---@param y any
function Trigger.CustomUI:SetPosition(playerid, uiid, elementid, x, y) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param itype any
---@param url any
function Trigger.CustomUI:SetProgressBarResId(playerid, uiid, elementid, itype, url) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param itype any
---@param value any
function Trigger.CustomUI:SetProgressBarValue(playerid, uiid, elementid, itype, value) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param v any
---@param xOffset any
---@param xUnits any
---@param h any
---@param yOffset any
---@param yUnits any
function Trigger.CustomUI:SetRelationPosition(playerid, uiid, elementid, v, xOffset, xUnits, h, yOffset, yUnits) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param width any
---@param widthUnits any
---@param height any
---@param heightUnits any
function Trigger.CustomUI:SetRelationSize(playerid, uiid, elementid, width, widthUnits, height, heightUnits) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param width any
---@param height any
function Trigger.CustomUI:SetSize(playerid, uiid, elementid, width, height) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param url any
function Trigger.CustomUI:SetSliderBarImg(playerid, uiid, elementid, url) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param dir any
function Trigger.CustomUI:SetSliderDir(playerid, uiid, elementid, dir) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param animid any
---@param animindex any
---@param playmode any
function Trigger.CustomUI:SetSpineAnimID(playerid, uiid, elementid, animid, animindex, playmode) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param pageIndex any
---@param easeType any
---@param time any
function Trigger.CustomUI:SetState(playerid, uiid, pageIndex, easeType, time) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param text any
---@param info any
function Trigger.CustomUI:SetText(playerid, uiid, elementid, text, info) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param url any
function Trigger.CustomUI:SetTexture(playerid, uiid, elementid, url) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param effectid any
---@param time any
function Trigger.CustomUI:ShowElement(playerid, uiid, elementid, effectid, time) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param time any
---@param ptype any
---@param value any
function Trigger.CustomUI:SmoothIncreaseProgress(playerid, uiid, elementid, time, ptype, value) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param itype any
function Trigger.CustomUI:StopAnim(playerid, uiid, elementid, itype) end

---触发器接口（环境表导出）
---@param playerid any
---@param uiid any
---@param elementid any
---@param x any
---@param y any
function Trigger.CustomUI:TurnSliderToPos(playerid, uiid, elementid, x, y) end

---@class Trigger.DisplayBoard
Trigger.DisplayBoard = {}

---触发器接口（环境表导出）
---@param objid any
---@param player any
function Trigger.DisplayBoard:IsVisible(objid, player) end

---触发器接口（环境表导出）
---@param cfg any
---@param objid any
function Trigger.DisplayBoard:ReplaceByCfg(cfg, objid) end

---触发器接口（环境表导出）
---@param player any
---@param cfg any
---@param objid any
function Trigger.DisplayBoard:ReplaceByCfgForPlayer(player, cfg, objid) end

---触发器接口（环境表导出）
---@param player any
---@param visible any
---@param objid any
function Trigger.DisplayBoard:SetVisible(player, visible, objid) end

---@class Trigger.GameObject
Trigger.GameObject = {}

---触发器接口（环境表导出）
---@param objectType any
---@param prefabId any
---@param num any
---@param pos any
---@param worldId any
function Trigger.GameObject:CreatePrefabInst(objectType, prefabId, num, pos, worldId) end

---触发器接口（环境表导出）
---@param objectType any
---@param var any
---@param prefabId any
---@param num any
---@param pos any
---@param face any
---@param scale any
function Trigger.GameObject:CreatePrefabInstEx(objectType, var, prefabId, num, pos, face, scale) end

---触发器接口（环境表导出）
---@param objectType any
---@param prefabId any
---@param pos any
---@param worldId any
function Trigger.GameObject:CreateSinglePrefabInst(objectType, prefabId, pos, worldId) end

---触发器接口（环境表导出）
---@param itype any
---@param objId any
function Trigger.GameObject:GetObjectPrefab(itype, objId) end

---触发器接口（环境表导出）
---@param info any
function Trigger.GameObject:GetPrefabDes(info) end

---触发器接口（环境表导出）
---@param info any
function Trigger.GameObject:GetPrefabName(info) end

---@class Trigger.Graphics
Trigger.Graphics = {}

---触发器接口（环境表导出）
---@param data any
---@param info any
---@param dir any
---@param offest any
function Trigger.Graphics:CreateGraphicsByActor(data, info, dir, offest) end

---触发器接口（环境表导出）
---@param data any
---@param info any
---@param x any
---@param y any
function Trigger.Graphics:CreateGraphicsByActor2(data, info, x, y) end

---触发器接口（环境表导出）
---@param pos any
---@param GraphicInfo any
---@param worldId any
function Trigger.Graphics:CreateGraphicsByPos(pos, GraphicInfo, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param GraphicInfo any
---@param x any
---@param y any
---@param worldId any
function Trigger.Graphics:CreateGraphicsByPos2(pos, GraphicInfo, x, y, worldId) end

---触发器接口（环境表导出）
---@param tuin any
---@param itype any
function Trigger.Graphics:GetInnerGraphicsOffset(tuin, itype) end

---触发器接口（环境表导出）
---@param pos any
---@param size any
---@param color any
---@param itype any
---@param worldId any
function Trigger.Graphics:MakeGraphicsArrowToPos(pos, size, color, itype, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param size any
---@param color any
---@param itype any
---@param worldId any
function Trigger.Graphics:MakeGraphicsLineToPos(pos, size, color, itype, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param itype any
---@param canSeePlayersArr any
function Trigger.Graphics:MakeGraphicsNavPathToPos(pos, itype, canSeePlayersArr) end

---触发器接口（环境表导出）
---@param pos any
---@param size any
---@param color any
---@param itype any
---@param worldId any
function Trigger.Graphics:MakeGraphicsSurfaceToPos(pos, size, color, itype, worldId) end

---触发器接口（环境表导出）
---@param objids any
---@param itype any
---@param graphType any
function Trigger.Graphics:RemoveGraphicsByObjID(objids, itype, graphType) end

---触发器接口（环境表导出）
---@param pos any
---@param itype any
---@param graphType any
---@param worldId any
function Trigger.Graphics:RemoveGraphicsByPos(pos, itype, graphType, worldId) end

---@class Trigger.Item
Trigger.Item = {}

---触发器接口（环境表导出）
---@param pos any
---@param worldId any
function Trigger.Item:ClearStorageBox(pos, worldId) end

---触发器接口（环境表导出）
---@param itemid any
---@param itemid2 any
function Trigger.Item:CompareItemid(itemid, itemid2) end

---触发器接口（环境表导出）
---@param itemid any
---@param num any
---@param pos any
---@param worldId any
function Trigger.Item:CreateItemToStorageBox(itemid, num, pos, worldId) end

---触发器接口（环境表导出）
---@param itemid any
---@param num any
---@param pos any
---@param worldId any
function Trigger.Item:DespawnItemFromStorageBox(itemid, num, pos, worldId) end

---触发器接口（环境表导出）
---@param itemid any
function Trigger.Item:GetFacade(itemid) end

---触发器接口（环境表导出）
---@param itemid any
function Trigger.Item:ToItemID(itemid) end

---@class Trigger.KvMap
Trigger.KvMap = {}

---触发器接口（环境表导出）
---@param varid any
---@param playerid any
---@param key any
---@param itype any
function Trigger.KvMap:GetDataListBykey(varid, playerid, key, itype) end

---触发器接口（环境表导出）
---@param varid any
---@param playerid any
---@param ktype any
---@param key any
function Trigger.KvMap:GetOrderDataBykey(varid, playerid, ktype, key) end

---触发器接口（环境表导出）
---@param varid any
---@param playerid any
---@param key any
function Trigger.KvMap:RemoveDataListBykey(varid, playerid, key) end

---触发器接口（环境表导出）
---@param varid any
---@param playerid any
---@param ktype any
---@param key any
function Trigger.KvMap:RemoveOrderDataByKey(varid, playerid, ktype, key) end

---触发器接口（环境表导出）
---@param varid any
---@param playerid any
---@param key any
---@param value any
function Trigger.KvMap:SetDataListBykey(varid, playerid, key, value) end

---触发器接口（环境表导出）
---@param varid any
---@param playerid any
---@param ktype any
---@param key any
---@param opcode any
---@param value any
---@param extendinfo any
function Trigger.KvMap:SetOrderDataBykey(varid, playerid, ktype, key, opcode, value, extendinfo) end

---@class Trigger.Math
Trigger.Math = {}

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:Abs(v1) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:Ceil(v1) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:ColorTostring(v1) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:CompareGreater(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:CompareGreaterEqual(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:CompareLess(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:CompareLessEqual(v1, v2) end

---触发器接口（环境表导出）
---@vararg any
function Trigger.Math:Concat(...) end

---触发器接口（环境表导出）
---@param str1 any
---@param str2 any
function Trigger.Math:ContainStr(str1, str2) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:Cos(v1) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:Deg(v1) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:DivAndFloor(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:Equal(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:Exp(v1) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:Floor(v1) end

---触发器接口（环境表导出）
---@param num any
function Trigger.Math:IsEven(num) end

---触发器接口（环境表导出）
---@param num any
function Trigger.Math:IsNegative(num) end

---触发器接口（环境表导出）
---@param num any
function Trigger.Math:IsOdd(num) end

---触发器接口（环境表导出）
---@param num any
function Trigger.Math:IsPositive(num) end

---触发器接口（环境表导出）
---@param num any
function Trigger.Math:IsPrime(num) end

---触发器接口（环境表导出）
---@param num any
function Trigger.Math:Isinteger(num) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:Isnil(v1) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:Ldexp(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:Log(v1) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:Log10(v1) end

---触发器接口（环境表导出）
---@param a any
---@param b any
function Trigger.Math:LogicCompareTable(a, b) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:MathAdd(v1, v2) end

---触发器接口（环境表导出）
---@param fn any
---@vararg any
function Trigger.Math:MathArithmetic(fn, ...) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:MathDivide(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:MathExtractOpt(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:MathMultiply(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:MathSub(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:MathUnFixedBaseLog(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:MathXor(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:Max(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:Min(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:Mod(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:ModEqualZero(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:Negate(v1) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:NotEqual(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:Pow(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:Pow10(v1) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:Rad(v1) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.Math:Random(v1, v2) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:Round(v1) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:Sin(v1) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:Sqrt(v1) end

---触发器接口（环境表导出）
---@param str any
function Trigger.Math:StrToBool(str) end

---触发器接口（环境表导出）
---@param str any
function Trigger.Math:StrToColor(str) end

---触发器接口（环境表导出）
---@param str any
function Trigger.Math:StrToV3(str) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:Tan(v1) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:TanAngle2Rad(v1) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:Tostring(v1) end

---触发器接口（环境表导出）
---@param v1 any
function Trigger.Math:V3Tostring(v1) end

---@class Trigger.Monster
Trigger.Monster = {}

---触发器接口（环境表导出）
---@param monsterid any
function Trigger.Monster:GetMonsterFacade(monsterid) end

---@class Trigger.Player
Trigger.Player = {}

---触发器接口（环境表导出）
---@param data any
---@param viewmode any
---@param islock any
function Trigger.Player:ChangeViewMode(data, viewmode, islock) end

---触发器接口（环境表导出）
---@param gridid any
function Trigger.Player:EventGridID2GridEnum(gridid) end

---触发器接口（环境表导出）
---@param objid any
function Trigger.Player:GetAimPoint(objid) end

---触发器接口（环境表导出）
---@param ix any
function Trigger.Player:GetBackPackGridID(ix) end

---触发器接口（环境表导出）
---@param objid any
---@param itemid any
function Trigger.Player:GetBackpackItemNum(objid, itemid) end

---触发器接口（环境表导出）
---@param ix any
function Trigger.Player:GetEquipGridID(ix) end

---触发器接口（环境表导出）
---@param uin any
function Trigger.Player:GetFirstInviter(uin) end

---触发器接口（环境表导出）
---@param playerid any
---@param gridid any
function Trigger.Player:GetGridItemID(playerid, gridid) end

---触发器接口（环境表导出）
---@param playerid any
---@param gridid any
function Trigger.Player:GetGridItemNum(playerid, gridid) end

---触发器接口（环境表导出）
---@param uin any
function Trigger.Player:GetRayOriginPos(uin) end

---触发器接口（环境表导出）
---@param objid any
---@param worldId any
function Trigger.Player:GetRevivePoint(objid, worldId) end

---触发器接口（环境表导出）
---@param ix any
function Trigger.Player:GetShortCutGridID(ix) end

---触发器接口（环境表导出）
---@param playerid any
---@param friendid any
---@param flag any
function Trigger.Player:HasFriend(playerid, friendid, flag) end

---触发器接口（环境表导出）
---@param playerid any
function Trigger.Player:IsMiniVip(playerid) end

---触发器接口（环境表导出）
---@param playerid any
function Trigger.Player:MakeCamerFvoAttr(playerid) end

---触发器接口（环境表导出）
---@param playerid any
---@param dir any
function Trigger.Player:MakeCamerPosAttr(playerid, dir) end

---触发器接口（环境表导出）
---@param playerid any
---@param dir any
function Trigger.Player:MakeCamerRotAttr(playerid, dir) end

---触发器接口（环境表导出）
---@param playerid any
---@param num any
---@param gridsrc any
---@param griddst any
function Trigger.Player:MoveGridItem(playerid, num, gridsrc, griddst) end

---触发器接口（环境表导出）
---@param data any
---@param content any
function Trigger.Player:NotifyGameInfo2Self(data, content) end

---触发器接口（环境表导出）
---@param data any
---@param content any
function Trigger.Player:NotifySystemMsg2Self(data, content) end

---触发器接口（环境表导出）
---@param uin any
function Trigger.Player:OpenDevGoodsWearHouse(uin) end

---触发器接口（环境表导出）
---@param data any
---@param bopen any
---@param view any
---@param exparam any
function Trigger.Player:OpenInnerView(data, bopen, view, exparam) end

---触发器接口（环境表导出）
---@param data any
---@param bopen any
function Trigger.Player:OpenInnerView_AdventureHandBook(data, bopen) end

---触发器接口（环境表导出）
---@param data any
---@param bopen any
function Trigger.Player:OpenInnerView_AnimView(data, bopen) end

---触发器接口（环境表导出）
---@param data any
---@param bopen any
function Trigger.Player:OpenInnerView_BackPackEra(data, bopen) end

---触发器接口（环境表导出）
---@param data any
---@param bopen any
function Trigger.Player:OpenInnerView_BackPackRole(data, bopen) end

---触发器接口（环境表导出）
---@param data any
---@param bopen any
function Trigger.Player:OpenInnerView_BackPackTask(data, bopen) end

---触发器接口（环境表导出）
---@param data any
---@param bopen any
function Trigger.Player:OpenInnerView_BuffStatus(data, bopen) end

---触发器接口（环境表导出）
---@param data any
---@param bopen any
function Trigger.Player:OpenInnerView_CollectMaps(data, bopen) end

---触发器接口（环境表导出）
---@param data any
---@param bopen any
function Trigger.Player:OpenInnerView_EvaluateMaps(data, bopen) end

---触发器接口（环境表导出）
---@param data any
---@param bopen any
function Trigger.Player:OpenInnerView_FollowTheAuthor(data, bopen) end

---触发器接口（环境表导出）
---@param data any
---@param bopen any
function Trigger.Player:OpenInnerView_InviteFriend(data, bopen) end

---触发器接口（环境表导出）
---@param data any
---@param bopen any
function Trigger.Player:OpenInnerView_ItemProcessing(data, bopen) end

---触发器接口（环境表导出）
---@param data any
---@param bopen any
---@param itemid any
function Trigger.Player:OpenInnerView_ItemTips(data, bopen, itemid) end

---触发器接口（环境表导出）
---@param data any
---@param bopen any
function Trigger.Player:OpenInnerView_MiniMap(data, bopen) end

---触发器接口（环境表导出）
---@param data any
---@param bopen any
function Trigger.Player:OpenInnerView_MiniShop(data, bopen) end

---触发器接口（环境表导出）
---@param data any
---@param bopen any
function Trigger.Player:OpenInnerView_Specialty(data, bopen) end

---触发器接口（环境表导出）
---@param data any
---@param bopen any
---@param pos any
function Trigger.Player:OpenInnerView_StorageBox(data, bopen, pos) end

---触发器接口（环境表导出）
---@param data any
---@param musicId any
function Trigger.Player:PaseOrResumeMusic(data, musicId) end

---触发器接口（环境表导出）
---@param data any
---@param musicId any
function Trigger.Player:PauseMusic(data, musicId) end

---触发器接口（环境表导出）
---@param data any
---@param musicId any
---@param volume any
---@param pitch any
---@param isLoop any
function Trigger.Player:PlayMusic(data, musicId, volume, pitch, isLoop) end

---触发器接口（环境表导出）
---@param data any
function Trigger.Player:ResetCameraAttr(data) end

---触发器接口（环境表导出）
---@param data any
---@param musicId any
function Trigger.Player:ResumeMusic(data, musicId) end

---触发器接口（环境表导出）
---@param data any
---@param yaw any
---@param pitch any
function Trigger.Player:RotateCamera(data, yaw, pitch) end

---触发器接口（环境表导出）
---@param data any
---@param isadd any
---@param value any
---@param animid any
---@param time any
function Trigger.Player:SetCameraAnimFov(data, isadd, value, animid, time) end

---触发器接口（环境表导出）
---@param data any
---@param sigdir any
---@param isadd any
---@param value any
---@param animid any
---@param time any
function Trigger.Player:SetCameraAnimPos(data, sigdir, isadd, value, animid, time) end

---触发器接口（环境表导出）
---@param data any
---@param sigdir any
---@param isadd any
---@param value any
---@param animid any
---@param time any
function Trigger.Player:SetCameraAnimPosEx(data, sigdir, isadd, value, animid, time) end

---触发器接口（环境表导出）
---@param data any
---@param sigdir any
---@param isadd any
---@param value any
---@param animid any
---@param time any
function Trigger.Player:SetCameraAnimRot(data, sigdir, isadd, value, animid, time) end

---触发器接口（环境表导出）
---@param data any
---@param attr any
---@param enable any
function Trigger.Player:SetCameraAttrState(data, attr, enable) end

---触发器接口（环境表导出）
---@param data any
---@param objid any
function Trigger.Player:SetCameraMountObj(data, objid) end

---触发器接口（环境表导出）
---@param data any
---@param pos any
function Trigger.Player:SetCameraMountPos(data, pos) end

---触发器接口（环境表导出）
---@param data any
---@param attr any
function Trigger.Player:SetCameraRotMode(data, attr) end

---触发器接口（环境表导出）
---@param data any
function Trigger.Player:SetGameDefeat(data) end

---触发器接口（环境表导出）
---@param data any
function Trigger.Player:SetGameWin(data) end

---触发器接口（环境表导出）
---@param data any
---@param attr any
---@param switch any
function Trigger.Player:SetGunActionState(data, attr, switch) end

---触发器接口（环境表导出）
---@param data any
---@param itemid any
---@param switch any
function Trigger.Player:SetItemDropAttAction(data, itemid, switch) end

---触发器接口（环境表导出）
---@param data any
---@param itemid any
---@param switch any
function Trigger.Player:SetItemThrowAttAction(data, itemid, switch) end

---触发器接口（环境表导出）
---@param data any
function Trigger.Player:SetJoinJudge(data) end

---触发器接口（环境表导出）
---@param data any
---@param time any
---@param amplitude any
function Trigger.Player:SetMobileVibrate(data, time, amplitude) end

---触发器接口（环境表导出）
---@param data any
function Trigger.Player:SetQuitJudge(data) end

---触发器接口（环境表导出）
---@param data any
---@param pos any
---@param worldId any
function Trigger.Player:SetRevivePoint(data, pos, worldId) end

---触发器接口（环境表导出）
---@param data any
---@param duration any
---@param power any
function Trigger.Player:ShakeCamera(data, duration, power) end

---触发器接口（环境表导出）
---@param data any
---@param musicId any
function Trigger.Player:StopMusic(data, musicId) end

---触发器接口（环境表导出）
---@param data any
function Trigger.Player:StopShakeCamera(data) end

---触发器接口（环境表导出）
---@param ix any
function Trigger.Player:ToBackPackGridID(ix) end

---触发器接口（环境表导出）
---@param ix any
function Trigger.Player:ToEquipGridID(ix) end

---触发器接口（环境表导出）
---@param ix any
function Trigger.Player:ToShortCutGridID(ix) end

---触发器接口（环境表导出）
---@param data any
---@param itemnum any
---@param itemid any
function Trigger.Player:UseItem(data, itemnum, itemid) end

---@class Trigger.Timeline
Trigger.Timeline = {}

---触发器接口（环境表导出）
---@param filename any
function Trigger.Timeline:GetDisplayName(filename) end

---触发器接口（环境表导出）
---@param data any
---@param filename any
function Trigger.Timeline:Pause(data, filename) end

---触发器接口（环境表导出）
---@param data any
---@param filename any
---@param playRef any
---@param a any
---@param b any
function Trigger.Timeline:PlayForPlayer(data, filename, playRef, a, b) end

---触发器接口（环境表导出）
---@param data any
---@param filename any
function Trigger.Timeline:Resume(data, filename) end

---触发器接口（环境表导出）
---@param data any
function Trigger.Timeline:SkipForPlayer(data) end

---@class Trigger.World
Trigger.World = {}

---触发器接口（环境表导出）
---@param pos1 any
---@param pos2 any
function Trigger.World:CalcDirectionByPos2Pos(pos1, pos2) end

---触发器接口（环境表导出）
---@param posSrc any
---@param posDst any
function Trigger.World:CalcHorizontalAngle(posSrc, posDst) end

---触发器接口（环境表导出）
---@param vec1 any
---@param vec2 any
function Trigger.World:CalcVectorDirectionAngle(vec1, vec2) end

---触发器接口（环境表导出）
---@param posSrc any
---@param posDst any
function Trigger.World:CalcVerticalAngle(posSrc, posDst) end

---触发器接口（环境表导出）
---@param pos any
---@param worldId any
function Trigger.World:CanMobSpawnOnPosXZ(pos, worldId) end

---触发器接口（环境表导出）
---@param v1 any
---@param v2 any
function Trigger.World:CompareBiomeGroup(v1, v2) end

---触发器接口（环境表导出）
---@param isequal any
---@param mode any
function Trigger.World:CompareGameMode(isequal, mode) end

---触发器接口（环境表导出）
---@param killtype any
---@param data any
function Trigger.World:DespawnActor(killtype, data) end

---触发器接口（环境表导出）
---@param data any
function Trigger.World:DespawnAreas(data) end

---触发器接口（环境表导出）
---@param data any
function Trigger.World:DespawnObject(data) end

---触发器接口（环境表导出）
---@param pos any
---@param worldId any
function Trigger.World:GetBiomeGroup(pos, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param gridid any
---@param attr any
---@param worldId any
function Trigger.World:GetContainerGridAttr(pos, gridid, attr, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param gridid any
---@param worldId any
function Trigger.World:GetContainerStorageItem(pos, gridid, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param v any
function Trigger.World:GetCoord(pos, v) end

---触发器接口（环境表导出）
---@param posbegin any
---@param dir any
---@param maxlen any
---@param itype any
---@param worldId any
function Trigger.World:GetDirRayDetection(posbegin, dir, maxlen, itype, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param worldId any
function Trigger.World:GetLightByPos(pos, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param face any
---@param distance any
function Trigger.World:GetRayBlock(pos, face, distance) end

---触发器接口（环境表导出）
---@param posbegin any
---@param dir any
---@param maxlen any
---@param itype any
---@param worldId any
function Trigger.World:GetRayDetectionPos(posbegin, dir, maxlen, itype, worldId) end

---触发器接口（环境表导出）
---@param pos1 any
---@param pos2 any
---@param distance any
function Trigger.World:GetRayLength(pos1, pos2, distance) end

---触发器接口（环境表导出）
---@param worldid any
function Trigger.World:GetSpawnPoint(worldid) end

---触发器接口（环境表导出）
---@param pos any
---@param worldId any
function Trigger.World:IsChunkLoaded(pos, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param x any
---@param y any
---@param z any
function Trigger.World:OffsetPos(pos, x, y, z) end

---触发器接口（环境表导出）
---@param pos any
---@param x any
---@param y any
---@param z any
function Trigger.World:OffsetPosVal(pos, x, y, z) end

---触发器接口（环境表导出）
---@param pos any
---@param musicId any
---@param worldId any
function Trigger.World:PaseOrResumeSoundEffectOnPos(pos, musicId, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param musicId any
---@param worldId any
function Trigger.World:PauseSoundEffectOnPos(pos, musicId, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param particleIds any
---@param ptime any
---@param offset any
---@param rot any
---@param scale any
---@param worldId any
function Trigger.World:PlayParticle(pos, particleIds, ptime, offset, rot, scale, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param particleId any
---@param scale any
---@param ptime any
function Trigger.World:PlayParticleEffect(pos, particleId, scale, ptime) end

---触发器接口（环境表导出）
---@param pos any
---@param musicId any
---@param worldId any
function Trigger.World:ResumeSoundEffectOnPos(pos, musicId, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param gridid any
---@param attr any
---@param value any
function Trigger.World:SetContainerGridAttr(pos, gridid, attr, value) end

---触发器接口（环境表导出）
---@param pos any
---@param value any
---@param worldId any
function Trigger.World:SetLightByPos(pos, value, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param particleId any
---@param sclae any
function Trigger.World:SetParticleEffectScale(pos, particleId, sclae) end

---触发器接口（环境表导出）
---@param pos any
---@param particleIds any
---@param offset any
---@param rot any
---@param scale any
---@param worldId any
function Trigger.World:SetParticleTransform(pos, particleIds, offset, rot, scale, worldId) end

---触发器接口（环境表导出）
---@param data any
---@param itype any
---@param color any
---@param animId any
---@param animTime any
---@param worldid any
function Trigger.World:SetSkyBoxColorAnim(data, itype, color, animId, animTime, worldid) end

---触发器接口（环境表导出）
---@param data any
---@param itype any
---@param value any
---@param worldid any
function Trigger.World:SetSkyBoxFilter(data, itype, value, worldid) end

---触发器接口（环境表导出）
---@param playerid any
---@param value any
---@param worldid any
function Trigger.World:SetSkyBoxFilterColor(playerid, value, worldid) end

---触发器接口（环境表导出）
---@param data any
---@param value any
---@param animId any
---@param animTime any
---@param worldid any
function Trigger.World:SetSkyBoxFilterColorAnim(data, value, animId, animTime, worldid) end

---触发器接口（环境表导出）
---@param playerid any
---@param value any
---@param worldid any
function Trigger.World:SetSkyBoxFilterLUT(playerid, value, worldid) end

---触发器接口（环境表导出）
---@param playerid any
---@param value any
---@param worldid any
function Trigger.World:SetSkyBoxFilterTemplate(playerid, value, worldid) end

---触发器接口（环境表导出）
---@param data any
---@param itype any
---@param url any
---@param animId any
---@param animTime any
---@param worldid any
function Trigger.World:SetSkyBoxMapsAnim(data, itype, url, animId, animTime, worldid) end

---触发器接口（环境表导出）
---@param obiid any
---@param pos any
function Trigger.World:SetSpawnPoint(obiid, pos) end

---触发器接口（环境表导出）
---@param pos any
---@param offset any
---@param itemid any
---@param num any
---@param worldId any
function Trigger.World:SetStorageItem(pos, offset, itemid, num, worldId) end

---触发器接口（环境表导出）
---@param pos any
---@param itemid any
---@param dst any
---@param worldId any
function Trigger.World:SpawnProjectileOnPos(pos, itemid, dst, worldId) end

---触发器接口（环境表导出）
---@param objid any
---@param dir any
---@param itemid any
function Trigger.World:SpawnShooterProjectile(objid, dir, itemid) end

---触发器接口（环境表导出）
---@param pos any
---@param objid any
---@param itemid any
---@param dst any
function Trigger.World:SpawnShooterProjectileByPos(pos, objid, itemid, dst) end

---触发器接口（环境表导出）
---@param pos any
---@param particleIds any
function Trigger.World:StopParticleEffectOnPos(pos, particleIds) end

---触发器接口（环境表导出）
---@param pos any
---@param particleIds any
---@param worldId any
function Trigger.World:StopParticleOnPos(pos, particleIds, worldId) end

---触发器接口（环境表导出）
---@param x any
---@param y any
---@param z any
function Trigger.World:XyzToPos(x, y, z) end

---触发器接口（环境表导出）
function Trigger:AllAttackType() end

---触发器接口（环境表导出）
function Trigger:AllSound() end

---触发器接口（环境表导出）
---@param data any
function Trigger:AllStatus(data) end

---触发器接口（环境表导出）
---@param value any
function Trigger:AnyValue2Str(value) end

---触发器接口（环境表导出）
---@param src any
---@param fn any
function Trigger:DoObjOrArrayAction(src, fn) end

---触发器接口（环境表导出）
---@param param any
function Trigger:GetAttrVal(param) end

---触发器接口（环境表导出）
---@param cmp any
function Trigger:GetEffectParams(cmp) end

---触发器接口（环境表导出）
---@param uiID any
---@param elementid any
function Trigger:GetElementID(uiID, elementid) end

---触发器接口（环境表导出）
function Trigger:GetLastCreateBlockId() end

---触发器接口（环境表导出）
function Trigger:GetLastCreateCreatureId() end

---触发器接口（环境表导出）
function Trigger:GetLastCreateCreatureObjId() end

---触发器接口（环境表导出）
function Trigger:GetLastCreateEffectId() end

---触发器接口（环境表导出）
function Trigger:GetLastCreateItemId() end

---触发器接口（环境表导出）
---@param cmp any
function Trigger:GetMobId(cmp) end

---触发器接口（环境表导出）
---@param cmp any
function Trigger:GetPlayerId(cmp) end

---触发器接口（环境表导出）
---@param id any
function Trigger:GetPrefabIdStr(id) end

---触发器接口（环境表导出）
---@param id any
---@param objType any
function Trigger:GetPrefabInfo(id, objType) end

---触发器接口（环境表导出）
function Trigger:GetRandomColor() end

---触发器接口（环境表导出）
---@param str any
function Trigger:GetStringLength(str) end

---触发器接口（环境表导出）
---@param id any
function Trigger:GetUIObject(id) end

---触发器接口（环境表导出）
function Trigger:GetWorld() end

---触发器接口（环境表导出）
---@param tag any
---@vararg any
function Trigger:PrintTag(tag, ...) end

---触发器接口（环境表导出）
---@param blockid any
function Trigger:SetLastCreateBlockId(blockid) end

---触发器接口（环境表导出）
---@param actorid any
function Trigger:SetLastCreateCreatureId(actorid) end

---触发器接口（环境表导出）
---@param effectid any
function Trigger:SetLastCreateEffectId(effectid) end

---触发器接口（环境表导出）
---@param itemid any
function Trigger:SetLastCreateItemId(itemid) end

---触发器接口（环境表导出）
---@param str any
---@param mark any
---@param index any
function Trigger:SplitStr(str, mark, index) end

---触发器接口（环境表导出）
---@param itype any
---@param str any
function Trigger:Str2Obj(itype, str) end

---触发器接口（环境表导出）
---@param str any
function Trigger:String2Playerid(str) end

---触发器接口（环境表导出）
---@param content any
---@param startIdx any
---@param endIdx any
function Trigger:Substring(content, startIdx, endIdx) end

---触发器接口（环境表导出）
---@param id any
function Trigger:ToMobId(id) end

---触发器接口（环境表导出）
---@param id any
function Trigger:ToPlayerId(id) end

---触发器接口（环境表导出）
---**调用限制**: 仅白名单用户可用
---@vararg any
function Trigger:TransmitToCategoryRoom(...) end

---触发器接口（环境表导出）
---@param second any
---@param cmp any
function Trigger:Wait(second, cmp) end
