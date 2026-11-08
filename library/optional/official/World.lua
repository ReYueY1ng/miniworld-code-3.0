---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· World<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---在小地图上添加一个自定义标记
---uin 未参与实现，标记对所有玩家可见
---找不到小地图控件时也返回 true
---@param uin integer 玩家Uin
---@param iconName string 图标资源名
---@param name string 标记名称
---@param x number X坐标
---@param z number Z坐标
---@param level number 标记等级
---@param trace any 是否显示追踪线
---@param des any 标记短描述
---@param desColor any 描述颜色
---@param iconMask any 图标遮罩
---@param desc string 标记详细描述
---@param type number 标记类型
---@return boolean result 恒为 true
function World:AddCustomMarker(uin, iconName, name, x, z, level, trace, des, desColor, iconMask, desc, type) end

---向方块周围玩家广播模组方块数据
---只发给方块周围 9600 单位内的玩家
---会自动向 content 写入 blockposx/y/z、msgSubId、mapid
---@param x number 方块X坐标
---@param y number 方块Y坐标
---@param z number 方块Z坐标
---@param msgSubId any 消息子ID
---@param mapid any 地图ID
---@param content string 自定义数据表
function World:BroadcastModBlockDataEx(x, y, z, msgSubId, mapid, content) end

---检查指定位置的模组方块可否被替换
---位置没有模组材质时返回 true
---@param mapid any 地图ID
---@param x number 方块X坐标
---@param y number 方块Y坐标
---@param z number 方块Z坐标
---@return boolean result 是否可替换
function World:CheckBlockIsReplaceable(mapid, x, y, z) end

---检查夏日活动是否已激活，当前恒为 false
---引擎侧实现直接返回 false，不执行回调
---@param callback function 回调函数
---@param activatename string 活动名称
---@return boolean result 恒为 false
function World:CheckSummerActActivate(callback, activatename) end

---按图标资源名清空小地图自定义标记
---uin 未参与实现，清除的是本地全部同类标记
---@param uin integer 玩家Uin
---@param iconName string 图标资源名
---@return boolean result 恒为 true
function World:ClearCustomMarkerByResName(uin, iconName) end

---关闭当前打开的储物箱界面
---uin 未参与实现
---界面未打开时返回 false
---@param uin integer 玩家Uin
---@return boolean result 是否关闭成功
function World:CloseStorageBoxFrame(uin) end

---在指定坐标创建一次爆炸
---对象ID会先按世界对象ID查找对应角色作为爆炸来源
---@param objid integer 造成爆炸的对象ID，默认 0
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param explosionRadius number 爆炸半径
---@param flaming? boolean 是否带火焰，默认 false
---@param smoking? boolean 是否带烟雾，默认 false
---@param dirmask? number 方向遮罩，默认 0
---@param damageType? number 伤害类型，默认 0
---@return boolean result 是否创建成功
function World:CreateExplosion(objid, x, y, z, explosionRadius, flaming, smoking, dirmask, damageType) end

---创建不依赖对象的爆炸并结算范围内伤害
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param radius number 爆炸半径
---@param upHalf any 爆炸向上延伸比例
---@param atkValue any 伤害值
---@param isDestroyBlock boolean 是否破坏方块
---@return boolean result 是否创建成功
function World:CreateExplosionNew(x, y, z, radius, upHalf, atkValue, isDestroyBlock) end

---按名称和坐标删除小地图自定义标记
---uin 未参与实现
---@param uin integer 玩家Uin
---@param iconName string 图标资源名
---@param name string 标记名称
---@param x number X坐标
---@param z number Z坐标
---@param level number 标记等级
---@return boolean result 恒为 true
function World:DelCustomMarker(uin, iconName, name, x, z, level) end

---修改小地图上已有的自定义标记
---同时更新小地图与像素地图两个控件
---uin 未参与实现
---@param uin integer 玩家Uin
---@param iconName string 图标资源名
---@param name string 标记名称
---@param x number X坐标
---@param z number Z坐标
---@param level number 标记等级
---@param trace any 是否显示追踪线
---@param des any 标记短描述
---@param desColor any 描述颜色
---@param iconMask any 图标遮罩
---@param desc string 标记详细描述
---@param type number 标记类型
---@return boolean result 恒为 true
function World:EditCustomMarker(uin, iconName, name, x, z, level, trace, des, desColor, iconMask, desc, type) end

---查找范围内指定定义ID的角色列表
---资源ID字符串会先转换为配置ID
---@param centerX number 中心X坐标
---@param centerY number 中心Y坐标
---@param centerZ number 中心Z坐标
---@param radius number 搜索半径
---@param defId? number | string 定义ID，可传资源ID字符串
---@param worldId integer 星球ID
---@return boolean ret 是否查找成功
---@return table? list 角色对象ID数组
function World:FindNearActorListByDefId(centerX, centerY, centerZ, radius, defId, worldId) end

