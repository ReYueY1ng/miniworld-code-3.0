---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Area<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param blockid? number | string
---@param posbeg? Mini.Vec3
---@param posend Mini.Vec3
---@param worldId? any
---@return boolean
function Area:BlockInAreaRange(blockid, posbeg, posend, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param pos table
---@param dim table
---@param btmp? boolean
---@param worldId? any
---@return boolean
function Area:CreateAreaRect(pos, dim, btmp, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param posbeg? Mini.Vec3
---@param posend Mini.Vec3
---@param blockid? string
---@param n number
---@param candrop? boolean
---@param btriggerevent any
---@param worldId? any
---@return boolean
function Area:DestroyBlockAreaRange(posbeg, posend, blockid, n, candrop, btriggerevent, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param posbeg? Mini.Vec3
---@param posend Mini.Vec3
---@param blockid? string
---@param n number
---@param dropCount any
---@param btriggerevent any
---@param worldId? any
---@return boolean
function Area:DestroyRangeBlock(posbeg, posend, blockid, n, dropCount, btriggerevent, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param areaid number
---@param x number
---@param y number
---@param z number
---@return boolean
function Area:ExpandArea(areaid, x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param posbeg? Mini.Vec3
---@param posend Mini.Vec3
---@param tags any
---@param actortype number
---@param mathcmode number
---@param bexactmatch boolean
---@param worldId? any
function Area:GetActorsByTags(posbeg, posend, tags, actortype, mathcmode, bexactmatch, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param posbeg any
---@param posend any
---@param objtypeidxs any
function Area:GetAllObjsInAreaRangByTypes(posbeg, posend, objtypeidxs) end

---官方环境独有接口（未收录于开发环境）
---@param posbeg? Mini.Vec3
---@param posend Mini.Vec3
---@param objtypes table
---@param worldId? any
function Area:GetAllObjsInAreaRangeByObjTypes(posbeg, posend, objtypes, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param pos table
---@param worldId? any
---@return boolean
function Area:GetAreaByPos(pos, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param srcpos Mini.Vec3
---@param dim Mini.Vec3
---@return table?
function Area:GetPosOffset(srcpos, dim) end

---官方环境独有接口（未收录于开发环境）
---@param areaid number
---@param x number
---@param y number
---@param z number
---@return boolean
function Area:OffsetArea(areaid, x, y, z) end
