# scenetree 类型系统 — Scene Tree & Component Property Type System

**文件数量:** ~80 | **技术栈:** Lua + FairyGUI

## 概述

场景树子系统用于 UGC 场景编辑器。管理场景节点、组件，以及驱动检查器面板的完整属性类型系统。包含数据类型定义、序列化逻辑和属性编辑器 UI 集成。

本文档描述 `miniui/module/ugc/scenetree/` 模块的类型系统架构，为 `miniworld-code-3.0` 类型定义库提供参考。

## 目录结构

```
scenetree/
├── common/
│   └── scenetreedefine.lua      # 类型注册表 (SceneTreeDefine.DataType)
├── datatype/
│   ├── scenedatabase.lua        # 根基类 (仅类型标签)
│   ├── scenedatatype.lua        # 中间基类 (InitData, MergeCfg, MergeValue)
│   ├── scenedatanumber.lua      # 数值类型
│   ├── scenedataboolean.lua     # 布尔类型
│   ├── scenedatastring.lua      # 字符串类型
│   ├── scenedatavector3.lua     # Vector3 类型
│   ├── scenedatavector2.lua     # Vector2 类型
│   ├── scenedatacolor.lua       # 颜色类型 (支持十六进制字符串)
│   ├── scenedataenum.lua        # 枚举类型 (enumDef, optionDesc)
│   ├── scenedatagroup.lua       # 分组视图 (仅 UI 容器)
│   ├── scenedatachecklist.lua   # 复选列表类型 (多开关)
│   ├── scenedatamodel.lua       # 模型资源
│   ├── scenedatamaterial.lua    # 材质资源
│   ├── scenedatabroadcast.lua   # 广播消息名称
│   ├── scenedataaction.lua      # 动作/动画定义
│   ├── scenedataarray.lua       # 数组类型 (类型化列表，嵌套 CustomData)
│   ├── scenedatapathpoint.lua   # 路径点
│   ├── scenedatacustomdata.lua  # CustomData (类似结构体的嵌套属性)
│   ├── scenedataarea.lua        # 区域选择器
│   └── scenedatacommon.lua      # ~15 种资源类型的共享实现
├── sceneeditor/                 # 场景编辑器集成
├── prefabeditor/                # 预制体编辑器
└── view/                        # 场景树视图
```

## 类型系统架构

三个层次的类型共存：

```
┌─────────────────────────────────────────────────────────────┐
│  ScriptParamType (paramstypedef.lua)                        │
│  52 个枚举值 — 底层类型标识符                                  │
│  使用方: UGC 框架、触发器系统、脚本 API                        │
├─────────────────────────────────────────────────────────────┤
│  SceneTreeDefine.DataType (scenetreedefine.lua)             │
│  35 种数据类型 + 9 种结构类型                                  │
│  ScriptParamType 的子集，暴露给编辑器检查器                     │
│  每个条目: { type, classname, sptype }                       │
├─────────────────────────────────────────────────────────────┤
│  MiniDef.* (paramstypedef.lua)                              │
│  ~15 个运行时值构造器                                         │
│  每个都有: Init, Serialize, UnSerialize, ToTable             │
│  用途: 默认值、运行时实例化                                    │
└─────────────────────────────────────────────────────────────┘
```

此外，`ValueType` (`miniui/engine/valuetype.lua`) 是粒子/材质编辑器的独立类型系统 — 与 ScriptParamType 不可互换。

---

## 完整类型列表

### ScriptParamType — 全部 52 个值

| 值 | 名称 | 在 SceneTreeDefine 中? |
|---|---|---|
| 1 | Number | ✅ |
| 3 | String | ✅ |
| 4 | Bool | ✅ |
| 5 | Vec2 | ✅ (Vector2) |
| 6 | Vec3 | ✅ (Vector3) |
| 7 | Color | ✅ |
| 8 | Enum | ✅ |
| 9 | Array | ✅ |
| 10 | GroupView | ✅ (Group) |
| 11 | CheckList | ✅ |
| 12 | Area | ✅ |
| 13 | Model | ✅ |
| 14 | Material | ✅ |
| 15 | CustomMsg | ✅ (Broadcast) |
| 16 | Action | ✅ |
| 17 | PathPoint | ✅ |
| 18 | Prefab | ❌ |
| 21 | Effect | ✅ |
| 22 | Sound | ✅ |
| 23 | Block | ✅ |
| 24 | Item | ✅ |
| 25 | CreatureType | ✅ |
| 26 | Mob | ❌ |
| 27 | Player | ❌ |
| 28 | CustomData | ✅ |
| 29 | Buff | ✅ |
| 30 | ComponentType | ✅ |
| 31 | Picture | ✅ |
| 32 | LineAnimation | ✅ |
| 33 | EntityModel | ✅ |
| 34 | Tag | ✅ |
| 35 | SkyBox | ✅ |
| 36 | SkyBoxFilter | ✅ |
| 37 | ModelAction | ✅ |
| 38 | PlayerType | ✅ |
| 39 | EntityType | ❌ |
| 40 | SkeletonPoint | ✅ |
| 41 | Scale | ❌ |
| 42 | Rotation | ❌ |
| 43 | Blueprint | ✅ |
| 44 | BiomeType | ✅ |
| 45 | ThrowItem | ❌ |
| 46 | DropItem | ❌ |
| 47 | Object | ❌ |
| 48 | Role | ❌ |
| 49 | UiElement | ❌ |
| 50 | UiState | ❌ |
| 51 | ColorGradient | ❌ |
| 52 | Emitter | ✅ |

标记 ❌ 的类型用于 UGC 脚本参数系统（触发器、AI 黑板、脚本 API），但不暴露在场景编辑器检查器面板中。

### SceneTreeDefine.DataType — 结构类型（无 sptype）

