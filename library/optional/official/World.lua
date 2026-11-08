---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· World<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---添加自定义marker
---@param uin any 玩家Uin
---@param iconName any 图标名称
---@param name any 名称
---@param x any X坐标
---@param z any Z坐标
---@param level any 等级
---@param trace any 参数 trace
---@param des any 参数 des
---@param desColor any 参数 desColor
---@param iconMask any 参数 iconMask
---@param desc any 描述
---@param type any 类型
---@return boolean result 是否成功
function World:AddCustomMarker(uin, iconName, name, x, z, level, trace, des, desColor, iconMask, desc, type) end

---broadcast模组方块数据ex
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@param msgSubId any msgsubID
---@param mapid any 地图ID
---@param content any 内容
function World:BroadcastModBlockDataEx(x, y, z, msgSubId, mapid, content) end

---检查方块判断是否replaceable
---@param mapid any 地图ID
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@return boolean result 检查结果
function World:CheckBlockIsReplaceable(mapid, x, y, z) end

---检查summer动作activate
---@param callback any 回调函数
---@param activatename any activate名称
---@return boolean result 检查结果
function World:CheckSummerActActivate(callback, activatename) end

---按res名称清空自定义marker
---@param uin any 玩家Uin
---@param iconName any 图标名称
---@return boolean result 是否成功
function World:ClearCustomMarkerByResName(uin, iconName) end

---关闭storageboxframe
---@param uin any 玩家Uin
---@return boolean result 是否成功
function World:CloseStorageBoxFrame(uin) end

---创建explosion
---@param objid any 对象ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param explosionRadius number 参数 explosionRadius
---@param flaming? boolean 参数 flaming
---@param smoking? boolean 参数 smoking
---@param dirmask? number 参数 dirmask
---@param damageType? number 参数 damageType
---@return boolean result 是否成功
function World:CreateExplosion(objid, x, y, z, explosionRadius, flaming, smoking, dirmask, damageType) end

---创建explosion新建
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@param radius any 半径
---@param upHalf any 参数 upHalf
---@param atkValue any 参数 atkValue
---@param isDestroyBlock any 是否destroyblock
---@return boolean result 是否成功
function World:CreateExplosionNew(x, y, z, radius, upHalf, atkValue, isDestroyBlock) end

---del自定义marker
---@param uin any 玩家Uin
---@param iconName any 图标名称
---@param name any 名称
---@param x any X坐标
---@param z any Z坐标
---@param level any 等级
---@return boolean result 是否成功
function World:DelCustomMarker(uin, iconName, name, x, z, level) end

---edit自定义marker
---@param uin any 玩家Uin
---@param iconName any 图标名称
---@param name any 名称
---@param x any X坐标
---@param z any Z坐标
---@param level any 等级
---@param trace any 参数 trace
---@param des any 参数 des
---@param desColor any 参数 desColor
---@param iconMask any 参数 iconMask
---@param desc any 描述
---@param type any 类型
---@return boolean result 是否成功
function World:EditCustomMarker(uin, iconName, name, x, z, level, trace, des, desColor, iconMask, desc, type) end

---按defID查找near角色列表
---@param centerX number 中心X坐标
---@param centerY number 中心Y坐标
---@param centerZ number 中心Z坐标
---@param radius number 半径
---@param defId? number | string defID
---@param worldId any 星球ID
---@return boolean value 是否成功
function World:FindNearActorListByDefId(centerX, centerY, centerZ, radius, defId, worldId) end

---按队伍查找near角色列表
---@param centerX number 中心X坐标
---@param centerY number 中心Y坐标
---@param centerZ number 中心Z坐标
---@param radius number 半径
---@param team number 队伍
---@param worldId any 星球ID
---@return boolean? value 结果，失败时为 nil
function World:FindNearActorListByTeam(centerX, centerY, centerZ, radius, team, worldId) end

---查找near判断能否生成生物位置列表
---@param centerX number 中心X坐标
---@param centerY number 中心Y坐标
---@param centerZ number 中心Z坐标
---@param radius number 半径
---@param includeCenterPos? boolean 参数 includeCenterPos
---@param worldId any 星球ID
---@return boolean value 是否成功
function World:FindNearCanSpawnMobPosList(centerX, centerY, centerZ, radius, includeCenterPos, worldId) end

---按defID查找最近角色
---@param posX number 参数 posX
---@param posY number 参数 posY
---@param posZ number 参数 posZ
---@param radius number 半径
---@param defId? number | string defID
---@param worldId any 星球ID
---@return boolean? value 结果，失败时为 nil
function World:FindNearestActorByDefId(posX, posY, posZ, radius, defId, worldId) end

