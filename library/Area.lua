---@meta

---区域模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/area.html)
---@class Area
Area = {}

---创建一个区域对象
---@param pos table 区域底部中心位置
---@param size table 区域大小（xyz都为100才是一个方块大小）
---@return EntityObject areaobj 区域对象
---@return integer areaid 区域ID
function Area:CreateAreaPrefab(pos, size) end

---通过区域对象id 获取区域uuid
---@param objId integer 区域对象ID
---@return integer ret 区域uuid
function Area:GetAreaUuidByObjId(objId) end

---创建矩形区域(通过范围)
---@param posBeg table 区域起始坐标
---@param posEnd table 区域结束坐标
---@param btmp boolean 是否是临时区域
---@return integer ret 区域ID
function Area:CreateAreaRectByRange(posBeg, posEnd, btmp) end

---销毁区域
---@param areaid integer 区域ID
---@return boolean result
function Area:DestroyArea(areaid) end

---获取区域中间点
---@param areaid integer 区域ID
---@return table PositionTable 区域中心位置
function Area:GetAreaCenter(areaid) end

---获取区域各边长
---@param areaid integer 区域ID
---@return number ret x轴向长度
---@return number leny y轴向长度
---@return number lenz z轴向长度
function Area:GetAreaRectLength(areaid) end

---获取区域范围
---@param areaid integer 区域ID
---@return PositionTable posBeg 区域起始坐标
---@return PositionTable posEnd 区域结束坐标
function Area:GetAreaRectRange(areaid) end

---随机区域内位置
---@param areaid integer 区域ID
---@return table PositionTable 随机坐标
function Area:GetRandomPos(areaid) end

---检测obj是否在区域内
---@param areaid integer 区域ID
---@param objid integer 对象ID
---@return boolean result
function Area:ObjInArea(areaid, objid) end

---检测区域内是否有某个方块
---@param areaid integer 区域ID
---@param blockid integer | string 方块类型ID
---@return boolean result
function Area:BlockInArea(areaid, blockid) end

---位置是否在区域内
---@param areaid integer 区域唯一ID
---@param pos PositionTable 位置(x,y,z)
---@return boolean result
function Area:PosInArea(areaid, pos) end

---获取区域中的所有玩家
---@param areaid integer 区域唯一ID
---@return integer[] playerlist 玩家objid组
function Area:GetAreaPlayers(areaid) end

---获取区域中的所有生物(当帧创建的生物获取不到)
---@param areaid integer 区域唯一ID
---@return integer[] list 生物objid组
function Area:GetAreaCreatures(areaid) end

---清空区域内全部方块
---@param areaid integer 区域唯一ID
---@param blockid integer | string 方块类型ID
---@param num integer 最大清除数量
---@param btriggerevent boolean 是否触发事件
---@return boolean result
function Area:ClearAllBlock(areaid, blockid, num, btriggerevent) end

---复制区域内方块到另一个区域
---@param areaid integer 区域唯一ID
---@param pos PositionTable 目标起始位置
---@return boolean result
function Area:CloneAreaBlock(areaid, pos) end

---替换方块类型为新的方块类型
---@param areaid integer 区域唯一ID
---@param srcblockid integer | string 区域内的方块类型
---@param destblockid integer | string 替换的方块类型
---@param face? integer 方块朝向
---@param color? string|integer 颜色
---@return boolean result
function Area:ReplaceAreaBlock(areaid, srcblockid, destblockid, face, color) end

---获取区域范围内全部对象
---@param posbeg PositionTable 起始位置
---@param posend PositionTable 末点位置
---@param objtype ObjType 对象类型
---@return integer[] objs 对象objid组
function Area:GetAllObjsInAreaRange(posbeg, posend, objtype) end

---获取区域范围内全部玩家
---@param posbeg PositionTable 起始位置
---@param posend PositionTable 末点位置
---@return integer[] objs 对象objid组
function Area:GetAllPlayersInAreaRange(posbeg, posend) end

---获取区域范围内全部生物
---@param posbeg PositionTable 起始位置
---@param posend PositionTable 末点位置
---@return integer[] objs 对象objid组
function Area:GetAllCreaturesInAreaRange(posbeg, posend) end

---用方块填充区域范围(分帧处理，当前帧率操作不到填充的方块)
---@param posbeg PositionTable 起始位置
---@param posend PositionTable 末点位置
---@param blockid integer | string 方块类型
---@param face? integer 朝向
---@param color? string | integer 颜色
---@param switch? boolean 是否开启
---@param filltype? AreaFillType 填充类型
---@return boolean result
function Area:FillBlockAreaRange(posbeg, posend, blockid, face, color, switch, filltype) end

---清空区域范围内方块
---@param posbeg PositionTable 起始位置
---@param posend PositionTable 末点位置
---@param blockid integer | string 方块类型
---@param btriggerevent? boolean 是否触发事件
---@return boolean result
function Area:ClearAllBlockAreaRange(posbeg, posend, blockid, btriggerevent) end

---破坏区域内的方块
---@param areaid number 区域ID
---@param blockid string | integer 方块ID或资产ID
---@param n? integer 销毁数量(不填或者0则全部销毁)
---@param candrop? boolean 是否掉落物品
---@param btriggerevent? boolean 是否触发事件
---@return boolean result
function Area:DestroyAllBlock(areaid, blockid, n, candrop, btriggerevent) end

---复制区域范围内方块到另一个区域
---@param posbeg PositionTable 起始位置
---@param posend PositionTable 末点位置
---@param deststartpos PositionTable 目标起始位置
---@param itype? integer 类型参数
---@return boolean result
function Area:CloneAreaRange(posbeg, posend, deststartpos, itype) end

---替换区域范围方块
---@param posbeg PositionTable 起始位置
---@param posend PositionTable 末点位置
---@param srcblockid integer | string 方块类型
---@param destblockid integer | string 目标方块类型
---@param face? integer 朝向
---@param inair? boolean 是否包括空气方块
---@return boolean result
function Area:ReplaceAreaRangeBlock(posbeg, posend, srcblockid, destblockid, face, inair) end

---获取一个区域内随机空气方块
---@param posbeg PositionTable 区域起始位置
---@param posend PositionTable 区域结束位置
---@return PositionTable pos 随机空气位置(x, y, z)
function Area:GetRandomAirPos(posbeg, posend) end

---获取区域内的方块类型
---@param areaid integer 区域ID
---@return integer[] types 类型组
function Area:GetAreaBlockTypes(areaid) end

---获取区域内的方块数量
---@param areaid integer 区域ID
---@param blockid string | integer 方块ID
---@return integer num 方块数量
function Area:GetBlockNum(areaid, blockid) end

---检查指定范围内是否可以放置方块
---@param posbeg PositionTable 区域起始位置
---@param posend PositionTable 区域结束位置
---@param blockid string | integer 方块ID
---@return boolean result
function Area:CheckRangeCanPlace(posbeg, posend, blockid) end

---获取区域中指定玩家关系的角色
---@param posbeg PositionTable 区域起始位置
---@param posend PositionTable 区域结束位置
---@param uin integer 玩家ID
---@param relativing RelativeCampType 关系类型
---@param actortype ObjType 角色
---@return integer num 数量
---@return integer[] arr ID数组
function Area:GetRelativeActors(posbeg, posend, uin, relativing, actortype) end