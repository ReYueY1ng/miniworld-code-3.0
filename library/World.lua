---@meta

---@alias PositionTable {x: number, y:number, z:number}
---@alias WorldIdEnum
---| 0 # 迷拉星
---| 1 # 烈焰星
---| 2 # 萌眼星

---标记的超参数
---@class MarkerParams
---@field posX number x坐标
---@field posZ number z坐标
---@field name string? 名字
---@field iconName string 图片id
---@field zoomMin number? 最小scale倍率
---@field zoomMax number? 最大scale倍率
---@field isTrace boolean? 是否追踪
---@field isRadarTrace boolean? 雷达上是否追踪
---@field appearInBlockFog boolean?
---@field isCanUI boolean? 是否能点击
---@field desc string? 描述
---@field level number? UI层级

---@class MarkerParamsOptional: MarkerParams
---@field posX number? x坐标
---@field posZ number? z坐标
---@field iconName string? 图片路径

---纹理的超参数
---@class TextureParams
---@field posX number x坐标
---@field posZ number z坐标
---@field filePath string 图片id
---@field width number 宽度
---@field height number 高度
---@field pivotX number? x轴锚点
---@field pivotZ number? z轴锚点
---@field alpha number? 透明度(0-1)
---@field scale number? 缩放
---@field rotation number? 旋转
---@field colorR number? 颜色R
---@field colorG number? 颜色G
---@field colorB number? 颜色B
---@field level number? 层级 官方地图纹理层级为10

---@class TextureParamsOptional: TextureParams
---@field posX number? x坐标
---@field posZ number? z坐标
---@field filePath string? 图片id
---@field width number? 宽度
---@field height number? 高度

---世界模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/world.html)
---@class World
World = {}

---停止指定位置的特效
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param particleId integer | string 特效id
---@return boolean result
function World:StopParticleOnPos(x, y, z, particleId) end

---设置指定位置的特效偏移 旋转 缩放
---@param pos PositionTable 位置（米）
---@param particleIdArg integer | string | (integer | string)[] 特效id或列表
---@param offset? PositionTable 偏移（米）
---@param rot? PositionTable 旋转
---@param scale? PositionTable 缩放大小
---@return boolean result
function World:SetParticleTransform(pos, particleIdArg, offset, rot, scale) end

---在指定位置播放特效
---@param pos PositionTable
---@param particleIdArg integer | string | (integer | string)[] 特效id或列表
---@param ptimeArg number 播放时长（单位：秒，非循环特效如果时长大于一次播放时长，将会重复播放）
---@param offset? PositionTable 偏移（米）
---@param rot? PositionTable 旋转
---@param scale? PositionTable 缩放大小
---@return boolean result
function World:PlayParticle(pos, particleIdArg, ptimeArg, offset, rot, scale) end

---获取光照强度
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@return integer lv 光照强度(0~15)
function World:GetLightByPos(x, y, z) end

---生成生物(包括怪物、NPC、动物等)
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param actorid integer | string 生物类型
---@param num integer 生成数量
---@param trigger boolean 是否触发事件
---@return integer[] objs 生物ID组
function World:SpawnCreature(x, y, z, actorid, num, trigger) end

---移除生物
---@param objid integer 对象objID
---@return boolean result
function World:DespawnActor(objid) end

---获取全部玩家数量
---@param alive? AliveState 玩家状态(默认全体玩家)
---@return integer num 获取数量
function World:GetPlayerTotal(alive) end

---获取全部玩家
---@param alive? AliveState 玩家状态(默认全体玩家)
---@return integer[] list 对象objid组
function World:GetAllPlayers(alive) end

---获取默认出生点
---@return number x x坐标
---@return number y y坐标
---@return number z z坐标
function World:GetSpawnPoint() end

---获取附近合适的生物出生点位置(方块坐标单位)
---@param centerX number 中心x坐标
---@param centerY number 中心y坐标
---@param centerZ number 中心z坐标
---@param radius number 半径
---@param includeCenterPos? boolean 是否包含中心位置(默认true)
---@return PositionTable[] posList 位置列表
function World:FindCanSpawnMobPosList(centerX, centerY, centerZ, radius, includeCenterPos) end

