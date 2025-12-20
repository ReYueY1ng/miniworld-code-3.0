---@meta

---界面模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/customui.html)
---@class CustomUI
CustomUI = {}

---设置文本元件内容
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param text string 文本内容
---@param animid? integer 动画ID(缺省参数)
---@param time? number 动画时长(缺省参数)
---@param mode? integer 播放模式(缺省参数)
---@return boolean result
function CustomUI:SetText(playerid, uiid, elementid, text, animid, time, mode) end

---设置文本元件图案纹理
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param url string 图案纹理ID
---@return boolean result
function CustomUI:SetTexture(playerid, uiid, elementid, url) end

---设置元件大小
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param width number 元件宽度
---@param height number 元件高度
---@return boolean result
function CustomUI:SetSize(playerid, uiid, elementid, width, height) end

---设置文本元件字体大小
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param size number 字体大小
---@return boolean result
function CustomUI:SetFontSize(playerid, uiid, elementid, size) end

---设置文本元件颜色
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param color integer 颜色值(0xFFFFFF)
---@return boolean result
function CustomUI:SetColor(playerid, uiid, elementid, color) end

---显示元件
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param effectid? integer 动画ID(缺省参数)
---@param time? number 动画时长(缺省参数)
---@return boolean result
function CustomUI:ShowElement(playerid, uiid, elementid, effectid, time) end

---隐藏元件
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param effectid? integer 动画ID(缺省参数)
---@param time? number 动画时长(缺省参数)
---@return boolean result
function CustomUI:HideElement(playerid, uiid, elementid, effectid, time) end

---旋转元件
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param rotate number 旋转角度
---@return boolean result
function CustomUI:RotateElement(playerid, uiid, elementid, rotate) end

---设置透明度
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param alpha number 透明度
---@return boolean result
function CustomUI:SetAlpha(playerid, uiid, elementid, alpha) end

---设置状态
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param pageIndex string 状态值
---@param easeType? integer 缓动类型枚举(Easing)
---@param time? number 动画事件(缺省参数)
---@return boolean result
function CustomUI:SetState(playerid, uiid, elementid, pageIndex, easeType, time) end

---设置位置
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param x number X坐标值
---@param y number Y坐标值
---@return boolean result
function CustomUI:SetPosition(playerid, uiid, elementid, x, y) end

---设置装载器的模型缩放
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param x number X缩放
---@param y number Y缩放
---@return boolean result
function CustomUI:SetScale(playerid, uiid, elementid, x, y) end

---获取道具类型图标
---@param itemid integer | string 道具类型ID
---@return string icon 道具图标
function CustomUI:GetItemIcon(itemid) end

---获取生物图标
---@param objid integer 对象ID
---@return string icon 生物图标
function CustomUI:GetMonsterObjIcon(objid) end

---获取生物类型图标
---@param actor integer | string 道具类型ID
---@return string icon 道具图标
function CustomUI:GetMonsterIcon(actor) end

---获取状态图标
---@param buffid integer 状态类型ID
---@return string icon 状态图标
function CustomUI:GetStatusIcon(buffid) end

---获取方块类型图标
---@param blockid integer | string 方块类型ID
---@return string icon 方块图标
function CustomUI:GetBlockIcon(blockid) end

---获取玩家当前角色图标
---@param playerid integer 玩家ID
---@return string icon 角色图标
function CustomUI:GetRoleIcon(playerid) end

---获取玩家当前角色图标
---@param playerid integer 玩家ID
---@return string icon 角色图标
function CustomUI:GetRoleHeadIcon(playerid) end

---获取玩家快捷栏图标
---@param playerid integer 玩家ID
---@param ix number 快捷栏索引(1-8)
---@return string icon 道具图标
function CustomUI:GetShortcutIcon(playerid, ix) end

---元件平滑移动到指定位置
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param time number 执行时间(需大于0)
---@param x number 横坐标值
---@param y number 竖坐标值
---@return boolean result
function CustomUI:SmoothMoveTo(playerid, uiid, elementid, time, x, y) end