| 类型 | classname | 用途 |
|---|---|---|
| Empty | — | 空/占位符 |
| AssetScene | SceneProject | 场景项目引用 |
| AssetPrefab | ScenePrefab | 预制体资产引用 |
| Scene | SceneScene | 场景节点 |
| Node | SceneNode | 通用节点 |
| Component | SceneComponent | 组件包装器 |
| PrefabRefer | ScenePrefabRefer | 预制体实例引用 |
| UIProject | SceneUIProject | UI 项目引用 |
| WorldObject | SceneWorldObject | 世界对象引用 |

---

## 继承链

```
SceneDataBase (scenedatabase.lua)
  ├── __type__: string (类型标签)
  ├── Init(param), GetType(), SetType()
  ├── SerializeTo(desc), UnSerialize(cfg)
  └── IsSceneData() → true

  └─ SceneDataType (scenedatatype.lua)
       ├── InitData(name, cfg) — 带名称反序列化
       ├── MergeCfg(cfg) — 版本兼容合并配置
       ├── MergeValue(value, default) — 值与默认值合并
       ├── SetValue(value) — 设置值并触发 OnValueChanged()
       ├── GetValue() → self.value
       ├── GetBaseTypeValue() → 普通 Lua 值
       ├── SetInstanceValue(value) — 写入运行时实例
       ├── ToSPType() — 转换为 C++ ScriptParamType
       ├── SetParentFn(fn, index) — 父级数组引用
       ├── GetParentInstance() — 解析父级
       ├── GetInstanceComponent() — 获取所属组件
       ├── ReportDirty() — 标记已更改以便保存
       └── SetName(name), GetKey()

       └─ SceneDataXxx (具体类型)
```

---

## 类型特定属性

### Number

```lua
{
    type = Mini.Number,
    default = 0,
    minValue = -100,       -- 钳位范围
    maxValue = 100,
    stride = 0.1,          -- +/- 按钮的步长
    format = "%.2f",       -- 显示格式 (printf 风格)
    style = ComponentUIStyle.NumberButton  -- UI 变体
}
```

**UI 变体 (ComponentUIStyle):**
- `NumberButton` — `[−] [输入框] [+]` 支持长按重复
- `NumberSlider` — `[滑块] [值显示]`
- `NumberOnlyInput` — 仅 `[输入框]`
- `NumberOnlyRandom` — `[输入框] [🎲 随机]`

**运行时:** `self.prop` 返回普通数字。

### Boolean

```lua
{
    type = Mini.Bool,
    default = true,
    children = { "advancedOption1", "advancedOption2" },         -- 为 true 时显示
    switchCloseShowChildren = { "legacyOption1", "legacyOption2" }  -- 为 false 时显示
}
```

**UI:** 开关切换。根据状态控制子属性的可见性。

**运行时:** `self.prop` 返回 `true` 或 `false`。

### String

```lua
{
    type = Mini.String,
    default = "hello",
    maxLength = 30,
    minLength = 0,
    multiLine = false,     -- true = 文本域, false = 单行输入
    descParse = false      -- 启用描述解析
}
```

**运行时:** `self.prop` 返回字符串。

### Vector3

```lua
{
    type = Mini.Vec3,
    default = Mini.Vec3(0, 0.5, 0),
    minValue = { x = -100, y = -100, z = -100 },
    maxValue = { x = 100, y = 100, z = 100 },
    format = "%.1f",
    stride = 0.1,
    style = ComponentUIStyle.Vector3Input,      -- 3 字段输入
    displayNames = { "长", "宽", "高" },         -- 自定义轴标签
    displayColors = { ... }                      -- 自定义轴颜色
}
```

**UI:** 三个关联的数字输入 (X/Y/Z)。支持每轴独立的最小/最大值。

**运行时:** `self.prop` 返回 `{ x, y, z }`。支持 `+`, `-`, `*`, `/`, `==` 运算。

### Vector2

与 Vector3 相同，但仅有 X/Y。

### Color

```lua
{
    type = Mini.Color,
    default = Mini.Color.RED    -- 或 Mini.Color(255, 0, 0, 255)
}
```

**UI:** 带 RGBA 滑块的颜色选择器面板。

**运行时:** `self.prop` 返回 `{ r, g, b, a }` (各 0-255)。

**颜色常量:** `Mini.Color.WHITE`, `.BLACK`, `.RED`, `.GREEN`, `.BLUE`, `.YELLOW`, `.ORANGE`

**十六进制输入:** 支持 `"FF0000"` 字符串格式初始化。

### Enum

```lua
-- 步骤 1: 定义枚举类型
MyComp.QualityEnum = Mini.Enum({
    Common    = { sort = 1, value = 0, displayName = "普通" },
    Rare      = { sort = 2, value = 1, displayName = "稀有" },
    Epic      = { sort = 3, value = 2, displayName = "史诗" },
    Legendary = { sort = 4, value = 3, displayName = "传说" },
})

-- 步骤 2: 在属性中使用
quality = {
    type = MyComp.QualityEnum,
    enumDef = MyComp.QualityEnum,
    default = MyComp.QualityEnum.Common,
    displayName = "品质",
    style = ComponentUIStyle.EnumController,  -- 或 EnumDrapdown, EnumList
    optionDesc = {                            -- 可选的每键配置
        Common = { displayName = "普通", sort = 1 },
        Rare = { displayName = "稀有", sort = 2, group = { "rareBonus" } },
        -- group: 选择此选项时显示这些子属性
    }
}
```

**Mini.Enum 格式:**
```lua
-- 简单: key = 直接值
Mini.Enum({ WOMAN = "女", MAN = "男" })

-- 完整: key = { sort, value, displayName }
Mini.Enum({
    One = { sort = 1, value = 201, displayName = "队伍一" },
    Two = { sort = 2, value = 202, displayName = "队伍二" },
})
```

