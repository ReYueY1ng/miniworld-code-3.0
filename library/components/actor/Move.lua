---@meta

---移动组件接口（内置组件 Move · 角色组件）<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/move.html)
---@class Move: Component
---@field enableWalk Mini.GroupView
---@field walkAction Mini.ModelAction
---@field walkSpeed number
---@field stepSound number | string
---@field saySound number | string
---@field enableRun Mini.GroupView 启用运行
---@field runAction Mini.ModelAction 运行动作
---@field runSpeed number 运行速度
---@field enableFly Mini.GroupView
---@field flyHeight number
---@field flyAction Mini.ModelAction
---@field flySpeed number
---@field flyGlideAction Mini.ModelAction 滑翔动画
---@field flyGlideCooldown number 滑翔触发冷却时间
---@field flyGlideProbability number 滑翔触发概率
---@field flyGlideDuration number 滑翔持续时间
---@field flyHoverAction Mini.ModelAction 悬停动画
---@field flyCurveGroup table[] 飞行曲线组
---@field enableSwim Mini.GroupView
---@field swimAction Mini.ModelAction
---@field swimSpeed number
---@field swimEnterAction Mini.ModelAction 入水动画
---@field swimLeaveAction Mini.ModelAction 出水动画
---@field swimDrowningAction Mini.ModelAction 溺水动画
---@field enableSuspension boolean 水中悬浮
---@field swimSuspensionAction Mini.ModelAction 悬浮动画
---@field navAdditionalGroup Mini.GroupView 寻路筛选条件
---@field navAdditionalWaterSurface boolean 水面
---@field waterSurfaceYoffset number 水面方块垂直偏移
---@field navAdditionalWaterInner boolean 水下
---@field navAdditionalWaterOnly boolean 仅水中
---@field navForceWaterSurface boolean 强制水面运动
---@field enablejump Mini.GroupView 启用跳跃
---@field jumpAction Mini.ModelAction 跳跃动作
---@field jumpSpeed number 跳跃速度
Move = {}

---跳跃
---向当前actor请求一次跳跃并调用跳跃同步；需要actor存在，实际起跳仍受移动实现与角色状态限制，不返回执行结果。
function Move:Jump() end

---给对象附加一个速度
---给当前actor叠加旧移动制的运动冲量；各分量乘100后传入setMotionChange，新移动实现再做兼容换算。数值类型错误或无actor时不执行，无返回值。
---@param vx number 世界X方向附加运动量，旧制单位格/逻辑tick。
---@param vy number 世界Y方向附加运动量，旧制格/逻辑tick，正值向上。
---@param vz number 世界Z方向附加运动量，旧制单位格/逻辑tick。
function Move:AppendSpeed(vx, vy, vz) end

---移动到目标对象处
---将目标对象ID和速度原样交给actor.tryActorMoveToActor；需要number参数和actor。本次检出代码未找到该底层方法的定义/导出，实际可调用性和移动行为待确认，无返回值。
---@param target number 目标对象数值标识，实际解释待确认。
---@param speed number 移动速度，单位和有效范围待确认。
function Move:TryActorMoveToActor(target, speed) end

---移动到目标位置
---将目标坐标乘100并把速度原样交给actor.tryActorMoveToPos；需要number参数和actor。本次检出代码未找到该底层方法的定义/导出，实际可调用性与移动行为待确认，无返回值。
---@param x number 目标世界X坐标，单位格。
---@param y number 目标世界Y坐标，单位格。
---@param z number 目标世界Z坐标，单位格。
---@param speed number 移动速度，单位和有效范围待确认。
function Move:TryActorMoveToPos(x, y, z, speed) end

---设置对象朝向
---按世界方向向量设置actor的朝向yaw和pitch；底层将向量转换为角度，需要actor及其移动组件。参数类型错误或无actor时不执行，无返回值。
---@param vx number 世界朝向向量X分量，无量纲。
---@param vy number 世界朝向向量Y分量，无量纲，控制俯仰。
---@param vz number 世界朝向向量Z分量；三分量应组成非零方向。
function Move:SetFaceDir(vx, vy, vz) end

---获取对象朝向
---读取actor当前yaw和pitch对应的世界朝向向量，以X、Y、Z三个number返回；现有元数据只保留一个Mini.Number类型槽。
---@return number value 有actor时返回X、Y、Z三个方向分量；actor无移动组件时为0、0、0；没有actor时返回nil（无返回值）。元数据仅声明Mini.Number，完整三返回值见函数注释。
function Move:GetFaceDir() end

---设置对象视角偏移角度
---设置actor的水平朝向角yaw，并交由底层更新朝向表现；需要actor及移动组件。本层不归一化或截断角度，无返回值。
---@param yaw number 绝对水平朝向角，单位度。
function Move:SetFaceYaw(yaw) end

---获取对象视角偏移角度
---读取actor移动组件保存的绝对水平朝向yaw，单位度；不进行角度归一化。
---@return number value 返回yaw角（度）；actor存在但没有移动组件时返回0；没有actor时返回nil。
function Move:GetFaceYaw() end

---转向目标位置
---历史开放声明意图为转向世界坐标；本次检出Move及Component基类未找到同名方法定义，实际调用不可确认，需先确认实现，不能保证生效。
---@param arg1 number 目标X坐标；方法缺失，单位待确认。
---@param arg2 number 目标Y坐标；方法缺失，单位待确认。
---@param arg3 number 目标Z坐标；方法缺失，单位待确认。
function Move:TurntoPos(arg1, arg2, arg3) end

---转向目标对象
---历史开放声明意图为转向目标对象；本次检出Move及Component基类未找到同名方法定义，实际调用不可确认，需先确认实现，不能保证生效。
---@param arg1 number 目标对象ID；方法缺失，标识解释待确认。
function Move:TurnToAcor(arg1) end

---转动对象横向偏移角度
---读取当前yaw后叠加指定角度，调用底层设置水平朝向；需要actor及移动组件才能生效。本层不归一化角度，无返回值。
---@param offset number 水平朝向增量，单位度，可正可负。
function Move:TurnFaceYaw(offset) end
