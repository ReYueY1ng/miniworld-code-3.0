---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Block<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---转换方块方向转换为数据
---@param blockid? string 方块ID
---@param data any 数据
---@param dir any 方向
function Block:ConvertBlockDirToData(blockid, data, dir) end

---按名称创建normalblue打印
---@param pos Mini.Vec3 位置
---@param dim Mini.Vec3 维度
---@param name string 名称
---@param worldId? any 星球ID
---@return boolean result 是否成功
function Block:CreateNormalBluePrintByName(pos, dim, name, worldId) end

---获取方块配置ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param worldId any 星球ID
function Block:GetBlockCfgID(x, y, z, worldId) end

---按方向获取方块数据
---@param blockid? string 方块ID
---@param dir any 方向
function Block:GetBlockDataByDir(blockid, dir) end

---获取方块def类型
---@param blockid? string 方块ID
function Block:GetBlockDefType(blockid) end

---获取方块tool类型
---@param blockid? string 方块ID
function Block:GetBlockToolType(blockid) end

---获取blue打印manager
---@param uin any 玩家Uin
function Block:GetBluePrintManager(uin) end

---播放动作
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@param animid any 动画ID
---@param playmode any 播放模式
---@return boolean result 是否成功
function Block:PlayAct(x, y, z, animid, playmode) end

---播放粒子特效
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param particleId any 粒子ID
---@param scale? number 缩放
---@param ptime number 粒子时长
---@return boolean result 是否成功
function Block:PlayParticleEffect(x, y, z, particleId, scale, ptime) end

---播放粒子特效世界
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@param particleId any 粒子ID
---@param scale? number 缩放
---@param ptime? any 粒子时长
---@return boolean result 是否成功
function Block:PlayParticleEffectWorld(x, y, z, particleId, scale, ptime) end

---在位置上停止粒子特效
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param particleId any 粒子ID
---@return boolean result 是否成功
function Block:StopParticleEffectOnPos(x, y, z, particleId) end

---停止粒子特效世界
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@param particleId any 粒子ID
---@return boolean result 是否成功
function Block:StopParticleEffectWorld(x, y, z, particleId) end
