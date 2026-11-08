---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Team<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class Team
Team = {}

---给队伍累计一次死亡次数
---teamid 需在 0 到最大队伍数之间
---@param teamid number 队伍ID
---@return boolean result 是否成功
function Team:AddTeamDieTimes(teamid) end

---给队伍增加分数
---分数写入由房间游戏管理器完成
---@param teamid number 队伍ID
---@param score? any 增加量，可为负数
---@return boolean result 是否成功
function Team:AddTeamScore(teamid, score) end

---把玩家切换到指定队伍
---@param playerid number 玩家ID，需为正数
---@param teamid number 目标队伍ID（0 到最大队伍数-1，或 999 表示特殊队伍）
---@param resetAttr? boolean 是否重置角色属性，默认 true
---@return boolean result 是否成功
function Team:ChangePlayerTeam(playerid, teamid, resetAttr) end

---获取当前游戏的队伍数量
---客户端游戏对象不可用时为 nil
---@return number? num 队伍数量
function Team:GetNumTeam() end

---按敌对关系搜索角色
---参数类型不合法时无返回值
---@param uin number 玩家Uin
---@param relativing number 关系类型（1 友好，2 敌对，3 中立，999 任意）
---@param actortype number 角色类型（ObjType.Player、Mob 或 Role，Role 表示玩家与生物）
---@return number? num 数量
---@return table? arr 对象ID数组
function Team:GetRelativeActor(uin, relativing, actortype) end

---获取队伍内全部生物的对象ID列表
---队伍没有生物时无返回值
---@param teamid number 队伍ID
---@return table? list 生物对象ID数组
function Team:GetTeamCreatures(teamid) end

---获取队伍的死亡次数
---@param teamid number 队伍ID
---@return number? times 死亡次数
function Team:GetTeamDieTimes(teamid) end

---获取队伍生物的对象ID列表
---依赖触发器全局数据管理器，只接受数字队伍ID
---@param teamid number 队伍ID
---@return number? num 数量
---@return table? arr 对象ID数组
function Team:GetTeamMobs(teamid) end

---获取队伍内符合条件的玩家数量
---teamid 越界时返回 nil
---@param teamid number 队伍ID
---@param alive number 玩家状态（1 存活，0 阵亡，-1 全部，默认 -1）
---@return number? num 玩家数量
function Team:GetTeamPlayerNum(teamid, alive) end

---获取队伍内符合条件的玩家Uin列表
---teamid 越界时返回 nil
---@param teamid number 队伍ID
---@param alive number 玩家状态（1 存活，0 阵亡，-1 全部，默认 -1）
---@return number? num 玩家数量
---@return table? arr 玩家Uin数组
function Team:GetTeamPlayers(teamid, alive) end

---获取队伍的结算结果
---@param teamid number 队伍ID
---@return number? result 结算结果值
function Team:GetTeamResults(teamid) end

---获取队伍当前分数
---@param teamid number 队伍ID
---@return number? score 分数
function Team:GetTeamScore(teamid) end

---初始化触发器全局数据管理器引用
---内部使用，已初始化时不会重复赋值
function Team:InitTriggerGlobalData() end

---随机获取队伍内符合条件的玩家Uin
---@param teamid number 队伍ID
---@param alive number 玩家状态（1 存活，0 阵亡，-1 全部，默认 -1）
---@return number? uin 玩家Uin，队伍无人时为 nil
function Team:RandomTeamPlayer(teamid, alive) end

---设置队伍的死亡次数
---@param teamid number 队伍ID
---@param times? any 死亡次数
---@return boolean result 是否成功
function Team:SetTeamDieTimes(teamid, times) end

---设置队伍结算结果并下发给客户端
---通过任务系统向全房间广播 TEAM_RESULTS 任务
---@param teamid number 队伍ID
---@param result? number 结果值，默认 0
---@return boolean ret 是否下发成功
function Team:SetTeamResults(teamid, result) end

---直接设置队伍分数
---@param teamid number 队伍ID
---@param score? any 目标分数
---@return boolean result 是否成功
function Team:SetTeamScore(teamid, score) end
