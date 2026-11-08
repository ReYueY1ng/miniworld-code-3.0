---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Biome<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class Biome
Biome = {}

---查找玩家附近的城市
---以玩家当前坐标为中心查询
---玩家、世界或城市管理器不存在时返回 false
---@param uin integer 玩家Uin
---@param range any 搜索范围（格）
---@return any result 最近城市数据，失败时为 false
function Biome:FindNearCity(uin, range) end

---为玩家生成城镇宝藏点
---本机玩家会直接打开藏宝图界面，其他玩家由客户端消息打开
---本机玩家生成位置 y 小于 0 时提示失败并返回 false
---@param uin integer 玩家Uin
---@return boolean result 是否生成成功
function Biome:GenCityPrecious(uin) end

---获取指定水平坐标所在的群系ID
---@param x number X坐标
---@param z number Z坐标
---@param worldId integer 星球ID
---@return number biomeid 群系ID，世界或接口不可用时为 -1
function Biome:GetBiomeId(x, z, worldId) end
