---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· GameRule<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class GameRule
GameRule = {}

---获取房间是否允许中途加入
---@return number value 1 允许，0 不允许
function GameRule:GetAllowMidwayJoin() end

---获取开局倒计时设置
---@return number value 倒计时秒数
function GameRule:GetCountDown() end

---获取是否显示分数
---@return number value 1 显示，0 不显示
function GameRule:GetDisplayScore() end

---读取指定游戏规则的值
---@param ruleId number 规则ID，GMRULE_ 系列常量
---@return number value 规则值，规则ID非数字时为 0
function GameRule:GetGameRuleValue(ruleId) end

---获取击杀提示的显示设置
---@return number value 规则值
function GameRule:GetKillNotify() end

---获取玩家生命数设置
---@return number value 生命数
function GameRule:GetLifeNum() end

---获取是否开启生物生成
---@return number value 1 开启，0 关闭
function GameRule:GetMobGen() end

---判断当前是否为开发构建
---接口ID为 999 时直接视为开发构建
---@return boolean result 是否开发构建
function GameRule:IsDevBuild() end

---按等级模式开关刷新经验条显示
---租借服务器模式下不处理
function GameRule:RefreshLevelModeUI() end

---设置房间是否允许中途加入
---@param set any 是否允许中途加入
---@return boolean result 是否设置成功
function GameRule:SetAllowMidwayJoin(set) end

---设置开局倒计时
---@param val any 倒计时秒数
---@return boolean result 是否设置成功
function GameRule:SetCountDown(val) end

---设置是否显示分数
---@param set any 是否显示分数
---@return boolean result 是否设置成功
function GameRule:SetDisplayScore(set) end

---修改指定游戏规则的值
---规则ID非数字或规则管理器不可用时返回 false
---@param ruleId number 规则ID，GMRULE_ 系列常量
---@param val any 规则新值
---@return boolean result 是否设置成功
function GameRule:SetGameRuleValue(ruleId, val) end

---设置是否显示击杀提示
---内部转调 SetGameRuleValue，不返回结果
---@param set any 是否显示击杀提示
function GameRule:SetKillNotify(set) end

---设置玩家生命数
---@param lifenum number 生命数
---@return boolean result 是否设置成功
function GameRule:SetLifeNum(lifenum) end

---设置是否开启生物生成
---@param set any 是否开启生物生成
---@return boolean result 是否设置成功
function GameRule:SetMobGen(set) end

---设置玩家属性的开放状态
---游戏制作管理器不存在时静默忽略
---@param option any 属性选项
---@param value any 状态值
function GameRule:SetPlayerAttrState(option, value) end

---设置玩家在房间中的权限
---通过权限模块脚本下发，固定传参 2
---@param uin integer 玩家Uin
---@param mode any 权限模式
---@param val any 权限值
function GameRule:SetPlayerGamePermits(uin, mode, val) end

---设置复活消耗按钮的图标
---死亡界面管理器不存在时返回 false
---@param url string 图标资源地址
---@return boolean result 是否设置成功
function GameRule:SetReviveCostBtnIcon(url) end
