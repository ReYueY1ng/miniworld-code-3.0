---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Graphics<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
---@param playerid any
---@param itype any
---@return boolean
function Graphics:FindGraphics(x, y, z, playerid, itype) end

---官方环境独有接口（未收录于开发环境）
---@param reportid any
---@param objid any
---@param tuin any
---@param itype any
function Graphics:GetInnerGraphicsOffset_OnClient(reportid, objid, tuin, itype) end

---官方环境独有接口（未收录于开发环境）
---@return boolean
function Graphics:SnycGraphicsInfo2Client() end
