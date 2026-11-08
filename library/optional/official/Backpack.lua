---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Backpack<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---为玩家创建指定装备并直接放入对应装备栏
---玩家已装备同类道具时改为向背包添加一件，背包放不下则在玩家位置生成掉落物
---目标装备格已有道具时先移入快捷栏或背包栏，无空位则直接丢弃
---@param playerid number 玩家ID
---@param itemid number | string 道具ID（数字配置ID或资源ID字符串）
---@return boolean result 是否创建成功
function Backpack:ActCreateEquip(playerid, itemid) end

---把格子内的道具自动移动到指定类型的背包栏
---@param playerid integer 玩家ID
---@param gridid number 格子ID
---@param gridtype number 目标栏类型（1 快捷栏，2 背包栏，3 装备栏，4 扩展背包）
---@return boolean result 是否成功
function Backpack:AutoMoveGridItem(playerid, gridid, gridtype) end

---计算指定道具最多还能放入多少个，且不超过给定数量
---结果受剩余空格与道具堆叠上限共同限制
---@param playerid number 玩家ID
---@param itemid? number | string 道具ID（数字配置ID或资源ID字符串）
---@param num number 希望放入的数量，传 0 时返回可用空间总量
---@return number? maxnum 实际可放入的数量上限，参数非法或背包对象不存在时为 nil
function Backpack:EnoughGridForItemMaxNum(playerid, itemid, num) end

---获取指定背包栏中空格子的列表
---查询失败或背包对象不存在时返回 nil
---@param playerid integer 玩家ID
---@param bartype number 栏类型（1 快捷栏，2 背包栏，3 装备栏，4 扩展背包）
---@return number? num 空格数量
---@return table? arr 空格列表，元素为 {gridid = 格子ID}
function Backpack:GetBackpackBarEmptyGridList(playerid, bartype) end

---获取指定背包栏的起始与结束格子ID
---快捷栏固定 8 格（1000 起）；背包栏从 0 开始按背包格子数计算
---装备栏从 8000 到披风槽，扩展背包从 58000 开始
---未知栏类型或玩家未解锁扩展背包时两个返回值均为 nil
---@param bartype number 栏类型（1 快捷栏，2 背包栏，3 装备栏，4 扩展背包）
---@param objid integer 玩家ID，栏位范围按该玩家背包计算
---@return number? begid 起始格子ID
---@return integer? endid 结束格子ID
function Backpack:GetBackpackBarIDRange(bartype, objid) end

---获取指定背包栏内的道具ID列表并去重
---查询失败或背包对象不存在时返回 nil
---@param playerid integer 玩家ID
---@param bartype number 栏类型（1 快捷栏，2 背包栏，3 装备栏，4 扩展背包）
---@return number? num 道具种类数
---@return table? arr 道具ID数组
function Backpack:GetBackpackBarItemList(playerid, bartype) end

---获取指定背包栏的格子总数
---由起始与结束格子ID推算，未知栏类型时为 nil
---@param bartype number 栏类型（1 快捷栏，2 背包栏，3 装备栏，4 扩展背包）
---@param objid integer 玩家ID，栏位范围按该玩家背包计算
---@return number? size 格子数量
function Backpack:GetBackpackBarSize(bartype, objid) end

---获取指定背包栏中非空格子的ID列表
---查询失败或背包对象不存在时返回 nil
---@param playerid integer 玩家ID
---@param bartype number 栏类型（1 快捷栏，2 背包栏，3 装备栏，4 扩展背包）
---@return number? num 非空格数量
---@return table? arr 格子ID数组
function Backpack:GetBackpackBarValidList(playerid, bartype) end

---获取指定背包栏非空格子的格子ID、道具与数量
---bartype 为装备栏时额外包含 3 个自定义装备槽
---全部为空或背包对象不存在时返回 nil
---@param playerid number 玩家ID
---@param bartype number 栏类型（1 快捷栏，2 背包栏，3 装备栏，4 扩展背包）
---@return number? num 条目数
---@return table? arr 列表，元素为 {gridid, itemid, itemnum}
function Backpack:GetBackpackBarValidListExtend(playerid, bartype) end

---获取玩家背包栏的格子数量
---参数非法或背包对象不存在时为 nil
---@param playerid number 玩家ID
---@return number? num 背包栏格子数
function Backpack:GetBackpackNum(playerid) end

---获取格子的当前与最大耐久度
---格子被锁定、参数非法或取值失败时两个返回值均为 nil
---@param playerid number 玩家ID
---@param gridid number 格子ID
---@return number? cur 当前耐久
---@return number? max 最大耐久
function Backpack:GetGridDurability(playerid, gridid) end

---获取格子内道具的附魔ID列表
---查询失败或背包对象不存在时返回 nil
---@param playerid integer 玩家ID
---@param gridid integer 格子ID
---@return number? num 附魔数量
---@return table? arr 附魔ID数组
function Backpack:GetGridEnchantList(playerid, gridid) end

---按格子ID读取格子的完整信息
---格子被锁定、无道具或JSON解析失败时返回 nil
---@param playerid integer 玩家ID
---@param gridid integer 格子ID
---@return table? info 格子信息表，由引擎JSON解析得到
function Backpack:GetGridInfoByIndex(playerid, gridid) end

