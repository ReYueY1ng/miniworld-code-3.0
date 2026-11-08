---@meta

---变换组件接口（内置组件 Transform）<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/transform.html)
---@class Transform: Component
Transform = {}

---设置局部坐标
---设置对象Actor相对父节点的局部坐标，单位为格；实体对象写入后请求ActionGroup或MotionGroup同步。缺少Actor时不处理，无返回值。
---@param x Mini.Vec3 | number 相对父节点的局部坐标，含数值x、y、z，1格对应底层100单位；触发器传一个向量，脚本也可传x、y、z三个数值。无默认值，未限制数值范围。
---@param y? number 脚本按 x、y、z 三个数值传参时的 y 分量
---@param z? number 脚本按 x、y、z 三个数值传参时的 z 分量
function Transform:SetPosition(x, y, z) end

---获取局部坐标
---读取对象Actor相对父节点的局部坐标，将底层坐标除以100换算为格。
---@return Mini.Vec3 value 返回含x、y、z的Mini.Vec3，表示相对父节点的局部坐标，单位为格；gameObject或Actor不存在时返回nil。
function Transform:GetPosition() end

---获取世界坐标
---读取对象Actor的世界坐标，将底层坐标除以100换算为格。
---@return Mini.Vec3 value 返回含x、y、z的Mini.Vec3，表示世界坐标，单位为格；gameObject或Actor不存在时返回nil。
function Transform:GetWorldPosition() end

---设置世界坐标
---设置对象Actor的世界坐标，单位为格；实体对象写入后请求ActionGroup或MotionGroup同步。缺少Actor时不处理，无返回值。
---@param x Mini.Vec3 | number 世界坐标，含数值x、y、z，1格对应底层100单位；触发器传一个向量，脚本也可传x、y、z三个数值。无默认值，未限制数值范围。
---@param y? number 脚本按 x、y、z 三个数值传参时的 y 分量
---@param z? number 脚本按 x、y、z 三个数值传参时的 z 分量
function Transform:SetWorldPosition(x, y, z) end

---获取局部缩放
---读取对象Actor相对父节点的局部三轴缩放倍率。
---@return Mini.Scale value 返回含x、y、z的Mini.Vec3，表示相对父节点的局部缩放，1为原尺寸、无单位；gameObject或Actor不存在时返回nil。
function Transform:GetScale() end

---设置局部缩放
---设置对象Actor相对父节点的局部缩放，各轴小于或等于0.01时截断为0.01；更新自动平铺，并对实体请求ActionGroup或MotionGroup同步。缺少Actor时不处理，无返回值。
---@param x Mini.Scale | number 相对父节点的局部三轴倍率，1表示原尺寸，无单位；脚本支持含数值x、y、z的table或x、y、z三个数值，单个userdata不会按向量处理。各轴最小0.01，无代码上限；属性面板0.1至999不是本接口限制。无默认值。
---@param y? number 脚本按 x、y、z 三个数值传参时的 y 分量
---@param z? number 脚本按 x、y、z 三个数值传参时的 z 分量
function Transform:SetScale(x, y, z) end

---获取世界缩放
---读取对象Actor的世界三轴缩放倍率。
---@return Mini.Scale value 返回含x、y、z的Mini.Vec3，表示世界缩放，1为原尺寸、无单位；gameObject或Actor不存在时返回nil。
function Transform:GetWorldScale() end

---设置世界缩放
---设置对象Actor的世界缩放，各轴小于或等于0.01时截断为0.01；更新自动平铺，并对实体请求ActionGroup或MotionGroup同步。缺少Actor时不处理，无返回值。
---@param x Mini.Scale | number 世界三轴倍率，1表示原尺寸，无单位；脚本支持含数值x、y、z的table或x、y、z三个数值，单个userdata不会按向量处理。各轴最小0.01，无代码上限；属性面板0.1至999不是本接口限制。无默认值。
---@param y? number 脚本按 x、y、z 三个数值传参时的 y 分量
---@param z? number 脚本按 x、y、z 三个数值传参时的 z 分量
function Transform:SetWorldScale(x, y, z) end

