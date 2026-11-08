---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· GameEffect<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class GameEffect
GameEffect = {}

---applypsychedelicvision客户端
---@param content? any 内容
---@return boolean result 是否成功
function GameEffect:ApplyPsychedelicVisionClient(content) end

---关闭psychedelicvision
---@param uin any 玩家Uin
---@param token any 参数 token
---@return boolean result 是否成功
function GameEffect:ClosePsychedelicVision(uin, token) end

---关闭screen特效
---@param uin any 玩家Uin
---@return boolean result 是否成功
function GameEffect:CloseScreenEffect(uin) end

---显示psychedelicvision
---@param uin any 玩家Uin
---@param content? table 内容
---@return boolean result 是否成功
function GameEffect:ShowPsychedelicVision(uin, content) end

---显示screen特效
---@param uin any 玩家Uin
---@param ctype any 参数 ctype
---@param isloop any 是否循环
---@param incspeed any 参数 incspeed
---@return boolean result 是否成功
function GameEffect:ShowScreenEffect(uin, ctype, isloop, incspeed) end
