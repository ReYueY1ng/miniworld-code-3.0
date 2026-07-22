---
name: miniworld-coding
description: >
  Write Mini World UGC 3.0 game scripts — components, events, data storage, UI, timers, coroutines, and cross-component operations.
  Use when the user asks to write game code, create a component, implement game logic, or work with Mini World APIs.
  Not for updating the type definition library (use miniworld-code-api-update instead).
license: MIT
compatibility: opencode
metadata:
  project: miniworld-code-3.0
  language: Lua
---

# Mini World UGC 3.0 代码编写指南

## 环境

- **运行时**: LuaJIT 2.1 (阉割版)
- 部分标准库被禁用: `rawset`, `require`, `io`, `debug` (保留 traceback，但是返回空字符串), `loadstring`, `loadfile`, `dofile`
- 详细请看 [config.json](./references/config.json) 和 [BaseEnv.lua](./references/library/BaseEnv.lua)

## 通用规则

1. **不要编造不存在的 API** — 如果某个 API 真的不存在，寻找相似功能的替代 API
2. **枚举优先使用 PascalCase 命名** (如 `AbsoluteCampType`)，全大写枚举一般是旧版本
3. **尽量避免使用 `ScriptSupportEvent`** 注册事件

## 组件代码格式

组件是所有游戏逻辑的基本单元，遵循以下格式:

```lua
-- 示例组件
---@class MyComponent: WorldComponent
---@field myNumber number 数字
---@field age number
local MyComponent = {}

-- Component 将以元表的形式附加在 MyComponent 上面，所以你不能对 MyComponent 设置元表

-- 属性定义 (可选)
MyComponent.propertys = {
    -- 完整定义一个变量数字，属性字段为 myNumber
    myNumber = {
        type = Mini.Number, -- 类型 (必须写)
        default = 100, -- 默认值
        displayName = "数字", -- 属性x显示名
        sort = 1, -- 属性排序
        minValue = -1000, -- 最小值
        maxValue = 1000, -- 最大值
        format = "%.0f米", -- 单位，可不填 %.0f 整数, %.1f 一位小数
        style = ComponentUIStyle.NumberSlider, -- 属性控件样式滑动条
        tips = "这是一个脚本组件的数值属性变量",
        stride = 1, -- 步长
        permission = CmpProPermission.Private, -- 设置该属性是私有的，其他组件无法读写，不写则默认是 Public 公开的
        isSave = false, -- 表示不自动存数据，不写默认自动存
    },

    -- 大部分属性类型支持简单定义
    age = 8,
    str = "你好！",
    bool = true,
    color = Mini.Color(255, 0, 0, 255),
}

-- 开放给别的组件访问的函数 (可选)
MyComponent.openFnArgs = {
    myFunction = {
        returnType = Mini.Number,
        displayName = "函数别名",
        params = {"第一个数", Mini.Number, "第二个数", Mini.Number},
    },
}

-- 加法函数
---@param a number 第一个数字
---@param b number 第二个数字
---@return number result 返回数字
function MyComponent:myFunction(a, b)
    return a + b
end

-- 玩家点击方块事件
function MyComponent:OnPlayerClickBlock(e)
    print('OnPlayerClickBlock', e.eventobjid)
end

-- 组件被装载时调用
function MyComponent:OnStart()
    self.myNumber = self:myFunction(self.myNumber, 2)
end

-- 定义了 OnTick 则会有驱动，不需要时尽量不定义
---@param dt integer gametick 1s=20t
function MyComponent:OnTick(dt)
end

-- 当组件被移除
function MyComponent:OnDestroy()
end

-- 返回类型必须是表
return MyComponent
```

## 组件属性完整类型

组件属性支持 13 种 `Mini.*` 类型:

| 类型 | Lua 类型 | 说明 |
|------|----------|------|
| `Mini.Number` | `number` | 数值，支持滑动条/按钮/输入框 |
| `Mini.String` | `string` | 字符串，支持多行和最大长度 |
| `Mini.Bool` | `boolean` | 布尔值 |
| `Mini.Color` | `number/string` | 颜色，16进制或字符串 |
| `Mini.Vec3` | `table` | 三维坐标(x,y,z) |
| `Mini.MobType` | `number/string` | 生物类型 |
| `Mini.Block` | `number/string` | 方块类型 |
| `Mini.Item` | `number/string` | 道具类型 |
| `Mini.Effect` | `number` | 特效类型 |
| `Mini.Picture` | `string` | 图片 |
| `Mini.Buff` | `number/string` | 状态 |
| `Mini.Sound` | `number/string` | 音效 |
| `Mini.Model` | `string` | 外观/模型 |