---查找范围内指定队伍的角色列表
---未找到角色或星球不存在时返回 nil
---@param centerX number 中心X坐标
---@param centerY number 中心Y坐标
---@param centerZ number 中心Z坐标
---@param radius number 搜索半径
---@param team number 队伍编号
---@param worldId integer 星球ID
---@return table? list 角色对象ID数组
function World:FindNearActorListByTeam(centerX, centerY, centerZ, radius, team, worldId) end

---查找范围内可用于生成生物的位置
---坐标数组元素为向量对象
---@param centerX number 中心X坐标
---@param centerY number 中心Y坐标
---@param centerZ number 中心Z坐标
---@param radius number 搜索半径
---@param includeCenterPos? boolean 是否包含中心点，默认 true
---@param worldId integer 星球ID
---@return boolean ret 是否查找成功
---@return table? list 可用坐标数组
function World:FindNearCanSpawnMobPosList(centerX, centerY, centerZ, radius, includeCenterPos, worldId) end

---查找范围内距离最近的角色
---找不到角色时返回 nil
---@param posX number 参考点X坐标
---@param posY number 参考点Y坐标
---@param posZ number 参考点Z坐标
---@param radius number 搜索半径
---@param defId? number | string 定义ID，可传资源ID字符串
---@param worldId integer 星球ID
---@return number? objid 角色对象ID
function World:FindNearestActorByDefId(posX, posY, posZ, radius, defId, worldId) end

---获取指定群系的定义数据
---@param biomeId any 群系ID
---@return userdata? def 群系定义数据
function World:GetBiomeDesc(biomeId) end

---获取当前所在地图ID
---@return number mapid 地图ID，取不到时为 -1
function World:GetCurrMapId() end

---查询指定的内视图是否启用
---创造模式地图恒为 false
---返回值是内部标记取反后的结果
---@param iview any 内视图类型枚举值
---@return boolean result 是否启用
function World:GetInnerViewEnable(iview) end

---获取服务器登录时间戳
---登录时间未记录时回落到当前服务器时间
---@return number time 登录时服务器时间戳（秒）
function World:GetLoginSvrTime() end

---获取主玩家所在的方块坐标
---世界坐标按 1/100 取整换算为方块坐标
---主玩家不存在时返回 nil
---@return number? x 方块X坐标
---@return number? y 方块Y坐标
---@return number? z 方块Z坐标
function World:GetMainPlayerPos() end

---获取房间是否允许中途加入
---读取游戏规则中的中途加入开关
---@return boolean result 是否允许中途加入
function World:GetMidJoin() end

---获取小地图上指定图标的坐标列表
---官方标记下标依次为 1 出生点、2 死亡点、3 星站、4 图腾、5 传送门、6 Boss、7 死亡罐、8 最新死亡罐
---@param key any 数字时取官方标记下标，字符串时取自定义标记名
---@return table? list 坐标数组，元素为 {x, z}
function World:GetMiniMapFlagPos(key) end

---获取星球对象上的指定组件
---组件类名不存在时返回 nil
---@param worldId integer 星球ID
---@param cmpName string 组件名称
---@return userdata? cmp 组件对象
function World:GetPlanetComponent(worldId, cmpName) end

---获取服务器毫秒时间戳
---@return number time 服务器时间戳（毫秒）
function World:GetServerTimeMs() end

---把小时数换算为天空盒时间档位
---档位取 4/6/8/12/16/18/20/24 中不超过输入值的最后一档，24 会转成 0
---@param time number 小时数，负数取当前小时，99 原样返回
---@return number? hour 时间档位
function World:GetSkyBoxtime(time) end

---保存当前画面为 UGC 资源图并返回文件名
---截图未完成、地图ID无效或参数为空时返回 nil
---成功后会把图片登记到当前地图资源中
---@param dt? any 时间标记，用于拼截图文件名
---@return string? name 资源文件名
function World:GetSnapshot(dt) end

---获取指定方块处的树木模型信息
---blocks 为方块ID到数量的映射
---@param stBlockPos? Mini.Vec3 方块坐标，需含 x/y/z
---@param bCreateActorTree? boolean 是否同时创建树木角色，默认 true
---@return table? data 含 actorid 与 blocks 字段的表
function World:GetTreeModel(stBlockPos, bCreateActorTree) end

---获取模组树木合并后的模型信息
---多个方块坐标会合并统计方块ID与数量
---@param stBlockPosList table 方块坐标数组
---@param bCreateActorTree boolean 是否同时创建树木角色
---@return table? data 含 actorid 与 blocks 字段的表
function World:GetTreeModelMod(stBlockPosList, bCreateActorTree) end

---获取当前星球ID
---@return number worldid 星球ID，取不到时为 0
function World:GetWorldid() end

