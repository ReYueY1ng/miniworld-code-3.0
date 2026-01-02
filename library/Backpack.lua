---@meta

---背包模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/backpack.html)
---@class Backpack
Backpack = {}

---@alias GridInfos {
--- index: integer,
--- itemid: integer,
--- num: integer,
--- info: {
---     itemid: integer,
---     num: integer,
---     iteminsid: string,
---     durable: integer,
---     maxdurable: integer,
---     toughness: number,
---     gunDamage: number,
---     sid: string,
---     unserdata: number,
---     unserdata_ex: number,
---     userdata_s: string,
---     rune: table,
--- },
---}[]

---设置背包格道具
---@param playerid integer 玩家ID
---@param gridid integer 格子ID
---@param itemid integer | string 道具类型
---@param num? integer 道具数量(默认1)
---@param durability? integer 耐久值(默认1)
---@return boolean result
function Backpack:SetGridItem(playerid, gridid, itemid, num, durability) end

---移除背包格内一定数量道具
---@param playerid integer 玩家ID
---@param gridid integer 格子ID
---@param num? integer 道具数量(默认全部移除)
---@return boolean result
function Backpack:RemoveGridItem(playerid, gridid, num) end

---移除背包内一定数量道具，通过道具ID移除，默认全部移除
---@param playerid integer 玩家ID
---@param itemid integer | string 道具类型
---@param num? integer 道具数量
---@return integer ret 移除数量（ret and ret> 0 成功）
function Backpack:RemoveGridItemByItemID(playerid, itemid, num) end

---清空指定背包栏
---@param playerid integer 玩家ID
---@param bartype BackpackType 快捷栏枚举
---@return boolean result
function Backpack:ClearPack(playerid, bartype) end

---清空全部背包(包含背包栏、快捷栏、装备栏)
---@param playerid integer 玩家ID
---@return boolean result
function Backpack:ClearAllPack(playerid) end

---移动背包道具，默认全部转移
---@param playerid integer 玩家ID
---@param gridsrc integer 移动格子ID
---@param griddst integer 移动至的目标格子ID
---@param num? integer 道具数量(默认全部)
---@return boolean result
function Backpack:MoveGridItem(playerid, gridsrc, griddst, num) end

---交换背包道具
---@param playerid integer 玩家ID
---@param gridsrc integer 交换格子ID1
---@param griddst integer 交换格子ID2
---@return boolean result
function Backpack:SwapGridItem(playerid, gridsrc, griddst) end

---背包(包含背包栏、快捷栏)是否有足够的空间存放一定数量的道具
---@param playerid integer 玩家ID
---@param itemid integer | string 道具类型
---@param num? integer 道具数量(默认1)
---@return boolean result
function Backpack:EnoughSpaceForItem(playerid, itemid, num) end

---计算背包(包含背包栏、快捷栏)能存放的道具剩余总数量
---@param playerid integer 玩家ID
---@param itemid integer | string 道具类型
---@return integer leftNum 可以存放的数量
function Backpack:CalcSpaceNumForItem(playerid, itemid) end

---检测背包是否持有某个道具
---@param playerid integer 玩家ID
---@param bartype BackpackType 快捷栏枚举
---@param itemid integer | string 道具类型
---@return boolean result
function Backpack:HasItemByBackpackBar(playerid, bartype, itemid) end

---获取背包持有某个道具总数量，同时返回装有道具的背包格数组
---@param playerid integer 玩家ID
---@param bartype BackpackType 快捷栏枚举
---@param itemid integer | string 道具类型
---@return integer num 道具数量
---@return integer[] arr 格子ID数组
function Backpack:GetItemNumByBackpackBar(playerid, bartype, itemid) end

---获取背包持有某个道具总数量，同时返回装有道具的背包格数组
---@param playerid integer 玩家ID
---@param itemid integer | string 道具类型
---@param isAddEquip? boolean 是否添加装备栏(默认True)
---@return integer num 道具数量
---@return integer[] arr 格子ID数组
function Backpack:GetItemNum(playerid, itemid, isAddEquip) end

