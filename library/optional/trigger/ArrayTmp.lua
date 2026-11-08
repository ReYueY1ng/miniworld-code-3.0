---@meta

---触发器 ArrayTmp 模块（Trigger.ArrayTmp）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.ArrayTmp
Trigger.ArrayTmp = {}

---按标签获取角色
---@param areaid any 区域ID
---@param mathcmode any 匹配方式
---@param tags any 标签
---@param itype any 类型
---@param bexactmatch any 是否精确匹配
function Trigger.ArrayTmp:GetActorsByTags(areaid, mathcmode, tags, itype, bexactmatch) end

---获取全部玩家
---@param alive any 是否存活
function Trigger.ArrayTmp:GetAllPlayers(alive) end

---获取区域方块
---@param areaid any 区域ID
function Trigger.ArrayTmp:GetAreaBlocks(areaid) end

---获取区域creatures
---@param areaid any 区域ID
function Trigger.ArrayTmp:GetAreaCreatures(areaid) end

---获取区域掉落道具
---@param areaid any 区域ID
function Trigger.ArrayTmp:GetAreaDropItems(areaid) end

---获取区域实体
---@param areaid any 区域ID
function Trigger.ArrayTmp:GetAreaEntity(areaid) end

---获取区域misssile
---@param areaid any 区域ID
function Trigger.ArrayTmp:GetAreaMisssile(areaid) end

---获取区域对象实体
---@param areaid any 区域ID
function Trigger.ArrayTmp:GetAreaObjEntity(areaid) end

---获取区域玩家
---@param areaid any 区域ID
function Trigger.ArrayTmp:GetAreaPlayers(areaid) end

---获取区域relative角色
---@param areaid any 区域ID
---@param uin any 玩家Uin
---@param relativing any 相对值
---@param actortype any 角色类型
function Trigger.ArrayTmp:GetAreaRelativeActors(areaid, uin, relativing, actortype) end

---获取新建邀请组
---@param playerid any 玩家ID
function Trigger.ArrayTmp:GetNewInviteGroup(playerid) end

---获取relative角色
---@param uin any 玩家Uin
---@param relativing any 相对值
---@param actortype any 角色类型
function Trigger.ArrayTmp:GetRelativeActor(uin, relativing, actortype) end

---获取表row索引
---@param varId any 变量ID
---@param playerId any 玩家ID
---@param col any 列
---@param itype any 类型
---@param value any 值
function Trigger.ArrayTmp:GetTableRowIndex(varId, playerId, col, itype, value) end

---获取表rowindexs
---@param varId any 变量ID
---@param playerId any 玩家ID
---@param col any 列
---@param itype any 类型
---@param value any 值
function Trigger.ArrayTmp:GetTableRowIndexs(varId, playerId, col, itype, value) end

---按col获取表values
---@param varId any 变量ID
---@param playerId any 玩家ID
---@param col any 列
function Trigger.ArrayTmp:GetTableValuesByCol(varId, playerId, col) end

---获取队伍creatures
---@param teamid any 队伍ID
function Trigger.ArrayTmp:GetTeamCreatures(teamid) end

---获取队伍living角色
---@param teamid any 队伍ID
function Trigger.ArrayTmp:GetTeamLivingActor(teamid) end

---获取队伍mobs
---@param teamid any 队伍ID
function Trigger.ArrayTmp:GetTeamMobs(teamid) end

---获取队伍玩家
---@param teamid any 队伍ID
---@param alive any 是否存活
function Trigger.ArrayTmp:GetTeamPlayers(teamid, alive) end

---获取vartab值
---@param varId any 变量ID
---@param playerId any 玩家ID
---@param col any 列
---@param rows any 参数 rows
---@param value any 值
function Trigger.ArrayTmp:GetVarTabValue(varId, playerId, col, rows, value) end

---插入值
---@param value any 值
---@param varid any 变量ID
---@param playerid any 玩家ID
function Trigger.ArrayTmp:InsertValue(value, varid, playerid) end

---插入值转换为数组
---@param varId any 变量ID
---@param playerId any 玩家ID
---@param index any 索引
---@param value any 值
function Trigger.ArrayTmp:InsertValueToArray(varId, playerId, index, value) end

---插入values转换为数组
---@param varId any 变量ID
---@param playerId any 玩家ID
---@param varId2 any 参数 varId2
---@param playerId2 any 参数 playerId2
function Trigger.ArrayTmp:InsertValuesToArray(varId, playerId, varId2, playerId2) end

---插入vartab值
---@param varId any 变量ID
---@param playerId any 玩家ID
---@param index any 索引
---@vararg any
function Trigger.ArrayTmp:InsertVarTabValue(varId, playerId, index, ...) end

---在tmp组中对象
---@param v1 any 向量
---@param v2 any 向量
function Trigger.ArrayTmp:ObjInTmpGroup(v1, v2) end

---按值移除
---@param value any 值
---@param varid any 变量ID
---@param playerid any 玩家ID
function Trigger.ArrayTmp:RemoveByValue(value, varid, playerid) end

---替换值转换为数组
---@param varId any 变量ID
---@param playerId any 玩家ID
---@param value any 值
---@param oldValue any 参数 oldValue
function Trigger.ArrayTmp:ReplaceValueToArray(varId, playerId, value, oldValue) end

---设置表rows
---@param varId any 变量ID
---@param playerId any 玩家ID
---@param frow any 参数 frow
---@param itype any 类型
---@param fvalue any 参数 fvalue
---@param col any 列
---@param value any 值
function Trigger.ArrayTmp:SetTableRows(varId, playerId, frow, itype, fvalue, col, value) end

---设置值转换为数组
---@param varId any 变量ID
---@param playerId any 玩家ID
---@param index any 索引
---@param value any 值
function Trigger.ArrayTmp:SetValueToArray(varId, playerId, index, value) end

---设置vartab值
---@param varId any 变量ID
---@param playerId any 玩家ID
---@param col any 列
---@param rows table 参数 rows
---@param value any 值
function Trigger.ArrayTmp:SetVarTabValue(varId, playerId, col, rows, value) end

---splitstr数组
---@param str string 字符串
---@param mark string 分隔符
function Trigger.ArrayTmp:SplitStrArray(str, mark) end
