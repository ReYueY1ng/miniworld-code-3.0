---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· CustomUI<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param uiid any
---@param elementid string
---@param idModel number
---@param ePart number
---@return boolean
function CustomUI:AddLoaderModelAvatarPart(playerid, uiid, elementid, idModel, ePart) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param uiid any
---@param elementid string
---@param idModel number
---@param ePart number
---@param aMaskToColors table
---@return boolean
function CustomUI:AlterLoaderModelAvatarPartColor(playerid, uiid, elementid, idModel, ePart, aMaskToColors) end

---官方环境独有接口（未收录于开发环境）
---@param avatorval any
function CustomUI:ChangeAvatorModel(avatorval) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param b any
---@return boolean
function CustomUI:EnableSetGunMagazine(playerid, b) end

---官方环境独有接口（未收录于开发环境）
---@param ePart number
---@return boolean
function CustomUI:GetAvatarPartColors(ePart) end

---官方环境独有接口（未收录于开发环境）
---@param horseid number
---@return string
function CustomUI:GetHorsePreviewIcon(horseid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function CustomUI:GetPlayerByUin(objid) end

---官方环境独有接口（未收录于开发环境）
---@param skinid number
---@return string
function CustomUI:GetSkinDefIcon(skinid) end

---官方环境独有接口（未收录于开发环境）
---@param skinid number
---@return string
function CustomUI:GetSkinPreviewIcon(skinid) end

---官方环境独有接口（未收录于开发环境）
---@param reportid any
---@param playerid any
---@param uiid any
---@param elementid string
---@param x number
---@param y number
---@return boolean
function CustomUI:GlobalToLocal(reportid, playerid, uiid, elementid, x, y) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function CustomUI:IsValidTarget(objid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param uiid any
---@param elementid string
---@param bOpen boolean
---@return boolean
function CustomUI:SetBounceback(playerid, uiid, elementid, bOpen) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param elementid any
---@param x any
---@param y any
---@param text any
---@param offsetx? number
---@param offsety? number
---@param movex? number
---@param movey? number
---@param showtime? number
---@param movex2? number
---@param movey2? number
---@param showtime2? number
---@return boolean
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

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param uiid any
---@param elementid string
---@param bOpen boolean
---@return boolean
function CustomUI:SetSpineTouch(playerid, uiid, elementid, bOpen) end

---官方环境独有接口（未收录于开发环境）
---@param playerid number
---@param uin string
---@param photoInfos table
---@return boolean
function CustomUI:SyncPicCheckStatus(playerid, uin, photoInfos) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param uiid any
---@param elementid string
---@param index number
---@return boolean
function CustomUI:TurnSliderToIndex(playerid, uiid, elementid, index) end
