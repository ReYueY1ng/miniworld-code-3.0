---@meta

---触发器 Actor 模块（Trigger.Actor）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Actor
Trigger.Actor = {}

---让角色对指定对象造成一次伤害
---目标不存在或伤害不大于 0 时不生效
---@param doobj integer 造成伤害的角色ID
---@param data integer | integer[] 受击对象ID或其数组
---@param value any 伤害值，需大于 0
---@param itype number 攻击类型（HURTTYPE/AttackType）
---@return boolean result 是否至少有一个目标受击成功
function Trigger.Actor:ActorDoHurt(doobj, data, value, itype) end

---为角色添加或移除标签
---badd 不是 1/2 时直接返回 false
---移除时空字符串标签会被跳过
---@param actorids integer | integer[] 角色ID或其数组
---@param badd number 操作类型：1 添加，2 移除
---@param tags string | string[] 标签或标签数组
---@param icount number 标签引用计数，添加默认 1、移除默认 0
---@return boolean result 是否全部执行成功
function Trigger.Actor:AddOrRemoveTags(actorids, badd, tags, icount) end

---给对象叠加一个方向上的速度
---向量方向会先归一化再乘以速度
---数字方向会按对象当前朝向换算成向量
---@param data integer | integer[] 对象ID或其数组
---@param dir Mini.Vec3 方向：单位向量 {x,y,z} 或 FaceDir 方向枚举
---@param speed number 速度大小
---@return boolean result 是否叠加成功
function Trigger.Actor:AppendSpeed(data, dir, speed) end

---修改角色的移动方式
---玩家只能切换行走/游泳与飞行，其他角色交给 AI 移动模式处理
---@param data integer | integer[] 对象ID或其数组
---@param moveType number 移动方式（MoveType）：0 行走，1 飞行，2 游泳
---@return boolean result 是否修改成功
function Trigger.Actor:ChangActorMoveType(data, moveType) end

---替换对象的外观模型
---模型名为空、没有下划线或对象无 Model 组件时返回 false
---@param data integer | integer[] 对象ID或其数组
---@param modtype number 模型名，格式为 类型_ID（itemprefab/blockprefab/mobprefab/entityprefab/templateprefab/ModelCompObj/ItemInstance/playerskin）
---@return boolean result 是否替换成功
function Trigger.Actor:ChangeCustomModel(data, modtype) end

---判断对象是否为指定对象类型
---@param objid integer 对象ID
---@param itype number 对象类型（ObjType）
---@return boolean result 类型是否一致
function Trigger.Actor:CheckActorType(objid, itype) end

---校验拾取事件的双方类型与动作是否符合条件
---事件动作类型不一致或双方类型不符时返回 false
---@param param any 拾取事件参数，含 pickupType、eventobjid、toobjid
---@param actor1Type number 发起者类型：1 玩家，2 生物
---@param pickupType number 要求的拾取动作类型（PickupActionType）
---@param actor2Type number 目标类型：1 玩家，2 生物
---@return boolean result 是否符合条件
function Trigger.Actor:CheckPickupActionValid(param, actor1Type, pickupType, actor2Type) end

---判断对象类型是否等于给定结果
---@param objid integer 对象ID
---@param itype number 对象类型（ObjType）
---@param ret any 期望的布尔结果：true 要求类型一致，false 要求不一致
---@return boolean result 是否与期望一致
function Trigger.Actor:CheckTargetActorType(objid, itype, ret) end

---按对象ID清除星球上的全部实例
---匹配的是对象类型/配置ID，会清除该ID的所有实例
---多个ID时任一成功即返回 true
---@param killtype number 清除方式：1 击杀并产生掉落，2 直接清除
---@param actorids integer | integer[] | table 对象ID或其数组
---@param worldId number 星球ID，默认当前星球
---@return boolean result 是否执行成功
function Trigger.Actor:ClearActorWithId(killtype, actorids, worldId) end

---判断对象的移动方式是否与给定值一致
---@param objid integer 对象ID
---@param movementMode any 移动方式（MoveType）
---@return boolean result 是否一致
function Trigger.Actor:CompareMovementMode(objid, movementMode) end

---判断所有对象是否都属于指定队伍
---对象没有队伍或 data 为空时返回 false
---@param data integer | integer[] 对象ID或其数组
---@param team any 队伍ID（AbsoluteCampType）
---@return boolean result 是否全部属于该队伍
function Trigger.Actor:CompareTeam(data, team) end