**UI 变体 (ComponentUIStyle):**
- `EnumController` — 分段按钮标签 (2-4 个选项)
- `EnumDrapdown` — 下拉选择 (5+ 个选项)
- `EnumList` — 带图标/描述的列表弹窗

**运行时:** `self.quality` 返回 `value` (例如 `0`)，而非键名。

**枚举方法:**
- `Enum:IsValue(v)` — 检查 v 是否为有效枚举值
- `Enum:GetDefault()` — 返回第一个值
- `Enum:GetDes(key)` — 获取键的 displayName
- `Enum:GetSort(key)` — 获取键的排序顺序

### CheckList

```lua
{
    type = Mini.CheckList,
    default = Mini.CheckList({ jump = true, replace = false }),
    checkListDef = {
        jump = { resourceId = 10001, displayName = "二段跳", default = true, sort = 1 },
        replace = { resourceId = 10001, displayName = "可替换", default = false, sort = 2 }
    },
    showTitle = true   -- 在复选框上方显示 "开关列表" 标题
}
```

**UI:** 带可选图标的多复选框列表。

**运行时:** `self.prop` 返回 CheckList 对象。使用 `self.prop:IsCheck("jump")`, `self.prop:SetCheck("jump", true)`。

### Group (GroupView)

```lua
{
    type = Mini.GroupView,
    style = ComponentUIStyle.Jump,
    displayName = "高级设置",
    children = { "speed", "friction", "bounce" },   -- 子属性键
    output = { format = "速度: %s, 摩擦: %s", children = { "speed", "friction" } },
    shrink = true,         -- 开始时折叠
    onlyTitle = false,     -- 仅显示标题栏
    clickFnName = "OnGroupClick",
    startText = "开始",
    stopText = "停止"
}
```

**UI:** 可折叠的区段标题。无值 — 纯 UI 容器用于分组子属性。

### Array

```lua
-- 简单类型数组
tags = {
    type = Mini.Array,
    itemType = Mini.Tag,
    maxNum = 20,
    canEdit = true,
    default = Mini.Array(Mini.Tag),
    displayName = "标签列表"
}

-- CustomData 结构体数组
dropItems = {
    type = Mini.Array,
    itemType = Mini.CustomData,
    maxNum = 10,
    canEdit = true,
    displayName = "掉落物品",
    style = ComponentUIStyle.ArrayDropItem,
    itemStyle = ComponentUIStyle.CustomDropItem,
    customDisplayName = "掉落物",     -- 元素标题前缀 ("掉落物1", "掉落物2")
    hideSize = false,                 -- 隐藏 "3/10" 计数器
    customDef = {                     -- 结构体字段定义
        item = {
            default = 29,
            sort = 1,
            type = Mini.Number,
            style = ComponentUIStyle.DropItem,
            displayName = "物品"
        },
        itemOdds = {
            default = 100,
            maxValue = 100,
            minValue = -1,
            sort = 2,
            type = Mini.Number,
            style = ComponentUIStyle.NumberButton,
            displayName = "概率(%)"
        },
        itemNum = {
            default = 1,
            maxValue = 64,
            minValue = -1,
            sort = 3,
            type = Mini.Number,
            style = ComponentUIStyle.NumberButton,
            displayName = "数量"
        }
    },
    Get = function(self) return self:GetDropItems() end,
    Set = function(self, value) self:SetDropItems(value) end
}
```

**支持的 itemType 值:**
| itemType | customDef? | 说明 |
|---|---|---|
| Mini.Number | 否 | 数字列表 |
| Mini.String | 否 | 字符串列表 |
| Mini.Bool | 否 | 布尔列表 |
| Mini.Tag | 否 | 标签列表 |
| Mini.Item | 否 | 物品 ID 列表 |
| Mini.Block | 否 | 方块 ID 列表 |
| Mini.Sound | 否 | 音效 ID 列表 |
| Mini.Effect | 否 | 特效 ID 列表 |
| Mini.Buff | 否 | Buff ID 列表 |
| Mini.Emitter | 否 | 发射器 ID 列表 |
| Mini.Model | 否 | 模型 ID 列表 |
| Mini.Material | 否 | 材质 ID 列表 |
| Mini.MobType | 否 | 生物类型列表 |
| Mini.ComponentType | 否 | 组件类型列表 |
| Mini.Blueprint | 否 | 蓝图 ID 列表 |
| Mini.BiomeType | 否 | 生物群系类型列表 |
| Mini.Area | 否 | 区域列表 |
| Mini.Action | 否 | 动作结构体 (内置字段) |
| Mini.PathPoint | 否 | 路径点结构体 (内置字段) |
| Mini.CustomData | **是** | 带用户自定义字段的自定义结构体 |

**运行时 API:**
```lua
-- 访问
local size = self.myArray:Size()
local item = self.myArray[1]           -- 索引访问
local item = self.myArray:GetValue(1)  -- 相同

-- 修改
self.myArray:Insert(value, index)      -- 在位置插入
self.myArray:Replace(index, value)     -- 在位置替换
self.myArray:Remove(index)             -- 在位置删除
self.myArray:Clear()                   -- 删除全部

-- 查询
self.myArray:HasValue(value)           -- 包含检查
self.myArray:GetIndexByValue(value)    -- 查找索引
self.myArray:GetCountByValue(value)    -- 计数出现次数
self.myArray:RandomValue()             -- 随机元素

-- 排序
self.myArray:Sort(isUp)                -- 升序/降序排序

-- 事件
self.myArray:AddEvent(function(event, index, value)
    -- event: 1=添加, 2=删除, 3=编辑, 4=清空, 5=重置
end)
self.myArray:SetIsTriggerEvent(false)  -- 抑制事件
self.myArray:ClearEvent()              -- 移除监听器

-- 批量
self.myArray:InsertValues({v1, v2, v3}, index)
self.myArray:RemoveByValue(value)
self.myArray:RemoveByValues({v1, v2})
self.myArray:ReplaceValue(new, old)
self.myArray:InitData({v1, v2, v3})    -- 用新数据重置

-- 复制
local copy = self.myArray:Copy()

-- 序列化
local tb = self.myArray:ToTable()      -- 转为普通表
```

