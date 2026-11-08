---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Biome<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class Biome
Biome = {}

---官方环境独有接口（未收录于开发环境）
---@param uin any
---@param range any
function Biome:FindNearCity(uin, range) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
function Biome:GenCityPrecious(uin) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param z any
---@param worldId any
function Biome:GetBiomeId(x, z, worldId) end
