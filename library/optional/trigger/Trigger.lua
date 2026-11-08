---@meta

---触发器 API（Trigger 命名空间）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量；全局接口请使用 World / Actor 等模块。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger
---@field Actor Trigger.Actor 角色模块
---@field Area Trigger.Area 区域模块
---@field ArrayTmp Trigger.ArrayTmp 临时数组模块
---@field Backpack Trigger.Backpack 背包模块
---@field Block Trigger.Block 方块模块
---@field Buff Trigger.Buff 状态模块
---@field Component Trigger.Component 组件模块
---@field CustomUI Trigger.CustomUI 界面模块
---@field DisplayBoard Trigger.DisplayBoard 显示板模块
---@field GameObject Trigger.GameObject 对象模块
---@field Graphics Trigger.Graphics 图文信息模块
---@field Item Trigger.Item 道具模块
---@field KvMap Trigger.KvMap KV 表模块
---@field Math Trigger.Math 数学模块
---@field Monster Trigger.Monster 生物模块
---@field Player Trigger.Player 玩家模块
---@field Timeline Trigger.Timeline 时间轴模块
---@field World Trigger.World 世界模块
Trigger = {}

---返回表示全部攻击类型的占位值
---脚本层没有具体枚举，仅回传 -1 供参数位使用
---@return integer value 固定为 -1，表示全部攻击类型
function Trigger:AllAttackType() end

---返回表示全部音效的占位值
---@return integer value 固定为 -1，表示全部音效
function Trigger:AllSound() end

---把传入的状态参数原样返回，用作全部状态的占位
---@param data integer | integer[] 状态参数，可为单个状态ID或状态ID数组
---@return any data 传入的 data 本身
function Trigger:AllStatus(data) end

---把任意值转成字符串，表结构优先取 val 字段
---不含 val 的普通表会得到 "table: 0x..." 形式的地址字符串
---@param value table 待转换的值，为含 val 字段的表时取 val
---@return string text 转换后的文本
function Trigger:AnyValue2Str(value) end

---对单个对象或数组中的每个对象依次执行回调
---只有 __className_ 为 VarArray 的 table、带 Size 方法的 userdata 才会展开，其他值当作单个对象处理
---回调的返回值被忽略
---@param src integer | integer[] | number 单个对象或对象数组（VarArray）
---@param fn function 逐个对象执行的回调，入参为该对象本身
function Trigger:DoObjOrArrayAction(src, fn) end

---从属性参数表中取出角色或玩家属性值
---先取 actorattrval，取不到再回退 playerattrval
---@param param table 属性参数表，含 actorattrval 或 playerattrval 字段
---@return any value 属性值，两个字段都为空或入参非 table 时为 nil
function Trigger:GetAttrVal(param) end

---读取特效组件所使用的道具ID
---@param cmp any 特效组件对象
---@return number? itemid 特效道具ID，组件不支持该能力或参数为空时为 nil
function Trigger:GetEffectParams(cmp) end

---校验元件ID是否属于指定界面并原样返回
---按 "_" 拆分后比较第一段，比较是字符串相等，uiID 建议传字符串
---元件ID为 nil 时直接返回空字符串
---@param uiID integer 界面ID，与元件ID的 `界面ID_` 前缀比较
---@param elementid? integer 待校验的元件ID
---@return string result 属于该界面时返回元件ID，否则返回空字符串
function Trigger:GetElementID(uiID, elementid) end

---取最近一次创建的方块ID
---@return number|string? blockid 最近记录的方块ID，未记录时为 nil
function Trigger:GetLastCreateBlockId() end

---取最近一次创建的生物ID
---@return integer? actorid 最近记录的生物ID，未记录时为 nil
function Trigger:GetLastCreateCreatureId() end

---取最近一次创建的生物对象实例ID
---该值由引擎在创建生物对象时写入，触发器侧没有对应的 setter 接口
---@return integer? objid 最近创建的生物对象ID，未记录时为 nil
function Trigger:GetLastCreateCreatureObjId() end

---取最近一次创建的特效ID
---@return number|string? effectid 最近记录的特效ID，未记录时为 nil
function Trigger:GetLastCreateEffectId() end

---取最近一次创建的道具ID
---@return number|string? itemid 最近记录的道具ID，未记录时为 nil
function Trigger:GetLastCreateItemId() end

---取生物组件所在的生物对象ID
---先用 cmp.gameObject:GetObjType() 与生物类型比较，不匹配则返回 nil
---@param cmp any 挂在生物上的组件对象
---@return integer? objid 生物对象ID，组件不属于生物时为 nil
function Trigger:GetMobId(cmp) end

---取玩家组件所在的玩家对象ID
---@param cmp any 挂在玩家上的组件对象
---@return integer? objid 玩家对象ID，组件不属于玩家时为 nil
function Trigger:GetPlayerId(cmp) end

---把预制体ID统一转成字符串
---@param id any 预制体ID，数字或字符串
---@return string? str 预制体ID字符串，入参为 nil 时为 nil
function Trigger:GetPrefabIdStr(id) end