**注意**: 不能在 `propertys` 外直接定义属性变量（除了 `Mini.Enum` 类型），应在 `OnStart` 中赋值。

详细请看 [SceneTreePropertys.md](./SceneTreePropertys.md)

## openFnArgs 完整参考

组件通过 `openFnArgs` 声明可被跨组件调用的方法。**声明的方法名必须在组件上有对应的 `function` 定义，否则会被框架静默移除。**

### 值的合法形式

值只能是 `true`、`false`、table、或 `{}`（空表）。**不要用 `1`、`"yes"`、`nil` 等其它值。**

```lua
MyComponent.openFnArgs = {
    SomeMethod = true,              -- 仅脚本组件可调用，触发器/编辑器中不可见
    TypedMethod = {                 -- 脚本 + 触发器都能调用，编辑器显示参数槽位
        displayName = "显示名称",    -- string，可选（省略时用方法名）
        params = { ... },           -- 混合数组，可选
        returnType = Mini.Bool,     -- 返回类型，可选
    },
    MinimalMethod = {},             -- 脚本 + 触发器都能调用，无类型信息
}
```

`true` 和 `{}` 的区别：`true` 仅允许脚本组件通过 `GetComponent` 调用，不出现在触发器/编辑器的函数下拉列表中；`{}` 会出现在触发器/编辑器中。

`false` 等同于不声明（无实际效果），不建议使用。

### table 的合法字段

| 字段 | 类型 | 必填 | 说明 |
|------|------|------|------|
| `displayName` | string | 否 | 编辑器 UI 显示名，省略则用方法名 |
| `params` | table | 否 | 参数列表（混合数组，见下文） |
| `returnType` | Mini.* 类型 | 否 | 返回值类型 |
| `itemType` | Mini.* 类型 | 否 | 仅配合 `returnType = Mini.Array` 使用，指定数组元素类型 |

**不要添加其它字段**（如 `sort`、`description`、`default` 等），框架不识别。

### params 混合数组

`params` 是混合数组，包含两类元素：

```lua
params = {
    "第",           -- string: UI 标签占位符，编辑器中显示为提示文字，不参与类型校验
    Mini.Number,    -- Mini.* 类型: 实际参数
    "个材质，颜色：", -- string: UI 标签
    Mini.Color      -- Mini.* 类型: 实际参数
}
```

- **string 元素**：纯 UI 标签，不影响参数校验
- **Mini.* 类型元素**：实际参数类型

### params 和 returnType 的类型限制

**只允许以下类型**（不在列表中的类型会导致该条目被框架移除）：

`Mini.String` `Mini.Bool` `Mini.Number` `Mini.Vec3` `Mini.Color` `Mini.Area` `Mini.CustomMsg` `Mini.Sound` `Mini.Effect` `Mini.Block` `Mini.Item` `Mini.Mob` `Mini.MobType` `Mini.Player` `Mini.Enum` `Mini.Model` `Mini.Picture` `Mini.ModelAction` `Mini.SkeletonPoint` `Mini.Buff` `Mini.Scale` `Mini.Rotation` `Mini.Blueprint` `Mini.ThrowItem` `Mini.DropItem` `Mini.Object` `Mini.Role` `Mini.UiElement` `Mini.UiState` `Mini.Entity` `Mini.EntityType` `Mini.Tag`

**禁止在 params 中使用 `Mini.Array`**（框架校验时 `isIgnoreArray=true`，Array 类型会被拒绝）。

**returnType 也不能用 `Mini.Array`**（除非配合 `itemType` 使用）。

如果一定要使用 `Mini.Array`:

```lua
local function arrayWrapper(propertytype)
    local arrayUserData = Mini.Array(propertytype)
    local newArray = {}
    local meta = {}
    local getcount = 0
    function meta.__index(_, key)
        if key == '__className_' then
            getcount = getcount + 1
            if getcount == 3 then
                return "String"
            else
                return "Array"
            end
        else
            return arrayUserData[key]
        end
    end
    return setmetatable(newArray, meta)
end
```

