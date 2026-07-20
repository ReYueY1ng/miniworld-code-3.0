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