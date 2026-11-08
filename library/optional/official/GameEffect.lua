---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· GameEffect<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class GameEffect
GameEffect = {}

---在客户端应用迷幻视觉效果
---content 为空时返回 false
---isshow 为 false 时恢复默认屏幕特效、后处理与相机视野
---token 与当前记录不一致时忽略关闭请求
---@param content? string 效果参数表：isshow、token、useScreenEffect、screenEffectType、screenEffectSpeed、usePostProcess
---@return boolean result 是否应用成功
function GameEffect:ApplyPsychedelicVisionClient(content) end

---关闭指定玩家的迷幻视觉效果
---玩家在本机时直接本地关闭，否则下发客户端消息
---WorldMgr 未初始化时返回 false
---@param uin integer 玩家Uin
---@param token any 效果标识
---@return boolean result 是否成功
function GameEffect:ClosePsychedelicVision(uin, token) end

---关闭指定玩家的屏幕全屏特效
---@param uin integer 玩家Uin
---@return boolean result 是否成功
function GameEffect:CloseScreenEffect(uin) end

---为指定玩家显示迷幻视觉效果
---content 会被补上 uin 并强制 isshow=true
---玩家在本机时直接本地显示，否则下发客户端消息
---@param uin integer 玩家Uin
---@param content? table 效果参数表，可省略
---@return boolean result 是否成功
function GameEffect:ShowPsychedelicVision(uin, content) end

---为指定玩家显示屏幕全屏特效
---@param uin integer 玩家Uin
---@param ctype number 特效类型
---@param isloop boolean 是否循环播放
---@param incspeed number 特效播放速度
---@return boolean result 是否成功
function GameEffect:ShowScreenEffect(uin, ctype, isloop, incspeed) end
