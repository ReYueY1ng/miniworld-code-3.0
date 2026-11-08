---@meta

---触发器 World 模块（Trigger.World）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.World
Trigger.World = {}

---按位置位置计算方向
---@param pos1 any 位置
---@param pos2 any 位置
function Trigger.World:CalcDirectionByPos2Pos(pos1, pos2) end

---计算水平角度
---@param posSrc Mini.Vec3 起点位置
---@param posDst Mini.Vec3 目标位置
---@return number result 计算结果
function Trigger.World:CalcHorizontalAngle(posSrc, posDst) end

---计算向量方向角度
---@param vec1? Mini.Vec3 向量
---@param vec2 Mini.Vec3 向量
---@return number result 计算结果
function Trigger.World:CalcVectorDirectionAngle(vec1, vec2) end

---计算垂直角度
---@param posSrc Mini.Vec3 起点位置
---@param posDst Mini.Vec3 目标位置
---@return number result 计算结果
function Trigger.World:CalcVerticalAngle(posSrc, posDst) end

---在位置XZ上判断能否生物生成
---@param pos Mini.Vec3 位置
---@param worldId any 星球ID
---@return number result 结果数值
function Trigger.World:CanMobSpawnOnPosXZ(pos, worldId) end

---比较群系组
---@param v1 any 向量
---@param v2 any 向量
---@return boolean result 检查结果
function Trigger.World:CompareBiomeGroup(v1, v2) end

---比较游戏模式
---@param isequal any 是否相等
---@param mode any 模式
---@return boolean result 检查结果
function Trigger.World:CompareGameMode(isequal, mode) end

---移除角色
---@param killtype any 参数 killtype
---@param data integer | integer[] 数据
---@return boolean result 是否成功
function Trigger.World:DespawnActor(killtype, data) end

---移除areas
---@param data integer | integer[] 数据
---@return boolean result 是否成功
function Trigger.World:DespawnAreas(data) end

---移除对象
---@param data integer | integer[] 数据
---@return boolean result 是否成功
function Trigger.World:DespawnObject(data) end

---获取群系组
---@param pos any 位置
---@param worldId any 星球ID
function Trigger.World:GetBiomeGroup(pos, worldId) end

---获取container格子属性
---@param pos Mini.Vec3 位置
---@param gridid any 格子ID
---@param attr any 属性
---@param worldId any 星球ID
function Trigger.World:GetContainerGridAttr(pos, gridid, attr, worldId) end

---获取containerstorage道具
---@param pos Mini.Vec3 位置
---@param gridid any 格子ID
---@param worldId any 星球ID
function Trigger.World:GetContainerStorageItem(pos, gridid, worldId) end

---获取坐标
---@param pos table 位置
---@param v any 参数 v
function Trigger.World:GetCoord(pos, v) end

---获取方向raydetection
---@param posbegin any 起点位置
---@param dir number 方向
---@param maxlen any 参数 maxlen
---@param itype any 类型
---@param worldId any 星球ID
function Trigger.World:GetDirRayDetection(posbegin, dir, maxlen, itype, worldId) end

---按位置获取light
---@param pos Mini.Vec3 位置
---@param worldId any 星球ID
function Trigger.World:GetLightByPos(pos, worldId) end

---获取ray方块
---@param pos Mini.Vec3 位置
---@param face any 朝向
---@param distance any 距离
function Trigger.World:GetRayBlock(pos, face, distance) end

---获取raydetection位置
---@param posbegin any 起点位置
---@param dir number 方向
---@param maxlen any 参数 maxlen
---@param itype any 类型
---@param worldId any 星球ID
function Trigger.World:GetRayDetectionPos(posbegin, dir, maxlen, itype, worldId) end

---获取ray长度
---@param pos1 Mini.Vec3 位置
---@param pos2 Mini.Vec3 位置
---@param distance any 距离
function Trigger.World:GetRayLength(pos1, pos2, distance) end

---获取出生点
---@param worldid any 星球ID
---@return table value 结果表
function Trigger.World:GetSpawnPoint(worldid) end

---判断是否chunkloaded
---@param pos table 位置
---@param worldId any 星球ID
---@return boolean result 是否满足条件
function Trigger.World:IsChunkLoaded(pos, worldId) end

---偏移位置
---@param pos Mini.Vec3 位置
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@return Mini.Vec3 ret 位置或向量
function Trigger.World:OffsetPos(pos, x, y, z) end

---偏移位置val
---@param pos Mini.Vec3 位置
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
function Trigger.World:OffsetPosVal(pos, x, y, z) end

---在位置上paseor恢复音效特效
---@param pos any 位置
---@param musicId any 音乐ID
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.World:PaseOrResumeSoundEffectOnPos(pos, musicId, worldId) end

---在位置上暂停音效特效
---@param pos any 位置
---@param musicId any 音乐ID
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.World:PauseSoundEffectOnPos(pos, musicId, worldId) end

---播放粒子
---@param pos table 位置
---@param particleIds integer | integer[] 粒子ID或其数组
---@param ptime any 粒子时长
---@param offset? table 偏移
---@param rot? table 旋转
---@param scale? table 缩放
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.World:PlayParticle(pos, particleIds, ptime, offset, rot, scale, worldId) end

