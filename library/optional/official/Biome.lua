---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Biome<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class Biome
Biome = {}

---查找nearcity
---@param uin any 玩家Uin
---@param range any 范围
---@return boolean value 是否成功
function Biome:FindNearCity(uin, range) end

---生成cityprecious
---@param uin any 玩家Uin
---@return boolean result 是否成功
function Biome:GenCityPrecious(uin) end

---获取群系ID
---@param x any X坐标
---@param z any Z坐标
---@param worldId any 星球ID
---@return number value 结果数值
function Biome:GetBiomeId(x, z, worldId) end
