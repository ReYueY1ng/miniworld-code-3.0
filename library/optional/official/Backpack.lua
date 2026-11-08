---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Backpack<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param itemid any
function Backpack:ActCreateEquip(playerid, itemid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridid any
---@param gridtype any
function Backpack:AutoMoveGridItem(playerid, gridid, gridtype) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param itemid any
---@param num any
function Backpack:EnoughGridForItemMaxNum(playerid, itemid, num) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param bartype any
function Backpack:GetBackpackBarEmptyGridList(playerid, bartype) end

---官方环境独有接口（未收录于开发环境）
---@param bartype any
---@param objid any
function Backpack:GetBackpackBarIDRange(bartype, objid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param bartype any
function Backpack:GetBackpackBarItemList(playerid, bartype) end

---官方环境独有接口（未收录于开发环境）
---@param bartype any
---@param objid any
function Backpack:GetBackpackBarSize(bartype, objid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param bartype any
function Backpack:GetBackpackBarValidList(playerid, bartype) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param bartype any
function Backpack:GetBackpackBarValidListExtend(playerid, bartype) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
function Backpack:GetBackpackNum(playerid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridid any
function Backpack:GetGridDurability(playerid, gridid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridid any
function Backpack:GetGridEnchantList(playerid, gridid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridid any
function Backpack:GetGridInfoByIndex(playerid, gridid) end

---官方环境独有接口（未收录于开发环境）
---@param itemid any
---@param num any
function Backpack:GetGridInfoByItemidAndNum(itemid, num) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridid any
function Backpack:GetGridNum(playerid, gridid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridid any
function Backpack:GetGridStack(playerid, gridid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridid any
function Backpack:GetGridToolType(playerid, gridid) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param itemId any
function Backpack:GetItemCountInNormalPack(playerid, itemId) end

---官方环境独有接口（未收录于开发环境）
---@param iteminfo any
function Backpack:GetItemUsrerExp(iteminfo) end

---官方环境独有接口（未收录于开发环境）
---@param iteminfo any
function Backpack:GetItemUsrerinfo(iteminfo) end

---官方环境独有接口（未收录于开发环境）
function Backpack:GetMouseAttchedGridId() end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param bartype any
function Backpack:GetNotRodResIdGridId(playerid, bartype) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param bartype any
function Backpack:GetRodResIdList(playerid, bartype) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridId any
function Backpack:GetUserDataByGridId(playerid, gridId) end

---官方环境独有接口（未收录于开发环境）
---@param gridinfo any
function Backpack:GridInfoToString(gridinfo) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridid any
---@param gridinfo any
function Backpack:SetGridInfoByIndex(playerid, gridid, gridinfo) end

---官方环境独有接口（未收录于开发环境）
---@param iteminfo any
---@param name any
---@param desc any
---@param exp any
function Backpack:SetItemUsrerinfo(iteminfo, name, desc, exp) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridId any
---@param userData any
function Backpack:SetUserDataByGridId(playerid, gridId, userData) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param gridid any
function Backpack:SortPack(playerid, gridid) end

---官方环境独有接口（未收录于开发环境）
---@param str any
function Backpack:StringToGridInfo(str) end