---向玩家批量推送游戏提示信息
---玩家列表为空或文本不是字符串时返回 false
---@param info string 提示文本
---@param objids? number | table 玩家Uin数组，默认全部玩家
---@return boolean result 是否推送成功
function World:NotifyGameInfo2All(info, objids) end

---处理模组方块自定义数据并下发到客户端
---msgSubId 为 1 设置叠加色、2 设置 UV 动画开关、3 播放动画、4 无操作
---@param content string 数据表，需含 mapid、blockposx/y/z、msgSubId
function World:ReceiveModBlockDataEx(content) end

---注册一次匹配传送请求
---会把 content.type 强制置为 0
---@param content? string 需含 player_uin 与 detail 的数据表
---@return boolean result 是否注册成功
function World:RegisterMatchTeleport(content) end

---通知客户端打开传送站界面
---playerid 为空时不下发
---@param playerid integer 玩家ID
---@param mapid any 地图ID
---@param srcGateId any 源星站ID
function World:SendToClientOpenTransferStationUI(playerid, mapid, srcGateId) end

---设置星球是否生成积雪
---value 不是布尔值时静默忽略
---@param value boolean 是否生成积雪
---@param worldId integer 星球ID
function World:SetIsCreateSnow(value, worldId) end

---设置小地图图标显示配置
---cfg 不是表时返回 false
---@param cfg table 图标配置表
---@return boolean result 是否设置成功
function World:SetMapIconSettingCfg(cfg) end

---异步写入截图并打开分享界面
---在线程池中执行，图片按 1920x1080 从包内拷出
---移动端会额外扫描图片入库
---@param uin integer 玩家Uin
---@param fileName string 图片文件名
---@param needShare boolean 是否显示分享按钮
function World:SetPicAndShare(uin, fileName, needShare) end

---为模组设置天空盒滤镜颜色或模板
---playerid 未参与实现，影响全局后处理
---模板模式下只有默认模板才会关闭后处理
---@param playerid integer 玩家ID
---@param itype? number 滤镜类型：SKYBOXFILTER.COLOR 颜色，TEMPLATE 模板
---@param value number | table 颜色表 {r,g,b} 或模板编号
---@return boolean result 是否设置成功
function World:SetSkyBoxFilterForMod(playerid, itype, value) end

---开关玩家的景深天空盒滤镜
---通过 UGC 环境接口按玩家推送
---@param playerid? integer 玩家ID
---@param itype number 滤镜类型，仅支持 SkyboxFilterSwitch.Dofenable
---@param value boolean 开关值，布尔或 0/1
---@param worldId integer 星球ID
---@return boolean result 是否下发成功
function World:SetSkyBoxFilterSwitch(playerid, itype, value, worldId) end

---设置当前星球天气类型
---天气管理器不存在时也会返回 true
---@param wtype number 天气类型枚举值
---@return boolean result 是否设置成功
function World:SetWeatherType(wtype) end

---打开玩家的星站传送界面
---目标不是主玩家时改发客户端消息打开
---没有可传送目标时会弹提示
---@param playerid integer 玩家ID
---@param mapid any 地图ID
---@param srcGateId any 源星站ID
---@return boolean result 是否处理成功
function World:ShowTransferView(playerid, mapid, srcGateId) end

---异步截图并打开分享界面
---在线程池中调用拍照分享按钮逻辑
---uin 未参与实现
---@param uin integer 玩家Uin
---@param needShare boolean 是否显示分享按钮
function World:SnapShortAndOpenShareFrame(uin, needShare) end

---请求以指定尺寸保存游戏截图
---星球ID无效时返回 false
---@param w any 图片宽度
---@param h any 图片高度
---@return boolean result 是否提交成功
function World:Snapshot(w, h) end

---在指定坐标生成一件装备或枪械
---生成的是可直接拾取的装备实体
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param itemid? string 道具ID，可传资源ID字符串
---@param worldId integer 星球ID
---@return number|boolean? result 生成的对象ID，失败时为 false 或 nil
function World:SpawnEquipOrGun(x, y, z, itemid, worldId) end

---在指定坐标生成掉落道具
---坐标会向下取整
---只有启用了脚本的道具才能生成
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param itemid number | string 道具ID，可传资源ID字符串
---@param num number 生成数量，默认 1
---@param worldId integer 星球ID
---@return number|boolean? result 生成的对象ID，失败时为 false 或 nil
function World:SpawnItem(x, y, z, itemid, num, worldId) end

---把一名玩家传送到另一名玩家身边
---@param playerUin integer 被传送玩家Uin
---@param toUin integer 目标玩家Uin
---@return number result 传送结果码，无世界时为 -1
function World:UseTransferTo(playerUin, toUin) end

---获取区块内的随机生成点坐标
---底层返回失败时整体返回 nil
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return number? x 随机点X坐标
---@return number? y 随机点Y坐标
---@return number? z 随机点Z坐标
function World:getChunkRandomSpawnPos(x, y, z) end
