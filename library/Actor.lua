---@meta

---角色模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/actor.html)
---@class Actor
Actor = {}

---获取掉落物的类型ID
---@param objid integer 掉落物objid
---@return integer ret 掉落物类型ID
function Actor:GetItemId(objid) end

---获取掉落物品数量
---@param objid integer 掉落物objid
---@return integer itemnum 掉落物品数量
function Actor:GetDropItemNum(objid) end

---设置角色队伍
---@param objid integer 角色objid
---@param teamid AbsoluteCampType 队伍ID
---@param bResetAttr? boolean 是否重置属性(填玩家有效，默认false)
---@return boolean result
function Actor:SetTeam(objid, teamid, bResetAttr) end

---获取角色队伍
---@param objid integer 角色objid
---@return integer teamId 队伍ID
function Actor:GetTeam(objid) end

---增加角色当前生命量
---@param objid integer 角色objid
---@param hp number 血量值(hp>0增加血量 hp<0减少血量)
---@return boolean result
function Actor:AddHp(objid, hp) end

---获取最大血量（包括加成）
---@param objid integer 角色objid
---@return integer value 最大生命值
function Actor:GetMaxHP(objid) end

---设置对象昵称是否显示
---@param objid integer 角色objid
---@param bshow boolean 是否显示
---@return boolean result
function Actor:ShowNickName(objid, bshow) end

---设置角色昵称
---@param objid integer 角色objid
---@param nickname string 昵称
---@return boolean result
function Actor:SetNickName(objid, nickname) end

---获取角色昵称
---@param objid integer 角色Uin
---@return string name 角色昵称
function Actor:GetNickName(objid) end

---获取角色所在的星球id
---@param objid integer 角色objid
---@return number mapID 当前星球ID
function Actor:GetCurMapId(objid) end

---检查对象是否为玩家
---@param objid integer 生物objid
---@return boolean isPlayer
function Actor:IsPlayer(objid) end

---在指定角色身上播放音效
---@param objid integer 角色objid
---@param soundId integer | string 声音ID
---@param volume number 音量
---@param pitch number 音调
---@param isLoop boolean 是否循环播放
---@return boolean result
function Actor:PlaySoundEffectById(objid, soundId, volume, pitch, isLoop) end

---停止指定对象身上的音效
---@param objid integer 角色objid
---@param soundId integer | string 声音ID
---@return boolean result
function Actor:StopSoundEffectById(objid, soundId) end

---暂停/恢复指定对象身上的音效
---@param objid integer 角色objid
---@param soundId integer | string 声音ID
---@param pause boolean true暂停/false恢复
---@return boolean result
function Actor:PauseSoundEffectById(objid, soundId, pause) end

---使生物朝向目标生物
---@param objid integer 生物objid
---@param targetid integer 目标生物objid
---@return boolean result
function Actor:RotateFaceToActor(objid, targetid) end

---获取对象的当前移动速度
---@param objid integer 对象objid
---@return number x 运动速度X
---@return number y 运动速度Y
---@return number z 运动速度Z (未移动速度是0)
function Actor:GetMotion(objid) end

---对象是否存在
---@param objid integer 角色objid
---@return boolean result
function Actor:HasActor(objid) end

---设置目标仇恨目标
---@param objid integer 生物objid
---@param targetid integer 目标生物objid
---@return boolean result
function Actor:SetBeHurtTarget(objid, targetid) end

---获取角色外观(需要确保对象在场景中存在)
---@param objid integer 生物objid
---@return string facade 生物外观对象
function Actor:GetActorFacade(objid) end

---比较两个主模型外观是否相等
---@param facade1 string 外观类型1
---@param facade2 string 外观类型2
---@return boolean result
function Actor:CompareMainModel(facade1, facade2) end

---在指定对象身上播放粒子特效
---@param objid integer 生物对象objid
---@param particleId (integer | string) | (integer | string)[] 粒子特效ID
---@param time number 时长（单位：秒）
---@param offset PositionTable 偏移
---@param rot PositionTable 旋转
---@param scale PositionTable 缩放
---@return boolean result
function Actor:PlayBodyParticleById(objid, particleId, time, offset, rot, scale) end

---停止指定对象身上的粒子特效
---@param objid integer 生物objid
---@param particleId integer | string 粒子特效ID
---@return boolean result
function Actor:StopBodyEffectById(objid, particleId) end

---设置指定对象身上的特效大小
---@param objid integer 生物对象objid
---@param particleId integer | string 粒子特效ID
---@param offset PositionTable 偏移
---@param rot PositionTable 旋转
---@param scale PositionTable 缩放
---@return boolean result
function Actor:SetBodyParticleTransform(objid, particleId, offset, rot, scale) end

