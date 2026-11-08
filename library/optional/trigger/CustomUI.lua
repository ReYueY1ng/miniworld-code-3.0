---@meta

---触发器 CustomUI 模块（Trigger.CustomUI）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.CustomUI
Trigger.CustomUI = {}

---把指定元件挂到新的父元件下
---多个玩家时前一个失败后不再处理后续玩家
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 被移动的元件ID
---@param parentElementid string 新的父元件ID
---@return boolean? result 引擎变更父子关系的结果，UI 环境不可用时为 nil
function Trigger.CustomUI:ChangeParent(playerid, uiid, elementid, parentElementid) end

---克隆指定元件并由引擎生成新的元件ID
---新元件ID格式为 `<原元件ID>#clone<序号>`，同一元件重复克隆序号递增
---多玩家时前一个失败后不再处理后续玩家
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 被克隆的元件ID
---@param widget3DObjId integer 3D 界面对象ID，普通界面传 0
---@return boolean|string|nil result 主机侧成功时为新元件ID，失败为 false，客机侧为 nil
function Trigger.CustomUI:CloneElement(playerid, uiid, elementid, widget3DObjId) end

---在指定界面下动态创建元件并返回新元件ID
---新元件ID格式为 `<界面ID>_new<序号>`，按玩家分别递增
---数字界面ID会先解析成界面工程ID
---客机侧只执行本地创建，返回值不代表创建结果
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，可为数字或字符串，为空时直接返回 false
---@param elementType number 元件类型枚举（ElementType）
---@param widget3DObjId integer 3D 界面对象ID，普通界面传 0
---@return boolean|string|nil result 主机侧成功时为新元件ID，失败为 false，客机侧为 nil
function Trigger.CustomUI:CreateElement(playerid, uiid, elementType, widget3DObjId) end

---删除指定界面中的元件
---引擎服务删除后无条件返回 false，不能用返回值判断是否删除成功
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 要删除的元件ID
---@return boolean result 固定为 false，删除动作已执行
function Trigger.CustomUI:DeleteElement(playerid, uiid, elementid) end

---读取元件属性，位置尺寸等复合属性按 X/Y 分量返回
---复合属性先查 Position(103)、Size(104)、ScrollPosition(105)、GlobalPos(106) 再拆出分量
---其他枚举直接透传引擎的元件属性查询
---@param playerid integer 玩家ID，同时作为结果上报目标
---@param elementid integer 元件ID
---@param enumId any 属性枚举（ElementAttr）：3/4 位置X/Y，6/7 宽高，12/13 滚动X/Y，14/15 全局坐标X/Y
---@return any? value 属性值，Id(2) 返回元件ID字符串，取不到时为 nil
function Trigger.CustomUI:GetElementAttrValue(playerid, elementid, enumId) end

---读取进度条元件的最小值、最大值或当前值
---界面未打开或元件不存在时取不到数值
---类型 4 返回引擎的 NUMBERGROUP 临时数组，元素依次为最小值、最大值
---@param objid integer 对象ID，同时作为结果上报目标
---@param uiid string 界面ID，为空时返回 false
---@param elementid string 进度条元件ID
---@param itype number 取值类型（ProgressVal）：1 最小值，2 最大值，3 当前值，4 最小值与最大值
---@return number|table|boolean|nil value 数值、类型 4 的 [最小值, 最大值] 临时数组，或失败标记
function Trigger.CustomUI:GetProgressBarValue(objid, uiid, elementid, itype) end

---取目标客机屏幕的宽度或高度
---尺寸以目标端实际上报值为准
---接口只返回单个数，不会返回整张宽高表
---@param objid integer 对象ID，同时作为结果上报目标
---@param ix any 取哪一维："w" 宽度，"h" 高度
---@return number? size 依 ix 取到的屏幕宽或高，取数失败或 ix 不是 w/h 时为 nil
function Trigger.CustomUI:GetScreenSize(objid, ix) end

---隐藏指定元件，可附带播放隐藏动画
---动画分支不校验元件是否存在，直接返回 true
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 元件ID
---@param effectid number 隐藏动画ID，0 表示不使用动画
---@param time number 动画时长（秒），大于 0 且 effectid 不为 0 时播放动画
---@return boolean? result 播放动画分支固定为 true，否则为引擎隐藏操作的结果
function Trigger.CustomUI:HideElement(playerid, uiid, elementid, effectid, time) end

---组装元件动画参数表供 PlayAnim 使用
---只构造参数，不触发播放
---@param animid number | string 动画ID
---@param time? number 播放时长（秒），缺省为 0
---@param mode any 播放模式，与引擎动画模式编号一致
---@return table info 形如 {animid = 动画ID, time = 时长, mode = 模式} 的表
function Trigger.CustomUI:MakeElementAnim(animid, time, mode) end

