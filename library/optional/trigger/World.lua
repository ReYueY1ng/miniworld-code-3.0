---@meta

---触发器 World 模块（Trigger.World）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.World
Trigger.World = {}

---计算位置1指向位置2的单位方向向量
---两点重合时长度为 0，会得到 inf 或 nan
---@param pos1 table 起点坐标表 {x,y,z}
---@param pos2 table 终点坐标表 {x,y,z}
---@return table|nil dir 单位方向向量 {x,y,z}，入参非法返回 nil
function Trigger.World:CalcDirectionByPos2Pos(pos1, pos2) end

---计算起点指向目标的水平角度
---@param posSrc Mini.Vec3 起点坐标
---@param posDst Mini.Vec3 目标坐标
---@return number angle 水平角度（度，0~360），入参非法返回 -1
function Trigger.World:CalcHorizontalAngle(posSrc, posDst) end

---计算两个向量之间的夹角
---@param vec1? Mini.Vec3 向量1 {x,y,z}
---@param vec2 Mini.Vec3 向量2 {x,y,z}
---@return number angle 夹角（度，0~180），入参非法或存在零向量返回 -1
function Trigger.World:CalcVectorDirectionAngle(vec1, vec2) end

---计算起点指向目标的垂直俯仰角
---两点水平距离为 0 时，按高度差返回 90、-90 或 0
---@param posSrc Mini.Vec3 起点坐标
---@param posDst Mini.Vec3 目标坐标
---@return number angle 俯仰角（度，-90~90），入参非法返回 -1
function Trigger.World:CalcVerticalAngle(posSrc, posDst) end

---从给定高度向上查找可刷怪落脚点的高度
---pos 为空时直接返回 -1
---@param pos Mini.Vec3 起点坐标（固定 x、z）
---@param worldId number 星球ID，默认当前主机所在星球
---@return number posy 找到的可刷怪落脚Y坐标，找不到返回 -1
function Trigger.World:CanMobSpawnOnPosXZ(pos, worldId) end

---判断当前地形组是否等于目标地形组
---v2 为 Global（0）时恒返回 true
---@param v1 number 当前地形组，取自 GetBiomeGroup
---@param v2 number 目标地形组枚举 WeatherGroup
---@return boolean result 是否属于该地形组
function Trigger.World:CompareBiomeGroup(v1, v2) end

---比较当前世界游戏模式是否与给定模式一致
---isequal 为空时返回 false
---@param isequal number 1 表示判断相等，其他值表示判断不相等
---@param mode any 游戏模式枚举 WorldType
---@return boolean result 比较结果
function Trigger.World:CompareGameMode(isequal, mode) end

---移除指定生物或区域，玩家改为判定失败
---玩家不会被直接移除，killtype=2 时按失败结算
---骑乘中的生物会先解除骑乘关系再移除
---其它 killtype 不做任何操作
---@param killtype number 移除方式：1 击杀、2 直接移除
---@param data integer | integer[] 对象ID或对象ID数组
---@return boolean result 是否全部处理成功
function Trigger.World:DespawnActor(killtype, data) end

---移除指定的区域对象
---@param data integer | integer[] 区域ID或区域ID数组
---@return boolean result 是否全部移除成功
function Trigger.World:DespawnAreas(data) end

---移除指定对象，玩家改为判定失败
---玩家不会被移除，而是按失败结算
---@param data integer | integer[] 对象ID或对象ID数组
---@return boolean result 是否全部移除成功
function Trigger.World:DespawnObject(data) end

---获取指定位置所在地形组的类型
---@param pos Mini.Vec3 位置坐标（只用 x 与 z）
---@param worldId number 星球ID，默认当前主机所在星球
---@return number|nil group 地形组ID（WeatherGroup），取不到返回 nil
function Trigger.World:GetBiomeGroup(pos, worldId) end

---读取容器格子的属性值
---支持储物箱、熔炉与箱子，格子序号按各自规则换算
---@param pos Mini.Vec3 容器方块坐标
---@param gridid integer 格子序号，从 1 开始
---@param attr any 属性枚举 GridAttr：1 数量、2 耐久、3 坚韧
---@param worldId integer 星球ID
---@return number|boolean value 属性值，容器或格子无效返回 false
function Trigger.World:GetContainerGridAttr(pos, gridid, attr, worldId) end

---读取容器格子里的道具ID
---@param pos Mini.Vec3 容器方块坐标
---@param gridid integer 格子序号，从 1 开始
---@param worldId integer 星球ID
---@return number|string|nil itemid 道具ID，自定义道具为资源ID；空格或容器无效返回 nil
function Trigger.World:GetContainerStorageItem(pos, gridid, worldId) end