---获取距离某点最近的玩家(方块坐标单位)
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param radius? number 半径
---@param worldId? WorldIdEnum 世界id(默认迷拉星)
---@return integer objid 玩家uin
function World:FindNearestPlayerByPos(x, y, z, radius, worldId) end

---在指定位置上播放指定音效
---@param pos PositionTable 位置
---@param soundId integer|string 音效ID
---@param volume number 音量调节
---@param pitch number 音调调节
---@param isLoop boolean 是否循环播放
---@return boolean result
function World:PlaySoundEffectOnPos(pos, soundId, volume, pitch, isLoop) end

---停止指定位置上的指定音效
---@param pos PositionTable 位置
---@param soundId integer|string 音效ID
---@return boolean result
function World:StopSoundEffectOnPos(pos, soundId) end

---暂停/恢复指定位置上的指定音效
---@param pos PositionTable 位置
---@param soundId integer|string 音效ID
---@param pause boolean true暂停/false恢复
---@return boolean result
function World:PauseSoundEffectOnPos(pos, soundId, pause) end

---是否是白天
---@return boolean isDayTime 是否白天
function World:IsDaytime() end

---设置游戏当前时间(小时)
---@param time number 时间(小时)
---@return boolean result
function World:SetHours(time) end

---获取游戏当前时间(小时)
---@return number hours 时间(小时)
function World:GetHours() end

---获取游戏当前天数
---@return integer day 天数
function World:GetDay() end

---设置重力
---@param gravity number 重力值
---@return boolean result
function World:SetGravity(gravity) end

---增加重力
---@param gravity number 重力值
---@return boolean result
function World:AddGravity(gravity) end

---获取重力
---@return number gravity 重力值
function World:GetGravity() end

---获取XZ位置上是否可创建生物 并返回对应的Y轴位置
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@return number canSpawnY Y轴坐标(-1表示不可创建生物)
function World:CanMobSpawnOnPosXZ(x, y, z) end

---获取当前星球id
---@return integer worldid 星球id
function World:GetCurMapId() end

---生成投掷物 向某坐标发射
---@param objid integer 角色objid
---@param itemid integer | string 道具类型
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param dstx number 目标x坐标
---@param dsty number 目标y坐标
---@param dstz number 目标z坐标
---@param speed number 速度
---@return integer objid 投掷物objid
function World:SpawnProjectile(objid, itemid, x, y, z, dstx, dsty, dstz, speed) end

---生成投掷物 向某方向发射
---@param objid integer 角色objid
---@param itemid integer | string 道具类型
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param dstx number 目标x方向
---@param dsty number 目标y方向
---@param dstz number 目标z方向
---@param speed number 速度
---@return integer objid 投掷物objid
function World:SpawnProjectileByDir(objid, itemid, x, y, z, dstx, dsty, dstz, speed) end

---获取某个位置的地形类型
---@param x number x坐标
---@param y number y坐标
---@return BiomeType biomeType 地形类型
function World:GetBiomeType(x, y) end

---获取某个位置的地形组类型
---@param x number x坐标
---@param y number y坐标
---@return WeatherGroup biomeGroup 地形组类型
function World:GetBiomeGroup(x, y) end

---查找地形位置
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param biometype BiomeType 地形类型
---@return number? x x坐标
---@return number? y y坐标
---@return number? z z坐标
function World:FindEcosystem(x, y, z, biometype, radius) end

---地图增加标记
---@param uin integer 玩家ID
---@param id integer | string 标记id
---@param params MarkerParams 标记的超参数
---@return boolean result
function World:PixelMapAddMarker(uin, id, params) end

---地图刷新标记
---@param uin integer 玩家ID
---@param id integer | string 标记id
---@param params MarkerParamsOptional 标记的超参数(提供改变的参数即可)
---@return boolean result
function World:PixelMapRefreshMarker(uin, id, params) end

---地图删除标记
---@param uin integer 玩家ID
---@param id integer | string 标记id
---@return boolean result
function World:PixelMapDelMarker(uin, id) end

---地图增加纹理
---@param uin integer 玩家ID
---@param id integer | string 纹理id
---@param params TextureParams 纹理的超参数
---@return boolean result
function World:PixelMapAddTexture(uin, id, params) end

---地图刷新纹理
---@param uin integer 玩家ID
---@param id integer | string 纹理id
---@param params TextureParamsOptional 纹理的超参数(提供改变的参数即可)
---@return boolean result
function World:PixelMapRefreshTexture(uin, id, params) end

