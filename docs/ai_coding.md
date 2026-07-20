# 迷你世界 UGC 3.0 代码编写文档

该文档是为编写代码而准备的, 如果你想要更新 api 库, 请移步 miniworld-code-api-update skill.

完整的 API 列表请参阅 [library](../library/) 下的 lua 文件.

## 环境

LuaJIT 2.1, 但是阉割了部分基础函数与库: rawset, require, io, debug, loadstring, loadfile, dofile, 等等.

详细请看 [config.json](../config.json) [BaseEnv.lua](../library/BaseEnv.lua)

## 注意事项

1. 不要编造不存在的 API，如果该 API 真的不存在，可以寻找相似功能的 API
2. 枚举尽量使用以帕斯卡命名法命名的枚举 (`AbsoluteCampType`), 全大写的枚举一般都是旧版本的
3. 尽量不要使用 `ScriptSupportEvent` 注册事件

## 代码格式

代码遵循 LuaLS 规范, 示例代码:

```lua
-- 示例组件
---@class MyComponent: WorldComponent
---@field myNumber number 数字
---@field age number
local MyComponent = {}

-- Component 将以元表的形式附加在 MyComponent 上面，所以你不能对 MyComponent 设置元表

-- 属性定义
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

    -- 大部分属性类型支持简单定义, 比如：
    age = 8,
    str = "你好！",
    bool = true,
    color = Mini.Color(255, 0, 0, 255), -- 红色
}

-- 注意: 不能直接这样定义组件属性变量 (除了 Mini.Enum 类型)，编辑器会报错，应该在 OnStart 定义
-- Script.myString = 'gugugu'

-- 开放给别的组件访问的函数
MyComponent.openFnArgs = {
    -- 函数开放配置示例
    myFunction = {
        returnType = Mini.Number, -- 返回值（不填则为无返回值）
        displayName = "函数别名", -- 触发器上显示的名称（不填缺省则显示函数名 myFunction）
        params = {Mini.Number, Mini.Number}, -- 参数列表类型（不填则为无参数）
    },

    -- 只想支持其他脚本组件访问，不需要支持触发器的简单写法可以直接配置
    -- myFunction = true,

    -- 支持其他脚本、触发器访问的最小配置
    -- myFunction = {}
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
    self:RemoveTriggerEvent(TriggerEvent.PlayerClickBlock, self.OnPlayerClickBlock)
end

-- 组件被装载时调用
function MyComponent:OnStart()
    -- 在 property 里面定义的 myNumber 会自动注入组件
    self.myNumber = self:myFunction(self.myNumber, 2) -- 更改的值也可以被其他组件读到
    self.myString = 'kukuru'                          -- 不能被其他组件读到

    self:AddTriggerEvent(TriggerEvent.PlayerClickBlock, self.OnPlayerClickBlock)
end

-- 定义了 OnTick 则会有驱动, 不需要时候尽量不定义, 提高效率
-- 定时逻辑可使用定时器代替
---@param dt integer gametick 1s=20t
function MyComponent:OnTick(dt)

end

-- 当组件被移除
function MyComponent:OnDestroy()

end

-- 返回类型必须是表
return MyComponent
```

其中 `MyComponent` 可以更换为你想取的名字.

### 组件属性完整类型

组件属性支持 13 种 `Mini.*` 类型，以下是完整列表及配置示例：

| 属性类型 | Lua 类型 | 说明 |
|---------|----------|------|
| `Mini.Number` | `number` | 数值，支持滑动条/按钮/输入框三种样式 |
| `Mini.String` | `string` | 字符串，支持多行和最大长度限制 |
| `Mini.Bool` | `boolean` | 布尔值 |
| `Mini.Color` | `number/string` | 颜色，16进制或字符串 |
| `Mini.Vec3` | `table` | 三维坐标(x,y,z)，支持每个轴单独配置 |
| `Mini.MobType` | `number/string` | 生物类型 |
| `Mini.Block` | `number/string` | 方块类型 |
| `Mini.Item` | `number/string` | 道具类型 |
| `Mini.Effect` | `number` | 特效类型 |
| `Mini.Picture` | `string` | 图片 |
| `Mini.Buff` | `number/string` | 状态 |
| `Mini.Sound` | `number/string` | 音效 |
| `Mini.Model` | `string` | 外观/模型 |