该函数在框架校验时会把类型更改成 `Mini.String`，校验完后恢复成 `Mini.Array`。

### 常见错误

```lua
-- ❌ 错误：方法名没有对应的 function 定义
MyComponent.openFnArgs = { MissingFn = true }
-- 框架会静默移除 MissingFn 条目

-- ❌ 错误：params 中使用 Mini.Array
MyComponent.openFnArgs = {
    GetItems = { params = { Mini.Array }, returnType = Mini.Array }
}

-- ❌ 错误：值用了非法类型
MyComponent.openFnArgs = { Method = 1 }       -- 应该用 true/table/{}
MyComponent.openFnArgs = { Method = "yes" }    -- 应该用 true
MyComponent.openFnArgs = { Method = false }    -- 等同于不声明，没有意义

-- ❌ 错误：table 中添加了框架不识别的字段
MyComponent.openFnArgs = {
    Method = {
        displayName = "方法",
        sort = 1,               -- 框架不识别
        description = "说明",    -- 框架不识别
    }
}

-- ✅ 正确
MyComponent.openFnArgs = {
    Method = {
        displayName = "方法",
        params = { "角色", Mini.Player, "数量", Mini.Number },
        returnType = Mini.Bool,
    }
}
```

## 组件层次结构

```
Component                          -- 基础组件
├── WorldComponent                 -- 世界组件 (可访问触发器事件)
│   └── UIComponent               -- UI组件
├── BlockComponent                 -- 方块组件
└── ActorComponent                 -- 角色组件
    ├── MobComponent              -- 生物组件
    ├── PlayerComponent           -- 玩家组件
    ├── EntityComponent           -- 实体组件
    ├── InstantaneousBuffComponent -- 瞬时效果组件
    └── ContinuousBuffComponent   -- 持续效果组件
```

## 对象层次结构

```
Object                          -- 基本对象
├── WorldObject                 -- 世界对象
│   └── UIObject               -- UI对象
├── BlockObject                 -- 方块对象
└── ActorObject                 -- 角色对象(可销毁)
    ├── PlayerObject           -- 玩家对象
    ├── EntityObject           -- 实体对象
    └── MobObject              -- 生物对象
```

### 不同对象类型的能力限制

| 对象类型 | 触发器事件 | 说明 |
|---------|-----------|------|
| 世界对象(WorldObject) | ✅ 可用 | 可监听全局游戏事件 |
| UI对象(UIObject) | ✅ 可用 | 可监听全局游戏事件 |
| 方块对象(BlockObject) | ❌ 不可用 | 只能通过位置操作方块，同类方块共享一个实例 |
| 角色对象(ActorObject) | ❌ 不可用 | 只能使用个体对象事件(ObjectEvent) |
| 道具 | ❌ 不支持挂组件 | 只能使用各种自定义效果 |

**特别注意**:
- **UI对象**: 每个 UI 工程只有一个实例，每个玩家没有独立实例，组件上需要根据玩家去操作
- **方块对象**: 方块并没有每个方块都独立实例化，一个类别只实例化一个

## 事件系统三层架构

事件分为三层：

### 1. 触发器事件 (TriggerEvent) — 全局游戏事件
```lua
-- 只能在 WorldComponent/PlayerComponent 中使用
self:AddTriggerEvent(TriggerEvent.PlayerClickBlock, self.OnClick)
```

### 2. 对象事件 (ObjectEvent) — 特定对象的事件
```lua
-- 所有组件都可以使用
self:AddEvent(ObjectEvent.ObjectDie, self.OnObjectDie)
```

### 3. 自定义事件 — 组件间通信
```lua
-- 广播事件（所有组件都能收到）
Component:PushCustomEvent("MyMsg", data)
Component:AddCustomEvent("MyMsg", handler)

-- 对象事件（只有同对象的组件能收到）
Component:PushEvent("MyEvent", data)
Component:AddEvent("MyEvent", handler)
```

### 事件过滤参数
```lua
-- 只监听玩家按 Q 键
self:AddEvent(ObjectEvent.PlayerInputKeyDown, self.OnKey, nil, KeyCode.Q)

-- 只监听血量变化
self:AddEvent(ObjectEvent.ObjectChangeAttr, self.OnAttr, nil, RoleAttr.CurHp)
```

## 定时器系统

