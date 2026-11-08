---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Player<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---角色造成伤害
---@param objid? any 对象ID
---@param targetid any 目标对象ID
---@param damage any 伤害值
---@param attacktype? any 攻击类型
---@param ignoreResist? boolean 是否忽略抗性
---@param ignoreTriggerEvent any 是否忽略触发事件
---@return boolean result 是否成功
function Player:ActorHurt(objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end

---角色造成伤害区域
---@param objid any 对象ID
---@param areaid any 区域ID
---@param damage any 伤害值
---@param attacktype any 攻击类型
---@param ignoreList any 忽略列表
---@param ignoreResist any 是否忽略抗性
---@param ignoreTriggerEvent any 是否忽略触发事件
function Player:ActorHurtArea(objid, areaid, damage, attacktype, ignoreList, ignoreResist, ignoreTriggerEvent) end

---添加血量
---@param objid any 对象ID
---@param hp number 血量
---@return boolean result 是否成功
function Player:AddHp(objid, hp) end

---添加模组属性
---@param objid any 对象ID
---@param attrtype number 属性类型
---@param value number 值
---@return boolean result 是否成功
function Player:AddModAttrib(objid, attrtype, value) end

---添加标签
---@param objid any 对象ID
---@param tags any 标签
---@param icount any 引用计数
---@return boolean result 是否成功
function Player:AddTags(objid, tags, icount) end

---追加速度
---@param objid any 对象ID
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@return boolean result 是否成功
function Player:AppendSpeed(objid, x, y, z) end

---ban使用strength
---@param objid any 对象ID
---@return boolean result 是否成功
function Player:BanUseStrength(objid) end

---capture玩家
---@param playerid any 玩家ID
---@param targetId any 目标对象ID
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@return boolean result 是否成功
function Player:CapturePlayer(playerid, targetId, x, y, z) end

---变更角色移动类型
---@param objid any 对象ID
---@param moveMode number 移动模式
---@return boolean result 是否成功
function Player:ChangActorMoveType(objid, moveMode) end

---变更自定义模型
---@param objid any 对象ID
---@param modleName? any modle名称
---@return boolean result 是否成功
function Player:ChangeCustomModel(objid, modleName) end

---为模组变更skin纹理
---@param playerid any 玩家ID
---@param skinPath? string 参数 skinPath
---@param partModelName string | table 部件模型名称
---@param hideFace boolean 参数 hideFace
---@param isAvatar any 是否avatar
---@return boolean result 是否成功
function Player:ChangeSkinTextureForMod(playerid, skinPath, partModelName, hideFace, isAvatar) end

---变更界面模式survive
---@param objid any 对象ID
---@param viewmode any 参数 viewmode
---@param islock any 是否锁定
---@return boolean result 是否成功
function Player:ChangeViewModeSurvive(objid, viewmode, islock) end

---检查自定义orderID
---@param call_back function 回调函数
---@param uin any 玩家Uin
---@param orderids string | table 参数 orderids
function Player:CheckCustomOrderID(call_back, uin, orderids) end

---检查枪械类型
---@param objid any 对象ID
---@param gunType number 枪械类型
---@return boolean result 检查结果
function Player:CheckGunType(objid, gunType) end

---检查地图商店order
---@param call_back any 回调函数
---@param uin number 玩家Uin
---@param orderid string orderID
---@return boolean result 检查结果
function Player:CheckMapShopOrder(call_back, uin, orderid) end

---检查real房主判断是否developer
---@return boolean result 检查结果
function Player:CheckRealOwnerIsDeveloper() end

---检查同步动作
---@param actor any 角色
function Player:CheckSyncAction(actor) end

---使用ID清空角色
---@param actorid? number | string 角色ID
---@param bkill? boolean 参数 bkill
---@param worldId any 星球ID
---@return boolean result 是否成功
function Player:ClearActorWithId(actorid, bkill, worldId) end

---清空标签
---@param objid any 对象ID
---@return boolean result 是否成功
function Player:ClearTags(objid) end

---清空taskdirty状态
---@return boolean result 是否成功
function Player:ClearTaskDirtyState() end

---关闭枪械upgradeframe
---@param uin any 玩家Uin
---@return boolean result 是否成功
function Player:CloseGunUpgradeFrame(uin) end

---关闭role属性frame
---@param uin any 玩家Uin
---@return boolean result 是否成功
function Player:CloseRoleAttrFrame(uin) end

---比较主模型
---@param facade1 string 参数 facade1
---@param facade2 string 参数 facade2
---@return boolean result 检查结果
function Player:CompareMainModel(facade1, facade2) end

---del地图商店backorder
---@param uin any 玩家Uin
---@param scene any 场景
---@return boolean result 是否成功
function Player:DelMapShopBackOrder(uin, scene) end

---dis骑乘角色
---@param objid any 对象ID
---@return boolean result 是否成功
function Player:DisMountActor(objid) end

---掉落角色
---@param objid any 对象ID
---@param dir Mini.Vec3 方向
---@param isThrow boolean 是否投掷
---@param speed number 速度
---@param hasInertance boolean 是否有惯性
---@return boolean result 是否成功
function Player:DropActor(objid, dir, isThrow, speed, hasInertance) end

---按shooter发射
---@param objid number 对象ID
---@param emitid number 发射物ID
---@return boolean result 是否成功
function Player:EmitByShooter(objid, emitid) end

---按shootertarget发射
---@param objidA number 对象A的ID
---@param emitid number 发射物ID
---@param objidB number 对象B的ID
---@return boolean result 是否成功
function Player:EmitByShooterTarget(objidA, emitid, objidB) end

---按shootertarget位置发射
---@param objid number 对象ID
---@param emitid number 发射物ID
---@param targetPos any 参数 targetPos
---@return boolean result 是否成功
function Player:EmitByShooterTargetPos(objid, emitid, targetPos) end

---启用更新run
---@param uin? any 玩家Uin
---@param enable any 是否启用
---@return boolean result 是否成功
function Player:EnableUpdateRun(uin, enable) end

---escape拾取
---@param objid any 对象ID
---@return boolean result 是否成功
function Player:EscapePickup(objid) end

---查找等级最近方块
---@param objid? any 对象ID
---@param blockid? string 方块ID
---@param blockRange number 方块范围
function Player:FindLevelNearestBlock(objid, blockid, blockRange) end

---查找等级随机排序方块
---@param objid? any 对象ID
---@param blockid? string 方块ID
---@param blockRange number 方块范围
function Player:FindLevelRandomsortBlock(objid, blockid, blockRange) end

---查找最近方块
---@param objid any 对象ID
---@param blockid number | string 方块ID
---@param blockRange number 方块范围
function Player:FindNearestBlock(objid, blockid, blockRange) end

---finish地图商店order
---@param ishost any 是否Host
---@param uin number 玩家Uin
---@param orderid string orderID
---@return boolean result 是否成功
function Player:FinishMapShopOrder(ishost, uin, orderid) end

---gain道具
---@param objid any 对象ID
---@param itemid? string 道具ID
---@param num any 数量
---@param prioritytype any 参数 prioritytype
function Player:GainItems(objid, itemid, num, prioritytype) end

---生成地图商店base信息
---@param uin any 玩家Uin
---@param scene any 场景
---@param payment any 参数 payment
---@param paynum any pay数量
---@param itemids number | table 参数 itemids
---@param itemnums number | table 参数 itemnums
---@param extends table 参数 extends
---@param call_back any 回调函数
---@return boolean result 是否成功
function Player:GenMapShopBaseInfo(uin, scene, payment, paynum, itemids, itemnums, extends, call_back) end

---获取动作属性状态
---@param objid? any 对象ID
---@param actionattr number 动作属性
function Player:GetActionAttrState(objid, actionattr) end

---获取角色方向
---@param objid? any 对象ID
---@param itype number 类型
function Player:GetActorDir(objid, itype) end

---获取角色外观
---@param objid any 对象ID
---@param bhasequip any 参数 bhasequip
function Player:GetActorFacade(objid, bhasequip) end

---获取角色movement模式
---@param objid any 对象ID
function Player:GetActorMovementMode(objid) end

---获取角色permissions
---@param objid any 对象ID
---@param ability any 能力
function Player:GetActorPermissions(objid, ability) end

---获取属性
---@param objid? any 对象ID
---@param attrtype number 属性类型
function Player:GetAttr(objid, attrtype) end

---获取身体大小
---@param objid any 对象ID
---@param bodySizeType any 身体大小类型
function Player:GetBodySize(objid, bodySizeType) end

---获取boundszie
---@param objid? any 对象ID
function Player:GetBoundSzie(objid) end

---获取btreevar值
---@param objid number 对象ID
---@param varid string 变量ID
function Player:GetBtreeVarValue(objid, varid) end

---获取购买道具recoder
---@param call_back any 回调函数
---@param uin any 玩家Uin
---@param itemids table 参数 itemids
---@return boolean value 是否成功
function Player:GetBuyItemRecoder(call_back, uin, itemids) end

---获取相机rot
---@param playerid any 玩家ID
function Player:GetCameraRot(playerid) end

---获取蓄力最大数量
---@param objid? any 对象ID
---@param slot number 槽位
function Player:GetChargingMaxNum(objid, slot) end

---获取蓄力最大时间
---@param objid? any 对象ID
---@param slot number 槽位
function Player:GetChargingMaxTime(objid, slot) end

---获取蓄力数量
---@param objid? any 对象ID
---@param slot number 槽位
function Player:GetChargingNum(objid, slot) end

---获取蓄力时间
---@param objid? any 对象ID
---@param slot number 槽位
function Player:GetChargingTime(objid, slot) end

---获取cmpbase状态
---@param objid any 对象ID
---@param actionattr number 动作属性
---@return boolean value 是否成功
function Player:GetCmpBaseState(objid, actionattr) end

---获取cur地图ID
---@param objid any 对象ID
function Player:GetCurMapId(objid) end

---获取当前地图ID
---@param objid any 对象ID
function Player:GetCurrMapId(objid) end

---获取defID
---@param objid any 对象ID
function Player:GetDefID(objid) end

---获取dirtyobjectivetask信息
---@param uin any 玩家Uin
function Player:GetDirtyObjectiveTaskInfo(uin) end

---获取dirtyobjectivetaskuins
function Player:GetDirtyObjectiveTaskUins() end

---获取dirtytask信息
---@param uin any 玩家Uin
function Player:GetDirtyTaskInfo(uin) end

---获取dirtytaskuins
function Player:GetDirtyTaskUins() end

---获取掉落道具instanceID
---@param objid any 对象ID
function Player:GetDropItemInstanceId(objid) end

---获取掉落道具数量
---@param objid any 对象ID
function Player:GetDropItemNum(objid) end

---获取实体外观
---@param prefab any 参数 prefab
function Player:GetEntityFacade(prefab) end

---获取eyeheight
---@param objid any 对象ID
function Player:GetEyeHeight(objid) end

---获取朝向方向
---@param objid any 对象ID
---@return table? value 结果，失败时为 nil
function Player:GetFaceDirection(objid) end

---获取朝向音高
---@param objid? any 对象ID
function Player:GetFacePitch(objid) end

---获取朝向yaw
---@param objid? any 对象ID
function Player:GetFaceYaw(objid) end

---获取food等级
---@param objid any 对象ID
function Player:GetFoodLevel(objid) end

---获取游戏results
---@param objid any 对象ID
function Player:GetGameResults(objid) end

---获取游戏分数
---@param objid any 对象ID
function Player:GetGameScore(objid) end

---获取枪械造成伤害类型
---@param objid any 对象ID
---@return number value 结果数值
function Player:GetGunDamageType(objid) end

---获取枪械信息
---@param objid any 对象ID
function Player:GetGunInfo(objid) end

---获取道具ID
---@param objid any 对象ID
function Player:GetItemId(objid) end

---获取最近下落速度
---@param objid any 对象ID
---@return number value 结果数值
function Player:GetLastFallSpeed(objid) end

---获取等级模式
function Player:GetLevelMode() end

---获取主模型
---@param facade string 外观
---@return string? value 结果，失败时为 nil
function Player:GetMainModel(facade) end

---获取主玩家Uin
function Player:GetMainPlayerUin() end

---获取mall模型
---@param reportid any 同步报告ID
---@param objid any 对象ID
---@return boolean value 是否成功
function Player:GetMallModel(reportid, objid) end

---获取地图商店全部不finishorder
---@param uin number 玩家Uin
---@param call_back any 回调函数
---@return boolean value 是否成功
function Player:GetMapShopAllNoFinishOrder(uin, call_back) end

---获取最大血量
---@param objid any 对象ID
function Player:GetMaxHP(objid) end

---获取运动
---@param objid any 对象ID
function Player:GetMotion(objid) end

---获取nick名称
---@param objid any 对象ID
function Player:GetNickName(objid) end

---获取对象类型
---@param objid any 对象ID
function Player:GetObjType(objid) end

---获取对象世界ID
---@param objid any 对象ID
---@return number value 结果数值
function Player:GetObjWorldId(objid) end

---获取朝向
---@param objid any 对象ID
function Player:GetOrientation(objid) end

---获取覆盖重力
---@param objid? any 对象ID
function Player:GetOverlayGravity(objid) end

---获取拾取对象ID
---@param objid any 对象ID
---@param roleType any 角色类型
---@return number value 结果数值
function Player:GetPickupObjID(objid, roleType) end

---获取位置
---@param objid any 对象ID
function Player:GetPosition(objid) end

---获取riding角色对象ID
---@param objid any 对象ID
---@return number value 结果数值
function Player:GetRidingActorObjId(objid) end

---获取settingability
---@param playerid? any 玩家ID
---@param itype number 类型
---@return boolean value 是否成功
function Player:GetSettingAbility(playerid, itype) end

---获取技能冷却
---@param objid any 对象ID
---@param itemid? string 道具ID
function Player:GetSkillCD(objid, itemid) end

---获取技能cur冷却
---@param objid any 对象ID
---@param itemid? string 道具ID
---@param spellID any spellID
function Player:GetSkillCurCD(objid, itemid, spellID) end

---获取技能最大冷却
---@param objid? any 对象ID
---@param slot number 槽位
function Player:GetSkillMaxCD(objid, slot) end

---按horseID获取skinID
---@param horseid any horseID
---@return number value 结果数值
function Player:GetSkinIDByHorseID(horseid) end

---获取skin模型ID
---@param uin number 玩家Uin
function Player:GetSkinModelId(uin) end

---获取标签
---@param objid any 对象ID
function Player:GetTags(objid) end

---获取队伍
---@param objid any 对象ID
function Player:GetTeam(objid) end

---获取触发operate禁用
---@param uin any 玩家Uin
---@param attr any 属性
---@return boolean value 是否成功
function Player:GetTriggerOperateDisable(uin, attr) end

---获取世界地图ID
---@param uin any 玩家Uin
---@return number value 结果数值
function Player:GetWorldMapId(uin) end

---枪械启用ads
---@param uin any 玩家Uin
---@param b any 参数 B
---@return boolean result 是否成功
function Player:GunEnableAds(uin, b) end

---枪械启用hittedshake
---@param uin any 玩家Uin
---@param b any 参数 B
---@return boolean result 是否成功
function Player:GunEnableHittedShake(uin, b) end

---判断是否拥有角色
---@param objid any 对象ID
function Player:HasActor(objid) end

---判断是否拥有标签
---@param objid any 对象ID
---@param tags any 标签
---@param mathcmode number 匹配方式
---@param bexactmatch boolean 是否精确匹配
---@return boolean result 是否满足条件
function Player:HasTags(objid, tags, mathcmode, bexactmatch) end

---增加属性
---@param objid any 对象ID
---@param atttype any 属性类型
---@param val number 值
---@return boolean result 是否成功
function Player:IncreasesAttr(objid, atttype, val) end

---初始化触发全局数据
function Player:InitTriggerGlobalData() end

---判断是否exist
---@param objid any 对象ID
---@return boolean result 是否满足条件
function Player:IsExist(objid) end

---判断是否拥有技能
---@param objid? any 对象ID
---@param slot number 槽位
---@return boolean? result 结果，失败时为 nil
function Player:IsHaveSkill(objid, slot) end

---判断是否主玩家
---@param objid any 对象ID
---@return boolean result 是否满足条件
function Player:IsMainPlayer(objid) end

---判断是否生物
---@param objid any 对象ID
---@return boolean result 是否满足条件
function Player:IsMob(objid) end

---判断是否玩家
---@param objid any 对象ID
---@return boolean result 是否满足条件
function Player:IsPlayer(objid) end

---跳跃
---@param objid any 对象ID
---@return boolean result 是否成功
function Player:Jump(objid) end

---击杀自身
---@param objid any 对象ID
---@return boolean result 是否成功
function Player:KillSelf(objid) end

---按云端var加载objectivetask信息
---@param uin any 玩家Uin
---@param jsonstr any 参数 jsonstr
function Player:LoadObjectiveTaskInfoByCloudVar(uin, jsonstr) end

---按云端var加载task信息
---@param uin any 玩家Uin
---@param jsonstr any 参数 jsonstr
function Player:LoadTaskInfoByCloudVar(uin, jsonstr) end

---通知systemmsg2自身
---@param objid any 对象ID
---@param info any 信息
function Player:NotifySystemMsg2Self(objid, info) end

---oncurtoolused
---@param objid any 对象ID
---@param num any 数量
---@return boolean result 是否成功
function Player:OnCurToolUsed(objid, num) end

---打开装备frame
---@param uin any 玩家Uin
---@param openType any 参数 openType
---@param level any 等级
---@param mcoin any 参数 mcoin
---@param extraItemOdds any 参数 extraItemOdds
---@param consumeOdds any 参数 consumeOdds
---@return boolean result 是否成功
function Player:OpenEquipFrame(uin, openType, level, mcoin, extraItemOdds, consumeOdds) end

---打开枪械upgradeframe
---@param uin any 玩家Uin
---@return boolean result 是否成功
function Player:OpenGunUpgradeFrame(uin) end

---打开inner道具tips
---@param objid any 对象ID
---@param content? string | table 内容
---@return boolean result 是否成功
function Player:OpenInnerItemTips(objid, content) end

---打开商店minicoin界面
---@param uin any 玩家Uin
---@return boolean result 是否成功
function Player:OpenShopMiniCoinView(uin) end

---打开summer动作界面
---@vararg any
---@return boolean result 是否成功
function Player:OpenSummerActView(...) end

---打开task主界面
---@param uin any 玩家Uin
function Player:OpenTaskMainUI(uin) end

---打开tasktrace界面
---@param uin any 玩家Uin
function Player:OpenTaskTraceUI(uin) end

---整理外观列表
function Player:OrganizeFacadeList() end

---按ID暂停音效特效
---@param objid any 对象ID
---@param soundId number 音效ID
---@param pause boolean 是否暂停
---@return boolean result 是否成功
function Player:PauseSoundEffectById(objid, soundId, pause) end

---pay地图商店order
---@param ishost any 是否Host
---@param uin number 玩家Uin
---@param scene string 场景
---@param payment number 参数 payment
---@param paynum number pay数量
---@param itemids any 参数 itemids
---@param itemnums any 参数 itemnums
---@param extends any 参数 extends
---@param call_back function 回调函数
---@return boolean result 是否成功
function Player:PayMapShopOrder(ishost, uin, scene, payment, paynum, itemids, itemnums, extends, call_back) end

---拾取角色
---@param objidA any 对象A的ID
---@param objidB any 对象B的ID
---@param actionA any 参数 actionA
---@param actionB any 参数 actionB
---@param offest Mini.Vec3 偏移
---@param rotate Mini.Vec3 旋转
---@param playemode any 参数 playemode
---@param playspeed? number 参数 playspeed
---@param anchorId? any 锚点ID
---@return boolean result 是否成功
function Player:PickupActor(objidA, objidB, actionA, actionB, offest, rotate, playemode, playspeed, anchorId) end

---拾取道具
---@param objid number 对象ID
---@param itemobjid number itemobjID
---@param bforcepickup? boolean 参数 bforcepickup
---@return number result 结果数值
function Player:PickupItem(objid, itemobjid, bforcepickup) end

---播放动作
---@param objid any 对象ID
---@param actid number 动作ID
---@return boolean result 是否成功
function Player:PlayAct(objid, actid) end

---在hand中播放动作
---@param playerid any 玩家ID
---@param animid any 动画ID
---@param playmode any 播放模式
---@return boolean result 是否成功
function Player:PlayActInHand(playerid, animid, playmode) end

---播放advertising回调
---@param objid? any 对象ID
---@param adname any ad名称
---@param callback any 回调函数
---@return boolean result 是否成功
function Player:PlayAdvertisingCallback(objid, adname, callback) end

---在客户端上播放advertising
---@param reportid any 同步报告ID
---@param objid any 对象ID
---@param adname any ad名称
---@return boolean result 是否成功
function Player:PlayAdvertising_OnClient(reportid, objid, adname) end

---播放动画
---@param objid any 对象ID
---@param animid any 动画ID
---@param speed any 速度
---@param loop number | boolean 循环
---@return boolean result 是否成功
function Player:PlayAnim(objid, animid, speed, loop) end

---按ID播放动画
---@param playerid number 玩家ID
---@param id any ID
---@return boolean result 是否成功
function Player:PlayAnimById(playerid, id) end

---按对象播放动画
---@param objidA number 对象A的ID
---@param objidB number 对象B的ID
---@param breplay any 参数 breplay
---@return boolean result 是否成功
function Player:PlayAnimByObj(objidA, objidB, breplay) end

---播放身体特效
---@param objid any 对象ID
---@param itype number | string 类型
---@return boolean result 是否成功
function Player:PlayBodyEffect(objid, itype) end

---按文件播放身体特效
---@param objid any 对象ID
---@param filename string 文件名
---@param sync? boolean 是否同步
---@return boolean result 是否成功
function Player:PlayBodyEffectByFile(objid, filename, sync) end

---按ID播放身体特效
---@param objid any 对象ID
---@param particleId any 粒子ID
---@param scale? number 缩放
---@param ptme any 粒子时长
---@return boolean result 是否成功
function Player:PlayBodyEffectById(objid, particleId, scale, ptme) end

---按ID播放身体粒子
---@param objid any 对象ID
---@param particleId number | string 粒子ID
---@param ptme number 粒子时长
---@param offset? Mini.Vec3 偏移
---@param rot? Mini.Vec3 旋转
---@param scale? Mini.Vec3 缩放
---@return boolean result 是否成功
function Player:PlayBodyParticleById(objid, particleId, ptme, offset, rot, scale) end

---播放hand动画
---@param uin? any 玩家Uin
---@param animid any 动画ID
---@param speed? number 速度
---@param playmode? number 播放模式
---@param crassfade? number 参数 crassfade
---@return boolean result 是否成功
function Player:PlayHandAnim(uin, animid, speed, playmode, crassfade) end

---播放handtool动画
---@param uin? any 玩家Uin
---@param animid any 动画ID
---@param speed? number 速度
---@param playmode? number 播放模式
---@param crassfade? number 参数 crassfade
---@return boolean result 是否成功
function Player:PlayHandToolAnim(uin, animid, speed, playmode, crassfade) end

---播放技能
---@param objid? any 对象ID
---@param slot number 槽位
---@return boolean result 是否成功
function Player:PlaySkill(objid, slot) end

---按名称播放音效
---@param objid any 对象ID
---@param name string 名称
---@param volume number 音量
---@param pitch number 音高
---@param flag number 开关
---@return boolean result 是否成功
function Player:PlaySoundByName(objid, name, volume, pitch, flag) end

---按ID播放音效特效
---@param objid any 对象ID
---@param soundId number 音效ID
---@param volume number 音量
---@param pitch number 音高
---@param isLoop boolean 是否循环
---@return boolean result 是否成功
function Player:PlaySoundEffectById(objid, soundId, volume, pitch, isLoop) end

---玩家造成伤害
---@param objid any 对象ID
---@param targetid any 目标对象ID
---@param damage any 伤害值
---@param attacktype any 攻击类型
---@param ignoreResist any 是否忽略抗性
---@param ignoreTriggerEvent any 是否忽略触发事件
function Player:PlayerHurt(objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end

---random外观ID
function Player:RandomFacadeID() end

---recoverinitial模型
---@param ishost any 是否Host
---@param objid? any 对象ID
---@return boolean result 是否成功
function Player:RecoverinitialModel(ishost, objid) end

---刷新道具tips
---@param uin any 玩家Uin
---@param itemData any 道具数据
---@return boolean result 是否成功
function Player:RefreshItemTips(uin, itemData) end

---移除背包道具
---@param objid any 对象ID
---@param itemid? string 道具ID
---@param num any 数量
---@return boolean result 是否成功
function Player:RemoveBackpackItem(objid, itemid, num) end

---移除标签
---@param objid any 对象ID
---@param tags any 标签
---@param icount any 引用计数
---@return boolean result 是否成功
function Player:RemoveTags(objid, tags, icount) end

---请求消耗coin
---@param reportid any 同步报告ID
---@param uin any 玩家Uin
---@param conid any conID
---@param num any 数量
---@param orderid any orderID
function Player:RequestCostCoin(reportid, uin, conid, num, orderid) end

---请求exchangecoins
---@param uin any 玩家Uin
---@param conid any conID
---@param num any 数量
---@param index? number 索引
function Player:RequestExchangeCoins(uin, conid, num, index) end

---重置触发全局数据
function Player:ResetTriggerGlobalData() end

---旋转朝向转换为角色
---@param objid any 对象ID
---@param targetid any 目标对象ID
---@return boolean result 是否成功
function Player:RotateFaceToActor(objid, targetid) end

---设置ablepick
---@param objid number 对象ID
---@param able boolean 参数 able
---@return boolean result 是否成功
function Player:SetAblePick(objid, able) end

---设置动作属性状态
---@param objid any 对象ID
---@param actionattr any 动作属性
---@param switch any 开关
---@return boolean result 是否成功
function Player:SetActionAttrState(objid, actionattr, switch) end

---设置角色控制
---@param objid? any 对象ID
---@param b boolean 参数 B
---@return boolean result 是否成功
function Player:SetActorControl(objid, b) end

---设置角色方向
---@param objid? any 对象ID
---@param itype number 类型
---@param value any 值
---@return boolean result 是否成功
function Player:SetActorDir(objid, itype, value) end

---设置角色permissions
---@param objid any 对象ID
---@param ability any 能力
---@param switch any 开关
function Player:SetActorPermissions(objid, ability, switch) end

---设置属性
---@param objid any 对象ID
---@param attrtype any 属性类型
---@param val any 值
---@return boolean result 是否成功
function Player:SetAttr(objid, attrtype, val) end

---设置be造成伤害target
---@param objid any 对象ID
---@param targetid any 目标对象ID
---@return boolean result 是否成功
function Player:SetBeHurtTarget(objid, targetid) end

---设置受击禁用
---@param objid any 对象ID
---@param value boolean 值
---@return boolean result 是否成功
function Player:SetBehitDisable(objid, value) end

---设置身体特效缩放
---@param objid any 对象ID
---@param particleId any 粒子ID
---@param scale any 缩放
---@return boolean result 是否成功
function Player:SetBodyEffectScale(objid, particleId, scale) end

---按文件设置身体特效缩放
---@param objid number 对象ID
---@param filename any 文件名
---@param scale number 缩放
---@return boolean result 是否成功
function Player:SetBodyEffectScaleByFile(objid, filename, scale) end

---设置身体粒子transform
---@param objid number 对象ID
---@param particleId number | string 粒子ID
---@param offset? Mini.Vec3 偏移
---@param rot? Mini.Vec3 旋转
---@param scale? Mini.Vec3 缩放
---@return boolean result 是否成功
function Player:SetBodyParticleTransform(objid, particleId, offset, rot, scale) end

---设置btreevar值
---@param objid number 对象ID
---@param varid string 变量ID
---@param val any 值
---@return boolean result 是否成功
function Player:SetBtreeVarValue(objid, varid, val) end

---设置相机lerp速度
---@param playerid number 玩家ID
---@param lerpspeed number 参数 lerpspeed
---@return boolean result 是否成功
function Player:SetCameraLerpSpeed(playerid, lerpspeed) end

---设置判断能否碰撞
---@param objid any 对象ID
---@param value boolean 值
---@return boolean result 是否成功
function Player:SetCanCollide(objid, value) end

---设置判断能否投掷
---@param ishost any 是否Host
---@param playerid any 玩家ID
---@param bThrow any 参数 bThrow
---@return boolean result 是否成功
function Player:SetCanThrow(ishost, playerid, bThrow) end

---设置蓄力
---@param objid? any 对象ID
---@param slot number 槽位
---@param ischarging boolean 是否蓄力中
---@return boolean result 是否成功
function Player:SetCharging(objid, slot, ischarging) end

---设置蓄力值
---@param objid? any 对象ID
---@param slot number 槽位
---@param value number 值
---@return boolean result 是否成功
function Player:SetChargingValue(objid, slot, value) end

---设置蓄力信息
---@param objid? any 对象ID
---@param slot number 槽位
---@param max number 最大
---@param num number 数量
---@param maxnum number 最大数量
---@param isauto boolean 是否自动
---@return boolean result 是否成功
function Player:SetCharginginfo(objid, slot, max, num, maxnum, isauto) end

---设置cmpbase状态
---@param objid any 对象ID
---@param actionattr number 动作属性
---@param switch boolean 开关
---@return boolean result 是否成功
function Player:SetCmpBaseState(objid, actionattr, switch) end

---设置自定义revie信息
---@param uin any 玩家Uin
---@param curnum number cur数量
---@param url any 资源地址
---@param name any 名称
---@param rsetdesc any 参数 rsetdesc
---@return boolean result 是否成功
function Player:SetCustomRevieInfo(uin, curnum, url, name, rsetdesc) end

---设置deathframevisible
---@param uin any 玩家Uin
---@param visible any 参数 visible
---@return boolean result 是否成功
function Player:SetDeathFrameVisible(uin, visible) end

---设置朝向方向
---@param objid any 对象ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return boolean result 是否成功
function Player:SetFaceDirection(objid, x, y, z) end

---设置朝向音高
---@param objid? any 对象ID
---@param pitch number 音高
---@return boolean result 是否成功
function Player:SetFacePitch(objid, pitch) end

---设置朝向yaw
---@param objid? any 对象ID
---@param yaw number 偏航角
---@return boolean result 是否成功
function Player:SetFaceYaw(objid, yaw) end

---设置first搜索
---@param objid any 对象ID
---@param firstsearch boolean 首次搜索
---@return boolean result 是否成功
function Player:SetFirstSearch(objid, firstsearch) end

---设置fishline结束点
---@param uin? any 玩家Uin
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@return boolean result 是否成功
function Player:SetFishLineEndPoint(uin, x, y, z) end

---设置food等级
---@param objid any 对象ID
---@param foodLevel any 参数 foodLevel
---@return boolean result 是否成功
function Player:SetFoodLevel(objid, foodLevel) end

---设置游戏分数
---@param objid any 对象ID
---@param score number 分数
---@return boolean result 是否成功
function Player:SetGameScore(objid, score) end

---设置handortool动画速度
---@param uin any 玩家Uin
---@param animtype? any 参数 animtype
---@param animid any 动画ID
---@param speed any 速度
---@return boolean result 是否成功
function Player:SetHandOrToolAnimSpeed(uin, animtype, animid, speed) end

---设置immune类型
---@param objid any 对象ID
---@param immunetype number 参数 immunetype
---@param isadd boolean 是否添加
---@return boolean result 是否成功
function Player:SetImmuneType(objid, immunetype, isadd) end

---设置模组属性
---@param objid any 对象ID
---@param attrtype number 属性类型
---@param value number 值
---@return boolean result 是否成功
function Player:SetModAttrib(objid, attrtype, value) end

---设置运动变更
---@param objid any 对象ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return boolean result 是否成功
function Player:SetMotionChange(objid, x, y, z) end

---设置骑乘角色属性
---@param objid any 对象ID
---@param isRote any 是否rote
---@param isPlayerContrl any 是否playercontrl
---@param isCloseAI any 是否closeai
function Player:SetMountActorAttr(objid, isRote, isPlayerContrl, isCloseAI) end

---设置nick名称
---@param objid any 对象ID
---@param nickname string nick名称
---@return boolean result 是否成功
function Player:SetNickName(objid, nickname) end

---设置不clip
---@param ishost any 是否Host
---@param uin? any 玩家Uin
---@param flag any 开关
---@return boolean result 是否成功
function Player:SetNoClip(ishost, uin, flag) end

---设置朝向
---@param objid any 对象ID
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@return boolean result 是否成功
function Player:SetOrientation(objid, x, y, z) end

---设置覆盖重力
---@param objid? any 对象ID
---@param val number 值
---@return boolean result 是否成功
function Player:SetOverlayGravity(objid, val) end

---设置polaroid界面visible
---@param playerid any 玩家ID
---@param bvisible any 参数 bvisible
---@param hidepto any 参数 hidepto
function Player:SetPolaroidViewVisible(playerid, bvisible, hidepto) end

---设置位置
---@param objid? any 对象ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return boolean result 是否成功
function Player:SetPosition(objid, x, y, z) end

---设置骑乘位置
---@param objid any 对象ID
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
function Player:SetRidePosition(objid, x, y, z) end

---设置缩放
---@param objid any 对象ID
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@return boolean result 是否成功
function Player:SetScale(objid, x, y, z) end

---设置技能冷却信息
---@param objid? any 对象ID
---@param slot number 槽位
---@param maxcd number 最大冷却
---@param isauto boolean 是否自动
---@return boolean result 是否成功
function Player:SetSkillCDInfo(objid, slot, maxcd, isauto) end

---设置tasktracevisible
---@param uin any 玩家Uin
---@param bOpen boolean 是否打开
---@return boolean result 是否成功
function Player:SetTaskTraceVisible(uin, bOpen) end

---设置队伍
---@param objid any 对象ID
---@param teamid any 队伍ID
---@param resetAttr? boolean 参数 resetAttr
---@return boolean result 是否成功
function Player:SetTeam(objid, teamid, resetAttr) end

---设置触发operate禁用
---@param ishost any 是否Host
---@param uin number 玩家Uin
---@param attr number 属性
---@param disable boolean 参数 disable
---@return boolean result 是否成功
function Player:SetTriggerOperateDisable(ishost, uin, attr, disable) end

---显示fishline
---@param uin? any 玩家Uin
---@param bShow? boolean 是否显示
---@return boolean result 是否成功
function Player:ShowFishLine(uin, bShow) end

---显示nick名称
---@param objid any 对象ID
---@param bshow? boolean 是否显示
---@return boolean result 是否成功
function Player:ShowNickName(objid, bshow) end

---技能判断是否蓄力
---@param objid? any 对象ID
---@param slot number 槽位
---@return boolean? result 结果，失败时为 nil
function Player:SkillIsCharging(objid, slot) end

---停止全部动画
---@param objid any 对象ID
---@return boolean result 是否成功
function Player:StopAllAnim(objid) end

---按ID停止动画
---@param playerid number 玩家ID
---@param id any ID
---@return boolean result 是否成功
function Player:StopAnimById(playerid, id) end

---停止身体特效
---@param objid any 对象ID
---@param itype number | string 类型
---@return boolean result 是否成功
function Player:StopBodyEffect(objid, itype) end

---按ID停止身体特效
---@param objid any 对象ID
---@param particleId number | string 粒子ID
---@return boolean result 是否成功
function Player:StopBodyEffectById(objid, particleId) end

---停止hand动画
---@param uin? any 玩家Uin
---@param animid any 动画ID
---@return boolean result 是否成功
function Player:StopHandAnim(uin, animid) end

---停止handtool动画
---@param uin? any 玩家Uin
---@param animid any 动画ID
---@return boolean result 是否成功
function Player:StopHandToolAnim(uin, animid) end

---按ID停止音效特效
---@param objid any 对象ID
---@param soundId number 音效ID
---@return boolean result 是否成功
function Player:StopSoundEffectById(objid, soundId) end

---同步触发数据
---@param ishost any 是否Host
---@param playerid any 玩家ID
---@param customuievent string 参数 customuievent
---@return boolean result 是否成功
function Player:SyncTriggerData(ishost, playerid, customuievent) end

---传送home
---@param objid any 对象ID
---@return boolean result 是否成功
function Player:TeleportHome(objid) end

---触发属性变更事件
---@param objid any 对象ID
---@param atttype any 属性类型
---@param val any 值
---@return boolean result 是否成功
function Player:TriggerAttrChangeEvent(objid, atttype, val) end

---触发技能调用
---@param objid? any 对象ID
---@param skillName string 技能名
---@param growPatchName? string growpatch名称
---@return boolean result 是否成功
function Player:TriggerSkillCall(objid, skillName, growPatchName) end

---尝试移动转换为角色
---@param objid number 对象ID
---@param targetObjid number 目标对象ID
---@param speed number 速度
---@return boolean result 是否成功
function Player:TryMoveToActor(objid, targetObjid, speed) end

---尝试移动转换为不搜索
---@param objid? any 对象ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return boolean result 是否成功
function Player:TryMoveToNoSearch(objid, x, y, z) end

---尝试移动转换为位置
---@param objid number 对象ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param cancontrol boolean 是否允许控制
---@param bshowtip boolean 参数 bshowtip
---@return boolean result 是否成功
function Player:TryMoveToPos(objid, x, y, z, cancontrol, bshowtip) end

---尝试拾取角色forward
---@param objid any 对象ID
---@param distance number 距离
---@return boolean result 是否成功
function Player:TryPickupActorForward(objid, distance) end

---为模组更新主task
---@param uin any 玩家Uin
---@param _type any 类型
---@param target1 any 参数 target1
---@param target2 any 参数 target2
---@param goalnum any goal数量
---@return boolean result 是否成功
function Player:UpdateMainTaskForMod(uin, _type, target1, target2, goalnum) end

---whit列表停止技能
---@param objid any 对象ID
---@param skillid any 技能ID
function Player:WhitList_StopSkill(objid, skillid) end
