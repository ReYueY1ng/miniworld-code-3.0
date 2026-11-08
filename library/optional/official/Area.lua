---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Area<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---在区域范围中方块
---@param blockid? number | string 方块ID
---@param posbeg? Mini.Vec3 起点位置
---@param posend Mini.Vec3 终点位置
---@param worldId? any 星球ID
---@return boolean result 是否成功
function Area:BlockInAreaRange(blockid, posbeg, posend, worldId) end

---创建区域rect
---@param pos table 位置
---@param dim table 维度
---@param btmp? boolean 参数 btmp
---@param worldId? any 星球ID
---@return boolean result 是否成功
function Area:CreateAreaRect(pos, dim, btmp, worldId) end

---销毁方块区域范围
---@param posbeg? Mini.Vec3 起点位置
---@param posend Mini.Vec3 终点位置
---@param blockid? string 方块ID
---@param n number 参数 n
---@param candrop? boolean 是否掉落
---@param btriggerevent any 参数 btriggerevent
---@param worldId? any 星球ID
---@return boolean result 是否成功
function Area:DestroyBlockAreaRange(posbeg, posend, blockid, n, candrop, btriggerevent, worldId) end

---销毁范围方块
---@param posbeg? Mini.Vec3 起点位置
---@param posend Mini.Vec3 终点位置
---@param blockid? string 方块ID
---@param n number 参数 n
---@param dropCount any 掉落数量
---@param btriggerevent any 参数 btriggerevent
---@param worldId? any 星球ID
---@return boolean result 是否成功
function Area:DestroyRangeBlock(posbeg, posend, blockid, n, dropCount, btriggerevent, worldId) end

---expand区域
---@param areaid number 区域ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return boolean result 是否成功
function Area:ExpandArea(areaid, x, y, z) end

---按标签获取角色
---@param posbeg? Mini.Vec3 起点位置
---@param posend Mini.Vec3 终点位置
---@param tags any 标签
---@param actortype number 角色类型
---@param mathcmode number 匹配方式
---@param bexactmatch boolean 是否精确匹配
---@param worldId? any 星球ID
function Area:GetActorsByTags(posbeg, posend, tags, actortype, mathcmode, bexactmatch, worldId) end

---按types获取全部objsin区域rang
---@param posbeg any 起点位置
---@param posend any 终点位置
---@param objtypeidxs any 参数 objtypeidxs
function Area:GetAllObjsInAreaRangByTypes(posbeg, posend, objtypeidxs) end

---按对象types获取全部objsin区域范围
---@param posbeg? Mini.Vec3 起点位置
---@param posend Mini.Vec3 终点位置
---@param objtypes table 参数 objtypes
---@param worldId? any 星球ID
function Area:GetAllObjsInAreaRangeByObjTypes(posbeg, posend, objtypes, worldId) end

---按位置获取区域
---@param pos table 位置
---@param worldId? any 星球ID
---@return boolean value 是否成功
function Area:GetAreaByPos(pos, worldId) end

---获取位置偏移
---@param srcpos Mini.Vec3 参数 srcpos
---@param dim Mini.Vec3 维度
---@return table? value 结果，失败时为 nil
function Area:GetPosOffset(srcpos, dim) end

---偏移区域
---@param areaid number 区域ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return boolean result 是否成功
function Area:OffsetArea(areaid, x, y, z) end