---查找对象附近最近的指定类型方块坐标
---@param objid number 对象ID
---@param blockid number | string 方块类型ID，数字配置ID或资源ID字符串
---@param blockRange number 查找半径（格）
---@return table? pos 方块坐标 {x,y,z}，未找到时为 nil
function Trigger.Actor:FindNearestBlock(objid, blockid, blockRange) end

---获取对象模型碰撞盒某一轴向的尺寸
---方法名 Szie 是引擎原始的 Size 拼写错误
---@param obj any 对象ID
---@param ix any 轴向索引：x/y/z
---@return number? value 对应轴向的尺寸，参数或索引无效时为 nil
function Trigger.Actor:GetBoundSzie(obj, ix) end

---读取生物行为树黑板的变量值
---treeId 不参与查询
---表类型的值取第一个字段返回，数组返回 nil
---@param objid number 生物对象ID
---@param treeId integer 行为树ID，实现中未使用
---@param varid string 行为树变量ID
---@return any? value 变量值，组数据或读取失败时为 nil
function Trigger.Actor:GetBtreeVarValue(objid, treeId, varid) end

---获取角色抱起关系中的对端对象ID
---roleType 决定取抱起者还是被抱者一侧的ID
---@param objid integer 角色对象ID
---@param roleType number 查询方向（RolePickupType）：1 Carrying，2 Carried
---@return integer result 对象ID，未处于抱起关系时返回 0
function Trigger.Actor:GetPickupActorID(objid, roleType) end

---获取对象的世界坐标
---@param objid number 对象ID
---@return table? pos 坐标 {x,y,z}，单位格，对象不存在时为 nil
function Trigger.Actor:GetPosition(objid) end

---获取抛射物的发射生物ID
---以 4294967296 作为玩家与生物ID的分界
---@param data integer | integer[] 抛射物事件参数，含 HelpObjid
---@return integer? objid 发射生物ID，发射者不是生物时为 nil
function Trigger.Actor:GetProjectileShootMob(data) end

---获取抛射物的发射玩家ID
---@param data integer | integer[] 抛射物事件参数，含 HelpObjid
---@return integer? objid 发射玩家ID，发射者不是玩家时为 nil
function Trigger.Actor:GetProjectileShootPlayer(data) end

---按方式增减或直接设置角色属性
---val 为 0 时直接返回 true
---属性值不会低于 0
---@param data integer | integer[] 对象ID或其数组
---@param atttype number 属性类型（RoleAttr）
---@param itype number 操作方式：1 增加，2 减少，3 直接设为 val
---@param val number 属性数值
---@return boolean result 是否全部成功
function Trigger.Actor:IncreasesAttr(data, atttype, itype, val) end

---击杀指定对象
---@param data integer | integer[] 对象ID或其数组
---@return boolean? result 是否全部击杀成功，data 为 nil 时无返回值
function Trigger.Actor:KillSelf(data) end

---把对象ID转换为通用对象ID
---玩家ID必须小于 4294967296
---生物、抛射物、掉落物、区域原样返回
---@param objid integer 对象ID
---@param roletype number 对象类型（ObjType）
---@return integer? objid 转换后的ID，类型不支持或ID不合法时为 nil
function Trigger.Actor:ObjToAnyObj(objid, roletype) end

---切换对象身上音效的暂停与恢复状态
---按对象+音效记录状态，再次调用即反向切换
---实现缺陷：返回值恒为 false，不代表操作失败
---@param data integer | integer[] 对象ID或其数组
---@param musicId number | string 音效ID
---@return boolean result 固定为 false
function Trigger.Actor:PaseOrResumeSoundEffectById(data, musicId) end

---暂停对象身上正在播放的音效
---@param data integer | integer[] 对象ID或其数组
---@param musicId number | string 音效ID，-1 表示全部音效
---@return boolean result 是否暂停成功
function Trigger.Actor:PauseSoundEffectById(data, musicId) end

---让对象播放另一个对象的动作
---仅玩家、生物和实体生效
---两个ID相同时不执行并返回 false
---@param actorids integer | integer[] 播放者ID或其数组
---@param objidB number 被模仿的对象ID
---@return boolean result 是否播放成功
function Trigger.Actor:PlayAnimByObj(actorids, objidB) end

