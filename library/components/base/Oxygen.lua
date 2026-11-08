---@meta

---氧气组件接口（内置组件 Oxygen · 基础组件）<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/oxygen.html)
---@class Oxygen: Component
---@field value number 值
---@field maxValue number 最大值
---@field recoveryRate number
---@field useRate number
Oxygen = {}

---得到最大氧气值
---读取对象Actor氧气组件的最大氧气值；生物Actor首次访问时可能创建底层组件，普通Actor不支持时无法获取。
---@return number value 返回底层配置的最大氧气值；gameObject、Actor或氧气组件不存在时返回0。
function Oxygen:GetMax() end

---设置最大氧气值
---写入氧气组件的最大值，并由底层裁剪当前氧气；缺少组件或参数非number时不处理，无返回值。生物Actor访问时可能创建底层氧气组件。
---@param value number 最大氧气值，建议非负。
function Oxygen:SetMax(value) end

---得到当前氧气值
---当前实现调用底层getValue后未返回该结果，最终始终返回0，不能据此读取实际剩余氧气。生物Actor访问时可能创建底层氧气组件。
---@return number value 正常执行时始终返回数字0，包括氧气组件存在且有剩余氧气的情况；当前Lua封装没有转发底层当前值。
function Oxygen:GetValue() end

---设置当前氧气值
---设置氧气组件的当前氧气值；上限非负时底层将当前值截断至0和最大值之间。缺少组件或参数非number时不处理，无返回值。生物Actor访问时可能创建底层氧气组件。
---@param value number 当前氧气值，截断至0和最大值之间。
function Oxygen:SetValue(value) end

---得到氧气值每秒恢复值
---读取氧气组件的恢复量参数；底层在满足可恢复条件时按恢复周期使用，并非此函数计时恢复。生物Actor访问时可能创建底层氧气组件。
---@return number value 返回恢复量参数，单位为每个恢复周期的氧气值；生物更新按60 tick周期恢复，实际频率受运行环境影响。gameObject、Actor或氧气组件不存在时返回0。
function Oxygen:GetRecoveryRate() end

---设置氧气值每秒恢复值
---写入氧气组件的恢复量参数，不立即增加氧气；生物更新在满足恢复条件时按60 tick周期使用此值。缺少组件或参数非number时不处理，无返回值。生物Actor访问时可能创建底层氧气组件。
---@param value number 每恢复周期增加的氧气值。
function Oxygen:SetRecoveryRate(value) end

---得到氧气值每秒消耗值
---读取氧气组件的基础消耗量，未包含Buff、世界倍率和是否需要氧气等运行时修正。生物Actor访问时可能创建底层氧气组件。
---@return number value 返回基础消耗量参数，按底层消耗间隔使用，不保证为实际每秒扣除值；gameObject、Actor或氧气组件不存在时返回0。
function Oxygen:GetUseRate() end

---设置氧气值每秒消耗值
---写入氧气组件的基础消耗量，不立即扣除氧气；实际扣除还受氧气开关、环境、消耗间隔、Buff和世界倍率影响。缺少组件或参数非number时不处理，无返回值。生物Actor访问时可能创建底层氧气组件。
---@param value number 每消耗周期的基础氧气消耗量。
function Oxygen:SetUseRate(value) end
