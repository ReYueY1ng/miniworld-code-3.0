---@meta

---触发器 Math 模块（Trigger.Math）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Math
Trigger.Math = {}

---计算数值的绝对值
---@param v1? number 数值或可转为数字的字符串
---@return number? result 绝对值，无法转为数字时为 nil
function Trigger.Math:Abs(v1) end

---把数值向上取整
---@param v1? number 数值或可转为数字的字符串
---@return number? result 取整结果，无法转为数字时为 nil
function Trigger.Math:Ceil(v1) end

---把颜色数值转成 0x 开头的十六进制字符串
---@param v1 number 颜色数值（ARGB 整数）
---@return string result 颜色字符串
function Trigger.Math:ColorTostring(v1) end

---判断第一个值是否大于第二个值
---@param v1? number 左值
---@param v2 number 右值
---@return boolean result 比较结果，任一参数为 nil 时返回 false
function Trigger.Math:CompareGreater(v1, v2) end

---判断第一个值是否大于等于第二个值
---@param v1? number 左值
---@param v2 number 右值
---@return boolean result 比较结果，任一参数为 nil 时返回 false
function Trigger.Math:CompareGreaterEqual(v1, v2) end

---判断第一个值是否小于第二个值
---@param v1? number 左值
---@param v2 number 右值
---@return boolean result 比较结果，任一参数为 nil 时返回 false
function Trigger.Math:CompareLess(v1, v2) end

---判断第一个值是否小于等于第二个值
---@param v1? number 左值
---@param v2 number 右值
---@return boolean result 比较结果，任一参数为 nil 时返回 false
function Trigger.Math:CompareLessEqual(v1, v2) end

---按顺序把所有参数拼接成字符串
---非字符串参数会先按 tostring 转换
---@vararg any
---@return string? result 拼接结果，没有参数时为 nil
function Trigger.Math:Concat(...) end

---判断第一个字符串中是否包含第二个字符串
---内部使用 string.find，子串中的魔法字符按 Lua 模式解析
---@param str1 string 被查找的字符串
---@param str2 string 要查找的子串
---@return boolean result 是否包含，参数不是字符串时返回 false
function Trigger.Math:ContainStr(str1, str2) end

---计算弧度的余弦值
---@param v1? number 弧度值
---@return number? result 余弦值，无法转为数字时为 nil
function Trigger.Math:Cos(v1) end

---把弧度转换为角度
---@param v1? number 弧度值
---@return number? result 角度值，无法转为数字时为 nil
function Trigger.Math:Deg(v1) end

---两数相除后向下取整
---@param v1? number 被除数
---@param v2 number 除数
---@return number? result 取整后的商，除数 0 或参数无法转数字时为 nil
function Trigger.Math:DivAndFloor(v1, v2) end

---判断两个值是否相等
---两个数字之间允许 1e-17 的误差，其他类型直接比较
---@param v1 number 左值
---@param v2 number 右值
---@return boolean result 比较结果
function Trigger.Math:Equal(v1, v2) end

---计算 e 的指定次方
---@param v1? number 指数
---@return number? result 计算结果，无法转为数字时为 nil
function Trigger.Math:Exp(v1) end

---把数值向下取整
---@param v1? number 数值
---@return number? result 取整结果，无法转为数字时为 nil
function Trigger.Math:Floor(v1) end

---判断数值是否为偶数
---@param num number 待判断的数值
---@return boolean result 是否偶数，非数字参数返回 false
function Trigger.Math:IsEven(num) end

---判断数值是否为负数
---@param num number 待判断的数值
---@return boolean result 是否小于 0，非数字参数返回 false
function Trigger.Math:IsNegative(num) end

---判断数值是否为奇数
---@param num number 待判断的数值
---@return boolean result 是否奇数，非数字参数返回 false
function Trigger.Math:IsOdd(num) end

---判断数值是否为正数
---@param num number 待判断的数值
---@return boolean result 是否大于 0，非数字参数返回 false
function Trigger.Math:IsPositive(num) end

