---枚举库<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/global.html)
---@meta

---@enum Ability
---动作总开关
Ability = {
    Attack = 26, -- 普通攻击
    Break = 16, -- 破坏方块
    CanBePickup = 32, -- 可被举起
    CanUseItemWhenBePickup = 33, -- 被举起时可否使用道具
    Cube = 1001, -- 方块能力总开关
    Drop = 22, -- 丢弃道具
    EnableBeattacked = 100001, -- 可受伤
    EnableBekilled = 100002, -- 可被杀死
    EnableDeathdropitem = 100003, -- 杀死有掉落物
    EnableRotatingCamera = 200002, -- 可旋转摄像机
    EnableSwitchShortcut = 200001, -- 可切换快捷栏
    Flying = 1, -- 飞行
    Interaction = 14, -- 交互方块
    Item = 1002, -- 道具能力总开关
    Jumping = 6, -- 跳跃
    Movement = 1000, -- 移动能力总开关
    Pick = 21, -- 拾取道具
    Place = 15, -- 摆放方块
    Sneaking = 3, -- 潜行
    Sprinting = 4, -- 疾跑
    Swimming = 2, -- 游泳
    Use = 20, -- 使用道具
    Walking = 0 -- 行走
}
---@enum AbsoluteCampType
---绝对阵营
AbsoluteCampType = {
    Enemy = 201, -- 中立敌对
    Noteam = 0, -- 无队伍
    Passive = 202, -- 中立被动
    Team1 = 1, -- 队伍1
    Team2 = 2, -- 队伍2
    Team3 = 3, -- 队伍3
    Team4 = 4, -- 队伍4
    Team5 = 5, -- 队伍5
    Team6 = 6, -- 队伍6
    TeamNpc1 = 101, -- 绝对阵营-npc队伍1
    TeamNpc2 = 102, -- 绝对阵营-npc队伍2
    TeamNpc3 = 103 -- 绝对阵营-npc队伍3
}
---@enum AnimMode
---动作播放方式
AnimMode = {
    Default = 3, -- 表格默认值播放
    Loop = 0, -- 循环播放
    Once = 1, -- 播放一次
    OnceStop = 2 -- 播放一次完毕，停在末尾
}
---@enum AreaFillType
---区域填充类型
AreaFillType = {
    Delete = 1, -- 删除
    Destroy = 2 -- 摧毁
}
---@enum AvtPart
AvtPart = {
    BackOrnament = 8, -- 背装饰
    BgEffect = 18, -- 背景特效
    Body = 0, -- 身体
    EquipBreast = 21, -- 装备胸部
    EquipCustom1 = 26, -- 装备扩展1
    EquipCustom2 = 27, -- 装备扩展2
    EquipCustom3 = 28, -- 装备扩展3
    EquipHead = 20, -- 装备头部
    EquipLegging = 22, -- 装备腿部
    EquipPifeng = 24, -- 装备披风
    EquipShoe = 23, -- 装备鞋子
    EquipWeapon = 25, -- 装备武器
    Face = 2, -- 脸
    FaceEffect = 14, -- 脸特效
    FaceOrnament = 3, -- 脸装饰
    Footprint = 9, -- 脚印
    HandEffect = 16, -- 手特效
    HandOrnament = 5, -- 手装饰
    Head = 1, -- 头部
    HeadEffect = 13, -- 手特效
    Jacket = 4, -- 夹克
    Max = 29, -- 最大值
    RightHand = 11, -- 右手特效
    RightShoe = 12, -- 右脚特效
    Shoe = 7, -- 鞋子
    Skin = 10, -- 皮肤
    TrailingEffect = 17, -- 拖尾特效
    Trousers = 6, -- 裤子
    WholeBodyEffect = 15, -- 全身特效
    WingEffect = 19 -- 翅膀特效
}
---@enum BackpackBeginIndex
---背包起始索引 
BackpackBeginIndex = {
    Equip = 8000, -- 装备栏
    ExtBackpack = 58000, -- 扩展背包
    Inventory = 0, -- 存储栏
    Shortcut = 1000 -- 快捷栏
}
---@enum BackpackType
---玩家背包类型
BackpackType = {
    Equip = 3, -- 装备栏
    Extend = 4, -- 扩展背包
    Inventory = 2, -- 存储栏
    Shortcut = 1 -- 快捷栏
}
---@enum BiomeType
---怪物刷新地形枚举
BiomeType = {
    AirShipFleet = 89, -- 铁穹舰队
    AirShipPlain = 88, -- 铁穹平原
    Airland = 22, -- 迷拉星空岛
    AirlandAir = 41, -- 迷拉星空岛空中
    AirlandGround = 40, -- 迷拉星空岛地上
    AirlandShine = 74, -- 迷拉星粉蝶花空岛
    Basin = 23, -- 迷拉星盆地
    BasinBamboo = 25, -- 迷拉星竹林盆地
    BasinEdge = 24, -- 迷拉星盆地边缘
    BasinLake = 84, -- 迷拉星盆地湖泊
    BasinPeach = 26, -- 迷拉星桃树盆地
    BasinRice = 72, -- 迷拉星盆地稻田
    Beach = 19, -- 迷拉星沙滩
    Canyon = 64, -- 迷拉星峡谷
    CanyonEage = 65, -- 迷拉星峡谷边缘
    City = 78, -- 迷拉星末日城镇
    Cliff = 4, -- 迷拉星峭壁
    CliffEdge = 20, -- 迷拉星峭壁边缘
    CliffGinkgo = 82, -- 迷拉星峭壁银杏林
    CliffMaple = 81, -- 迷拉星峭壁枫叶林
    CliffPlum = 75, -- 迷拉星三角梅峭壁
    ConiferousForest = 6, -- 迷拉星针叶林
    ConiferousForestHills = 15, -- 迷拉星针叶林山丘
    ConiferousForestLake = 86, -- 迷拉星针叶林湖泊
    DeepSea = 49, -- 迷拉星深海
    Desert = 2, -- 迷拉星沙漠
    DesertHills = 13, -- 迷拉星沙漠山丘
    DesertLake = 48, -- 迷拉星沙漠湖泊
    DesertOasis = 47, -- 迷拉星沙漠绿洲
    DesertPopulusEuphratica = 79, -- 迷拉星沙漠胡杨林
    Earthcore = 21, -- 烈焰星熔岩之地
    EyedStarAirlands = 33, -- 萌眼星空岛
    EyedStarAirlandsEdge = 38, -- 萌眼星空岛边缘
    EyedStarAirlandsSub1 = 34, -- 萌眼星子空岛1
    EyedStarAirlandsSub2 = 35, -- 萌眼星子空岛2
    EyedStarAirlandsSub3 = 36, -- 萌眼星子空岛3
    EyedStarAirlandsSub4 = 37, -- 萌眼星子空岛4
    EyedStarGround = 27, -- 萌眼星地表
    EyedStarGroundHills = 28, -- 萌眼星山丘
    EyedStarGroundHills2 = 31, -- 萌眼星山丘2
    EyedStarGroundMountain = 30, -- 萌眼星高山
    EyedStarGroundPlain = 29, -- 萌眼星祭坛平原
    Forest = 3, -- 迷拉星森林
    ForestChrysanth = 71, -- 迷拉星森林菊花花海
    ForestFoxtail = 70, -- 迷拉星森林狗尾草海
    ForestHills = 14, -- 迷拉星森林山丘
    ForestLake = 85, -- 迷拉星森林湖泊
    ForestLavender = 69, -- 迷拉星森林薰衣草花海
    FrozenRiver = 10, -- 迷拉星冻河
    FrozenSea = 9, -- 迷拉星冻洋
    GrassLand = 1, -- 迷拉星草原
    GrassLandArid = 66, -- 迷拉星干旱草原
    GrassLandDandelion = 67, -- 迷拉星草原蒲公英花海
    GrassLandRapeseed = 68, -- 迷拉星草原油菜花海
    IceMountains = 16, -- 迷拉星冰山
    IceSheet = 8, -- 迷拉星冰原
    IceSheetConiferousForest = 56, -- 迷拉星覆雪针叶林
    IceSheetFrizebLake = 63, -- 迷拉星雪山冻湖
    IceSheetHighestPeak = 57, -- 迷拉星雪山主峰
    IceSheetMountain = 59, -- 迷拉星雪山山脉
    IceSheetMountainSide = 60, -- 迷拉星雪山中部
    IceSheetPeakPlain = 61, -- 迷拉星雪山底部
    IceSheetSecondMountainSide = 62, -- 迷拉星雪山副峰中部
    IceSheetSecondPeak = 58, -- 迷拉星雪山副峰
    IslandLandDesert = 51, -- 迷拉星荒岛岛心
    IslandLandRedsoil = 53, -- 迷拉星红土岛心
    IslandLandReef = 55, -- 迷拉星珊瑚岛岛心
    IslandLandTulip = 76, -- 迷拉星郁金香岛心
    IslandShoreDesert = 50, -- 迷拉星荒岛海岸
    IslandShoreRedsoil = 52, -- 迷拉星红土岛海岸
    IslandShoreReef = 54, -- 迷拉星珊瑚岛海岸
    IslandShoreTulip = 77, -- 迷拉星郁金香海岸
    Jungle = 7, -- 迷拉星丛林
    JungleBlueJacaranda = 80, -- 迷拉星丛林蓝花楹树林
    JungleHills = 17, -- 迷拉星丛林山丘
    PlainsLake = 83, -- 迷拉星草原湖泊
    RainForest = 39, -- 迷拉星雨林
    RainForestLake = 87, -- 迷拉星雨林湖泊
    RedSoil = 11, -- 迷拉星红土
    RedSoilShore = 12, -- 迷拉星红土海岸
    River = 18, -- 迷拉星河流
    Sea = 0, -- 迷拉星浅海
    Swamp = 5, -- 迷拉星沼泽
    SwampRiverSide = 73, -- 迷拉星沼泽河畔
    Volcano = 42, -- 迷拉星火山主峰
    VolcanoCore = 46, -- 迷拉星火山口
    VolcanoMountain = 44, -- 迷拉星火山山脉
    VolcanoPlain = 43, -- 迷拉星火山平原
    VolcanoRiver = 45 -- 迷拉星火山岩浆河
}
---@enum BlockAttr
---方块属性枚举
BlockAttr = {
    BepushedDropItem = 16, -- 被推动掉落
    BurningProbability = 5, -- 燃烧几率
    BurningSpeed = 4, -- 燃烧速度
    EnableBeoperated = 2, -- 可操作
    EnableBepushed = 4, -- 可被推动
    EnableDestroyed = 1,-- 可破坏
    EnableDropItem = 8, -- 可掉落道具
    ExplodeResistance = 1, -- 爆炸抗性
    Glissade = 3, -- 滑行惯性
    Hardness = 2, -- 硬度
    Lightness = 6 -- 亮度
}
---@enum BlockLimits
---方块权限
BlockLimits = {
    BepushedDropItem = 16, -- 被推动掉落
    EnableBeoperated = 2, -- 可操作
    EnableBepushed = 4, -- 可被推动
    EnableDestroyed = 1, -- 可破坏
    EnableDropItem = 8 -- 可掉落道具
}
---@enum BlockStatus
---方块状态
BlockStatus = {
    Active = 1, -- 活跃(被激活)
    Inactive = 2 -- 不活跃(未被激活)
}
---@enum CameraEditState
---自定义视角编辑状态
CameraEditState = {
    Edit = 1, -- 编辑
    Null = 0, -- 空
    Test = 2 -- 测试
}
---@enum CameraModel
---摄像机属性
CameraModel = {
    Autoindent = 3, -- 阻挡后自动缩进
    MoveFollow = 1, -- 跟随角色移动
    RelativeRotate = 4, -- 相对人物旋转
    RoleTranslucent = 5, -- 角色半透
    RotateFollow = 2 -- 跟随角色旋转
}
---@enum CameraRotate
---摄像机旋转模式
CameraRotate = {
    AllDir = 1, -- 全方向
    NoTurn = 4, -- 无法转动
    OnlyPitch = 3, -- 仅上下
    OnlyYaw = 2 -- 仅左右
}
---@enum CmpProPermission
---组件属性访问权限
CmpProPermission = {
    Private = 2, -- 私有
    Public = 1, -- 公开
    Read = 3 -- 只读
}
---@enum CmpUIPermission
---组件属性预制面板显示控制
CmpUIPermission = {
    Hide = 0, -- 隐藏
    OfficialShow = 2, -- 仅官方
    Show = 1 -- 显示
}
---@enum CreatureAttr
---生物属性枚举
CreatureAttr = {
    Atk = 42, -- 攻击力
    AtkMagic = 29, -- 元素攻击
    AtkMelee = 17, -- 近战攻击
    AtkPhysical = 28, -- 物理攻击
    AtkRemote = 18, -- 远程攻击
    AttackDis = 41, -- 攻击距离
    BodyLerpSpeed = 27, -- 转身速度
    CurHp = 2, -- 当前生命值
    CurHunger = 6, -- 当前饥饿值
    CurOxygen = 8, -- 当前氧气值
    DefChaos = 24, -- 混乱防御
    DefMagic = 31, -- 元素防御
    DefMelee = 19, -- 近战防御
    DefPhysical = 30, -- 元素防御
    DefRemote = 20, -- 远程防御
    Dimension = 21, -- 模型大小
    Dodge = 16, -- 闪避率
    EnableAttack = 32, -- 可攻击
    EnableBeattacked = 64, -- 可被攻击
    EnableBekilled = 128, -- 可被杀死
    EnableDeathdropitem = 512, -- 死亡掉落
    EnableMove = 1, -- 可移动
    EnablePickup = 256, -- 可拾取道具
    ExtraHp = 32, -- 临时生命值
    FlySpeed = 39, -- 飞行速度
    HpRecover = 3, -- 生命恢复
    JumpPower = 14, -- 跳跃力
    Level = 23, -- 等级
    MaxHp = 1, -- 最大生命值
    MaxHunger = 5, -- 最大饥饿值
    MaxOxygen = 7, -- 最大氧气值
    PackSize = 25, -- 背包空间
    RecoverOxygen = 9, -- 氧气恢复
    RunSpeed = 11, -- 奔跑速度
    SwinSpeed = 13, -- 游泳速度
    Toughness = 33, -- 韧性值
    ViewDis = 40, -- 视野范围
    ViewDistance = 26, -- 视野距离
    WalkSpeed = 10, -- 移动速度
    Weight = 15
}
---@enum CreatureMotion
---生物行为枚举
CreatureMotion = {
    AtkMelee = 4, -- 近战攻击
    AtkRemote = 5, -- 远程攻击
    Beattracted = 10, -- 被吸引
    Copulation = 11, -- 交配
    Follow = 6, -- 跟随
    Idle = 1, -- 空闲
    RunAway = 8, -- 逃跑
    SelfBomb = 9, -- 自爆
    Standby = 2, -- 待机
    Stroll = 3, -- 闲逛
    Swim = 7 -- 游泳
}
---@enum CustomModType
---插件类型
CustomModType = {
    Actor = 7, -- 实体
    Biome = 6, -- 地形插件
    Block = 0, -- 方块插件 预制
    Furnace = 4, -- 熔炼插件
    Item = 2, -- 道具插件
    Monster = 1, -- 生物插件
    Recipe = 3, -- 配方插件
    Rule = 9, -- 世界规则
    Status = 5, -- 状态插件
    UI = 8
}
---@enum DeviceType
---设备类型
DeviceType = {
    Android = 2, -- 安卓
    IOS = 3, -- 苹果
    Other = 0, -- 其他
    PC = 1 -- PC端
}
---@enum DropMode
---掉落物掉落方式
DropMode = {
    ChangePlayMode = 7, -- 掉落物对象转玩法创建
    DefeatMob = 4, -- 生物被击败掉落
    DestroyBlock = 5, -- 方块被破坏掉落
    DestroyBox = 3, -- 箱子被破坏掉落
    DiscardItem = 2, -- 丢弃道具
    SpawnItem = 6 -- 触发器创建
}
---@enum Easing
---线性变换
Easing = {
    BackIn = 25, -- 回退曲线1渐入
    BackInOut = 27, -- 回退曲线3进出
    BackOut = 26, -- 回退曲线2渐出
    BounceIn = 28, -- 弹跳曲线1渐入
    BounceInOut = 30, -- 弹跳曲线3进出
    BounceOut = 29, -- 弹跳曲线2渐出
    CircIn = 19, -- 圆曲线1渐入
    CircInOut = 21, -- 圆曲线3进出
    CircOut = 20, -- 圆曲线2渐出
    CubicIn = 7, -- 三次方曲线1渐入
    CubicInOut = 9, -- 三次方曲线3进出
    CubicOut = 8, -- 三次方曲线2渐出
    Custom = 31, -- 自定义
    ElasticIn = 22, -- 弹簧曲线1渐入
    ElasticInOut = 24, -- 弹簧曲线3进出
    ElasticOut = 23, -- 弹簧曲线2渐出
    ExpoIn = 16, -- 指数曲线1渐入
    ExpoInOut = 18, -- 指数曲线3进出
    ExpoOut = 17, -- 指数曲线2渐出
    Linear = 0, -- 直线变换
    None = -1, -- 无动画
    QuadIn = 4, -- 平方曲线1渐入
    QuadInOut = 6, -- 平方曲线3进出
    QuadOut = 5, -- 平方曲线2渐出
    QuartIn = 10, -- 四次方曲线1渐入
    QuartInOut = 12, -- 四次方曲线3进出
    QuartOut = 11, -- 四次方曲线2渐出
    QuintIn = 13, -- 五次方曲线1渐入
    QuintInOut = 15, -- 五次方曲线3进出
    QuintOut = 14, -- 五次方曲线2渐出
    SineIn = 1, -- 正弦曲线1渐入
    SineInOut = 3, -- 正弦曲线3进出
    SineOut = 2 -- 正弦曲线2渐出
}
---@enum ElementType
---元件类型
ElementType = {
    Button = 2, -- 按钮
    InputText = 4, -- 输入框
    Loader3D = 5, -- 3d装载器
    SlidingContainer = 6, -- 滑动容器
    Text = 3, -- 文本
    Texture = 1 -- 图片
}
---@enum EquipSlotType
---装备部位类型 
EquipSlotType = {
    Breast = 1, -- 身体
    Custom1 = 6, -- 自定义装备位1
    Custom2 = 7, -- 自定义装备位2
    Custom3 = 8, -- 自定义装备位3
    Head = 0, -- 头
    Legging = 2, -- 腿
    MaxSlots = 9, -- 脚
    Pifeng = 4, -- 披风
    Shoe = 3, -- 脚
    Weapon = 5 -- 武器
}
---@enum ErrorCode
---错误码
ErrorCode = {
    FAILED = 1001, -- 失败
    KV_OP_CD_LMT = 100, -- 表设置CD超限
    KV_OP_INVALID_VAL = 5, -- 获取key类型不匹配
    KV_OP_NO_VAL = 4, -- 获取key不存在
    KV_OP_QPM_LMT = 101, -- 表设置QPS/QPM超限
    KV_UPDATE_GET = 1, -- 表安全更新拉取的返回码
    KV_UPDATE_SET = 2, -- 表安全更新设置的返回码
    OK = 0 -- 成功
}
---@enum EventDate
---时间值枚举 
EventDate = {
    Day = 2, -- 日
    Dayofweek = 7, -- 星期几
    Hour = 3, -- 时
    Minute = 4, -- 分
    Month = 1, -- 月
    Second = 5, -- 秒
    Timestamp = 6, -- 时间戳
    Year = 0 -- 年
}
---@enum FaceDir
---朝向
FaceDir = {
    NegX = 0, -- x反方向, 西
    NegY = 4, -- y反方向, 下
    NegZ = 2, -- z反方向, 南
    None = -1, -- 未指定
    PosX = 1, -- x正方向, 东
    PosY = 5, -- y正方向, 上
    PosZ = 3 -- z正方向, 北
}
---@enum FaceType
---朝向类型
FaceType = {
    Pitch = 2, -- 面仰角
    Yaw = 1 -- 面朝方向
}
---@enum GraphicsType
---图文信息枚举
GraphicsType = {
    ArrowActor = 5, -- 箭头 指向生物
    ArrowPos = 4, -- 箭头 指向位置
    Hornbook = 1, -- 文字板
    Image = 10, -- 图片
    LineActor = 7, -- 线 指向生物
    LinePos = 6, -- 线 指向位置
    NavPathPos = 11,
    Progress = 3, -- 进度条
    SurfaceActor = 9, -- 面 指向生物
    SurfacePos = 8, -- 面 指向界面
    Suspendbook = 2 -- 漂浮文字
}
---@enum GridAttr
---格子属性
GridAttr = {
    Durable = 2, -- 耐久度
    ItemNum = 1, -- 道具数量
    Toughness = 3 -- 韧性
}
---@enum GroupWeatherType
---天气状态枚举,局部天气
GroupWeatherType = {
    Bad = 4, -- 恶劣天气
    Blizzard = 8, -- 暴风雪
    Rain = 2, -- 雨天
    Sandduststorm = 6, -- 沙尘暴
    Shine = 1, -- 晴天
    ShineAndRain = 0, -- 晴雨交替
    Snow = 5, -- 雪天
    Tempest = 7, -- 暴风雨
    Thunder = 3 -- 暴风雪
}
---@enum GunAction
---枪械触发事件类型
GunAction = {
    Aim = 6, -- 瞄准待机
    AimFire = 7, -- 瞄准开火
    AimLoad = 8, -- 瞄准手动上膛
    Equip = 1, -- 举枪
    Fire = 3, -- 腰射开火
    Idle = 2, -- 腰射待机
    Inspect = 11, -- 检视
    Load = 4, -- 腰射手动上膛
    Reload = 9, -- 腰射换弹
    ReloadEmpty = 10, -- 腰射空仓换弹
    Run = 5 -- 持枪冲刺
}
---@enum GunActionBan
---枪械禁用类型
GunActionBan = {
    Aim = 5, -- 瞄准待机
    AimFire = 6, -- 瞄准开火
    AimLoad = 7, -- 瞄准手动上膛
    Equip = 1, -- 举枪
    Fire = 2, -- 腰射开火
    Inspect = 10, -- 检视
    Load = 3, -- 腰射手动上膛
    Reload = 8, -- 腰射换弹
    ReloadEmpty = 9, -- 腰射空仓换弹
    Run = 4 -- 持枪冲刺
}
---@enum GunAttr
---枪械属性
GunAttr = {
    AdsMoveSpeedBonus = "adsMoveSpeedBonus", -- 瞄准移动速度倍率
    AdsOffsetX = "adsOffsetX", -- 瞄准偏移值
    AdsOffsetY = "adsOffsetY", -- 瞄准偏移值
    AdsOffsetZ = "adsOffsetZ", -- 瞄准偏移值
    AdsSpreadMax = "adsSpreadMax", -- 瞄准散布最大值
    AdsSpreadMin = "adsSpreadMin", -- 瞄准散布最小值
    AdsSpreadStep = "adsSpreadStep", -- 瞄准散布步长
    AdsSpreadType = "adsSpreadType", -- 瞄准散布类型
    AdsSwitchTime = "adsSwitchTime", -- 瞄准时间
    AdsSwitchTimeBonus = "adsSwitchTimeBonus", -- 瞄准时间倍率
    AdsXFunction = "adsXFunction", -- 瞄准镜准星功能
    AdsXScale = "adsXScale", -- 瞄准镜准星底图缩放值
    BaseDamage = "baseDamage", -- 基础伤害
    BaseDamageBonus = "baseDamageBonus", -- 基础伤害倍率
    BodyDamage = "bodyDamage", -- 躯干倍率
    BulletConsume = "bulletConsume", -- 消耗子弹数
    BulletId = "bulletId", -- 子弹ID（仅获取预制属性）
    BulletShrapnel = "bulletShrapnel", -- 弹片数量
    ControlValue = "controlValue", -- 操控速度（仅取值）
    DamageType = "damageType", -- 伤害类型
    DecayFinish = "decayFinish", -- 衰减结束距离
    DecayLiquid = "dacayLiquid", -- 液体衰减系数
    DecayMin = "decayMin", -- 衰减最小值
    DecayStart = "decayStart", -- 衰减起始距离
    EquipTime = "equipTime", -- 切换枪械行为时间
    FireType = "fireType", -- 开火类型
    GunLevel = "gunLevel", -- 枪械等级 历史遗留的字段，对于游戏本体只用于显示角标
    HeadDamage = "headDamage", -- 头部倍率
    HipAccValue = "hipAccValue", -- 腰射射击精度（仅取值）
    HipMoveSpeedBonus = "hipMoveSpeedBonus", -- 腰射移动速度倍率
    HipSpreadMax = "hipSpreadMax", -- 腰射散布最大值
    HipSpreadMin = "hipSpreadMin", -- 腰射散布最小值
    HipSpreadStep = "hipSpreadStep", -- 腰射散布步长
    HipSpreadType = "hipSpreadType", -- 腰射散布类型
    HittedCameraAngle = "hittedCameraAngle", -- 被击中抬头反馈
    JumpSpreadBonus = "jumpSpreadBonus", -- 跳跃散布倍率
    MaxAmmo = "maxAmmo", -- 弹容量
    MoveSpreadBonus = "moveSpreadBonus", -- 移动散布倍率
    Penetration = "penetration", -- 穿透率
    Range = "range", -- 射程
    RangeBonus = "rangeBonus", -- 射程倍率
    RecoilBonus = "recoilBonus", -- 后坐力倍率
    RecoilPitchBonus = "recoilPitchBonus", -- 垂直后坐力倍率
    RecoilValue = "recoilValue", -- 后坐力控制（仅取值）
    RecoilYawBonus = "recoilYawBonus", -- 水平后坐力倍率
    ReloadPhase2Time = "reloadPhase2Time", -- 换弹行为时间
    ReloadPhase2TimeEmpty = "reloadPhase2TimeEmpty", -- 空仓换弹行为时间
    ReloadTimeBonus = "reloadTimeBonus", -- 换弹时间倍率
    RepelDistance = "repelDistance", -- 击退距离
    Rpm = "rpm", -- 射速(每分钟子弹数)
    RpmBonus = "rpmBonus", -- 射速倍率
    RunSpreadBonus = "runSpreadBonus", -- 疾跑散布倍率
    ScopeMagnification = "scopeMagnification", -- 瞄准倍率
    ScopeXPic = "scopeXPic", -- 瞄准镜准星贴图
    ShiftMoveSpreadBonus = "shiftMoveSpreadBonus", -- 潜行移动散布倍率
    ShiftSpreadBonus = "shiftSpreadBonus", -- 潜行散布倍率
    SpreadAdsBonus = "spreadAdsBonus", -- 瞄准散布倍率
    SpreadBonus = "spreadBonus", -- 散布倍率
    SpreadBonusResetSpeed = "spreadBonusResetSpeed", -- 重置速度
    SpreadHipBonus = "spreadHipBonus", -- 腰射散布倍率
    SpreadResetSpeed = "spreadResetSpeed", -- 重置速度
    SpreadStepSpeed = "spreadStepSpeed", -- 每发增加速度
    TouReduce = "touReduce" -- 削刃值
}
---@enum GunDamageType
---枪械伤害类型
GunDamageType = {
    Fire = 4, -- 燃烧伤害
    Ice = 8, -- 冰冻伤害
    Physics = 1, -- 物理伤害
    Poison = 5 -- 毒素伤害
}
---@enum GunFireType
---枪械开火类型
GunFireType = {
    Auto = 0, -- 全自动
    Manual = 2, -- 手动
    SemiAuto = 1 -- 半自动
}
---@enum GunSpreadType
---枪械散布形状
GunSpreadType = {
    Circle = 1, -- 圆
    NoRightDown = 2, -- 无右下
    RightUp = 0 -- 右上
}
---@enum GunState
---枪械状态
GunState = {
    Entry = 1, -- 进入
    Exit = 2 -- 离开
}
---@enum HorizontalOffset
---水平偏移
HorizontalOffset = {
    Centered = 2, -- 居中
    Left = 1, -- 居左
    Right = 3 -- 居右
}
---@enum HurtType
---伤害类型枚举
HurtType = {
    All = -1, -- 所有伤害（只设置免疫伤害接口有效）
    Antiinjury = 15, -- 反伤 attack_antiinjury
    Anvil = 10, -- 被砸中伤害 attack_anvil
    Asphyxia = 12, -- 窒息伤害 attack_wall
    Bomb = 2, -- 爆炸伤害 attack_explode
    Burning = 3, -- 燃烧伤害 attack_fire
    Cactus = 11, -- 仙人掌伤害 attack_cactus
    Drown = 13, -- 溺水伤害 attack_drown
    Fall = 9, -- 跌落伤害 attack_falling
    Fixed = 17, -- 固定伤害 attack_fixed
    Flash = 6, -- 电元素伤害 attack_flash
    Ice = 7, -- 冰元素伤害 attack_ice
    Laser = 16, -- 被激光伤害 attack_block_laser
    Magic = 8, -- 元素伤害 max_magic_attack
    Melee = 0, -- 近战伤害 attack_punch
    Physics = 3, -- 物理伤害 max_physics_attack
    Remote = 1, -- 远程伤害 attack_range
    Suffocate = 14, -- 水下生物在空气中窒息伤害 attack_suffocate
    Sun = 8, -- 日晒 attack_sun
    Toxin = 4, -- 毒素伤害 attack_poison
    Wither = 5 -- 凋零伤害 attack_wither
}
---@enum InnerPopUpview
---游戏内弹窗界面类型
InnerPopUpview = {
    BackPackEra = 11, -- 背包科技界面
    BackPackRole = 12, -- 背包角色界面
    BackPackTask = 10, -- 背包任务界面
    BuffStatus = 7, -- 状态界面
    CollectMaps = 2, -- 收藏地图界面
    EvaluateMaps = 3, -- 评价地图界面
    InviteFriend = 4, -- 邀请好友界面
    ItemProcessing = 9, -- 道具加工界面
    ItemTips = 6, -- 道具提示界面
    Specialty = 8, -- 特长界面
    StorageBox = 5 -- 储物箱界面
}
---@enum ItemAbility
---道具设置枚举
ItemAbility = {
    Drop = 2, -- 道具不可掉落
    Throw = 1 -- 道具不可丢弃
}
---@enum ItemAttr
---道具属性
ItemAttr = {
    Attack = 1, -- 攻击力
    Duration = 9, -- 耐久度
    ExplodeDefense = 5, -- 爆炸防御
    FireDefense = 6, -- 燃烧防御
    FireInterval = 10, -- 射击间隔
    ItemType = 13, -- 道具类型
    LongDefense = 4, -- 远程防御
    Magazines = 11, -- 弹夹量
    PoisonDefense = 7, -- 毒素防御
    Quality = 12, -- 品质
    ShortDefense = 3, -- 近战防御
    Stackmax = 2, -- 叠加数
    WitherDefense = 8 -- 混乱防御
}
---@enum KeyCode
---按键枚举
KeyCode = {
    A = "A",
    B = "B",
    C = "C",
    D = "D",
    E = "E",
    F = "F",
    G = "G",
    H = "H",
    I = "I",
    J = "J",
    K = "K",
    L = "L",
    M = "M",
    N = "N",
    Number0 = "0",
    Number1 = "1",
    Number2 = "2",
    Number3 = "3",
    Number4 = "4",
    Number5 = "5",
    Number6 = "6",
    Number7 = "7",
    Number8 = "8",
    Number9 = "9",
    O = "O",
    P = "P",
    Q = "Q",
    R = "R",
    S = "S",
    Shift = "SHIFT",
    Space = "SPACE",
    T = "T",
    U = "U",
    V = "V",
    W = "W",
    X = "X",
    Y = "Y",
    Z = "Z"
}
---@enum LogLevel
---输出日志等级
LogLevel = {
    Error = 3, -- 错误输出
    Print = 1, -- 普通输出
    Warn = 2 -- 警告输出
}
---@enum MiniCurrency
---货币类型
MiniCurrency = {
    MiniBean = 1, -- 迷你豆
    MiniCoin = 2, -- 迷你币
    MiniPoint = 3 -- 迷你点
}
---@enum MiniShopData
---皮肤数据类型
MiniShopData = {
    Avt = 2, -- 所有AVT
    Mount = 3, -- 所有坐骑
    Skin = 1 -- 皮肤
}
---@enum MiniShopPage
---开发者商店页面类型
MiniShopPage = {
    Convert = 3, -- 兑换
    CustomCoin = 7, -- 打开自定义货币界面
    Item = 1, -- 道具购买
    MiniVip = 5, -- 大会员
    Skin = 2, -- 皮肤
    WareHouse = 6, -- 打开仓库
    Welfare = 4 -- 福利
}
---@enum MobType
---生物类型
MobType = {
    Fly = 8, -- 飞行生物
    Hostile = 0, -- 怪物
    Passive = 1, -- 动物
    Rare = 2, -- 稀有动物
    Trixenie = 11, -- 三栖生物
    Water = 3 -- 水生物
}
---@enum MoveType
---移动方式
MoveType = {
    Auto = 128, -- 自动调整
    Flying = 1, -- 飞行
    Swimming = 2, -- 游泳
    Walking = 0 -- 行走
}
---@enum ObjType
---对象类型
ObjType = {
    Actor = 0,
    Area = 14, -- 区域
    BiomeEdit = 9,
    Block = 5, -- 方块
    BlockMaterial = 12,
    Crafting = 11,
    DropItem = 17, -- 掉落物
    Empty = 4,
    Entity = 0, -- 实体
    Furnace = 13,
    Item = 7,
    Mob = 1, -- 生物
    Player = 2, -- 玩家
    Pos = 16, -- 位置
    Projectile = 15, -- 投掷物对象
    Status = 8,
    StatusEffect = 1001,
    StatusEffectInst = 1002,
    UI = 6, -- UI编辑界面
    World = 3 -- 世界
}
---@enum PickupActionType
---举起动作类型
PickupActionType = {
    Drop = 2, -- 放下
    Pickup = 1, -- 拾取
    Throw = 3, -- 投掷
    Unbind = 4 -- 解绑
}
---@enum PixelUnits
---像素单位
PixelUnits = {
    Percentage = 1, -- 百分比
    Value = 2 -- 绝对值
}
---@enum PlayerBodyUIHight
---获取玩家内部控件高度
PlayerBodyUIHight = {
    EffEct = 3, -- 头部动效
    HpBar = 4, -- 血条
    Nick = 1, -- 昵称
    Title = 2 -- 称号
}
---@enum PlayerMotion
---玩家行为枚举
PlayerMotion = {
    Down = 1000002,
    Fall = 1000003,
    FallGround = 32, -- 落地
    Jump = 4, -- 跳跃
    JumpTwice = 8, -- 二段跳
    Run = 2, -- 奔跑
    Sneak = 16, -- 潜行
    Static = 0, -- 静止
    Swim = 64, -- 游泳
    Turnback = 1000000,
    Up = 1000001,
    Walk = 1 -- 行走
}
---@enum PlayerNameType
---玩家内置UI类型 
PlayerNameType = {
    EffEct = 3, -- 头部特效
    Nick = 1, -- 昵称
    Title = 2 -- 称号
}
---@enum ProgressImg
---进度图案
ProgressImg = {
    Background = 1, -- 进度背景
    Progress = 2 -- 进度值
}
---@enum ProgressVal
---进度值类型 
ProgressVal = {
    CurAndMax = 4, -- 当前值和最大值
    Current = 3, -- 当前值
    Max = 2, -- 最大值
    Min = 1 -- 最小值
}
---@enum RayDetectType
---射线检测返回类型
RayDetectType = {
    Actor = 3, -- 生物
    ActorType = 4, -- 生物类型
    Block = 1, -- 方块类型
    LiquidBlock = 5, -- 液体方块类型
    Player = 2 -- 玩家
}
---@enum RelativeCampType
---相对阵营
RelativeCampType = {
    Any = 999, -- 任意
    Enemy = 2, -- 敌方
    Friendly = 1, -- 友方
    Neutral = 3 -- 任意
}
---@enum RoleAttr
---生物/玩家属性
RoleAttr = {
    Atk = 42, -- 攻击力
    AttackDis = 37, -- 攻击距离
    AttackDis1 = 40,
    CurHp = 2, -- 当前生命值
    CurHunger = 6, -- 饥饿度
    CurOxygen = 8, -- 当前氧气值
    CurStrength = 28, -- 当前体力值
    FlySpeed = 36, -- 飞行速度
    FlySpeed1 = 39,
    Gravity = 15, -- 重力值
    HpRecover = 3, -- 生命恢复
    JumpPower = 14, -- 跳跃力
    LevelExp = 22, -- 星星经验
    LevelExp1 = 46,
    MaxHp = 1, -- 最大生命值
    MaxHunger = 5, -- 饥饿度
    MaxOxygen = 7, -- 最大氧气值
    MaxStrength = 29, -- 当前最大体力值
    PunchArmor = 19, -- 近战防御
    PunchArmor1 = 43,
    RangeArmor = 20, -- 远程防御
    RangeArmor1 = 44,
    RunSpeed = 11, -- 奔跑速度
    StarNum = 23, -- 星星数量
    StarNum1 = 45,
    SwinSpeed = 13, -- 游泳速度
    ViewDis = 38, -- 视野距离
    ViewDis1 = 41,
    WalkSpeed = 10 -- 移动速度
}
---@enum RoleMotion
---角色行为枚举
RoleMotion = {
    FallGround = 32, -- 落地
    Jump = 4, -- 跳跃
    Run = 2, -- 奔跑
    Sneak = 16, -- 潜行
    Stand = 0, -- 站立
    Swim = 64, -- 游泳
    Walk = 1 -- 行走
}
---@enum SkyboxAttr
---天空盒参数
SkyboxAttr = {
    AmbientLightIntensity = 14,
    CloudDensity = 5, -- 云的密度
    CloudHigh = 6, -- 云的高度
    CloudSpeed = 4, -- 云的运动速度
    DirectionalLightIntensity = 13,
    FogreMaxDis = 8, -- 雾的最远距离
    FogreMinDis = 7, -- 雾的最近距离
    MoonScale = 2, -- 月亮大小
    StarDensity = 3, -- 星星密度
    SunScale = 1, -- 太阳大小
    Template = 9, -- 模板
    WaterMirrorness = 11,
    WaterTransparency = 10,
    WindStrength = 12
}
---@enum SkyboxColor
---天空盒颜色
SkyboxColor = {
    AmbientLight = 12,
    Bottom = 3, -- 天空底部颜色
    Cloud = 8, -- 云颜色
    DirectionalLight = 11,
    Env = 5, -- 环境光颜色
    Fog = 9, -- 雾颜色
    Light = 4, -- 天空光照颜色
    Middle = 2, -- 天空腰部颜色
    Moon = 7, -- 月亮颜色
    Sun = 6, -- 太阳颜色
    Top = 1, -- 天空顶部颜色
    Water = 10
}
---@enum SkyboxFilter
---天空盒滤镜参数
SkyboxFilter = {
    Bloomthreshold = 15,
    Color = 8, -- 滤镜颜色
    Contrast = 1, -- 对比度
    Dof = 7, -- 景深强度-暂时没用到
    Exposure = 4, -- 曝光强度
    Flood = 3, -- 泛光强度
    Ftmblackclip = 14,
    Ftmshoulder = 13,
    Ftmslope = 11,
    Ftmtoe = 12,
    Gamma = 6, -- 伽马强度
    Lut = 9, -- 色彩校正
    Saturation = 2, -- 饱和度
    Template = 10, -- 滤镜模板
    Volumelight = 5 -- 体积光强度
}
---@enum SkyboxMap
---天空盒贴图
SkyboxMap = {
    Moon = 3, -- 月亮贴图
    Sky = 1, -- 天空贴图
    Sun = 2 -- 太阳贴图
}
---@enum SkyboxParticle
---天空盒环境粒子参数
SkyboxParticle = {
    Randomness = 4, -- 运动不规则度
    Range = 2, -- 范围
    Speed = 3, -- 速度
    Strength = 1 -- 强度
}
---@enum SkyboxSwitch
---天空盒开关
SkyboxSwitch = {
    Fogenable = 1 -- 雾开关
}
---@enum SkyboxTime
---天空盒时间 
SkyboxTime = {
    Current = -1, -- 当前时间
    Time0 = 0, -- 天空盒0点
    Time4 = 4, -- 天空盒4点
    Time6 = 6, -- 天空盒6点
    Time8 = 8, -- 天空盒8点
    Time12 = 12, -- 天空盒12点
    Time16 = 16, -- 天空盒16点
    Time18 = 18, -- 天空盒18点
    Time20 = 20, -- 天空盒20点
    TimeAll = 99 -- 所有时间段
}
---@enum SortType
---排序方式
SortType = {
    Down = 1, -- 降序
    Up = 0 -- 升序
}
---@enum TeamAttr
---队伍属性枚举 
TeamAttr = {
    PlayerNum = 1, -- 玩家数量
    Score = 2 -- 分数
}
---@enum TeamResults
---游戏战斗结果
TeamResults = {
    Dogfall = 3, -- 平局
    Lose = 2, -- 失败
    None = 0, -- 胜负未定
    Win = 1 -- 胜利
}
---@enum TerrainType
---游戏地形
TerrainType = {
    Flat = 0, -- 平坦地形
    Normal = 1 -- 随机地形
}
---@enum TurnFaceDir
---角度朝向
TurnFaceDir = {
    Pitch = 2, -- 垂直朝向
    Yaw = 1 -- 水平朝向
}
---@enum UIScollDir
---UI滑动方向
UIScollDir = {
    Both = 2, -- 自由滑动
    Horizontal = 0, -- 水平滑动
    Vertical = 1 -- 垂直滑动
}
---@enum VDistanceRange
---视野距离
VDistanceRange = {
    Far = 8, -- 远
    Farthest = 16, -- 最远
    Further = 10, -- 更远
    Middle = 4, -- 中
    Near = 2 -- 近
}
---@enum VarType
---变量类型
VarType = {
    AreaGroup = 16, -- 区域组
    Areains = 2, -- 区域
    BlockType = 8, -- 方块类型
    BlockTypeGroup = 20, -- 方块类型组
    Blueprint = 29, -- 蓝图
    Boolean = 5, -- 布尔值
    BooleanGroup = 19, -- 布尔值组
    BuffType = 43, -- buff类型
    BuffTypeGroup = 44, -- buff类型组
    Creature = 10, -- 生物
    CreatureGroup = 12, -- 生物组
    CreatureType = 11, -- 生物类型
    CreatureTypeGroup = 22, -- 生物类型组
    DropItem = 35, -- 掉落物
    DropItemGroup = 36, -- 掉落物组
    EffectType = 14, -- 特效类型
    EffectTypeGroup = 24, -- 特效类型组
    Element = 37, -- 元件
    ElementGroup = 38, -- 元件组
    Entity = 49, -- 实体
    EntityGroup = 50, -- 实体组
    EntityType = 51, -- 实体类型
    EntityTypeGroup = 52, -- 实体类型组
    ItemType = 9, -- 道具类型
    ItemTypeGroup = 21, -- 道具类型组
    ListData = 26, -- 无序列表
    Map = 27, -- kv map表
    Model = 47, -- 模型
    ModelGroup = 48, -- 模型组
    Number = 3, -- 数值
    NumberGroup = 17, -- 数值组
    Object = 30, -- 对象
    ObjectGroup = 32, -- 对象组
    Player = 6, -- 玩家
    PlayerGroup = 7, -- 玩家组
    Pos = 1, -- 位置
    PosGroup = 15, -- 位置组
    Projectile = 33, -- 投射物
    ProjectileGroup = 34, -- 投射物组
    Role = 41, -- 角色
    RoleGroup = 42, -- 角色组
    SortedData = 25, -- 有序列表
    Sound = 45, -- 声音
    SoundGroup = 46, -- 声音组
    String = 4, -- 字符串
    StringGroup = 18, -- 字符串组
    Table = 28, -- 二维表
    Texture = 39, -- 纹理
    TextureGroup = 40, -- 纹理组
    Timer = 13, -- 定时器
    TimerGroup = 23 -- 计时器组
}
---@enum VerticalOffset
---垂直偏移
VerticalOffset = {
    Bottom = 3, -- 居下
    Centered = 2, -- 居中
    Top = 1 -- 居上
}
---@enum ViedoPlayMode
---显示板视频播放模式
ViedoPlayMode = {
    Once = 2, -- 单次播放
    Repeat = 1 -- 循环播放
}
---@enum ViewPortType
---视口方向
ViewPortType = {
    Back = 1, -- 背视角
    Back2 = 3, -- 背视角2
    Custom = 5, -- 自定义视角
    Front = 2, -- 正视角
    Main = 0, -- 主视角
    Top = 4 -- 俯视角
}
---@enum WeatherGroup
---地形组枚举值 
WeatherGroup = {
    AirIsland = 9, -- 空岛组
    Coldzone = 5, -- 高峰寒带组
    Common = 1, -- 常见组
    Desert = 3, -- 	沙漠组
    Frigidzone = 4, -- 普通寒带组
    Global = 0, -- 全局对象
    Nunja = 7, -- 湿地组
    Ocean = 2, -- 海洋组
    Plain = 8, -- 平坦组
    Volcano = 6 -- 火山组
}
---@enum WeatherType
---天气类型
WeatherType = {
    Custom = 7, -- 自定义
    None = 0, -- 无天气
    Rain = 2, -- 雨天
    Sandstorm = 3, -- 沙尘暴
    Snow = 4, -- 雪天
    Sunshine = 1, -- 晴天
    UnderWater = 5, -- 暴雨
    VoidNight = 8,
    Volcano = 6, -- 火山
    WEATHRT_NONE = 0,
    ZOMBIE_WAVE = 9,
    ZombieWave = 9
}
---@enum WorkeStage
---强制打开工作台枚举
WorkeStage = {
    Craft = 800, -- 工具箱
    Enchant = 833, -- 附魔台
    Repair = 824 -- 修理台
}
---@enum WorldType
---游戏模式
WorldType = {
    Create = 1, -- 多人创造模式
    CreateToRungame = 3, -- 由创造模式转的生存
    Extremity = 2, -- 极限模式
    Freemode = 6, -- 冒险模式之自由模式
    Gamemaker = 4, -- 自制玩法的编辑模式
    GamemakerRun = 5, -- 自制玩法的运行模式
    Record = 9, -- 录像模式
    Single = 0 -- 单人模式
}