---元件平滑移动相对距离
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param time number 执行时间(需大于0)
---@param x number 横向距离
---@param y number 竖向距离
---@return boolean result
function CustomUI:SmoothMoveBy(playerid, uiid, elementid, time, x, y) end

---元件平滑改变到指定宽度和高度
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid number 元件ID
---@param time number 执行时间(需大于0)
---@param w number 宽度
---@param h number 高度
---@return boolean result
function CustomUI:SmoothScaleTo(playerid, uiid, elementid, time, w, h) end

---元件平滑改变相对宽度和高度
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid number 元件ID
---@param time number 执行时间(需大于0)
---@param w number 宽度
---@param h number 高度
---@return boolean result
function CustomUI:SmoothScaleBy(playerid, uiid, elementid, time, w, h) end

---元件平滑改变相对缩放大小（子节点也会改变大小）
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param time number 执行时间
---@param x number 目标X缩放值
---@param y number 目标Y缩放值
---@param delayTime? number 延迟时间
---@param easeType? integer 缓动枚举(Easing)
---@return boolean result
function CustomUI:SmoothScaleByEx(playerid, uiid, elementid, time, x, y, delayTime, easeType) end

---元件平滑旋转到指定角度
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid number 元件ID
---@param time number 执行时间(需大于0)
---@param angle number 角度值
---@return boolean result
function CustomUI:SmoothRotateTo(playerid, uiid, elementid, time, angle) end

---元件平滑旋转到相对角度
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid number 元件ID
---@param time number 执行时间(需大于0)
---@param angle number 角度值
---@return boolean result
function CustomUI:SmoothRotateBy(playerid, uiid, elementid, time, angle) end

---播放动画
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid number 元件ID
---@param animid integer 动画ID
---@param time number 单次执行时间(需大于0)
---@param mode integer 播放模式枚举(AnimMode)
---@param easetype? integer 缓动类型枚举(Easing)
---@param delaytime? number 延迟播放时间
---@param endvalue? number 动画的结束值
---@return boolean result
function CustomUI:PlayElementAnim(playerid, uiid, elementid, animid, time, mode, easetype, delaytime, endvalue) end

---元件停止动画
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid number 元件ID
---@param itype integer 类型（如果为0就是停止所有的UI的动效，1就是停止elementid对应的UI动效）
---@return boolean result
function CustomUI:StopAnim(playerid, uiid, elementid, itype) end

---设置装载器的模型（调用道具实例的模型：模型名称填ItemInstance_道具实例id）
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param modleName string 模型名称
---@return boolean result
function CustomUI:SetLoaderModel(playerid, uiid, elementid, modleName) end

---设置装载器的模型缩放
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param modlescale number 缩放大小
---@return boolean result
function CustomUI:SetLoaderModelScale(playerid, uiid, elementid, modlescale) end

---设置装载器的模型方向
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param yaw number 水平角度(角度制)
---@return boolean result
function CustomUI:SetLoaderModelDir(playerid, uiid, elementid, yaw) end

---设置装载器的模型位置坐标
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param x number 坐标x
---@param y number 坐标y
---@param z number 坐标z
---@return boolean result
function CustomUI:SetLoaderModelPosition(playerid, uiid, elementid, x, y, z) end

---设置装载器的模型动画
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param animid integer | string 动画ID
---@param playmode? number 播放模式(AnimMode)
---@return boolean result
function CustomUI:SetLoaderModelAct(playerid, uiid, elementid, animid, playmode) end

---滑动列表跳转到某位置
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param x number X坐标值
---@param y number y坐标值
---@return boolean result
function CustomUI:TurnSliderToPos(playerid, uiid, elementid, x, y) end

---设置滑动列表的滑动方式
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param dir integer 滑动方式（0仅左右，1仅上下，2自由滑动）
---@return boolean result
function CustomUI:SetSliderDir(playerid, uiid, elementid, dir) end

