---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· CustomUI<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---为界面模型元件添加角色部件
---元件ID为空或参数类型错误时返回 false
---@param playerid number 玩家ID
---@param uiid integer 界面ID
---@param elementid string 元件ID
---@param idModel number 角色模型ID
---@param ePart number 部件类型
---@return boolean result 是否成功
function CustomUI:AddLoaderModelAvatarPart(playerid, uiid, elementid, idModel, ePart) end

---修改界面模型元件角色部件的颜色
---元件ID为空或 aMaskToColors 不是表时返回 false
---@param playerid number 玩家ID
---@param uiid integer 界面ID
---@param elementid string 元件ID
---@param idModel number 角色模型ID
---@param ePart number 部件类型
---@param aMaskToColors table 遮罩到颜色的映射表
---@return boolean result 是否成功
function CustomUI:AlterLoaderModelAvatarPartColor(playerid, uiid, elementid, idModel, ePart, aMaskToColors) end

---把角色模型ID转换为引擎可用的模型数据
---首次调用会缓存 ChangeModelManager 中的全部角色模型数据
---@param avatorval any 角色模型ID
---@return string? modeldata 模型JSON数据，未找到时为 nil
function CustomUI:ChangeAvatorModel(avatorval) end

---开启或关闭设置枪械弹匣的能力
---直接调用引擎全局 EnableSetGunMagazine，不校验玩家
---@param playerid integer 玩家ID
---@param b any true 表示允许
---@return boolean result 固定为 true
function CustomUI:EnableSetGunMagazine(playerid, b) end

---获取角色模型各部件颜色配置
---参数名沿用 ePart，实际引擎按模型ID查询 StoreAvatarData
---@param ePart number 模型ID（引擎按该模型查询部件RGBA配置）
---@return table? colors 部件颜色表，未配置时为 nil
function CustomUI:GetAvatarPartColors(ePart) end

---获取坐骑预览图标的资源名
---@param horseid number 坐骑ID
---@return string value 图标资源名，参数非数字时为空串
function CustomUI:GetHorsePreviewIcon(horseid) end

---按Uin查找玩家对象
---@param objid integer 玩家Uin
---@return userdata? player 玩家对象，未找到时为 nil
function CustomUI:GetPlayerByUin(objid) end

---获取皮肤默认图标的资源名
---@param skinid number 皮肤ID
---@return string value 图标资源名，参数非数字时为空串
function CustomUI:GetSkinDefIcon(skinid) end

---获取皮肤预览图标的资源名
---@param skinid number 皮肤ID
---@return string value 图标资源名，参数非数字时为空串
function CustomUI:GetSkinPreviewIcon(skinid) end

---把全局屏幕坐标换算为界面元件局部坐标
---换算结果通过 DataSycMgr 上报 {x, y}，失败时上报空表
---参数非法或元件ID为空时返回 false
---@param reportid integer 同步报告ID，换算结果回传给主机
---@param playerid integer 玩家ID
---@param uiid integer 界面ID
---@param elementid string 元件ID
---@param x number 全局X坐标
---@param y number 全局Y坐标
---@return boolean result 是否已发起换算
function CustomUI:GlobalToLocal(reportid, playerid, uiid, elementid, x, y) end

---判断对象能否作为界面3D绑定目标
---@param objid integer 对象ID
---@return boolean result 是否可作为绑定目标
function CustomUI:IsValidTarget(objid) end

---设置元件是否开启回弹效果
---@param playerid integer 玩家ID
---@param uiid integer 界面ID
---@param elementid string 元件ID
---@param bOpen boolean 是否开启
---@return boolean result 是否成功
function CustomUI:SetBounceback(playerid, uiid, elementid, bOpen) end

---在屏幕坐标处播放飘字伤害文本
---坐标按 UIFrameMgr 屏幕缩放换算
---在子线程中分两段播放并淡出，调用后立即返回
---UIEditorDef 不可用时返回 false
---@param playerid integer 玩家ID
---@param elementid integer 元件ID
---@param x number 屏幕X坐标
---@param y number 屏幕Y坐标
---@param text string 显示文本
---@param offsetx? number 起始X偏移，默认 0
---@param offsety? number 起始Y偏移，默认 0
---@param movex? number 第一段X位移，默认 0
---@param movey? number 第一段Y位移，默认 0
---@param showtime? number 第一段时长（秒），默认 0.2
---@param movex2? number 第二段X位移，默认 0
---@param movey2? number 第二段Y位移，默认 0
---@param showtime2? number 第二段时长（秒），默认 0.5
---@return boolean result 是否已开始播放
function CustomUI:SetFloatDamageTxtEx(
    playerid,
    elementid,
    x,
    y,
    text,
    offsetx,
    offsety,
    movex,
    movey,
    showtime,
    movex2,
    movey2,
    showtime2
)
end

---设置Spine元件是否响应点击
---@param playerid integer 玩家ID
---@param uiid integer 界面ID
---@param elementid string 元件ID
---@param bOpen boolean 是否响应
---@return boolean result 是否成功
function CustomUI:SetSpineTouch(playerid, uiid, elementid, bOpen) end

---同步玩家照片的审核状态
---依赖 FlowerSeaMapPhotoData 实例，未初始化时直接返回 nil
---@param playerid number 玩家ID
---@param uin string 玩家Uin（字符串）
---@param photoInfos table 照片信息表：进入游戏时为 {isClientEnterGame=true, photos={{resId, openSvr}}}，否则为 {resId, openSvr}
---@return boolean? result 是否已处理，数据缺失时为 nil
function CustomUI:SyncPicCheckStatus(playerid, uin, photoInfos) end

---把滑动条切换到指定索引
---引擎调用完成后仍返回 false，不能以返回值判断是否生效
---@param playerid integer 玩家ID
---@param uiid integer 界面ID
---@param elementid string 元件ID
---@param index number 目标索引，需大于等于 0
---@return boolean result 固定为 false，实际切换已直接作用到界面
function CustomUI:TurnSliderToIndex(playerid, uiid, elementid, index) end