---在对象身上播放指定特效
---特效ID解析不到定义时返回 false
---单次播放且未给时长时按特效定义时长
---@param data integer | integer[] 对象ID或其数组
---@param effectids any 特效ID、资源ID或ID数组
---@param scale? number 特效缩放，默认 1
---@param ptme any 播放时长（秒），不传时按特效定义
---@return boolean result 是否播放成功
function Trigger.Actor:PlayBodyEffectById(data, effectids, scale, ptme) end

---在对象身上播放粒子特效并设置变换
---offset 会从格换算成引擎内部单位
---@param data integer | integer[] 对象ID或其数组
---@param effectids integer | integer[] 粒子特效ID/名称或数组
---@param ptme number 播放时长（秒），空或非正数表示持续播放
---@param offset? table 偏移（格），默认 {x=0,y=0,z=0}
---@param rot? table 旋转，默认 {x=0,y=0,z=0}
---@param scale? table 缩放，默认 {x=1,y=1,z=1}
---@return boolean result 是否播放成功
function Trigger.Actor:PlayBodyParticleById(data, effectids, ptme, offset, rot, scale) end

---在对象身上按声音ID播放音效
---soundId 找不到对应音频时返回 false
---@param data integer | integer[] 对象ID或其数组
---@param soundId number 声音ID
---@param volume number 音量 0-100，内部换算为 0-1
---@param pitch number 音调，默认 1
---@param isLoop boolean 是否循环播放，默认 false
---@return boolean result 是否播放成功
function Trigger.Actor:PlaySoundEffectById(data, soundId, volume, pitch, isLoop) end

---把对象外观恢复为初始模型
---@param data integer | integer[] 对象ID或其数组
---@return boolean result 是否恢复成功
function Trigger.Actor:RecoverinitialModel(data) end

---移除对象的攻击类型免疫
---@param data integer | integer[] 对象ID或其数组
---@param vlues any 攻击类型ID，-1 表示无敌
---@return boolean? result 是否全部成功，data 为 nil 时无返回值
function Trigger.Actor:RemoveImmuneAttackType(data, vlues) end

---恢复对象身上被暂停的音效
---@param data integer | integer[] 对象ID或其数组
---@param musicId number | string 音效ID，-1 表示全部音效
---@return boolean result 是否恢复成功
function Trigger.Actor:ResumeSoundEffectById(data, musicId) end

---把角色ID转换为通用对象ID
---@param objid integer 角色ID
---@param roletype number 角色类型：ObjType.Player 或 ObjType.Mob
---@return integer? objid 转换后的ID，类型或ID不合法时为 nil
function Trigger.Actor:RoleToAnyObj(objid, roletype) end

---设置角色的水平或垂直朝向
---itype 不是 1/2 时不做任何事但返回 true
---@param data integer | integer[] 对象ID或其数组
---@param itype number 朝向类型：1 水平偏航，2 垂直俯仰
---@param value any 角度值（度）
---@return boolean result 是否全部设置成功
function Trigger.Actor:SetActorDir(data, itype, value) end

---设置角色的属性值
---血量、最大血量、恢复等属性下限为 0
---移动速度类属性变化会触发属性变化事件
---@param data integer | integer[] 对象ID或其数组
---@param atttype number 属性类型（RoleAttr）
---@param val number 属性值，NaN 和无穷会被拒绝
---@return boolean result 是否全部设置成功
function Trigger.Actor:SetAttr(data, atttype, val) end

---调整对象身上特效的缩放
---@param data integer | integer[] 对象ID或其数组
---@param effectids any 特效ID/名称或数组
---@param size number 缩放倍率
---@return boolean result 是否调整成功
function Trigger.Actor:SetBodyEffectScale(data, effectids, size) end

---调整对象身上粒子特效的偏移、旋转与缩放
---@param data integer | integer[] 对象ID或其数组
---@param effectids integer | integer[] 粒子特效ID/名称或数组
---@param offset table 偏移（格），默认 {x=0,y=0,z=0}
---@param rot table 旋转，默认 {x=0,y=0,z=0}
---@param scale table 缩放，默认 {x=1,y=1,z=1}
---@return boolean result 是否调整成功
function Trigger.Actor:SetBodyParticleTransform(data, effectids, offset, rot, scale) end

