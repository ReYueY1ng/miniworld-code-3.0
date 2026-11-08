---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· CustomUI<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---添加loader模型avatar部件
---@param playerid number 玩家ID
---@param uiid any 界面ID
---@param elementid string 元件ID
---@param idModel number ID模型
---@param ePart number 部件
---@return boolean result 是否成功
function CustomUI:AddLoaderModelAvatarPart(playerid, uiid, elementid, idModel, ePart) end

---alterloader模型avatar部件颜色
---@param playerid number 玩家ID
---@param uiid any 界面ID
---@param elementid string 元件ID
---@param idModel number ID模型
---@param ePart number 部件
---@param aMaskToColors table 参数 aMaskToColors
---@return boolean result 是否成功
function CustomUI:AlterLoaderModelAvatarPartColor(playerid, uiid, elementid, idModel, ePart, aMaskToColors) end

---变更avator模型
---@param avatorval any 参数 avatorval
function CustomUI:ChangeAvatorModel(avatorval) end

---启用设置枪械magazine
---@param playerid any 玩家ID
---@param b any 参数 B
---@return boolean result 是否成功
function CustomUI:EnableSetGunMagazine(playerid, b) end

---获取avatar部件colors
---@param ePart number 部件
---@return boolean value 是否成功
function CustomUI:GetAvatarPartColors(ePart) end

---获取horsepreviewicon
---@param horseid number horseID
---@return string value 结果字符串
function CustomUI:GetHorsePreviewIcon(horseid) end

---按Uin获取玩家
---@param objid any 对象ID
function CustomUI:GetPlayerByUin(objid) end

---获取skindeficon
---@param skinid number skinID
---@return string value 结果字符串
function CustomUI:GetSkinDefIcon(skinid) end

---获取skinpreviewicon
---@param skinid number skinID
---@return string value 结果字符串
function CustomUI:GetSkinPreviewIcon(skinid) end

---全局转换为local
---@param reportid any 同步报告ID
---@param playerid any 玩家ID
---@param uiid any 界面ID
---@param elementid string 元件ID
---@param x number X坐标
---@param y number Y坐标
---@return boolean result 是否成功
function CustomUI:GlobalToLocal(reportid, playerid, uiid, elementid, x, y) end

---判断是否validtarget
---@param objid any 对象ID
---@return boolean result 是否满足条件
function CustomUI:IsValidTarget(objid) end

---设置bounceback
---@param playerid any 玩家ID
---@param uiid any 界面ID
---@param elementid string 元件ID
---@param bOpen boolean 是否打开
---@return boolean result 是否成功
function CustomUI:SetBounceback(playerid, uiid, elementid, bOpen) end

---设置float造成伤害txtex
---@param playerid any 玩家ID
---@param elementid any 元件ID
---@param x any X坐标
---@param y any Y坐标
---@param text any 文本
---@param offsetx? number 参数 offsetx
---@param offsety? number 参数 offsety
---@param movex? number 参数 movex
---@param movey? number 参数 movey
---@param showtime? number 显示时间
---@param movex2? number 参数 movex2
---@param movey2? number 参数 movey2
---@param showtime2? number 参数 showtime2
---@return boolean result 是否成功
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

---设置spinetouch
---@param playerid any 玩家ID
---@param uiid any 界面ID
---@param elementid string 元件ID
---@param bOpen boolean 是否打开
---@return boolean result 是否成功
function CustomUI:SetSpineTouch(playerid, uiid, elementid, bOpen) end

---同步pic检查status
---@param playerid number 玩家ID
---@param uin string 玩家Uin
---@param photoInfos table 参数 photoInfos
---@return boolean result 是否成功
function CustomUI:SyncPicCheckStatus(playerid, uin, photoInfos) end

---turnslider转换为索引
---@param playerid any 玩家ID
---@param uiid any 界面ID
---@param elementid string 元件ID
---@param index number 索引
---@return boolean result 是否成功
function CustomUI:TurnSliderToIndex(playerid, uiid, elementid, index) end