**元素显示名称:**
- 默认: `GetTypeStrings(itemType) .. index` (例如 "CustomData1")
- 带 `customDisplayName`: `customDisplayName .. index` (例如 "掉落物1")
- 子类覆盖: `SetItemDisplayName(index)` 可返回动态名称 (用于 Timeline DirectorClip)
- **用户不能在编辑器中重命名元素** — 标题是只读的

### CustomData

```lua
-- 在 Array 的 customDef 中使用
customDef = {
    fieldName = {
        type = Mini.Number,           -- 字段类型
        default = 0,                   -- 默认值
        sort = 1,                      -- 显示顺序
        displayName = "字段名",        -- 标签
        style = ComponentUIStyle.NumberButton,  -- UI 变体
        -- ... 类型特定属性 (minValue, maxValue 等)
    }
}
```

CustomData 不在属性中独立使用 — 它作为 Array 的 `itemType` 出现，定义每个元素的结构。

### Action

用于运动/动画定义的内置结构体类型。字段是预定义的:

| 字段 | 类型 | 默认值 | 描述 |
|---|---|---|---|
| isEnable | Bool | true | 启用此动作 |
| displayName | String | "动作1" | 动作名称 |
| actionType | Enum | Line | Line/Circle/Pendulum/Scale/ScaleAll/Path |
| speedX/Y/Z | Number | 2/0/0 | 线性速度 (Line 模式) |
| angleX/Y/Z | Number | 0/60/0 | 旋转角度 (Circle/Pendulum) |
| runTime | Number | 3 | 持续时间（秒） |
| distance | Number | 6 | 移动距离 |
| delayTime | Number | 0 | 开始延迟 |
| endWaitTime | Number | 0 | 结束等待 |
| startMsg | Broadcast | — | 开始触发消息 |
| stopMsg | Broadcast | — | 停止触发消息 |
| beginType | Enum | Now | Now/Msg/PreActionBegin/PreActionEnd |
| relativeType | Enum | Local | Local/World 坐标空间 |
| isLoop | Bool | true | 循环播放 |
| goBackType | Enum | GoBack | None/ToBeginNow/GoBack/GoToBegin |
| scale/scaleX/Y/Z | Number | 1 | 缩放因子 |
| paths | Array(PathPoint) | — | 路径点 (Path 模式) |
| toFistTime | Number | 1 | 返回第一点时间 |

### Broadcast

```lua
{
    type = Mini.CustomMsg,
    default = "myMessage",
    displayName = "广播消息"
}
```

**UI:** 消息名称字符串的文本输入。

**运行时:** `self.prop` 返回字符串。

### 资源类型 (SceneDataCommon)

所有资源类型遵循相同模式:

```lua
{
    type = Mini.Model,  -- 或 Mini.Material, Mini.Effect, Mini.Sound 等
    default = "resourceId",
    displayName = "模型"
}
```

**UI:** 资源选择器 (打开资产浏览器)。

**运行时:** `self.prop` 返回资源 ID 字符串。

**完整列表:** Model, Material, Effect, Sound, Block, Item, Emitter, Buff, Tag, Blueprint, BiomeType, CreatureType, ComponentType, Picture, LineAnimation, EntityModel, SkyBox, SkyBoxFilter, ModelAction, PlayerType, SkeletonPoint, Area.

---

## 序列化

每个类型实现 `SerializeTo(desc, serializetype)` 和 `UnSerialize(cfg)`。

**SerializeType 模式:**

| 模式 | 值 | 行为 |
|---|---|---|
| NormalSerialize | 1 | 运行时 — 仅存储值 |
| UnSerialize | 2 | 恢复 — 存储完整配置包括元数据 |
| DirectSerialize | 3 | 直接复制 |
| ComponentMerge | 4 | 与现有合并 — 保留元数据 |
| WholeCopy | 5 | 完整复制 — 保留所有内容 |
| NodeCopy | 6 | 节点复制 |
| CopyCmpParams | 7 | 组件参数复制 |

关键区别: `NormalSerialize` 剥离编辑器元数据 (minValue, maxValue, enumDef)。其他模式保留它以便重新编辑。

**ToSPType()** 将 SceneData 值转换为 C++ ScriptParamType 用于引擎互操作:
```lua
SceneDataColor:ToSPType()  → Mini.Color(r, g, b, a)
SceneDataArray:ToSPType()  → Mini.Array(datatype) with Insert() calls
```

---

## 属性表格式

