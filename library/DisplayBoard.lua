---@meta

---显示板模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/displayboard.html)
---@class DisplayBoard
DisplayBoard = {}

---设置显示板文本
---@param playerid integer 玩家ID（0为全局设置，非0为指定玩家）
---@param objId integer 显示板对象ID
---@param text string 文本内容
---@return boolean result 是否设置成功
function DisplayBoard:SetText(playerid, objId, text) end

---获取显示板文本<br>**说明**: 查询结果通过 DataSycMgr 异步回传
---@param playerid integer 玩家ID（必须为非0的有效玩家）
---@param objId integer 显示板对象ID
---@return boolean result 是否发起查询成功
function DisplayBoard:GetText(playerid, objId) end

---设置显示板图片
---@param playerid integer 玩家ID（0为全局设置，非0为指定玩家）
---@param objId integer 显示板对象ID
---@param property DisplayBoardImgAttr 图片属性枚举
---@param image string 图片资源ID或路径
---@return boolean result 是否设置成功
function DisplayBoard:SetImage(playerid, objId, property, image) end

---获取显示板图片<br>**说明**: 查询结果通过 DataSycMgr 异步回传
---@param playerid integer 玩家ID（必须为非0的有效玩家）
---@param objId integer 显示板对象ID
---@param property DisplayBoardImgAttr 图片属性枚举
---@return boolean result 是否发起查询成功
function DisplayBoard:GetImage(playerid, objId, property) end

---设置显示板数值属性
---@param playerid integer 玩家ID（0为全局设置，非0为指定玩家）
---@param objId integer 显示板对象ID
---@param property DisplayBoardNumAttr 数值属性枚举
---@param value number 属性值
---@return boolean result 是否设置成功
function DisplayBoard:SetNumberAttr(playerid, objId, property, value) end

---获取显示板数值属性<br>**说明**: 查询结果通过 DataSycMgr 异步回传
---@param playerid integer 玩家ID（必须为非0的有效玩家）
---@param objId integer 显示板对象ID
---@param property DisplayBoardNumAttr 数值属性枚举
---@return boolean result 是否发起查询成功
function DisplayBoard:GetNumberAttr(playerid, objId, property) end

---设置显示板颜色
---@param playerid integer 玩家ID（0为全局设置，非0为指定玩家）
---@param objId integer 显示板对象ID
---@param property DisplayBoardColorAttr 颜色属性枚举
---@param color any 颜色值（数值、十六进制字符串或RGB表）
---@return boolean result 是否设置成功
function DisplayBoard:SetColor(playerid, objId, property, color) end

---获取显示板颜色<br>**说明**: 查询结果通过 DataSycMgr 异步回传
---@param playerid integer 玩家ID（必须为非0的有效玩家）
---@param objId integer 显示板对象ID
---@param property DisplayBoardColorAttr 颜色属性枚举
---@return boolean result 是否发起查询成功
function DisplayBoard:GetColor(playerid, objId, property) end

---平滑修改显示板数值属性
---@param playerid integer 玩家ID（0为全局设置，非0为指定玩家）
---@param objid integer 显示板对象ID
---@param property DisplayBoardNumAttr 数值属性枚举
---@param time number 过渡时长
---@param ptype integer 变化类型（1增加、2减少、其他为设置目标值）
---@param value number 目标值或变化量
---@return boolean result 是否开始平滑修改成功
function DisplayBoard:SmoothChangeAttr(playerid, objid, property, time, ptype, value) end

---生成文字显示板配置
---@param txt string 文本内容
---@param autoSize DisplayBoardAutoSize 文字自动大小枚举
---@param fontSize integer 字体大小
---@param color any 文字颜色（数值、十六进制字符串或RGB表）
---@param richText boolean 是否启用富文本
---@return table cfg 可传入CreateByPos或ReplaceByCfg的显示板配置
function DisplayBoard:GenTxtBoardCfg(txt, autoSize, fontSize, color, richText) end

---生成图片显示板配置
---@param image string 图片资源ID或路径
---@param fillMode ImageFillType 图片填充方式枚举
---@return table cfg 可传入CreateByPos或ReplaceByCfg的显示板配置
function DisplayBoard:GenImgBoardCfg(image, fillMode) end

---生成进度条显示板配置
---@param minVal number 最小值
---@param maxVal number 最大值
---@param curVal number 当前值
---@param progressColor any 进度颜色
---@param progressBgColor any 进度背景颜色
---@param progressBgColorType UIProgressType 进度条类型枚举
---@param direction UIBarProgressDirection|UIRowProgressDirection UI进度条方向枚举
---@return table cfg 可传入CreateByPos或ReplaceByCfg的显示板配置
function DisplayBoard:GenProgressBoardCfg(minVal, maxVal, curVal, progressColor, progressBgColor, progressBgColorType, direction) end

---生成自定义UI显示板配置
---@param CustomUi string 自定义UI工程ID
---@return table cfg 可传入CreateByPos或ReplaceByCfg的显示板配置
function DisplayBoard:GenCustomUIBoardCfg(CustomUi) end

---设置显示板可见性
---@param playerid integer 玩家ID（0为全局设置，非0为指定玩家）
---@param objid integer 显示板对象ID
---@param visible boolean 是否显示
---@return boolean result 是否设置成功
function DisplayBoard:SetVisible(playerid, objid, visible) end

---创建显示板
---@param pos table 创建位置{x:number,y:number,z:number}
---@param cfg table 显示板配置（GenXXX接口的返回值）
---@param offset table 显示板相对偏移（米）{x:number,y:number,z:number}
---@param rot table 显示板相对旋转（度）{x:number,y:number,z:number}
---@param absoluteScale table 显示板绝对世界缩放{x:number,y:number,z:number}
---@return integer|nil objId 创建的显示板对象ID；创建或应用配置失败时返回nil
function DisplayBoard:CreateByPos(pos, cfg, offset, rot, absoluteScale) end

---替换显示板配置
---@param playerid integer 玩家ID（0为全局设置，非0为指定玩家）
---@param objId integer 显示板对象ID
---@param cfg table 显示板配置（GenXXX接口的返回值）
---@return boolean result 是否替换成功
function DisplayBoard:ReplaceByCfg(playerid, objId, cfg) end

---获取显示板可见性<br>**说明**: 查询结果通过 DataSycMgr 异步回传
---@param playerid integer 玩家ID（必须为非0的有效玩家）
---@param objid integer 显示板对象ID
---@return boolean result 是否发起查询成功
function DisplayBoard:IsVisible(playerid, objid) end

---获取显示板内容类型<br>**说明**: 查询结果通过 DataSycMgr 异步回传
---@param playerid integer 玩家ID（必须为非0的有效玩家）
---@param objid integer 显示板对象ID
---@return boolean result 是否发起查询成功
function DisplayBoard:GetType(playerid, objid) end

---获取显示板界面<br>**说明**: 查询结果通过 DataSycMgr 异步回传
---@param playerid integer 玩家ID（必须为非0的有效玩家）
---@param objid integer 显示板对象ID
---@return boolean result 是否发起查询成功
function DisplayBoard:GetInterface(playerid, objid) end