```lua
-- 延迟执行
self:DoTaskInTime(function(self)
    print("1秒后执行")
end, 1)

-- 周期执行
local task = self:DoPeriodicTask(function(self)
    print("每0.5秒执行")
end, 0.5, 0, 10)  -- (回调, 间隔, 延迟, 次数)

-- Task 对象方法
task:Pause()   -- 暂停
task:Resume()  -- 恢复
task:Cancel()  -- 取消
```

## 协程支持

```lua
self:ThreadWork(function(self)
    print("协程开始")
    self:ThreadWait(1)  -- 等待1秒
    print("继续执行")
end)
```

## 环境限制细节

```lua
-- 被禁用/限制的标准库
rawset = nil           -- 完全禁用
newproxy = nil         -- 完全禁用
io = {}                -- 完全禁用
package = {}           -- 完全禁用
debug = { traceback }  -- 只保留 traceback

-- os 被限制
os.time()    -- 可用
os.date()    -- 可用
os.timeMs()  -- 可用 (自定义，毫秒时间戳)

-- string 常用函数保留
string.len, find, match, gmatch, gsub, format
string.byte, char, sub, rep, reverse, lower, upper
string.split, Trim, startswith, endswith, Contains, IsBlank

-- table 常用函数保留
table.getn, maxn, insert, remove, concat, sort
```

## 自定义全局函数

```lua
-- JSON 库
json.encode(table)      -- table → json string
json.decode(jsonString) -- json string → table

-- 类系统
Class(classname, super, issingle)  -- 定义类
Instance(classname)                -- 创建实例
GetInst(classname)                 -- 获取单例

-- 数据操作
copy_table(table)     -- 深拷贝
GetWorld()            -- 获取世界对象
GetModId()            -- 获取MOD ID

-- 调试
print(...)            -- 打印到调试页面
printError(...)       -- 打印错误
```

## Global API vs Trigger API 区别

```lua
-- Global API (全局可用，坐标分开传)
World:SpawnCreature(x, y, z, mobid, num)
Block:ReplaceBlock(blockid, x, y, z, face, color)

-- Trigger API (触发器内可用，坐标合并为pos)
Trigger.World:SpawnCreature(pos, mobid, num)
Trigger.World:XyzToPos(x, y, z)  -- 辅助函数，创建pos
```

**优先使用 Global API。**

## 数据存储系统

详细请看 [Data.lua](references/library/Data.lua)

### 数据限制

| 数据类型 | 数量限制 | 存储限制 |
|---------|---------|---------|
| 全局变量 | 300 | — |
| 玩家变量 | 300 | — |
| 玩家云变量 | 100 | — |
| 单玩家总存储 | — | 64KB |
| 全局云排行榜变量 | 15 | — |
| 全局云KV表变量 | 10 | — |
| 本地排行榜 | — | 100 |
| 云排行榜 | — | 1000 (每次最多获取 100 名) |
| 二维表最大行数 | 1999 | — |
| 二维表最大列数 | 50 | — |
| 二维表全局变量 | — | 512KB |
| 二维表玩家变量 | — | 102.4KB |

### 变量数据 (Data)
```lua
Data:SetValue(varId, playerId, value)   -- 设置变量 (全局变量playerId传nil)
Data:GetValue(varId, playerId)          -- 获取变量
Data:IncreasesValue(varId, playerId, value) -- 数值增加
```

### KV 表 & 排行榜 (Data.Map)

**注意**: 3.0 中 KV 和排行榜**仅支持 Data.Map 接口**，不再支持 2.0 的 CloudSever 接口，禁止混用，会造成数据丢失。

```lua
-- 设置/获取 (回调方式)
Data.Map:SetValueAndCallBack(varId, playerId, key, value, callback)
Data.Map:GetValueAndCallBack(varId, playerId, key, callback)

-- 设置/获取 (阻塞方式)
Data.Map:SetValueAndBlock(varId, playerId, key, value)
Data.Map:GetValueAndBlock(varId, playerId, key)

-- 删除
Data.Map:RemoveValueAndCallBack(varId, playerId, key, callback)
Data.Map:RemoveValueAndBlock(varId, playerId, key)

-- 全局并发读写 (安全更新，多服同时写入同一key时保证唯一性)
Data.Map:UpdateValueAndCallback(varId, playerId, key, callback)

-- 排行榜专用
Data.Map:GetIndexValueAndCallback(varId, playerId, index, ascending, callback)
Data.Map:GetIndexValueAndBlock(varId, playerId, index, ascending)
Data.Map:GetNumValuesAndCallback(varId, playerId, num, ascending, callback)
Data.Map:GetRangeValuesAndCallback(varId, playerId, min, max, ascending, pagesize, callback)
Data.Map:SetRankValueAndBlock(varId, playerId, key, value, extendinfo)
Data.Map:IncreasesRankValueAndBlock(varId, playerId, key, value, extendinfo)
Data.Map:IncreasesRankValueAndCallback(varId, playerId, key, value, extendinfo, callback)
Data.Map:ClearData(varId, playerId)
```