---地图删除纹理
---@param uin integer 玩家ID
---@param id integer | string 纹理id
---@return boolean result
function World:PixelMapDelTexture(uin, id) end

---设置某玩家天空盒全部时间点的颜色参数(带动效)
---@param uin integer 玩家ID
---@param itype SkyboxColor 颜色属性枚举
---@param color string 16进制颜色值(0xffffff)
---@param animId Easing 动画枚举
---@param animTime number 动画时间
---@return boolean result
function World:SetSkyBoxColorAnim(uin, itype, color, animId, animTime) end

---设置天空盒时间流逝速度
---@param speed number 时间流逝速度
---@return boolean result
function World:SetTimeVanishingSpeed(speed) end

---设置天空盒模板
---@param skyboxid integer | string 模板值（官方模板填数值，自定义模板填ID）
---@return boolean result
function World:SetSkyBoxTemplate(skyboxid) end

---设置天空盒贴图
---@param itype SkyboxMap 贴图类型
---@param url string 图片链接
---@return boolean result
function World:SetSkyBoxMaps(itype, url) end

---设置天空盒颜色参数
---@param time SkyboxTime 游戏时间
---@param itype SkyboxColor 颜色属性枚举
---@param color string 16进制颜色值(0xffffff)
---@return boolean result
function World:SetSkyBoxColor(time, itype, color) end

---设置天空盒属性参数
---@param time SkyboxTime 游戏时间
---@param itype SkyboxAttr 参数类型
---@param value number 参数值(0~100)
---@return boolean result
function World:SetSkyBoxAttr(time, itype, value) end

---设置天空盒滤镜参数
---@param uin integer 玩家ID
---@param itype SkyboxFilter 参数类型
---@param value number | string 参数值(0~100) 或 16进制颜色值字符串(0xffffff)
---@return boolean result
function World:SetSkyBoxFilter(uin, itype, value) end

---天空盒属性开关
---@param time SkyboxTime 游戏时间
---@param itype SkyboxSwitch 参数类型
---@param value boolean 参数值
---@return boolean result
function World:SetSkyBoxSwitch(time, itype, value) end

---设置天空盒贴图(带动效)
---@param uin integer 玩家ID
---@param itype SkyboxMap 参数类型
---@param url string 图片链接
---@param animId Easing 动画枚举
---@param animTime number 动画时间
---@return boolean result
function World:SetSkyBoxMapsAnim(uin, itype, url, animId, animTime) end

---设置天空盒滤镜参数
---@param uin integer 玩家ID
---@param itype SkyboxFilter 参数类型
---@param value number | string 参数值(0~100) 或 16进制颜色值字符串(0xffffff)
---@param animId Easing 动画枚举
---@param animTime number 动画时间
---@return boolean result
function World:SetSkyBoxFilterAnim(uin, itype, value, animId, animTime) end

---获取主机时间
---@see os.date
---@param date? EventDate 枚举值
---@return integer time 获取到的值
function World:GetLocalDate(date) end

---获取完整设备时间
---@see os.date
---@return string date 时间描述
function World:GetLocalDateString()
    return tostring(os.date("%Y-%m-%d %H:%M:%S"))
end

---获取服务器时间
---@see getServerTime
---@see os.date
---@param date? EventDate 枚举值
---@return integer time 获取到的值
function World:GetServerDate(date) end

---转换时间戳为时间单位
---@see os.date
---@param time number 时间戳
---@param date? EventDate 枚举值
---@return integer date 时间值
function World:GetDateFromTime(time, date) end

---获取对象到某个方向上的射线检测目标
---@param posbegin PositionTable 起点位置
---@param dir PositionTable 方向向量
---@param maxlen number 最大检测方块距离
---@param picktype RayDetectType 检测类型
---@return number objid 对象ID
---@return PositionTable pos 对象位置
function World:GetDirRayDetection(posbegin, dir, maxlen, picktype) end

---计算指定方向射线长度(遇到方块结束)
---@param srcx number 起点x坐标
---@param srcy number 起点y坐标
---@param srcz number 起点z坐标
---@param dstx number 终点x坐标
---@param dsty number 终点y坐标
---@param dstz number 终点z坐标
---@param distance number 最大检测距离
---@return number distance 距离
function World:GetRayLength(srcx, srcy, srcz, dstx, dsty, dstz, distance) end