```lua
MyComp.propertys = {
    -- 基本类型简写 (由 ComponentsMgr:ChangeParamToDef 自动规范化)
    simpleNumber = 42,
    simpleString = "hello",
    simpleBool = true,

    -- 完整形式 (非基本类型或需要 UI 自定义时必需)
    propertyName = {
        -- 非基本类型必需
        type = Mini.XXX,              -- 类型标识符 (Mini.Number, Mini.Bool, MyEnum 等)
        default = value,              -- 默认值 (可省略，类型有内置默认值)

        -- 可选
        displayName = "显示名称",     -- 检查器中的标签 (默认为属性键名)

        -- 可选 — 排序
        sort = 1,                     -- 显示顺序 (越小越靠前)

        -- 可选 — UI 样式覆盖
        style = ComponentUIStyle.XXX, -- 特定 UI 变体

        -- 可选 — 可见性控制
        hide = false,                 -- 从检查器隐藏
        disable = ComponentUITouchEvent.Disable,  -- 灰显
        editPermission = ComponentUIPermissions.Show,  -- 权限门控
        tips = "tooltip text",        -- ? 按钮提示
        filter = { whiteList = {...}, blackList = {...} },  -- 资源过滤器

        -- 可选 — 值约束 (Number)
        minValue = 0,
        maxValue = 100,
        stride = 1,
        format = "%.0f",

        -- 可选 — 值约束 (String)
        maxLength = 30,
        minLength = 0,
        multiLine = false,

        -- 可选 — Enum 配置
        enumDef = MyEnum,
        optionDesc = { Key = { displayName, sort, group } },

        -- 可选 — Boolean 子属性
        children = { "childProp1", "childProp2" },
        switchCloseShowChildren = { "hiddenWhenTrue1" },

        -- 可选 — Group 配置
        output = { format = "...", children = { ... } },
        shrink = true,
        onlyTitle = false,

        -- 可选 — Array 配置
        itemType = Mini.XXX,
        maxNum = 100,
        minNum = 0,
        canEdit = true,
        customDef = { ... },
        customDisplayName = "元素",
        hideSize = false,
        itemStyle = ComponentUIStyle.XXX,

        -- 可选 — 持久化
        isSave = true,                -- 保存到文件
        isReset = true,               -- 组件重置时重置
        permission = CmpProPermission.Private,  -- 访问控制

        -- 可选 — 自定义 getter/setter
        Get = function(self) return self:GetValue() end,
        Set = function(self, value) self:SetValue(value) end,

        -- 可选 — 显示自定义
        displayColor = { r=0, g=0, b=0 },
        displayNames = { "X", "Y", "Z" },   -- Vector3 轴标签
        displayColors = { ... },              -- Vector3 轴颜色

        -- 可选 — 显示条件
        showRule = {
            { property = "otherProp", values = { value1, value2 } }
        },

        -- 可选 — 杂项
        url = "",
        clickFnName = "OnPropertyClick",
        msgContext = { ... },
        startText = "开始",
        stopText = "停止",
    }
}
```

---

## 约定

- **枚举定义**: 始终在类级别 (`MyComp.MyEnum = Mini.Enum({...})`)，而非内联
- **type + enumDef**: 对于 Enum 属性，将两者都设置为相同的枚举对象
- **默认值**: 使用 `Mini.XXX(value)` 构造器，而非原始 Lua 表
- **本地化**: 对所有 displayName 字符串使用 `UGCTools.GetS(id)`
- **属性名**: 属性表中的 camelCase 键
- **sort 值**: 使用从 1 开始的顺序整数
- **Array customDef**: 每个字段需要 `type`, `default`, `sort`, `displayName`

## 简写属性定义

基本值（数字、字符串、布尔）可直接用作属性定义。`ComponentsMgr:ChangeParamToDef()` 会自动规范化它们:

```lua
propertys = {
    -- 这些都是等价的:
    speed = 3,
    speed = { type = Mini.Number, default = 3 },

    name = "hello",
    name = { type = Mini.String, default = "hello" },

    active = true,
    active = { type = Mini.Bool, default = true },
}
```

**规范化规则** (`componentsmgr.lua:3729-3737`):

| 简写 | 自动推断类型 | 自动设置默认值 |
|---|---|---|
| `prop = 42` | `Mini.Number` | `42` |
| `prop = "text"` | `Mini.String` | `"text"` |
| `prop = false` | `Mini.Bool` | `false` |

**限制:**
- 仅适用于 Number, String, Bool 基本类型
- 不适用于 Vec3, Color, Enum, Array 等 — 这些必须使用 `{ type = Mini.XXX, ... }` 表
- 简写属性获得默认 `displayName`（键名），无 `style`，无约束 (`minValue`/`maxValue`/`stride`/`format`)
- 对简单标志/配置使用简写；需要 UI 自定义时使用完整形式

## 反模式

- 不要在属性中内联使用 `Mini.Enum` — 先在类级别定义
- 使用 Enum 类型时不要忘记 `enumDef` — 编辑器不会渲染选项
- 不要对 Vec3 默认值使用原始 `{x,y,z}` — 使用 `Mini.Vec3(x,y,z)`
- 不要对 Color 默认值使用原始 `{r,g,b,a}` — 使用 `Mini.Color(r,g,b,a)`
- 不要无充分理由设置 `canEdit = false` — 用户期望修改数组
- 不要超过 `maxNum = 100` 对 Array 而不进行性能测试
- 需要 UI 约束 (min/max/stride/format) 或自定义 displayName 时，不要使用简写 (`prop = 3`)

---

## ComponentUIStyle — 全部 82 种样式

定义在 `luascript/ugc/framework/base/componentdef.lua`。每种样式映射到 `NodePool:BindParamType()` 中的特定 Param 子类。

### Number 样式

| 样式 | Param 类 | UI |
|---|---|---|
| `Number` | ParamValue | 默认数字输入 |
| `NumberSlider` | ParamValue | 滑块 + 值显示 |
| `NumberButton` | ParamValue | [−] [输入框] [+] 支持长按 |
| `NumberOnlyInput` | ParamValue | 仅输入框 |
| `NumberOnlyRandom` | ParamValue | 输入框 + 随机按钮 |

### Vector3 样式

| 样式 | Param 类 | UI |
|---|---|---|
| `Vector3Input` | ParamPosition | 3 字段 X/Y/Z 输入 |
| `Vector3Selector` | ParamPosition | 3 字段 + 世界坐标选择器 |
| `Vector3AnchorPoint` | ParamAnchorPoint | 3 字段 + 锚点网格 |

### Enum 样式

| 样式 | Param 类 | UI |
|---|---|---|
| `EnumDrapdown` | ParamEnumDrapdown | 下拉选择 |
| `EnumList` | ParamEnumList | 列表弹窗 |
| `EnumController` | ParamEnumController | 分段标签 |
| `EnumControllerHideValue` | ParamEnumController | 不显示值的标签 |

### Array 容器样式

