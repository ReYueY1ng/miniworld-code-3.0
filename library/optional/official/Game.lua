---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Game<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class Game
Game = {}

---弹出系统消息框显示文本
---文本会先经过关键字过滤
---@param msg string 消息文本，非字符串会被转成字符串
function Game:ShowMsgBox(msg) end
