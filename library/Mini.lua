---@meta

---迷你世界类型系统<br>
---[属性类型说明](https://dev-wiki.mini1.cn/ugc-wiki/introduction/componentattr.html)<br>
---组件属性中使用的类型定义，用于描述组件属性值的类型约束
---@class Mini
Mini = {}

---字符串类型
---@class Mini.String
Mini.String = {}

---@param value any
---@return any
function Mini.String.Serialize(value) end

---@param value any
---@return any
function Mini.String.UnSerialize(value) end

---@return table
function Mini.String:ToTable() end

---@return number
function Mini.String.GetRefType() end

---@param value any
---@return boolean
function Mini.String.IsValueOfType(value) end

---@return any
function Mini.String.CreateDefault() end

---数值类型
---@class Mini.Number
Mini.Number = {}

---@param value any
---@return any
function Mini.Number.Serialize(value) end

---@param value any
---@return any
function Mini.Number.UnSerialize(value) end

---@return table
function Mini.Number:ToTable() end

---@return number
function Mini.Number.GetRefType() end

---@param value any
---@return boolean
function Mini.Number.IsValueOfType(value) end

---@return any
function Mini.Number.CreateDefault() end

---布尔类型
---@class Mini.Bool
Mini.Bool = {}

---@param value any
---@return any
function Mini.Bool.Serialize(value) end

---@param value any
---@return any
function Mini.Bool.UnSerialize(value) end

---@return table
function Mini.Bool:ToTable() end

---@return number
function Mini.Bool.GetRefType() end

---@param value any
---@return boolean
function Mini.Bool.IsValueOfType(value) end

---@return any
function Mini.Bool.CreateDefault() end

---枚举类型
---@class Mini.Enum
Mini.Enum = {}

---@param value any
---@return any
function Mini.Enum.Serialize(value) end

---@param value any
---@return any
function Mini.Enum.UnSerialize(value) end

---@return table
function Mini.Enum:ToTable() end

---@return number
function Mini.Enum.GetRefType() end

---@param value any
---@return boolean
function Mini.Enum.IsValueOfType(value) end

---@return any
function Mini.Enum.CreateDefault() end

---@param tab table
function Mini.Enum:Init(tab) end

---@param value any
---@return boolean
function Mini.Enum:IsValue(value) end

---@return any
function Mini.Enum:GetDefault() end

---@param key string
---@return string
function Mini.Enum:GetDes(key) end

---@param key string
---@return number
function Mini.Enum:GetSort(key) end

---@return table
function Mini.Enum:GetDef() end

---二维向量
---@class Mini.Vec2
---@field protected x number
---@field protected y number
Mini.Vec2 = {}

---@param value any
---@return any
function Mini.Vec2.Serialize(value) end

---@param value any
---@return any
function Mini.Vec2.UnSerialize(value) end

---@return table
function Mini.Vec2:ToTable() end

---@return number
function Mini.Vec2.GetRefType() end

---@param value any
---@return boolean
function Mini.Vec2.IsValueOfType(value) end

---@return any
function Mini.Vec2.CreateDefault() end

---@param x number|table
---@param y? number
function Mini.Vec2:Init(x, y) end

---三维向量
---@class Mini.Vec3
---@field protected x number
---@field protected y number
---@field protected z number
Mini.Vec3 = {}

---@param value any
---@return any
function Mini.Vec3.Serialize(value) end

---@param value any
---@return any
function Mini.Vec3.UnSerialize(value) end

---@return table
function Mini.Vec3:ToTable() end

---@return number
function Mini.Vec3.GetRefType() end

---@param value any
---@return boolean
function Mini.Vec3.IsValueOfType(value) end

---@return any
function Mini.Vec3.CreateDefault() end

---@param x number|table
---@param y? number
---@param z? number
function Mini.Vec3:Init(x, y, z) end

---@return number
function Mini.Vec3:Lenght() end

---@return nil
function Mini.Vec3:Normalized() end

---@param posOrigin Mini.Vec3
---@param posTarget Mini.Vec3
---@param t number
---@return nil
function Mini.Vec3:lerp(posOrigin, posTarget, t) end

---缩放类型（继承Vec3）
---@class Mini.Scale: Mini.Vec3
Mini.Scale = {}

---@param value any
---@return any
function Mini.Scale.Serialize(value) end

---@param value any
---@return any
function Mini.Scale.UnSerialize(value) end

---@return table
function Mini.Scale:ToTable() end

---@return number
function Mini.Scale.GetRefType() end

---@param value any
---@return boolean
function Mini.Scale.IsValueOfType(value) end

---@return any
function Mini.Scale.CreateDefault() end

---@param x number|table
---@param y? number
---@param z? number
function Mini.Scale:Init(x, y, z) end

---@return number
function Mini.Scale:Lenght() end

---@return nil
function Mini.Scale:Normalized() end

---@param posOrigin Mini.Vec3
---@param posTarget Mini.Vec3
---@param t number
---@return nil
function Mini.Scale:lerp(posOrigin, posTarget, t) end

---旋转类型（继承Vec3）
---@class Mini.Rotation: Mini.Vec3
Mini.Rotation = {}

---@param value any
---@return any
function Mini.Rotation.Serialize(value) end

---@param value any
---@return any
function Mini.Rotation.UnSerialize(value) end

---@return table
function Mini.Rotation:ToTable() end

---@return number
function Mini.Rotation.GetRefType() end

---@param value any
---@return boolean
function Mini.Rotation.IsValueOfType(value) end

---@return any
function Mini.Rotation.CreateDefault() end

---@param x number|table
---@param y? number
---@param z? number
function Mini.Rotation:Init(x, y, z) end

---@return number
function Mini.Rotation:Lenght() end

---@return nil
function Mini.Rotation:Normalized() end

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

---@param value any
---@return any
function Mini.Color.Serialize(value) end

---@param value any
---@return any
function Mini.Color.UnSerialize(value) end

---@return table
function Mini.Color:ToTable() end

---@return number
function Mini.Color.GetRefType() end

---@param value any
---@return boolean
function Mini.Color.IsValueOfType(value) end

---@return any
function Mini.Color.CreateDefault() end

---@param r number|table
---@param g? number
---@param b? number
---@param a? number
function Mini.Color:Init(r, g, b, a) end

---对象ID（游戏对象引用）
---@class Mini.Object
Mini.Object = {}

---@param value any
---@return any
function Mini.Object.Serialize(value) end

---@param value any
---@return any
function Mini.Object.UnSerialize(value) end

---@return table
function Mini.Object:ToTable() end

---@return number
function Mini.Object.GetRefType() end

---@param value any
---@return boolean
function Mini.Object.IsValueOfType(value) end

---@return any
function Mini.Object.CreateDefault() end

---玩家ID（玩家引用）
---@class Mini.Player
Mini.Player = {}

---@param value any
---@return any
function Mini.Player.Serialize(value) end

---@param value any
---@return any
function Mini.Player.UnSerialize(value) end

---@return table
function Mini.Player:ToTable() end

---@return number
function Mini.Player.GetRefType() end

---@param value any
---@return boolean
function Mini.Player.IsValueOfType(value) end

---@return any
function Mini.Player.CreateDefault() end

---生物ID（生物引用）,别名：Mini.Creature
---@class Mini.Mob
Mini.Mob = {}

---@param value any
---@return any
function Mini.Mob.Serialize(value) end

---@param value any
---@return any
function Mini.Mob.UnSerialize(value) end

---@return table
function Mini.Mob:ToTable() end

---@return number
function Mini.Mob.GetRefType() end

---@param value any
---@return boolean
function Mini.Mob.IsValueOfType(value) end

---@return any
function Mini.Mob.CreateDefault() end

---实体ID（实体引用）
---@class Mini.Entity
Mini.Entity = {}

---@param value any
---@return any
function Mini.Entity.Serialize(value) end

---@param value any
---@return any
function Mini.Entity.UnSerialize(value) end

---@return table
function Mini.Entity:ToTable() end

---@return number
function Mini.Entity.GetRefType() end

---@param value any
---@return boolean
function Mini.Entity.IsValueOfType(value) end

---@return any
function Mini.Entity.CreateDefault() end

---掉落物ID（掉落物引用）
---@class Mini.DropItem
Mini.DropItem = {}

---@param value any
---@return any
function Mini.DropItem.Serialize(value) end

---@param value any
---@return any
function Mini.DropItem.UnSerialize(value) end

---@return table
function Mini.DropItem:ToTable() end

---@return number
function Mini.DropItem.GetRefType() end

---@param value any
---@return boolean
function Mini.DropItem.IsValueOfType(value) end

---@return any
function Mini.DropItem.CreateDefault() end

---投掷物ID（投掷物引用）
---@class Mini.ThrowItem
Mini.ThrowItem = {}

---@param value any
---@return any
function Mini.ThrowItem.Serialize(value) end

---@param value any
---@return any
function Mini.ThrowItem.UnSerialize(value) end

---@return table
function Mini.ThrowItem:ToTable() end

---@return number
function Mini.ThrowItem.GetRefType() end

---@param value any
---@return boolean
function Mini.ThrowItem.IsValueOfType(value) end

---@return any
function Mini.ThrowItem.CreateDefault() end

---角色ID（角色引用）
---@class Mini.Role
Mini.Role = {}

---@param value any
---@return any
function Mini.Role.Serialize(value) end

---@param value any
---@return any
function Mini.Role.UnSerialize(value) end

---@return table
function Mini.Role:ToTable() end

---@return number
function Mini.Role.GetRefType() end

---@param value any
---@return boolean
function Mini.Role.IsValueOfType(value) end

---@return any
function Mini.Role.CreateDefault() end

---区域ID（区域引用）
---@class Mini.Area
Mini.Area = {}

---@param value any
---@return any
function Mini.Area.Serialize(value) end

---@param value any
---@return any
function Mini.Area.UnSerialize(value) end

---@return table
function Mini.Area:ToTable() end

---@return number
function Mini.Area.GetRefType() end

---@param value any
---@return boolean
function Mini.Area.IsValueOfType(value) end

---@return any
function Mini.Area.CreateDefault() end

---生物群系类型ID
---@class Mini.BiomeType
Mini.BiomeType = {}

---@param value any
---@return any
function Mini.BiomeType.Serialize(value) end

---@param value any
---@return any
function Mini.BiomeType.UnSerialize(value) end

---@return table
function Mini.BiomeType:ToTable() end

---@return number
function Mini.BiomeType.GetRefType() end

---@param value any
---@return boolean
function Mini.BiomeType.IsValueOfType(value) end

---@return any
function Mini.BiomeType.CreateDefault() end

---生物类型ID,别名：Mini.CreatureType
---@class Mini.MobType
Mini.MobType = {}

---@param value any
---@return any
function Mini.MobType.Serialize(value) end

---@param value any
---@return any
function Mini.MobType.UnSerialize(value) end

---@return table
function Mini.MobType:ToTable() end

---@return number
function Mini.MobType.GetRefType() end

---@param value any
---@return boolean
function Mini.MobType.IsValueOfType(value) end

---@return any
function Mini.MobType.CreateDefault() end

---方块类型ID
---@class Mini.Block
Mini.Block = {}

---@param value any
---@return any
function Mini.Block.Serialize(value) end

---@param value any
---@return any
function Mini.Block.UnSerialize(value) end

---@return table
function Mini.Block:ToTable() end

---@return number
function Mini.Block.GetRefType() end

---@param value any
---@return boolean
function Mini.Block.IsValueOfType(value) end

---@return any
function Mini.Block.CreateDefault() end

---道具类型ID
---@class Mini.Item
Mini.Item = {}

---@param value any
---@return any
function Mini.Item.Serialize(value) end

---@param value any
---@return any
function Mini.Item.UnSerialize(value) end

---@return table
function Mini.Item:ToTable() end

---@return number
function Mini.Item.GetRefType() end

---@param value any
---@return boolean
function Mini.Item.IsValueOfType(value) end

---@return any
function Mini.Item.CreateDefault() end

---特效类型ID
---@class Mini.Effect
Mini.Effect = {}

---@param value any
---@return any
function Mini.Effect.Serialize(value) end

---@param value any
---@return any
function Mini.Effect.UnSerialize(value) end

---@return table
function Mini.Effect:ToTable() end

---@return number
function Mini.Effect.GetRefType() end

---@param value any
---@return boolean
function Mini.Effect.IsValueOfType(value) end

---@return any
function Mini.Effect.CreateDefault() end

---音效类型ID
---@class Mini.Sound
Mini.Sound = {}

---@param value any
---@return any
function Mini.Sound.Serialize(value) end

---@param value any
---@return any
function Mini.Sound.UnSerialize(value) end

---@return table
function Mini.Sound:ToTable() end

---@return number
function Mini.Sound.GetRefType() end

---@param value any
---@return boolean
function Mini.Sound.IsValueOfType(value) end

---@return any
function Mini.Sound.CreateDefault() end

---图片ID
---@class Mini.Picture
Mini.Picture = {}

---@param value any
---@return any
function Mini.Picture.Serialize(value) end

---@param value any
---@return any
function Mini.Picture.UnSerialize(value) end

---@return table
function Mini.Picture:ToTable() end

---@return number
function Mini.Picture.GetRefType() end

---@param value any
---@return boolean
function Mini.Picture.IsValueOfType(value) end

---@return any
function Mini.Picture.CreateDefault() end

---线动画ID
---@class Mini.LineAnimation
Mini.LineAnimation = {}

---@param value any
---@return any
function Mini.LineAnimation.Serialize(value) end

---@param value any
---@return any
function Mini.LineAnimation.UnSerialize(value) end

---@return table
function Mini.LineAnimation:ToTable() end

---@return number
function Mini.LineAnimation.GetRefType() end

---@param value any
---@return boolean
function Mini.LineAnimation.IsValueOfType(value) end

---@return any
function Mini.LineAnimation.CreateDefault() end

---模型ID（定义引用）
---@class Mini.Model
Mini.Model = {}

---@param value any
---@return any
function Mini.Model.Serialize(value) end

---@param value any
---@return any
function Mini.Model.UnSerialize(value) end

---@return table
function Mini.Model:ToTable() end

---@return number
function Mini.Model.GetRefType() end

---@param value any
---@return boolean
function Mini.Model.IsValueOfType(value) end

---@return any
function Mini.Model.CreateDefault() end

---材质ID（定义引用）
---@class Mini.Material
Mini.Material = {}

---@param value any
---@return any
function Mini.Material.Serialize(value) end

---@param value any
---@return any
function Mini.Material.UnSerialize(value) end

---@return table
function Mini.Material:ToTable() end

---@return number
function Mini.Material.GetRefType() end

---@param value any
---@return boolean
function Mini.Material.IsValueOfType(value) end

---@return any
function Mini.Material.CreateDefault() end

---预制体ID（定义引用）
---@class Mini.Prefab
Mini.Prefab = {}

---@param value any
---@return any
function Mini.Prefab.Serialize(value) end

---@param value any
---@return any
function Mini.Prefab.UnSerialize(value) end

---@return table
function Mini.Prefab:ToTable() end

---@return number
function Mini.Prefab.GetRefType() end

---@param value any
---@return boolean
function Mini.Prefab.IsValueOfType(value) end

---@return any
function Mini.Prefab.CreateDefault() end

---组件类型ID（定义引用）
---@class Mini.ComponentType
Mini.ComponentType = {}

---@param value any
---@return any
function Mini.ComponentType.Serialize(value) end

---@param value any
---@return any
function Mini.ComponentType.UnSerialize(value) end

---@return table
function Mini.ComponentType:ToTable() end

---@return number
function Mini.ComponentType.GetRefType() end

---@param value any
---@return boolean
function Mini.ComponentType.IsValueOfType(value) end

---@return any
function Mini.ComponentType.CreateDefault() end

---实体类型ID（定义引用）
---@class Mini.EntityType
Mini.EntityType = {}

---@param value any
---@return any
function Mini.EntityType.Serialize(value) end

---@param value any
---@return any
function Mini.EntityType.UnSerialize(value) end

---@return table
function Mini.EntityType:ToTable() end

---@return number
function Mini.EntityType.GetRefType() end

---@param value any
---@return boolean
function Mini.EntityType.IsValueOfType(value) end

---@return any
function Mini.EntityType.CreateDefault() end

---玩家类型ID（定义引用）
---@class Mini.PlayerType
Mini.PlayerType = {}

---@param value any
---@return any
function Mini.PlayerType.Serialize(value) end

---@param value any
---@return any
function Mini.PlayerType.UnSerialize(value) end

---@return table
function Mini.PlayerType:ToTable() end

---@return number
function Mini.PlayerType.GetRefType() end

---@param value any
---@return boolean
function Mini.PlayerType.IsValueOfType(value) end

---@return any
function Mini.PlayerType.CreateDefault() end

---模型动作ID（定义引用）
---@class Mini.ModelAction
Mini.ModelAction = {}

---@param value any
---@return any
function Mini.ModelAction.Serialize(value) end

---@param value any
---@return any
function Mini.ModelAction.UnSerialize(value) end

---@return table
function Mini.ModelAction:ToTable() end

---@return number
function Mini.ModelAction.GetRefType() end

---@param value any
---@return boolean
function Mini.ModelAction.IsValueOfType(value) end

---@return any
function Mini.ModelAction.CreateDefault() end

---骨骼点ID（定义引用）
---@class Mini.SkeletonPoint
Mini.SkeletonPoint = {}

---@param value any
---@return any
function Mini.SkeletonPoint.Serialize(value) end

---@param value any
---@return any
function Mini.SkeletonPoint.UnSerialize(value) end

---@return table
function Mini.SkeletonPoint:ToTable() end

---@return number
function Mini.SkeletonPoint.GetRefType() end

---@param value any
---@return boolean
function Mini.SkeletonPoint.IsValueOfType(value) end

---@return any
function Mini.SkeletonPoint.CreateDefault() end

---自定义消息ID（定义引用）
---@class Mini.CustomMsg
Mini.CustomMsg = {}

---@param value any
---@return any
function Mini.CustomMsg.Serialize(value) end

---@param value any
---@return any
function Mini.CustomMsg.UnSerialize(value) end

---@return table
function Mini.CustomMsg:ToTable() end

---@return number
function Mini.CustomMsg.GetRefType() end

---@param value any
---@return boolean
function Mini.CustomMsg.IsValueOfType(value) end

---@return any
function Mini.CustomMsg.CreateDefault() end

---标签ID（定义引用）
---@class Mini.Tag
Mini.Tag = {}

---@param value any
---@return any
function Mini.Tag.Serialize(value) end

---@param value any
---@return any
function Mini.Tag.UnSerialize(value) end

---@return table
function Mini.Tag:ToTable() end

---@return number
function Mini.Tag.GetRefType() end

---@param value any
---@return boolean
function Mini.Tag.IsValueOfType(value) end

---@return any
function Mini.Tag.CreateDefault() end

---UI元素ID
---@class Mini.UiElement
Mini.UiElement = {}

---@param value any
---@return any
function Mini.UiElement.Serialize(value) end

---@param value any
---@return any
function Mini.UiElement.UnSerialize(value) end

---@return table
function Mini.UiElement:ToTable() end

---@return number
function Mini.UiElement.GetRefType() end

---@param value any
---@return boolean
function Mini.UiElement.IsValueOfType(value) end

---@return any
function Mini.UiElement.CreateDefault() end

---UI状态ID
---@class Mini.UiState
Mini.UiState = {}

---@param value any
---@return any
function Mini.UiState.Serialize(value) end

---@param value any
---@return any
function Mini.UiState.UnSerialize(value) end

---@return table
function Mini.UiState:ToTable() end

---@return number
function Mini.UiState.GetRefType() end

---@param value any
---@return boolean
function Mini.UiState.IsValueOfType(value) end

---@return any
function Mini.UiState.CreateDefault() end

---分组视图（返回nil）
---@class Mini.GroupView
Mini.GroupView = {}

---@param value any
---@return any
function Mini.GroupView.Serialize(value) end

---@param value any
---@return any
function Mini.GroupView.UnSerialize(value) end

---@return table
function Mini.GroupView:ToTable() end

---@return number
function Mini.GroupView.GetRefType() end

---@param value any
---@return boolean
function Mini.GroupView.IsValueOfType(value) end

---@return any
function Mini.GroupView.CreateDefault() end

---Buff类型ID
---@class Mini.Buff
Mini.Buff = {}

---@param value any
---@return any
function Mini.Buff.Serialize(value) end

---@param value any
---@return any
function Mini.Buff.UnSerialize(value) end

---@return table
function Mini.Buff:ToTable() end

---@return number
function Mini.Buff.GetRefType() end

---@param value any
---@return boolean
function Mini.Buff.IsValueOfType(value) end

---@return any
function Mini.Buff.CreateDefault() end

---蓝图ID
---@class Mini.Blueprint
Mini.Blueprint = {}

---@param value any
---@return any
function Mini.Blueprint.Serialize(value) end

---@param value any
---@return any
function Mini.Blueprint.UnSerialize(value) end

---@return table
function Mini.Blueprint:ToTable() end

---@return number
function Mini.Blueprint.GetRefType() end

---@param value any
---@return boolean
function Mini.Blueprint.IsValueOfType(value) end

---@return any
function Mini.Blueprint.CreateDefault() end

---天空盒ID
---@class Mini.SkyBox
Mini.SkyBox = {}

---@param value any
---@return any
function Mini.SkyBox.Serialize(value) end

---@param value any
---@return any
function Mini.SkyBox.UnSerialize(value) end

---@return table
function Mini.SkyBox:ToTable() end

---@return number
function Mini.SkyBox.GetRefType() end

---@param value any
---@return boolean
function Mini.SkyBox.IsValueOfType(value) end

---@return any
function Mini.SkyBox.CreateDefault() end

---天空盒滤镜ID
---@class Mini.SkyBoxFilter
Mini.SkyBoxFilter = {}

---@param value any
---@return any
function Mini.SkyBoxFilter.Serialize(value) end

---@param value any
---@return any
function Mini.SkyBoxFilter.UnSerialize(value) end

---@return table
function Mini.SkyBoxFilter:ToTable() end

---@return number
function Mini.SkyBoxFilter.GetRefType() end

---@param value any
---@return boolean
function Mini.SkyBoxFilter.IsValueOfType(value) end

---@return any
function Mini.SkyBoxFilter.CreateDefault() end

---颜色渐变ID
---@class Mini.ColorGrandient
Mini.ColorGrandient = {}

---@param value any
---@return any
function Mini.ColorGrandient.Serialize(value) end

---@param value any
---@return any
function Mini.ColorGrandient.UnSerialize(value) end

---@return table
function Mini.ColorGrandient:ToTable() end

---@return number
function Mini.ColorGrandient.GetRefType() end

---@param value any
---@return boolean
function Mini.ColorGrandient.IsValueOfType(value) end

---@return any
function Mini.ColorGrandient.CreateDefault() end

---检查列表
---@class Mini.CheckList
Mini.CheckList = {}

---@param value any
---@return any
function Mini.CheckList.Serialize(value) end

---@param value any
---@return any
function Mini.CheckList.UnSerialize(value) end

---@return table
function Mini.CheckList:ToTable() end

---@return number
function Mini.CheckList.GetRefType() end

---@param value any
---@return boolean
function Mini.CheckList.IsValueOfType(value) end

---@return any
function Mini.CheckList.CreateDefault() end

---@param data table
function Mini.CheckList:Init(data) end

---@param key string
---@return boolean
function Mini.CheckList:IsCheck(key) end

---@param key string
---@param isCheck boolean
function Mini.CheckList:SetCheck(key, isCheck) end

---路径点
---@class Mini.PathPoint
Mini.PathPoint = {}

---@param value any
---@return any
function Mini.PathPoint.Serialize(value) end

---@param value any
---@return any
function Mini.PathPoint.UnSerialize(value) end

---@return table
function Mini.PathPoint:ToTable() end

---@return number
function Mini.PathPoint.GetRefType() end

---@param value any
---@return boolean
function Mini.PathPoint.IsValueOfType(value) end

---@return any
function Mini.PathPoint.CreateDefault() end

---@param data table
function Mini.PathPoint:Init(data) end

---动作配置
---@class Mini.Action
Mini.Action = {}

---@param value any
---@return any
function Mini.Action.Serialize(value) end

---@param value any
---@return any
function Mini.Action.UnSerialize(value) end

---@return table
function Mini.Action:ToTable() end

---@return number
function Mini.Action.GetRefType() end

---@param value any
---@return boolean
function Mini.Action.IsValueOfType(value) end

---@return any
function Mini.Action.CreateDefault() end

---@param data table
function Mini.Action:Init(data) end

---@param key string
---@param value any
---@param extraData? table
function Mini.Action:SetProperty(key, value, extraData) end

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

---@param value any
---@return any
function Mini.Array.Serialize(value) end

---@param value any
---@return any
function Mini.Array.UnSerialize(value) end

---@return table
function Mini.Array:ToTable() end

---@return number
function Mini.Array.GetRefType() end

---@param value any
---@return boolean
function Mini.Array.IsValueOfType(value) end

---@return any
function Mini.Array.CreateDefault() end

---@param itemType any
---@param ... any
function Mini.Array:Init(itemType, ...) end

---@return number
function Mini.Array:Size() end

---@param index number
---@return any
function Mini.Array:GetValue(index) end

---@param value any
---@param index number
---@return boolean
function Mini.Array:SetValue(value, index) end

---@param value any
---@param index? number
---@return boolean
function Mini.Array:Insert(value, index) end

---@param index number
---@return any
function Mini.Array:Remove(index) end

---@return nil
function Mini.Array:Clear() end

---@param isUp boolean
---@return boolean
function Mini.Array:Sort(isUp) end

---@return Mini.Array
function Mini.Array:Copy() end

---@return table
function Mini.Array:GetAllValue() end

---@return number
function Mini.Array:GetMax() end

---@return number
function Mini.Array:GetMin() end

---@return any
function Mini.Array:RandomValue() end

---@param value any
---@return boolean
function Mini.Array:HasValue(value) end

---@param value any
---@return number
function Mini.Array:GetCountByValue(value) end

---@param value any
---@return number
function Mini.Array:GetIndexByValue(value) end

---@param value any
---@return number
function Mini.Array:RemoveByValue(value) end

---@param values table
---@return table
function Mini.Array:RemoveByValues(values) end

---@param valueNew any
---@param valueOld any
---@return number
function Mini.Array:ReplaceValue(valueNew, valueOld) end

---@param oldIdx number
---@param newIdx number
---@return boolean
function Mini.Array:MoveTo(oldIdx, newIdx) end

---@param values table
---@param index? number
---@return table
function Mini.Array:InsertValues(values, index) end

---@param value any
---@param index number
---@return boolean
function Mini.Array:IncreasesValue(value, index) end

---@param fn function
---@param isAll? boolean
---@return nil
function Mini.Array:AddEvent(fn, isAll) end

---@return nil
function Mini.Array:ClearEvent() end

---@param isTriggerEvent boolean
---@param isAll? boolean
---@return boolean
function Mini.Array:SetIsTriggerEvent(isTriggerEvent, isAll) end

---@return boolean
function Mini.Array:IsValid() end

---@return boolean
function Mini.Array:IsInstance() end

---@param datas table
---@return boolean
function Mini.Array:InitData(datas) end

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

---@param value any
---@return any
function Mini.CustomData.Serialize(value) end

---@param value any
---@return any
function Mini.CustomData.UnSerialize(value) end

---@return table
function Mini.CustomData:ToTable() end

---@return number
function Mini.CustomData.GetRefType() end

---@param value any
---@return boolean
function Mini.CustomData.IsValueOfType(value) end

---@return any
function Mini.CustomData.CreateDefault() end

---@param data table
function Mini.CustomData:Init(data) end

---@return table
function Mini.CustomData:GetKeys() end

---@return Mini.CustomData
function Mini.CustomData:Copy() end

---@param fn function
---@param isAll? boolean
---@return nil
function Mini.CustomData:AddEvent(fn, isAll) end

---@return nil
function Mini.CustomData:ClearEvent() end

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
