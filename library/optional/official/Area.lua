---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Area<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param blockid any
---@param posbeg any
---@param posend any
---@param worldId any
function Area:BlockInAreaRange(blockid, posbeg, posend, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param pos any
---@param dim any
---@param btmp any
---@param worldId any
function Area:CreateAreaRect(pos, dim, btmp, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param posbeg any
---@param posend any
---@param blockid any
---@param n any
---@param candrop any
---@param btriggerevent any
---@param worldId any
function Area:DestroyBlockAreaRange(posbeg, posend, blockid, n, candrop, btriggerevent, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param posbeg any
---@param posend any
---@param blockid any
---@param n any
---@param dropCount any
---@param btriggerevent any
---@param worldId any
function Area:DestroyRangeBlock(posbeg, posend, blockid, n, dropCount, btriggerevent, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param areaid any
---@param x any
---@param y any
---@param z any
function Area:ExpandArea(areaid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param posbeg any
---@param posend any
---@param tags any
---@param actortype any
---@param mathcmode any
---@param bexactmatch any
---@param worldId any
function Area:GetActorsByTags(posbeg, posend, tags, actortype, mathcmode, bexactmatch, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param posbeg any
---@param posend any
---@param objtypeidxs any
function Area:GetAllObjsInAreaRangByTypes(posbeg, posend, objtypeidxs) end

---官方环境独有接口（未收录于开发环境）
---@param posbeg any
---@param posend any
---@param objtypes any
---@param worldId any
function Area:GetAllObjsInAreaRangeByObjTypes(posbeg, posend, objtypes, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param pos any
---@param worldId any
function Area:GetAreaByPos(pos, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param srcpos any
---@param dim any
function Area:GetPosOffset(srcpos, dim) end

---官方环境独有接口（未收录于开发环境）
---@param areaid any
---@param x any
---@param y any
---@param z any
function Area:OffsetArea(areaid, x, y, z) end