---获取背包格道具ID(返回itemid, num)
---@param playerid integer 玩家ID
---@param gridid integer 格子ID (BackpackBeginIndex.Shortcut + 0 是快捷栏第一个格子)
---@return integer | string itemid 道具类型
---@return integer num 道具数量 (无道具 数量是0 itemid是0)
function Backpack:GetGridItemID(playerid, gridid) end

---获取背包格道具名称
---@param playerid integer 玩家ID
---@param gridid integer 格子ID
---@return string name 道具名称
function Backpack:GetGridItemName(playerid, gridid) end

---添加道具到背包
---@param playerid integer 玩家ID
---@param itemid integer | string 道具类型
---@param num integer 道具数量
---@param prioritytype? integer 优先快捷栏还是背包栏：1优先快捷栏 2优先背包栏(默认1)
---@return integer num 成功添加的数量
function Backpack:AddItem(playerid, itemid, num, prioritytype) end

---丢弃背包某个格子里的道具
---@param playerid integer 玩家ID
---@param gridid integer 格子ID
---@param num? integer 道具数量
---@param ablePick? boolean 能否拾取
---@return boolean result
function Backpack:DiscardItem(playerid, gridid, num, ablePick) end

---丢弃背包某个格子里的道具
---@param playerid integer 玩家ID
---@param itemid integer | string 道具ID
---@param itemnum? integer 道具数量
---@return boolean result
function Backpack:DiscardItemByID(playerid, itemid, itemnum) end

---玩家穿上装备
---@param playerid integer 玩家ID
---@param itemid integer | string 道具类型
---@param frompos? integer 格子ID（可不传，如果不为nil，则必须和itemid一致）
---@return boolean result
function Backpack:ActEquipUpByResID(playerid, itemid, frompos) end

---玩家脱下装备栏装备
---@param playerid integer 玩家ID
---@param grid integer 装备栏ID(（EquipStartIndex + EquipSlotType.Head） 是装备栏第一个格子，EquipSlotType.Weapon 无效)
---@param grid2? integer 目标格子ID(可不传，如果不为nil，则必须是空格子)
---@return boolean result
function Backpack:ActEquipOffByEquipID(playerid, grid, grid2) end

---销毁装备
---@param playerid integer 玩家ID
---@param grid integer 装备栏ID(（EquipStartIndex + EquipSlotType.Head） 是装备栏第一个格子，EquipSlotType.Weapon 无效)
---@return boolean result
function Backpack:ActDestructEquip(playerid, grid) end

---创建道具到玩家背包
---@param playerid integer 玩家ID
---@param itemid integer 道具类型
---@param num integer 道具数量
---@param ipos? integer 优先存放的位置
---@return boolean result
function Backpack:CreateItem(playerid, itemid, num, ipos) end

---在手持道具上播放特效
---@param playerid integer 玩家ID
---@param effectid integer 特效ID
---@param scale number 特效缩放
---@return boolean result
function Backpack:PlayShortCutIxEffect(playerid, effectid, scale) end

---在手持道具上播放特效
---@param playerid integer 玩家ID
---@param effectids integer 特效ID
---@param offset PositionTable 偏移
---@param rot? PositionTable 旋转
---@param scale? PositionTable 缩放
---@return boolean result
function Backpack:PlayShortCutIxParticle(playerid, effectids, offset, rot, scale) end

---停止手持道具上播放特效
---@param playerid integer 玩家ID
---@param effectid integer 特效ID
---@return boolean result
function Backpack:StopShortCutIxEffect(playerid, effectid) end

---播放手持道具特效
---@param playerid integer 玩家ID
---@param itemid integer 道具类型
---@param effectid integer 特效ID
---@param offset PositionTable 偏移
---@param rot? PositionTable 旋转
---@param scale? PositionTable 缩放
---@return boolean result
function Backpack:PlayShortCutItemParticle(playerid, itemid, effectid, offset, rot, scale) end

---删除玩家快捷栏上某种类型道具手持特效
---@param playerid integer 玩家ID
---@param itemid integer | string 道具类型
---@param effectid integer 特效ID
---@return boolean result
function Backpack:StopShortCutItemEffect(playerid, itemid, effectid) end