---读取坐标表中某一轴的分量
---@param pos table 坐标表 {x,y,z}
---@param v any 轴名，x、y、z 之一
---@return any value 该轴坐标值，pos 不是 table 时返回 nil
function Trigger.World:GetCoord(pos, v) end

---从起点沿方向做射线检测并返回命中对象ID
---检测生物类型时返回配置ID
---需要命中位置请改用 GetRayDetectionPos
---@param posbegin table 起点坐标
---@param dir number 方向：FaceDir 枚举或方向向量 {x,y,z}
---@param maxlen number 最大检测距离（米）
---@param itype number 检测类型枚举 RayDetectType：1 方块、2 玩家、3 生物、4 生物类型、5 液体方块
---@param worldId number 星球ID
---@return number|string|nil result 命中的方块ID或对象ID，自定义资源返回字符串；未命中返回 nil
function Trigger.World:GetDirRayDetection(posbegin, dir, maxlen, itype, worldId) end

---获取指定方块位置的光照强度
---@param pos Mini.Vec3 位置坐标
---@param worldId number 星球ID，默认当前主机所在星球
---@return number lv 光照强度（0~15），取不到返回 -1
function Trigger.World:GetLightByPos(pos, worldId) end

---沿指定面方向检测射线命中的方块
---@param pos Mini.Vec3 起点坐标
---@param face number 面方向枚举 FaceDir
---@param distance number 最大检测距离（米）
---@return number|string|nil result 方块ID，自定义方块返回资源ID字符串；未命中返回 nil
function Trigger.World:GetRayBlock(pos, face, distance) end

---从起点沿方向做射线检测并返回命中位置
---@param posbegin Mini.Vec3 起点坐标
---@param dir number 方向：FaceDir 枚举或方向向量 {x,y,z}
---@param maxlen any 最大检测距离（米）
---@param itype number 检测类型枚举 RayDetectType：1 方块、2 玩家、3 生物、4 生物类型、5 液体方块
---@param worldId integer 星球ID
---@return table|nil pos 命中点坐标（米），未命中返回 nil
function Trigger.World:GetRayDetectionPos(posbegin, dir, maxlen, itype, worldId) end

---计算两点间射线遇到方块前的长度
---@param pos1 Mini.Vec3 起点坐标
---@param pos2 Mini.Vec3 方向参考点坐标
---@param distance number 最大检测距离（米）
---@return number|nil len 射线长度（米），失败返回 nil
function Trigger.World:GetRayLength(pos1, pos2, distance) end

---获取当前地图的默认出生点坐标
---@param worldid integer 星球ID，默认当前星球
---@return table pos 出生点坐标 {x,y,z}，世界未就绪时为 (0,-1,0)
function Trigger.World:GetSpawnPoint(worldid) end

---判断指定位置所在的区块是否已加载
---@param pos table 位置坐标，只用 x 与 z
---@param worldId number 星球ID，默认当前主机所在星球
---@return boolean result 是否已加载
function Trigger.World:IsChunkLoaded(pos, worldId) end

---就地偏移坐标并返回同一个坐标表
---会直接修改传入的坐标表
---@param pos Mini.Vec3 待偏移的坐标表
---@param x number X轴偏移量，默认 0
---@param y number Y轴偏移量，默认 0
---@param z number Z轴偏移量，默认 0
---@return table pos 偏移后的坐标表
function Trigger.World:OffsetPos(pos, x, y, z) end

---偏移坐标并返回一张新的坐标表
---不修改传入的坐标表
---@param pos Mini.Vec3 原始坐标表
---@param x number X轴偏移量，默认 0
---@param y number Y轴偏移量，默认 0
---@param z number Z轴偏移量，默认 0
---@return table pos 新的坐标表，入参非法时原样返回 pos
function Trigger.World:OffsetPosVal(pos, x, y, z) end

---在暂停与恢复之间切换指定位置的音效
---按方块坐标取整后记录每个位置每个音效的暂停状态，首次调用为暂停
---@param pos Mini.Vec3 位置坐标
---@param musicId number | string 音效ID，-1 表示该位置所有音效
---@param worldId integer 星球ID，默认当前主机所在星球
---@return boolean result 是否切换成功
function Trigger.World:PaseOrResumeSoundEffectOnPos(pos, musicId, worldId) end

---暂停指定位置的音效
---坐标会向下取整到方块
---@param pos table 位置坐标
---@param musicId number | string 音效ID，-1 表示该位置所有音效
---@param worldId number 星球ID，默认当前主机所在星球
---@return boolean result 是否暂停成功
function Trigger.World:PauseSoundEffectOnPos(pos, musicId, worldId) end