---设置滑动条的图案
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param url string 图片库链接
---@return boolean result
function CustomUI:SetSliderBarImg(playerid, uiid, elementid, url) end

---设置元件相对位置
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param v number 水平偏移枚举(HorizontalOffset)
---@param xOffset number x方向数值
---@param xUnits number 像素单位枚举(PixelUnits)
---@param h number 垂直偏移枚举(VerticalOffset)
---@param yOffset number y方向数值
---@param yUnits number 像素单位枚举(PixelUnits)
---@return boolean result
function CustomUI:SetRelationPosition(playerid, uiid, elementid, v, xOffset, xUnits, h, yOffset, yUnits) end

---设置元件相对大小
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param width number 宽度数值
---@param widthUnits number 像素单位枚举(PixelUnits)
---@param height number 高度数值
---@param heightUnits number 像素单位枚举(PixelUnits)
---@return boolean result
function CustomUI:SetRelationSize(playerid, uiid, elementid, width, widthUnits, height, heightUnits) end

---动态创建元件
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementType number 元件类型枚举(ElementType)
---@return string? elementid 新建出来元件ID
function CustomUI:CreateElement(playerid, uiid, elementType) end

---克隆元件
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 被克隆的元件ID
---@return string? elementid 克隆出来的元件ID
function CustomUI:CloneElement(playerid, uiid, elementid) end

---修改元件父元件
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param parentElementid string 父元件ID
---@return boolean result
function CustomUI:ChangeParent(playerid, uiid, elementid, parentElementid) end

---设置玩家界面进度条的值
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param itype integer 类型枚举(ProgressVal)
---@param value number 设定值
---@return boolean result
function CustomUI:SetProgressBarValue(playerid, uiid, elementid, itype, value) end

---获取玩家界面进度条的值
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param itype? integer 类型枚举(ProgressVal)
---@return number min 返回的值
---@return number max 返回的值
---@return number value 返回的值
function CustomUI:GetProgressBarValue(playerid, uiid, elementid, itype) end

---设置玩家界面进度条的纹理
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param itype integer 类型枚举(ProgressImg)
---@param url string 图片ID
---@return boolean result
function CustomUI:SetProgressBarResId(playerid, uiid, elementid, itype, url) end

---进度条文本平滑计时
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param bval number 开始值
---@param eval number 结束值
---@param time number 执行时间
---@return boolean result
function CustomUI:SmoothChangeProgress(playerid, uiid, elementid, bval, eval, time) end

---设置动画元件动画ID
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param animid integer 内置动画ID
---@param animindex integer 动画序列
---@param playmode number 播放模式(ViedoPlayMode)
---@return boolean result
function CustomUI:SetSpineAnimID(playerid, uiid, elementid, animid, animindex, playmode) end

---进度条文本平滑增加计时
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@param time number 时长
---@param ptype number 类型枚举（1增加，2减小，3 变化至）
---@param value number 变化的值
---@return boolean result
function CustomUI:SmoothIncreaseProgress(playerid, uiid, elementid, time, ptype, value) end

---设置伤害文本
---@param playerid integer 玩家ID
---@param elementid string 元件ID
---@param objid integer 对象ID
---@param text string 文本
---@param color integer 颜色
---@param offsetx number 偏移X
---@param offsety number 偏移Y
---@param movex number 移动X
---@param movey number 移动Y
---@param showtime number 显示时长
---@param movex2? number 移动X2
---@param movey2? number 移动Y2
---@param showtime2? number 显示时长2
---@return boolean result
function CustomUI:SetFloatDamageTxt(playerid, elementid, objid, text, color, offsetx, offsety, movex, movey, showtime, movex2, movey2, showtime2) end

---获取客机屏幕分辨率
---@param playerid integer 玩家ID
---@return integer width 长
---@return integer height 宽
function CustomUI:GetScreenSize(playerid) end

---删除元件
---@param playerid integer 玩家ID
---@param uiid string 界面ID
---@param elementid string 元件ID
---@return boolean result
function CustomUI:DeleteElement(playerid, uiid, elementid) end