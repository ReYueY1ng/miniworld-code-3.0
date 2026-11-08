---@meta

---触发器 ArrayTmp 模块（Trigger.ArrayTmp）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.ArrayTmp
Trigger.ArrayTmp = {}

---获取区域内带指定标签的对象临时数组
---@param areaid integer 区域ID
---@param mathcmode any 匹配方式（MatchMode）：1 全部匹配，2 任一匹配
---@param tags string | string[] 标签或标签数组
---@param itype number 对象类型：1 玩家，2 生物，3 掉落物，4 抛射物，5 实体，6 区域
---@param bexactmatch boolean 是否精确匹配标签
---@return table result 对象ID的临时数组，无匹配时为空数组
function Trigger.ArrayTmp:GetActorsByTags(areaid, mathcmode, tags, itype, bexactmatch) end

---获取所有玩家的临时数组
---@param alive number 玩家状态：1 存活，0 阵亡，-1 全部，默认 -1
---@return table result 玩家ID的临时数组
function Trigger.ArrayTmp:GetAllPlayers(alive) end

---获取区域内出现过的方块类型临时数组
---能映射到资源ID的方块会以字符串形式返回
---@param areaid integer 区域ID
---@return table result 方块类型ID的临时数组，区域无效时为空数组
function Trigger.ArrayTmp:GetAreaBlocks(areaid) end

---获取区域内的生物临时数组
---@param areaid integer 区域ID
---@return table result 生物ID的临时数组，区域无效时为空数组
function Trigger.ArrayTmp:GetAreaCreatures(areaid) end

---获取区域内的掉落物临时数组
---@param areaid integer 区域ID
---@return table result 掉落物ID的临时数组，区域无效时为空数组
function Trigger.ArrayTmp:GetAreaDropItems(areaid) end

---获取区域内的实体临时数组
---@param areaid integer 区域ID
---@return table result 实体ID的临时数组，区域无效时为空数组
function Trigger.ArrayTmp:GetAreaEntity(areaid) end

---获取区域内的抛射物临时数组
---方法名 Misssile 是引擎原始拼写
---@param areaid integer 区域ID
---@return table result 抛射物ID的临时数组，区域无效时为空数组
function Trigger.ArrayTmp:GetAreaMisssile(areaid) end

---获取区域内的区域对象临时数组
---@param areaid integer 查询范围所在的区域ID
---@return table result 区域对象ID的临时数组，区域无效时为空数组
function Trigger.ArrayTmp:GetAreaObjEntity(areaid) end

---获取区域内的玩家临时数组
---@param areaid integer 区域ID
---@return table result 玩家ID的临时数组，区域无效时为空数组
function Trigger.ArrayTmp:GetAreaPlayers(areaid) end

---获取区域内与指定玩家有相对关系的角色数组
---actortype 不支持时按数字组返回
---@param areaid integer 区域ID
---@param uin integer 参照玩家Uin
---@param relativing any 相对关系ID
---@param actortype number 角色类型（ObjType.Player/Mob/Role）
---@return table result 对象ID的临时数组，无匹配时为空数组
function Trigger.ArrayTmp:GetAreaRelativeActors(areaid, uin, relativing, actortype) end

---获取玩家最近邀请进房间的玩家临时数组
---同一玩家 10 秒内重复请求会被拒绝并返回空数组
---@param playerid integer 玩家ID
---@return table result 玩家ID的临时数组，请求失败时为空数组
function Trigger.ArrayTmp:GetNewInviteGroup(playerid) end

---获取与指定玩家有相对关系的角色数组
---@param uin integer 参照玩家Uin
---@param relativing any 相对关系ID
---@param actortype number 角色类型（ObjType.Player/Mob/Role）
---@return table result 对象ID的临时数组，无匹配时为空数组
function Trigger.ArrayTmp:GetRelativeActor(uin, relativing, actortype) end

---查找表格中首个满足条件的行号
---坐标表按 x/y/z 逐分量比较
---@param varId integer 表格变量ID
---@param playerId integer 玩家ID，公共表传 0
---@param col number 列号或列名
---@param itype number 匹配方式：1 相等，2 不等
---@param value any 比较值
---@return number? row 行号，未找到或变量不存在时为 nil
function Trigger.ArrayTmp:GetTableRowIndex(varId, playerId, col, itype, value) end

---查找表格中所有满足条件的行号
---@param varId integer 表格变量ID
---@param playerId integer 玩家ID，公共表传 0
---@param col number 列号或列名
---@param itype number 匹配方式：1 相等，2 不等
---@param value any 比较值
---@return table result 行号临时数组，未找到时为空数组
function Trigger.ArrayTmp:GetTableRowIndexs(varId, playerId, col, itype, value) end

---按列取出表格中的全部值
---按列定义的类型选择变量组，未定义时按首元素类型推断
---@param varId integer 表格变量ID
---@param playerId integer 玩家ID，公共表传 0
---@param col number 列号或列名
---@return table result 列值的临时数组，空列或无有效元素时为空数组
function Trigger.ArrayTmp:GetTableValuesByCol(varId, playerId, col) end

---获取队伍中的生物临时数组
---teamid 无效时按 -1 处理
---@param teamid integer 队伍ID
---@return table result 生物ID的临时数组，队伍无效时为空数组
function Trigger.ArrayTmp:GetTeamCreatures(teamid) end

