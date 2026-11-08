---@meta

---触发器 Backpack 模块（Trigger.Backpack）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Backpack
Trigger.Backpack = {}

---销毁玩家装备栏中指定格子的装备
---仅支持头部到自定义3槽位，武器槽直接返回 false
---@param data integer | integer[] 玩家ID或其数组
---@param equipid integer 装备栏格子ID（装备栏起始+槽位，武器槽无效）
---@return boolean result 是否销毁成功
function Trigger.Backpack:ActDestructEquip(data, equipid) end

---把装备栏中的装备脱下
---自动寻找空格子，快捷栏优先、其次背包栏
---没有空格子时装备直接丢弃
---@param data integer | integer[] 玩家ID或其数组
---@param equipid integer 装备栏格子ID，武器槽无效
---@return boolean result 是否脱下成功
function Trigger.Backpack:ActEquipOffByEquipID(data, equipid) end

---让玩家自动穿上背包中的指定装备
---依次在快捷栏、背包栏查找该道具
---目标装备格已有道具时交换位置
---道具不是装备类型或找不到可穿位置时返回 false
---@param data integer | integer[] 玩家ID或其数组
---@param itemid number | string 道具类型ID，数字配置ID或资源ID字符串
---@return boolean result 是否穿上成功
function Trigger.Backpack:ActEquipUpByResID(data, itemid) end

---向玩家背包添加道具
---固定优先放入快捷栏，放不下再进背包栏
---道具不可被脚本使用时返回 false
---返回值只反映调用是否成功，不代表实际放入数量
---@param num number 道具数量，需大于 0
---@param itemid number | string 道具类型ID，数字配置ID或资源ID字符串
---@param data integer | integer[] 玩家ID或其数组
---@return boolean result 是否添加成功，玩家背包不可用时为 false
function Trigger.Backpack:AddItem(num, itemid, data) end

---按指定优先位置创建道具
---装备栏创建失败时回落到背包栏
---各栏都放不下的剩余数量会在玩家位置生成掉落物
---ipos 为其他值时按快捷栏+背包栏处理
---@param itemnum number 道具数量，需大于 0
---@param itemid number | string 道具类型ID
---@param data integer | integer[] 玩家ID或其数组
---@param ipos any 优先存放栏（BackpackType）：1 快捷栏，2 背包栏，3 装备栏
---@return boolean result 是否创建成功
function Trigger.Backpack:CreateItemID(itemnum, itemid, data, ipos) end

---丢弃玩家背包中指定类型的道具
---按背包栏、快捷栏顺序查找后丢弃
---数量不足或道具不存在时也返回 true
---@param data integer | integer[] 玩家ID或其数组
---@param itemnum number 丢弃数量，需大于 0
---@param itemid number | string 道具类型ID
---@return boolean result 是否执行成功
function Trigger.Backpack:DiscardItemByID(data, itemnum, itemid) end

---检查玩家背包能否装下指定数量的道具
---统计范围包含背包栏与快捷栏
---@param objid integer 玩家ID
---@param itemnum number 道具数量
---@param itemid number | string 道具类型ID
---@return boolean result 是否有足够空间
function Trigger.Backpack:EnoughSpaceForItem(objid, itemnum, itemid) end

---读取玩家指定背包格的道具ID
---格子ID换算：快捷栏 1000+序号-1，背包栏 序号-1，装备栏 8000+序号-1
---方法名 Shurt 是引擎原始拼写
---@param playerid integer 玩家ID
---@param gridtype number 格子类型（BackpackType）：1 快捷栏，2 背包栏，3 装备栏
---@param index number 格子在栏内的序号，从 1 开始
---@return integer|string? itemid 道具ID，MOD 道具为资源ID字符串，格子为空或参数无效时为 nil
function Trigger.Backpack:GetShurtItemid(playerid, gridtype, index) end

