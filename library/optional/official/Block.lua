---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Block<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---把方块朝向换算为对应的方块数据值
---转发引擎 BlockApi:convertBlockDirToData
---@param blockid? string 方块ID（数字配置ID或资源ID字符串）
---@param data any 当前方块数据值
---@param dir Mini.Vec3 朝向（FaceDir）
---@return number? data 换算后的方块数据值，失败时为 nil
function Block:ConvertBlockDirToData(blockid, data, dir) end

---按位置和尺寸创建命名的普通蓝图
---创建过程用 pcall 保护，引擎报错时返回 false
---@param pos Mini.Vec3 蓝图起点位置，含 worldId/mapId 时用于确定星球
---@param dim Mini.Vec3 蓝图尺寸 {x,y,z}
---@param name string 蓝图名称
---@param worldId? integer 目标星球ID，省略时取 pos.worldId 或 pos.mapId
---@return boolean result 是否创建成功
function Block:CreateNormalBluePrintByName(pos, dim, name, worldId) end

---获取指定方块坐标上的方块配置ID
---@param x number X坐标，内部向下取整
---@param y number Y坐标，内部向下取整
---@param z number Z坐标，内部向下取整
---@param worldId integer 星球ID，省略时使用当前世界
---@return number? blockid 方块配置ID，星球或坐标无效时为 nil
function Block:GetBlockCfgID(x, y, z, worldId) end

---获取方块在指定朝向下的数据值
---@param blockid? string 方块ID（数字配置ID或资源ID字符串）
---@param dir Mini.Vec3 朝向（FaceDir）
---@return number? data 方块数据值，失败时为 nil
function Block:GetBlockDataByDir(blockid, dir) end

---获取方块配置的类型
---@param blockid? string 方块ID（数字配置ID或资源ID字符串）
---@return number? blockType 方块类型，方块不存在时为 nil
function Block:GetBlockDefType(blockid) end

---获取方块所需的挖掘工具类型与等级
---两个返回值同时返回或同时无返回值
---@param blockid? string 方块ID（数字配置ID或资源ID字符串）
---@return number? toolType 工具类型，方块不存在时为 nil
---@return number? level 所需工具等级
function Block:GetBlockToolType(blockid) end

---生成玩家蓝图文件名的递增序号
---同一玩家在同一秒内重复调用时序号强制加一，避免蓝图重名
---供 GetBluePrintFileName 等内部创建蓝图流程使用
---@param uin integer 玩家Uin
---@return number idx 基于服务器毫秒时间的递增序号
function Block:GetBluePrintManager(uin) end

---让指定位置的方块播放动作
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param animid number | string 动作ID
---@param playmode any 播放模式（AnimMode）
---@return boolean result 是否播放成功
function Block:PlayAct(x, y, z, animid, playmode) end

---在指定方块位置播放粒子特效
---坐标会向下取整到方块
---scale 与 ptime 均不能省略
---时长内部按每秒 20 帧换算
---粒子配置不存在时返回 false
---@param x number X坐标，内部向下取整
---@param y number Y坐标，内部向下取整
---@param z number Z坐标，内部向下取整
---@param particleId number | string 粒子特效ID
---@param scale? number 缩放比例，必须传入
---@param ptime number 播放时长（秒），小于等于 0 时永久播放
---@return boolean result 是否播放成功
function Block:PlayParticleEffect(x, y, z, particleId, scale, ptime) end

---以触发器方式在世界坐标播放粒子特效
---仅对 TriggerType 大于 0 的粒子配置生效
---播放时开启触发器可见性参数
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param particleId number | string 粒子特效ID
---@param scale? number 缩放比例，默认 1
---@param ptime? number 播放时长（秒），PlayMode 为 2 时省略默认 30 秒，其余情况小于等于 0 永久播放
---@return boolean result 是否播放成功
function Block:PlayParticleEffectWorld(x, y, z, particleId, scale, ptime) end

---停止指定方块位置上的粒子特效
---粒子配置不存在时返回 false
---@param x number X坐标，内部向下取整
---@param y number Y坐标，内部向下取整
---@param z number Z坐标，内部向下取整
---@param particleId number | string 粒子特效ID
---@return boolean result 是否停止成功
function Block:StopParticleEffectOnPos(x, y, z, particleId) end

---停止以触发器方式播放的世界粒子特效
---仅对 TriggerType 大于 0 的粒子配置生效
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param particleId number | string 粒子特效ID
---@return boolean result 是否停止成功
function Block:StopParticleEffectWorld(x, y, z, particleId) end
