---@meta

---触发器 CustomUI 模块（Trigger.CustomUI）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.CustomUI
Trigger.CustomUI = {}

---变更parent
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param parentElementid any parentelementID
---@return boolean result 是否成功
function Trigger.CustomUI:ChangeParent(playerid, uiid, elementid, parentElementid) end

---克隆element
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param widget3DObjId any widget3dobjID
---@return boolean result 是否成功
function Trigger.CustomUI:CloneElement(playerid, uiid, elementid, widget3DObjId) end

---创建element
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementType any 参数 elementType
---@param widget3DObjId any widget3dobjID
---@return boolean result 是否成功
function Trigger.CustomUI:CreateElement(playerid, uiid, elementType, widget3DObjId) end

---删除element
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@return boolean result 是否成功
function Trigger.CustomUI:DeleteElement(playerid, uiid, elementid) end

---获取element属性值
---@param playerid any 玩家ID
---@param elementid any 元件ID
---@param enumId any enumID
function Trigger.CustomUI:GetElementAttrValue(playerid, elementid, enumId) end

---获取进度条值
---@param objid any 对象ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param itype any 类型
---@return boolean value 是否成功
function Trigger.CustomUI:GetProgressBarValue(objid, uiid, elementid, itype) end

---获取screen大小
---@param objid any 对象ID
---@param ix any 索引
function Trigger.CustomUI:GetScreenSize(objid, ix) end

---隐藏element
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param effectid any 特效ID
---@param time any 时间（秒）
---@return boolean result 是否成功
function Trigger.CustomUI:HideElement(playerid, uiid, elementid, effectid, time) end

---makeelement动画
---@param animid any 动画ID
---@param time? any 时间（秒）
---@param mode any 模式
---@return table result 结果表
function Trigger.CustomUI:MakeElementAnim(animid, time, mode) end

---makesmooth移动by
---@param time? any 时间（秒）
---@param dir any 方向
---@param isadd any 是否添加
---@param len? any 参数 len
function Trigger.CustomUI:MakeSmoothMoveBy(time, dir, isadd, len) end

---makesmooth移动转换为
---@param time? any 时间（秒）
---@param x? any X坐标
---@param y? number Y坐标
---@return table result 结果表
function Trigger.CustomUI:MakeSmoothMoveTo(time, x, y) end

---makesmooth旋转by
---@param time? any 时间（秒）
---@param isadd any 是否添加
---@param angle? number 角度
---@return table result 结果表
function Trigger.CustomUI:MakeSmoothRotateBy(time, isadd, angle) end

---makesmooth旋转转换为
---@param time? any 时间（秒）
---@param angle? number 角度
---@return table result 结果表
function Trigger.CustomUI:MakeSmoothRotateTo(time, angle) end

---makesmooth缩放by
---@param time? any 时间（秒）
---@param dir any 方向
---@param isadd any 是否添加
---@param len? any 参数 len
function Trigger.CustomUI:MakeSmoothScaleBy(time, dir, isadd, len) end

---makesmooth缩放转换为
---@param time? any 时间（秒）
---@param w? any 参数 w
---@param h? number 高度
---@return table result 结果表
function Trigger.CustomUI:MakeSmoothScaleTo(time, w, h) end

---make界面文本动画
---@param animid any 动画ID
---@param time? number 时间（秒）
---@return table result 结果表
function Trigger.CustomUI:MakeUITextAnim(animid, time) end

---播放动画
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param info? table 信息
---@return boolean result 是否成功
function Trigger.CustomUI:PlayAnim(playerid, uiid, elementid, info) end

---播放smooth动画
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param info any 信息
---@return boolean result 是否成功
function Trigger.CustomUI:PlaySmoothAnim(playerid, uiid, elementid, info) end

---旋转element
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param rotate any 旋转
---@return boolean result 是否成功
function Trigger.CustomUI:RotateElement(playerid, uiid, elementid, rotate) end

---设置透明度
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param alpha any 透明度
---@return boolean result 是否成功
function Trigger.CustomUI:SetAlpha(playerid, uiid, elementid, alpha) end

---设置beaconband
---@param playerid integer | integer[] 玩家ID
---@param elementid any 元件ID
---@param itype any 类型
---@param param Mini.Vec3 | number 参数
---@param uiid any 界面ID
---@return boolean result 是否成功
function Trigger.CustomUI:SetBeaconBand(playerid, elementid, itype, param, uiid) end

---设置颜色
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param color any 颜色
---@return boolean result 是否成功
function Trigger.CustomUI:SetColor(playerid, uiid, elementid, color) end