```lua
-- Mini.Number - 数值 (三种样式)
{
    type = Mini.Number,
    default = 100,
    displayName = "数字",
    sort = 1,
    minValue = -1000,   -- 最小值
    maxValue = 1000,    -- 最大值
    format = "%.0f米",   -- 单位(%.0f整数, %.1f一位小数)
    style = ComponentUIStyle.NumberSlider,  -- 滑动条
    -- style = ComponentUIStyle.NumberButton,    -- 按钮
    -- style = ComponentUIStyle.NumberOnlyInput, -- 输入框
    stride = 1,          -- 步长
    permission = CmpProPermission.Private,  -- 私有属性
    isSave = false,      -- 不自动存
    tips = "属性作用提示",
}

-- Mini.String - 字符串
{
    type = Mini.String,
    default = "您好！",
    displayName = "字符串",
    multiLine = false,   -- 是否多行
    maxLength = 10,      -- 最多10个字符
}

-- Mini.Bool - 布尔值
{
    type = Mini.Bool,
    default = true,
    displayName = "布尔值",
}

-- Mini.Color - 颜色
{
    type = Mini.Color,
    default = 0xFFFFFF,  -- 或 "255,255,255"
    displayName = "颜色",
}

-- Mini.Vec3 - 三维坐标
{
    type = Mini.Vec3,
    default = Mini.Vec3(0, 0, 0),
    displayName = "位置",
    -- displayNames = {"yaw", "pitch", "roll"},  -- 单个字段别名
    -- minValue = {-10000, -20000, -30000},      -- 每个轴单独最小值
    -- maxValue = {10000, 20000, 30000},         -- 每个轴单独最大值
    -- format = "%.2f",
}

-- Mini.MobType / Mini.Block / Mini.Item / Mini.Effect / Mini.Buff / Mini.Sound
{
    type = Mini.MobType,  -- 生物类型
    default = 3400,
    displayName = "生物类型",
}

-- Mini.Picture - 图片
{
    type = Mini.Picture,
    default = "0_10001",
    displayName = "图片",
}

-- Mini.Model - 外观/模型
{
    type = Mini.Model,
    default = "mob_3510",
    displayName = "模型",
}
```

---

## 补充概念

### 组件层次结构

组件采用继承体系，不同层级的组件拥有不同的能力。

```lua
-- 组件继承体系
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

### 事件系统三层架构

事件分为三层：触发器事件、对象事件和自定义事件。

```lua
--1. 触发器事件 (TriggerEvent) - 全局游戏事件
-- 只能在 WorldComponent/PlayerComponent 中使用
self:AddTriggerEvent(TriggerEvent.PlayerClickBlock, self.OnClick)

--2. 对象事件 (ObjectEvent) - 特定对象的事件
-- 所有组件都可以使用
self:AddEvent(ObjectEvent.ObjectDie, self.OnObjectDie)

--3. 自定义事件 - 组件间通信
-- 广播事件（所有组件都能收到）
Component:PushCustomEvent("MyMsg", data)
Component:AddCustomEvent("MyMsg", handler)

-- 对象事件（只有同对象的组件能收到）
Component:PushEvent("MyEvent", data)
Component:AddEvent("MyEvent", handler)
```

### 定时器系统

使用 `DoTaskInTime` 和 `DoPeriodicTask` 进行定时控制。

```lua
-- 延迟执行
self:DoTaskInTime(function(self)
    print("1秒后执行")
end,1)

-- 周期执行
local task = self:DoPeriodicTask(function(self)
    print("每0.5秒执行")
end,0.5,0,10)  -- (回调, 间隔, 延迟, 次数)

-- Task 对象方法
task:Pause()   -- 暂停
task:Resume()  -- 恢复
task:Cancel()  -- 取消
```

### 环境限制细节

LuaJIT 环境中部分标准库被禁用或限制。

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
-- os.execute, os.remove 等不可用

-- string 被限制，但保留了常用函数
string.len, find, match, gmatch, gsub, format
string.byte, char, sub, rep, reverse, lower, upper
string.split, Trim, startswith, endswith, Contains, IsBlank

-- table 被限制
table.getn, maxn, insert, remove, concat, sort
-- table.clear, table.new 不可用 (已在 config.json 禁用)
```

