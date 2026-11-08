---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Monster<br>
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
function Monster:ActorHurt(objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end

---角色造成伤害区域
---@param objid any 对象ID
---@param areaid any 区域ID
---@param damage any 伤害值
---@param attacktype any 攻击类型
---@param ignoreList any 忽略列表
---@param ignoreResist any 是否忽略抗性
---@param ignoreTriggerEvent any 是否忽略触发事件
function Monster:ActorHurtArea(objid, areaid, damage, attacktype, ignoreList, ignoreResist, ignoreTriggerEvent) end

---添加血量
---@param objid any 对象ID
---@param hp number 血量
---@return boolean result 是否成功
function Monster:AddHp(objid, hp) end

---添加模组属性
---@param objid any 对象ID
---@param attrtype number 属性类型
---@param value number 值
---@return boolean result 是否成功
function Monster:AddModAttrib(objid, attrtype, value) end

---添加标签
---@param objid any 对象ID
---@param tags any 标签
---@param icount any 引用计数
---@return boolean result 是否成功
function Monster:AddTags(objid, tags, icount) end

---追加速度
---@param objid any 对象ID
---@param vx number 参数 vx
---@param vy number 参数 vy
---@param vz number 参数 vz
---@return boolean result 是否成功
function Monster:AppendSpeed(objid, vx, vy, vz) end

---aquatic生物ai设置
---@param objid any 对象ID
---@return boolean result 是否成功
function Monster:AquaticMobAISet(objid) end

---变更角色移动类型
---@param objid any 对象ID
---@param moveMode number 移动模式
---@return boolean result 是否成功
function Monster:ChangActorMoveType(objid, moveMode) end

---变更自定义模型
---@param objid any 对象ID
---@param modleName? any modle名称
---@return boolean result 是否成功
function Monster:ChangeCustomModel(objid, modleName) end

---变更tree
---@param objid any 对象ID
---@param treeid any treeID
function Monster:ChangeTree(objid, treeid) end

---检查同步动作
---@param actor any 角色
function Monster:CheckSyncAction(actor) end

---使用ID清空角色
---@param actorid? number | string 角色ID
---@param bkill? boolean 参数 bkill
---@param worldId any 星球ID
---@return boolean result 是否成功
function Monster:ClearActorWithId(actorid, bkill, worldId) end

---清空标签
---@param objid any 对象ID
---@return boolean result 是否成功
function Monster:ClearTags(objid) end

---比较主模型
---@param facade1 string 参数 facade1
---@param facade2 string 参数 facade2
---@return boolean result 检查结果
function Monster:CompareMainModel(facade1, facade2) end

---dis骑乘角色
---@param objid any 对象ID
---@return boolean result 是否成功
function Monster:DisMountActor(objid) end

---掉落角色
---@param objid any 对象ID
---@param dir Mini.Vec3 方向
---@param isThrow boolean 是否投掷
---@param speed number 速度
---@param hasInertance boolean 是否有惯性
---@return boolean result 是否成功
function Monster:DropActor(objid, dir, isThrow, speed, hasInertance) end

---按shooter发射
---@param objid number 对象ID
---@param emitid number 发射物ID
---@return boolean result 是否成功
function Monster:EmitByShooter(objid, emitid) end

---按shootertarget发射
---@param objidA number 对象A的ID
---@param emitid number 发射物ID
---@param objidB number 对象B的ID
---@return boolean result 是否成功
function Monster:EmitByShooterTarget(objidA, emitid, objidB) end

---按shootertarget位置发射
---@param objid number 对象ID
---@param emitid number 发射物ID
---@param targetPos any 参数 targetPos
---@return boolean result 是否成功
function Monster:EmitByShooterTargetPos(objid, emitid, targetPos) end

---escape拾取
---@param objid any 对象ID
---@return boolean result 是否成功
function Monster:EscapePickup(objid) end

---查找等级最近方块
---@param objid? any 对象ID
---@param blockid? string 方块ID
---@param blockRange number 方块范围
function Monster:FindLevelNearestBlock(objid, blockid, blockRange) end

---查找等级随机排序方块
---@param objid? any 对象ID
---@param blockid? string 方块ID
---@param blockRange number 方块范围
function Monster:FindLevelRandomsortBlock(objid, blockid, blockRange) end

---查找最近方块
---@param objid any 对象ID
---@param blockid number | string 方块ID
---@param blockRange number 方块范围
function Monster:FindNearestBlock(objid, blockid, blockRange) end

---获取动作属性状态
---@param objid? any 对象ID
---@param actionattr number 动作属性
function Monster:GetActionAttrState(objid, actionattr) end

---获取角色方向
---@param objid? any 对象ID
---@param itype number 类型
function Monster:GetActorDir(objid, itype) end

---获取角色外观
---@param objid any 对象ID
---@param bhasequip any 参数 bhasequip
function Monster:GetActorFacade(objid, bhasequip) end

---获取角色movement模式
---@param objid any 对象ID
function Monster:GetActorMovementMode(objid) end

---获取角色permissions
---@param objid any 对象ID
---@param ability any 能力
function Monster:GetActorPermissions(objid, ability) end

---获取属性
---@param objid? any 对象ID
---@param atttype number 属性类型
function Monster:GetAttr(objid, atttype) end

---获取身体大小
---@param objid any 对象ID
---@param bodySizeType any 身体大小类型
function Monster:GetBodySize(objid, bodySizeType) end

---获取boundszie
---@param objid? any 对象ID
function Monster:GetBoundSzie(objid) end

---获取btreevar值
---@param objid number 对象ID
---@param varid string 变量ID
function Monster:GetBtreeVarValue(objid, varid) end

---获取蓄力最大数量
---@param objid? any 对象ID
---@param slot number 槽位
function Monster:GetChargingMaxNum(objid, slot) end

---获取蓄力最大时间
---@param objid? any 对象ID
---@param slot number 槽位
function Monster:GetChargingMaxTime(objid, slot) end

---获取蓄力数量
---@param objid? any 对象ID
---@param slot number 槽位
function Monster:GetChargingNum(objid, slot) end

---获取蓄力时间
---@param objid? any 对象ID
---@param slot number 槽位
function Monster:GetChargingTime(objid, slot) end

---获取cmpbase状态
---@param objid any 对象ID
---@param actionattr number 动作属性
---@return boolean value 是否成功
function Monster:GetCmpBaseState(objid, actionattr) end

---获取cur地图ID
---@param objid any 对象ID
function Monster:GetCurMapId(objid) end

---获取当前地图ID
---@param objid any 对象ID
function Monster:GetCurrMapId(objid) end

---获取defID
---@param objid any 对象ID
function Monster:GetDefID(objid) end

---获取掉落道具instanceID
---@param objid any 对象ID
function Monster:GetDropItemInstanceId(objid) end

---获取掉落道具数量
---@param objid any 对象ID
function Monster:GetDropItemNum(objid) end

---获取实体外观
---@param prefab any 参数 prefab
function Monster:GetEntityFacade(prefab) end

---获取eyeheight
---@param objid any 对象ID
function Monster:GetEyeHeight(objid) end

---获取朝向方向
---@param objid any 对象ID
---@return table? value 结果，失败时为 nil
function Monster:GetFaceDirection(objid) end

---获取朝向音高
---@param objid? any 对象ID
function Monster:GetFacePitch(objid) end

---获取朝向yaw
---@param objid? any 对象ID
function Monster:GetFaceYaw(objid) end

---获取枪械信息
---@param objid any 对象ID
function Monster:GetGunInfo(objid) end

---获取道具ID
---@param objid any 对象ID
function Monster:GetItemId(objid) end

---获取最近下落速度
---@param objid any 对象ID
---@return number value 结果数值
function Monster:GetLastFallSpeed(objid) end

---获取等级模式
function Monster:GetLevelMode() end

---获取主模型
---@param facade string 外观
---@return string? value 结果，失败时为 nil
function Monster:GetMainModel(facade) end

---获取最大血量
---@param objid any 对象ID
function Monster:GetMaxHP(objid) end

---获取生物defdesc
---@param actorid? number | string 角色ID
function Monster:GetMonsterDefDesc(actorid) end

---获取生物icon
---@param monsterid? string 生物ID
function Monster:GetMonsterIcon(monsterid) end

---获取生物mass
---@param actorid? number | string 角色ID
function Monster:GetMonsterMass(actorid) end

---获取生物类型
---@param monsterid? string 生物ID
function Monster:GetMonsterType(monsterid) end

---获取运动
---@param objid any 对象ID
function Monster:GetMotion(objid) end

---获取nick名称
---@param objid any 对象ID
function Monster:GetNickName(objid) end

---获取对象类型
---@param objid any 对象ID
function Monster:GetObjType(objid) end

---获取对象世界ID
---@param objid any 对象ID
---@return number value 结果数值
function Monster:GetObjWorldId(objid) end

---获取朝向
---@param objid any 对象ID
function Monster:GetOrientation(objid) end

---获取覆盖重力
---@param objid? any 对象ID
function Monster:GetOverlayGravity(objid) end

---获取拾取对象ID
---@param objid any 对象ID
---@param roleType any 角色类型
---@return number value 结果数值
function Monster:GetPickupObjID(objid, roleType) end

---获取位置
---@param objid any 对象ID
function Monster:GetPosition(objid) end

---获取riding角色对象ID
---@param objid any 对象ID
---@return number value 结果数值
function Monster:GetRidingActorObjId(objid) end

---获取技能冷却
---@param objid? any 对象ID
---@param slot number 槽位
function Monster:GetSkillCD(objid, slot) end

---获取技能最大冷却
---@param objid? any 对象ID
---@param slot number 槽位
function Monster:GetSkillMaxCD(objid, slot) end

---获取队伍
---@param objid any 对象ID
function Monster:GetTeam(objid) end

---获取tickforever
---@param objid any 对象ID
---@return boolean value 是否成功
function Monster:GetTickForever(objid) end

---判断是否拥有角色
---@param objid any 对象ID
function Monster:HasActor(objid) end

---判断是否拥有标签
---@param objid any 对象ID
---@param tags any 标签
---@param mathcmode number 匹配方式
---@param bexactmatch boolean 是否精确匹配
---@return boolean result 是否满足条件
function Monster:HasTags(objid, tags, mathcmode, bexactmatch) end

---增加属性
---@param objid any 对象ID
---@param atttype any 属性类型
---@param val number 值
---@return boolean result 是否成功
function Monster:IncreasesAttr(objid, atttype, val) end

---初始化触发全局数据
function Monster:InitTriggerGlobalData() end

---判断是否exist
---@param objid any 对象ID
---@return boolean result 是否满足条件
function Monster:IsExist(objid) end

---判断是否拥有技能
---@param objid? any 对象ID
---@param slot number 槽位
---@return boolean? result 结果，失败时为 nil
function Monster:IsHaveSkill(objid, slot) end

---判断是否生物
---@param objid any 对象ID
---@return boolean result 是否满足条件
function Monster:IsMob(objid) end

---判断是否玩家
---@param objid any 对象ID
---@return boolean result 是否满足条件
function Monster:IsPlayer(objid) end

---跳跃
---@param objid any 对象ID
---@return boolean result 是否成功
function Monster:Jump(objid) end

---击杀自身
---@param objid any 对象ID
---@return boolean result 是否成功
function Monster:KillSelf(objid) end

---骑乘角色
---@param objid any 对象ID
---@param rideobjid any rideobjID
---@param isContrl boolean 是否contrl
---@param isCloseAI boolean 是否closeai
---@return boolean result 是否成功
function Monster:MountActor(objid, rideobjid, isContrl, isCloseAI) end

---整理外观列表
function Monster:OrganizeFacadeList() end

---按ID暂停音效特效
---@param objid any 对象ID
---@param soundId number 音效ID
---@param pause boolean 是否暂停
---@return boolean result 是否成功
function Monster:PauseSoundEffectById(objid, soundId, pause) end

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
function Monster:PickupActor(objidA, objidB, actionA, actionB, offest, rotate, playemode, playspeed, anchorId) end

---拾取道具
---@param objid number 对象ID
---@param itemobjid number itemobjID
---@param bforcepickup? boolean 参数 bforcepickup
---@return number result 结果数值
function Monster:PickupItem(objid, itemobjid, bforcepickup) end

---播放动作
---@param objid any 对象ID
---@param actid number 动作ID
---@return boolean result 是否成功
function Monster:PlayAct(objid, actid) end

---播放动画
---@param objid any 对象ID
---@param animid any 动画ID
---@param speed any 速度
---@param loop number | boolean 循环
---@return boolean result 是否成功
function Monster:PlayAnim(objid, animid, speed, loop) end

---按ID播放动画
---@param objid any 对象ID
---@param animid any 动画ID
---@param inputloopmode any 输入循环模式
---@param playLayer any 播放层
---@param crossfade any 参数 crossfade
---@return boolean result 是否成功
function Monster:PlayAnimById(objid, animid, inputloopmode, playLayer, crossfade) end

---按对象播放动画
---@param objidA number 对象A的ID
---@param objidB number 对象B的ID
---@param breplay any 参数 breplay
---@return boolean result 是否成功
function Monster:PlayAnimByObj(objidA, objidB, breplay) end

---播放身体特效
---@param objid any 对象ID
---@param itype number | string 类型
---@return boolean result 是否成功
function Monster:PlayBodyEffect(objid, itype) end

---按文件播放身体特效
---@param objid any 对象ID
---@param filename string 文件名
---@param sync? boolean 是否同步
---@return boolean result 是否成功
function Monster:PlayBodyEffectByFile(objid, filename, sync) end

---按ID播放身体特效
---@param objid any 对象ID
---@param particleId any 粒子ID
---@param scale? number 缩放
---@param ptme any 粒子时长
---@return boolean result 是否成功
function Monster:PlayBodyEffectById(objid, particleId, scale, ptme) end

---按ID播放身体粒子
---@param objid any 对象ID
---@param particleId number | string 粒子ID
---@param ptme number 粒子时长
---@param offset? Mini.Vec3 偏移
---@param rot? Mini.Vec3 旋转
---@param scale? Mini.Vec3 缩放
---@return boolean result 是否成功
function Monster:PlayBodyParticleById(objid, particleId, ptme, offset, rot, scale) end

---播放hand动画
---@param objid any 对象ID
---@param animid any 动画ID
---@param speed any 速度
---@param loop number | boolean 循环
---@return boolean result 是否成功
function Monster:PlayHandAnim(objid, animid, speed, loop) end

---播放技能
---@param objid? any 对象ID
---@param slot number 槽位
---@return boolean result 是否成功
function Monster:PlaySkill(objid, slot) end

---按名称播放音效
---@param objid any 对象ID
---@param name string 名称
---@param volume number 音量
---@param pitch number 音高
---@param flag number 开关
---@return boolean result 是否成功
function Monster:PlaySoundByName(objid, name, volume, pitch, flag) end

---按ID播放音效特效
---@param objid any 对象ID
---@param soundId number 音效ID
---@param volume number 音量
---@param pitch number 音高
---@param isLoop boolean 是否循环
---@return boolean result 是否成功
function Monster:PlaySoundEffectById(objid, soundId, volume, pitch, isLoop) end

---玩家造成伤害
---@param objid any 对象ID
---@param targetid any 目标对象ID
---@param damage any 伤害值
---@param attacktype any 攻击类型
---@param ignoreResist any 是否忽略抗性
---@param ignoreTriggerEvent any 是否忽略触发事件
function Monster:PlayerHurt(objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end

---random外观ID
function Monster:RandomFacadeID() end

---random名称
function Monster:RandomName() end

---recoverinitial模型
---@param ishost any 是否Host
---@param objid? any 对象ID
---@return boolean result 是否成功
function Monster:RecoverinitialModel(ishost, objid) end

---移除标签
---@param objid any 对象ID
---@param tags any 标签
---@param icount any 引用计数
---@return boolean result 是否成功
function Monster:RemoveTags(objid, tags, icount) end

---旋转朝向转换为角色
---@param objid any 对象ID
---@param targetid any 目标对象ID
---@return boolean result 是否成功
function Monster:RotateFaceToActor(objid, targetid) end

---设置ablepick
---@param objid number 对象ID
---@param able boolean 参数 able
---@return boolean result 是否成功
function Monster:SetAblePick(objid, able) end

---设置动作属性状态
---@param objid any 对象ID
---@param actionattr number 动作属性
---@param switch boolean 开关
---@return boolean result 是否成功
function Monster:SetActionAttrState(objid, actionattr, switch) end

---设置角色控制
---@param objid? any 对象ID
---@param b boolean 参数 B
---@return boolean result 是否成功
function Monster:SetActorControl(objid, b) end

---设置角色方向
---@param objid? any 对象ID
---@param itype number 类型
---@param value any 值
---@return boolean result 是否成功
function Monster:SetActorDir(objid, itype, value) end

---设置角色permissions
---@param objid any 对象ID
---@param ability any 能力
---@param switch any 开关
function Monster:SetActorPermissions(objid, ability, switch) end

---设置属性
---@param objid any 对象ID
---@param atttype any 属性类型
---@param val any 值
---@return boolean result 是否成功
function Monster:SetAttr(objid, atttype, val) end

---设置be造成伤害target
---@param objid any 对象ID
---@param targetid any 目标对象ID
---@return boolean result 是否成功
function Monster:SetBeHurtTarget(objid, targetid) end

---设置受击禁用
---@param objid any 对象ID
---@param value boolean 值
---@return boolean result 是否成功
function Monster:SetBehitDisable(objid, value) end

---设置身体特效缩放
---@param objid any 对象ID
---@param particleId any 粒子ID
---@param scale any 缩放
---@return boolean result 是否成功
function Monster:SetBodyEffectScale(objid, particleId, scale) end

---按文件设置身体特效缩放
---@param objid number 对象ID
---@param filename any 文件名
---@param scale number 缩放
---@return boolean result 是否成功
function Monster:SetBodyEffectScaleByFile(objid, filename, scale) end

---设置身体粒子transform
---@param objid number 对象ID
---@param particleId number | string 粒子ID
---@param offset? Mini.Vec3 偏移
---@param rot? Mini.Vec3 旋转
---@param scale? Mini.Vec3 缩放
---@return boolean result 是否成功
function Monster:SetBodyParticleTransform(objid, particleId, offset, rot, scale) end

---设置btreevar值
---@param objid number 对象ID
---@param varid string 变量ID
---@param val any 值
---@return boolean result 是否成功
function Monster:SetBtreeVarValue(objid, varid, val) end

---设置判断能否碰撞
---@param objid any 对象ID
---@param value boolean 值
---@return boolean result 是否成功
function Monster:SetCanCollide(objid, value) end

---设置蓄力
---@param objid? any 对象ID
---@param slot number 槽位
---@param ischarging boolean 是否蓄力中
---@return boolean result 是否成功
function Monster:SetCharging(objid, slot, ischarging) end

---设置蓄力值
---@param objid? any 对象ID
---@param slot number 槽位
---@param value number 值
---@return boolean result 是否成功
function Monster:SetChargingValue(objid, slot, value) end

---设置蓄力信息
---@param objid? any 对象ID
---@param slot number 槽位
---@param max number 最大
---@param num number 数量
---@param maxnum number 最大数量
---@param isauto boolean 是否自动
---@return boolean result 是否成功
function Monster:SetCharginginfo(objid, slot, max, num, maxnum, isauto) end

---设置cmpbase状态
---@param objid any 对象ID
---@param actionattr number 动作属性
---@param switch boolean 开关
---@return boolean result 是否成功
function Monster:SetCmpBaseState(objid, actionattr, switch) end

---设置朝向方向
---@param objid any 对象ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return boolean result 是否成功
function Monster:SetFaceDirection(objid, x, y, z) end

---设置朝向音高
---@param objid? any 对象ID
---@param pitch number 音高
---@return boolean result 是否成功
function Monster:SetFacePitch(objid, pitch) end

---设置朝向yaw
---@param objid? any 对象ID
---@param yaw number 偏航角
---@return boolean result 是否成功
function Monster:SetFaceYaw(objid, yaw) end

---设置first搜索
---@param objid any 对象ID
---@param firstsearch boolean 首次搜索
---@return boolean result 是否成功
function Monster:SetFirstSearch(objid, firstsearch) end

---设置immune类型
---@param objid any 对象ID
---@param immunetype number 参数 immunetype
---@param isadd boolean 是否添加
---@return boolean result 是否成功
function Monster:SetImmuneType(objid, immunetype, isadd) end

---设置模组属性
---@param objid any 对象ID
---@param attrtype number 属性类型
---@param value number 值
---@return boolean result 是否成功
function Monster:SetModAttrib(objid, attrtype, value) end

---设置运动变更
---@param objid any 对象ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return boolean result 是否成功
function Monster:SetMotionChange(objid, x, y, z) end

---设置骑乘角色属性
---@param objid any 对象ID
---@param isRote any 是否rote
---@param isPlayerContrl any 是否playercontrl
---@param isCloseAI any 是否closeai
function Monster:SetMountActorAttr(objid, isRote, isPlayerContrl, isCloseAI) end

---设置nick名称
---@param objid any 对象ID
---@param nickname string nick名称
---@return boolean result 是否成功
function Monster:SetNickName(objid, nickname) end

---设置朝向
---@param objid any 对象ID
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@return boolean result 是否成功
function Monster:SetOrientation(objid, x, y, z) end

---设置覆盖重力
---@param objid? any 对象ID
---@param val number 值
---@return boolean result 是否成功
function Monster:SetOverlayGravity(objid, val) end

---设置位置
---@param objid? any 对象ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return boolean result 是否成功
function Monster:SetPosition(objid, x, y, z) end

---设置骑乘位置
---@param objid any 对象ID
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
function Monster:SetRidePosition(objid, x, y, z) end

---设置缩放
---@param objid any 对象ID
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@return boolean result 是否成功
function Monster:SetScale(objid, x, y, z) end

---设置技能冷却
---@param objid? any 对象ID
---@param slot number 槽位
---@param cd number 冷却时间（秒）
---@return boolean result 是否成功
function Monster:SetSkillCD(objid, slot, cd) end

---设置技能冷却信息
---@param objid? any 对象ID
---@param slot number 槽位
---@param maxcd number 最大冷却
---@param isauto boolean 是否自动
---@return boolean result 是否成功
function Monster:SetSkillCDInfo(objid, slot, maxcd, isauto) end

---设置队伍
---@param objid any 对象ID
---@param teamid any 队伍ID
---@param bResetAttr? boolean 参数 bResetAttr
---@return boolean result 是否成功
function Monster:SetTeam(objid, teamid, bResetAttr) end

---设置tickforever
---@param objid any 对象ID
---@param tickForever any 参数 tickForever
---@return boolean result 是否成功
function Monster:SetTickForever(objid, tickForever) end

---显示nick名称
---@param objid any 对象ID
---@param bshow? boolean 是否显示
---@return boolean result 是否成功
function Monster:ShowNickName(objid, bshow) end

---技能判断是否蓄力
---@param objid? any 对象ID
---@param slot number 槽位
---@return boolean? result 结果，失败时为 nil
function Monster:SkillIsCharging(objid, slot) end

---停止全部动画
---@param objid any 对象ID
---@return boolean result 是否成功
function Monster:StopAllAnim(objid) end

---停止身体特效
---@param objid any 对象ID
---@param itype number | string 类型
---@return boolean result 是否成功
function Monster:StopBodyEffect(objid, itype) end

---按ID停止身体特效
---@param objid any 对象ID
---@param particleId number | string 粒子ID
---@return boolean result 是否成功
function Monster:StopBodyEffectById(objid, particleId) end

---按ID停止音效特效
---@param objid any 对象ID
---@param soundId number 音效ID
---@return boolean result 是否成功
function Monster:StopSoundEffectById(objid, soundId) end

---触发属性变更事件
---@param objid any 对象ID
---@param atttype any 属性类型
---@param val any 值
---@return boolean result 是否成功
function Monster:TriggerAttrChangeEvent(objid, atttype, val) end

---触发技能调用
---@param objid? any 对象ID
---@param skillName string 技能名
---@param growPatchName? string growpatch名称
---@return boolean result 是否成功
function Monster:TriggerSkillCall(objid, skillName, growPatchName) end

---尝试移动转换为角色
---@param objid number 对象ID
---@param targetObjid number 目标对象ID
---@param speed number 速度
---@return boolean result 是否成功
function Monster:TryMoveToActor(objid, targetObjid, speed) end

---尝试移动转换为不搜索
---@param objid? any 对象ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return boolean result 是否成功
function Monster:TryMoveToNoSearch(objid, x, y, z) end

---尝试移动转换为位置
---@param objid number 对象ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param cancontrol boolean 是否允许控制
---@param bshowtip boolean 参数 bshowtip
---@return boolean result 是否成功
function Monster:TryMoveToPos(objid, x, y, z, cancontrol, bshowtip) end

---尝试拾取角色forward
---@param objid any 对象ID
---@param distance number 距离
---@return boolean result 是否成功
function Monster:TryPickupActorForward(objid, distance) end

---whit列表停止技能
---@param objid any 对象ID
---@param skillid any 技能ID
function Monster:WhitList_StopSkill(objid, skillid) end

---生成varids
---@param varmgr any 参数 varmgr
function Monster:_GenVarids(varmgr) end