| 样式 | Param 类 | 用途 |
|---|---|---|
| `ActionArray` | ParamActionArray | 动作列表容器 |
| `ModelAttrArray` | ParamModelAttrArray | 模型属性数组 |
| `ArrayDropItem` | ParamArrayDropItem | 掉落物列表 |
| `ArrayItem` | ParamArrayItems | 通用物品列表 |
| `ArrayCommonItem` | ParamArrayCommonItem | 通用物品列表 |
| `ArrayForItems` | ParamArrayForItems | 带偏移的物品数组 |
| `ArrayForItemsOffsetPos` | ParamArrayForItemsOffsetPos | 带位置偏移的物品数组 |
| `ArrayForTags` | ParamArrayTags | 标签数组 |
| `ArrayBuff` | ParamArrayBuff | Buff 数组 |
| `ArrayStatus` | ParamArrayStatus | 状态数组 |
| `ArrayStatusEffect` | ParamArrayStatusEffect | 状态效果数组 |
| `ArrayStatusEffectInst` | ParamArrayStatusEffect | 状态效果实例数组 |
| `ArrayMonsterItem` | ParamArrayMonsterItem | 怪物物品数组 |
| `ArrayBiomeMonster` | ParamArrayBiomeMonster | 生物群系怪物数组 |
| `ArrayBlockMaterial` | ParamArrayBlockMaterial | 方块材质数组 |
| `ArrayAI` | ParamArrayAI | AI 数组 |
| `ArraySkill` | ParamArraySkill | 技能数组 |
| `ArrayParticleBrusts` | ParamArrayParticleBrusts | 粒子爆发数组 |
| `ArrayImportAnimation` | ParamArrayImportAnimation | 导入动画数组 |
| `ArrayFeedItem` | ParamArrayFeedItem | 喂食物品数组 |
| `ArrayBurstItem` | ParamArrayBurstItem | 爆发物品数组 |
| `ArrayEmitterId` | ParamArrayEmitterId | 发射器 ID 数组 |

### Array 元素样式 (用于 customDef 元素)

| 样式 | Param 类 | 用途 |
|---|---|---|
| `ActionItem` | ParamActionItem | 单个动作编辑器 |
| `PathPoint` | ParamPathItem | 路径点编辑器 |
| `Paths` | ParamPathArray | 路径点列表 |
| `CustomDropItem` | ParamCustomItemDropItem | 掉落物结构体编辑器 |
| `CustomCommonItem` | ParamCustomItemCommonItem | 通用物品结构体编辑器 |
| `CustomItemStatus` | ParamCustomItemStatus | 状态结构体编辑器 |
| `CustomItemStatusEffect` | ParamCustomItemStatusEffect | 状态效果结构体编辑器 |
| `CustomItemAI` | ParamCustomItemAI | AI 结构体编辑器 |
| `CustomItemUseEdit` | ParamCustomItemUseEdit | 物品使用编辑器 |
| `CustomSkillItem` | ParamCustomItemSkill | 技能结构体编辑器 |
| `CustomFeedItem` | ParamCustomItemFeedItem | 喂食结构体编辑器 |
| `CustomRewardItem` | ParamCustomItemRewardItem | 奖励结构体编辑器 |
| `MaterialGroupItem` | ParamMaterialGroupItem | 材质组元素 |
| `MaterialGroupItemNew` | ParamMaterialGroupItemNew | 材质组元素 (新版) |
| `AnchorMeshGroupItem` | ParamAnchorMeshGroupItem | 锚点网格组元素 |

### 资源选择器样式

| 样式 | Param 类 | 用途 |
|---|---|---|
| `DropItem` | ParamItem | 物品选择器 (掉落上下文) |
| `Bullet` | ParamItem | 物品选择器 (子弹上下文) |
| `ItemModel` | ParamItem | 物品选择器 (模型上下文) |
| `Projectile` | ParamItem | 物品选择器 (投射物上下文) |
| `ItemEquip` | ParamItem | 物品选择器 (装备上下文) |
| `CommonItem` | ParamItem | 通用物品选择器 |
| `BlockModel` | ParamBlock | 方块选择器 (模型上下文) |
| `BlockTemp` | ParamBlock | 方块选择器 (模板上下文) |
| `AvatarPart` | ParamModel | 模型选择器 (角色部件) |

### UI/显示样式

| 样式 | Param 类 | 用途 |
|---|---|---|
| `Jump` | ParamJumpTolayer2 | 可折叠分组标题 |
| `Title` | ParamTitle | 区段标题 |
| `TitleParticleEdit` | ParamTitleParticleEdit | 粒子编辑器标题 |
| `ParticleModuleItem` | ParamParticleModuleItem | 粒子模块元素 |
| `PreViewButton` | ParamActionButton | 预览动作按钮 |
| `ActionButton` | ParamButton | 通用动作按钮 |
| `Icon` | ParamIcon | 图标显示 |
| `Tag` | ParamTag | 标签选择器 |
| `Switch` | ParamSwitch | 布尔切换 |
| `Curve` | ParamCurve | 曲线编辑器 |
| `ColorGradient` | ParamColorGradient | 颜色渐变编辑器 |
| `SkyPicture` | ParamObjType | 天空图片选择器 |
| `FilterPicture` | ParamObjType | 滤镜图片选择器 |
| `SunMoonTexture` | — | 日月纹理选择器 |
| `SkyTexture` | — | 天空纹理选择器 |
| `SinglePicture` | — | 单张图片选择器 |
| `OnlyCustomPicture` | — | 仅自定义图片 |
| `CustomMaterial` | — | 自定义材质选择器 |
| `EffectMaterial` | — | 特效材质选择器 |

### 专用样式

| 样式 | Param 类 | 用途 |
|---|---|---|
| `MaterialGroup` | ParamMaterialGroup | 材质组容器 |
| `AnchorMeshGroup` | ParamAnchorMeshGroup | 锚点网格组容器 |
| `AIModelItem` | — | AI 模型元素 |
| `AIModelArray` | — | AI 模型数组 |