---组装平滑偏移移动参数表供 PlaySmoothAnim 使用
---isadd 传 3 时改为移动到语义（type 1，另一轴留 nil），否则为偏移语义（type 2，另一轴补 0）
---@param time? number 时长（秒），缺省为 0
---@param dir Mini.Vec3 "x" 按水平方向偏移，其他值一律按垂直方向处理
---@param isadd number 1 或 3 表示正向偏移，其他值反向
---@param len? number 偏移量，缺省时直接返回 false
---@return boolean|table info 成功为参数表，len 缺省时为 false
function Trigger.CustomUI:MakeSmoothMoveBy(time, dir, isadd, len) end

---组装平滑移动到指定坐标的参数表
---@param time? number 时长（秒），缺省为 0
---@param x? number 目标X坐标，缺省为 0
---@param y? number 目标Y坐标，缺省为 0
---@return table info 形如 {type = 1, time = 时长, x = X, y = Y} 的表
function Trigger.CustomUI:MakeSmoothMoveTo(time, x, y) end

---组装平滑相对旋转参数表
---isadd 传 3 时改为旋转到语义（type 5），角度按正向处理
---@param time? number 时长（秒），缺省为 0
---@param isadd number 1 或 3 表示正向旋转，其他值反向
---@param angle? number 旋转角度，缺省为 0
---@return table info 形如 {type = 6 或 5, time = 时长, angle = 角度} 的表
function Trigger.CustomUI:MakeSmoothRotateBy(time, isadd, angle) end

---组装平滑旋转到指定角度的参数表
---@param time? number 时长（秒），缺省为 0
---@param angle? number 目标角度，缺省为 0
---@return table info 形如 {type = 5, time = 时长, angle = 角度} 的表
function Trigger.CustomUI:MakeSmoothRotateTo(time, angle) end

---组装平滑缩放偏移参数表
---isadd 传 3 时改为缩放到语义（type 3），否则为缩放偏移语义（type 4，另一轴补 0）
---@param time? number 时长（秒），缺省为 0
---@param dir Mini.Vec3 "w" 改宽度，其他值一律按高度处理
---@param isadd number 1 或 3 表示正向缩放，其他值反向
---@param len? number 缩放变化量，缺省时直接返回 false
---@return boolean|table info 成功为参数表，len 缺省时为 false
function Trigger.CustomUI:MakeSmoothScaleBy(time, dir, isadd, len) end

---组装平滑缩放到指定宽高的参数表
---@param time? number 时长（秒），缺省为 0
---@param w? any 目标宽度，缺省为 0
---@param h? number 目标高度，缺省为 0
---@return table info 形如 {type = 3, time = 时长, w = 宽, h = 高} 的表
function Trigger.CustomUI:MakeSmoothScaleTo(time, w, h) end

---组装文本元件动画参数表，模式固定为 2
---与 MakeElementAnim 的区别是 mode 固定为文本动画模式
---@param animid number | string 文本动画ID
---@param time? number 时长（秒），缺省为 0
---@return table info 形如 {mode = 2, animid = 动画ID, time = 时长} 的表
function Trigger.CustomUI:MakeUITextAnim(animid, time) end

---按参数表播放元件动画
---info.animid、info.time、info.mode 必须都是数字且 time 大于 0，否则类型校验失败返回 false
---多玩家时前一个失败后不再处理后续玩家
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid integer 界面ID，为空时直接返回 false
---@param elementid integer 元件ID
---@param info? table 动画参数表，缺省为 {}
---@return boolean result 是否触发成功
function Trigger.CustomUI:PlayAnim(playerid, uiid, elementid, info) end

---按参数表对元件播放平滑动画
---info 缺省或缺少 type 时返回 false 且不做动画
---type 不在 1~6 范围内时不执行任何动画但仍返回 true
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid integer 界面ID，为空时直接返回 false
---@param elementid integer 元件ID
---@param info any MakeSmooth* 生成的参数表，type 取 1~6 决定动画类别
---@return boolean result 是否触发成功
function Trigger.CustomUI:PlaySmoothAnim(playerid, uiid, elementid, info) end

---设置元件的旋转角度
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 元件ID
---@param rotate number 旋转角度（角度制）
---@return boolean? result 引擎设置旋转的结果，UI 环境不可用时为 nil
function Trigger.CustomUI:RotateElement(playerid, uiid, elementid, rotate) end

---设置元件的透明度
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 元件ID
---@param alpha number 透明度，0~100
---@return boolean? result 引擎设置透明度的结果，UI 环境不可用时为 nil
function Trigger.CustomUI:SetAlpha(playerid, uiid, elementid, alpha) end

