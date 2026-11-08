---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Backpack<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---动作创建装备
---@param playerid number 玩家ID
---@param itemid number | string 道具ID
---@return boolean result 是否成功
function Backpack:ActCreateEquip(playerid, itemid) end

---auto移动格子道具
---@param playerid any 玩家ID
---@param gridid number 格子ID
---@param gridtype number 格子类型
---@return boolean result 是否成功
function Backpack:AutoMoveGridItem(playerid, gridid, gridtype) end

---为道具最大数量enough格子
---@param playerid number 玩家ID
---@param itemid? number | string 道具ID
---@param num number 数量
function Backpack:EnoughGridForItemMaxNum(playerid, itemid, num) end

---获取背包条empty格子列表
---@param playerid any 玩家ID
---@param bartype any 进度条类型
function Backpack:GetBackpackBarEmptyGridList(playerid, bartype) end

---获取背包条ID范围
---@param bartype any 进度条类型
---@param objid any 对象ID
function Backpack:GetBackpackBarIDRange(bartype, objid) end

---获取背包条道具列表
---@param playerid any 玩家ID
---@param bartype any 进度条类型
function Backpack:GetBackpackBarItemList(playerid, bartype) end

---获取背包条大小
---@param bartype any 进度条类型
---@param objid any 对象ID
function Backpack:GetBackpackBarSize(bartype, objid) end

---获取背包条valid列表
---@param playerid any 玩家ID
---@param bartype any 进度条类型
function Backpack:GetBackpackBarValidList(playerid, bartype) end

---获取背包条valid列表extend
---@param playerid number 玩家ID
---@param bartype number 进度条类型
function Backpack:GetBackpackBarValidListExtend(playerid, bartype) end

---获取背包数量
---@param playerid number 玩家ID
function Backpack:GetBackpackNum(playerid) end

---获取格子durability
---@param playerid number 玩家ID
---@param gridid number 格子ID
function Backpack:GetGridDurability(playerid, gridid) end

---获取格子enchant列表
---@param playerid any 玩家ID
---@param gridid any 格子ID
function Backpack:GetGridEnchantList(playerid, gridid) end

---按索引获取格子信息
---@param playerid any 玩家ID
---@param gridid any 格子ID
function Backpack:GetGridInfoByIndex(playerid, gridid) end

---按itemidand数量获取格子信息
---@param itemid? string 道具ID
---@param num any 数量
function Backpack:GetGridInfoByItemidAndNum(itemid, num) end

---获取格子数量
---@param playerid any 玩家ID
---@param gridid any 格子ID
function Backpack:GetGridNum(playerid, gridid) end

---获取格子stack
---@param playerid number 玩家ID
---@param gridid number 格子ID
function Backpack:GetGridStack(playerid, gridid) end

---获取格子tool类型
---@param playerid any 玩家ID
---@param gridid any 格子ID
function Backpack:GetGridToolType(playerid, gridid) end

---在normalpack中获取道具统计
---@param playerid any 玩家ID
---@param itemId string 道具ID
function Backpack:GetItemCountInNormalPack(playerid, itemId) end

---获取道具usrer经验
---@param iteminfo any 道具信息
---@return number value 结果数值
function Backpack:GetItemUsrerExp(iteminfo) end

---获取道具usrerinfo
---@param iteminfo any 道具信息
function Backpack:GetItemUsrerinfo(iteminfo) end

---获取mouseattched格子ID
function Backpack:GetMouseAttchedGridId() end

---获取notrodresID格子ID
---@param playerid any 玩家ID
---@param bartype any 进度条类型
function Backpack:GetNotRodResIdGridId(playerid, bartype) end

---获取rodresID列表
---@param playerid any 玩家ID
---@param bartype any 进度条类型
function Backpack:GetRodResIdList(playerid, bartype) end

---按格子ID获取user数据
---@param playerid any 玩家ID
---@param gridId? any 格子ID
function Backpack:GetUserDataByGridId(playerid, gridId) end

---格子信息转换为string
---@param gridinfo table 参数 gridinfo
---@return string result 结果字符串
function Backpack:GridInfoToString(gridinfo) end

---按索引设置格子信息
---@param playerid any 玩家ID
---@param gridid any 格子ID
---@param gridinfo table 参数 gridinfo
---@return boolean result 是否成功
function Backpack:SetGridInfoByIndex(playerid, gridid, gridinfo) end

---设置道具usrerinfo
---@param iteminfo any 道具信息
---@param name any 名称
---@param desc any 描述
---@param exp any 经验值
function Backpack:SetItemUsrerinfo(iteminfo, name, desc, exp) end

---按格子ID设置user数据
---@param playerid any 玩家ID
---@param gridId? any 格子ID
---@param userData any 参数 userData
---@return boolean result 是否成功
function Backpack:SetUserDataByGridId(playerid, gridId, userData) end

---sortpack
---@param playerid number 玩家ID
---@param gridid number 格子ID
---@return boolean result 是否成功
function Backpack:SortPack(playerid, gridid) end

---string转换为格子信息
---@param str any 字符串
function Backpack:StringToGridInfo(str) end
