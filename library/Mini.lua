---@meta

---迷你世界类型系统<br>
---[属性类型说明](https://dev-wiki.mini1.cn/ugc-wiki/introduction/componentattr.html)<br>
---组件属性中使用的类型定义，用于描述组件属性值的类型约束
---@class Mini
Mini = {}

---字符串类型
---@class Mini.String
Mini.String = {}

---序列化
---@param value any
---@return any
function Mini.String.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.String.UnSerialize(value) end

---转换为表
---@return table
function Mini.String:ToTable() end

---获取引用类型
---@return number
function Mini.String.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.String.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.String.CreateDefault() end

---数值类型
---@class Mini.Number
Mini.Number = {}

---序列化
---@param value any
---@return any
function Mini.Number.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Number.UnSerialize(value) end

---转换为表
---@return table
function Mini.Number:ToTable() end

---获取引用类型
---@return number
function Mini.Number.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Number.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Number.CreateDefault() end

---布尔类型
---@class Mini.Bool
Mini.Bool = {}

---序列化
---@param value any
---@return any
function Mini.Bool.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Bool.UnSerialize(value) end

---转换为表
---@return table
function Mini.Bool:ToTable() end

---获取引用类型
---@return number
function Mini.Bool.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Bool.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Bool.CreateDefault() end

---枚举类型
---@class Mini.Enum
Mini.Enum = {}

---序列化
---@param value any
---@return any
function Mini.Enum.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Enum.UnSerialize(value) end

---转换为表
---@return table
function Mini.Enum:ToTable() end

---获取引用类型
---@return number
function Mini.Enum.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Enum.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Enum.CreateDefault() end

---初始化
---@param tab table
function Mini.Enum:Init(tab) end

---判断是否为枚举值
---@param value any
---@return boolean
function Mini.Enum:IsValue(value) end

---获取默认值
---@return any
function Mini.Enum:GetDefault() end

---获取描述
---@param key string
---@return string
function Mini.Enum:GetDes(key) end

---获取排序值
---@param key string
---@return number
function Mini.Enum:GetSort(key) end

---获取定义表
---@return table
function Mini.Enum:GetDef() end

---二维向量
---@class Mini.Vec2
---@field protected x number
---@field protected y number
Mini.Vec2 = {}

---序列化
---@param value any
---@return any
function Mini.Vec2.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Vec2.UnSerialize(value) end

---转换为表
---@return table
function Mini.Vec2:ToTable() end

---获取引用类型
---@return number
function Mini.Vec2.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Vec2.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Vec2.CreateDefault() end

---初始化
---@param x number|table
---@param y? number
function Mini.Vec2:Init(x, y) end

---三维向量
---@class Mini.Vec3
---@field protected x number
---@field protected y number
---@field protected z number
Mini.Vec3 = {}

---序列化
---@param value any
---@return any
function Mini.Vec3.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Vec3.UnSerialize(value) end

---转换为表
---@return table
function Mini.Vec3:ToTable() end

---获取引用类型
---@return number
function Mini.Vec3.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Vec3.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Vec3.CreateDefault() end

---初始化
---@param x number|table
---@param y? number
---@param z? number
function Mini.Vec3:Init(x, y, z) end

---获取长度
---@return number
function Mini.Vec3:Lenght() end

---归一化
---@return nil
function Mini.Vec3:Normalized() end

---线性插值
---@param posOrigin Mini.Vec3
---@param posTarget Mini.Vec3
---@param t number
---@return nil
function Mini.Vec3:lerp(posOrigin, posTarget, t) end

---缩放类型（继承Vec3）
---@class Mini.Scale: Mini.Vec3
Mini.Scale = {}

---序列化
---@param value any
---@return any
function Mini.Scale.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Scale.UnSerialize(value) end

---转换为表
---@return table
function Mini.Scale:ToTable() end

---获取引用类型
---@return number
function Mini.Scale.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Scale.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Scale.CreateDefault() end

---初始化
---@param x number|table
---@param y? number
---@param z? number
function Mini.Scale:Init(x, y, z) end

---获取长度
---@return number
function Mini.Scale:Lenght() end

---归一化
---@return nil
function Mini.Scale:Normalized() end

---线性插值
---@param posOrigin Mini.Vec3
---@param posTarget Mini.Vec3
---@param t number
---@return nil
function Mini.Scale:lerp(posOrigin, posTarget, t) end

---旋转类型（继承Vec3）
---@class Mini.Rotation: Mini.Vec3
Mini.Rotation = {}

---序列化
---@param value any
---@return any
function Mini.Rotation.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Rotation.UnSerialize(value) end

---转换为表
---@return table
function Mini.Rotation:ToTable() end

---获取引用类型
---@return number
function Mini.Rotation.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Rotation.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Rotation.CreateDefault() end

---初始化
---@param x number|table
---@param y? number
---@param z? number
function Mini.Rotation:Init(x, y, z) end

---获取长度
---@return number
function Mini.Rotation:Lenght() end

---归一化
---@return nil
function Mini.Rotation:Normalized() end

---线性插值
---@param posOrigin Mini.Vec3
---@param posTarget Mini.Vec3
---@param t number
---@return nil
function Mini.Rotation:lerp(posOrigin, posTarget, t) end

---颜色类型
---@class Mini.Color
---@field protected r number
---@field protected g number
---@field protected b number
---@field protected a number
Mini.Color = {}

---序列化
---@param value any
---@return any
function Mini.Color.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Color.UnSerialize(value) end

---转换为表
---@return table
function Mini.Color:ToTable() end

---获取引用类型
---@return number
function Mini.Color.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Color.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Color.CreateDefault() end

---初始化
---@param r number|table
---@param g? number
---@param b? number
---@param a? number
function Mini.Color:Init(r, g, b, a) end

---对象ID（游戏对象引用）
---@class Mini.Object
Mini.Object = {}

---序列化
---@param value any
---@return any
function Mini.Object.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Object.UnSerialize(value) end

---转换为表
---@return table
function Mini.Object:ToTable() end

---获取引用类型
---@return number
function Mini.Object.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Object.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Object.CreateDefault() end

---玩家ID（玩家引用）
---@class Mini.Player
Mini.Player = {}

---序列化
---@param value any
---@return any
function Mini.Player.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Player.UnSerialize(value) end

---转换为表
---@return table
function Mini.Player:ToTable() end

---获取引用类型
---@return number
function Mini.Player.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Player.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Player.CreateDefault() end

---生物ID（生物引用）,别名：Mini.Creature
---@class Mini.Mob
Mini.Mob = {}

---序列化
---@param value any
---@return any
function Mini.Mob.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Mob.UnSerialize(value) end

---转换为表
---@return table
function Mini.Mob:ToTable() end

---获取引用类型
---@return number
function Mini.Mob.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Mob.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Mob.CreateDefault() end

---实体ID（实体引用）
---@class Mini.Entity
Mini.Entity = {}

---序列化
---@param value any
---@return any
function Mini.Entity.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Entity.UnSerialize(value) end

---转换为表
---@return table
function Mini.Entity:ToTable() end

---获取引用类型
---@return number
function Mini.Entity.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Entity.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Entity.CreateDefault() end

---掉落物ID（掉落物引用）
---@class Mini.DropItem
Mini.DropItem = {}

---序列化
---@param value any
---@return any
function Mini.DropItem.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.DropItem.UnSerialize(value) end

---转换为表
---@return table
function Mini.DropItem:ToTable() end

---获取引用类型
---@return number
function Mini.DropItem.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.DropItem.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.DropItem.CreateDefault() end

---投掷物ID（投掷物引用）
---@class Mini.ThrowItem
Mini.ThrowItem = {}

---序列化
---@param value any
---@return any
function Mini.ThrowItem.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.ThrowItem.UnSerialize(value) end

---转换为表
---@return table
function Mini.ThrowItem:ToTable() end

---获取引用类型
---@return number
function Mini.ThrowItem.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.ThrowItem.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.ThrowItem.CreateDefault() end

---角色ID（角色引用）
---@class Mini.Role
Mini.Role = {}

---序列化
---@param value any
---@return any
function Mini.Role.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Role.UnSerialize(value) end

---转换为表
---@return table
function Mini.Role:ToTable() end

---获取引用类型
---@return number
function Mini.Role.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Role.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Role.CreateDefault() end

---区域ID（区域引用）
---@class Mini.Area
Mini.Area = {}

---序列化
---@param value any
---@return any
function Mini.Area.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Area.UnSerialize(value) end

---转换为表
---@return table
function Mini.Area:ToTable() end

---获取引用类型
---@return number
function Mini.Area.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Area.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Area.CreateDefault() end

---生物群系类型ID
---@class Mini.BiomeType
Mini.BiomeType = {}

---序列化
---@param value any
---@return any
function Mini.BiomeType.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.BiomeType.UnSerialize(value) end

---转换为表
---@return table
function Mini.BiomeType:ToTable() end

---获取引用类型
---@return number
function Mini.BiomeType.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.BiomeType.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.BiomeType.CreateDefault() end

---生物类型ID,别名：Mini.CreatureType
---@class Mini.MobType
Mini.MobType = {}

---序列化
---@param value any
---@return any
function Mini.MobType.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.MobType.UnSerialize(value) end

---转换为表
---@return table
function Mini.MobType:ToTable() end

---获取引用类型
---@return number
function Mini.MobType.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.MobType.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.MobType.CreateDefault() end

---方块类型ID
---@class Mini.Block
Mini.Block = {}

---序列化
---@param value any
---@return any
function Mini.Block.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Block.UnSerialize(value) end

---转换为表
---@return table
function Mini.Block:ToTable() end

---获取引用类型
---@return number
function Mini.Block.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Block.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Block.CreateDefault() end

---道具类型ID
---@class Mini.Item
Mini.Item = {}

---序列化
---@param value any
---@return any
function Mini.Item.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Item.UnSerialize(value) end

---转换为表
---@return table
function Mini.Item:ToTable() end

---获取引用类型
---@return number
function Mini.Item.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Item.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Item.CreateDefault() end

---特效类型ID
---@class Mini.Effect
Mini.Effect = {}

---序列化
---@param value any
---@return any
function Mini.Effect.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Effect.UnSerialize(value) end

---转换为表
---@return table
function Mini.Effect:ToTable() end

---获取引用类型
---@return number
function Mini.Effect.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Effect.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Effect.CreateDefault() end

---音效类型ID
---@class Mini.Sound
Mini.Sound = {}

---序列化
---@param value any
---@return any
function Mini.Sound.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Sound.UnSerialize(value) end

---转换为表
---@return table
function Mini.Sound:ToTable() end

---获取引用类型
---@return number
function Mini.Sound.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Sound.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Sound.CreateDefault() end

---图片ID
---@class Mini.Picture
Mini.Picture = {}

---序列化
---@param value any
---@return any
function Mini.Picture.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Picture.UnSerialize(value) end

---转换为表
---@return table
function Mini.Picture:ToTable() end

---获取引用类型
---@return number
function Mini.Picture.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Picture.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Picture.CreateDefault() end

---线动画ID
---@class Mini.LineAnimation
Mini.LineAnimation = {}

---序列化
---@param value any
---@return any
function Mini.LineAnimation.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.LineAnimation.UnSerialize(value) end

---转换为表
---@return table
function Mini.LineAnimation:ToTable() end

---获取引用类型
---@return number
function Mini.LineAnimation.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.LineAnimation.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.LineAnimation.CreateDefault() end

---模型ID（定义引用）
---@class Mini.Model
Mini.Model = {}

---序列化
---@param value any
---@return any
function Mini.Model.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Model.UnSerialize(value) end

---转换为表
---@return table
function Mini.Model:ToTable() end

---获取引用类型
---@return number
function Mini.Model.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Model.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Model.CreateDefault() end

---材质ID（定义引用）
---@class Mini.Material
Mini.Material = {}

---序列化
---@param value any
---@return any
function Mini.Material.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Material.UnSerialize(value) end

---转换为表
---@return table
function Mini.Material:ToTable() end

---获取引用类型
---@return number
function Mini.Material.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Material.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Material.CreateDefault() end

---预制体ID（定义引用）
---@class Mini.Prefab
Mini.Prefab = {}

---序列化
---@param value any
---@return any
function Mini.Prefab.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Prefab.UnSerialize(value) end

---转换为表
---@return table
function Mini.Prefab:ToTable() end

---获取引用类型
---@return number
function Mini.Prefab.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Prefab.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Prefab.CreateDefault() end

---组件类型ID（定义引用）
---@class Mini.ComponentType
Mini.ComponentType = {}

---序列化
---@param value any
---@return any
function Mini.ComponentType.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.ComponentType.UnSerialize(value) end

---转换为表
---@return table
function Mini.ComponentType:ToTable() end

---获取引用类型
---@return number
function Mini.ComponentType.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.ComponentType.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.ComponentType.CreateDefault() end

---实体类型ID（定义引用）
---@class Mini.EntityType
Mini.EntityType = {}

---序列化
---@param value any
---@return any
function Mini.EntityType.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.EntityType.UnSerialize(value) end

---转换为表
---@return table
function Mini.EntityType:ToTable() end

---获取引用类型
---@return number
function Mini.EntityType.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.EntityType.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.EntityType.CreateDefault() end

---玩家类型ID（定义引用）
---@class Mini.PlayerType
Mini.PlayerType = {}

---序列化
---@param value any
---@return any
function Mini.PlayerType.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.PlayerType.UnSerialize(value) end

---转换为表
---@return table
function Mini.PlayerType:ToTable() end

---获取引用类型
---@return number
function Mini.PlayerType.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.PlayerType.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.PlayerType.CreateDefault() end

---模型动作ID（定义引用）
---@class Mini.ModelAction
Mini.ModelAction = {}

---序列化
---@param value any
---@return any
function Mini.ModelAction.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.ModelAction.UnSerialize(value) end

---转换为表
---@return table
function Mini.ModelAction:ToTable() end

---获取引用类型
---@return number
function Mini.ModelAction.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.ModelAction.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.ModelAction.CreateDefault() end

---骨骼点ID（定义引用）
---@class Mini.SkeletonPoint
Mini.SkeletonPoint = {}

---序列化
---@param value any
---@return any
function Mini.SkeletonPoint.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.SkeletonPoint.UnSerialize(value) end

---转换为表
---@return table
function Mini.SkeletonPoint:ToTable() end

---获取引用类型
---@return number
function Mini.SkeletonPoint.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.SkeletonPoint.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.SkeletonPoint.CreateDefault() end

---自定义消息ID（定义引用）
---@class Mini.CustomMsg
Mini.CustomMsg = {}

---序列化
---@param value any
---@return any
function Mini.CustomMsg.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.CustomMsg.UnSerialize(value) end

---转换为表
---@return table
function Mini.CustomMsg:ToTable() end

---获取引用类型
---@return number
function Mini.CustomMsg.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.CustomMsg.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.CustomMsg.CreateDefault() end

---标签ID（定义引用）
---@class Mini.Tag
Mini.Tag = {}

---序列化
---@param value any
---@return any
function Mini.Tag.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Tag.UnSerialize(value) end

---转换为表
---@return table
function Mini.Tag:ToTable() end

---获取引用类型
---@return number
function Mini.Tag.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Tag.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Tag.CreateDefault() end

---UI元素ID
---@class Mini.UiElement
Mini.UiElement = {}

---序列化
---@param value any
---@return any
function Mini.UiElement.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.UiElement.UnSerialize(value) end

---转换为表
---@return table
function Mini.UiElement:ToTable() end

---获取引用类型
---@return number
function Mini.UiElement.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.UiElement.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.UiElement.CreateDefault() end

---UI状态ID
---@class Mini.UiState
Mini.UiState = {}

---序列化
---@param value any
---@return any
function Mini.UiState.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.UiState.UnSerialize(value) end

---转换为表
---@return table
function Mini.UiState:ToTable() end

---获取引用类型
---@return number
function Mini.UiState.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.UiState.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.UiState.CreateDefault() end

---分组视图（返回nil）
---@class Mini.GroupView
Mini.GroupView = {}

---序列化
---@param value any
---@return any
function Mini.GroupView.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.GroupView.UnSerialize(value) end

---转换为表
---@return table
function Mini.GroupView:ToTable() end

---获取引用类型
---@return number
function Mini.GroupView.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.GroupView.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.GroupView.CreateDefault() end

---Buff类型ID
---@class Mini.Buff
Mini.Buff = {}

---序列化
---@param value any
---@return any
function Mini.Buff.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Buff.UnSerialize(value) end

---转换为表
---@return table
function Mini.Buff:ToTable() end

---获取引用类型
---@return number
function Mini.Buff.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Buff.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Buff.CreateDefault() end

---蓝图ID
---@class Mini.Blueprint
Mini.Blueprint = {}

---序列化
---@param value any
---@return any
function Mini.Blueprint.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Blueprint.UnSerialize(value) end

---转换为表
---@return table
function Mini.Blueprint:ToTable() end

---获取引用类型
---@return number
function Mini.Blueprint.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Blueprint.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Blueprint.CreateDefault() end

---天空盒ID
---@class Mini.SkyBox
Mini.SkyBox = {}

---序列化
---@param value any
---@return any
function Mini.SkyBox.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.SkyBox.UnSerialize(value) end

---转换为表
---@return table
function Mini.SkyBox:ToTable() end

---获取引用类型
---@return number
function Mini.SkyBox.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.SkyBox.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.SkyBox.CreateDefault() end

---天空盒滤镜ID
---@class Mini.SkyBoxFilter
Mini.SkyBoxFilter = {}

---序列化
---@param value any
---@return any
function Mini.SkyBoxFilter.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.SkyBoxFilter.UnSerialize(value) end

---转换为表
---@return table
function Mini.SkyBoxFilter:ToTable() end

---获取引用类型
---@return number
function Mini.SkyBoxFilter.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.SkyBoxFilter.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.SkyBoxFilter.CreateDefault() end

---颜色渐变ID
---@class Mini.ColorGrandient
Mini.ColorGrandient = {}

---序列化
---@param value any
---@return any
function Mini.ColorGrandient.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.ColorGrandient.UnSerialize(value) end

---转换为表
---@return table
function Mini.ColorGrandient:ToTable() end

---获取引用类型
---@return number
function Mini.ColorGrandient.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.ColorGrandient.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.ColorGrandient.CreateDefault() end

---检查列表
---@class Mini.CheckList
Mini.CheckList = {}

---序列化
---@param value any
---@return any
function Mini.CheckList.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.CheckList.UnSerialize(value) end

---转换为表
---@return table
function Mini.CheckList:ToTable() end

---获取引用类型
---@return number
function Mini.CheckList.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.CheckList.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.CheckList.CreateDefault() end

---初始化
---@param data table
function Mini.CheckList:Init(data) end

---判断是否选中
---@param key string
---@return boolean
function Mini.CheckList:IsCheck(key) end

---设置选中状态
---@param key string
---@param isCheck boolean
function Mini.CheckList:SetCheck(key, isCheck) end

---路径点
---@class Mini.PathPoint
Mini.PathPoint = {}

---序列化
---@param value any
---@return any
function Mini.PathPoint.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.PathPoint.UnSerialize(value) end

---转换为表
---@return table
function Mini.PathPoint:ToTable() end

---获取引用类型
---@return number
function Mini.PathPoint.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.PathPoint.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.PathPoint.CreateDefault() end

---初始化
---@param data table
function Mini.PathPoint:Init(data) end

---动作配置
---@class Mini.Action
Mini.Action = {}

---序列化
---@param value any
---@return any
function Mini.Action.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Action.UnSerialize(value) end

---转换为表
---@return table
function Mini.Action:ToTable() end

---获取引用类型
---@return number
function Mini.Action.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Action.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Action.CreateDefault() end

---初始化
---@param data table
function Mini.Action:Init(data) end

---设置属性
---@param key string
---@param value any
---@param extraData? table
function Mini.Action:SetProperty(key, value, extraData) end

---复制
---@return Mini.Action
function Mini.Action:Copy() end

---@enum Mini.Action.ActionType
Mini.Action.ActionType = {
    Line = 1,
    Circle = 2,
    Pendulum = 3,
    Path = 4,
    Scale = 5,
    ScaleAll = 6,
}

---@enum Mini.Action.BeginType
Mini.Action.BeginType = {
    Now = 1,
    Msg = 2,
    PreActionBegin = 3,
    PreActionEnd = 4,
}

---@enum Mini.Action.RelativeType
Mini.Action.RelativeType = {
    Local = 1,
    World = 2,
}

---@enum Mini.Action.GoBackType
Mini.Action.GoBackType = {
    None = 1,
    ToBeginNow = 2,
    GoBack = 3,
    GoToBegin = 4,
}

---数组容器（UserData）
---@class Mini.Array
Mini.Array = {}

---序列化
---@param value any
---@return any
function Mini.Array.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.Array.UnSerialize(value) end

---转换为表
---@return table
function Mini.Array:ToTable() end

---获取引用类型
---@return number
function Mini.Array.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.Array.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.Array.CreateDefault() end

---初始化
---@param itemType any
---@param ... any
function Mini.Array:Init(itemType, ...) end

---获取大小
---@return number
function Mini.Array:Size() end

---获取值
---@param index number
---@return any
function Mini.Array:GetValue(index) end

---设置值
---@param value any
---@param index number
---@return boolean
function Mini.Array:SetValue(value, index) end

---插入值
---@param value any
---@param index? number
---@return boolean
function Mini.Array:Insert(value, index) end

---删除值
---@param index number
---@return any
function Mini.Array:Remove(index) end

---清空
---@return nil
function Mini.Array:Clear() end

---排序
---@param isUp boolean
---@return boolean
function Mini.Array:Sort(isUp) end

---复制
---@return Mini.Array
function Mini.Array:Copy() end

---获取所有值
---@return table
function Mini.Array:GetAllValue() end

---获取最大值
---@return number
function Mini.Array:GetMax() end

---获取最小值
---@return number
function Mini.Array:GetMin() end

---获取随机值
---@return any
function Mini.Array:RandomValue() end

---判断是否包含值
---@param value any
---@return boolean
function Mini.Array:HasValue(value) end

---根据值获取数量
---@param value any
---@return number
function Mini.Array:GetCountByValue(value) end

---根据值获取索引
---@param value any
---@return number
function Mini.Array:GetIndexByValue(value) end

---根据值删除
---@param value any
---@return number
function Mini.Array:RemoveByValue(value) end

---根据多个值删除
---@param values table
---@return table
function Mini.Array:RemoveByValues(values) end

---替换值
---@param valueNew any
---@param valueOld any
---@return number
function Mini.Array:ReplaceValue(valueNew, valueOld) end

---移动到指定位置
---@param oldIdx number
---@param newIdx number
---@return boolean
function Mini.Array:MoveTo(oldIdx, newIdx) end

---插入多个值
---@param values table
---@param index? number
---@return table
function Mini.Array:InsertValues(values, index) end

---增加值
---@param value any
---@param index number
---@return boolean
function Mini.Array:IncreasesValue(value, index) end

---添加事件监听
---@param fn function
---@param isAll? boolean
---@return nil
function Mini.Array:AddEvent(fn, isAll) end

---清除事件监听
---@return nil
function Mini.Array:ClearEvent() end

---设置是否触发事件
---@param isTriggerEvent boolean
---@param isAll? boolean
---@return boolean
function Mini.Array:SetIsTriggerEvent(isTriggerEvent, isAll) end

---判断是否有效
---@return boolean
function Mini.Array:IsValid() end

---判断是否为实例
---@return boolean
function Mini.Array:IsInstance() end

---初始化数据
---@param datas table
---@return boolean
function Mini.Array:InitData(datas) end

---获取元素类型
---@return any
function Mini.Array:GetItemType() end

---@enum Mini.Array.EventType
Mini.Array.EventType = {
    Add = 1,
    Remove = 2,
    Edit = 3,
    Clear = 4,
    Reset = 5,
}

---自定义数据容器（UserData）
---@class Mini.CustomData
Mini.CustomData = {}

---序列化
---@param value any
---@return any
function Mini.CustomData.Serialize(value) end

---反序列化
---@param value any
---@return any
function Mini.CustomData.UnSerialize(value) end

---转换为表
---@return table
function Mini.CustomData:ToTable() end

---获取引用类型
---@return number
function Mini.CustomData.GetRefType() end

---判断值类型
---@param value any
---@return boolean
function Mini.CustomData.IsValueOfType(value) end

---创建默认值
---@return any
function Mini.CustomData.CreateDefault() end

---初始化
---@param data table
function Mini.CustomData:Init(data) end

---获取所有键
---@return table
function Mini.CustomData:GetKeys() end

---复制
---@return Mini.CustomData
function Mini.CustomData:Copy() end

---添加事件监听
---@param fn function
---@param isAll? boolean
---@return nil
function Mini.CustomData:AddEvent(fn, isAll) end

---清除事件监听
---@return nil
function Mini.CustomData:ClearEvent() end

---设置是否触发事件
---@param isTriggerEvent boolean
---@param isAll? boolean
---@return boolean
function Mini.CustomData:SetIsTriggerEvent(isTriggerEvent, isAll) end

---生物类型（Mini.MobType的别名）
---@type Mini.MobType
Mini.CreatureType = Mini.MobType

---生物（Mini.Mob的别名）
---@type Mini.Mob
Mini.Creature = Mini.Mob