### 自定义全局函数

引擎提供了 JSON、类系统、数据操作等全局函数。

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

### Global API vs Trigger API 区别

全局 API 和触发器 API 的参数传递方式不同。优先使用全局 API。

```lua
-- Global API (全局可用，坐标分开传)
World:SpawnCreature(x, y, z, mobid, num)
Block:ReplaceBlock(blockid, x, y, z, face, color)

-- Trigger API (触发器内可用，坐标合并为pos)
Trigger.World:SpawnCreature(pos, mobid, num)
Trigger.World:XyzToPos(x, y, z)  -- 辅助函数，创建pos
```

### 协程支持

通过 `ThreadWork` 启动协程，支持 `ThreadWait` 等待。

```lua
-- 启动协程
self:ThreadWork(function(self)
    print("协程开始")
    print("1秒后继续")
    self:ThreadWait(1)  -- 等待1秒
    print("继续执行")
end)
```

### 数据存储系统

通过 Data 模块进行变量、数组、二维表和 KV 表的数据存取。

```lua
-- 变量数据 (Data)
Data:SetData(key, value)     -- 设置变量
Data:GetData(key)            -- 获取变量

-- 组数据 (Data.Array)
Data.Array:SetValue(varId, value, index)    -- 按索引设置
Data.Array:GetValue(varId, index)           -- 按索引获取
Data.Array:GetAllValue(varId)               -- 获取所有值
Data.Array:GetLength(varId)                 -- 获取数组长度

-- 二维表 (Data.Table)
Data.Table:GetValue(varId, row, col)       -- 获取指定行列的值
Data.Table:SetValue(varId, row, col, value) -- 设置指定行列的值
Data.Table:GetRowCount(varId)              -- 获取总行数
Data.Table:AddRow(varId, ...)              -- 添加一行数据
Data.Table:InsertRow(varId, row, ...)      -- 插入一行到指定位置
Data.Table:RemoveRow(varId, row)           -- 删除指定行
Data.Table:ReplaceRow(varId, row, col, value) -- 替换指定行列的值
Data.Table:Clear(varId)                    -- 清空所有数据
Data.Table:GetColumnData(varId, col)       -- 获取整列数据(返回数组)
Data.Table:FindRowByColumn(varId, col, value) -- 查找某列值为value的行号
```

#### KV 表 & 排行榜 (Data.Map)

KV 表和排行榜都通过 `Data.Map` 接口操作，但用途不同：

| 特性 | KV 表 | 排行榜 |
|------|-------|--------|
| 数据类型 | 任意类型 (number/string/table) | 仅数值 (正整数) |
| 排序 | 无序 | 自动按值排序 |
| 数据量 | 不限 | 最多 10000 名 |
| 并发 | 支持 UpdateValueAndCallback 安全并发 | 普通 set/get |

**注意**：3.0 中 KV 和排行榜**仅支持 Data.Map 接口**，不再支持 2.0 的 CloudSever 接口，禁止混用，会造成数据丢失。

```lua
-- 设置/获取 (回调方式)
Data.Map:SetValueAndCallBack(varId, key, value, callback?)  -- 设置
Data.Map:GetValueAndCallBack(varId, key, callback)          -- 获取

-- 设置/获取 (阻塞方式)
Data.Map:SetValueAndBlock(varId, key, value)                -- 阻塞设置
Data.Map:GetValueAndBlock(varId, key)                       -- 阻塞获取

-- 删除
Data.Map:RemoveValueAndCallBack(varId, key, callback)       -- 回调删除
Data.Map:RemoveValueAndBlock(varId, key)                    -- 阻塞删除

-- 全局并发读写 (安全更新，多服同时写入同一key时保证唯一性)
Data.Map:UpdateValueAndCallback(varId, playerId, key, callback)

-- 排行榜专用
Data.Map:GetIndexValueAndCallback(varId, index, callback)   -- 获取指定排名
Data.Map:GetIndexValueAndBlock(varId, index)                -- 阻塞获取指定排名
Data.Map:GetNumValuesAndCallback(varId, num, callback)      -- 获取前N个值
Data.Map:GetRangeValuesAndCallback(varId, min, max, callback) -- 获取区间值
Data.Map:SetRankValueAndBlock(varId, key, value)            -- 阻塞设置排行榜值
Data.Map:ClearData(varId)                                   -- 清空所有数据
```