---射线打到的方块类型(遇到方块结束)
---@param srcx number 起点x坐标
---@param srcy number 起点y坐标
---@param srcz number 起点z坐标
---@param dstx number 终点x坐标
---@param dsty number 终点y坐标
---@param dstz number 终点z坐标
---@param distance number 最大检测距离
---@return number blockid 方块ID
function World:GetRayBlock(srcx, srcy, srcz, dstx, dsty, dstz, distance) end

---通过局部坐标方向计算绝对正方向(忽略视角仰角)
---@param objid integer 对象ID
---@param x number 局部坐标x方向
---@param y number 局部坐标y方向
---@param z number 局部坐标z方向
---@return PositionTable direction 绝对方向向量
function World:CalcDirectionByYawDirection(objid, x, y, z) end

---通过局部球坐标方向计算绝对正方向(忽略视角仰角)
---@param objid integer 对象ID
---@param yaw number 水平偏移夹角角度制
---@param pitch number 垂直偏移夹角
---@return PositionTable direction 绝对方向向量
function World:CalcDirectionByYawAngle(objid, yaw, pitch) end

---绝对坐标方向
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@return PositionTable direction 绝对方向向量
function World:CalcDirectionByCoord(x, y, z)
    return {x=x,y=y,z=z}
end

---角度坐标方向
---@param yaw number 水平偏移夹角
---@param pitch number 垂直偏移夹角
---@return PositionTable direction 绝对方向向量
function World:CalcDirectionByAngle(yaw, pitch) end

---随机特效类型，随机返回一种特效ID
---@return integer particleId 特效ID
function World:RandomParticleEffectID() end

---随机音效ID，随机返回一种音效ID
---@return integer soundId 音效ID
function World:RandomSoundID() end

---计算两个三维坐标之间的距离
---@param posSrc PositionTable 源坐标
---@param posDst PositionTable 目标坐标
---@return number distance 两点之间的距离
function World:CalcDistance(posSrc, posDst) end

---设置天气组的天气状态
---@param groupid WeatherGroup 天气组ID
---@param weatherid GroupWeatherType 天气ID
---@return boolean result
function World:SetGroupWeather(groupid, weatherid) end

---随机天气ID
---@return integer weatherid 随机出来的天气ID
function World:RandomWeatherID() end

---获取天气组天气
---@param groupid WeatherGroup 天气组ID
---@return GroupWeatherType weatherid 天气ID
function World:GetGroupWeather(groupid) end

---设置出生点
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@return boolean result
function World:SetSpawnPoint(x, y, z) end

---位置到位置的单位方向
---@param pos1 PositionTable 位置1
---@param pos2 PositionTable 位置2
---@return PositionTable direction 单位方向
function World:CalcDirectionByPos2Pos(pos1, pos2) end

---设置世界创建生物规则(设置不保存，退出游戏后失效，只适用迷拉星)
---@param cfgs table<integer, {id: integer, weight: number}[]> 生物规则配置
---@return boolean result
function World:SetWorldCreateMobRule(cfgs) end

---设置生物生成密度(设置不保存，退出游戏后失效，只适用迷拉星)
---@param mobType MobType 生物类型
---@param density number 密度（0-2000）
function World:SetMobSpawnDensity(mobType, density) end

---设置农作物生长时间要求修正，在原来的时间上乘以系数(设置不保存，退出游戏后失效，只适用迷拉星)
---@param rate number 时间修正(大于0)
---@return boolean result
function World:SetPlantGrowRate(rate) end

---设置游戏内的界面是否禁用
---@param iview InnerPopUpview 弹窗类型枚举
---@param bopen boolean 启用或者禁用
---@return boolean result
function World:SetInnerViewEnable(iview, bopen) end

---设置是否可中途加入
---@param enable boolean 是否开启中途加入属性
---@return boolean result
function World:SetMidJoin(enable) end

---获取游戏模式
---@return WorldType curmode 游戏模式
function World:GetGameMode() end

---设置光照强度
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param lv integer 光照强度(0~15)
---@return boolean result
function World:SetLightByPos(x, y, z, lv) end