---在指定位置播放一个或多个粒子特效
---最后创建的粒子ID会被记录，供特效结束事件使用
---@param pos table 位置坐标，会被对齐到方块中心
---@param particleIds integer | integer[] 粒子ID或粒子ID数组
---@param ptime number 特效时长（秒），小于等于 0 时使用默认时长
---@param offset? table 偏移量，按方块数计算，默认 0
---@param rot? table 旋转，默认 0
---@param scale? table 缩放，默认 1
---@param worldId number 星球ID
---@return boolean result 是否播放成功
function Trigger.World:PlayParticle(pos, particleIds, ptime, offset, rot, scale, worldId) end

---在指定位置播放单个粒子特效
---粒子定义不存在时返回 false
---播放成功后记录最后创建的粒子ID
---@param pos Mini.Vec3 位置坐标，会向下取整到方块
---@param particleId number | string 粒子ID
---@param scale? number 缩放倍数，默认 1
---@param ptime number 特效时长（秒）
---@return boolean result 是否播放成功
function Trigger.World:PlayParticleEffect(pos, particleId, scale, ptime) end

---恢复指定位置被暂停的音效
---@param pos Mini.Vec3 位置坐标
---@param musicId number | string 音效ID，-1 表示该位置所有音效
---@param worldId integer 星球ID，默认当前主机所在星球
---@return boolean result 是否恢复成功
function Trigger.World:ResumeSoundEffectOnPos(pos, musicId, worldId) end

---设置容器格子的属性值
---数量与耐久会被限制在道具上限内，低于 0 按 0 处理
---目标方块必须是容器，否则返回 false
---@param pos Mini.Vec3 容器方块坐标
---@param gridid integer 格子序号，从 1 开始
---@param attr any 属性枚举 GridAttr：1 数量、2 耐久、3 坚韧
---@param value any 属性值，数量小于等于 0 时清空格子
---@return boolean|number result 是否设置成功，清空格子时返回 0
function Trigger.World:SetContainerGridAttr(pos, gridid, attr, value) end

---设置指定方块位置的光照强度
---@param pos Mini.Vec3 位置坐标
---@param value number 光照强度 0~15，超出范围会被截断
---@param worldId number 星球ID，默认当前主机所在星球
---@return boolean result 是否设置成功
function Trigger.World:SetLightByPos(pos, value, worldId) end

---设置指定位置粒子特效的缩放
---@param pos Mini.Vec3 位置坐标
---@param particleId number | string 粒子ID
---@param sclae any 缩放倍数（引擎原拼写）
---@return boolean result 是否设置成功
function Trigger.World:SetParticleEffectScale(pos, particleId, sclae) end

---调整已存在粒子特效的偏移、旋转与缩放
---只对该位置同路径已播放的特效生效
---@param pos table 位置坐标，会被对齐到方块中心
---@param particleIds integer | integer[] 粒子ID或粒子ID数组
---@param offset? table 偏移量，按方块数计算，默认 0
---@param rot? table 旋转，默认 0
---@param scale? table 缩放，默认 1
---@param worldId number 星球ID
---@return boolean result 是否处理成功
function Trigger.World:SetParticleTransform(pos, particleIds, offset, rot, scale, worldId) end

---以动画方式修改玩家天空盒颜色
---itype 超出 1~12 或颜色无法解析时返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param itype number 颜色属性枚举 SkyboxColor（1~12，如 1 顶部、8 云、9 雾）
---@param color string 颜色值：0xRRGGBB 数值或 {r,g,b} 表
---@param animId number 缓动枚举 Easing
---@param animTime number 动画时长
---@param worldid integer 星球ID
---@return boolean result 是否全部设置成功
function Trigger.World:SetSkyBoxColorAnim(data, itype, color, animId, animTime, worldid) end

---修改玩家天空盒的滤镜参数
---itype 超出滤镜枚举范围时返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param itype number 滤镜参数枚举 SkyboxFilter（1 对比度、2 饱和度、3 泛光、4 曝光、8 颜色、9 LUT 等）
---@param value number | string 参数值：数值型滤镜传 0~100，颜色滤镜传 16 进制颜色值
---@param worldid integer 星球ID
---@return boolean result 是否全部设置成功
function Trigger.World:SetSkyBoxFilter(data, itype, value, worldid) end

---修改玩家天空盒的滤镜颜色
---等价于 itype 为 Color（8）的 SetSkyBoxFilter
---@param playerid integer 玩家ID
---@param value any 颜色值：16 进制颜色或 {r,g,b} 表
---@param worldid integer 星球ID
---@return boolean result 是否设置成功
function Trigger.World:SetSkyBoxFilterColor(playerid, value, worldid) end