---判断数值是否为质数
---判断前先取绝对值，负数按正数处理
---@param num number 待判断的数值
---@return boolean result 是否质数，非数字或小于等于 1 时返回 false
function Trigger.Math:IsPrime(num) end

---判断数值是否为整数
---@param num number 待判断的数值
---@return boolean result 是否为整数，非数字参数返回 false
function Trigger.Math:Isinteger(num) end

---判断值是否为 nil
---@param v1 number 待判断的值
---@return boolean result 是否为 nil
function Trigger.Math:Isnil(v1) end

---计算数值乘以 2 的指定次方
---@param v1? number 底数
---@param v2 number 2 的指数
---@return number? result 计算结果，参数无法转数字时为 nil
function Trigger.Math:Ldexp(v1, v2) end

---计算自然对数
---@param v1? number 真数，需大于 0
---@return number? result 对数值，真数小于等于 0 时为 nil
function Trigger.Math:Log(v1) end

---计算以 10 为底的对数
---@param v1? number 真数，需大于 0
---@return number? result 对数值，真数小于等于 0 时为 nil
function Trigger.Math:Log10(v1) end

---深度比较两个值是否逻辑相等
---类型不同直接返回 false，数字按 1e-6 容差比较
---表要求字段一一对应且数量一致
---stype 为 36 的两个表会先按 id*1000+等级 归一化 val 再比较
---@param a table 左值
---@param b table 右值
---@return boolean result 是否相等
function Trigger.Math:LogicCompareTable(a, b) end

---两数相加
---@param v1? number 被加数
---@param v2 number 加数
---@return number? result 和，参数无法转数字时为 nil
function Trigger.Math:MathAdd(v1, v2) end

---校验四则运算参数后调用传入函数取结果
---额外参数按 运算符/操作数 交替传入，仅参与校验
---实现以 fn() 无参方式调用，参数不会传给 fn
---参数个数必须为奇数且不少于 3 个
---@param fn function 无参调用的运算函数，返回值即结果
---@vararg any
---@return any? result 运算结果，参数非法或除零时为 nil
function Trigger.Math:MathArithmetic(fn, ...) end

---两数相除
---@param v1? number 被除数
---@param v2 number 除数
---@return number? result 商，除数为 0 或参数无法转数字时为 nil
function Trigger.Math:MathDivide(v1, v2) end

---计算指定次方根
---被开方数为 0 时直接返回 0
---@param v1 number 被开方数
---@param v2 number 根次数
---@return number? result 开方结果，偶次根号下为负数或参数非法时为 nil
function Trigger.Math:MathExtractOpt(v1, v2) end

---两数相乘
---@param v1? number 被乘数
---@param v2 number 乘数
---@return number? result 积，参数无法转数字时为 nil
function Trigger.Math:MathMultiply(v1, v2) end

---两数相减
---@param v1? number 被减数
---@param v2 number 减数
---@return number? result 差，参数无法转数字时为 nil
function Trigger.Math:MathSub(v1, v2) end

---计算以第一个值为底的对数
---@param v1 number 底数，需大于 0 且不等于 1
---@param v2 number 真数
---@return number? result 对数值，底数非法或参数无法转数字时为 nil
function Trigger.Math:MathUnFixedBaseLog(v1, v2) end

---对两个值做逻辑异或
---@param v1 number 左值
---@param v2 number 右值
---@return any? result 仅一方为真时返回另一方，否则为 nil 或 false
function Trigger.Math:MathXor(v1, v2) end

---取两个数中的较大值
---@param v1? number 数值一
---@param v2 number 数值二
---@return number? result 较大值，参数无法转数字时为 nil
function Trigger.Math:Max(v1, v2) end

---取两个数中的较小值
---@param v1? number 数值一
---@param v2 number 数值二
---@return number? result 较小值，参数无法转数字时为 nil
function Trigger.Math:Min(v1, v2) end