---获取群系desc
---@param biomeId any 群系ID
function World:GetBiomeDesc(biomeId) end

---获取当前地图ID
---@return number value 结果数值
function World:GetCurrMapId() end

---获取inner界面启用
---@param iview any 参数 iview
---@return boolean value 是否成功
function World:GetInnerViewEnable(iview) end

---获取loginsvr时间
function World:GetLoginSvrTime() end

---获取主玩家位置
function World:GetMainPlayerPos() end

---获取mid加入
---@return boolean value 是否成功
function World:GetMidJoin() end

---获取mini地图flag位置
---@param key any 键名
function World:GetMiniMapFlagPos(key) end

---获取planetcomponent
---@param worldId any 星球ID
---@param cmpName string 组件名称
function World:GetPlanetComponent(worldId, cmpName) end

---获取服务器时间ms
function World:GetServerTimeMs() end

---获取skyboxtime
---@param time number 时间（秒）
---@return number value 结果数值
function World:GetSkyBoxtime(time) end

---获取snapshot
---@param dt? any 参数 dt
function World:GetSnapshot(dt) end

---获取tree模型
---@param stBlockPos? Mini.Vec3 参数 stBlockPos
---@param bCreateActorTree? boolean 参数 bCreateActorTree
function World:GetTreeModel(stBlockPos, bCreateActorTree) end

---获取tree模型模组
---@param stBlockPosList any 参数 stBlockPosList
---@param bCreateActorTree any 参数 bCreateActorTree
function World:GetTreeModelMod(stBlockPosList, bCreateActorTree) end

---获取worldid
function World:GetWorldid() end

---通知游戏info2全部
---@param info string 信息
---@param objids? table 参数 objids
---@return boolean result 是否成功
function World:NotifyGameInfo2All(info, objids) end

---接收模组方块数据ex
---@param content any 内容
function World:ReceiveModBlockDataEx(content) end

---注册match传送
---@param content? any 内容
---@return boolean result 是否成功
function World:RegisterMatchTeleport(content) end

---发送转换为客户端打开transferstation界面
---@param playerid any 玩家ID
---@param mapid any 地图ID
---@param srcGateId any srcgateID
function World:SendToClientOpenTransferStationUI(playerid, mapid, srcGateId) end

---设置判断是否创建snow
---@param value boolean 值
---@param worldId any 星球ID
function World:SetIsCreateSnow(value, worldId) end

---设置地图iconsetting配置
---@param cfg table 配置
---@return boolean result 是否成功
function World:SetMapIconSettingCfg(cfg) end

---设置picandshare
---@param uin any 玩家Uin
---@param fileName any 文件名
---@param needShare any 参数 needShare
function World:SetPicAndShare(uin, fileName, needShare) end

---为模组设置skyboxfilter
---@param playerid any 玩家ID
---@param itype? any 类型
---@param value number | table 值
---@return boolean result 是否成功
function World:SetSkyBoxFilterForMod(playerid, itype, value) end

---设置skyboxfilter开关
---@param playerid? any 玩家ID
---@param itype number 类型
---@param value boolean 值
---@param worldId any 星球ID
---@return boolean result 是否成功
function World:SetSkyBoxFilterSwitch(playerid, itype, value, worldId) end

---设置weather类型
---@param wtype any 参数 wtype
---@return boolean result 是否成功
function World:SetWeatherType(wtype) end

---显示transfer界面
---@param playerid any 玩家ID
---@param mapid any 地图ID
---@param srcGateId any srcgateID
---@return boolean result 是否成功
function World:ShowTransferView(playerid, mapid, srcGateId) end

---snapshortand打开shareframe
---@param uin any 玩家Uin
---@param needShare any 参数 needShare
function World:SnapShortAndOpenShareFrame(uin, needShare) end

---snapshot
---@param w any 参数 w
---@param h any 高度
---@return boolean result 是否成功
function World:Snapshot(w, h) end

---生成装备or枪械
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@param itemid? string 道具ID
---@param worldId any 星球ID
---@return boolean result 是否成功
function World:SpawnEquipOrGun(x, y, z, itemid, worldId) end

---生成道具
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param itemid number | string 道具ID
---@param num number 数量
---@param worldId any 星球ID
---@return boolean result 是否成功
function World:SpawnItem(x, y, z, itemid, num, worldId) end

---使用transfer转换为
---@param playerUin any 玩家Uin
---@param toUin any 参数 toUin
---@return number result 结果数值
function World:UseTransferTo(playerUin, toUin) end

---获取chunkrandom生成位置
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
function World:getChunkRandomSpawnPos(x, y, z) end
