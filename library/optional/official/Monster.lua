---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Monster<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---使一个角色对另一个角色造成固定伤害
---伤害值必须大于 0，否则直接失败
---依次尝试 attackedFromType 与 attackedFromType_Base，任一成功即视为成功
---@param objid? integer 角色对象ID
---@param targetid integer 目标角色对象ID
---@param damage number 伤害值，必须大于 0
---@param attacktype? number 攻击类型（CmpEnvEnum.AttackType），默认 ATTACK_FIXED
---@param ignoreResist? boolean 是否忽略护甲等抗性，默认 false
---@param ignoreTriggerEvent boolean 是否不触发受击相关脚本事件
---@return boolean result 是否成功施加伤害
function Monster:ActorHurt(objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end

---按区域对范围内角色造成伤害（引擎中为空实现，调用无任何效果）
---函数体只有一个 return，既不造成伤害也不返回任何值
---@param objid integer 角色对象ID
---@param areaid integer 区域对象的对象ID
---@param damage number 伤害值，必须大于 0
---@param attacktype number 攻击类型（CmpEnvEnum.AttackType），默认 ATTACK_FIXED
---@param ignoreList table 不参与本次伤害的角色ID列表
---@param ignoreResist boolean 是否忽略护甲等抗性，默认 false
---@param ignoreTriggerEvent boolean 是否不触发受击相关脚本事件
function Monster:ActorHurtArea(objid, areaid, damage, attacktype, ignoreList, ignoreResist, ignoreTriggerEvent) end

---修改角色当前血量，传负值即为扣血
---@param objid integer 角色对象ID
---@param hp number 血量变化值，可为负数（扣血）
---@return boolean result 是否成功
function Monster:AddHp(objid, hp) end

---在角色属性上叠加一个模组属性值
---与 SetModAttrib 的覆写相对，这里是累加
---@param objid integer 角色对象ID
---@param attrtype number 生物属性类型
---@param value number 属性值
---@return boolean result 是否成功
function Monster:AddModAttrib(objid, attrtype, value) end

---给角色添加标签并增加引用计数
---角色没有 Tag 组件时会自动创建
---@param objid integer 角色对象ID
---@param tags string | string[] 标签，字符串或字符串数组
---@param icount number 标签引用计数，默认 1
---@return boolean result 是否成功
function Monster:AddTags(objid, tags, icount) end

---在角色当前速度上追加一个速度分量
---内部乘以 100 转换为引擎单位，并以叠加模式调用 setMotionChange
---@param objid integer 角色对象ID
---@param vx number X 方向速度（方块/秒）
---@param vy number Y 方向速度（方块/秒）
---@param vz number Z 方向速度（方块/秒）
---@return boolean result 是否成功
function Monster:AppendSpeed(objid, vx, vy, vz) end

---把生物配置成水生 AI：可游泳、避水并随机游动
---仅对生物生效
---会关闭避水、开启游泳，并添加随机游泳、怕玩家、鱼群三种 AI 任务
---@param objid integer 角色对象ID
---@return boolean result 是否成功
function Monster:AquaticMobAISet(objid) end

---切换角色的移动方式（行走、游泳、飞行）
---玩家由 changPlayerMoveType 切换，行走与游泳都映射为 IDLE，飞行映射为 FLY
---其他角色走 AIFunctionMgr:SetMovementModeOrAuto
---@param objid integer 角色对象ID
---@param moveMode number 移动模式（CmpEnvEnum.MoveType）
---@return boolean result 是否成功
function Monster:ChangActorMoveType(objid, moveMode) end

---把角色模型替换为指定的自定义模型
---支持 mobprefab/itemprefab/blockprefab/entityprefab/templateprefab/ModelCompObj/ItemInstance/playerskin 前缀
---前缀无法识别时退回 SetModel，仍失败则走 ChangeCustomModelOld
---@param objid integer 角色对象ID
---@param modleName? string 模型标识，格式如 mobprefab_xxx、itemprefab_xxx、templateprefab_xxx、ModelCompObj_<objid>、ItemInstance_<实例ID>、playerskin_<uin>
---@return boolean result 是否成功
function Monster:ChangeCustomModel(objid, modleName) end

---切换生物当前使用的行为树
---直接把参数透传给底层行为树接口，不做参数校验
---@param objid integer 角色对象ID
---@param treeid integer 行为树ID（UUID 字符串）
---@return any result 引擎透传的切换结果
function Monster:ChangeTree(objid, treeid) end

---脚本控制的角色移动后触发一次动作同步检查
---仅当角色由脚本控制时才触发
---由 SetPosition 内部对 Entity 类对象调用
---@param actor any 角色对象（不是对象ID）
function Monster:CheckSyncAction(actor) end

---清空指定星球上所有该配置ID的角色
---角色ID可传资源ID字符串
---bkill 传非布尔值时会按 true 处理
---@param actorid? number | string 生物配置ID，也可传资源ID字符串
---@param bkill? boolean 是否击杀，默认 false；传非布尔值按 true 处理
---@param worldId integer 星球ID
---@return boolean result 是否成功
function Monster:ClearActorWithId(actorid, bkill, worldId) end

---清空角色身上的全部标签
---通过 TagComponent:Clear 实现，没有标签组件时返回 false
---@param objid integer 角色对象ID
---@return boolean result 是否成功
function Monster:ClearTags(objid) end

---比较两个外观标识的主模型是否相同
---两个字符串相同时直接返回 true，否则先用 GetMainModel 解析出真实模型再比较
---@param facade1 string 外观标识字符串
---@param facade2 string 外观标识字符串
---@return boolean result 主模型是否相同
function Monster:CompareMainModel(facade1, facade2) end

---让角色结束骑乘状态
---优先走坐骑 Ride 组件的 DisMount，失败时回退到 RiddenComponent 解除
---@param objid integer 角色对象ID
---@return boolean result 是否成功
function Monster:DisMountActor(objid) end

---放下或抛出当前被拾取的角色
---isThrow 为 true 时先播放 600186 动作
---方向必须是含 x、y、z 的表
---@param objid integer 角色对象ID
---@param dir Mini.Vec3 方向向量表 {x, y, z}
---@param isThrow boolean 是否抛掷，抛掷时会播放 600186 动作
---@param speed number 速度
---@param hasInertance boolean 是否保留惯性
---@return boolean result 是否成功
function Monster:DropActor(objid, dir, isThrow, speed, hasInertance) end

---让角色的发射器按自身朝向发射一次
---emitid 可传资源ID字符串，内部会转成配置ID
---@param objid number 角色对象ID
---@param emitid number 发射器ID，也可传资源ID字符串
---@return boolean result 是否成功
function Monster:EmitByShooter(objid, emitid) end

---让角色的发射器朝目标角色发射
---目标无效或与发射者相同时退化为普通 EmitByShooter
---@param objidA number 角色A的对象ID
---@param emitid number 发射器ID，也可传资源ID字符串
---@param objidB number 角色B的对象ID
---@return boolean result 是否成功
function Monster:EmitByShooterTarget(objidA, emitid, objidB) end

---让角色的发射器朝指定坐标发射
---targetPos 使用方块坐标，内部按方块尺寸换算成世界坐标
---@param objid number 角色对象ID
---@param emitid number 发射器ID，也可传资源ID字符串
---@param targetPos Mini.Vec3 目标位置表 {x, y, z}，单位为方块
---@return boolean result 是否成功
function Monster:EmitByShooterTargetPos(objid, emitid, targetPos) end

---让被拾取的角色挣脱当前拾取状态
---@param objid integer 角色对象ID
---@return boolean result 是否成功
function Monster:EscapePickup(objid) end

---在角色所在高度层寻找最近的指定方块
---未找到方块时不返回任何值
---@param objid? integer 角色对象ID
---@param blockid? string 方块ID，也可传资源ID字符串
---@param blockRange number 搜索范围半径
---@return number? x 方块X坐标
---@return number? y 方块Y坐标
---@return number? z 方块Z坐标
function Monster:FindLevelNearestBlock(objid, blockid, blockRange) end

---在角色所在高度层随机寻找一个指定方块
---随机排序后取第一个，未找到时不返回任何值
---@param objid? integer 角色对象ID
---@param blockid? string 方块ID，也可传资源ID字符串
---@param blockRange number 搜索范围半径
---@return number? x 方块X坐标
---@return number? y 方块Y坐标
---@return number? z 方块Z坐标
function Monster:FindLevelRandomsortBlock(objid, blockid, blockRange) end

---寻找距离角色最近的指定方块
---未找到方块时不返回任何值
---@param objid integer 角色对象ID
---@param blockid number | string 方块ID，也可传资源ID字符串
---@param blockRange number 搜索范围半径
---@return number? x 方块X坐标
---@return number? y 方块Y坐标
---@return number? z 方块Z坐标
function Monster:FindNearestBlock(objid, blockid, blockRange) end

---查询角色某个动作属性的开关状态
---读取 ActionAttrStateComponent:checkActionAttrState
---@param objid? integer 角色对象ID
---@param actionattr number 动作属性或能力枚举（CmpEnvEnum.Ability / PlayerAttr）
---@return boolean? result 开关状态，参数非法或角色不存在时为 nil
function Monster:GetActionAttrState(objid, actionattr) end

---按方向类型获取角色的朝向角
---只支持 Yaw（偏航）与 Pitch（俯仰）两种类型
---@param objid? integer 角色对象ID
---@param itype number 方向类型（CmpEnvEnum.FaceType.Yaw 偏航 / Pitch 俯仰）
---@return number? value 朝向角，类型不支持或角色不存在时为 nil
function Monster:GetActorDir(objid, itype) end

---获取角色当前的外观标识字符串
---自定义模型返回 ModelComp_ 前缀的标识
---玩家传入 bhasequip 为 true 时包含装备外观
---@param objid integer 角色对象ID
---@param bhasequip boolean 是否包含装备外观，仅对玩家生效
---@return string? value 外观标识，如 ModelComp_xxx，取不到时为 nil
function Monster:GetActorFacade(objid, bhasequip) end

---获取角色当前的移动模式
---@param objid integer 角色对象ID
---@return number? mode 移动模式（CmpEnvEnum.MoveType），取不到时为 nil
function Monster:GetActorMovementMode(objid) end

---查询角色的某个能力权限是否开启
---等价于 GetCmpBaseState
---@param objid integer 角色对象ID
---@param ability any 能力枚举（CmpEnvEnum.Ability）
---@return boolean result 权限是否开启
function Monster:GetActorPermissions(objid, ability) end

---读取生物属性值
---该实现覆盖了 Actor 版本，只调用 monsterApi:getAtt，不支持玩家属性分支
---@param objid integer 角色对象ID
---@param atttype number 属性类型
---@return number? value 属性值，属性不支持或角色不存在时为 nil
function Monster:GetAttr(objid, atttype) end

---获取角色身体碰撞尺寸（宽、高）
---内部按 0.01 换算为方块单位
---角色不存在时不返回任何值
---@param objid integer 角色对象ID
---@param bodySizeType number 身体尺寸类型，默认 0
---@return number w 宽度（方块）
---@return number h 高度（方块）
function Monster:GetBodySize(objid, bodySizeType) end

---获取角色包围盒尺寸
---取自 GetAABBInfo，未做单位换算
---函数名沿用引擎的 Szie 拼写
---@param objid? integer 角色对象ID
---@return table? size 尺寸表 {x, y, z}，角色不存在时为 nil
function Monster:GetBoundSzie(objid) end

---读取生物行为树黑板变量的值
---值是 table 时只返回其中一个值；数组形式的 table 一律返回 nil
---@param objid number 角色对象ID
---@param varid string 行为树黑板变量ID
---@return any value 变量值，取不到时为 nil
function Monster:GetBtreeVarValue(objid, varid) end

---获取技能槽位的最大蓄力数量
---@param objid? integer 角色对象ID
---@param slot number 技能槽位序号，从 1 开始
---@return number? num 最大蓄力数量，参数非法时为 nil
function Monster:GetChargingMaxNum(objid, slot) end

---获取技能槽位的最大蓄力时间
---@param objid? integer 角色对象ID
---@param slot number 技能槽位序号，从 1 开始
---@return number? time 最大蓄力时间（秒），参数非法时为 nil
function Monster:GetChargingMaxTime(objid, slot) end

---获取技能槽位当前的蓄力数量
---@param objid? integer 角色对象ID
---@param slot number 技能槽位序号，从 1 开始
---@return number? num 当前蓄力数量，参数非法时为 nil
function Monster:GetChargingNum(objid, slot) end

---获取技能槽位已经蓄力的时间
---@param objid? integer 角色对象ID
---@param slot number 技能槽位序号，从 1 开始
---@return number? time 已蓄力时间（秒），参数非法时为 nil
function Monster:GetChargingTime(objid, slot) end

---查询角色能力状态是否开启
---部分能力枚举会被映射为玩家操作禁用，或转到 BaseState 组件
---actionattr 大于等于 1000 时按能力组（减去 1000）查询
---@param objid integer 角色对象ID
---@param actionattr number 动作属性或能力枚举（CmpEnvEnum.Ability / PlayerAttr）
---@return boolean value 该能力是否开启
function Monster:GetCmpBaseState(objid, actionattr) end

---获取角色所在的星球（地图）ID
---等价于 GetObjWorldId
---@param objid integer 角色对象ID
---@return number mapid 星球ID，角色不存在时为 -1
function Monster:GetCurMapId(objid) end

---获取角色所在的星球（地图）ID
---与 GetCurMapId 相同，是同一接口的别名
---@param objid integer 角色对象ID
---@return number mapid 星球ID，角色不存在时为 -1
function Monster:GetCurrMapId(objid) end

---获取角色对应的生物配置ID
---自定义生物优先通过 GetCustomAssetIdByObjId 取资源ID
---@param objid integer 角色对象ID
---@return string|number? id 自定义生物返回资源ID字符串，原生生物返回配置ID
function Monster:GetDefID(objid) end

---获取掉落物实例的唯一ID字符串
---@param objid integer 角色对象ID
---@return string? instanceid 道具实例ID，没有实例数据时为 nil
function Monster:GetDropItemInstanceId(objid) end

---获取掉落物当前的数量
---@param objid integer 角色对象ID
---@return number? num 数量，角色不存在时为 nil
function Monster:GetDropItemNum(objid) end

---由预制体名拼出实体外观标识
---预制体已内置时返回 templateprefab_ 前缀，否则返回 entityprefab_ 前缀
---@param prefab any 预制体资源名
---@return string? value 外观标识，prefab 为空时为 nil
function Monster:GetEntityFacade(prefab) end

---获取角色眼睛（视点）高度
---内部按 0.01 换算为方块单位
---@param objid integer 角色对象ID
---@return number? height 视点高度（方块）
function Monster:GetEyeHeight(objid) end

---获取角色当前的朝向向量
---@param objid integer 角色对象ID
---@return table? dir 方向表 {x, y, z}，角色不存在时为 nil
function Monster:GetFaceDirection(objid) end

---获取角色朝向的俯仰角
---@param objid? integer 角色对象ID
---@return number? pitch 俯仰角，参数非法时为 nil
function Monster:GetFacePitch(objid) end

---获取角色朝向的偏航角
---@param objid? integer 角色对象ID
---@return number? yaw 偏航角，参数非法时为 nil
function Monster:GetFaceYaw(objid) end

---获取角色手持枪械的品质、等级与词条数量
---角色没有枪械时不返回任何值
---@param objid integer 角色对象ID
---@return number quality 枪械品质
---@return number level 枪械等级
---@return number featureCount 词条数量
function Monster:GetGunInfo(objid) end

---获取掉落物对应的道具ID
---先按自定义资源查询，再回退到角色自身的 GetItemId
---@param objid integer 角色对象ID
---@return string|number? itemid 道具ID，自定义道具为资源ID字符串
function Monster:GetItemId(objid) end

---获取角色最近一次下落的速度
---@param objid integer 角色对象ID
---@return number speed 下落速度，取不到时为 0
function Monster:GetLastFallSpeed(objid) end

---获取当前关卡的等级模式
---首次调用后结果会缓存在服务实例上
---@return number? mode 等级模式值，未开启星级等级时为 nil
function Monster:GetLevelMode() end

---把外观标识解析成真正的主模型名
---ModelCompObj_<objid> 会去查对象的 Model 组件，其它标识原样返回
---@param facade string 外观标识字符串，如 ModelCompObj_<objid>
---@return string? model 主模型名，facade 不是字符串时为 nil
function Monster:GetMainModel(facade) end

---获取角色当前的最大血量
---@param objid integer 角色对象ID
---@return number? hp 最大血量，角色不存在时为 nil
function Monster:GetMaxHP(objid) end

---获取生物配置里的描述文本
---@param actorid? number | string 生物配置ID，也可传资源ID字符串
---@return string? desc 生物描述，配置不存在时为 nil
function Monster:GetMonsterDefDesc(actorid) end

---获取生物配置里的图标资源标识
---@param monsterid? string 生物配置ID，也可传资源ID字符串
---@return string? icon 图标标识，配置不存在时为 nil
function Monster:GetMonsterIcon(monsterid) end

---获取生物配置里的质量
---@param actorid? number | string 生物配置ID，也可传资源ID字符串
---@return number? mass 质量值，配置不存在时为 nil
function Monster:GetMonsterMass(actorid) end

---获取生物配置里的生物类型
---@param monsterid? string 生物配置ID，也可传资源ID字符串
---@return number? itype 生物类型枚举值，配置不存在时为 nil
function Monster:GetMonsterType(monsterid) end

---获取角色当前的运动速度分量
---直接取 LocoMotion:GetMotion，未做单位换算
---角色不存在时不返回任何值
---@param objid integer 角色对象ID
---@return number x X 方向速度
---@return number y Y 方向速度
---@return number z Z 方向速度
function Monster:GetMotion(objid) end

---获取玩家昵称或生物显示名
---@param objid integer 角色对象ID
---@return string? name 昵称，玩家与生物之外的类型为 nil
function Monster:GetNickName(objid) end

---获取对象类型枚举
---@param objid integer 角色对象ID
---@return number? objtype 对象类型（ObjType），对象不存在时为 nil
function Monster:GetObjType(objid) end

---获取对象所在的星球（地图）ID
---@param objid integer 角色对象ID
---@return number worldid 星球ID，对象不存在时为 -1
function Monster:GetObjWorldId(objid) end

---获取角色的欧拉角朝向
---角色不存在时不返回任何值
---@param objid integer 角色对象ID
---@return number x X 轴角度
---@return number y Y 轴角度
---@return number z Z 轴角度
function Monster:GetOrientation(objid) end

---获取角色当前的覆盖重力倍率
---@param objid? integer 角色对象ID
---@return number|boolean value 重力倍率，默认 1；objid 无效时为 false
function Monster:GetOverlayGravity(objid) end

---获取角色拾取关系中另一方的对象ID
---Carried 取抱起自己的角色，Carrying 取自己抱着的角色
---@param objid integer 角色对象ID
---@param roleType number 拾取类型（CmpEnvEnum.RolePickupType.Carried 被抱 / Carrying 抱着）
---@return number objid 对方对象ID，没有拾取关系时为 0
function Monster:GetPickupObjID(objid, roleType) end

---获取角色当前的世界坐标
---内部按 0.01 换算为方块单位
---角色不存在时不返回任何值
---@param objid integer 角色对象ID
---@return number x X 坐标（方块）
---@return number y Y 坐标（方块）
---@return number z Z 坐标（方块）
function Monster:GetPosition(objid) end

---获取当前骑乘的坐骑对象ID
---@param objid integer 角色对象ID
---@return number objid 坐骑对象ID，未骑乘时为 0
function Monster:GetRidingActorObjId(objid) end

---获取技能槽位的剩余冷却时间
---@param objid? integer 角色对象ID
---@param slot number 技能槽位序号，从 1 开始
---@return number? cd 冷却时间（秒），参数非法时为 nil
function Monster:GetSkillCD(objid, slot) end

---获取技能槽位的最大冷却时间
---@param objid? integer 角色对象ID
---@param slot number 技能槽位序号，从 1 开始
---@return number? cd 最大冷却时间（秒），参数非法时为 nil
function Monster:GetSkillMaxCD(objid, slot) end

---获取角色所属的队伍
---@param objid integer 角色对象ID
---@return number? teamid 队伍ID，角色不存在时为 nil
function Monster:GetTeam(objid) end

---查询角色是否永久 tick（空实现，恒返回 true）
---函数体没有任何查询逻辑，仅返回 true
---@param objid integer 角色对象ID
---@return boolean value 恒为 true
function Monster:GetTickForever(objid) end

---判断对象是否存在且存活
---等价于 IsExist
---@param objid integer 角色对象ID
---@return boolean result 是否存在且存活
function Monster:HasActor(objid) end

---判断角色身上的标签是否满足条件
---bexactmatch 为 true 走精确匹配，否则模糊匹配
---mathcmode 为 Any 时任一标签命中即可
---@param objid integer 角色对象ID
---@param tags string | string[] 标签，字符串或字符串数组
---@param mathcmode number 匹配模式（CmpEnvEnum.MatchMode.Any 任一 / All 全部）
---@param bexactmatch boolean 是否精确匹配，false 为模糊匹配
---@return boolean result 是否命中
function Monster:HasTags(objid, tags, mathcmode, bexactmatch) end

---在角色当前属性值上增加一个增量
---增量为 0 时直接返回 true
---最大血量与最大饥饿值有专门处理，其余属性走 GetAttr/SetAttr
---@param objid integer 角色对象ID
---@param atttype number 属性类型
---@param val number 属性值
---@return boolean result 是否成功
function Monster:IncreasesAttr(objid, atttype, val) end

---初始化触发器全局数据管理器
---依赖全局数据的接口会在需要时自动调用，一般无需手动调用
function Monster:InitTriggerGlobalData() end

---判断对象是否存在且存活
---@param objid integer 角色对象ID
---@return boolean result 是否存在且存活
function Monster:IsExist(objid) end

---判断角色技能槽位上是否装配了技能
---@param objid? integer 角色对象ID
---@param slot number 技能槽位序号，从 1 开始
---@return boolean? result 是否有技能，参数非法时为 nil
function Monster:IsHaveSkill(objid, slot) end

---判断对象ID是否是生物
---生物对象ID大于 4294967296，通过 WorldMgr:findMobByWID 判定
---@param objid number 角色对象ID
---@return boolean result 是否是生物
function Monster:IsMob(objid) end

---判断对象ID是否是玩家
---玩家对象ID小于 4294967296，通过 WorldMgr:GetPlayerByUin 判定
---@param objid number 角色对象ID
---@return boolean result 是否是玩家
function Monster:IsPlayer(objid) end

---让角色跳跃一次并同步给客户端
---@param objid integer 角色对象ID
---@return boolean result 是否成功
function Monster:Jump(objid) end

---直接击杀指定角色
---@param objid integer 角色对象ID
---@return boolean result 是否成功
function Monster:KillSelf(objid) end

---让角色骑乘到目标坐骑身上
---两个对象ID相同或缺失时直接失败
---坐骑没有 Ride 组件时会自动添加
---isCloseAI 为 true 表示关闭坐骑自身的 AI
---@param objid integer 角色对象ID
---@param rideobjid integer 坐骑角色的对象ID
---@param isContrl boolean 是否由玩家操控
---@param isCloseAI boolean 是否关闭 AI
---@return boolean result 是否成功
function Monster:MountActor(objid, rideobjid, isContrl, isCloseAI) end

---扫描生物与道具配置，整理可随机使用的外观列表
---结果缓存在 facadeList 上供 RandomFacadeID 使用
---会过滤副本、不可脚本使用以及特定 TriggerType 的配置
function Monster:OrganizeFacadeList() end

---暂停或恢复角色身上指定ID的音效
---soundId 传 -1 表示该角色身上的全部音效
---@param objid integer 角色对象ID
---@param soundId number 音效ID，-1 表示该角色身上的全部音效
---@param pause boolean 是否暂停，false 表示恢复播放
---@return boolean result 是否成功
function Monster:PauseSoundEffectById(objid, soundId, pause) end

---让角色抱起（抓住）另一个角色
---两个动作ID默认 100502 与 100113
---锚点默认挂在头部
---偏移量按方块单位换算
---@param objidA integer 角色A的对象ID
---@param objidB integer 角色B的对象ID
---@param actionA any 拾取者动作ID，默认 100502
---@param actionB any 被拾取者动作ID，默认 100113
---@param offest Mini.Vec3 锚点偏移表 {x, y, z}，单位为方块，默认 (0, 0.2, 0)
---@param rotate Mini.Vec3 旋转表 {x, y, z}，单位为角度
---@param playemode any 播放模式（CmpEnvEnum.AnimMode），默认 -1
---@param playspeed? number 播放速度，默认 1
---@param anchorId? integer 挂点ID（CmpEnvEnum.HumanBodyAnchorId），默认 Head
---@return boolean result 是否成功
function Monster:PickupActor(objidA, objidB, actionA, actionB, offest, rotate, playemode, playspeed, anchorId) end

---让角色拾取指定的掉落物
---实际拾取由触发器全局数据管理器执行
---两个参数必须是数字，否则直接返回 0
---@param objid number 角色对象ID
---@param itemobjid number 掉落物对象的对象ID
---@param bforcepickup? boolean 是否强制拾取，默认 false
---@return number result 底层拾取接口 PickUpDropitem 的返回值
function Monster:PickupItem(objid, itemobjid, bforcepickup) end

---让角色播放指定的动作
---actid 必须是 TriggerAct 配置表中存在的动作
---玩家通过任务下发，生物直接调用 playActForTrigger
---@param objid integer 角色对象ID
---@param actid number 动作ID（TriggerAct 配置）
---@return boolean result 是否成功
function Monster:PlayAct(objid, actid) end

---让角色播放指定动画
---loop 必须传入，boolean 或 AnimMode 数值
---播放成功后会派发 Actor.PlayAnim 脚本事件
---旧模型会按模型配置修正循环模式
---@param objid integer 角色对象ID
---@param animid number | string 动画ID或动画名
---@param speed number 速度
---@param loop number | boolean 循环模式，boolean 或 CmpEnvEnum.AnimMode 数值，必填
---@return boolean result 是否成功
function Monster:PlayAnim(objid, animid, speed, loop) end

---按动画ID播放角色动画，可指定播放层与过渡
---@param objid integer 角色对象ID
---@param animid number | string 动画ID或动画名
---@param inputloopmode any 循环模式（CmpEnvEnum.AnimMode）
---@param playLayer any 播放层
---@param crossfade any 过渡时间（秒）
---@return boolean result 是否成功
function Monster:PlayAnimById(objid, animid, inputloopmode, playLayer, crossfade) end

---让角色同步播放另一个角色当前的动画
---两个ID相同或不是数字时直接失败
---环境表标注为 BoardCast，调用会广播到各客户端
---@param objidA number 角色A的对象ID
---@param objidB number 角色B的对象ID
---@param breplay boolean 是否重新播放
---@return boolean result 是否成功
function Monster:PlayAnimByObj(objidA, objidB, breplay) end

---播放角色身体特效（引擎条件写反，实际恒返回 false）
---源码条件是 type(itype) ~= string or type(itype) ~= number，永远成立，特效不会播放
---需要播放特效请改用 PlayBodyEffectByFile 或 PlayBodyEffectById
---@param objid integer 角色对象ID
---@param itype number | string 特效类型（该实现中未生效）
---@return boolean result 恒为 false
function Monster:PlayBodyEffect(objid, itype) end

---按特效文件名在角色身上播放身体特效
---sync 默认 true，传 false 时只在本地播放
---@param objid integer 角色对象ID
---@param filename string 特效文件名
---@param sync? boolean 是否同步到客户端，默认 true
---@return boolean result 是否成功
function Monster:PlayBodyEffectByFile(objid, filename, sync) end

---按粒子ID在角色身上播放特效
---particleId 支持单个ID或ID数组
---scale 默认 1
---PlayMode 为 2 的粒子会自动取配置的播放时长
---@param objid integer 角色对象ID
---@param particleId number | string 粒子ID，也可传特效资源名或ID数组
---@param scale? number 缩放倍数
---@param ptme any 特效持续时间（秒），小于等于 0 表示跟随配置
---@return boolean result 是否成功
function Monster:PlayBodyEffectById(objid, particleId, scale, ptme) end

---按粒子ID在角色身上播放粒子并设置偏移、旋转与缩放
---offset 单位为方块，rot 为角度，scale 为倍数
---ptme 小于等于 0 时按配置时长播放，PlayMode 为 2 的粒子默认 1.5 秒
---particleId 支持ID、资源名或数组
---@param objid integer 角色对象ID
---@param particleId number | string 粒子ID，也可传特效资源名或ID数组
---@param ptme number 特效持续时间（秒），小于等于 0 表示跟随配置
---@param offset? Mini.Vec3 偏移表 {x, y, z}，单位为方块
---@param rot? Mini.Vec3 旋转表 {x, y, z}，单位为角度
---@param scale? Mini.Vec3 缩放倍数
---@return boolean result 是否成功
function Monster:PlayBodyParticleById(objid, particleId, ptme, offset, rot, scale) end

---让角色播放手部动画
---loop 必须传入，boolean 或 AnimMode 数值
---不会派发 Actor.PlayAnim 事件
---@param objid integer 角色对象ID
---@param animid number | string 动画ID或动画名
---@param speed number 速度
---@param loop number | boolean 循环模式，boolean 或 CmpEnvEnum.AnimMode 数值，必填
---@return boolean result 是否成功
function Monster:PlayHandAnim(objid, animid, speed, loop) end

---按下角色技能槽位对应的技能
---槽位从 1 开始，内部转换为 0 基索引
---@param objid? integer 角色对象ID
---@param slot number 技能槽位序号，从 1 开始
---@return boolean result 是否成功
function Monster:PlaySkill(objid, slot) end

---按音效名在角色身上播放音效
---volume 默认 1，pitch 默认 1，flag 默认 3
---@param objid integer 角色对象ID
---@param name string 音效名称
---@param volume number 音量
---@param pitch number 音调倍率
---@param flag number 播放标记，默认 3
---@return boolean result 是否成功
function Monster:PlaySoundByName(objid, name, volume, pitch, flag) end

---按音效ID在角色身上播放音效
---volume 按百分比传入（0-100），内部乘以 0.01
---isLoop 默认 false
---自定义资源音效走 playCustomSoundByTrigger，内置音效走 playSoundByTrigger
---@param objid integer 角色对象ID
---@param soundId number 音效ID，-1 表示该角色身上的全部音效
---@param volume number 音量百分比（0-100）
---@param pitch number 音调倍率
---@param isLoop? boolean 是否循环播放，默认 false
---@return boolean result 是否成功
function Monster:PlaySoundEffectById(objid, soundId, volume, pitch, isLoop) end

---让角色对目标造成伤害，与 ActorHurt 等价
---直接转发给 ActorHurt
---@param objid integer 角色对象ID
---@param targetid integer 目标角色对象ID
---@param damage number 伤害值，必须大于 0
---@param attacktype number 攻击类型（CmpEnvEnum.AttackType），默认 ATTACK_FIXED
---@param ignoreResist boolean 是否忽略护甲等抗性，默认 false
---@param ignoreTriggerEvent boolean 是否不触发受击相关脚本事件
---@return boolean result 是否成功施加伤害
function Monster:PlayerHurt(objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end

---从外观列表中随机取一个外观标识
---列表未构建时会先调用 OrganizeFacadeList
---@return string? facade 外观标识，如 mob_xxx、item_xxx、block_xxx，列表为空时为 nil
function Monster:RandomFacadeID() end

---随机取一个野人名称
---@return any name 随机取到的野人名称
function Monster:RandomName() end

---把角色模型恢复成初始（默认）模型
---房主端按对象类型分别恢复玩家、生物、道具的默认外观
---客机端只能对本地玩家生效，会按商城与皮肤数据重建外观
---环境表标注为 HostAndClient
---@param ishost boolean 是否房主端，true 为房主、false 为客机
---@param objid? integer 角色对象ID
---@return boolean result 是否成功
function Monster:RecoverinitialModel(ishost, objid) end

---移除角色身上的标签并减少引用计数
---icount 默认 0，表示忽略引用计数直接删除
---多个标签时返回最后一次删除的结果
---@param objid integer 角色对象ID
---@param tags string | string[] 标签，字符串或字符串数组
---@param icount number 引用计数，默认 0 表示忽略计数直接删除
---@return boolean result 是否成功
function Monster:RemoveTags(objid, tags, icount) end

---让生物立即转向目标角色
---@param objid integer 角色对象ID
---@param targetid integer 目标角色对象ID
---@return boolean result 是否成功
function Monster:RotateFaceToActor(objid, targetid) end

---设置掉落物是否允许被拾取
---仅对道具掉落物（ClientItem）生效
---@param objid number 角色对象ID
---@param able boolean 是否允许被拾取
---@return boolean result 是否成功
function Monster:SetAblePick(objid, able) end

---设置角色动作属性的开关状态
---通过脚本任务 TRIGGERSTATEATTR 下发执行
---@param objid integer 角色对象ID
---@param actionattr number 动作属性或能力枚举（CmpEnvEnum.Ability / PlayerAttr）
---@param switch boolean 开关，true 为开启
---@return boolean result 是否成功
function Monster:SetActionAttrState(objid, actionattr, switch) end

---设置角色是否由脚本接管控制
---@param objid? integer 角色对象ID
---@param b boolean 是否由脚本接管控制
---@return boolean result 是否成功
function Monster:SetActorControl(objid, b) end

---按方向类型设置角色朝向角
---只支持 Yaw（偏航）与 Pitch（俯仰）两种类型
---@param objid? integer 角色对象ID
---@param itype number 方向类型（CmpEnvEnum.FaceType.Yaw 偏航 / Pitch 俯仰）
---@param value any 朝向角
---@return boolean result 是否成功
function Monster:SetActorDir(objid, itype, value) end

---设置角色的能力权限开关
---等价于 SetCmpBaseState
---@param objid integer 角色对象ID
---@param ability any 能力枚举（CmpEnvEnum.Ability）
---@param switch boolean 开关，true 为开启
---@return boolean result 是否设置成功
function Monster:SetActorPermissions(objid, ability, switch) end

---设置生物属性值
---该实现覆盖了 Actor 版本，只调用 monsterApi:setAtt，不支持玩家属性分支
---底层参数顺序为 (objid, val, atttype)
---@param objid? integer 角色对象ID
---@param atttype number 属性类型
---@param val number 属性值
---@return boolean result 是否成功
function Monster:SetAttr(objid, atttype, val) end

---设置生物的受击（仇恨）目标
---@param objid integer 角色对象ID
---@param targetid integer 目标角色对象ID
---@return boolean result 是否成功
function Monster:SetBeHurtTarget(objid, targetid) end

---设置角色是否禁用受击
---只有状态真正发生变化时才返回 true
---@param objid integer 角色对象ID
---@param value boolean 属性值
---@return boolean result 是否成功
function Monster:SetBehitDisable(objid, value) end

---设置角色身上某个特效的缩放
---@param objid integer 角色对象ID
---@param particleId number | string 粒子ID，也可传特效资源名或ID数组
---@param scale number 缩放倍数
---@return boolean result 是否成功
function Monster:SetBodyEffectScale(objid, particleId, scale) end

---按特效文件名设置身体特效缩放
---scale 限制在 (0, 5] 区间，小于等于 0 时按 1 处理
---@param objid number 角色对象ID
---@param filename string 特效文件名
---@param scale number 缩放倍数
---@return boolean result 是否成功
function Monster:SetBodyEffectScaleByFile(objid, filename, scale) end

---设置角色身上粒子的偏移、旋转与缩放
---offset 单位为方块，rot 为角度，scale 为倍数
---particleId 支持ID、资源名或数组
---@param objid number 角色对象ID
---@param particleId number | string 粒子ID，也可传特效资源名或ID数组
---@param offset? Mini.Vec3 偏移表 {x, y, z}，单位为方块
---@param rot? Mini.Vec3 旋转表 {x, y, z}，单位为角度
---@param scale? Mini.Vec3 缩放倍数
---@return boolean result 是否成功
function Monster:SetBodyParticleTransform(objid, particleId, offset, rot, scale) end

---写入生物行为树黑板变量的值
---@param objid number 角色对象ID
---@param varid string 行为树黑板变量ID
---@param val any 属性值
---@return boolean result 是否成功
function Monster:SetBtreeVarValue(objid, varid, val) end

---设置角色是否参与碰撞
---状态未变化时直接返回 false
---有碰撞值组件时会同步给客户端
---@param objid integer 角色对象ID
---@param value boolean 属性值
---@return boolean result 是否成功
function Monster:SetCanCollide(objid, value) end

---设置技能槽位的蓄力状态
---@param objid? integer 角色对象ID
---@param slot number 技能槽位序号，从 1 开始
---@param ischarging boolean 是否处于蓄力中
---@return boolean result 是否成功
function Monster:SetCharging(objid, slot, ischarging) end

---设置技能槽位当前的蓄力值
---@param objid? integer 角色对象ID
---@param slot number 技能槽位序号，从 1 开始
---@param value number 属性值
---@return boolean result 是否成功
function Monster:SetChargingValue(objid, slot, value) end

---一次性设置技能槽位的蓄力时间与数量信息
---max、num、maxnum 依次对应最大蓄力时间、当前蓄力数量、最大蓄力数量
---@param objid? integer 角色对象ID
---@param slot number 技能槽位序号，从 1 开始
---@param max number 最大蓄力时间（秒）
---@param num number 当前蓄力数量
---@param maxnum number 最大蓄力数量
---@param isauto boolean 是否自动冷却
---@return boolean result 是否成功
function Monster:SetCharginginfo(objid, slot, max, num, maxnum, isauto) end

---设置角色能力状态的开关
---部分能力枚举会转换成玩家操作禁用（切换快捷栏、旋转视角、输入旋转）
---actionattr 大于等于 1000 时按能力组（减去 1000）设置
---@param objid integer 角色对象ID
---@param actionattr number 动作属性或能力枚举（CmpEnvEnum.Ability / PlayerAttr）
---@param switch boolean 开关，true 为开启
---@return boolean result 是否成功
function Monster:SetCmpBaseState(objid, actionattr, switch) end

---设置角色朝向向量
---@param objid integer 角色对象ID
---@param x number 朝向向量 X 分量
---@param y number 朝向向量 Y 分量
---@param z number 朝向向量 Z 分量
---@return boolean result 是否成功
function Monster:SetFaceDirection(objid, x, y, z) end

---设置角色朝向的俯仰角
---@param objid? integer 角色对象ID
---@param pitch number 音调倍率
---@return boolean result 是否成功
function Monster:SetFacePitch(objid, pitch) end

---设置角色朝向的偏航角并立即同步
---底层 setFaceYaw(yaw, true) 会带同步标记
---@param objid? integer 角色对象ID
---@param yaw number 偏航角
---@return boolean result 是否成功
function Monster:SetFaceYaw(objid, yaw) end

---设置生物的首次搜索标记
---@param objid integer 角色对象ID
---@param firstsearch boolean 是否首次搜索
---@return boolean result 是否成功
function Monster:SetFirstSearch(objid, firstsearch) end

---添加或移除角色的伤害免疫类型
---immunetype 传 -1 表示直接设置无敌状态
---@param objid integer 角色对象ID
---@param immunetype number 免疫类型，-1 表示直接设为无敌
---@param isadd boolean 是否添加，false 表示移除
---@return boolean result 是否成功
function Monster:SetImmuneType(objid, immunetype, isadd) end

---覆写角色的模组属性值
---与 AddModAttrib 的累加相对，这里是覆写
---@param objid integer 角色对象ID
---@param attrtype number 生物属性类型
---@param value number 属性值
---@return boolean result 是否成功
function Monster:SetModAttrib(objid, attrtype, value) end

---直接设置角色的运动速度
---玩家走 trySetMotionChange，其它角色构造向量后 setMotionChange
---与 AppendSpeed 的叠加不同，这里是覆盖
---@param objid integer 角色对象ID
---@param x number X 方向速度
---@param y number Y 方向速度
---@param z number Z 方向速度
---@return boolean result 是否成功
function Monster:SetMotionChange(objid, x, y, z) end

---设置坐骑的旋转、操控与 AI 开关
---@param objid integer 角色对象ID
---@param isRote boolean 是否允许旋转
---@param isPlayerContrl boolean 是否由玩家操控
---@param isCloseAI boolean 是否关闭 AI
---@return userdata? obj 被设置的坐骑对象，对象或 Ride 组件不存在时为 nil
function Monster:SetMountActorAttr(objid, isRote, isPlayerContrl, isCloseAI) end

---设置角色昵称
---昵称命中过滤词时会被替换成 ****
---@param objid integer 角色对象ID
---@param nickname string 昵称字符串
---@return boolean result 是否成功
function Monster:SetNickName(objid, nickname) end

---设置角色的欧拉角朝向
---对象类角色设置三轴旋转，普通角色只取 y 作为偏航角
---@param objid integer 角色对象ID
---@param x number X 轴旋转角度
---@param y number Y 轴旋转角度
---@param z number Z 轴旋转角度
---@return boolean result 是否成功
function Monster:SetOrientation(objid, x, y, z) end

---设置角色的覆盖重力倍率
---内部乘以 -8 后写入触发器扩展值 5
---@param objid? integer 角色对象ID
---@param val number 重力倍率，限制在 -1 到 10 之间
---@return boolean result 是否成功
function Monster:SetOverlayGravity(objid, val) end

---把角色传送到指定世界坐标
---内部乘以 100 转换为引擎单位
---玩家走 gotoPosEx，Entity 类对象还会触发动作同步检查
---@param objid? integer 角色对象ID
---@param x number X 坐标（方块）
---@param y number Y 坐标（方块）
---@param z number Z 坐标（方块）
---@return boolean result 是否成功
function Monster:SetPosition(objid, x, y, z) end

---设置角色在坐骑上的骑乘位置
---直接写入 Ride 组件的位移，不校验参数
---@param objid integer 角色对象ID
---@param x number X 偏移
---@param y number Y 偏移
---@param z number Z 偏移
function Monster:SetRidePosition(objid, x, y, z) end

---设置角色缩放
---对象类角色按三轴缩放，普通角色只取 y
---@param objid integer 角色对象ID
---@param x number X 轴缩放倍数
---@param y number Y 轴缩放倍数
---@param z number Z 轴缩放倍数
---@return boolean result 是否成功
function Monster:SetScale(objid, x, y, z) end

---设置技能槽位的冷却时间
---@param objid? integer 角色对象ID
---@param slot number 技能槽位序号，从 1 开始
---@param cd number 冷却时间（秒）
---@return boolean result 是否成功
function Monster:SetSkillCD(objid, slot, cd) end

---设置技能槽位的最大冷却与自动冷却标记
---@param objid? integer 角色对象ID
---@param slot number 技能槽位序号，从 1 开始
---@param maxcd number 最大冷却时间（秒）
---@param isauto boolean 是否自动冷却
---@return boolean result 是否成功
function Monster:SetSkillCDInfo(objid, slot, maxcd, isauto) end

---设置角色所属队伍
---队伍ID取值 0-1000，非法时直接失败
---bResetAttr 为 true 时会同时重置属性
---@param objid integer 角色对象ID
---@param teamid number 队伍ID，取值范围 0-1000
---@param bResetAttr? boolean 是否同时重置属性，默认 false
---@return boolean result 是否成功
function Monster:SetTeam(objid, teamid, bResetAttr) end

---设置角色永久 tick（空实现，恒返回 true）
---函数体没有任何逻辑，参数不会被使用
---@param objid integer 角色对象ID
---@param tickForever any 是否永久 tick（该实现未使用此参数）
---@return boolean result 恒为 true
function Monster:SetTickForever(objid, tickForever) end

---设置是否显示角色昵称
---bshow 默认 false
---环境表标注为 BoardCast，调用会广播到各客户端
---@param objid integer 角色对象ID
---@param bshow? boolean 是否显示，默认 false
---@return boolean result 是否成功
function Monster:ShowNickName(objid, bshow) end

---查询技能槽位是否正在蓄力
---@param objid? integer 角色对象ID
---@param slot number 技能槽位序号，从 1 开始
---@return boolean? result 是否蓄力中，参数非法时为 nil
function Monster:SkillIsCharging(objid, slot) end

---停止角色身上正在播放的全部动画
---@param objid integer 角色对象ID
---@return boolean result 是否成功
function Monster:StopAllAnim(objid) end

---停止角色身体特效（引擎条件写反，实际恒返回 false）
---源码条件写反导致永远提前返回 false，特效不会停止
---停止特效请改用 StopBodyEffectById
---@param objid integer 角色对象ID
---@param itype number | string 特效类型（该实现中未生效）
---@return boolean result 恒为 false
function Monster:StopBodyEffect(objid, itype) end

---按粒子ID停止角色身上的特效
---粒子ID不存在时也会返回 true
---@param objid integer 角色对象ID
---@param particleId number | string 粒子ID，也可传特效资源名或ID数组
---@return boolean result 是否成功
function Monster:StopBodyEffectById(objid, particleId) end

---停止角色身上指定ID的音效
---soundId 传 -1 表示停止全部音效
---音效ID无效时返回 false
---@param objid integer 角色对象ID
---@param soundId number 音效ID，-1 表示该角色身上的全部音效
---@return boolean result 是否成功
function Monster:StopSoundEffectById(objid, soundId) end

---手动派发一次角色属性变更脚本事件
---玩家派发 Player.ChangeAttr，其它角色派发 Actor.ChangeAttr
---SetAttr 在数值真正变化时会自动调用
---@param objid integer 角色对象ID
---@param atttype number 属性类型
---@param val any 属性值
---@return boolean? result 对象不存在时为 false，派发后无返回值
function Monster:TriggerAttrChangeEvent(objid, atttype, val) end

---按技能名触发角色技能，可临时挂载成长补丁
---growPatchName 传空字符串表示不应用补丁
---技能与时间轴补丁在触发后会自动移除
---角色没有 SkillComponent 时会尝试创建
---@param objid? number 角色对象ID
---@param skillName string 技能名称
---@param growPatchName? string 成长补丁名称，空字符串表示不应用补丁
---@return boolean result 是否成功
function Monster:TriggerSkillCall(objid, skillName, growPatchName) end

---让角色向目标角色移动
---@param objid number 角色对象ID
---@param targetObjid number 目标角色的对象ID
---@param speed number 速度
---@return boolean result 是否成功
function Monster:TryMoveToActor(objid, targetObjid, speed) end

---让角色不寻路直接朝坐标移动
---@param objid? integer 角色对象ID
---@param x number X 坐标
---@param y number Y 坐标
---@param z number Z 坐标
---@return boolean result 是否成功
function Monster:TryMoveToNoSearch(objid, x, y, z) end

---让角色尝试移动到指定坐标
---玩家坐标会自动加 0.5 方块偏移对齐格子中心
---cancontrol 默认 true，bshowtip 默认 false
---对玩家之外的角色 cancontrol 与 bshowtip 不起作用
---@param objid number 角色对象ID
---@param x number X 坐标（方块）
---@param y number Y 坐标（方块）
---@param z number Z 坐标（方块）
---@param cancontrol boolean 是否允许玩家控制，默认 true
---@param bshowtip boolean 是否显示提示，默认 false
---@return boolean result 是否成功
function Monster:TryMoveToPos(objid, x, y, z, cancontrol, bshowtip) end

---让角色尝试拾取身前一定距离内的角色
---拾取失败时会播放 100502 动作作为空抓表现
---@param objid integer 角色对象ID
---@param distance number 拾取距离，必须大于 0
---@return boolean result 是否成功
function Monster:TryPickupActorForward(objid, distance) end

---让 AI 停止释放指定技能
---@param objid integer 角色对象ID
---@param skillid any 技能ID
---@return boolean? result 是否停止成功，角色不存在时为 nil
function Monster:WhitList_StopSkill(objid, skillid) end

---收集需要随替换角色迁移的变量ID
---把生物、生物组、含生物字段的表变量记录到 m_replacevarinfo，供 ReplaceActor 使用
---下划线前缀的内部实现，不建议外部调用
---@param varmgr any 变量管理器（VarMgr）
function Monster:_GenVarids(varmgr) end
