---@meta

---触发器 Math 模块（Trigger.Math）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Math
Trigger.Math = {}

---abs
---@param v1? number 向量
function Trigger.Math:Abs(v1) end

---ceil
---@param v1? number 向量
function Trigger.Math:Ceil(v1) end

---颜色tostring
---@param v1 number 向量
function Trigger.Math:ColorTostring(v1) end

---比较greater
---@param v1? any 向量
---@param v2 any 向量
---@return boolean result 检查结果
function Trigger.Math:CompareGreater(v1, v2) end

---比较greaterequal
---@param v1? any 向量
---@param v2 any 向量
---@return boolean result 检查结果
function Trigger.Math:CompareGreaterEqual(v1, v2) end

---比较less
---@param v1? any 向量
---@param v2 any 向量
---@return boolean result 检查结果
function Trigger.Math:CompareLess(v1, v2) end

---比较lessequal
---@param v1? any 向量
---@param v2 any 向量
---@return boolean result 检查结果
function Trigger.Math:CompareLessEqual(v1, v2) end

---concat
---@vararg any
function Trigger.Math:Concat(...) end

---containstr
---@param str1 string 参数 str1
---@param str2 string 参数 str2
---@return boolean result 是否成功
function Trigger.Math:ContainStr(str1, str2) end

---cos
---@param v1? number 向量
function Trigger.Math:Cos(v1) end

---deg
---@param v1? number 向量
function Trigger.Math:Deg(v1) end

---divandfloor
---@param v1? any 向量
---@param v2 any 向量
function Trigger.Math:DivAndFloor(v1, v2) end

---equal
---@param v1 number 向量
---@param v2 number 向量
function Trigger.Math:Equal(v1, v2) end

---经验
---@param v1? number 向量
function Trigger.Math:Exp(v1) end

---floor
---@param v1? number 向量
function Trigger.Math:Floor(v1) end

---判断是否even
---@param num number 数量
---@return boolean result 是否满足条件
function Trigger.Math:IsEven(num) end

---判断是否negative
---@param num number 数量
---@return boolean result 是否满足条件
function Trigger.Math:IsNegative(num) end

---判断是否odd
---@param num number 数量
---@return boolean result 是否满足条件
function Trigger.Math:IsOdd(num) end

---判断是否positive
---@param num number 数量
---@return boolean result 是否满足条件
function Trigger.Math:IsPositive(num) end

---判断是否prime
---@param num number 数量
---@return boolean result 是否满足条件
function Trigger.Math:IsPrime(num) end

---isinteger
---@param num number 数量
---@return boolean result 是否满足条件
function Trigger.Math:Isinteger(num) end

---isnil
---@param v1 any 向量
function Trigger.Math:Isnil(v1) end

---ldexp
---@param v1? any 向量
---@param v2 any 向量
function Trigger.Math:Ldexp(v1, v2) end

---记录
---@param v1? number 向量
function Trigger.Math:Log(v1) end

---log10
---@param v1? number 向量
function Trigger.Math:Log10(v1) end

---logic比较表
---@param a table 参数 a
---@param b table 参数 B
---@return boolean result 是否成功
function Trigger.Math:LogicCompareTable(a, b) end

---math添加
---@param v1? any 向量
---@param v2 any 向量
function Trigger.Math:MathAdd(v1, v2) end

---matharithmetic
---@param fn any 回调函数
---@vararg any
function Trigger.Math:MathArithmetic(fn, ...) end

---mathdivide
---@param v1? any 向量
---@param v2 any 向量
function Trigger.Math:MathDivide(v1, v2) end

---mathextractopt
---@param v1 number 向量
---@param v2 number 向量
---@return number result 结果数值
function Trigger.Math:MathExtractOpt(v1, v2) end

---mathmultiply
---@param v1? any 向量
---@param v2 any 向量
function Trigger.Math:MathMultiply(v1, v2) end

---mathsub
---@param v1? any 向量
---@param v2 any 向量
function Trigger.Math:MathSub(v1, v2) end

---mathunfixedbase记录
---@param v1 number 向量
---@param v2 number 向量
function Trigger.Math:MathUnFixedBaseLog(v1, v2) end

---mathxor
---@param v1 any 向量
---@param v2 any 向量
function Trigger.Math:MathXor(v1, v2) end

---最大
---@param v1? any 向量
---@param v2 any 向量
function Trigger.Math:Max(v1, v2) end

---最小
---@param v1? any 向量
---@param v2 any 向量
function Trigger.Math:Min(v1, v2) end

---模组
---@param v1? any 向量
---@param v2 any 向量
function Trigger.Math:Mod(v1, v2) end

---模组equalzero
---@param v1 number 向量
---@param v2 number 向量
function Trigger.Math:ModEqualZero(v1, v2) end

---negate
---@param v1? any 向量
function Trigger.Math:Negate(v1) end

---notequal
---@param v1 any 向量
---@param v2 any 向量
function Trigger.Math:NotEqual(v1, v2) end

---pow
---@param v1? any 向量
---@param v2 any 向量
function Trigger.Math:Pow(v1, v2) end

---pow10
---@param v1? any 向量
function Trigger.Math:Pow10(v1) end

---rad
---@param v1? number 向量
function Trigger.Math:Rad(v1) end

---random
---@param v1? number 向量
---@param v2 number 向量
function Trigger.Math:Random(v1, v2) end

---round
---@param v1? any 向量
function Trigger.Math:Round(v1) end

---sin
---@param v1? number 向量
function Trigger.Math:Sin(v1) end

---sqrt
---@param v1? number 向量
function Trigger.Math:Sqrt(v1) end

---str转换为bool
---@param str string 字符串
---@return boolean result 是否成功
function Trigger.Math:StrToBool(str) end

---str转换为颜色
---@param str any 字符串
function Trigger.Math:StrToColor(str) end

---str转换为v3
---@param str string 字符串
---@return table result 结果表
function Trigger.Math:StrToV3(str) end

---tan
---@param v1? number 向量
function Trigger.Math:Tan(v1) end

---tanangle2rad
---@param v1? number 向量
function Trigger.Math:TanAngle2Rad(v1) end

---tostring
---@param v1? number 向量
function Trigger.Math:Tostring(v1) end

---v3tostring
---@param v1 Mini.Vec3 向量
function Trigger.Math:V3Tostring(v1) end
