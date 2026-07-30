---@meta

---星球模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class Planet
Planet = {}

---创建星球
---@param prefabId integer | string 星球预制ID
---@param pos PositionTable 位置
---@param ttlSec number 存活时间(秒)
---@return integer mapId 星球ID
function Planet:CreatePlanet(prefabId, pos, ttlSec) end

---预加载星球
---@param prefabId integer | string 星球预制ID
---@param pos PositionTable 位置
---@param ttlSec number 存活时间(秒)
---@return integer mapId 星球ID
function Planet:PreloadPlanet(prefabId, pos, ttlSec) end

---释放预加载的星球
---@param mapId integer 星球ID
---@param pos PositionTable 位置
---@return boolean result
function Planet:ReleasePreloadedPlanet(mapId, pos) end

---传送到星球
---@param uin integer 玩家ID
---@param prefabId integer | string 星球预制ID
---@param pos PositionTable 位置
---@return boolean result
function Planet:TeleportToPlanet(uin, prefabId, pos) end