---组装含预制体ID和对象类型的信息表
---@param id any 预制体ID
---@param objType number 对象类型枚举
---@return table info 形如 {id = 预制体ID, type = 对象类型} 的表
function Trigger:GetPrefabInfo(id, objType) end

---生成一个随机的 32 位颜色值
---内部用 os.time() 与随机数拼接后调用 math.randomseed，会改变全局随机序列
---@return integer color 随机颜色值，格式为 0xRRGGBBAA
function Trigger:GetRandomColor() end

---取字符串的字节长度
---按字节计算，UTF-8 中文通常占 3 字节；按字符计数请参考 Substring 的索引口径
---@param str string 待测量的字符串
---@return integer length 字节数，非字符串入参返回 0
function Trigger:GetStringLength(str) end

---原样返回传入的界面对象ID
---不做查找或类型转换，仅用于参数类型占位
---@param id any 界面对象ID
---@return any id 传入的 id 本身
function Trigger:GetUIObject(id) end

---取当前世界对象ID
---@return integer worldid 世界对象ID
function Trigger:GetWorld() end

---回传传入的标签值，不产生实际打印输出
---可变参数被忽略
---@param tag any 标签值
---@vararg any
---@return any tag 传入的 tag 本身
function Trigger:PrintTag(tag, ...) end

---记录最近创建的方块ID
---只写触发器内部状态，不实际创建方块，可被 GetLastCreateBlockId 读出
---@param blockid number | string 要记录的方块ID，数字或字符串
function Trigger:SetLastCreateBlockId(blockid) end

---记录最近创建的生物ID
---只写触发器内部状态，不实际创建生物
---@param actorid integer 要记录的生物ID
function Trigger:SetLastCreateCreatureId(actorid) end

---记录最近创建的特效ID
---@param effectid number | string 要记录的特效ID，数字或字符串
function Trigger:SetLastCreateEffectId(effectid) end

---记录最近创建的道具ID
---@param itemid number | string 要记录的道具ID，数字或字符串
function Trigger:SetLastCreateItemId(itemid) end

---按分隔符拆分字符串并取指定的一段
---@param str string 待拆分的字符串
---@param mark string 分隔符
---@param index number 取第几段，从 1 开始
---@return string? part 第 index 段，参数类型不符或下标越界时为 nil
function Trigger:SplitStr(str, mark, index) end

---按类型标记把字符串还原成对象ID或数值
---itype 大于 5000 时能转成数字就返回数字，否则保留原字符串
---2001~5000 段用 tonumber 转换，非数字字符串得到 nil
---@param itype number 类型标记：大于 5000 按对象ID处理，2001~5000 强制转数字，不超过 2000 原样返回字符串
---@param str string 待转换的字符串
---@return number|string? obj 转换结果，str 为空、为 "nil" 或无法转换时为 nil
function Trigger:Str2Obj(itype, str) end

---把字符串形式的玩家ID转成数字
---@param str string 字符串形式的玩家ID
---@return number? playerid 数字ID，非数字字符串时为 nil
function Trigger:String2Playerid(str) end

---按字符而不是字节截取子字符串
---索引越界会被夹到有效字符范围内
---中文等多字节字符按一个字符计算
---@param content string 原字符串
---@param startIdx number 起始字符索引，从 1 开始，0 视作 1，负数表示从末尾倒数
---@param endIdx number 结束字符索引，负数表示从末尾倒数，两端都为正且起始大于结束时自动交换
---@return string part 截取结果，content 非字符串或为空时为空字符串
function Trigger:Substring(content, startIdx, endIdx) end

---判定并返回生物ID
---玩家ID与生物ID共用同一数值空间，以 2^32 为分界
---@param id number 待判定的对象ID
---@return number? mobid 不小于 2^32 的ID，其他情况为 nil
function Trigger:ToMobId(id) end

---判定并返回玩家ID
---@param id number 待判定的对象ID
---@return number? playerid 小于 2^32 的ID，其他情况为 nil
function Trigger:ToPlayerId(id) end

---把玩家传送到目标地图的分类房间
---**调用限制**: 仅白名单用户可用
---实参依次为玩家ID或ID数组、目标地图ID、房间分类（字符串或字符串数组）
---VarArray 形式的入参会先展开成普通数组
---传送异步完成，失败时向玩家弹出提示
---仅白名单用户可用
---@vararg any
---@return boolean result 请求是否已提交，参数非法或房间不可传送时为 false
function Trigger:TransmitToCategoryRoom(...) end

---在当前线程等待指定秒数
---second 非数字、为负数或线程池不可用时返回 false
---cmp 存在且已失效时立即返回 true，不进入等待
---@param second number 等待秒数，需不小于 0
---@param cmp any 跟随的组件，用于检查是否已失效
---@return boolean result threadpool 等待返回 1003 时为 true，其余情况为 false
function Trigger:Wait(second, cmp) end