---

## 权限系统

### CmpProPermission (组件属性权限)

控制运行时谁可以读写属性:

```lua
CmpProPermission = {
    Public = 1,   -- 任何人都可读写
    Private = 2,  -- 仅所属组件可写
    Read = 3,     -- 外部访问只读
}
```

在属性中使用:
```lua
myProp = {
    type = Mini.Number,
    permission = CmpProPermission.Private,
    ...
}
```

### ComponentUIPermissions (UI 可见性权限)

控制谁可以在编辑器检查器中看到属性:

```lua
ComponentUIPermissions = {
    Hide = 0,         -- 对所有人隐藏
    Show = 1,         -- 对所有人可见
    OfficialShow = 2, -- 仅在官方模式下可见 (appId == 999)
}
```

在属性中使用:
```lua
debugProp = {
    type = Mini.Number,
    editPermission = ComponentUIPermissions.OfficialShow,
    ...
}
```

### ComponentUITouchEvent

控制交互性:

```lua
ComponentUITouchEvent = {
    Disable = 0,     -- 属性灰显，子属性仍可交互
    DisableAll = 1,  -- 属性及所有子属性灰显
}
```

---

## PathPoint 结构体

```lua
Mini.PathPoint({
    pos = Mini.Vec3(3, 0, 0),   -- 位置偏移
    time = 1,                     -- 到达此点的行进时间
    displayName = "路径点1"        -- 点标签
})
```

字段:
- `pos` — Vec3 位置，相对于前一个点 (或原点)
- `time` — 到达此点的秒数
- `displayName` — 编辑器中显示的标签

---

## 禁用类型 (详细)

### ForbidDevParamType — 在开发组件中禁用的类型

这些类型不能在用户创建的（开发）组件中使用:

```lua
ForbidDevParamType = {
    CheckList, Action, PathPoint, Scale, Rotation,
    SkeletonPoint, Vec2, BiomeType, EntityType,
    ThrowItem, DropItem, Object, Role,
    UiElement, UiState, Entity, Mob, Player
}
```

原因: 这些类型要么是内部引擎类型，已弃用，要么需要开发组件无法提供的特殊处理。

| 类型 | 禁用原因 |
|---|---|
| CheckList | 需要特殊 UI 渲染，开发组件不支持 |
| Action | 内置结构体，字段预定义 |
| PathPoint | 内置结构体，与 Action 配合使用 |
| Scale | 内部变换类型，引擎保留 |
| Rotation | 内部变换类型，引擎保留 |
| SkeletonPoint | 骨骼系统专用，需要特殊处理 |
| Vec2 | 已弃用，改用 Vec3 |
| BiomeType | 生物群系系统专用 |
| EntityType | 实体系统专用 |
| ThrowItem | 投掷物品系统专用 |
| DropItem | 掉落物品系统专用 |
| Object | 对象系统专用 |
| Role | 角色系统专用 |
| UiElement | UI 元素系统专用 |
| UiState | UI 状态系统专用 |
| Entity | 实体系统专用 |
| Mob | 怪物系统专用 |
| Player | 玩家系统专用 |

### ForbidDevArrayParamType — 作为开发数组元素禁用的类型

```lua
ForbidDevArrayParamType = {
    CustomMsg,  -- 广播消息不能是数组
    Vec2,       -- 改用 Vec3
    Vec3        -- 改用带 x/y/z 字段的 CustomData
}
```

| 类型 | 禁用原因 |
|---|---|
| CustomMsg | 广播消息是字符串，无数组语义 |
| Vec2 | 已弃用，改用 Vec3 |
| Vec3 | 数组中应使用 CustomData 包装 x/y/z 字段 |

### ForbidParamTypeInArray — 不能作为数组元素的类型

```lua
ForbidParamTypeInArray = {
    GroupView,  -- 仅 UI，无值
    Enum,       -- 改用带值映射的 Number
    Array,      -- 不支持嵌套数组
    CheckList,  -- 改用带 Bool 字段的 CustomData
    Rotation,   -- 内部变换类型
    Scale       -- 内部变换类型
}
```

| 类型 | 禁用原因 |
|---|---|
| GroupView | 纯 UI 容器，无运行时值 |
| Enum | 数组中无法序列化枚举定义，改用 Number + 值映射 |
| Array | 不支持嵌套数组，改用 CustomData 包装 |
| CheckList | 数组中无法序列化 CheckList 定义，改用 CustomData + Bool 字段 |
| Rotation | 内部变换类型，引擎保留 |
| Scale | 内部变换类型，引擎保留 |

---

## MiniDef.* — 运行时值类型

`paramstypedef.lua` 中的每个类型通过 `ParamClass()` 或 `ParamUserDataClass()` 创建。类型分为几类:

### 基本类型 (ParamClass，返回普通值)

| 类型 | 构造器 | 默认值 | 说明 |
|---|---|---|---|
| String | `Mini.String(val)` | `""` | 普通字符串 |
| Number | `Mini.Number(val)` | `0` | 普通数字 |
| Bool | `Mini.Bool(val)` | `true` | 普通布尔 |
| GroupView | `Mini.GroupView()` | `nil` | 无值 (仅 UI) |

### 结构类型 (ParamClass，返回表)

| 类型 | 构造器 | 字段 | 说明 |
|---|---|---|---|
| Vec2 | `Mini.Vec2(x,y)` | x, y | 支持 +, -, == |
| Vec3 | `Mini.Vec3(x,y,z)` | x, y, z | 支持 +, -, *, /, ==, Normalized(), Lenght() |
| Color | `Mini.Color(r,g,b,a)` | r, g, b, a (0-255) | 支持颜色常量 (Color.RED 等) |
| Enum | `Mini.Enum({...})` | 动态键 | 见 Enum 部分 |
| CheckList | `Mini.CheckList({...})` | 动态键 | 见 CheckList 部分 |
| Action | `Mini.Action(data)` | 20+ 字段 | 见 Action 部分 |
| PathPoint | `Mini.PathPoint(data)` | pos(Vec3), time, displayName | 路径航点 |

