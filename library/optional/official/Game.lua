---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Game<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class Game
Game = {}

---显示消息box
---@param msg string 消息
function Game:ShowMsgBox(msg) end
