---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Team<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class Team
Team = {}

---添加队伍dietimes
---@param teamid any 队伍ID
---@return boolean result 是否成功
function Team:AddTeamDieTimes(teamid) end

---添加队伍分数
---@param teamid any 队伍ID
---@param score? any 分数
---@return boolean result 是否成功
function Team:AddTeamScore(teamid, score) end

---变更玩家队伍
---@param playerid any 玩家ID
---@param teamid any 队伍ID
---@param resetAttr? boolean 参数 resetAttr
---@return boolean result 是否成功
function Team:ChangePlayerTeam(playerid, teamid, resetAttr) end

---获取数量队伍
function Team:GetNumTeam() end

---获取relative角色
---@param uin number 玩家Uin
---@param relativing number 相对值
---@param actortype number 角色类型
function Team:GetRelativeActor(uin, relativing, actortype) end

---获取队伍creatures
---@param teamid any 队伍ID
function Team:GetTeamCreatures(teamid) end

---获取队伍dietimes
---@param teamid any 队伍ID
function Team:GetTeamDieTimes(teamid) end

---获取队伍mobs
---@param teamid number 队伍ID
function Team:GetTeamMobs(teamid) end

---获取队伍玩家数量
---@param teamid any 队伍ID
---@param alive any 是否存活
function Team:GetTeamPlayerNum(teamid, alive) end

---获取队伍玩家
---@param teamid any 队伍ID
---@param alive any 是否存活
function Team:GetTeamPlayers(teamid, alive) end

---获取队伍results
---@param teamid any 队伍ID
function Team:GetTeamResults(teamid) end

---获取队伍分数
---@param teamid any 队伍ID
function Team:GetTeamScore(teamid) end

---初始化触发全局数据
function Team:InitTriggerGlobalData() end

---random队伍玩家
---@param teamid any 队伍ID
---@param alive any 是否存活
function Team:RandomTeamPlayer(teamid, alive) end

---设置队伍dietimes
---@param teamid any 队伍ID
---@param times? any 参数 times
---@return boolean result 是否成功
function Team:SetTeamDieTimes(teamid, times) end

---设置队伍results
---@param teamid any 队伍ID
---@param result? number 参数 result
---@return boolean ret 是否成功
function Team:SetTeamResults(teamid, result) end

---设置队伍分数
---@param teamid any 队伍ID
---@param score? any 分数
---@return boolean result 是否成功
function Team:SetTeamScore(teamid, score) end