**排行榜排名说明**：`GetIndexValueAndBlock` 的 `index` 参数，正数=升序，负数=降序。

**`UpdateValueAndCallback` 全局并发更新**：用于多玩家同时读写同一 key 时保证数据唯一性（如宗门总人数、拍卖行库存）。底层自动重试直到成功：

```lua
local function GlobalKVCallback(code, key, value)
    if code == ErrorCode.KV_UPDATE_SET then
        -- 返回需要更新设置的值
        value = value or {}
        value.count = (value.count or 0) + 1
        return json.encode(value)
    elseif code == ErrorCode.KV_UPDATE_GET then
        print("当前最新值:", value)
    elseif code == ErrorCode.OK then
        print("更新完成")
    end
end
Data.Map:UpdateValueAndCallback("GlobalKV", nil, "myKey", GlobalKVCallback)
```

**注意**：此接口只在云服有效，单机/联机无法测试。Callback 至少调用两次，首次 `code == KV_UPDATE_SET` 用于设置数值。

#### 请求频率限制 (QPM)

| 操作类型 | 每分钟上限 | 说明 |
|---------|-----------|------|
| 设置类 (Set/Remove/Update) | 30 + 玩家数 × 10 | 所有设置函数共享此限制 |
| 获取类 (Get) | 30 + 玩家数 × 10 | 所有获取函数共享此限制 |
| 排行榜类 (GetIndex/GetNum/GetRange/Clear) | 5 + 玩家数 × 2 | 所有排行榜函数共享此限制 |

**最佳实践**：
- 相同 key 的 set 操作间隔 ≥ 6 秒
- 避免绑定玩家行走、碰撞等高频率行为触发实时读写
- 给数据设置 `needSave` 标签，数据变化时才 set
- 排行榜建议展示前 30 名，最多前 100 名，参与人数越多性能越差
- 低于排行榜最后一名的数据无需 set 操作
- 配置数据不要存在 KV 表中，放脚本或全局表里

### 组件函数完整列表

组件上所有可用的 API 函数：

```lua
-- 对象相关
self:GetGameObject()       -- 获取该组件挂载的对象实例
self:GetGameObjectId()     -- 获取组件挂载的对象实例id
self:IsValid()             -- 获取组件是否有效

-- 组件管理
self:AddComponent("组件id")    -- 在对象上添加指定组件
self:RemoveComponent("组件id") -- 删除对象上的指定组件
self:GetComponent("组件id")    -- 获取对象上的指定组件

-- 自定义事件（广播，所有组件可收）
self:PushCustomEvent("消息id", ...)      -- 发送自定义消息(异步)
self:PushCustomEventSync("消息id", ...)  -- 发送自定义消息(同步)
self:AddCustomEvent("消息id", handler)   -- 监听自定义消息
self:RemoveCustomEvent("消息id")         -- 移除自定义事件监听

-- 对象事件（同对象组件可收）
self:PushEvent("事件类型", ...)      -- 发送对象事件(异步)
self:PushEventSync("事件类型", ...)  -- 发送对象事件(同步)
self:AddEvent(ObjectEvent.XXX, handler)   -- 监听对象事件
self:RemoveEvent(ObjectEvent.XXX)         -- 移除对象事件监听

-- 触发器事件（WorldComponent/PlayerComponent 可用）
self:AddTriggerEvent(TriggerEvent.XXX, handler, filter1?, filter2?)    -- 添加触发器事件
self:RemoveTriggerEvent(TriggerEvent.XXX)                              -- 移除触发器事件

-- 定时器
self:DoTaskInTime(handler, seconds)          -- 延迟执行
self:DoPeriodicTask(handler, interval, delay?, count?)  -- 周期执行
self:ClearAllTask()                          -- 清除所有定时器

-- 事件开关
self:SetEventIsEnable(handler, false)  -- 禁用事件(不删除监听)

-- 协程
self:ThreadWork(handler)  -- 启动新协程
self:ThreadWait(seconds)  -- 协程等待

-- 云服消息
self:PushCloudServerMsg("消息类型", ...)   -- 发送云服广播(异步)
self:AddCloudSeverEvent("事件类型", handler) -- 添加云服消息监听
self:RemoveCloudSeverEvent("消息类型")      -- 移除云服消息监听
```

