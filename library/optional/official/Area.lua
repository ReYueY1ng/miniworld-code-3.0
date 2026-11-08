---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Area<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---检测区域范围内是否存在指定方块
---坐标会自动归一化为起点小于终点
---@param blockid? number | string 方块ID（数字配置ID或资源ID字符串）
---@param posbeg? Mini.Vec3 范围起点坐标 {x,y,z}
---@param posend Mini.Vec3 范围终点坐标 {x,y,z}
---@param worldId? integer 星球ID，省略时使用当前世界
---@return boolean result 范围内是否存在该方块，失败时为 false
function Area:BlockInAreaRange(blockid, posbeg, posend, worldId) end

---按中心点和各轴扩展距离创建矩形区域
---实际范围为 center±dim
---相同范围已有区域时直接复用其ID
---@param pos table 区域中心坐标 {x,y,z}
---@param dim table 各轴扩展距离 {x,y,z}
---@param btmp? boolean 是否临时区域，默认 true
---@param worldId? integer 星球ID，省略时使用当前世界
---@return number|boolean result 区域ID，失败时为 false
function Area:CreateAreaRect(pos, dim, btmp, worldId) end

---破坏区域范围内的指定方块
---逐帧处理，单帧处理不完的方块留到后续帧
---方块ID需通过脚本使用校验
---@param posbeg? Mini.Vec3 范围起点坐标 {x,y,z}
---@param posend Mini.Vec3 范围终点坐标 {x,y,z}
---@param blockid? string 方块ID（数字配置ID或资源ID字符串），传 0 表示所有方块
---@param n number 最大破坏数量，传 0 表示不限制
---@param candrop? boolean 是否掉落道具，默认 false
---@param btriggerevent boolean 是否触发方块被破坏事件
---@param worldId? integer 星球ID，省略时使用当前世界
---@return boolean result 是否成功
function Area:DestroyBlockAreaRange(posbeg, posend, blockid, n, candrop, btriggerevent, worldId) end

---破坏区域范围内的方块并指定掉落数量
---逐帧处理，单帧处理不完的方块留到后续帧
---方块ID需通过脚本使用校验
---@param posbeg? Mini.Vec3 范围起点坐标 {x,y,z}
---@param posend Mini.Vec3 范围终点坐标 {x,y,z}
---@param blockid? string 方块ID（数字配置ID或资源ID字符串），传 0 表示所有方块
---@param n number 最大破坏数量，传 0 表示不限制
---@param dropCount number 每个方块的掉落数量，默认 -1 表示按方块默认掉落
---@param btriggerevent boolean 是否触发方块被破坏事件
---@param worldId? integer 星球ID，省略时使用当前世界
---@return boolean result 是否成功
function Area:DestroyRangeBlock(posbeg, posend, blockid, n, dropCount, btriggerevent, worldId) end

---按各轴距离向两端扩大区域
---扩大后创建的是临时区域
---原区域不会自动销毁
---@param areaid number 区域ID
---@param x number X轴扩大距离，实际向两端各扩展一半
---@param y number Y轴扩大距离，实际向两端各扩展一半
---@param z number Z轴扩大距离，实际向两端各扩展一半
---@return number|boolean value 扩大后的区域ID，失败时为 false
function Area:ExpandArea(areaid, x, y, z) end

---按标签查找区域范围内的角色
---actortype 仅支持 Player、Mob、Role
---参数非法或没有匹配对象时无返回值
---内部锁定对象列表后立即解锁
---@param posbeg? Mini.Vec3 范围起点坐标 {x,y,z}
---@param posend Mini.Vec3 范围终点坐标 {x,y,z}
---@param tags string | string[] 标签数组
---@param actortype number 角色类型（ObjType.Player/Mob/Role）
---@param mathcmode number 标签匹配方式（MatchMode）
---@param bexactmatch boolean 是否精确匹配标签
---@param worldId? integer 星球ID，省略时使用当前世界
---@return number num 匹配到的角色数量
---@return table objs 角色对象ID数组
function Area:GetActorsByTags(posbeg, posend, tags, actortype, mathcmode, bexactmatch, worldId) end

---按对象类型索引数组获取区域范围内的对象
---该接口不接收 worldId，使用引擎当前世界
---@param posbeg Mini.Vec3 范围起点坐标 {x,y,z}
---@param posend Mini.Vec3 范围终点坐标 {x,y,z}
---@param objtypeidxs any 对象类型索引数组（0 玩家、1 生物、2 掉落物、3 投掷物、4 实体、5 区域）
---@return table? objs 对象ID数组，失败时为 nil
function Area:GetAllObjsInAreaRangByTypes(posbeg, posend, objtypeidxs) end

---按对象类型数组获取区域范围内的全部对象
---可一次查询多种 ObjType
---@param posbeg? Mini.Vec3 范围起点坐标 {x,y,z}
---@param posend Mini.Vec3 范围终点坐标 {x,y,z}
---@param objtypes table 对象类型数组（ObjType）
---@param worldId? integer 星球ID，省略时使用当前世界
---@return table? objs 对象ID数组，失败时为 nil
function Area:GetAllObjsInAreaRangeByObjTypes(posbeg, posend, objtypes, worldId) end

---查找包含指定坐标的区域
---返回区域对象ID或临时区域ID
---@param pos table 坐标 {x,y,z}
---@param worldId? integer 星球ID，省略时使用当前世界
---@return number|boolean? areaid 区域ID：未找到为 nil，参数非法为 false
function Area:GetAreaByPos(pos, worldId) end

---计算坐标按维度叠加偏移后的新坐标
---@param srcpos Mini.Vec3 源坐标 {x,y,z}
---@param dim Mini.Vec3 各轴偏移量 {x,y,z}
---@return table? pos 新坐标 {x,y,z}，参数缺字段时为 nil
function Area:GetPosOffset(srcpos, dim) end

---把区域按各轴距离平移
---平移后创建的是临时区域
---原区域不会自动销毁
---@param areaid number 区域ID
---@param x number X轴平移距离，可为负
---@param y number Y轴平移距离，可为负
---@param z number Z轴平移距离，可为负
---@return number|boolean value 平移后的区域ID，失败时为 false
function Area:OffsetArea(areaid, x, y, z) end