---读取玩家指定背包格的道具数量
---@param playerid integer 玩家ID
---@param gridtype number 格子类型（BackpackType）：1 快捷栏，2 背包栏，3 装备栏
---@param index number 格子在栏内的序号，从 1 开始
---@return integer? num 道具数量，格子为空或参数无效时为 nil
function Trigger.Backpack:GetShurtItemnum(playerid, gridtype, index) end

---在玩家手持指定道具时播放特效
---effectid 不是数字或找不到特效定义时返回 false
---@param data integer | integer[] 玩家ID或其数组
---@param itemid number | string 道具类型ID
---@param effectid number | string 特效ID，仅支持数字
---@param scale number 缩放
---@return boolean result 是否播放成功
function Trigger.Backpack:PlayShortCutItemEffect(data, itemid, effectid, scale) end

---在玩家手持指定道具时播放粒子特效
---@param data integer | integer[] 玩家ID或其数组
---@param itemid number 道具类型ID
---@param effectids integer | integer[] 粒子特效ID/名称或数组
---@param offset? table 偏移，默认 {x=0,y=0,z=0}
---@param rot? table 旋转，默认 {x=0,y=0,z=0}
---@param scale? table 缩放，默认 {x=1,y=1,z=1}
---@return boolean result 是否播放成功
function Trigger.Backpack:PlayShortCutItemParticle(data, itemid, effectids, offset, rot, scale) end

---播放玩家手持道具的特效
---数字特效ID会先查特效定义再取名称
---@param data integer | integer[] 玩家ID或其数组
---@param effectid number | string 特效ID或特效名
---@param scale number 缩放
---@return boolean result 是否播放成功
function Trigger.Backpack:PlayShortCutIxEffect(data, effectid, scale) end

---播放玩家手持道具的粒子特效
---@param data integer | integer[] 玩家ID或其数组
---@param effectids integer | integer[] 粒子特效ID/名称或数组
---@param offset? table 偏移，默认 {x=0,y=0,z=0}
---@param rot? table 旋转，默认 {x=0,y=0,z=0}
---@param scale? table 缩放，默认 {x=1,y=1,z=1}
---@return boolean result 是否播放成功
function Trigger.Backpack:PlayShortCutIxParticle(data, effectids, offset, rot, scale) end

---移除指定背包格内的道具
---格子被锁定时不执行并返回 false
---@param data integer | integer[] 玩家ID或其数组
---@param gridid number 格子ID
---@param itemnum number 移除数量，需大于 0
---@return boolean result 是否移除成功
function Trigger.Backpack:RemoveGridItem(data, gridid, itemnum) end

---按道具ID从背包移除一定数量
---实际移除数量为 0 时返回 false
---@param data integer | integer[] 玩家ID或其数组
---@param itemnum number 移除数量，需大于 0
---@param itemid number | string 道具类型ID
---@return boolean result 是否实际移除了道具
function Trigger.Backpack:RemoveItem(data, itemnum, itemid) end

---直接设置背包指定格子中的道具
---格子被锁定或道具不可被脚本使用时返回 false
---@param data integer | integer[] 玩家ID或其数组
---@param gridid number 格子ID
---@param itemid number | string 道具类型ID
---@param itemnum number 道具数量，需大于 0
---@return boolean result 是否设置成功
function Trigger.Backpack:SetGridItem(data, gridid, itemid, itemnum) end

---停止玩家手持指定道具时播放的特效
---@param data integer | integer[] 玩家ID或其数组
---@param itemid number 道具类型ID
---@param effectids integer | integer[] 特效ID/名称或数组
---@return boolean result 是否执行成功
function Trigger.Backpack:StopShortCutItemEffect(data, itemid, effectids) end

---停止玩家手持道具上播放的特效
---@param data integer | integer[] 玩家ID或其数组
---@param effectids integer | integer[] 特效ID/名称或数组
---@return boolean result 是否执行成功
function Trigger.Backpack:StopShortCutIxEffect(data, effectids) end