**事件过滤参数**：`AddTriggerEvent` 和 `AddEvent` 支持传入过滤参数，只监听特定条件的事件：

```lua
-- 只监听玩家按 Q 键
self:AddEvent(ObjectEvent.PlayerInputKeyDown, self.OnKey, nil, KeyCode.Q)

-- 只监听血量变化
self:AddEvent(ObjectEvent.ObjectChangeAttr, self.OnAttr, nil, RoleAttr.CurHp)

-- 只监听特定区域进入事件
self:AddTriggerEvent(TriggerEvent.PlayerAreaIn, self.OnAreaIn, 4297367315)

-- 只监听特定 UI 按钮点击
self:AddTriggerEvent(TriggerEvent.UIButtonClick, self.OnBtnClick, "UI元件ID")
```

### 触发器脚本交互

脚本与触发器可以**双向调用**：

#### 脚本发送广播消息给触发器

```lua
-- 1. 在触发器中新建广播消息，添加执行逻辑
-- 2. 脚本中发送广播
self:PushCustomEvent("具体广播ID", 2, 3)  -- 广播ID需要替换
```

#### 脚本监听触发器发出的广播

```lua
function Script:OnStart()
    self:AddCustomEvent("具体广播ID", self.OnCustomEvent)
end

function Script:OnCustomEvent(event, arg1, arg2)
    print("消息名:", event.eventType)
    print("参数1:", arg1)
    print("参数2:", arg2)
end
```

#### 脚本调用触发器自定义函数

```lua
function Script:OnStart()
    -- 获取触发器组件
    local obj = self  -- 同对象
    -- local obj = GetWorld()  -- 如果触发器挂在世界对象上

    local cmp = obj:GetComponent("具体组件ID")
    if cmp then
        local ret = cmp:具体自定义函数名(2, 3)
    end
end
```

#### 触发器调用脚本开放函数

通过 `openFnArgs` 配置暴露给触发器的函数：

```lua
Script.openFnArgs = {
    Add = {
        returnType = Mini.Number,
        displayName = "脚本加法",
        params = {Mini.Number, Mini.Number},
    },
    SpawnMob = {
        displayName = "生物生成",
        params = {Mini.Vec3, Mini.MobType, Mini.Number},
    },
}

function Script:Add(a, b)
    return a + b
end

function Script:SpawnMob(pos, monstertype, num)
    GameObject:CreatePrefab(ObjType.Mob, monstertype, pos.x, pos.y, pos.z, num)
end
```

### 组件互相操作

组件之间可以通过 `GetComponent` 互相引用和调用函数、读写属性。

#### 同对象操作

同一对象上的组件可以直接通过 `self:GetComponent()` 获取：

```lua
-- 组件B 获取同对象上的组件A
local cmpA = self:GetComponent("组件id")  -- 组件ID通过编辑器ID库→组件插入

-- 调用组件A通过 openFnArgs 暴露的函数
local result = cmpA:Add(1, 2)

-- 读写组件A的属性
local age = cmpA.age     -- 读取
cmpA.age = 123           -- 写入
```

#### 跨对象操作

```lua
-- 获取一般对象
local obj = GameObject:FindObject("对象id")

-- 获取世界对象
local world = GetWorld()

-- 获取对象上的组件
local cmpA = world:GetComponent("组件id")
if cmpA then
    local result = cmpA:Add(1, 2)
end
```

**注意**：只有通过 `openFnArgs` 配置的函数才能被其他组件访问。如果只想让其他脚本组件访问（不需要触发器支持），可以简写为 `Add = true`。

代码规范:

```lua
---@class A: WorldComponent
---@field test number
local A = {}

A.propertys = {
    test = 1
}

A.openFnArgs = {
    doSomething = true
}

function A:doSomething()
end

-- 第二种写法需要写
---@class cdddddddddddddddd: A

return A
```

```lua
---@class B: WorldComponent
local B = {}

---@type A
local A

function B:OnStart()
    -- 推荐第一种写法，适用于任意情况（包括不知道组件id）
    A = self:GetComponent('cxxxxxxxxxxxxxxxx') --[[@as A]]
    A:doSomething()
    -- 第二种写法，只有知道组件id才能使用，需要在 A.lua 写上 class cdddddddddddddddd
    ---@type A
    A = self:GetComponent('cdddddddddddddddd')
    A.test = 2
end

return B
```