---设置信标元件指向的坐标或对象
---类型 0 要求 param 为 table，类型 1 要求 param 为大于 0 的数字，否则直接返回 false
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param elementid integer 信标元件ID
---@param itype number 信标定位类型（BeaconMapType）：0 世界坐标，1 对象
---@param param Mini.Vec3 | number 类型 0 传含 x/y/z 的表，类型 1 传大于 0 的对象ID
---@param uiid integer 界面ID，为空时直接返回 false
---@return boolean? result 引擎设置信标的结果，参数类型不符时为 false
function Trigger.CustomUI:SetBeaconBand(playerid, elementid, itype, param, uiid) end

---设置文本元件的颜色
---十六进制字符串会补齐或截断到 6 位后转换，非法字符串返回 false
---表形式按 0~255 取整并合成 RGB 数值
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 元件ID
---@param color number 颜色：数字、"0xRRGGBB" 或 "RRGGBB" 字符串、{r, g, b} 表
---@return boolean? result 引擎设置颜色的结果，颜色非法时为 false 或 nil
function Trigger.CustomUI:SetColor(playerid, uiid, elementid, color) end

---设置文本元件的字体大小
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 元件ID
---@param size number 字体大小
---@return boolean? result 引擎设置字号的结果，UI 环境不可用时为 nil
function Trigger.CustomUI:SetFontSize(playerid, uiid, elementid, size) end

---设置装载器元件显示的模型
---模型名必须含 "_" 才会被解析，否则直接失败
---主机侧解析前缀后通过同步广播给客户端，客机分支执行完仍返回 false
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 装载器元件ID
---@param modelName string 模型名，形如 `类型_ID`；avator、ModelCompObj、ItemInstance 前缀会被解析成实际模型
---@return boolean result 主机侧为同步下发结果，客机侧固定为 false
function Trigger.CustomUI:SetLoaderModel(playerid, uiid, elementid, modelName) end

---设置装载器模型播放的动画
---引擎侧参数顺序是（animid, playmode, speed），本接口已代为对调
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 装载器元件ID
---@param animid number | string 动画ID，数字或字符串
---@param speed number 播放速度，0~1
---@param playmode number 播放模式（AnimMode）
---@return boolean? result 引擎设置模型动画的结果，参数类型不符时为 false
function Trigger.CustomUI:SetLoaderModelAct(playerid, uiid, elementid, animid, speed, playmode) end

---设置装载器模型的水平朝向
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 装载器元件ID
---@param yaw number 水平旋转角度（角度制）
---@return boolean? result 引擎设置朝向的结果，UI 环境不可用时为 nil
function Trigger.CustomUI:SetLoaderModelDir(playerid, uiid, elementid, yaw) end

---设置装载器模型的缩放大小
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 装载器元件ID
---@param scale number 缩放比例，需不小于 0
---@return boolean? result 引擎设置缩放的结果，UI 环境不可用时为 nil
function Trigger.CustomUI:SetLoaderModelScale(playerid, uiid, elementid, scale) end

---设置元件在界面中的坐标位置
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 元件ID
---@param x number X坐标
---@param y number Y坐标
---@return boolean? result 引擎设置坐标的结果，x/y 非数字时返回 false
function Trigger.CustomUI:SetPosition(playerid, uiid, elementid, x, y) end

---设置进度条元件的背景或进度纹理
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 进度条元件ID
---@param itype number 纹理类型（ProgressImg）：1 背景图，2 进度图
---@param url string 图片资源ID
---@return boolean? result 引擎设置纹理的结果，类型越界时为 nil
function Trigger.CustomUI:SetProgressBarResId(playerid, uiid, elementid, itype, url) end

---设置进度条元件的最小值、最大值或当前值
---类型 4 会连发两次设置，两次都成功才返回 true
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 进度条元件ID
---@param itype number 赋值类型（ProgressVal）：1 最小值，2 最大值，3 当前值，4 最大值与当前值同时设为 value
---@param value number 设定的数值
---@return boolean? result 是否设置成功，类型或元件ID非法时为 nil
function Trigger.CustomUI:SetProgressBarValue(playerid, uiid, elementid, itype, value) end

---按锚点与单位设置元件的相对偏移位置
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 元件ID
---@param v number 水平偏移基准（HorizontalOffset）
---@param xOffset number X偏移值
---@param xUnits number X单位（PixelUnits）
---@param h number 垂直偏移基准（VerticalOffset）
---@param yOffset number Y偏移值
---@param yUnits number Y单位（PixelUnits）
---@return boolean? result 引擎设置相对位置的结果，UI 环境不可用时为 nil
function Trigger.CustomUI:SetRelationPosition(playerid, uiid, elementid, v, xOffset, xUnits, h, yOffset, yUnits) end

---按单位设置元件的相对宽高
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 元件ID
---@param width number 宽度值
---@param widthUnits number 宽度单位（PixelUnits）
---@param height number 高度值
---@param heightUnits number 高度单位（PixelUnits）
---@return boolean? result 引擎设置相对大小的结果，UI 环境不可用时为 nil
function Trigger.CustomUI:SetRelationSize(playerid, uiid, elementid, width, widthUnits, height, heightUnits) end