---使玩家/生物跳跃一次
---@param objid integer 对象的objid
---@return boolean result
function Actor:Jump(objid) end

---获取骑乘生物的objid
---@param objid integer 角色objid
---@return integer objid 生物objid
function Actor:GetRidingActorObjId(objid) end

---获取actor朝向
---@param objid integer 对象objid
---@return PositionTable pos 轴向上的方向
function Actor:GetFaceDirection(objid) end

---使对象向目标行动者移动(如果执行对象是刚创建出来的需要加个等待时间)
---@param objid integer 执行动作的对象id
---@param targetObjid integer 目标的对象id
---@param speed number 移动速度
---@return boolean result
function Actor:TryMoveToActor(objid, targetObjid, speed) end

---设置对象朝向
---@param objid integer 对象objid
---@param x number 轴向上的方向
---@param y number 轴向上的方向
---@param z number 轴向上的方向
---@return boolean result
function Actor:SetFaceDirection(objid, x, y, z) end

---击败对象
---@param objid integer 生物objid
---@return boolean result
function Actor:KillSelf(objid) end

---设置角色属性
---@param objid integer 角色objid
---@param atttype RoleAttr 属性类型枚举
---@param val number 属性值
---@return boolean result
function Actor:SetAttr(objid, atttype, val) end

---增加角色属性值
---@param objid integer 角色objid
---@param atttype RoleAttr 属性类型枚举
---@param val number 属性值
---@return boolean result
function Actor:IncreasesAttr(objid, atttype, val) end

---获取角色属性值
---@param objid integer 角色objid
---@param atttype RoleAttr 属性类型枚举
---@return number value 属性值
function Actor:GetAttr(objid, atttype) end

---设置对象权限
---@param objid integer 对象Uin
---@param actionattr Ability 行为枚举
---@param switch boolean 是否开启
---@return boolean result
function Actor:SetActorPermissions(objid, actionattr, switch) end

---获取对象权限
---@param objid integer 对象Uin
---@param actionattr Ability 行为枚举
---@return boolean result
function Actor:GetActorPermissions(objid, actionattr) end

---设置对象面向角度
---@param objid integer 生物objid
---@param yaw number 面朝角度
---@return boolean result
function Actor:SetFaceYaw(objid, yaw) end

---获取actor视角偏移角度
---@param objid integer 生物objid
---@return number yaw 面朝角度
function Actor:GetFaceYaw(objid) end

---设置actor视角仰望角度
---@param objid integer 生物objid
---@param pitch number 面仰角度
---@return boolean result
function Actor:SetFacePitch(objid, pitch) end

---获取actor视角仰望角度
---@param objid integer 生物objid
---@return number pitch 仰望角度
function Actor:GetFacePitch(objid) end

---设置角色位置
---@param objid integer 角色objid
---@param x number 目标X坐标
---@param y number 目标Y坐标
---@param z number 目标Z坐标
---@return boolean result
function Actor:SetPosition(objid, x, y, z) end

---获取对象位置
---@param objid integer 对象objid
---@return number x 目标X坐标
---@return number y 目标Y坐标
---@return number z 目标Z坐标
function Actor:GetPosition(objid) end

---改变对象外观
---@param objid integer 对象objid
---@param modleName string 对象外观描述
---@return boolean result
function Actor:ChangeCustomModel(objid, modleName) end

---恢复对象外观
---@param objid integer 对象objid
---@return boolean code 成功(true)
function Actor:RecoverinitialModel(objid) end