### 对象体系 (Object)

除了组件层次结构，游戏还有**对象层次结构**：

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

对象常用方法：
```lua
object:GetId()          -- 获取对象实例id
object:GetObjType()     -- 获取对象类型(ObjType枚举)
object:IsValid()        -- 对象是否有效
object:AddComponent()   -- 添加组件
object:GetComponent()   -- 获取组件
object:RemoveComponent() -- 删除组件
actorObject:Destroy(kill?)  -- 销毁对象(生物可传true杀死)
```

#### 不同对象类型的能力限制

| 对象类型 | 触发器事件 | 说明 |
|---------|-----------|------|
| 世界对象(WorldObject) | ✅ 可用 | 可以监听全局游戏事件 |
| UI对象(UIObject) | ✅ 可用 | 可以监听全局游戏事件 |
| 方块对象(BlockObject) | ❌ 不可用 | 只能通过位置操作方块，同类方块共享一个实例 |
| 角色对象(ActorObject) | ❌ 不可用 | 只能使用个体对象事件(ObjectEvent) |
| 道具 | ❌ 不支持挂组件 | 只能使用各种自定义效果 |

**特别注意**：
- **UI对象**：每个 UI 工程只有一个实例，每个玩家没有独立实例，组件上需要根据玩家去操作
- **方块对象**：方块并没有每个方块都独立实例化，一个类别只实例化一个

### 道具实例 (Item Instance)

道具实例是存在于背包格子上的**独立数据对象**，可以从道具模板创建并独立修改属性。

#### 创建道具实例

```lua
-- 在玩家背包创建道具实例
Backpack:CreateItemInstInBackpack(uin, itemId, num)
Backpack:CreateGunInBackpack(uin, gunItemId)  -- 枪械实例

-- 在世界中创建掉落物
Item:CreateItemInstInWorld(x, y, z, itemId, num)
Item:CreateGunInWorld(x, y, z, gunItemId)     -- 枪械掉落物
```

#### 获取道具实例

```lua
-- 从掉落物获取
Actor:GetDropItemInstanceId(dropObjId)

-- 从背包获取
Backpack:GetAllBackPackInstanceIds(uin)         -- 所有道具实例
Backpack:GetInstIdByGridIndex(uin, gridIndex)   -- 指定格子
Backpack:GetGunInstIdInBackpack(uin)            -- 所有枪械实例

-- 从储物箱获取
WorldContainer:GetAllStorageItemInstanceIds(containerId)
WorldContainer:GetStorageItemInstanceId(containerId, gridIndex)

-- 实例ID转道具ID
Item:GetItemIdByInstanceId(instanceId)
Item:GetResIdByInstanceId(instanceId)
```

#### 修改道具实例属性

```lua
-- 枪械属性
Item:ModifyGunAttribute(instanceId, attrId, value)
Item:GetGunAttribute(instanceId, attrId)
Item:GetGunPrefabAttribute(gunItemId, attrId)  -- 获取预制默认属性

-- 模型子部件
Item:AddSubModelPart(instanceId, partId)        -- 添加部件
Item:DeleteSubModelPart(instanceId, partId)     -- 删除部件
Item:ReplaceSubModelPart(instanceId, oldPartId, newPartId)  -- 替换部件

-- 自定义数据
Item:SetStringCustomData(instanceId, key, value)
Item:SetNumberCustomData(instanceId, key, value)
Item:SetBoolCustomData(instanceId, key, value)
Item:SetObjCustomData(instanceId, key, value)   -- Object类型
Item:SetArrayCustomData(instanceId, key, value) -- 数组类型
Item:GetStringCustomData(instanceId, key)
Item:GetNumberCustomData(instanceId, key)
Item:GetBoolCustomData(instanceId, key)
Item:GetObjCustomData(instanceId, key)
Item:GetArrayCustomData(instanceId, key)
```

**注意**：修改格子数据后，需要等待一小会(约0.5秒)再通知客机刷新界面，否则客机可能显示未更新。

### 云服 (Cloud Server)

云服模块提供房间管理和跨服功能：

