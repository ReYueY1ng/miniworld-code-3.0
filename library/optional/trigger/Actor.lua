---@meta

---触发器 Actor 模块（Trigger.Actor）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Actor
Trigger.Actor = {}

---角色执行造成伤害
---@param doobj any 造成伤害的对象ID
---@param data integer | integer[] 数据
---@param value any 值
---@param itype any 类型
---@return boolean result 是否成功
function Trigger.Actor:ActorDoHurt(doobj, data, value, itype) end

---添加or移除标签
---@param actorids integer | integer[] 角色ID或其数组
---@param badd any 是否添加
---@param tags any 标签
---@param icount any 引用计数
---@return boolean result 是否成功
function Trigger.Actor:AddOrRemoveTags(actorids, badd, tags, icount) end

---追加速度
---@param data integer | integer[] 数据
---@param dir Mini.Vec3 方向
---@param speed any 速度
---@return boolean result 是否成功
function Trigger.Actor:AppendSpeed(data, dir, speed) end

---变更角色移动类型
---@param data integer | integer[] 数据
---@param moveType number 移动类型
---@return boolean result 是否成功
function Trigger.Actor:ChangActorMoveType(data, moveType) end

---变更自定义模型
---@param data integer | integer[] 数据
---@param modtype any 参数 modtype
---@return boolean result 是否成功
function Trigger.Actor:ChangeCustomModel(data, modtype) end

---检查角色类型
---@param objid any 对象ID
---@param itype any 类型
---@return boolean result 检查结果
function Trigger.Actor:CheckActorType(objid, itype) end

---检查拾取动作valid
---@param param any 参数
---@param actor1Type any 参数 actor1Type
---@param pickupType any 参数 pickupType
---@param actor2Type any 参数 actor2Type
---@return boolean result 检查结果
function Trigger.Actor:CheckPickupActionValid(param, actor1Type, pickupType, actor2Type) end

---检查target角色类型
---@param objid any 对象ID
---@param itype any 类型
---@param ret any 参数 ret
function Trigger.Actor:CheckTargetActorType(objid, itype, ret) end

---使用ID清空角色
---@param killtype any 参数 killtype
---@param actorids integer | integer[] | table 角色ID或其数组
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.Actor:ClearActorWithId(killtype, actorids, worldId) end

---比较movement模式
---@param objid any 对象ID
---@param movementMode any 参数 movementMode
---@return boolean result 检查结果
function Trigger.Actor:CompareMovementMode(objid, movementMode) end

---比较队伍
---@param data integer | integer[] 数据
---@param team any 队伍
function Trigger.Actor:CompareTeam(data, team) end

---查找最近方块
---@param objid any 对象ID
---@param blockid any 方块ID
---@param blockRange any 方块范围
---@return table value 结果表
function Trigger.Actor:FindNearestBlock(objid, blockid, blockRange) end

---获取boundszie
---@param obj any 对象
---@param ix any 索引
function Trigger.Actor:GetBoundSzie(obj, ix) end

---获取btreevar值
---@param objid any 对象ID
---@param treeId any treeID
---@param varid any 变量ID
function Trigger.Actor:GetBtreeVarValue(objid, treeId, varid) end

---获取拾取角色ID
---@param objid any 对象ID
---@param roleType any 角色类型
function Trigger.Actor:GetPickupActorID(objid, roleType) end

---获取位置
---@param objid any 对象ID
---@return table value 结果表
function Trigger.Actor:GetPosition(objid) end

---获取projectileshoot生物
---@param data any 数据
function Trigger.Actor:GetProjectileShootMob(data) end

---获取projectileshoot玩家
---@param data any 数据
function Trigger.Actor:GetProjectileShootPlayer(data) end

---增加属性
---@param data integer | integer[] 数据
---@param atttype any 属性类型
---@param itype any 类型
---@param val number 值
---@return boolean result 是否成功
function Trigger.Actor:IncreasesAttr(data, atttype, itype, val) end

---击杀自身
---@param data integer | integer[] 数据
---@return boolean result 是否成功
function Trigger.Actor:KillSelf(data) end

---对象转换为any对象
---@param objid any 对象ID
---@param roletype any 角色类型
function Trigger.Actor:ObjToAnyObj(objid, roletype) end

---按IDpaseor恢复音效特效
---@param data integer | integer[] 数据
---@param musicId any 音乐ID
---@return boolean result 是否成功
function Trigger.Actor:PaseOrResumeSoundEffectById(data, musicId) end

---按ID暂停音效特效
---@param data integer | integer[] 数据
---@param musicId any 音乐ID
---@return boolean result 是否成功
function Trigger.Actor:PauseSoundEffectById(data, musicId) end

---按对象播放动画
---@param actorids integer | integer[] 角色ID或其数组
---@param objidB any 对象B的ID
---@return boolean result 是否成功
function Trigger.Actor:PlayAnimByObj(actorids, objidB) end

---按ID播放身体特效
---@param data integer | integer[] 数据
---@param effectids any 参数 effectids
---@param scale? number 缩放
---@param ptme any 粒子时长
---@return boolean result 是否成功
function Trigger.Actor:PlayBodyEffectById(data, effectids, scale, ptme) end