---计算两数取模的结果
---@param v1? number 被除数
---@param v2 number 除数
---@return number? result 余数，除数为 0 或参数无法转数字时为 nil
function Trigger.Math:Mod(v1, v2) end

---判断两数取模结果是否为 0
---@param v1 number 被除数
---@param v2 number 除数
---@return boolean? result 余数是否为 0，参数无法转数字时为 nil
function Trigger.Math:ModEqualZero(v1, v2) end

---取数值的相反数
---@param v1? number 数值
---@return number? result 相反数，无法转为数字时为 nil
function Trigger.Math:Negate(v1) end

---判断两个值是否不相等
---直接按 Lua 的 ~= 比较，不做数值容差
---@param v1 number 左值
---@param v2 number 右值
---@return boolean result 是否不相等
function Trigger.Math:NotEqual(v1, v2) end

---计算第一个值的指定次方
---@param v1? number 底数
---@param v2 number 指数
---@return number? result 幂值，参数无法转数字时为 nil
function Trigger.Math:Pow(v1, v2) end

---计算 10 的指定次方
---@param v1? number 指数
---@return number? result 幂值，无法转为数字时为 nil
function Trigger.Math:Pow10(v1) end

---把角度转换为弧度
---@param v1? number 角度值
---@return number? result 弧度值，无法转为数字时为 nil
function Trigger.Math:Rad(v1) end

---在指定区间内取随机数
---两端都是整数时返回整数，否则按最大小数位数返回小数
---下限大于上限时自动交换
---每次调用都会用当前时间重新设置随机种子
---@param v1? number 区间下限
---@param v2 number 区间上限
---@return number? result 随机数，参数无法转数字时为 nil
function Trigger.Math:Random(v1, v2) end

---把数值四舍五入取整
---实现为 floor(x+0.5)，负数向零方向取整
---@param v1? number 数值
---@return number? result 取整结果，无法转为数字时为 nil
function Trigger.Math:Round(v1) end

---计算弧度的正弦值
---@param v1? number 弧度值
---@return number? result 正弦值，无法转为数字时为 nil
function Trigger.Math:Sin(v1) end

---计算数值的平方根
---@param v1? number 被开方数，需大于等于 0
---@return number? result 平方根，负数或无法转为数字时为 nil
function Trigger.Math:Sqrt(v1) end

---把字符串转换为布尔值
---@param str string 待转换的字符串
---@return boolean result 仅忽略大小写的 false 返回 false，其余一律 true
function Trigger.Math:StrToBool(str) end

---把十六进制颜色字符串转换为数值
---@param str string 十六进制颜色字符串
---@return number? result 颜色数值，无法解析时为 nil
function Trigger.Math:StrToColor(str) end

---把逗号分隔的字符串解析成坐标表
---@param str string 格式为 x,y,z 的字符串
---@return table? pos 坐标表 {x,y,z}，分段数不是 3 时为 nil
function Trigger.Math:StrToV3(str) end

---计算弧度的正切值
---@param v1? number 弧度值
---@return number? result 正切值，无法转为数字时为 nil
function Trigger.Math:Tan(v1) end

---把角度取模 180 后转为弧度
---@param v1? number 角度值
---@return number? result 弧度值，取模后为 90 度或参数非法时为 nil
function Trigger.Math:TanAngle2Rad(v1) end

---把数值转成最多保留 5 位小数的字符串
---数字按 floor(|x|*100000+0.1)/100000 截断，非数字按 tostring 输出
---@param v1? number 待转换的值
---@return string? result 字符串，参数为 nil 时返回 nil
function Trigger.Math:Tostring(v1) end

---把坐标向量格式化为 x,y,z 字符串
---不含 x/y/z 的值按 tostring 输出
---@param v1 Mini.Vec3 坐标向量
---@return string result 坐标字符串（保留 2 位小数）
function Trigger.Math:V3Tostring(v1) end