```lua
-- 房间信息
CloudSever:GetRoomID()           -- 获取当前云服房间ID
CloudSever:GetRoomCategory()     -- 获取房间分类
CloudSever:SetRoomCategory(cat)  -- 设置房间分类(全局5秒冷却)

-- 房间传送
CloudSever:TransmitToCurMapCategoryRoom(playerids, categorys)  -- 传送到当前地图分类房间(全局30秒冷却)
CloudSever:TransmitToCategoryRoom(playerids, mapid, categorys, msg?, notFollow?)  -- 传送到指定地图分类房间(全局30秒冷却)
```

### 其他模块

#### Timeline (剧情动画)
```lua
Timeline:PlayForAll(timelineId)                    -- 对所有玩家播放
Timeline:PlayForPlayer(uin, id, reverse?, toEnd?)  -- 对指定玩家播放
Timeline:Pause(uin, timelineId)                    -- 暂停
Timeline:Resume(uin, timelineId)                   -- 恢复
Timeline:SkipForPlayer(uin)                        -- 跳过
Timeline:GetPlayerState(uin, timelineId)           -- 获取播放状态(0空闲 1播放中 2暂停)
Timeline:IsAllFinished(timelineId)                 -- 是否全部播放完成
```

#### Emitter (粒子发射器)
```lua
-- 通过位置发射
Emitter:EmitByPosition(pos, emitId, shooter?)
Emitter:EmitByPositionTargetPos(pos, emitId, targetPos, shooter?)
Emitter:EmitByPositionTarget(pos, emitId, objId, shooter?)

-- 通过发射者发射
Emitter:EmitByShooter(objId, emitId)
Emitter:EmitByShooterTarget(objIdA, emitId, objIdB)
Emitter:EmitByShooterTargetPos(objId, emitId, targetPos)
```

#### Listen (图形参数监听)
```lua
Listen:AddGraphicsListenParam(objId, funcs, param)  -- 添加图形参数监听
```

### 常见问题与技巧

#### UI 动效 ID 速查
```
-- 显示动效
10001 渐显    10002 放大显示    10003 缩小显示

-- 隐藏动效
20001 渐隐    20002 放大隐藏    20003 缩小隐藏

-- 循环动效
30001 颤抖    30002 跳动    30003 心跳
30004 摇摆    30005 旋转    30006 翻转
30007 顺时针扫描    30008 逆时针扫描    30009 闪烁

-- 文字动效
40001 打字机
```

#### UI 克隆元件

```lua
-- 克隆元件，返回克隆体ID
local cloneId = CustomUI:CloneElement(playerUin, uiId, elementId)
-- 克隆体ID格式: "原元件ID#clone1" (每克隆一次+1)

-- 获取克隆体子元件的方式:
-- 方式1: "父元件ID#clone1.子元件ID"
-- 方式2: "子元件ID#clone1"
```

#### 其他技巧

- 缓存的其他组件需要先调用 `IsValid()` 判断是否有效，避免操作已销毁的组件
- 组件属性变量（除了 `Mini.Enum` 类型）不能在 `propertys` 外直接定义，应该在 `OnStart` 中赋值
- 自定义消息 ID 如果使用触发器广播 ID，则触发器也能收到消息，但参数类型需要对应
- `OnTick` 只在定义时才会启用驱动，不需要时尽量不定义以提高效率

#### ID 格式速查
```
UI ID: 7664495871585643737-132458 (19位数字-6位数字)
UI 元件 ID: 7664495871585643737-132458_1 (UI ID_数字索引)
CloneElement 输出: 7664495871585643737-132458_1#clone1 (原元件ID#clone数字索引)
CreateElement 输出: 7664495871585643737-132458_new1 (UI ID_new数字索引)
脚本组件 ID: c7664495880175578329132459 (前缀c + 25位数字)
触发器组件 ID: s7663834541111340249255620 (前缀s + 25位数字)
变量 ID: v7664496812183481561132464 (前缀v + 25位数字)
模组 ID: bbfcd673-d092-4829-9e13-d95e442a4823 (UUID)
```

#### 变量库说明

- 变量库分为**全局变量**和**玩家变量**
- 全局变量中的排行榜、KV 表可以选择**上传云变量**（跨房间持久化）
- 玩家变量**全部可以上传**云变量
- 变量 ID 通过编辑器 ID 库→变量 插入