---获取局部旋转
---读取对象Actor相对父节点的局部旋转，并转换为欧拉角。
---@return Mini.Rotation value 返回含x、y、z的Mini.Vec3，表示相对父节点的局部欧拉角，单位为度；gameObject或Actor不存在时返回nil。欧拉角由底层四元数转换，数值表达不保证与设置时相同。
function Transform:GetRotationEuler() end

---设置局部旋转
---设置对象Actor相对父节点的局部欧拉角，单位为度；实体写入后请求ActionGroup或MotionGroup同步。缺少Actor时不处理，无返回值。
---@param x Mini.Rotation | number 相对父节点的局部欧拉角，含数值x、y、z，单位为度；触发器传一个向量，脚本也可传x、y、z三个数值。无默认值，Lua不限制角度范围。
---@param y? number 脚本按 x、y、z 三个数值传参时的 y 分量
---@param z? number 脚本按 x、y、z 三个数值传参时的 z 分量
function Transform:SetRotationEuler(x, y, z) end

---获取世界旋转
---读取对象Actor的世界旋转，并转换为欧拉角。
---@return Mini.Rotation value 返回含x、y、z的Mini.Vec3，表示世界欧拉角，单位为度；gameObject或Actor不存在时返回nil。欧拉角由底层四元数转换，数值表达不保证与设置时相同。
function Transform:GetWorldRotationEuler() end

---设置世界旋转
---设置对象Actor的世界欧拉角，单位为度；实体写入后请求ActionGroup或MotionGroup同步。缺少Actor时不处理，无返回值。
---@param x Mini.Rotation | number 世界欧拉角，含数值x、y、z，单位为度；触发器传一个向量，脚本也可传x、y、z三个数值。无默认值，Lua不限制角度范围。
---@param y? number 脚本按 x、y、z 三个数值传参时的 y 分量
---@param z? number 脚本按 x、y、z 三个数值传参时的 z 分量
function Transform:SetWorldRotationEuler(x, y, z) end

---获取旋转
---返回值类型未在 wiki 声明。
function Transform:GetRotation() end

---设置局部旋转四元数
---设置对象Actor相对父节点的局部旋转四元数。 支持一个四元数userdata或四个数值，普通table不作为四元数重载；缺少Actor或分量时不写入。 实体写入后请求ActionGroup或MotionGroup同步，无返回值；Lua不校验归一化或分量范围。 触发器使用 x、y、z、w 四个数值槽；脚本仍可使用原有单 userdata 重载。
---@param x Mini.Number 四元数x分量，或含x、y、z、w的Rainbow.Quaternionf；分量无单位，无默认值。
---@param y? Mini.Number 四元数y分量；单userdata调用时省略，四数值调用时必须提供。
---@param z? Mini.Number 四元数z分量；单userdata调用时省略，四数值调用时必须提供。
---@param w? Mini.Number 四元数w分量；单userdata调用时省略，四数值调用时必须提供。
function Transform:SetRotation(x, y, z, w) end

---获取世界旋转
---返回值类型未在 wiki 声明。
function Transform:GetWorldRotation() end

---设置世界旋转四元数
---设置对象Actor的世界旋转四元数。 支持一个四元数userdata或四个数值，普通table不作为四元数重载；缺少Actor或分量时不写入。 实体写入后请求ActionGroup或MotionGroup同步，无返回值；Lua不校验归一化或分量范围。 触发器使用 x、y、z、w 四个数值槽；脚本仍可使用原有单 userdata 重载。
---@param x Mini.Number 四元数x分量，或含x、y、z、w的Rainbow.Quaternionf；分量无单位，无默认值。
---@param y? Mini.Number 四元数y分量；单userdata调用时省略，四数值调用时必须提供。
---@param z? Mini.Number 四元数z分量；单userdata调用时省略，四数值调用时必须提供。
---@param w? Mini.Number 四元数w分量；单userdata调用时省略，四数值调用时必须提供。
function Transform:SetWorldRotation(x, y, z, w) end
