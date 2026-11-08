---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Player<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---让一个角色对目标角色造成指定类型的伤害
---目标需为可受击的角色；常规受击组件失败后会再尝试基础受击组件
---@param objid? integer 攻击方角色对象ID
---@param targetid integer 受击方角色对象ID
---@param damage number 伤害值，需大于 0
---@param attacktype? number 攻击类型枚举，默认 ATTACK_FIXED
---@param ignoreResist? boolean 是否忽略抗性，默认 false
---@param ignoreTriggerEvent boolean 是否忽略触发事件
---@return boolean result 是否成功造成伤害
function Player:ActorHurt(objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end

---对指定区域内的对象造成范围伤害
---当前版本实现为空，调用不会产生任何效果
---@param objid integer 施法角色对象ID
---@param areaid integer 区域ID
---@param damage number 伤害值
---@param attacktype number 攻击类型
---@param ignoreList table 忽略对象列表
---@param ignoreResist boolean 是否忽略抗性
---@param ignoreTriggerEvent boolean 是否忽略触发事件
function Player:ActorHurtArea(objid, areaid, damage, attacktype, ignoreList, ignoreResist, ignoreTriggerEvent) end

---为角色增加或扣除血量
---@param objid integer 角色对象ID
---@param hp number 血量变化值，负数为扣血
---@return boolean result 是否成功
function Player:AddHp(objid, hp) end

---按模组属性类型为角色叠加属性值
---@param objid integer 角色对象ID
---@param attrtype number 模组属性类型
---@param value number 要叠加的属性值
---@return boolean result 是否成功
function Player:AddModAttrib(objid, attrtype, value) end

---为对象添加标签并增加引用计数
---对象没有标签组件时会自动添加
---@param objid integer 对象ID
---@param tags string | string[] 标签名或标签数组
---@param icount number 引用计数增量，默认 1
---@return boolean result 是否成功
function Player:AddTags(objid, tags, icount) end

---为乘坐中的玩家追加速度
---@param objid integer 玩家Uin
---@param x number X 方向速度
---@param y number Y 方向速度
---@param z number Z 方向速度
---@return boolean result 是否成功
function Player:AppendSpeed(objid, x, y, z) end

---禁止玩家使用体力
---会同时关闭体力食物条显示与兼容体力开关
---@param objid integer 玩家Uin
---@return boolean result 是否成功
function Player:BanUseStrength(objid) end

---将目标对象捕获到指定坐标
---@param playerid integer 玩家Uin
---@param targetId integer 被捕获对象ID
---@param x number 目标X坐标
---@param y number 目标Y坐标
---@param z number 目标Z坐标
---@return boolean result 是否成功
function Player:CapturePlayer(playerid, targetId, x, y, z) end

---切换角色或玩家的移动方式
---玩家ID会转调玩家移动类型接口，其余角色走 AI 移动模式管理器
---@param objid integer 对象ID
---@param moveMode number 移动模式枚举：Walking/Swimming 转为站立，Flying 转为飞行
---@return boolean result 是否成功
function Player:ChangActorMoveType(objid, moveMode) end

---将对象模型换为指定自定义模型
---空字符串返回 false；playerskin 前缀仅当对应玩家存在时才按旧流程处理
---@param objid integer 对象ID
---@param modleName? string 模型标识，如 itemprefab_<id>、blockprefab_<id>、mobprefab_<id>、entityprefab_<id>、templateprefab_<id>、ModelCompObj_<objid>、ItemInstance_<id>、playerskin_<uin>，或普通模型路径
---@return boolean result 是否成功
function Player:ChangeCustomModel(objid, modleName) end

---为模组异步替换玩家部件皮肤贴图
---@param playerid integer 玩家Uin
---@param skinPath? string 皮肤贴图资源路径
---@param partModelName string | table 部件模型名，字符串或用字符串数组表示多个部件
---@param hideFace boolean 是否隐藏脸部，必须为 boolean
---@param isAvatar boolean 是否按 Avatar 模型处理
---@return boolean? result 是否成功，参数类型非法时不返回
function Player:ChangeSkinTextureForMod(playerid, skinPath, partModelName, hideFace, isAvatar) end

---切换主玩家生存模式下的视角模式
---仅对当前主玩家生效
---@param objid integer 玩家Uin，必须是当前主玩家
---@param viewmode any 视角模式
---@param islock any 是否锁定视角
---@return boolean result 是否成功
function Player:ChangeViewModeSurvive(objid, viewmode, islock) end

---向服务器查询自定义订单ID是否已使用
---异步请求；参数不合法时不回调
---@param call_back function 回调函数，参数为返回数据 table
---@param uin number 玩家Uin
---@param orderids string | table 订单ID，字符串或字符串数组
function Player:CheckCustomOrderID(call_back, uin, orderids) end

---判断角色手持枪械的枪械类型
---当前手持道具不是自定义枪械时返回 false
---@param objid integer 角色对象ID
---@param gunType number 要匹配的枪械类型，0 表示任意枪械
---@return boolean result 检查结果
function Player:CheckGunType(objid, gunType) end

---向服务器校验地图商店订单
---@param call_back function 回调函数，参数为 code、orderid、data
---@param uin number 玩家Uin
---@param orderid string 订单ID
---@return boolean result 是否成功发起请求
function Player:CheckMapShopOrder(call_back, uin, orderid) end

---判断真实房主是否为开发者
---结果会缓存；独立服务器直接视为开发者；模组包地图取模组作者 Uin；首次异步查询未完成时返回 false
---@return boolean result 检查结果
function Player:CheckRealOwnerIsDeveloper() end

---检查并同步脚本控制角色的动作
---仅对由脚本控制且存在 transform 的角色生效
---@param actor any 角色对象
function Player:CheckSyncAction(actor) end

---按配置ID清除场景中的全部角色
---@param actorid? number | string 角色配置ID，也可传资源ID字符串
---@param bkill? boolean 是否击杀，默认 false，传非 boolean 时按 true 处理
---@param worldId integer 星球ID
---@return boolean result 是否成功
function Player:ClearActorWithId(actorid, bkill, worldId) end

---清空对象的全部标签
---@param objid integer 对象ID
---@return boolean result 是否成功
function Player:ClearTags(objid) end

---清除任务子系统的脏状态标记
---@return boolean result 固定返回 true
function Player:ClearTaskDirtyState() end

---关闭玩家的枪械升级界面
---@param uin integer 玩家Uin
---@return boolean result 是否成功
function Player:CloseGunUpgradeFrame(uin) end

---关闭角色属性界面
---@param uin integer 玩家Uin
---@return boolean result 固定返回 true
function Player:CloseRoleAttrFrame(uin) end

---判断两个外观是否指向同一主模型
---@param facade1 string 外观标识1
---@param facade2 string 外观标识2
---@return boolean result 是否相同
function Player:CompareMainModel(facade1, facade2) end

---删除地图商店未完成订单并退还道具
---异步；仅处理本人、状态为1且房间类型匹配的订单；背包放不下的部分掉落在玩家位置
---@param uin number 玩家Uin
---@param scene any 场景标识
---@return boolean result 是否成功
function Player:DelMapShopBackOrder(uin, scene) end

---让骑乘中的角色下坐骑
---@param objid integer 角色对象ID
---@return boolean result 是否成功
function Player:DisMountActor(objid) end

---让角色被丢出或抛出
---仅对存活角色生效；投掷时会播放抛出动作
---@param objid integer 角色对象ID
---@param dir Mini.Vec3 抛出方向
---@param isThrow boolean 是否投掷
---@param speed number 抛出速度
---@param hasInertance boolean 是否带惯性
---@return boolean result 是否成功
function Player:DropActor(objid, dir, isThrow, speed, hasInertance) end

---由发射者发射指定发射物
---@param objid number 发射者对象ID
---@param emitid number 发射物ID，可传配置ID字符串
---@return boolean result 是否成功
function Player:EmitByShooter(objid, emitid) end

---由发射者朝目标对象发射发射物
---目标无效或与发射者相同时退化为普通发射
---@param objidA number 发射者对象ID
---@param emitid number 发射物ID
---@param objidB number 目标对象ID
---@return boolean result 是否成功
function Player:EmitByShooterTarget(objidA, emitid, objidB) end

---由发射者朝指定位置发射发射物
---@param objid number 发射者对象ID
---@param emitid number 发射物ID
---@param targetPos Mini.Vec3 目标位置
---@return boolean result 是否成功
function Player:EmitByShooterTargetPos(objid, emitid, targetPos) end

---开启或关闭主玩家的跑动状态更新
---仅对当前主玩家生效
---@param uin? integer 玩家Uin
---@param enable boolean 是否启用
---@return boolean result 是否成功
function Player:EnableUpdateRun(uin, enable) end

---让角色挣脱被拾取或被抓取状态
---@param objid integer 角色对象ID
---@return boolean result 是否成功
function Player:EscapePickup(objid) end

---查找角色同层最近的指定方块
---未找到时返回 nil
---@param objid? integer 角色对象ID
---@param blockid? string 方块ID，可传资源ID字符串
---@param blockRange number 搜索范围
---@return number? x 方块X坐标
---@return number? y 方块Y坐标
---@return number? z 方块Z坐标
function Player:FindLevelNearestBlock(objid, blockid, blockRange) end

---在同层随机顺序查找指定范围内的方块
---未找到时返回 nil
---@param objid? integer 角色对象ID
---@param blockid? string 方块ID，可传资源ID字符串
---@param blockRange number 搜索范围
---@return number? x 方块X坐标
---@return number? y 方块Y坐标
---@return number? z 方块Z坐标
function Player:FindLevelRandomsortBlock(objid, blockid, blockRange) end

---查找角色附近最近的指定方块
---未找到时返回 nil
---@param objid integer 角色对象ID
---@param blockid number | string 方块ID，可传资源ID字符串
---@param blockRange number 搜索范围
---@return number? x 方块X坐标
---@return number? y 方块Y坐标
---@return number? z 方块Z坐标
function Player:FindNearestBlock(objid, blockid, blockRange) end

---将地图商店订单标记为已完成
---房主且非独立服务器时通过数据同步包下发
---@param ishost boolean 是否为房主，房主端会同步到服务器
---@param uin number 玩家Uin
---@param orderid string 订单ID
---@return boolean result 是否成功
function Player:FinishMapShopOrder(ishost, uin, orderid) end

---让玩家获得指定道具
---背包已满时实际数量可能少于请求数量；失败时不返回值
---@param objid integer 玩家Uin
---@param itemid? string 道具ID，可传资源ID字符串
---@param num number 数量
---@param prioritytype number 优先存放位置：1 快捷栏，2 背包栏
---@return number? num 实际获得的数量
function Player:GainItems(objid, itemid, num, prioritytype) end

---构造地图商店下单信息
---返回 table 含 payid、paynum、uin、goods(Base64 JSON)、goods_md5、orderid
---@param uin integer 玩家Uin
---@param scene any 场景标识
---@param payment any 支付货币：MiniBean/MiniPoint/MiniCoin
---@param paynum number 支付数量
---@param itemids number | table 道具ID或道具ID数组
---@param itemnums number | table 道具数量或数量数组
---@param extends table 扩展信息，会写入订单并附加 scene 与 roomtype
---@param call_back function 回调函数
---@return table|boolean info 订单信息，参数非法时为 false
function Player:GenMapShopBaseInfo(uin, scene, payment, paynum, itemids, itemnums, extends, call_back) end

---查询角色某个动作属性开关状态
---对象不存在时返回 nil
---@param objid? integer 角色对象ID
---@param actionattr number 动作属性
---@return boolean? value 开关状态
function Player:GetActionAttrState(objid, actionattr) end

---获取角色的朝向角
---类型非法时返回 nil
---@param objid? integer 角色对象ID
---@param itype number 朝向类型：FaceType.Yaw 取偏航角，FaceType.Pitch 取俯仰角
---@return number? value 角度值
function Player:GetActorDir(objid, itype) end

---获取角色的外观标识
---自定义模型返回 ModelComp_ 前缀数据；玩家优先取商城模型；失败返回 nil
---@param objid integer 对象ID
---@param bhasequip boolean 是否包含装备外观，仅对玩家有效
---@return string? facade 外观标识
function Player:GetActorFacade(objid, bhasequip) end

---获取角色的移动模式
---角色不存在时返回 nil
---@param objid integer 角色对象ID
---@return number mode 移动模式
function Player:GetActorMovementMode(objid) end

---获取角色某项能力权限的开关状态
---@param objid integer 角色对象ID
---@param ability any 能力枚举
---@return boolean value 是否拥有该权限
function Player:GetActorPermissions(objid, ability) end

---获取玩家某项属性值
---读取失败时不返回值
---@param objid integer 玩家Uin
---@param attrtype number 属性类型
---@return number? value 属性值
function Player:GetAttr(objid, attrtype) end

---获取角色的碰撞体宽高
---角色不存在时返回 nil
---@param objid integer 角色对象ID
---@param bodySizeType number 身体尺寸类型，默认 0
---@return number? w 宽度，单位米
---@return number? h 高度，单位米
function Player:GetBodySize(objid, bodySizeType) end

---获取角色包围盒尺寸
---角色不存在时返回 nil
---@param objid? integer 角色对象ID
---@return table? size 含 x、y、z 的包围盒尺寸
function Player:GetBoundSzie(objid) end

---读取角色行为树黑板变量
---黑板 ID 无效、变量不存在或为数组时返回 nil
---@param objid number 角色对象ID
---@param varid string 行为树变量ID
---@return any value 变量值
function Player:GetBtreeVarValue(objid, varid) end

---查询玩家购买开发者商店道具的记录
---异步；失败时先以空 table 回调；资源ID会转换为道具ID查询
---@param call_back function 回调函数，参数为 道具ID/资源ID 到数量的映射 table
---@param uin number 玩家Uin
---@param itemids table 道具ID、资源ID，或其数组
---@return boolean? result 是否发起查询，失败返回 false
function Player:GetBuyItemRecoder(call_back, uin, itemids) end

---获取当前相机旋转四元数
---@param playerid integer 玩家ID，当前实现未使用
---@return userdata rot 相机旋转四元数
function Player:GetCameraRot(playerid) end

---获取技能槽的蓄力最大数量
---对象或槽位非法时返回 nil
---@param objid? integer 角色对象ID
---@param slot number 技能槽位，从 1 开始
---@return number? num 蓄力最大数量
function Player:GetChargingMaxNum(objid, slot) end

---获取技能槽的蓄力最大时间
---对象或槽位非法时返回 nil
---@param objid? integer 角色对象ID
---@param slot number 技能槽位，从 1 开始
---@return number? time 蓄力最大时间
function Player:GetChargingMaxTime(objid, slot) end

---获取技能槽当前的蓄力数量
---对象或槽位非法时返回 nil
---@param objid? integer 角色对象ID
---@param slot number 技能槽位，从 1 开始
---@return number? num 当前蓄力数量
function Player:GetChargingNum(objid, slot) end

---获取技能槽当前的蓄力时间
---对象或槽位非法时返回 nil
---@param objid? integer 角色对象ID
---@param slot number 技能槽位，从 1 开始
---@return number? time 当前蓄力时间
function Player:GetChargingTime(objid, slot) end

---获取角色某项能力开关状态
---EnableBeattacked/EnableBekilled/EnableDeathdropitem 映射为对应玩家属性；EnableSwitchShortcut/EnableRotatingCamera/EnableInputRotate 取操作禁用取反；大于等于 1000 时按能力组查询
---@param objid integer 角色对象ID
---@param actionattr number 能力枚举（CmpEnvEnum.Ability）
---@return boolean value 是否开启
function Player:GetCmpBaseState(objid, actionattr) end

---获取对象当前所在地图ID
---对象不存在时返回 -1
---@param objid integer 对象ID
---@return number mapid 地图ID
function Player:GetCurMapId(objid) end

---获取对象当前所在地图ID
---对象不存在时返回 -1
---@param objid integer 对象ID
---@return number mapid 地图ID
function Player:GetCurrMapId(objid) end

---获取生物角色的配置ID
---优先取模组自定义资源ID，其次取角色 defID；失败返回 nil
---@param objid integer 对象ID
---@return any id 配置ID
function Player:GetDefID(objid) end

---读取玩家的目标任务脏数据
---由任务子系统返回，可能为 nil
---@param uin integer 玩家Uin
---@return any info 任务信息
function Player:GetDirtyObjectiveTaskInfo(uin) end

---获取存在目标任务脏数据的玩家 Uin 列表
---@return table uins 玩家Uin数组
function Player:GetDirtyObjectiveTaskUins() end

---读取玩家的任务脏数据
---由任务子系统返回，可能为 nil
---@param uin integer 玩家Uin
---@return any info 任务信息
function Player:GetDirtyTaskInfo(uin) end

---获取存在任务脏数据的玩家 Uin 列表
---@return table uins 玩家Uin数组
function Player:GetDirtyTaskUins() end

---获取掉落物道具的实例ID
---没有实例ID时返回 nil
---@param objid integer 掉落物对象ID
---@return string? instanceid 道具实例ID
function Player:GetDropItemInstanceId(objid) end

---获取掉落物包含的道具数量
---对象不存在时不返回值
---@param objid integer 掉落物对象ID
---@return number? num 道具数量
function Player:GetDropItemNum(objid) end

---把预制体名转换为实体外观标识
---名称为空时返回 nil；已注册到 ResPrefab 表的转为 templateprefab_
---@param prefab any 预制体资源名
---@return string? facade templateprefab_ 或 entityprefab_ 前缀的外观标识
function Player:GetEntityFacade(prefab) end

---获取角色眼睛高度
---角色不存在时返回 nil
---@param objid integer 角色对象ID
---@return number? height 视点高度，单位米
function Player:GetEyeHeight(objid) end

---获取角色的朝向向量
---角色不存在时返回 nil
---@param objid integer 角色对象ID
---@return table? dir 含 x、y、z 的朝向向量
function Player:GetFaceDirection(objid) end

---获取玩家的俯仰角
---玩家不存在时返回 nil
---@param objid integer 玩家Uin
---@return number? pitch 俯仰角
function Player:GetFacePitch(objid) end

---获取玩家的偏航角
---玩家不存在时返回 nil
---@param objid integer 玩家Uin
---@return number? yaw 偏航角
function Player:GetFaceYaw(objid) end

---获取玩家的食物等级
---读取失败时不返回值
---@param objid integer 玩家Uin
---@return number? level 食物等级
function Player:GetFoodLevel(objid) end

---获取玩家的游戏结算数据
---玩家不存在时不返回值
---@param objid integer 玩家Uin
---@return any results 结算数据
function Player:GetGameResults(objid) end

---获取玩家的游戏分数
---玩家不存在时不返回值
---@param objid integer 玩家Uin
---@return number? score 游戏分数
function Player:GetGameScore(objid) end

---获取玩家当前枪械的伤害类型
---玩家不存在或不是自定义枪械时返回 -1
---@param objid integer 玩家Uin
---@return number damagetype 伤害类型
function Player:GetGunDamageType(objid) end

---获取枪械的品质、等级和特性数量
---获取失败时返回 nil
---@param objid integer 角色对象ID
---@return number? quality 枪械品质
---@return number? level 枪械等级
---@return number? featurecount 特性数量
function Player:GetGunInfo(objid) end

---获取掉落物对应的道具ID
---优先取模组自定义资源ID，其次取掉落物道具ID；失败返回 nil
---@param objid integer 对象ID
---@return any itemid 道具ID
function Player:GetItemId(objid) end

---获取角色最近一次下落速度
---无法获取时返回 0
---@param objid integer 角色对象ID
---@return number speed 下落速度
function Player:GetLastFallSpeed(objid) end

---获取当前世界是否为星球等级模式
---结果会缓存；WorldMgr 或配置未就绪时返回 nil
---@return any mode 等级模式值
function Player:GetLevelMode() end

---从外观标识中解析主模型名
---ModelCompObj_<objid> 会解析为该对象的模型；其余原样返回；参数非字符串时返回 nil
---@param facade string 外观标识
---@return string? model 主模型名
function Player:GetMainModel(facade) end

---获取当前主玩家的 Uin
---获取失败时不返回值
---@return number? uin 主玩家Uin
function Player:GetMainPlayerUin() end

---同步玩家商城外观模型给房主
---通过 DataSycMgr 上报，形式为 skin_/avator_/skinandpart_ 前缀的模型字符串；无有效数据时上报 skin_259 并返回 false
---@param reportid integer 同步报告ID
---@param objid integer 玩家Uin
---@return boolean result 是否取到有效外观数据
function Player:GetMallModel(reportid, objid) end

---查询地图商店全部未完成订单
---异步 HTTP 请求，失败时回调空 table
---@param uin number 玩家Uin
---@param call_back function 回调函数，参数为按场景分组的订单 table
---@return boolean result 是否成功发起请求
function Player:GetMapShopAllNoFinishOrder(uin, call_back) end

---获取角色最大血量
---角色不存在时返回 nil
---@param objid integer 角色对象ID
---@return number? hp 最大血量
function Player:GetMaxHP(objid) end

---获取角色当前移动速度
---角色或运动组件不存在时不返回值
---@param objid integer 角色对象ID
---@return number? x X方向速度
---@return number? y Y方向速度
---@return number? z Z方向速度
function Player:GetMotion(objid) end

---获取角色的显示名称
---玩家取昵称、生物取显示名；其他类型或失败返回 nil
---@param objid integer 对象ID
---@return string? name 昵称或生物显示名
function Player:GetNickName(objid) end

---获取对象类型
---@param objid integer 对象ID
---@return number objtype 对象类型枚举
function Player:GetObjType(objid) end

---获取对象所在星球ID
---对象不存在时返回 -1
---@param objid integer 对象ID
---@return number worldid 星球ID
function Player:GetObjWorldId(objid) end

---获取对象本地旋转欧拉角
---对象不存在时不返回值
---@param objid integer 对象ID
---@return number? x X轴角度
---@return number? y Y轴角度
---@return number? z Z轴角度
function Player:GetOrientation(objid) end

---获取对象的重力覆盖倍率
---未设置过时返回 1；参数非法时返回 false
---@param objid? integer 对象ID
---@return number|boolean gravity 重力倍率，参数非法时为 false
function Player:GetOverlayGravity(objid) end

---获取角色背负或抱起的对象ID
---无对应关系时返回 0
---@param objid integer 角色对象ID
---@param roleType number 拾取类型：RolePickupType.Carried 取被抱者，Carrying 取抱起者
---@return number objid 关联对象ID
function Player:GetPickupObjID(objid, roleType) end

---获取对象世界坐标
---对象不存在时返回 nil
---@param objid integer 对象ID
---@return number? x X坐标，单位米
---@return number? y Y坐标，单位米
---@return number? z Z坐标，单位米
function Player:GetPosition(objid) end

---获取角色正在骑乘的对象ID
---未骑乘或失败时返回 0
---@param objid integer 角色对象ID
---@return number objid 被骑乘对象ID
function Player:GetRidingActorObjId(objid) end

---获取世界设置中某项玩法开关
---仅本机玩家可查询；未设置过的项默认返回 true
---@param playerid? integer 玩家Uin，必须为本机玩家
---@param itype number 设置项类型
---@return boolean value 是否开启
function Player:GetSettingAbility(playerid, itype) end

---获取玩家指定道具技能的冷却时间
---玩家不存在或接口不可用时返回 nil
---@param objid integer 玩家Uin
---@param itemid? string 道具ID，可传资源ID字符串
---@return number? cd 冷却时间
function Player:GetSkillCD(objid, itemid) end

---获取玩家指定道具技能的当前冷却
---返回值取自 getSkillCDNew 的 cd 项
---@param objid integer 玩家Uin
---@param itemid? string 道具ID，可传资源ID字符串
---@param spellID any 技能ID，默认 0
---@return number cd 当前冷却剩余
function Player:GetSkillCurCD(objid, itemid, spellID) end

---获取技能槽的最大冷却时间
---对象或槽位非法时返回 nil
---@param objid? integer 角色对象ID
---@param slot number 技能槽位，从 1 开始
---@return number? cd 最大冷却时间
function Player:GetSkillMaxCD(objid, slot) end

---按马匹皮肤效果ID查询所属角色皮肤ID
---未匹配到返回 0；首次调用会遍历全部角色皮肤并缓存
---@param horseid any 马匹皮肤效果ID
---@return number skinid 角色皮肤ID
function Player:GetSkinIDByHorseID(horseid) end

---获取玩家当前角色皮肤的模型ID
---未穿戴皮肤或查询失败时不返回值
---@param uin number 玩家Uin
---@return number? modelid 皮肤模型ID
function Player:GetSkinModelId(uin) end

---获取对象当前的全部标签
---没有标签或对象不存在时返回 nil
---@param objid integer 对象ID
---@return table? tags 标签字符串数组
function Player:GetTags(objid) end

---获取玩家所在队伍ID
---玩家不存在时不返回值
---@param objid integer 玩家Uin
---@return number? teamid 队伍ID
function Player:GetTeam(objid) end

---查询玩家某项操作是否被触发器禁用
---@param uin integer 玩家Uin
---@param attr any 操作类型：1 切换快捷栏，2 旋转视角，7 输入旋转
---@return boolean disabled 是否被禁用
function Player:GetTriggerOperateDisable(uin, attr) end

---获取玩家当前所在地图ID
---玩家不存在时返回 0
---@param uin integer 玩家Uin
---@return number mapid 地图ID
function Player:GetWorldMapId(uin) end

---开启或关闭玩家枪械的机瞄
---@param uin integer 玩家Uin
---@param b any 是否启用
---@return boolean result 是否成功
function Player:GunEnableAds(uin, b) end

---开启或关闭玩家枪械的命中抖动
---@param uin integer 玩家Uin
---@param b any 是否启用
---@return boolean result 是否成功
function Player:GunEnableHittedShake(uin, b) end

---判断对象是否存在且存活
---@param objid integer 对象ID
---@return boolean result 是否存活
function Player:HasActor(objid) end

---判断对象是否拥有指定标签
---@param objid integer 对象ID
---@param tags string | string[] 标签名或标签数组
---@param mathcmode number 匹配模式：CmpEnvEnum.MatchMode.Any 任一命中，其余为全部命中
---@param bexactmatch boolean true 精确匹配，false 模糊匹配
---@return boolean result 是否满足条件
function Player:HasTags(objid, tags, mathcmode, bexactmatch) end

---在角色属性当前值上增加数值
---属性值会被钳制为不小于 0；val 为 0 时直接返回 true；nan 或无穷大返回 false
---@param objid integer 对象ID
---@param atttype number 属性类型：RoleAttr.MaxHp 加上限血量，RoleAttr.MaxHunger 加最大饥饿值，其余走通用属性读写
---@param val number 变化值，负数为减少
---@return boolean result 是否成功
function Player:IncreasesAttr(objid, atttype, val) end

---初始化触发器全局数据管理器
function Player:InitTriggerGlobalData() end

---判断对象是否存在且存活
---@param objid integer 对象ID
---@return boolean result 是否存在
function Player:IsExist(objid) end

---判断角色技能槽是否已装配技能
---参数非法时返回 nil，角色不存在时返回 false
---@param objid? integer 角色对象ID
---@param slot number 技能槽位，从 1 开始
---@return boolean? result 是否拥有技能
function Player:IsHaveSkill(objid, slot) end

---判断玩家是否为主玩家
---@param objid integer 玩家Uin
---@return boolean result 是否主玩家
function Player:IsMainPlayer(objid) end

---判断对象ID是否为生物
---仅当 ID 大于 4294967296 且能在生物管理器中找到时返回 true
---@param objid number 对象ID
---@return boolean result 是否生物
function Player:IsMob(objid) end

---判断对象ID是否为玩家
---仅当 ID 小于 4294967296 且能查到玩家时返回 true
---@param objid number 玩家Uin
---@return boolean result 是否玩家
function Player:IsPlayer(objid) end

---让角色跳跃一次并同步
---@param objid integer 角色对象ID
---@return boolean result 是否成功
function Player:Jump(objid) end

---直接杀死角色
---@param objid integer 角色对象ID
---@return boolean result 是否成功
function Player:KillSelf(objid) end

---用云端变量 JSON 加载目标任务信息
---@param uin integer 玩家Uin
---@param jsonstr string 任务数据 JSON 字符串
---@return any result 加载结果
function Player:LoadObjectiveTaskInfoByCloudVar(uin, jsonstr) end

---用云端变量 JSON 加载任务信息
---@param uin integer 玩家Uin
---@param jsonstr string 任务数据 JSON 字符串
---@return any result 加载结果
function Player:LoadTaskInfoByCloudVar(uin, jsonstr) end

---向指定玩家发送系统消息
---@param objid integer 玩家Uin
---@param info any 消息内容
---@return boolean result 是否成功
function Player:NotifySystemMsg2Self(objid, info) end

---通知引擎玩家当前手持道具被使用
---@param objid integer 玩家Uin
---@param num number 使用次数
---@return boolean result 是否成功
function Player:OnCurToolUsed(objid, num) end

---打开装备工厂界面
---@param uin integer 玩家Uin
---@param openType number 装备类型
---@param level number 等级
---@param mcoin any 迷你币数量
---@param extraItemOdds any 额外道具概率
---@param consumeOdds any 消耗概率
---@return boolean result 是否成功
function Player:OpenEquipFrame(uin, openType, level, mcoin, extraItemOdds, consumeOdds) end

---打开枪械升级界面
---@param uin integer 玩家Uin
---@return boolean result 是否成功
function Player:OpenGunUpgradeFrame(uin) end

---打开内置道具提示框，或关闭现有提示框
---@param objid integer 对象ID
---@param content? string | table 提示内容：table 会转为 JSON，字符串按资源ID解析；省略时关闭提示框
---@return boolean result 是否成功
function Player:OpenInnerItemTips(objid, content) end

---打开迷你币充值商店界面
---海外环境与国内环境打开的界面不同
---@param uin integer 玩家Uin
---@return boolean result 固定返回 true
function Player:OpenShopMiniCoinView(uin) end

---打开夏日活动界面
---当前版本实现为空，仅返回 true
---@vararg any
---@return boolean result 固定返回 true
function Player:OpenSummerActView(...) end

---打开任务主界面
---实际打开的是角色属性界面第 3 页
---@param uin integer 玩家Uin
function Player:OpenTaskMainUI(uin) end

---展开或收起任务追踪面板
---调用任务追踪按钮点击逻辑
---@param uin integer 玩家Uin
function Player:OpenTaskTraceUI(uin) end

---重新整理可用的生物、方块与道具外观列表
---结果缓存在 self.facadeList，条目形如 mob_<id>、block_<id>、item_<id>
function Player:OrganizeFacadeList() end

---按音效ID暂停或恢复音效
---模组自定义音效与内置音效走不同的暂停通道
---@param objid integer 对象ID
---@param soundId number 音效ID，-1 表示该对象全部音效
---@param pause boolean true 暂停，false 恢复
---@return boolean result 是否成功
function Player:PauseSoundEffectById(objid, soundId, pause) end

---支付地图商店订单
---房主端要求多人大厅且非快速体验房间；客户端仅能支付自己的订单；客户端支付结果通过 PayMapShopOrder 触发事件下发
---@param ishost boolean 是否为房主
---@param uin number 玩家Uin
---@param scene string 场景标识
---@param payment number 支付货币
---@param paynum number 支付数量
---@param itemids any 道具ID或道具ID数组
---@param itemnums any 道具数量或数量数组
---@param extends any 扩展信息
---@param call_back function 回调函数，参数为 code 和 orderid
---@return string|boolean? orderid 房主端返回订单ID，失败或客户端调用时不返回
function Player:PayMapShopOrder(ishost, uin, scene, payment, paynum, itemids, itemnums, extends, call_back) end

---让角色抱起另一个角色
---@param objidA integer 抱起方角色对象ID
---@param objidB integer 被抱起角色对象ID
---@param actionA any 抱起方动作ID，默认 100502
---@param actionB any 被抱起方动作ID，默认 100113
---@param offest Mini.Vec3 挂点偏移（方块单位），默认 (0,0.2,0)
---@param rotate Mini.Vec3 相对旋转
---@param playemode any 播放模式：0 一次，1 循环，-1 默认
---@param playspeed? number 播放速度，默认 1
---@param anchorId? integer 人体挂点，默认 Head
---@return boolean result 是否成功
function Player:PickupActor(objidA, objidB, actionA, actionB, offest, rotate, playemode, playspeed, anchorId) end

---让角色拾取指定掉落物
---参数类型非法时返回 0
---@param objid number 角色对象ID
---@param itemobjid number 掉落物对象ID
---@param bforcepickup? boolean 是否强制拾取，默认 false
---@return number result 拾取结果数值
function Player:PickupItem(objid, itemobjid, bforcepickup) end

---让对象播放触发器动作
---动作配置不存在时返回 false；玩家通过任务系统下发播放
---@param objid integer 对象ID
---@param actid number 触发器动作ID
---@return boolean result 是否成功
function Player:PlayAct(objid, actid) end

---让玩家手部播放指定动画
---@param playerid integer 玩家Uin
---@param animid number | string 动画ID
---@param playmode any 播放模式
---@return boolean result 是否成功
function Player:PlayActInHand(playerid, animid, playmode) end

---播放广告并注册播放完成回调
---会创建一次性任务并注册回调，广告名可被多语言翻译
---@param objid? integer 玩家Uin
---@param adname string 广告名称
---@param callback function 播放结束回调
---@return boolean|number result 是否成功，任务创建失败时返回错误码
function Player:PlayAdvertisingCallback(objid, adname, callback) end

---在客户端拉起广告播放
---播放结果会通过 DataSycMgr 回报给房主
---@param reportid integer 同步报告ID
---@param objid integer 玩家Uin
---@param adname string 广告名称
---@return boolean result 是否成功拉起
function Player:PlayAdvertising_OnClient(reportid, objid, adname) end

---让角色按动画名播放动画
---旧版模型会按兼容规则修正循环模式；播放成功会触发 Actor.PlayAnim 事件
---@param objid integer 角色对象ID
---@param animid number | string 动画ID，会转为字符串序列名
---@param speed number 播放速度
---@param loop number | boolean true/1 循环，false/0 播放一次，数字为动画模式
---@return boolean result 是否成功
function Player:PlayAnim(objid, animid, speed, loop) end

---让玩家播放指定动画ID
---@param playerid number 玩家Uin
---@param id any 动画ID
---@return boolean result 是否成功
function Player:PlayAnimById(playerid, id) end

---让一个对象播放另一个对象的动画
---两个对象相同或类型非法时返回 false
---@param objidA number 播放方对象ID
---@param objidB number 动画来源对象ID
---@param breplay boolean 是否重新播放
---@return boolean result 是否成功
function Player:PlayAnimByObj(objidA, objidB, breplay) end

---播放角色身体特效
---当前实现类型判断条件恒为真，任何调用都会直接返回 false，不会播放特效
---@param objid integer 角色对象ID
---@param itype number | string 特效类型
---@return boolean result 是否成功
function Player:PlayBodyEffect(objid, itype) end

---按特效文件名播放角色身体特效
---@param objid integer 角色对象ID
---@param filename string 特效文件名
---@param sync? boolean 是否同步给其他客户端，默认 true
---@return boolean result 是否成功
function Player:PlayBodyEffectByFile(objid, filename, sync) end

---按粒子ID播放角色身体特效
---播放成功会记录最近创建的粒子ID；PlayMode 为 2 时默认取配置播放时长，否则默认 -1 常驻
---@param objid integer 角色对象ID
---@param particleId number | string 粒子ID，或粒子ID数组
---@param scale? number 缩放，默认 1
---@param ptme any 播放时长，留空时取配置值
---@return boolean result 是否成功
function Player:PlayBodyEffectById(objid, particleId, scale, ptme) end

---按粒子ID在角色身上播放粒子
---offset、rot、scale 类型非法时返回 false；PlayMode 为 2 且未指定时长时使用 1.5 秒
---@param objid integer 角色对象ID
---@param particleId number | string 粒子ID或粒子文件名，也支持数组
---@param ptme number 播放时长，非正数按 -1 常驻
---@param offset? Mini.Vec3 相对偏移（方块单位）
---@param rot? Mini.Vec3 相对旋转
---@param scale? Mini.Vec3 缩放，默认 (1,1,1)
---@return boolean result 是否成功
function Player:PlayBodyParticleById(objid, particleId, ptme, offset, rot, scale) end

---播放主玩家手部动画
---仅对当前主玩家生效；缺少参数时不返回
---@param uin? integer 玩家Uin，必须是当前主玩家
---@param animid number | string 动画ID
---@param speed? number 播放速度，默认 1
---@param playmode? number 播放模式，默认 1
---@param crassfade? number 过渡时间，默认 0.2
---@return boolean? result 是否成功
function Player:PlayHandAnim(uin, animid, speed, playmode, crassfade) end

---播放主玩家手持工具动画
---仅对当前主玩家生效
---@param uin? integer 玩家Uin，必须是当前主玩家
---@param animid number | string 动画ID
---@param speed? number 播放速度，默认 1
---@param playmode? number 播放模式，默认 1
---@param crassfade? number 过渡时间，默认 0.2
---@return boolean result 是否成功
function Player:PlayHandToolAnim(uin, animid, speed, playmode, crassfade) end

---触发角色指定技能槽的技能
---@param objid? integer 角色对象ID
---@param slot number 技能槽位，从 1 开始
---@return boolean result 是否成功
function Player:PlaySkill(objid, slot) end

---按音效名播放角色音效
---@param objid integer 角色对象ID
---@param name string 音效名
---@param volume number 音量，默认 1
---@param pitch number 音高，默认 1
---@param flag number 播放标志，默认 3
---@return boolean result 是否成功
function Player:PlaySoundByName(objid, name, volume, pitch, flag) end

---按音效ID播放音效
---模组自定义音效与内置音效走不同的播放通道
---@param objid integer 角色对象ID
---@param soundId number 音效ID
---@param volume number 音量，取值会乘以 0.01
---@param pitch number 音高，默认 1
---@param isLoop? boolean 是否循环，默认 false
---@return boolean result 是否成功
function Player:PlaySoundEffectById(objid, soundId, volume, pitch, isLoop) end

---让玩家对目标造成伤害
---内部直接转调 ActorHurt，行为与其一致
---@param objid integer 攻击方对象ID
---@param targetid integer 受击方对象ID
---@param damage number 伤害值
---@param attacktype number 攻击类型
---@param ignoreResist boolean 是否忽略抗性
---@param ignoreTriggerEvent boolean 是否忽略触发事件
---@return boolean result 是否成功
function Player:PlayerHurt(objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end

---随机取一个可用外观ID
---外观列表为空时会先重新整理；列表仍为空时不返回值
---@return string? facadeid 外观ID，形如 mob_/block_/item_ 前缀
function Player:RandomFacadeID() end

---把对象外观恢复为初始模型
---房主端按对象类型恢复玩家预制体、生物外观、道具外观或默认模型；客户端仅能恢复自己的商城外观
---@param ishost boolean 是否为房主
---@param objid? integer 对象ID
---@return boolean result 是否成功
function Player:RecoverinitialModel(ishost, objid) end

---刷新已打开的道具提示框内容
---提示框未打开或控件不支持更新时返回 false
---@param uin integer 玩家Uin
---@param itemData any 道具数据
---@return boolean result 是否成功
function Player:RefreshItemTips(uin, itemData) end

---从玩家背包移除指定道具
---@param objid integer 玩家Uin
---@param itemid? string 道具ID，可传资源ID字符串
---@param num number 移除数量
---@return boolean result 是否成功
function Player:RemoveBackpackItem(objid, itemid, num) end

---移除对象标签并减少引用计数
---多个标签时返回最后一个标签的删除结果
---@param objid integer 对象ID
---@param tags string | string[] 标签名或标签数组
---@param icount number 引用计数减量，默认 0
---@return boolean result 是否成功
function Player:RemoveTags(objid, tags, icount) end

---请求扣除玩家的开发者子币
---子币配置不存在、地图ID或数量无效时直接失败；结果会通知玩家并回报给房主
---@param reportid integer 同步报告ID
---@param uin integer 玩家Uin
---@param conid integer 子币配置ID
---@param num number 扣除数量
---@param orderid any 订单ID
function Player:RequestCostCoin(reportid, uin, conid, num, orderid) end

---请求打开子币兑换界面
---仅在开发者商店配置中存在该子币时打开界面
---@param uin integer 玩家Uin
---@param conid integer 子币配置ID
---@param num number 兑换数量
---@param index? number 兑换页签索引，默认 1
function Player:RequestExchangeCoins(uin, conid, num, index) end

---恢复被触发器修改过的世界设置开关
---会按保存的旧值逐个还原并清空缓存
function Player:ResetTriggerGlobalData() end

---让角色转向另一个角色
---@param objid integer 角色对象ID
---@param targetid integer 目标对象ID
---@return boolean result 是否成功
function Player:RotateFaceToActor(objid, targetid) end

---设置掉落物是否可被拾取
---@param objid number 掉落物对象ID
---@param able boolean 是否可拾取
---@return boolean result 是否成功
function Player:SetAblePick(objid, able) end

---设置玩家某个动作属性开关
---@param objid integer 玩家Uin
---@param actionattr number 动作属性
---@param switch boolean 开关值
---@return boolean result 是否成功
function Player:SetActionAttrState(objid, actionattr, switch) end

---设置角色是否由脚本控制
---@param objid? integer 角色对象ID
---@param b boolean 是否由脚本控制
---@return boolean result 是否成功
function Player:SetActorControl(objid, b) end

---设置角色的朝向角
---@param objid? integer 角色对象ID
---@param itype number 朝向类型：FaceType.Yaw 设偏航角，FaceType.Pitch 设俯仰角
---@param value any 角度值
---@return boolean result 是否成功
function Player:SetActorDir(objid, itype, value) end

---设置角色某项能力权限
---内部直接转调 SetCmpBaseState
---@param objid integer 角色对象ID
---@param ability any 能力枚举
---@param switch boolean 开关值
---@return boolean result 是否成功
function Player:SetActorPermissions(objid, ability, switch) end

---设置玩家某项属性值
---@param objid? integer 玩家Uin
---@param attrtype number 属性类型
---@param val number 属性值
---@return boolean result 是否成功
function Player:SetAttr(objid, attrtype, val) end

---设置角色受击时的伤害归属目标
---@param objid integer 角色对象ID
---@param targetid integer 伤害归属对象ID
---@return boolean result 是否成功
function Player:SetBeHurtTarget(objid, targetid) end

---设置角色是否免疫受击
---值与当前状态相同时不重复设置并返回 false
---@param objid integer 角色对象ID
---@param value boolean 是否禁用受击
---@return boolean result 是否成功
function Player:SetBehitDisable(objid, value) end

---按粒子ID设置身体特效缩放
---@param objid integer 角色对象ID
---@param particleId number | string 粒子ID
---@param scale number 缩放倍数
---@return boolean result 是否成功
function Player:SetBodyEffectScale(objid, particleId, scale) end

---按特效文件名设置身体特效缩放
---@param objid number 角色对象ID
---@param filename string 特效文件名
---@param scale number 缩放倍数，超出范围会被钳制到 1 至 5
---@return boolean result 是否成功
function Player:SetBodyEffectScaleByFile(objid, filename, scale) end

---设置角色身体粒子的偏移、旋转与缩放
---offset、rot、scale 类型非法时返回 false
---@param objid number 角色对象ID
---@param particleId number | string 粒子ID或粒子文件名，也支持数组
---@param offset? Mini.Vec3 相对偏移（方块单位）
---@param rot? Mini.Vec3 相对旋转
---@param scale? Mini.Vec3 缩放，默认 (1,1,1)
---@return boolean result 是否成功
function Player:SetBodyParticleTransform(objid, particleId, offset, rot, scale) end

---写入角色行为树黑板变量
---@param objid number 角色对象ID
---@param varid string 行为树变量ID
---@param val any 变量值
---@return boolean result 是否成功
function Player:SetBtreeVarValue(objid, varid, val) end

---设置玩家相机的插值速度
---@param playerid number 玩家Uin
---@param lerpspeed number 插值速度
---@return boolean result 是否成功
function Player:SetCameraLerpSpeed(playerid, lerpspeed) end

---设置角色是否可与其他对象碰撞
---相同时不重复设置并返回 false；有碰撞值组件时会同步到其他客户端
---@param objid integer 角色对象ID
---@param value boolean 是否允许碰撞
---@return boolean result 是否成功
function Player:SetCanCollide(objid, value) end

---设置玩家是否允许投掷
---房主端会同步给其他客户端；客户端仅作用于主玩家
---@param ishost boolean 是否为房主
---@param playerid integer 玩家Uin
---@param bThrow boolean 是否允许投掷
---@return boolean result 是否成功
function Player:SetCanThrow(ishost, playerid, bThrow) end

---设置技能槽是否处于蓄力状态
---@param objid? integer 角色对象ID
---@param slot number 技能槽位，从 1 开始
---@param ischarging boolean 是否蓄力中
---@return boolean result 是否成功
function Player:SetCharging(objid, slot, ischarging) end

---设置技能槽的蓄力值
---@param objid? integer 角色对象ID
---@param slot number 技能槽位，从 1 开始
---@param value number 蓄力值
---@return boolean result 是否成功
function Player:SetChargingValue(objid, slot, value) end

---设置技能槽的蓄力信息
---@param objid? integer 角色对象ID
---@param slot number 技能槽位，从 1 开始
---@param max number 蓄力最大值
---@param num number 当前蓄力数量
---@param maxnum number 蓄力最大数量
---@param isauto boolean 是否自动蓄力
---@return boolean result 是否成功
function Player:SetCharginginfo(objid, slot, max, num, maxnum, isauto) end

---设置角色某项能力开关
---EnableBeattacked/EnableBekilled/EnableDeathdropitem 映射为对应玩家属性；快捷栏、旋转视角、输入旋转会转为操作禁用取反设置
---@param objid integer 角色对象ID
---@param actionattr number 能力枚举（CmpEnvEnum.Ability）
---@param switch boolean 开关值
---@return boolean result 是否成功
function Player:SetCmpBaseState(objid, actionattr, switch) end

---设置死亡界面的自定义回顾信息
---@param uin integer 玩家Uin
---@param curnum number 回顾序号，必须为数字
---@param url string 资源地址
---@param name string 名称
---@param rsetdesc any 回顾描述
---@return boolean result 是否成功
function Player:SetCustomRevieInfo(uin, curnum, url, name, rsetdesc) end

---显示或隐藏死亡界面
---界面未加载时返回 false
---@param uin integer 玩家Uin
---@param visible any 是否显示
---@return boolean result 是否成功
function Player:SetDeathFrameVisible(uin, visible) end

---设置角色朝向向量
---@param objid integer 角色对象ID
---@param x number X 分量
---@param y number Y 分量
---@param z number Z 分量
---@return boolean result 是否成功
function Player:SetFaceDirection(objid, x, y, z) end

---设置角色俯仰角
---@param objid? integer 角色对象ID
---@param pitch number 俯仰角
---@return boolean result 是否成功
function Player:SetFacePitch(objid, pitch) end

---设置角色偏航角
---设置后会同步给其他客户端
---@param objid? integer 角色对象ID
---@param yaw number 偏航角
---@return boolean result 是否成功
function Player:SetFaceYaw(objid, yaw) end

---设置角色是否优先搜索
---@param objid integer 角色对象ID
---@param firstsearch boolean 是否首次搜索
---@return boolean result 是否成功
function Player:SetFirstSearch(objid, firstsearch) end

---设置玩家钓鱼线的终点坐标
---@param uin? integer 玩家Uin
---@param x number 终点X坐标
---@param y number 终点Y坐标
---@param z number 终点Z坐标
---@return boolean result 是否成功
function Player:SetFishLineEndPoint(uin, x, y, z) end

---设置玩家的食物等级
---@param objid integer 玩家Uin
---@param foodLevel number 食物等级
---@return boolean result 是否成功
function Player:SetFoodLevel(objid, foodLevel) end

---设置玩家的游戏分数
---@param objid integer 玩家Uin
---@param score number 分数
---@return boolean result 是否成功
function Player:SetGameScore(objid, score) end

---设置主玩家手部或手持工具动画的播放速度
---animtype 不是 hand 或 handtool 时不返回
---@param uin integer 玩家Uin，必须是当前主玩家
---@param animtype? number 动画通道：hand 手部，handtool 手持工具
---@param animid number | string 动画ID
---@param speed number 播放速度
---@return boolean? result 是否成功
function Player:SetHandOrToolAnimSpeed(uin, animtype, animid, speed) end

---添加或移除角色的免疫类型
---isadd 缺失或类型错误时返回 false
---@param objid integer 角色对象ID
---@param immunetype number 免疫类型，-1 表示无敌
---@param isadd boolean true 添加该免疫类型，false 移除
---@return boolean result 是否成功
function Player:SetImmuneType(objid, immunetype, isadd) end

---设置角色的模组属性值
---@param objid integer 角色对象ID
---@param attrtype number 模组属性类型
---@param value number 属性值
---@return boolean result 是否成功
function Player:SetModAttrib(objid, attrtype, value) end

---设置对象的移动速度变化
---玩家走 trySetMotionChange，其他角色直接 setMotionChange
---@param objid integer 对象ID
---@param x number X 方向速度
---@param y number Y 方向速度
---@param z number Z 方向速度
---@return boolean result 是否成功
function Player:SetMotionChange(objid, x, y, z) end

---设置骑乘组件的骑乘属性
---没有 Ride 组件时也会返回该对象；对象不存在时不返回
---@param objid integer 对象ID
---@param isRote boolean 坐骑是否跟随骑手朝向
---@param isPlayerContrl boolean 是否由玩家控制
---@param isCloseAI boolean 是否关闭 AI
---@return any gameobj 设置的对象
function Player:SetMountActorAttr(objid, isRote, isPlayerContrl, isCloseAI) end

---设置角色昵称
---命中敏感词过滤时昵称会被替换为 ****
---@param objid integer 对象ID
---@param nickname string 昵称
---@return boolean result 是否成功
function Player:SetNickName(objid, nickname) end

---设置玩家是否穿墙
---房主端会同步给其他客户端；房主给自身设置时返回 false；参数缺失时不返回
---@param ishost boolean 是否为房主
---@param uin? integer 玩家Uin
---@param flag boolean 是否开启穿墙
---@return boolean? result 是否成功
function Player:SetNoClip(ishost, uin, flag) end

---设置对象朝向
---普通对象设置本地欧拉角，角色只使用 Y 轴角度设置偏航
---@param objid integer 对象ID
---@param x number X轴角度
---@param y number Y轴角度
---@param z number Z轴角度
---@return boolean result 是否成功
function Player:SetOrientation(objid, x, y, z) end

---设置对象的重力覆盖倍率
---内部按倍率乘以 -8 后写入触发器扩展值
---@param objid? integer 对象ID
---@param val number 重力倍率，超出 -1 至 10 会被钳制
---@return boolean result 是否成功
function Player:SetOverlayGravity(objid, val) end

---显示或隐藏拍立得相机界面
---显示时会切换到拍照视角；关闭时直接关闭拍立得界面
---@param playerid integer 玩家Uin
---@param bvisible boolean 是否显示
---@param hidepto any 是否隐藏拍照按钮
function Player:SetPolaroidViewVisible(playerid, bvisible, hidepto) end

---设置对象世界坐标
---玩家走传送接口，实体设置世界坐标后同步动作，其他角色直接设置位置
---@param objid? integer 对象ID
---@param x number X坐标，单位米
---@param y number Y坐标，单位米
---@param z number Z坐标，单位米
---@return boolean result 是否成功
function Player:SetPosition(objid, x, y, z) end

---设置骑乘组件的骑乘位置
---没有 Ride 组件时不生效
---@param objid integer 对象ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
function Player:SetRidePosition(objid, x, y, z) end

---设置对象缩放
---普通对象使用三轴缩放，角色只使用 Y 值
---@param objid integer 对象ID
---@param x number X 缩放
---@param y number Y 缩放
---@param z number Z 缩放
---@return boolean result 是否成功
function Player:SetScale(objid, x, y, z) end

---设置技能槽的冷却信息
---@param objid? integer 角色对象ID
---@param slot number 技能槽位，从 1 开始
---@param maxcd number 最大冷却时间
---@param isauto boolean 是否自动冷却
---@return boolean result 是否成功
function Player:SetSkillCDInfo(objid, slot, maxcd, isauto) end

---显示或隐藏任务追踪面板
---界面管理器不存在时不返回
---@param uin integer 玩家Uin
---@param bOpen boolean 是否显示
---@return boolean? result 是否成功
function Player:SetTaskTraceVisible(uin, bOpen) end

---设置玩家所在队伍
---@param objid integer 玩家Uin
---@param teamid integer 队伍ID
---@param resetAttr? boolean 是否重置队伍属性，默认 true
---@return boolean result 是否成功
function Player:SetTeam(objid, teamid, resetAttr) end

---设置玩家某项操作是否被触发器禁用
---房主端会同步给其他客户端；客户端设置 attr 为 4 时会同时切换快捷栏显示
---@param ishost boolean 是否为房主
---@param uin number 玩家Uin
---@param attr number 操作类型：1 切换快捷栏，2 旋转视角，4 快捷栏显示，7 输入旋转
---@param disable boolean 是否禁用
---@return boolean result 是否成功
function Player:SetTriggerOperateDisable(ishost, uin, attr, disable) end

---显示或隐藏玩家钓鱼线
---@param uin? integer 玩家Uin
---@param bShow? boolean 是否显示，默认 true
---@return boolean result 是否成功
function Player:ShowFishLine(uin, bShow) end

---显示或隐藏角色昵称
---不传 bshow 时默认隐藏昵称
---@param objid integer 对象ID
---@param bshow? boolean 是否显示，默认 false
---@return boolean result 是否成功
function Player:ShowNickName(objid, bshow) end

---判断技能槽是否正在蓄力
---参数非法时返回 nil，角色不存在时返回 false
---@param objid? integer 角色对象ID
---@param slot number 技能槽位，从 1 开始
---@return boolean? result 是否正在蓄力
function Player:SkillIsCharging(objid, slot) end

---停止角色全部动画
---@param objid integer 角色对象ID
---@return boolean result 是否成功
function Player:StopAllAnim(objid) end

---让玩家停止指定动画
---@param playerid number 玩家Uin
---@param id any 动画ID
---@return boolean result 是否成功
function Player:StopAnimById(playerid, id) end

---停止角色身体特效
---当前实现类型判断条件恒为真，任何调用都会直接返回 false，不会停止特效
---@param objid integer 角色对象ID
---@param itype number | string 特效类型
---@return boolean result 是否成功
function Player:StopBodyEffect(objid, itype) end

---按粒子ID停止角色身体特效
---粒子ID不存在时会跳过；对象不存在时仍返回 true
---@param objid integer 角色对象ID
---@param particleId number | string 粒子ID、特效文件名，或它们的数组
---@return boolean result 是否成功
function Player:StopBodyEffectById(objid, particleId) end

---停止主玩家手部动画
---@param uin? integer 玩家Uin，必须是当前主玩家
---@param animid number | string 动画ID
---@return boolean result 是否成功
function Player:StopHandAnim(uin, animid) end

---停止主玩家手持工具动画
---@param uin? integer 玩家Uin，必须是当前主玩家
---@param animid number | string 动画ID
---@return boolean result 是否成功
function Player:StopHandToolAnim(uin, animid) end

---按音效ID停止音效
---模组自定义音效与内置音效走不同的停止通道
---@param objid integer 对象ID
---@param soundId number 音效ID，-1 表示该对象全部音效
---@return boolean result 是否成功
function Player:StopSoundEffectById(objid, soundId) end

---同步触发器的界面事件过滤数据
---房主读取触发器事件启用信息后同步给指定玩家；客户端解码后写入事件名过滤表
---@param ishost boolean 是否为房主
---@param playerid integer 玩家Uin
---@param customuievent string 触发事件启用信息，客户端侧为数据字符串
---@return boolean result 是否成功
function Player:SyncTriggerData(ishost, playerid, customuievent) end

---让玩家传送回出生点
---@param objid integer 玩家Uin
---@return boolean result 是否成功
function Player:TeleportHome(objid) end

---手动触发属性变化事件
---玩家对象触发 Player.ChangeAttr，其他对象触发 Actor.ChangeAttr
---@param objid integer 对象ID
---@param atttype number 属性类型
---@param val any 属性值
---@return boolean? result 失败时返回 false
function Player:TriggerAttrChangeEvent(objid, atttype, val) end

---按技能名触发角色技能并临时应用成长补丁
---会临时应用技能补丁和时间轴补丁，触发后自动移除；补丁应用失败则直接返回 false
---@param objid? number 角色对象ID
---@param skillName string 技能名
---@param growPatchName? string 成长补丁名，默认空表示不应用补丁
---@return boolean result 是否成功
function Player:TriggerSkillCall(objid, skillName, growPatchName) end

---让角色尝试移动到目标角色身边
---@param objid number 角色对象ID
---@param targetObjid number 目标对象ID
---@param speed number 移动速度
---@return boolean result 是否成功
function Player:TryMoveToActor(objid, targetObjid, speed) end

---让角色不寻路直接尝试移动到坐标
---@param objid? integer 角色对象ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return boolean result 是否成功
function Player:TryMoveToNoSearch(objid, x, y, z) end

---让角色尝试移动到指定坐标
---玩家寻路会额外加半格偏移，其他角色直接换算为厘米
---@param objid number 对象ID
---@param x number X坐标，单位米
---@param y number Y坐标，单位米
---@param z number Z坐标，单位米
---@param cancontrol boolean 是否允许玩家中途控制，默认 true
---@param bshowtip boolean 是否显示提示，默认 false
---@return boolean result 是否成功
function Player:TryMoveToPos(objid, x, y, z, cancontrol, bshowtip) end

---让角色尝试抱起前方的角色
---抱起失败时会播放 100502 动作
---@param objid integer 角色对象ID
---@param distance number 尝试距离，需大于 0
---@return boolean result 是否成功
function Player:TryPickupActorForward(objid, distance) end

---更新玩家模组主线任务的进度
---玩家不存在或类型不小于 0 时返回 false
---@param uin integer 玩家Uin
---@param _type number 任务更新类型，仅小于 0 时生效
---@param target1 any 目标参数1
---@param target2 any 目标参数2
---@param goalnum number 目标数量
---@return boolean result 是否成功
function Player:UpdateMainTaskForMod(uin, _type, target1, target2, goalnum) end

---让角色停止指定技能
---对象不存在时返回 nil
---@param objid integer 角色对象ID
---@param skillid any 技能ID
---@return any result 停止结果
function Player:WhitList_StopSkill(objid, skillid) end