---以动画方式修改玩家天空盒的滤镜颜色
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param value any 颜色值：16 进制颜色或 {r,g,b} 表
---@param animId number | string 缓动枚举 Easing
---@param animTime number 动画时长
---@param worldid integer 星球ID
---@return boolean result 是否全部设置成功
function Trigger.World:SetSkyBoxFilterColorAnim(data, value, animId, animTime, worldid) end

---设置玩家天空盒的滤镜查找表（LUT）
---等价于 itype 为 Lut（9）的 SetSkyBoxFilter
---@param playerid integer 玩家ID
---@param value any LUT 资源路径或ID
---@param worldid integer 星球ID
---@return boolean result 是否设置成功
function Trigger.World:SetSkyBoxFilterLUT(playerid, value, worldid) end

---设置玩家天空盒的滤镜模板
---等价于 itype 为 Template（10）的 SetSkyBoxFilter
---@param playerid integer 玩家ID
---@param value any 模板参数
---@param worldid integer 星球ID
---@return boolean result 是否设置成功
function Trigger.World:SetSkyBoxFilterTemplate(playerid, value, worldid) end

---以动画方式替换玩家天空盒的贴图
---itype 超出 1~3、url 为空字符串或类型非法时返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param itype number 贴图类型枚举 SkyboxMap：1 天空、2 太阳、3 月亮
---@param url string 贴图资源路径或资源ID
---@param animId number 缓动枚举 Easing
---@param animTime number 动画时长
---@param worldid integer 星球ID
---@return boolean result 是否全部设置成功
function Trigger.World:SetSkyBoxMapsAnim(data, itype, url, animId, animTime, worldid) end

---设置当前地图的默认出生点
---@param obiid integer 对象ID，当前引擎实现未使用
---@param pos Mini.Vec3 出生点坐标
---@return boolean? result 是否设置成功，pos 为空时返回 nil
function Trigger.World:SetSpawnPoint(obiid, pos) end

---往储物箱的指定格子写入道具
---目标方块必须是储物箱，否则返回 false
---大箱子前 30 格属于主箱体，其余属于副箱
---@param pos Mini.Vec3 储物箱方块坐标
---@param offset Mini.Vec3 格子序号，从 1 开始；大箱子超过 30 属于副箱
---@param itemid number | string 道具ID，支持资源ID字符串
---@param num number 写入数量
---@param worldId integer 星球ID
---@return boolean? result 是否写入成功，pos 为空时返回 nil
function Trigger.World:SetStorageItem(pos, offset, itemid, num, worldId) end

---在指定位置生成一个抛射物并飞向目标点
---pos 或 dst 为空时不执行
---@param pos Mini.Vec3 生成位置坐标
---@param itemid number | string 道具ID，必须是可脚本使用的抛射物道具
---@param dst Mini.Vec3 目标位置坐标，用于计算飞行方向
---@param worldId integer 星球ID
---@return number|nil objid 抛射物对象ID，失败返回 nil
function Trigger.World:SpawnProjectileOnPos(pos, itemid, dst, worldId) end

---以指定对象为射手生成抛射物
---起点取对象位置加眼睛高度，并按包围盒向前修正
---dir 为空或对象不存在时不生成
---@param objid integer 射手对象ID
---@param dir? Mini.Vec3 | number 发射方向：FaceDir 枚举或方向向量
---@param itemid number | string 道具ID，必须是可脚本使用的抛射物道具
---@return number|boolean|nil objid 抛射物对象ID，失败返回 false 或 nil
function Trigger.World:SpawnShooterProjectile(objid, dir, itemid) end

---在指定位置以指定对象为射手生成抛射物
---星球ID取自射手对象所在地
---@param pos Mini.Vec3 生成位置坐标
---@param objid integer 射手对象ID
---@param itemid number | string 道具ID，必须是可脚本使用的抛射物道具
---@param dst Mini.Vec3 目标位置坐标
---@return number|nil objid 抛射物对象ID，失败返回 nil
function Trigger.World:SpawnShooterProjectileByPos(pos, objid, itemid, dst) end

---停止指定位置上的粒子特效
---按粒子定义对应的特效路径停止
---@param pos Mini.Vec3 位置坐标
---@param particleIds integer | integer[] 粒子ID或粒子ID数组
---@return boolean result 是否处理成功
function Trigger.World:StopParticleEffectOnPos(pos, particleIds) end

---停止指定位置的粒子特效，支持直接传资源路径
---字符串按特效路径直接停止，数字先查粒子定义
---@param pos Mini.Vec3 位置坐标
---@param particleIds integer | integer[] 粒子ID、资源路径，或其数组
---@param worldId number 星球ID
---@return boolean result 是否处理成功
function Trigger.World:StopParticleOnPos(pos, particleIds, worldId) end

---把三个坐标分量组装成坐标表
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return table pos 坐标表 {x,y,z}
function Trigger.World:XyzToPos(x, y, z) end