---播放粒子特效
---@param pos Mini.Vec3 位置
---@param particleId any 粒子ID
---@param scale? number 缩放
---@param ptime any 粒子时长
---@return boolean result 是否成功
function Trigger.World:PlayParticleEffect(pos, particleId, scale, ptime) end

---在位置上恢复音效特效
---@param pos any 位置
---@param musicId any 音乐ID
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.World:ResumeSoundEffectOnPos(pos, musicId, worldId) end

---设置container格子属性
---@param pos Mini.Vec3 位置
---@param gridid any 格子ID
---@param attr any 属性
---@param value any 值
function Trigger.World:SetContainerGridAttr(pos, gridid, attr, value) end

---按位置设置light
---@param pos Mini.Vec3 位置
---@param value any 值
---@param worldId any 星球ID
function Trigger.World:SetLightByPos(pos, value, worldId) end

---设置粒子特效缩放
---@param pos Mini.Vec3 位置
---@param particleId any 粒子ID
---@param sclae any 参数 sclae
function Trigger.World:SetParticleEffectScale(pos, particleId, sclae) end

---设置粒子transform
---@param pos table 位置
---@param particleIds integer | integer[] 粒子ID或其数组
---@param offset? table 偏移
---@param rot? table 旋转
---@param scale? table 缩放
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.World:SetParticleTransform(pos, particleIds, offset, rot, scale, worldId) end

---设置skybox颜色动画
---@param data integer | integer[] 数据
---@param itype any 类型
---@param color any 颜色
---@param animId any 动画ID
---@param animTime any 动画时长
---@param worldid any 星球ID
---@return boolean result 是否成功
function Trigger.World:SetSkyBoxColorAnim(data, itype, color, animId, animTime, worldid) end

---设置skyboxfilter
---@param data integer | integer[] 数据
---@param itype any 类型
---@param value any 值
---@param worldid any 星球ID
---@return boolean result 是否成功
function Trigger.World:SetSkyBoxFilter(data, itype, value, worldid) end

---设置skyboxfilter颜色
---@param playerid any 玩家ID
---@param value any 值
---@param worldid any 星球ID
function Trigger.World:SetSkyBoxFilterColor(playerid, value, worldid) end

---设置skyboxfilter颜色动画
---@param data integer | integer[] 数据
---@param value any 值
---@param animId any 动画ID
---@param animTime any 动画时长
---@param worldid any 星球ID
---@return boolean result 是否成功
function Trigger.World:SetSkyBoxFilterColorAnim(data, value, animId, animTime, worldid) end

---设置skyboxfilterlut
---@param playerid any 玩家ID
---@param value any 值
---@param worldid any 星球ID
function Trigger.World:SetSkyBoxFilterLUT(playerid, value, worldid) end

---设置skyboxfiltertemplate
---@param playerid any 玩家ID
---@param value any 值
---@param worldid any 星球ID
function Trigger.World:SetSkyBoxFilterTemplate(playerid, value, worldid) end

---设置skyboxmaps动画
---@param data integer | integer[] 数据
---@param itype any 类型
---@param url any 资源地址
---@param animId any 动画ID
---@param animTime any 动画时长
---@param worldid any 星球ID
---@return boolean result 是否成功
function Trigger.World:SetSkyBoxMapsAnim(data, itype, url, animId, animTime, worldid) end

---设置出生点
---@param obiid any obiID
---@param pos Mini.Vec3 位置
function Trigger.World:SetSpawnPoint(obiid, pos) end

---设置storage道具
---@param pos Mini.Vec3 位置
---@param offset any 偏移
---@param itemid any 道具ID
---@param num any 数量
---@param worldId any 星球ID
function Trigger.World:SetStorageItem(pos, offset, itemid, num, worldId) end

---在位置上生成projectile
---@param pos Mini.Vec3 位置
---@param itemid any 道具ID
---@param dst Mini.Vec3 目标位置
---@param worldId any 星球ID
function Trigger.World:SpawnProjectileOnPos(pos, itemid, dst, worldId) end

---生成shooterprojectile
---@param objid any 对象ID
---@param dir? Mini.Vec3 | number 方向
---@param itemid any 道具ID
---@return boolean result 是否成功
function Trigger.World:SpawnShooterProjectile(objid, dir, itemid) end

---按位置生成shooterprojectile
---@param pos Mini.Vec3 位置
---@param objid any 对象ID
---@param itemid any 道具ID
---@param dst Mini.Vec3 目标位置
function Trigger.World:SpawnShooterProjectileByPos(pos, objid, itemid, dst) end

---在位置上停止粒子特效
---@param pos Mini.Vec3 位置
---@param particleIds integer | integer[] 粒子ID或其数组
---@return boolean result 是否成功
function Trigger.World:StopParticleEffectOnPos(pos, particleIds) end

---在位置上停止粒子
---@param pos Mini.Vec3 位置
---@param particleIds integer | integer[] 粒子ID或其数组
---@param worldId any 星球ID
---@return boolean result 是否成功
function Trigger.World:StopParticleOnPos(pos, particleIds, worldId) end

---XYZ转换为位置
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@return table result 结果表
function Trigger.World:XyzToPos(x, y, z) end