---按ID播放身体粒子
---@param data integer | integer[] 数据
---@param effectids integer | integer[] 参数 effectids
---@param ptme any 粒子时长
---@param offset? table 偏移
---@param rot? table 旋转
---@param scale? table 缩放
---@return boolean result 是否成功
function Trigger.Actor:PlayBodyParticleById(data, effectids, ptme, offset, rot, scale) end

---按ID播放音效特效
---@param data integer | integer[] 数据
---@param soundId any 音效ID
---@param volume any 音量
---@param pitch any 音高
---@param isLoop any 是否循环
---@return boolean result 是否成功
function Trigger.Actor:PlaySoundEffectById(data, soundId, volume, pitch, isLoop) end

---recoverinitial模型
---@param data integer | integer[] 数据
---@return boolean result 是否成功
function Trigger.Actor:RecoverinitialModel(data) end

---移除immune攻击类型
---@param data integer | integer[] 数据
---@param vlues any 参数 vlues
---@return boolean result 是否成功
function Trigger.Actor:RemoveImmuneAttackType(data, vlues) end

---按ID恢复音效特效
---@param data integer | integer[] 数据
---@param musicId any 音乐ID
---@return boolean result 是否成功
function Trigger.Actor:ResumeSoundEffectById(data, musicId) end

---role转换为any对象
---@param objid any 对象ID
---@param roletype any 角色类型
function Trigger.Actor:RoleToAnyObj(objid, roletype) end

---设置角色方向
---@param data integer | integer[] 数据
---@param itype any 类型
---@param value any 值
---@return boolean result 是否成功
function Trigger.Actor:SetActorDir(data, itype, value) end

---设置属性
---@param data integer | integer[] 数据
---@param atttype any 属性类型
---@param val any 值
---@return boolean result 是否成功
function Trigger.Actor:SetAttr(data, atttype, val) end

---设置身体特效缩放
---@param data integer | integer[] 数据
---@param effectids any 参数 effectids
---@param size any 大小
---@return boolean result 是否成功
function Trigger.Actor:SetBodyEffectScale(data, effectids, size) end

---设置身体粒子transform
---@param data integer | integer[] 数据
---@param effectids integer | integer[] 参数 effectids
---@param offset any 偏移
---@param rot any 旋转
---@param scale any 缩放
---@return boolean result 是否成功
function Trigger.Actor:SetBodyParticleTransform(data, effectids, offset, rot, scale) end

---设置btreevar值
---@param objid any 对象ID
---@param treeId any treeID
---@param varid any 变量ID
---@param val any 值
function Trigger.Actor:SetBtreeVarValue(objid, treeId, varid, val) end

---设置cmpbase状态
---@param data integer | integer[] 数据
---@param attr any 属性
---@param switch any 开关
---@return boolean result 是否成功
function Trigger.Actor:SetCmpBaseState(data, attr, switch) end

---设置朝向方向
---@param data integer | integer[] 数据
---@param facedir any 参数 facedir
---@return boolean result 是否成功
function Trigger.Actor:SetFaceDir(data, facedir) end

---设置朝向yaw
---@param data integer | integer[] 数据
---@param value any 值
---@return boolean result 是否成功
function Trigger.Actor:SetFaceYaw(data, value) end

---设置immune攻击类型
---@param data integer | integer[] 数据
---@param vlues any 参数 vlues
---@return boolean result 是否成功
function Trigger.Actor:SetImmuneAttackType(data, vlues) end

---设置nick名称
---@param data integer | integer[] 数据
---@param nick any 参数 nick
---@return boolean result 是否成功
function Trigger.Actor:SetNickName(data, nick) end

---设置位置
---@param data integer | integer[] 数据
---@param position Mini.Vec3 位置
---@return boolean result 是否成功
function Trigger.Actor:SetPosition(data, position) end

---设置队伍
---@param data integer | integer[] 数据
---@param teamid any 队伍ID
---@return boolean result 是否成功
function Trigger.Actor:SetTeam(data, teamid) end

---按ID停止身体特效
---@param data integer | integer[] 数据
---@param effectids integer | integer[] 参数 effectids
---@return boolean result 是否成功
function Trigger.Actor:StopBodyEffectById(data, effectids) end

---按ID停止音效特效
---@param data integer | integer[] 数据
---@param soundId any 音效ID
---@return boolean result 是否成功
function Trigger.Actor:StopSoundEffectById(data, soundId) end

---尝试interact角色
---@param objid any 对象ID
---@param action any 动作
---@param speed? number 速度
---@param dir? number | table 方向
---@param hasInertance? boolean 是否有惯性
---@return boolean result 是否成功
function Trigger.Actor:TryInteractActor(objid, action, speed, dir, hasInertance) end

---尝试移动转换为位置
---@param objid any 对象ID
---@param position Mini.Vec3 位置
---@param cancontrol? boolean 是否允许控制
---@return boolean result 是否成功
function Trigger.Actor:TryMoveToPos(objid, position, cancontrol) end