--#region hiddenenum

---@enum ABSOLUTECAMPTYPE
---绝对阵营
---@see AbsoluteCampType
ABSOLUTECAMPTYPE = {
    ANY = 999, -- 任意队伍
    ENEMY = 201, -- 中立敌对
    NOTEAM = 0, -- 无队伍
    PASSIVE = 202, -- 中立被动
    TEAM_1 = 1, -- 队伍1
    TEAM_2 = 2, -- 队伍2
    TEAM_3 = 3, -- 队伍3
    TEAM_4 = 4, -- 队伍4
    TEAM_5 = 5, -- 队伍5
    TEAM_6 = 6, -- 队伍6
    TEAM_NPC1 = 101, -- 绝对阵营-npc队伍1
    TEAM_NPC2 = 102, -- 绝对阵营-npc队伍2
    TEAM_NPC3 = 103 -- 绝对阵营-npc队伍3
}
---@enum ActorBodyEffect
ActorBodyEffect = {
    Accumfire = 3,
    AiAngry = 27,
    AiHungry = 36,
    AiNeedreeds = 10,
    AiSleep = 28,
    BallCharge = 37,
    BallShoot = 38,
    Conceal = 31,
    Dance = 21,
    DeadProtect = 14,
    Disappear = 19,
    Dizzy = 33,
    DragonDie0 = 15,
    DragonDie1 = 16,
    DragonDie2 = 17,
    Dragonfire = 4,
    Dragonsummon = 5,
    EnchFall = 39,
    Fear = 11,
    Fire = 1,
    Forbidden = 30,
    Headshot = 24,
    HorseBenteng = 20,
    HorseFly = 18,
    Hurt = 0,
    Interaction = 23,
    Jetpack2 = 22,
    MakeTrouble = 34,
    Milking = 26,
    Normalshot = 25,
    Portal = 2,
    RoleCollect = 12,
    RoleJump = 13,
    TameFailed = 7,
    TameFood = 8,
    TameNofood = 9,
    TameSucceed = 6,
    TrainMove = 35,
    Transport = 29,
    WeaponFire = 32
}
---@enum AliveState
AliveState = {
    Alive = 1, -- 存活
    All = -1, -- 全体玩家
    Dead = 0 -- 阵亡
}
---@enum AreaSimilarity
AreaSimilarity = {
    Cmpblock = 1,
    Ignblock = 0
}
---@enum BACKPACK_TYPE
BACKPACK_TYPE = {
    EQUIP = 3,
    EXTEND = 4,
    INVENTORY = 2,
    SHORTCUT = 1
}
---@enum BlockId
BlockId = {
    Air = 0
}
---@enum BtreeRangeType
BtreeRangeType = {
    Around = 1,
    Behind = 3,
    Front = 2
}
---@enum CREATUREATTR
CREATUREATTR = {
    ATK_MAGIC = 29,
    ATK_MELEE = 17,
    ATK_PHYSICAL = 28,
    ATK_REMOTE = 18,
    BODY_LERP_SPEED = 27,
    CUR_GRAVITY = 34,
    CUR_HP = 2,
    CUR_HUNGER = 6,
    CUR_OXYGEN = 8,
    DEF_CHAOS = 24,
    DEF_MAGIC = 31,
    DEF_MELEE = 19,
    DEF_PHYSICAL = 30,
    DEF_REMOTE = 20,
    DIMENSION = 21,
    DODGE = 16,
    ENABLE_ATTACK = 32,
    ENABLE_BEATTACKED = 64,
    ENABLE_BEKILLED = 128,
    ENABLE_DEATHDROPITEM = 512,
    ENABLE_MOVE = 1,
    ENABLE_PICKUP = 256,
    EXTRA_HP = 32,
    HP_RECOVER = 3,
    JUMP_POWER = 14,
    LEVEL = 23,
    MAX_HP = 1,
    MAX_HUNGER = 5,
    MAX_OXYGEN = 7,
    PACK_SIZE = 25,
    RECOVER_OXYGEN = 9,
    RUN_SPEED = 11,
    SWIN_SPEED = 13,
    TOUGHNESS = 33,
    VIEW_DISTANCE = 26,
    WALK_SPEED = 10,
    WEIGHT = 15
}
---@enum ComponentUIPermissions
ComponentUIPermissions = {
    Hide = 0,
    OfficialShow = 2,
    Show = 1
}
---@enum ComponentUIStyle
ComponentUIStyle = {
    AIModelArray = "AIModelArray",
    AIModelItem = "AIModelItem",
    ActionArray = "ActionArray",
    ActionButton = "ActionButton",
    ActionItem = "ActionItem",
    AnchorMeshGroup = "AnchorMeshGroup",
    AnchorMeshGroupItem = "AnchorMeshGroupItem",
    ArrayAI = "ArrayAI",
    ArrayBiomeMonster = "ArrayBiomeMonster",
    ArrayBlockMaterial = "ArrayBlockMaterial",
    ArrayBuff = "ArrayBuff",
    ArrayBurstItem = "ArrayBurstItem",
    ArrayCommonItem = "ArrayCommonItem",
    ArrayDropItem = "ArrayDropItem",
    ArrayFeedItem = "ArrayFeedItem",
    ArrayForItems = "ArrayForItems",
    ArrayForTags = "ArrayForTags",
    ArrayImportAnimation = "ArrayImportAnimation",
    ArrayItem = "ArrayItem",
    ArrayMonsterItem = "ArrayMonsterItem",
    ArrayParticleBrusts = "ArrayParticleBrusts",
    ArraySkill = "ArraySkill",
    ArrayStatus = "ArrayStatus",
    ArrayStatusEffect = "ArrayStatusEffect",
    ArrayStatusEffectInst = "ArrayStatusEffectInst",
    BlockModel = "BlockModel",
    BlockTemp = "BlockTemp",
    Bullet = "Bullet",
    ColorGradient = "ColorGradient",
    CommonItem = "CommonItem",
    CustomCommonItem = "CustomCommonItem",
    CustomDropItem = "CustomDropItem",
    CustomFeedItem = "CustomFeedItem",
    CustomItemAI = "CustomItemAI",
    CustomItemStatus = "CustomItemStatus",
    CustomItemStatusEffect = "CustomItemStatusEffect",
    CustomItemUseEdit = "CustomItemUseEdit",
    CustomMaterial = "CustomMaterial",
    CustomSkillItem = "CustomSkillItem",
    DropItem = "DropItem",
    EffectMaterial = "EffectMaterial",
    EnumController = "EnumController",
    EnumControllerHideValue = "EnumControllerHideValue",
    EnumDrapdown = "EnumDrapdown",
    EnumList = "EnumList",
    FilterPicture = "FilterPicture",
    Icon = "Icon",
    ItemEquip = "ItemEquip",
    ItemModel = "ItemModel",
    Jump = "Jump",
    MaterialGroup = "MaterialGroup",
    MaterialGroupItem = "MaterialGroupItem",
    MaterialGroupItemNew = "MaterialGroupItemNew",
    ModelAttrArray = "ModelAttrArray",
    Number = "Number",
    NumberButton = "NumberButton",
    NumberOnlyInput = "NumberOnlyInput",
    NumberOnlyRandom = "NumberOnlyRandom",
    NumberSlider = "NumberSlider",
    OnlyCustomPicture = "OnlyCustomPicture",
    ParticleModuleItem = "ParticleModuleItem",
    PathPoint = "PathPoint",
    Paths = "Paths",
    PreViewButton = "PreViewButton",
    Projectile = "Projectile",
    SinglePicture = "SinglePicture",
    SkyPicture = "SkyPicture",
    Switch = "Switch",
    Tag = "Tag",
    Title = "Title",
    TitleParticleEdit = "TitleParticleEdit",
    Vector3AnchorPoint = "Vector3AnchorPoint",
    Vector3Input = "Vector3Input",
    Vector3Selector = "Vector3Selector"
}
---@enum ExplodeDmgType
ExplodeDmgType = {
    Chaos = 3,
    Electric = 4,
    Fire = 1,
    Ice = 5,
    Physical = 0,
    Poison = 2,
    Void = 6
}
---@enum FurnaceType
FurnaceType = {
    Copper = 799,
    Iron = 798,
    Stone = 802
}
---@enum GRAPHICS
GRAPHICS = {
    GRAPHICS_ARROW_ACTOR = 5,
    GRAPHICS_ARROW_POS = 4,
    GRAPHICS_HORNBOOK = 1,
    GRAPHICS_IMAGE = 10,
    GRAPHICS_LINE_ACTOR = 7,
    GRAPHICS_LINE_POS = 6,
    GRAPHICS_NAVPATH_POS = 11,
    GRAPHICS_PROGRESS = 3,
    GRAPHICS_SURFACE_ACTOR = 9,
    GRAPHICS_SURFACE_POS = 8,
    GRAPHICS_SUSPENDBOOK = 2
}
---@enum GSoundType
GSoundType = {
    Destroy = 1,
    Dig = 0,
    FallGround = 3,
    Place = 2,
    Walk = 4
}
---@enum GameActorType
GameActorType = {
    ACTORTYPE_AQUATICMONSTER = 43,
    ACTORTYPE_ARROW = 9,
    ACTORTYPE_BLOCK_LASER = 39,
    ACTORTYPE_BOAT = 21,
    ACTORTYPE_BOOKEDITORTABLE = 53,
    ACTORTYPE_BOSS = 31,
    ACTORTYPE_BUILDBLUEPRINT = 45,
    ACTORTYPE_COBBLE = 27,
    ACTORTYPE_COLLIDER = 48,
    ACTORTYPE_CRAB = 102,
    ACTORTYPE_CREATURE = 4,
    ACTORTYPE_DESERTBUSINESSMAN = 90,
    ACTORTYPE_DESERTBUSINESSMANGUARD = 91,
    ACTORTYPE_DESERTVILLAGER = 92,
    ACTORTYPE_DRAGON = 41,
    ACTORTYPE_DROPITEM = 2,
    ACTORTYPE_EFFECT = 25,
    ACTORTYPE_EMITTER = 23,
    ACTORTYPE_ENDEREYE = 17,
    ACTORTYPE_FALLSAND = 11,
    ACTORTYPE_FIREBALL = 32,
    ACTORTYPE_FIREWORK = 20,
    ACTORTYPE_FISHERMAN = 98,
    ACTORTYPE_FISHINGVILLAGER = 97,
    ACTORTYPE_FLYBLOCK = 12,
    ACTORTYPE_FLYMONSTER = 42,
    ACTORTYPE_FLYSNAKEGOD = 69,
    ACTORTYPE_FUNNEL = 22,
    ACTORTYPE_GAMEOBJECT = 9999,
    ACTORTYPE_GAMEOBJECT_AREA = 10000,
    ACTORTYPE_GIANT = 40,
    ACTORTYPE_HIPPOCAMPUS = 103,
    ACTORTYPE_HIPPOCAMPUS_HORSE = 105,
    ACTORTYPE_HOOK = 47,
    ACTORTYPE_HORSE = 24,
    ACTORTYPE_INTERPRETERUNIT = 38,
    ACTORTYPE_ITEMEXPO = 26,
    ACTORTYPE_LASER = 46,
    ACTORTYPE_MECHA_DRIVER = 30,
    ACTORTYPE_MECHA_UNIT = 29,
    ACTORTYPE_MOBSPAWNER = 18,
    ACTORTYPE_MODELCRAFT = 50,
    ACTORTYPE_MONSTER = 0,
    ACTORTYPE_NPC = 3,
    ACTORTYPE_OTHERPROJECTILE = 28,
    ACTORTYPE_PACKHORSE = 93,
    ACTORTYPE_PIRATE_SHIP = 106,
    ACTORTYPE_PISTON = 15,
    ACTORTYPE_RADIOUNIT = 37,
    ACTORTYPE_RAILKNOT = 34,
    ACTORTYPE_REGIONREPLICATOR = 44,
    ACTORTYPE_ROCKET = 36,
    ACTORTYPE_ROLE = 5,
    ACTORTYPE_SANDMAN = 94,
    ACTORTYPE_SANDWORM = 89,
    ACTORTYPE_SEASPIRITGUARDING = 96,
    ACTORTYPE_SENSOR = 33,
    ACTORTYPE_SIGNS = 19,
    ACTORTYPE_SMALL_HIPPOCAMPUS = 104,
    ACTORTYPE_STRING = 14,
    ACTORTYPE_THROWABLE = 16,
    ACTORTYPE_THROWBLOCK = 35,
    ACTORTYPE_TNT = 10,
    ACTORTYPE_TRANSFER = 52,
    ACTORTYPE_TRIXENIE = 85,
    ACTORTYPE_VACANTBOSS = 66,
    ACTORTYPE_VALUE = 13,
    ACTORTYPE_VEHICLE = 49,
    ACTORTYPE_VILLAGER = 62,
    ACTORTYPE_WHEEL = 54,
    ACTORTYPE_WORKSHOP = 51
}
---@enum GamemakerRule
GamemakerRule = {
    AllowMidwayJoin = 38,
    AttackPlayer = 13,
    Behurt = 46,
    BgMusicMode = 25,
    BlockDestroy = 5,
    BlockPlace = 6,
    BlockUse = 7,
    Camera = 9,
    Countdown = 42,
    Curtime = 1,
    DisplayName = 21,
    DisplayScore = 30,
    EndScore = 15,
    EndTime = 14,
    EndtimeWinlose = 22,
    GpoisonSafed0 = 36,
    GpoisonSafet0 = 37,
    GpoisonSwitch = 35,
    GravityFactor = 8,
    HurtInterval = 45,
    KillNotify = 24,
    LifeNum = 31,
    LifenumTeamShare = 39,
    MaxPlayers = 4,
    MiniMapTeams = 28,
    MobGen = 26,
    PlayerDieDrops = 29,
    ResetScore = 44,
    ReviveInvulnerable = 20,
    ReviveMode = 19,
    RoleShadow = 52,
    SaveMode = 23,
    ScoreCollectStar = 18,
    ScoreColorChange = 33,
    ScoreKillMob = 17,
    ScoreKillPlayer = 16,
    ScoreResetRound = 43,
    SetViewMode = 40,
    SetViewType = 41,
    ShowSight = 32,
    SpawnPtMode = 27,
    StartMode = 10,
    StartPlayers = 11,
    TeamNum = 12,
    Timelocked = 2,
    Weather = 3
}
---@enum HURTTYPE
HURTTYPE = {
    ANTIINJURY = 15,
    ANVIL = 10,
    ASPHYXIA = 12,
    BOMB = 2,
    BURNING = 3,
    CACTUS = 11,
    DROWN = 13,
    FALL = 9,
    FIXED = 17,
    FLASH = 6,
    ICE = 7,
    LASER = 16,
    MAGIC = 8,
    MELEE = 0,
    PHYSICS = 3,
    REMOTE = 1,
    SUFFOCATE = 14,
    SUN = 8,
    TOXIN = 4,
    WITHER = 5
}
---@enum ITEMATTR
ITEMATTR = {
    ATTACK = 1,
    DURATION = 9,
    EXPLODEDEFENSE = 5,
    FIREDEFENSE = 6,
    FIREINTERVAL = 10,
    ITEMTYPE = 13,
    LONGDEFENSE = 4,
    MAGAZINES = 11,
    POISONDEFENSE = 7,
    QUALITY = 12,
    SHORTDEFENSE = 3,
    STACKMAX = 2,
    WITHERDEFENSE = 8
}
---@enum ItemEffectType
ItemEffectType = {
    After_Charge = 5,
    Auto_Charge = 6,
    Food = 1,
    Inter_Charge = 4,
    Max = 7,
    No_Charge = 3,
    Projectile = 2,
    Use = 0
}
---@enum LinearTransformation
LinearTransformation = {
    BackIn = 25,
    BackInOut = 27,
    BackOut = 26,
    BounceIn = 28,
    BounceInOut = 30,
    BounceOut = 29,
    CircIn = 19,
    CircInOut = 21,
    CircOut = 20,
    CubicIn = 7,
    CubicInOut = 9,
    CubicOut = 8,
    Custom = 31,
    ElasticIn = 22,
    ElasticInOut = 24,
    ElasticOut = 23,
    ExpoIn = 16,
    ExpoInOut = 18,
    ExpoOut = 17,
    Linear = 0,
    None = -1,
    QuadIn = 4,
    QuadInOut = 6,
    QuadOut = 5,
    QuartIn = 10,
    QuartInOut = 12,
    QuartOut = 11,
    QuintIn = 13,
    QuintInOut = 15,
    QuintOut = 14,
    SineIn = 1,
    SineInOut = 3,
    SineOut = 2
}
---@enum MODATTRIB_TYPE
MODATTRIB_TYPE = {
    MAX_MOB_MODATTR = 29,
    MAX_MOD_ATTRIB = 36,
    MAX_PLAYER_MODATTR = 36,
    MOBATTR_ATTACK_GUN = 35,
    MOBATTR_DAMAGED_ZOMBIE = 34,
    MODATTR_ACTOR_SCALE = 28,
    MODATTR_ARMOR_EXPLODE = 22,
    MODATTR_ARMOR_PUNCH = 20,
    MODATTR_ARMOR_RANGE = 21,
    MODATTR_ATTACK_ANIMAL = 11,
    MODATTR_ATTACK_EXPLODE = 5,
    MODATTR_ATTACK_FIRE = 6,
    MODATTR_ATTACK_ICE = 12,
    MODATTR_ATTACK_PLAYER = 9,
    MODATTR_ATTACK_POISON = 7,
    MODATTR_ATTACK_PUNCH = 3,
    MODATTR_ATTACK_RANGE = 4,
    MODATTR_ATTACK_UNDEAD = 10,
    MODATTR_ATTACK_WITHER = 8,
    MODATTR_CRITICAL_HIT = 24,
    MODATTR_DAMAGED_EXPLODE = 15,
    MODATTR_DAMAGED_FALLING = 19,
    MODATTR_DAMAGED_FIRE = 16,
    MODATTR_DAMAGED_POISON = 17,
    MODATTR_DAMAGED_PUNCH = 13,
    MODATTR_DAMAGED_RANGE = 14,
    MODATTR_DAMAGED_WITHER = 18,
    MODATTR_DAMAGE_ABSORB = 23,
    MODATTR_DIG_SPEED = 29,
    MODATTR_JUMP_SPEED = 2,
    MODATTR_KNOCK = 25,
    MODATTR_KNOCK_RESIST = 26,
    MODATTR_KNOCK_RESIST_PROB = 27,
    MODATTR_LUCK_DIG = 30,
    MODATTR_LUCK_KILLMOB = 31,
    MODATTR_MOVE_SPEED = 0,
    MODATTR_OXYGEN_SUPPLY = 33,
    MODATTR_SWIM_SPEED = 1,
    MODATTR_VIEW_BRIGHT = 32
}
---@enum MapMarkType
MapMarkType = {
    Circle = 2,
    Line = 0,
    Rect = 1
}
---@enum MatchMode
MatchMode = {
    All = 1,
    Any = 2
}
---@enum ModAttribType
ModAttribType = {
    ActorScale = 28,
    ArmorExplode = 22,
    ArmorPunch = 20,
    ArmorRange = 21,
    AttackAnimal = 11,
    AttackExplode = 5,
    AttackFire = 6,
    AttackGun = 35,
    AttackIce = 12,
    AttackPlayer = 9,
    AttackPoison = 7,
    AttackPunch = 3,
    AttackRange = 4,
    AttackUndead = 10,
    AttackWither = 8,
    CriticalHit = 24,
    DamageAbsorb = 23,
    DamagedExplode = 15,
    DamagedFalling = 19,
    DamagedFire = 16,
    DamagedPoison = 17,
    DamagedPunch = 13,
    DamagedRange = 14,
    DamagedWither = 18,
    DamagedZombie = 34,
    DigSpeed = 29,
    JumpSpeed = 2,
    Knock = 25,
    KnockResist = 26,
    KnockResistProb = 27,
    LuckDig = 30,
    LuckKillmob = 31,
    MoveSpeed = 0,
    OxygenSupply = 33,
    SwimSpeed = 1,
    ViewBright = 32,
    maxAttrib = 36
}
---@enum PLAYERATTR
PLAYERATTR = {
    ATK_FIREARM = 38,
    ATK_MAGIC = 32,
    ATK_MELEE = 17,
    ATK_PHYSICAL = 31,
    ATK_REMOTE = 18,
    CUR_ARMOR = 35,
    CUR_GRAVITY = 39,
    CUR_HP = 2,
    CUR_HUNGER = 6,
    CUR_LEVEL = 27,
    CUR_LEVELEXP = 26,
    CUR_OXYGEN = 8,
    CUR_STRENGTH = 28,
    DAMAGED_ZOMBIE = 37,
    DEF_CHAOS = 24,
    DEF_MAGIC = 34,
    DEF_MELEE = 19,
    DEF_PHYSICAL = 33,
    DEF_REMOTE = 20,
    DIMENSION = 21,
    DODGE = 16,
    ENABLE_ATTACK = 32,
    ENABLE_BEATTACKED = 64,
    ENABLE_BEKILLED = 128,
    ENABLE_DEATHDROPITEM = 512,
    ENABLE_DESTROYBLOCK = 8,
    ENABLE_DISCARDITEM = 2048,
    ENABLE_FORBIDDODGEANIM = 4194304,
    ENABLE_FORBIFIRE = 2097152,
    ENABLE_MOVE = 1,
    ENABLE_OPERATEBLOCK = 4,
    ENABLE_PICKUP = 256,
    ENABLE_PLACEBLOCK = 2,
    ENABLE_ROTATINGCAMERA = 5,
    ENABLE_SWITCHSHORTCUT = 3,
    ENABLE_USEITEM = 16,
    ENABLE_VEHICLEAUTOFORWARD = 1024,
    HP_RECOVER = 3,
    ITEM_DISABLE_DROP = 2,
    ITEM_DISABLE_THROW = 1,
    JUMP_POWER = 14,
    LEVEL = 23,
    LIFE_NUM = 4,
    MAX_ARMOR = 36,
    MAX_HP = 1,
    MAX_HUNGER = 5,
    MAX_OXYGEN = 7,
    MAX_STRENGTH = 29,
    PACK_SIZE = 25,
    RECOVER_OXYGEN = 9,
    RUN_SPEED = 11,
    SCORE = 22,
    SNEAK_SPEED = 12,
    STRENGTH_RECOVER = 30,
    SWIN_SPEED = 13,
    WALK_SPEED = 10,
    WEIGHT = 15
}
---@enum PlayerAttr
PlayerAttr = {
    AtkFirearm = 38,
    AtkMagic = 32,
    AtkMelee = 17,
    AtkPhysical = 31,
    AtkRemote = 18,
    AttackDis = 41,
    CurArmor = 35,
    CurHp = 2,
    CurHunger = 6,
    CurLevel = 27,
    CurLevelexp = 26,
    CurOxygen = 8,
    CurStrength = 28,
    DamagedZombie = 37,
    DefChaos = 24,
    DefMagic = 34,
    DefMelee = 19,
    DefPhysical = 33,
    DefRemote = 20,
    Dimension = 21,
    Dodge = 16,
    EnableAttack = 32,
    EnableBeAttacked = 64,
    EnableBeKilled = 128,
    EnableDeathDropItem = 512,
    EnableDestroyBlock = 8,
    EnableDiscardItem = 2048,
    EnableForbiFire = 2097152,
    EnableForbidDodgeAnim = 4194304,
    EnableMove = 1,
    EnableOperateBlock = 4,
    EnablePickup = 256,
    EnablePlaceBlock = 2,
    EnableUseItem = 16,
    EnableVehicleAutoForward = 1024,
    FlySpeed = 39,
    HpRecover = 3,
    ItemDisableDrop = 2,
    ItemDisableThrow = 1,
    JumpPower = 14,
    Level = 23,
    LifeNum = 4,
    MaxArmor = 36,
    MaxHp = 1,
    MaxHunger = 5,
    MaxOxygen = 7,
    MaxStrength = 29,
    PackSize = 25,
    RecoverOxygen = 9,
    RunSpeed = 11,
    Score = 22,
    SneakSpeed = 12,
    StrengthRecover = 30,
    SwinSpeed = 13,
    ViewDis = 40,
    WalkSpeed = 10,
    Weight = 15
}
---@enum PlayerRelations
PlayerRelations = {
    CollectMaps = 2,
    EvaluateMaps = 3,
    InviteFriend = 4
}
---@enum SkyboxAttrNoTime
SkyboxAttrNoTime = {
    Metallic = 1,
    Roughness = 2
}
---@enum SkyboxFilterSwitch
SkyboxFilterSwitch = {
    Dofenable = 1
}
---@enum StorageType
StorageType = {
    box = 801,
    boxcol = 1181,
    boxrow = 1180
}
---@enum TaskAnimType
TaskAnimType = {
    Click = 1,
    LongPress = 2,
    MoveLeft = 4,
    MoveRight = 5,
    MoveUp = 3
}
---@enum TaskChainType
TaskChainType = {
    AllMap = 2,
    GuideSinglePlayer = 1,
    PlayerTask = 3
}
---@enum TaskDialogType
TaskDialogType = {
    Base = 1,
    CustomUI = 2
}
---@enum TaskEvent
TaskEvent = {
    ClickRideCallBtn = "ClickRideCallBtn"
}
---@enum TaskPassType
TaskPassType = {
    AllTask = 1,
    NextTask = 2,
    None = 3
}
---@enum TaskType
TaskType = {
    Dialog = 1,
    Task = 2
}
---@enum TaskUIType
TaskUIType = {
    CustomUI = 1,
    GameUI = 3,
    OldUI = 2
}
---@enum VIEWPORTTYPE
VIEWPORTTYPE = {
    BACK2VIEW = 3,
    BACKVIEW = 1,
    CUSTOMVIEW = 5,
    FRONTVIEW = 2,
    MAINVIEW = 0,
    TOPVIEW = 4
}
---@enum WorkStage
WorkStage = {
    Craft = 800,
    Enchant = 833,
    Repair = 824
}

DevComponentDebug = false
BackpackStartIndex = 0
EquipStartIndex = 8000
ExtBackpackStartIndex = 58000
ShortcutStartIndex = 1000
ShortcutexStartIndex = 42000
StorageStartIndex = 3000

--#endregion