---按道具ID与数量构造格子信息模板
---仅构造模板，不写入背包，可直接传给 SetGridInfoByIndex
---资源ID无法解析时为 nil
---@param itemid? string 道具ID（数字配置ID或资源ID字符串）
---@param num number 数量
---@return table? iteminfo 格子信息表，字段含 itemid、num、durable、toughness、sid、userdata_s 等
function Backpack:GetGridInfoByItemidAndNum(itemid, num) end

---获取格子内道具的堆叠数量
---查询失败或背包对象不存在时为 nil
---@param playerid integer 玩家ID
---@param gridid integer 格子ID
---@return number? num 道具数量
function Backpack:GetGridNum(playerid, gridid) end

---获取格子的当前数量与最大堆叠数
---格子被锁定或参数非法时两个返回值均为 nil
---@param playerid number 玩家ID
---@param gridid number 格子ID
---@return number? num 当前数量
---@return number? maxstack 最大堆叠数
function Backpack:GetGridStack(playerid, gridid) end

---获取格子内道具的工具类型
---格子为空、被锁定或查询失败时为 nil
---@param playerid integer 玩家ID
---@param gridid integer 格子ID
---@return number? toolType 工具类型ID
function Backpack:GetGridToolType(playerid, gridid) end

---统计普通背包中指定道具的总数量
---资源ID无法解析时按 0 处理
---背包对象不存在时为 nil
---@param playerid integer 玩家ID
---@param itemId string 道具ID（支持资源ID字符串）
---@return number? count 道具总数量
function Backpack:GetItemCountInNormalPack(playerid, itemId) end

---读取道具自定义数据中的经验值
---字段名沿用引擎拼写 ModeItemExp
---@param iteminfo any 道具信息表，需含 userdata_s 字段
---@return number exp 经验值，缺失或解析失败时为 0
function Backpack:GetItemUsrerExp(iteminfo) end

---读取道具自定义数据中的名称、描述与经验
---userdata_s 解析失败时三个返回值均为 nil
---@param iteminfo any 道具信息表，需含 userdata_s 字段
---@return string? name 自定义名称
---@return string? desc 自定义描述
---@return number? exp 经验值
function Backpack:GetItemUsrerinfo(iteminfo) end

---获取鼠标当前拖拽吸附的格子ID
---仅在客户端存在拖拽交互时有值
---@return number? gridid 格子ID，未拖拽时为 nil
function Backpack:GetMouseAttchedGridId() end

---获取指定背包栏内非杆类格子的格子与道具信息
---工具类型为 31 的杆类格子会被排除
---列表为空或栏位范围无效时为 nil
---@param playerid integer 玩家ID
---@param bartype number 栏类型（1 快捷栏，2 背包栏，3 装备栏，4 扩展背包）
---@return table? list 列表，元素为 {gridId, itemId, itemNum}
function Backpack:GetNotRodResIdGridId(playerid, bartype) end

---获取指定背包栏内杆类格子的资源ID与自定义数据
---只收集工具类型为 31（杆类）且有资源ID的格子
---userData 由格子 userdata 字符串JSON解析得到
---列表为空或栏位范围无效时为 nil
---@param playerid integer 玩家ID
---@param bartype number 栏类型（1 快捷栏，2 背包栏，3 装备栏，4 扩展背包）
---@return table? list 列表，元素为 {resId, gridId, userData}
function Backpack:GetRodResIdList(playerid, bartype) end

---按格子ID读取格子自定义数据
---数据以JSON字符串形式存储于格子，无数据或解析失败时为 nil
---@param playerid integer 玩家ID
---@param gridId? integer 格子ID
---@return table? data 自定义数据表
function Backpack:GetUserDataByGridId(playerid, gridId) end

---把格子信息表编码为JSON字符串
---@param gridinfo table 格子信息表
---@return string result JSON字符串，编码失败时为空串
function Backpack:GridInfoToString(gridinfo) end

---按格子ID写入格子的完整信息
---格子被锁定或 gridinfo 不是表时返回 false
---@param playerid integer 玩家ID
---@param gridid integer 格子ID
---@param gridinfo table 格子信息表
---@return boolean result 引擎是否写入成功
function Backpack:SetGridInfoByIndex(playerid, gridid, gridinfo) end

---把自定义名称、描述与经验写入道具数据字符串
---结果写入 iteminfo.userdata_s，键名为 ModItemName、ModItemDesc、ModeItemExp
---全部省略时写入空对象 {}
---@param iteminfo any 道具信息表
---@param name string 自定义名称，可省略
---@param desc string 自定义描述，可省略
---@param exp number 经验值，可省略
function Backpack:SetItemUsrerinfo(iteminfo, name, desc, exp) end

---把表数据序列化后写入格子自定义数据
---写入后会触发背包格子变更回调
---userData 为空或格子不存在时返回 false
---@param playerid integer 玩家ID
---@param gridId? integer 格子ID
---@param userData any 自定义数据表
---@return boolean result 是否写入成功
function Backpack:SetUserDataByGridId(playerid, gridId, userData) end

---从指定格子开始整理背包
---实际排序由引擎完成，接口只检查背包对象是否存在
---@param playerid number 玩家ID
---@param gridid number 起始格子ID
---@return boolean result 是否成功
function Backpack:SortPack(playerid, gridid) end

---把JSON字符串解析为格子信息表
---@param str string 待解析字符串
---@return table? info 解析结果，失败时为 nil
function Backpack:StringToGridInfo(str) end