### 请求频率限制 (QPM)

| 操作类型 | 每分钟上限 |
|---------|-----------|
| 设置类 (Set/Remove/Update) | 30 + 玩家数 × 10 |
| 获取类 (Get) | 30 + 玩家数 × 10 |
| 排行榜类 (GetIndex/GetNum/GetRange/Clear) | 5 + 玩家数 × 2 |

**最佳实践**:
- 相同 key 的 set 操作间隔 ≥ 6 秒
- 避免绑定玩家行走、碰撞等高频率行为触发实时读写
- 排行榜建议展示前 30 名，最多前 100 名
- 配置数据不要存在 KV 表中，放脚本或全局表里

## 组件函数完整列表

```lua
-- 对象相关
self:GetGameObject()       -- 获取该组件挂载的对象实例
self:GetGameObjectId()     -- 获取组件挂载的对象实例id
self:IsValid()             -- 获取组件是否有效

-- 组件管理
self:AddComponent("组件id")
self:RemoveComponent("组件id")
self:GetComponent("组件id")

-- 自定义事件（广播，所有组件可收）
self:PushCustomEvent("消息id", ...)
self:PushCustomEventSync("消息id", ...)
self:AddCustomEvent("消息id", handler)
self:RemoveCustomEvent("消息id")

-- 对象事件（同对象组件可收）
self:PushEvent("事件类型", ...)
self:PushEventSync("事件类型", ...)
self:AddEvent(ObjectEvent.XXX, handler)
self:RemoveEvent(ObjectEvent.XXX)

-- 触发器事件（WorldComponent/PlayerComponent 可用）
self:AddTriggerEvent(TriggerEvent.XXX, handler, filter1?, filter2?)
self:RemoveTriggerEvent(TriggerEvent.XXX)

-- 定时器
self:DoTaskInTime(handler, seconds)
self:DoPeriodicTask(handler, interval, delay?, count?)
self:ClearAllTask()

-- 事件开关
self:SetEventIsEnable(handler, false)

-- 协程
self:ThreadWork(handler)
self:ThreadWait(seconds)

-- 云服消息
self:PushCloudServerMsg("消息类型", ...)
self:AddCloudSeverEvent("事件类型", handler)
self:RemoveCloudSeverEvent("消息类型")
```

## 组件互相操作

### 同对象操作
```lua
-- 获取组件
local cmpA = self:GetComponent("组件id") --[[@as A]]

-- 调用函数
local result = cmpA:Add(1, 2)

-- 读写属性
local age = cmpA.age
cmpA.age = 123
```

### 跨对象操作
```lua
-- 获取一般对象
local obj = GameObject:FindObject("对象id")

-- 获取世界对象
local world = GetWorld()

-- 获取组件
local cmpA = world:GetComponent("组件id")
if cmpA then
    local result = cmpA:Add(1, 2)
end
```

### 类型标注写法
```lua
---@class A: WorldComponent
---@field test number
local A = {}
A.propertys = { test = 1 }
A.openFnArgs = { doSomething = true }
function A:doSomething() end
return A

---@class B: WorldComponent
local B = {}
---@type A
local A
function B:OnStart()
    -- 推荐: 适用于任意情况（包括不知道组件id）
    A = self:GetComponent('cxxxxxxxxxxxxxxxx') --[[@as A]]
    A:doSomething()
end
return B
```

## 触发器脚本交互

### 脚本发送广播给触发器
```lua
self:PushCustomEvent("具体广播ID", 2, 3)
```

### 脚本监听触发器发出的广播
```lua
function Script:OnStart()
    self:AddCustomEvent("具体广播ID", self.OnCustomEvent)
end
function Script:OnCustomEvent(event, arg1, arg2)
    print("消息名:", event.eventType)
end
```