---设置元件的尺寸
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 元件ID
---@param width number 元件宽度
---@param height number 元件高度
---@return boolean? result 引擎设置尺寸的结果，UI 环境不可用时为 nil
function Trigger.CustomUI:SetSize(playerid, uiid, elementid, width, height) end

---设置滑动条的滑块图案
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 滑动条或滑动列表元件ID
---@param url string 滑块图案资源ID或链接
---@return boolean? result 引擎设置图案的结果，url 为空时为 false
function Trigger.CustomUI:SetSliderBarImg(playerid, uiid, elementid, url) end

---限制滑动列表的滑动方向
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 滑动列表元件ID
---@param dir number 滑动方式：0 仅左右，1 仅上下，2 自由滑动
---@return boolean? result 引擎设置滑动方向的结果，UI 环境不可用时为 nil
function Trigger.CustomUI:SetSliderDir(playerid, uiid, elementid, dir) end

---设置动画元件的动画ID、序列与播放模式
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 动画元件ID
---@param animid number 内置动画ID，数字或字符串
---@param animindex number 动画序列
---@param playmode number 播放模式（生成定义中写作 ViedoPlayMode）
---@return boolean? result 引擎设置动画的结果，参数缺失或类型不符时为 false
function Trigger.CustomUI:SetSpineAnimID(playerid, uiid, elementid, animid, animindex, playmode) end

---切换界面状态，可带缓动过渡
---只有 time 大于 0 且 easeType 不小于 0 时才走缓动过渡，否则立即切换
---标识含多个 "-" 时只取最后一个分段，前段为空则用 uiid 作为界面ID
---状态段为空或 time 为负时直接返回 false
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param pageIndex string 状态标识，形如 `界面ID-状态ID` 或 `状态ID-页面ID`，必须含 "-"
---@param easeType number 缓动类型（Easing），缺省 -1 表示无缓动
---@param time number 过渡时长（秒），缺省为 0
---@return boolean? result 引擎切换状态的结果，参数不合法时为 false
function Trigger.CustomUI:SetState(playerid, uiid, pageIndex, easeType, time) end

---设置文本元件的内容，可带打字机等动画
---只有 animid 不为 0、time 大于 0 且三个字段都是数字时才走动画分支，否则直接改文本
---主机侧会先拆分多语言标记串再同步给客户端
---多玩家时前一个失败后不再处理后续玩家
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 文本元件ID
---@param text string 文本内容
---@param info? table 动画参数表 {animid, time, mode}，缺省为 {mode = 0, animid = 0, time = 0}
---@return boolean result 是否下发成功
function Trigger.CustomUI:SetText(playerid, uiid, elementid, text, info) end

---设置元件的图案纹理
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 元件ID
---@param url string 图案纹理资源ID
---@return boolean? result 引擎设置纹理的结果，UI 环境不可用时为 nil
function Trigger.CustomUI:SetTexture(playerid, uiid, elementid, url) end

---显示指定元件，可附带播放显示动画
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 元件ID
---@param effectid number 显示动画ID，0 表示不使用动画
---@param time number 动画时长（秒），大于 0 且 effectid 不为 0 时播放动画
---@return boolean? result 播放动画分支固定为 true，否则为引擎显示操作的结果
function Trigger.CustomUI:ShowElement(playerid, uiid, elementid, effectid, time) end

---让进度条在指定时长内平滑增加、减少或变化到目标值
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 进度条元件ID
---@param time number 时长（秒）
---@param ptype number 变化方式：1 增加，2 减少，3 变化至
---@param value number 变化值
---@return boolean? result 引擎平滑修改的结果，参数类型不符时为 false
function Trigger.CustomUI:SmoothIncreaseProgress(playerid, uiid, elementid, time, ptype, value) end

---停止元件上正在播放的动画
---itype 被引擎当作动画类型参数传入停止接口，脚本层只补默认值不做范围校验
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 元件ID
---@param itype number 停止类型：0 全部动效，1 指定元件动效，缺省按 1 处理
---@return boolean result 是否已下发停止指令
function Trigger.CustomUI:StopAnim(playerid, uiid, elementid, itype) end

---让滑动列表滚动到指定坐标
---@param playerid integer | integer[] 玩家ID或玩家ID数组
---@param uiid string 界面ID，为空时直接返回 false
---@param elementid string 滑动列表元件ID
---@param x number 目标X坐标
---@param y number 目标Y坐标
---@return boolean? result 引擎滚动操作的结果，UI 环境不可用时为 nil
function Trigger.CustomUI:TurnSliderToPos(playerid, uiid, elementid, x, y) end