---批量获取背包和快捷栏格子信息数据
---@param playerid integer 玩家ID
---@param begingridId integer 开始格子id
---@param endgridId integer 结束格子id 需要连续格子否则会返回""
---@return string? gridinfosjson 格子信息数据json (nil 失败 否则成功)
function Backpack:GetGridInfos(playerid, begingridId, endgridId) end

---加载背包和快捷栏格子信息数据
---@param playerid integer 玩家ID
---@param gridinfo string 格子信息数据json 需要相应格子没有物品否则会加载失败
---@return boolean result
function Backpack:LoadGridInfos(playerid, gridinfo) end

---解析格子信息数据
---@param str string GetGridInfos打包字符串
---@return GridInfos? gridinfos 格子信息数据 (nil 解析失败 否则成功 是个数组table 数组元素中(index 是打包的格子id info是格子详细信息 itemid是物品id num 是数量))
function Backpack:DecodeGridInfo(str) end

---将解析的格子信息数据打包
---@param infos GridInfos DecodeGridInfo 解析后的数据
---@return string gridinfosjson 格子信息数据json ("" 打包失败 否则成功)
function Backpack:EncodeTableGridInfo(infos) end

---设置背包和快捷栏格子锁定状态
---@param playerid integer 玩家ID
---@param begingridId integer 开始格子id
---@param endgridId integer 结束格子id 需要连续格子否则会返回失败
---@param lock boolean 锁定状态
---@return boolean result
function Backpack:SetGridsLock(playerid, begingridId, endgridId, lock) end

---批量清理背包格子数据
---@param playerid integer 玩家ID
---@param begingridId integer 开始格子id
---@param endgridId integer 结束格子id 需要连续格子否则会返回失败
---@return boolean result
function Backpack:ClearGrids(playerid, begingridId, endgridId) end

---设置背包格子数量
---@param playerid integer 玩家ID
---@param num integer 数量(0-100)
---@return boolean result
function Backpack:SetBackPackNum(playerid, num) end

---获取指定背包中所有道具实例
---@param playerid integer 玩家ID
---@param bartype BackpackType 快捷栏枚举
---@return string[] instanceIds 实例ID表
function Backpack:GetAllBackPackInstanceIds(playerid, bartype) end

---在玩家的背包内创建一个道具实例
---@param playerid integer 玩家Uin
---@param itemid integer | string 道具id
---@param gridIndex? integer 格子索引
---@return string? instId 道具实例ID
function Backpack:CreateItemInstInBackpack(playerid, itemid, gridIndex) end

---在玩家的背包内创建一把实例化的枪械
---@param playerid integer 玩家Uin
---@param itemid integer | string 道具id
---@param gridIndex? integer 格子索引
---@return string? instId 道具实例ID
function Backpack:CreateGunInBackpack(playerid, itemid, gridIndex) end

---根据背包索引获取道具实例id
---@param playerid integer 玩家Uin
---@param gridIndex integer 背包索引
---@return string? instId 道具实例id
function Backpack:GetInstIdByGridIndex(playerid, gridIndex) end

---获取背包所有实例化的枪械
---@param playerid integer 玩家Uin
---@return string[]? instanceIds 实例id数组
function Backpack:GetGunInstIdInBackpack(playerid) end

---获取背包格子是否锁定
---@param playerid integer 玩家Uin
---@param gridid integer 格子索引
---@return boolean islock 是否锁定（参数错误返回true）
function Backpack:IsLock(playerid, gridid) end

---获取背包格子属性
---@param playerid integer 玩家Uin
---@param gridid integer 格子索引
---@param attr GridAttr 属性枚举
---@return number value 属性值
function Backpack:GetGridAttr(playerid, gridid, attr) end

---设置背包格子属性
---@param playerid integer 玩家Uin
---@param gridid integer 格子索引
---@param attr GridAttr 属性枚举
---@param value number 属性值
---@return boolean result
function Backpack:SetGridAttr(playerid, gridid, attr, value) end