### 资源类型 (ParamClass 继承 ObjString/ObjStringOrNum/ObjNum)

| 类型 | 基类 | 默认值 | IsValueOfType |
|---|---|---|---|
| Model | ObjString | `""` | 字符串检查 |
| Material | ObjString | `""` | 字符串检查 |
| CustomMsg | ObjString | `""` | 字符串检查 |
| Prefab | ObjString | `""` | 字符串检查 |
| ComponentType | ObjString | `""` | 字符串检查 |
| ModelAction | ObjString | `""` | 字符串检查 |
| PlayerType | ObjString | `""` | 字符串检查 |
| SkeletonPoint | ObjString | `""` | 字符串检查 |
| Tag | ObjString | `""` | 字符串检查 |
| UiElement | ObjString | `""` | 字符串检查 |
| UiState | ObjString | `""` | 字符串检查 |
| Buff | ObjStringOrNum | `40001` | 字符串或数字 |
| SkyBox | ObjStringOrNum | `0` | 字符串或数字 |
| SkyBoxFilter | ObjStringOrNum | `0` | 字符串或数字 |
| ColorGrandient | ObjStringOrNum | `""` | 字符串或数字 |
| Blueprint | ObjStringOrNum | `""` | 字符串或数字 |
| Effect | ObjStringOrNum | `""` | 字符串或数字 |
| Block | ObjStringOrNum | `100` | 字符串或数字 |
| Item | ObjStringOrNum | `11012` | 字符串或数字 |
| Emitter | ObjStringOrNum | `0` | 字符串或数字 |
| MobType | ObjStringOrNum | `3400` | 字符串或数字 |
| Sound | ObjStringOrNum | `10947` | 字符串或数字 |
| Picture | ObjStringOrNum | `10001` | 字符串或数字 |
| LineAnimation | ObjStringOrNum | `850003` | 字符串或数字 |
| BiomeType | ObjNum | `1` | 数字检查 |
| Mob | ObjNum | `0` | 数字检查 |
| ThrowItem | ObjNum | `0` | 数字检查 |
| DropItem | ObjNum | `0` | 数字检查 |
| Object | ObjNum | `0` | 数字检查 |
| Role | ObjNum | `0` | 数字检查 |
| Entity | ObjNum | `0` | 数字检查 |
| Area | ObjNum | `0` | 数字检查 |
| Player | ObjNum | `0` | 数字检查 |
| EntityType | ObjString | `"newModel_11000000"` | 字符串检查 |

### 复杂类型 (ParamUserDataClass，使用带私有数据的 userdata)

| 类型 | 构造器 | 内部 | 说明 |
|---|---|---|---|
| Array | `Mini.Array(itemType, ...)` | `{size, data, itemType}` | 带事件的类型化列表 |
| CustomData | `Mini.CustomData({...})` | `{data, other}` | 动态键值结构体 |

两者都使用 `newproxy(true)` 创建带自定义 `__index`/`__newindex` 元方法的 userdata。私有数据从 Lua 不可访问 — 仅通过方法调用。

---

## 禁用类型

### ForbidDevParamType — 在开发组件中禁用的类型

这些类型不能在用户创建的（开发）组件中使用:

```lua
ForbidDevParamType = {
    CheckList, Action, PathPoint, Scale, Rotation,
    SkeletonPoint, Vec2, BiomeType, EntityType,
    ThrowItem, DropItem, Object, Role,
    UiElement, UiState, Entity, Mob, Player
}
```

原因: 这些类型要么是内部引擎类型，已弃用，要么需要开发组件无法提供的特殊处理。

### ForbidDevArrayParamType — 作为开发数组元素禁用的类型

```lua
ForbidDevArrayParamType = {
    CustomMsg,  -- 广播消息不能是数组
    Vec2,       -- 改用 Vec3
    Vec3        -- 改用带 x/y/z 字段的 CustomData
}
```

### ForbidParamTypeInArray — 不能作为数组元素的类型

```lua
ForbidParamTypeInArray = {
    GroupView,  -- 仅 UI，无值
    Enum,       -- 改用带值映射的 Number
    Array,      -- 不支持嵌套数组
    CheckList,  -- 改用带 Bool 字段的 CustomData
    Rotation,   -- 内部变换类型
    Scale       -- 内部变换类型
}
```

---

## 辅助函数 (ParamHelper)

| 函数 | 用途 |
|---|---|
| `ParamTypeToEnum(param)` | Mini.XXX → ScriptParamType 值 |
| `ParamEnumToType(enum)` | ScriptParamType 值 → Mini.XXX |
| `ParamEnumToAIType(enum)` | ScriptParamType → AI 类型字符串 |
| `GetValueType(value, isForbid)` | Lua 值 → ScriptParamType (如果 isForbid 则检查 ForbidDevParamType) |
| `IsValueOfType(type, value, enumDef)` | 验证值匹配类型 |
| `ParamTypeToBlockType(param, itemType)` | Mini.XXX → 可视化代码块信息 |
| `BlockTypeToParamType(type, paramid)` | 可视化代码块 → Mini.XXX |
| `EditParamTypeToBlockType(enum)` | 属性类型 → 块类型 (处理数组) |
| `GetAttributeType(checktype)` | 解包 ArrayScriptParamType (10001 → 1, true) |
| `GetTypeStringByEnum(paramEnum)` | ScriptParamType → 本地化显示名称 |
| `IsCmpKeywords(str)` | 检查字符串是否为保留字 (gameObject, isEnable 等) |

不能用作属性名的保留关键字:
```lua
Keywords = { gameObject = true, __className_ = true, isEnable = true, isValid = true }
```