---设置生物行为树黑板的变量值
---treeId 不参与写入
---组数据无法设置
---@param objid number 生物对象ID
---@param treeId integer 行为树ID，实现中未使用
---@param varid string 行为树变量ID
---@param val any 变量值，不能为 nil
---@return boolean result 是否设置成功
function Trigger.Actor:SetBtreeVarValue(objid, treeId, varid, val) end

---开关角色的能力状态
---可受伤、可被击杀、死亡掉落、切换快捷栏、旋转摄像机等有专门处理
---仅对玩家有效的操作在生物上会失败
---@param data integer | integer[] 对象ID或其数组
---@param attr any 能力类型（Ability），1000 以上按能力组处理
---@param switch boolean 是否启用
---@return boolean result 是否全部成功
function Trigger.Actor:SetCmpBaseState(data, attr, switch) end

---按四方向枚举设置对象朝向
---玩家通过旋转摄像机实现，其他对象直接设置偏航角
---@param data integer | integer[] 对象ID或其数组
---@param facedir any 朝向（FaceDir.PosX/NegX/PosZ/NegZ），其他方向返回 false
---@return boolean result 是否设置成功
function Trigger.Actor:SetFaceDir(data, facedir) end

---设置对象的水平朝向角
---玩家通过旋转摄像机实现，其他对象直接设置偏航角
---@param data integer | integer[] 对象ID或其数组
---@param value any 偏航角（度）
---@return boolean result 是否设置成功
function Trigger.Actor:SetFaceYaw(data, value) end

---为对象添加攻击类型免疫
---@param data integer | integer[] 对象ID或其数组
---@param vlues any 攻击类型ID，-1 表示完全无敌
---@return boolean? result 是否全部成功，data 为 nil 时无返回值
function Trigger.Actor:SetImmuneAttackType(data, vlues) end

---设置角色的昵称
---命中敏感词时昵称整体替换为 ****
---@param data integer | integer[] 对象ID或其数组
---@param nick any 昵称文本
---@return boolean result 是否设置成功
function Trigger.Actor:SetNickName(data, nick) end

---设置对象的世界坐标
---x/y/z 任一不是数字时返回 false
---@param data integer | integer[] 对象ID或其数组
---@param position Mini.Vec3 坐标向量 {x,y,z}，单位格
---@return boolean result 是否全部成功
function Trigger.Actor:SetPosition(data, position) end

---设置角色所属队伍
---只改队伍，不重置属性
---@param data integer | integer[] 对象ID或其数组
---@param teamid number 队伍ID（AbsoluteCampType），0-1000
---@return boolean result 是否全部成功
function Trigger.Actor:SetTeam(data, teamid) end

---停止对象身上正在播放的特效
---即使没有匹配到已播放的特效也返回 true
---@param data integer | integer[] 对象ID或其数组
---@param effectids integer | integer[] 特效ID/名称或数组
---@return boolean result 是否执行成功
function Trigger.Actor:StopBodyEffectById(data, effectids) end

---停止对象身上指定音效
---@param data integer | integer[] 对象ID或其数组
---@param soundId number 声音ID，-1 表示全部音效
---@return boolean result 是否停止成功
function Trigger.Actor:StopSoundEffectById(data, soundId) end

---对角色执行拾取、投掷、放下或解绑交互
---仅对存活角色生效
---拾取固定向前搜索 2 格
---放下和投掷仅在方向有效时执行
---@param objid integer 角色对象ID
---@param action number 动作（PickupActionType）：1 拾取，2 放下，3 投掷，4 解绑
---@param speed? number 投掷/放下的初速度，默认 10
---@param dir? number | table 方向：FaceDir 枚举或向量，默认零向量
---@param hasInertance? boolean 是否保留惯性，默认 false
---@return boolean result 是否执行成功
function Trigger.Actor:TryInteractActor(objid, action, speed, dir, hasInertance) end

---让角色寻路移动到目标坐标
---玩家坐标会做半格偏移后交给寻路，生物直接设置目标点
---@param objid number 角色对象ID
---@param position Mini.Vec3 目标坐标 {x,y,z}，单位格
---@param cancontrol? boolean 是否允许玩家期间接管，默认 false
---@return boolean result 是否成功下发移动
function Trigger.Actor:TryMoveToPos(objid, position, cancontrol) end
