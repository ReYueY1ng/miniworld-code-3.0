---@meta

---触发器 Graphics 模块（Trigger.Graphics）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Graphics
Trigger.Graphics = {}

---按对象批量创建图文并返回实例ID列表
---多个对象共用第一次换算出的方向向量
---不支持的 Type 会被跳过，数组可能为空
---@param data integer | integer[] 目标对象ID或其数组
---@param info table 图文配置表，Type 决定图文种类（文字/悬浮文字/进度条/箭头/线/面/图片/寻路引导线）
---@param dir number 朝向：数字按对象朝向换算为方向向量，也可直接传方向向量表
---@param offest any 相对对象的位置偏移高度
---@return table|boolean? result 创建成功的图文实例ID数组；info 非表返回 false，data 或 dir 为空返回 nil
function Trigger.Graphics:CreateGraphicsByActor(data, info, dir, offest) end

---按对象批量创建带屏幕偏移的图文
---固定使用 {x=1, y=1, z=1} 的方向与 0 位置偏移
---只处理文字、悬浮文字、进度条与图片类型
---@param data integer | integer[] 目标对象ID或其数组
---@param info table 图文配置表，Type 决定图文种类
---@param x number 屏幕横向偏移
---@param y number 屏幕纵向偏移
---@return table|boolean? result 创建成功的图文实例ID数组；info 非表返回 false，data 为空返回 nil
function Trigger.Graphics:CreateGraphicsByActor2(data, info, x, y) end

---在世界坐标创建单个图文
---箭头/线/面配置里带 objid 时指向对象，带 pos 时指向坐标
---坐标非法或星球不存在时返回 nil
---@param pos Mini.Vec3 图文所在坐标表，需含 x/y/z
---@param GraphicInfo table 图文配置表，Type 决定图文种类
---@param worldId integer 星球ID，不填表示当前星球
---@return number|boolean? result 图文实例ID；配置非表或不支持的 Type 返回 false
function Trigger.Graphics:CreateGraphicsByPos(pos, GraphicInfo, worldId) end

---在世界坐标创建带屏幕偏移的单个图文
---只支持进度条、悬浮文字、文字与图片类型
---坐标非法或星球不存在时返回 nil
---@param pos Mini.Vec3 图文所在坐标表，需含 x/y/z
---@param GraphicInfo table 图文配置表，Type 决定图文种类
---@param x number 屏幕横向偏移
---@param y number 屏幕纵向偏移
---@param worldId integer 星球ID，不填表示当前星球
---@return number|boolean? result 图文实例ID；配置非表或不支持的 Type 返回 false
function Trigger.Graphics:CreateGraphicsByPos2(pos, GraphicInfo, x, y, worldId) end

---查询玩家昵称或称号在角色头顶的偏移高度
---仅在客户端环境有数据，主机上通常返回 nil
---原始偏移大于 0 时会减去 100 的基准高度
---@param tuin number 玩家Uin
---@param itype number 查询类型（PlayerNameType：1 昵称，2 称号，3 特效）
---@return number? result 偏移高度，取不到客户端玩家数据时为 nil
function Trigger.Graphics:GetInnerGraphicsOffset(tuin, itype) end

---构造指向世界坐标的箭头图文配置
---生成结果可直接作为 GraphicInfo 传给 CreateGraphicsByPos
---颜色无法解析时按白色处理，完全不传颜色则返回 nil
---@param pos Mini.Vec3 箭头指向的坐标表，需含 x/y/z
---@param size number 缩放值，默认 1
---@param color number | string 颜色值（0xFFFFFF），支持数字或 0x 前缀字符串
---@param itype number 箭头样式ID
---@param worldId integer 星球ID，构造阶段不使用
---@return table? result 图文配置表，缺少坐标或颜色时为 nil
function Trigger.Graphics:MakeGraphicsArrowToPos(pos, size, color, itype, worldId) end

---构造指向世界坐标的连线图文配置
---生成结果可直接作为 GraphicInfo 传给 CreateGraphicsByPos
---@param pos Mini.Vec3 连线指向的坐标表，需含 x/y/z
---@param size number 缩放值，默认 1
---@param color number | string 颜色值（0xFFFFFF），支持数字或 0x 前缀字符串
---@param itype number 线条样式ID
---@param worldId integer 星球ID，构造阶段不使用
---@return table? result 图文配置表，缺少坐标或颜色时为 nil
function Trigger.Graphics:MakeGraphicsLineToPos(pos, size, color, itype, worldId) end

---构造指向世界坐标的寻路引导线图文配置
---类型固定为 NavPathPos，不需要颜色与缩放
---数组会被展开成普通 Lua 表后写入配置
---@param pos Mini.Vec3 引导线指向的坐标表，需含 x/y/z
---@param itype number 引导线样式ID
---@param canSeePlayersArr integer | integer[] 可见玩家ID或其数组，不填表示所有玩家
---@return table? result 图文配置表，坐标为 nil 时为 nil
function Trigger.Graphics:MakeGraphicsNavPathToPos(pos, itype, canSeePlayersArr) end

---构造指向世界坐标的平面图文配置
---生成结果可直接作为 GraphicInfo 传给 CreateGraphicsByPos
---@param pos Mini.Vec3 平面指向的坐标表，需含 x/y/z
---@param size number 缩放值，默认 1
---@param color number | string 颜色值（0xFFFFFF），支持数字或 0x 前缀字符串
---@param itype number 平面样式ID
---@param worldId integer 星球ID，构造阶段不使用
---@return table? result 图文配置表，缺少坐标或颜色时为 nil
function Trigger.Graphics:MakeGraphicsSurfaceToPos(pos, size, color, itype, worldId) end

---删除对象上指定类型与样式的图文
---数组会逐个对象删除，任一成功即返回 true
---引擎不可用时返回 false
---@param objids integer | integer[] 对象ID或其数组
---@param itype number 图文ID，即创建配置里的 itype
---@param graphType number 图文类型（GraphicsType 枚举）
---@return boolean result 是否至少删除成功一个
function Trigger.Graphics:RemoveGraphicsByObjID(objids, itype, graphType) end

---删除指定坐标上指定类型与样式的图文
---坐标为 nil 或星球不存在时返回 false
---@param pos? Mini.Vec3 图文所在坐标表，需含 x/y/z
---@param itype number 图文ID，即创建配置里的 itype
---@param graphType number 图文类型（GraphicsType 枚举）
---@param worldId number 星球ID，不填表示当前星球
---@return boolean result 是否删除成功
function Trigger.Graphics:RemoveGraphicsByPos(pos, itype, graphType, worldId) end