### 脚本调用触发器自定义函数
```lua
local obj = GetWorld()
local cmp = obj:GetComponent("具体组件ID")
if cmp then
    local ret = cmp:具体自定义函数名(2, 3)
end
```

### 触发器调用脚本开放函数
```lua
Script.openFnArgs = {
    Add = {
        returnType = Mini.Number,
        displayName = "脚本加法",
        params = {"第一个数", Mini.Number, "第二个数", Mini.Number},
    },
}
function Script:Add(a, b)
    return a + b
end
```

## 道具实例 (Item Instance)

### 创建道具实例
```lua
Backpack:CreateItemInstInBackpack(uin, itemId, num)
Backpack:CreateGunInBackpack(uin, gunItemId)
Item:CreateItemInstInWorld(x, y, z, itemId, num)
```

### 获取道具实例
```lua
Actor:GetDropItemInstanceId(dropObjId)
Backpack:GetAllBackPackInstanceIds(uin)
Backpack:GetInstIdByGridIndex(uin, gridIndex)
Item:GetItemIdByInstanceId(instanceId)
```

### 修改道具实例属性
```lua
Item:ModifyGunAttribute(instanceId, attrId, value)
Item:AddSubModelPart(instanceId, partId)
Item:SetStringCustomData(instanceId, key, value)
Item:SetNumberCustomData(instanceId, key, value)
Item:GetStringCustomData(instanceId, key)
Item:GetNumberCustomData(instanceId, key)
```

**注意**: 修改格子数据后，需要等待一小会(约0.5秒)再通知客机刷新界面。

## 其他模块

### Timeline (剧情动画)
```lua
Timeline:PlayForAll(timelineId)
Timeline:PlayForPlayer(uin, id, reverse?, toEnd?)
Timeline:Pause(uin, timelineId)
Timeline:Resume(uin, timelineId)
Timeline:SkipForPlayer(uin)
Timeline:GetPlayerState(uin, timelineId)
```

### Emitter (粒子发射器)
```lua
Emitter:EmitByPosition(pos, emitId, shooter?)
Emitter:EmitByShooter(objId, emitId)
```

### 云服 (Cloud Server)
```lua
CloudSever:GetRoomID()
CloudSever:GetRoomCategory()
CloudSever:SetRoomCategory(cat)
CloudSever:TransmitToCurMapCategoryRoom(playerids, categorys)
CloudSever:TransmitToCategoryRoom(playerids, mapid, categorys, msg?, notFollow?)
```

## UI 相关

### UI 动效 ID 速查
```
显示: 10001 渐显    10002 放大显示    10003 缩小显示
隐藏: 20001 渐隐    20002 放大隐藏    20003 缩小隐藏
循环: 30001 颤抖    30002 跳动    30003 心跳
     30004 摇摆    30005 旋转    30006 翻转
     30007 顺时针扫描 30008 逆时针扫描 30009 闪烁
文字: 40001 打字机
```

### UI 克隆元件
```lua
local cloneId = CustomUI:CloneElement(playerUin, uiId, elementId)
-- 克隆体ID格式: "原元件ID#clone1" (每克隆一次+1)
```

## ID 格式速查

```
UI ID: 7664495871585643737-132458
UI 元件 ID: 7664495871585643737-132458_1
脚本组件 ID: c7664495880175578329132459 (前缀c + 25位数字)
触发器组件 ID: s7663834541111340249255620 (前缀s + 25位数字)
变量 ID: v7664496812183481561132464 (前缀v + 25位数字)
模组 ID: bbfcd673-d092-4829-9e13-d95e442a4823 (UUID)
```

## 常见问题与技巧

- 缓存的其他组件需要先调用 `IsValid()` 判断是否有效，避免操作已销毁的组件
- 组件属性变量（除了 `Mini.Enum` 类型）不能在 `propertys` 外直接定义，应在 `OnStart` 中赋值
- `OnTick` 只在定义时才会启用驱动，不需要时尽量不定义以提高效率
- 只有通过 `openFnArgs` 配置的函数才能被其他组件访问
- 修改格子数据后，需要等待约 0.5 秒再通知客机刷新界面

## 完整 API 参考

完整的 API 列表请参阅 [library](references/library/) 下的 Lua 文件。

## 相关 Skill

- **miniworld-code-api-update**: 用于更新 API 类型定义库（添加新 API、枚举等）