---使对象A对对象B造成伤害
---@param objid integer 攻击者对象的objid
---@param targetid integer 目标对象的objid
---@param damage number 伤害值
---@param attacktype HurtType 伤害类型枚举
---@param ignoreResist? boolean 忽略伤害抵抗
---@param ignoreTriggerEvent? boolean 忽略触发伤害事件
---@return boolean result
function Actor:ActorHurt(objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end

---设置免疫伤害类型
---@param objid integer 对象objid
---@param immunetype HurtType 伤害类型枚举
---@param enable boolean 是否开启
---@return boolean code 成功(true)
function Actor:SetImmuneType(objid, immunetype, enable) end

---改变玩家移动方式
---@param objid integer 对象id
---@param moveType MoveType 移动模式
---@return boolean result
function Actor:ChangActorMoveType(objid, moveType) end

---取角色的移动模式
---@param objid integer 对象id
---@return MoveType moveType 返回玩家的移动模式
function Actor:GetActorMovementMode(objid) end

---获取模型大小值
---@param objid integer 角色objid
---@return PositionTable size 返回值
function Actor:GetBoundSzie(objid) end

---随机一个外观ID
---@return string ret 随机外观ID
function Actor:RandomFacadeID() end

---判断对象是否是玩家/生物
---@param objid integer 生物objid
---@return integer objType 获取结果
function Actor:GetObjType(objid) end

---尝试移动到某个位置走寻路 方块坐标
---@param objid integer 角色objid
---@param x number 坐标
---@param y number 坐标
---@param z number 坐标
---@param cancontrol boolean 是否能控制
---@param bshowtip boolean 是否显示提示
---@return boolean result
function Actor:TryMoveToPos(objid, x, y, z, cancontrol, bshowtip) end

---给对象附加一个速度
---@param objid integer 对象objid
---@param x number 轴向方向上的速度大小
---@param y number 轴向方向上的速度大小
---@param z number 轴向方向上的速度大小
---@return boolean code 成功(true)
function Actor:AppendSpeed(objid, x, y, z) end

---寻找对象附近某个类型方块的最近位置
---@param objid integer 对象objid
---@param blockid integer | string 查找的方块类型
---@param blockRange number 查找范围(传1表示1格方块距离)
---@return number x 方块坐标
---@return number y 方块坐标
---@return number z 方块坐标
function Actor:FindNearestBlock(objid, blockid, blockRange) end

---获取角色高度
---@param objid integer 角色objid
---@return number height 高度
function Actor:GetEyeHeight(objid) end

---清除生物ID为actorid的生物
---@param actorid integer 生物类型
---@param bkill? boolean 是否杀死生物（默认false，可以区分是否产生掉落物）
---@return boolean result
function Actor:ClearActorWithId(actorid, bkill) end

---对象是否存在
---@param objid integer 生物objid
---@return boolean result
function Actor:IsExist(objid) end

---对象播放动作
---@param objid integer 对象id
---@param animid number|string 动作id
---@param speed number 播放速度
---@param loop boolean|number 是否循环或循环模式
---@return boolean result
function Actor:PlayAnim(objid, animid, speed, loop) end

---对象手持播放动作
---@param objid number 对象id
---@param animid number|string 动作id
---@param speed number 播放速度
---@param loop boolean|number 是否循环或循环模式
---@return boolean result
function Actor:PlayHandAnim(objid, animid, speed, loop) end

---角色骑乘
---@param objid integer 对象id
---@param rideObjid integer 被骑乘对象
---@param isContrl boolean 是否控制
---@param isCloseAI boolean 是否关闭AI
---@return boolean result
function Actor:MountActor(objid, rideObjid, isContrl, isCloseAI) end

---角色取消骑乘
---@param objid integer 对象id
---@return boolean result
function Actor:DisMountActor(objid) end

---对象抓举对象
---@param objid integer 角色objid
---@param targetobjid integer 目标objid
---@return boolean result
function Actor:PickupActor(objid, targetobjid) end

---尝试抓取前方指定距离的对象
---@param objid integer 角色objid
---@param distance number 距离
---@return boolean result
function Actor:TryPickupActorForward(objid, distance) end

---尝试投掷角色
---@param objid integer 投掷动作对象objid
---@param dir PositionTable 投掷方向
---@param isThrow boolean 是否投掷
---@param speed number 投掷速度
---@param hasInertance boolean 是否有惯性
---@return boolean result
function Actor:DropActor(objid, dir, isThrow, speed, hasInertance) end

---尝试逃脱抓举
---@param objid integer 被抓举的对象objid
---@return boolean result
function Actor:EscapePickup(objid) end

---设置行为树变量 组数据无法设置
---@param objid integer 生物对象objid
---@param varid string 变量id
---@param val any 值
---@return boolean result
function Actor:SetBtreeVarValue(objid, varid, val) end

---获取行为树变量 组数据无法获取
---@param objid integer 生物对象objid
---@param varid string 变量id
---@return any value 成功有值 失败nil
function Actor:GetBtreeVarValue(objid, varid) end

---根据掉落物objid获取道具实例id
---@param objid integer 掉落物objid
---@return string InstanceId 道具实例id
function Actor:GetDropItemInstanceId(objid) end

---设置掉落物是否可以拾取
---@param objid integer 掉落物objid
---@param able boolean 是否可以拾取
---@return boolean result
function Actor:SetAblePick(objid, able) end

---获取实体类型外观
---@param prefabid string 实体类型id
---@return string facade 外观
function Actor:GetEntityFacade(prefabid) end

---角色拾取地上的掉落物或者投掷物
---@param objid integer 角色objid
---@param itemobjid integer 掉落物或投掷物objid
---@param bforcepickup? boolean 是否强制拾取
---@return integer num 拾取数量
function Actor:PickupItem(objid, itemobjid, bforcepickup) end

---获取角色举起的角色
---@param objid integer 角色objid
---@param roleType integer 角色类型
---@return integer pickupobjid 举起的角色objid
function Actor:GetPickupObjID(objid, roleType) end