---获取队伍中的玩家与生物角色数组
---名字虽为 LivingActor，实现未过滤存活状态
---@param teamid integer 队伍ID
---@return table result 角色ID的临时数组，玩家在前、生物在后
function Trigger.ArrayTmp:GetTeamLivingActor(teamid) end

---获取队伍中的生物临时数组
---通过触发器全局数据检索队伍成员
---@param teamid integer 队伍ID
---@return table result 生物ID的临时数组，队伍无效时为空数组
function Trigger.ArrayTmp:GetTeamMobs(teamid) end

---获取队伍中的玩家临时数组
---队伍ID需在 0-6 之间，超出范围返回空数组
---@param teamid integer 队伍ID
---@param alive number 玩家状态：1 存活，0 阵亡，-1 全部，默认 -1
---@return table result 玩家ID的临时数组，队伍无效时为空数组
function Trigger.ArrayTmp:GetTeamPlayers(teamid, alive) end

---读取表格变量中指定行与列的值
---value 参数在实现中被忽略
---@param varId integer 表格变量ID
---@param playerId integer 玩家ID，公共表传 0
---@param col number 列号或列名
---@param rows any 行号
---@param value any 未使用
---@return any? result 单元格的值，变量或行列无效时为 nil
function Trigger.ArrayTmp:GetVarTabValue(varId, playerId, col, rows, value) end

---向数组变量末尾追加一个值
---@param value any 要追加的值
---@param varid integer 数组变量ID
---@param playerid integer 玩家ID，公共变量传 0
---@return boolean result 是否插入成功
function Trigger.ArrayTmp:InsertValue(value, varid, playerid) end

---在数组变量的指定位置插入值
---@param varId integer 数组变量ID
---@param playerId integer 玩家ID，公共变量传 0
---@param index number 插入位置，从 1 开始
---@param value any 要插入的值
---@return boolean result 是否插入成功
function Trigger.ArrayTmp:InsertValueToArray(varId, playerId, index, value) end

---把另一个数组的全部值追加到目标数组
---@param varId integer 目标数组变量ID
---@param playerId integer 目标数组所属玩家ID
---@param varId2 any 来源数组变量ID
---@param playerId2 any 来源数组所属玩家ID
---@return boolean result 是否插入成功
function Trigger.ArrayTmp:InsertValuesToArray(varId, playerId, varId2, playerId2) end

---在表格变量指定行插入一行数据
---可变参数按列顺序组成一行
---@param varId integer 表格变量ID
---@param playerId integer 玩家ID，公共表传 0
---@param index number 行号
---@vararg any
---@return boolean? result 是否插入成功，变量不存在时为 nil
function Trigger.ArrayTmp:InsertVarTabValue(varId, playerId, index, ...) end

---判断值是否存在于临时数组中
---@param v1 number 要查找的值
---@param v2 number 临时数组
---@return boolean result 是否存在
function Trigger.ArrayTmp:ObjInTmpGroup(v1, v2) end

---从数组变量中移除指定值
---@param value any 要移除的值
---@param varid integer 数组变量ID
---@param playerid integer 玩家ID，公共变量传 0
---@return boolean result 是否移除成功
function Trigger.ArrayTmp:RemoveByValue(value, varid, playerid) end

---把数组变量中的旧值替换为新值
---会替换所有匹配到的旧值
---@param varId integer 数组变量ID
---@param playerId integer 玩家ID，公共变量传 0
---@param value any 新值
---@param oldValue any 被替换的旧值
---@return boolean result 是否替换成功
function Trigger.ArrayTmp:ReplaceValueToArray(varId, playerId, value, oldValue) end

---按条件批量写入表格指定列的值
---坐标表按 x/y/z 逐分量比较
---@param varId integer 表格变量ID
---@param playerId integer 玩家ID，公共表传 0
---@param frow any 条件列
---@param itype number 匹配方式：1 相等，2 不等
---@param fvalue any 条件值
---@param col number 要写入的列
---@param value any 写入值
---@return boolean? result 是否写入成功，变量不存在时为 nil
function Trigger.ArrayTmp:SetTableRows(varId, playerId, frow, itype, fvalue, col, value) end

---设置数组变量指定位置的值
---@param varId integer 数组变量ID
---@param playerId integer 玩家ID，公共变量传 0
---@param index number 位置索引
---@param value any 写入值
---@return boolean result 是否设置成功
function Trigger.ArrayTmp:SetValueToArray(varId, playerId, index, value) end

---设置表格变量中指定行与列的值
---@param varId integer 表格变量ID
---@param playerId integer 玩家ID，公共表传 0
---@param col number 列号或列名
---@param rows table 行号或行号数组
---@param value any 写入值
---@return boolean? result 是否写入成功，rows 类型不支持时为 nil
function Trigger.ArrayTmp:SetVarTabValue(varId, playerId, col, rows, value) end

---按分隔符把字符串拆成临时数组
---@param str string 待拆分的字符串
---@param mark string 分隔符
---@return table result 字符串临时数组，参数不是字符串时为空数组
function Trigger.ArrayTmp:SplitStrArray(str, mark) end