---设置font大小
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param size any 大小
---@return boolean result 是否成功
function Trigger.CustomUI:SetFontSize(playerid, uiid, elementid, size) end

---设置loader模型
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param modelName any 模型名称
---@return boolean result 是否成功
function Trigger.CustomUI:SetLoaderModel(playerid, uiid, elementid, modelName) end

---设置loader模型动作
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param animid any 动画ID
---@param speed any 速度
---@param playmode any 播放模式
---@return boolean result 是否成功
function Trigger.CustomUI:SetLoaderModelAct(playerid, uiid, elementid, animid, speed, playmode) end

---设置loader模型方向
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param yaw any 偏航角
---@return boolean result 是否成功
function Trigger.CustomUI:SetLoaderModelDir(playerid, uiid, elementid, yaw) end

---设置loader模型缩放
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param scale any 缩放
---@return boolean result 是否成功
function Trigger.CustomUI:SetLoaderModelScale(playerid, uiid, elementid, scale) end

---设置位置
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param x any X坐标
---@param y any Y坐标
---@return boolean result 是否成功
function Trigger.CustomUI:SetPosition(playerid, uiid, elementid, x, y) end

---设置进度条resID
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param itype any 类型
---@param url any 资源地址
---@return boolean result 是否成功
function Trigger.CustomUI:SetProgressBarResId(playerid, uiid, elementid, itype, url) end

---设置进度条值
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param itype any 类型
---@param value any 值
---@return boolean result 是否成功
function Trigger.CustomUI:SetProgressBarValue(playerid, uiid, elementid, itype, value) end

---设置relation位置
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param v any 参数 v
---@param xOffset any 参数 xOffset
---@param xUnits any 参数 xUnits
---@param h any 高度
---@param yOffset any 参数 yOffset
---@param yUnits any 参数 yUnits
---@return boolean result 是否成功
function Trigger.CustomUI:SetRelationPosition(playerid, uiid, elementid, v, xOffset, xUnits, h, yOffset, yUnits) end

---设置relation大小
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param width any 参数 width
---@param widthUnits any 参数 widthUnits
---@param height any 参数 height
---@param heightUnits any 参数 heightUnits
---@return boolean result 是否成功
function Trigger.CustomUI:SetRelationSize(playerid, uiid, elementid, width, widthUnits, height, heightUnits) end

---设置大小
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param width any 参数 width
---@param height any 参数 height
---@return boolean result 是否成功
function Trigger.CustomUI:SetSize(playerid, uiid, elementid, width, height) end

---设置slider条图片
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param url any 资源地址
---@return boolean result 是否成功
function Trigger.CustomUI:SetSliderBarImg(playerid, uiid, elementid, url) end

---设置slider方向
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param dir any 方向
---@return boolean result 是否成功
function Trigger.CustomUI:SetSliderDir(playerid, uiid, elementid, dir) end

---设置spine动画ID
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param animid any 动画ID
---@param animindex any 参数 animindex
---@param playmode any 播放模式
---@return boolean result 是否成功
function Trigger.CustomUI:SetSpineAnimID(playerid, uiid, elementid, animid, animindex, playmode) end

---设置状态
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param pageIndex any 参数 pageIndex
---@param easeType any 参数 easeType
---@param time any 时间（秒）
---@return boolean result 是否成功
function Trigger.CustomUI:SetState(playerid, uiid, pageIndex, easeType, time) end

---设置文本
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param text any 文本
---@param info? table 信息
---@return boolean result 是否成功
function Trigger.CustomUI:SetText(playerid, uiid, elementid, text, info) end

---设置纹理
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param url any 资源地址
---@return boolean result 是否成功
function Trigger.CustomUI:SetTexture(playerid, uiid, elementid, url) end

---显示element
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param effectid any 特效ID
---@param time any 时间（秒）
---@return boolean result 是否成功
function Trigger.CustomUI:ShowElement(playerid, uiid, elementid, effectid, time) end

---smooth增加进度
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param time any 时间（秒）
---@param ptype any 参数 ptype
---@param value any 值
---@return boolean result 是否成功
function Trigger.CustomUI:SmoothIncreaseProgress(playerid, uiid, elementid, time, ptype, value) end

---停止动画
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param itype any 类型
---@return boolean result 是否成功
function Trigger.CustomUI:StopAnim(playerid, uiid, elementid, itype) end

---turnslider转换为位置
---@param playerid integer | integer[] 玩家ID
---@param uiid any 界面ID
---@param elementid any 元件ID
---@param x any X坐标
---@param y any Y坐标
---@return boolean result 是否成功
function Trigger.CustomUI:TurnSliderToPos(playerid, uiid, elementid, x, y) end
