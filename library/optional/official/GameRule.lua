---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· GameRule<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class GameRule
GameRule = {}

---官方环境独有接口（未收录于开发环境）
function GameRule:GetAllowMidwayJoin() end

---官方环境独有接口（未收录于开发环境）
function GameRule:GetCountDown() end

---官方环境独有接口（未收录于开发环境）
function GameRule:GetDisplayScore() end

---官方环境独有接口（未收录于开发环境）
---@param ruleId any
function GameRule:GetGameRuleValue(ruleId) end

---官方环境独有接口（未收录于开发环境）
function GameRule:GetKillNotify() end

---官方环境独有接口（未收录于开发环境）
function GameRule:GetLifeNum() end

---官方环境独有接口（未收录于开发环境）
function GameRule:GetMobGen() end

---官方环境独有接口（未收录于开发环境）
function GameRule:IsDevBuild() end

---官方环境独有接口（未收录于开发环境）
function GameRule:RefreshLevelModeUI() end

---官方环境独有接口（未收录于开发环境）
---@param set any
function GameRule:SetAllowMidwayJoin(set) end

---官方环境独有接口（未收录于开发环境）
---@param val any
function GameRule:SetCountDown(val) end

---官方环境独有接口（未收录于开发环境）
---@param set any
function GameRule:SetDisplayScore(set) end

---官方环境独有接口（未收录于开发环境）
---@param ruleId any
---@param val any
function GameRule:SetGameRuleValue(ruleId, val) end

---官方环境独有接口（未收录于开发环境）
---@param set any
function GameRule:SetKillNotify(set) end

---官方环境独有接口（未收录于开发环境）
---@param lifenum any
function GameRule:SetLifeNum(lifenum) end

---官方环境独有接口（未收录于开发环境）
---@param set any
function GameRule:SetMobGen(set) end

---官方环境独有接口（未收录于开发环境）
---@param option any
---@param value any
function GameRule:SetPlayerAttrState(option, value) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param mode any
---@param val any
function GameRule:SetPlayerGamePermits(uin, mode, val) end

---官方环境独有接口（未收录于开发环境）
---@param url any
function GameRule:SetReviveCostBtnIcon(url) end
