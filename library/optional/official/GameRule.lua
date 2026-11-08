---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· GameRule<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class GameRule
GameRule = {}

---获取allowmidway加入
function GameRule:GetAllowMidwayJoin() end

---获取统计down
function GameRule:GetCountDown() end

---获取display分数
function GameRule:GetDisplayScore() end

---获取游戏rule值
---@param ruleId number ruleID
---@return number value 结果数值
function GameRule:GetGameRuleValue(ruleId) end

---获取击杀通知
function GameRule:GetKillNotify() end

---获取life数量
function GameRule:GetLifeNum() end

---获取生物生成
function GameRule:GetMobGen() end

---判断是否dev构建
---@return boolean result 是否满足条件
function GameRule:IsDevBuild() end

---刷新等级模式界面
function GameRule:RefreshLevelModeUI() end

---设置allowmidway加入
---@param set any 设置值
function GameRule:SetAllowMidwayJoin(set) end

---设置统计down
---@param val any 值
function GameRule:SetCountDown(val) end

---设置display分数
---@param set any 设置值
function GameRule:SetDisplayScore(set) end

---设置游戏rule值
---@param ruleId number ruleID
---@param val any 值
---@return boolean result 是否成功
function GameRule:SetGameRuleValue(ruleId, val) end

---设置击杀通知
---@param set any 设置值
function GameRule:SetKillNotify(set) end

---设置life数量
---@param lifenum any life数量
function GameRule:SetLifeNum(lifenum) end

---设置生物生成
---@param set any 设置值
function GameRule:SetMobGen(set) end

---设置玩家属性状态
---@param option any 参数 option
---@param value any 值
function GameRule:SetPlayerAttrState(option, value) end

---设置玩家游戏permits
---@param uin any 玩家Uin
---@param mode any 模式
---@param val any 值
function GameRule:SetPlayerGamePermits(uin, mode, val) end

---设置复活消耗btnicon
---@param url any 资源地址
---@return boolean result 是否成功
function GameRule:SetReviveCostBtnIcon(url) end
