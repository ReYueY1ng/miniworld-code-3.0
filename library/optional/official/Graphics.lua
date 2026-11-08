---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Graphics<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---查找graphics
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@param playerid any 玩家ID
---@param itype any 类型
---@return boolean value 是否成功
function Graphics:FindGraphics(x, y, z, playerid, itype) end

---在客户端上获取innergraphics偏移
---@param reportid any 同步报告ID
---@param objid any 对象ID
---@param tuin any 参数 tuin
---@param itype any 类型
function Graphics:GetInnerGraphicsOffset_OnClient(reportid, objid, tuin, itype) end

---snycgraphicsinfo2客户端
---@return boolean result 是否成功
function Graphics:SnycGraphicsInfo2Client() end
