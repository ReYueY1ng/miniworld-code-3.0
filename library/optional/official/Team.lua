---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Team<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class Team
Team = {}

---官方环境独有接口（未收录于开发环境）
---@param teamid any
function Team:AddTeamDieTimes(teamid) end

---官方环境独有接口（未收录于开发环境）
---@param teamid any
---@param score any
function Team:AddTeamScore(teamid, score) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param teamid any
---@param resetAttr any
function Team:ChangePlayerTeam(playerid, teamid, resetAttr) end

---官方环境独有接口（未收录于开发环境）
function Team:GetNumTeam() end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param relativing any
---@param actortype any
function Team:GetRelativeActor(uin, relativing, actortype) end

---官方环境独有接口（未收录于开发环境）
---@param teamid any
function Team:GetTeamCreatures(teamid) end

---官方环境独有接口（未收录于开发环境）
---@param teamid any
function Team:GetTeamDieTimes(teamid) end

---官方环境独有接口（未收录于开发环境）
---@param teamid any
function Team:GetTeamMobs(teamid) end

---官方环境独有接口（未收录于开发环境）
---@param teamid any
---@param alive any
function Team:GetTeamPlayerNum(teamid, alive) end

---官方环境独有接口（未收录于开发环境）
---@param teamid any
---@param alive any
function Team:GetTeamPlayers(teamid, alive) end

---官方环境独有接口（未收录于开发环境）
---@param teamid any
function Team:GetTeamResults(teamid) end

---官方环境独有接口（未收录于开发环境）
---@param teamid any
function Team:GetTeamScore(teamid) end

---官方环境独有接口（未收录于开发环境）
function Team:InitTriggerGlobalData() end

---官方环境独有接口（未收录于开发环境）
---@param teamid any
---@param alive any
function Team:RandomTeamPlayer(teamid, alive) end

---官方环境独有接口（未收录于开发环境）
---@param teamid any
---@param times any
function Team:SetTeamDieTimes(teamid, times) end

---官方环境独有接口（未收录于开发环境）
---@param teamid any
---@param result any
function Team:SetTeamResults(teamid, result) end

---官方环境独有接口（未收录于开发环境）
---@param teamid any
---@param score any
function Team:SetTeamScore(teamid, score) end
