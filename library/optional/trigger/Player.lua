---@meta

---触发器 Player 模块（Trigger.Player）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Player
Trigger.Player = {}

---切换玩家视角模式并可锁定视角
---viewmode 不是 number 或 islock 不是 boolean 时直接返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param viewmode number 视角枚举 ViewPortType（0 主视角、1 后视、2 前视、3 后视2、4 俯视、5 自定义）
---@param islock boolean 是否锁定视角
---@return boolean result 是否全部切换成功
function Trigger.Player:ChangeViewMode(data, viewmode, islock) end

---把快捷栏事件格子ID换算成从 0 起的格子序号
---1000~1007 之外的数字原样返回
---@param gridid number 事件格子ID，1000~1007 视为快捷栏第 1~8 格
---@return number result 换算后的格子序号，非数字入参返回 nil
function Trigger.Player:EventGridID2GridEnum(gridid) end

---获取玩家瞄准射线命中点的坐标
---取的是玩家拾取结果，玩家不存在或没有命中时返回 nil
---@param objid integer 玩家ID
---@return table pos 命中点坐标（米），无命中返回 nil
function Trigger.Player:GetAimPoint(objid) end

---获取背包栏格子ID，当前实现原样返回入参
---引擎未做换算，需要真实格子索引请用 ToBackPackGridID
---@param ix any 背包栏格子索引
---@return any gridid 原样返回的入参
function Trigger.Player:GetBackPackGridID(ix) end

---统计玩家快捷栏与背包栏中指定道具的总数量
---统计范围只有快捷栏与背包栏，不含装备栏与扩展背包
---被锁定的格子不计入
---@param objid integer 玩家ID
---@param itemid number | string 道具ID，支持资源ID字符串
---@return number count 该道具的总数量，没有时为 0
function Trigger.Player:GetBackpackItemNum(objid, itemid) end

---获取装备栏格子ID，当前实现原样返回入参
---引擎未做换算，需要真实格子索引请用 ToEquipGridID
---@param ix any 装备栏格子索引
---@return any gridid 原样返回的入参
function Trigger.Player:GetEquipGridID(ix) end

---查询玩家的首次邀请人Uin（阻塞接口）
---阻塞接口，触发请求间隔 10 秒
---结果依赖邀请好友列表接口异步回填
---@param uin integer 玩家Uin
---@return number|nil uin 邀请人玩家Uin，查询失败返回 nil
function Trigger.Player:GetFirstInviter(uin) end

---读取玩家指定格子里的道具ID
---格子被锁定或没有道具时返回 nil
---@param playerid integer 玩家ID
---@param gridid integer 格子ID（背包栏、快捷栏或装备栏）
---@return number|string|nil itemid 道具ID，自定义道具为资源ID字符串；空格返回 nil
function Trigger.Player:GetGridItemID(playerid, gridid) end

---读取玩家指定格子里的道具数量
---@param playerid integer 玩家ID
---@param gridid integer 格子ID（背包栏、快捷栏或装备栏）
---@return number num 道具数量，空格返回 0
function Trigger.Player:GetGridItemNum(playerid, gridid) end

---获取玩家射线检测起点的坐标
---取的是玩家拾取射线起点，随摄像机朝向变化
---@param uin integer 玩家Uin
---@return table pos 起点坐标（米），取不到返回 nil
function Trigger.Player:GetRayOriginPos(uin) end

---获取玩家复活点所在的方块坐标
---@param objid integer 玩家ID
---@param worldId integer 星球ID，-1 或不传表示不限星球
---@return table pos 复活点坐标表，含 x、y、z 与 worldId（星球ID）；没有复活点返回 nil
function Trigger.Player:GetRevivePoint(objid, worldId) end

---把快捷栏序号换算成格子ID
---快捷栏格子起始索引为 1000
---@param ix any 快捷栏序号，从 0 开始
---@return number|nil gridid 序号加 1000 得到的格子ID，ix 为空返回 nil
function Trigger.Player:GetShortCutGridID(ix) end

---判断两名玩家是否为好友并与期望值比较（阻塞接口）
---阻塞接口，好友关系来自外部查询结果
---任一Uin为空时按非好友处理
---@param playerid number 玩家Uin
---@param friendid number 目标玩家Uin
---@param flag boolean 期望的好友状态，true 表示期望是好友
---@return boolean result 实际好友状态是否与 flag 一致
function Trigger.Player:HasFriend(playerid, friendid, flag) end

---判断玩家是否为迷你会员
---会员等级取自开发者商店接口，需要联网查询
---@param playerid integer 玩家ID
---@return boolean result 是否为迷你会员
function Trigger.Player:IsMiniVip(playerid) end

---构造摄像机视野（FOV）变换属性表
---与 MakeCamerPosAttr、MakeCamerRotAttr 一同供摄像机变换参数使用
---@param playerid integer 玩家ID
---@return table attr 属性表，含 itype=3（视野）、uin=玩家ID
function Trigger.Player:MakeCamerFvoAttr(playerid) end

---构造摄像机位置变换属性表
---@param playerid integer 玩家ID
---@param dir Mini.Vec3 方向轴，作为属性键使用
---@return table attr 属性表，含 itype=1（位置）、uin、dir
function Trigger.Player:MakeCamerPosAttr(playerid, dir) end

---构造摄像机旋转变换属性表
---@param playerid integer 玩家ID
---@param dir Mini.Vec3 方向轴，作为属性键使用
---@return table attr 属性表，含 itype=2（旋转）、uin、dir
function Trigger.Player:MakeCamerRotAttr(playerid, dir) end

---在玩家背包内把道具从源格子移动到目标格子
---目标格子属于装备栏时会校验道具能否装备
---源格子或目标格子被锁定时失败
---@param playerid integer 玩家ID
---@param num? number 移动数量，必须大于 0，否则直接失败
---@param gridsrc any 源格子ID
---@param griddst any 目标格子ID
---@return boolean result 是否移动成功
function Trigger.Player:MoveGridItem(playerid, num, gridsrc, griddst) end

---向玩家单独推送一条飘窗提示文字
---content 为空字符串时返回 false
---只在指定玩家的屏幕上显示，不进聊天框
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param content string 提示文字，非字符串会被转成字符串
---@return boolean result 是否全部推送成功
function Trigger.Player:NotifyGameInfo2Self(data, content) end

---向玩家单独发送一条系统聊天消息
---content 为空字符串时返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param content string 消息内容，非字符串会被转成字符串
---@return boolean result 是否全部发送成功
function Trigger.Player:NotifySystemMsg2Self(data, content) end

---为开发者打开开发者商店的仓库页面
---仅开发者本人（房主）可用，其他玩家调用返回 false
---打开的是迷你商店的仓库页 WareHouse
---@param uin number 玩家Uin
---@return boolean result 是否打开成功
function Trigger.Player:OpenDevGoodsWearHouse(uin) end

---控制玩家游戏内置界面的打开与关闭
---创建器(Gamemaker)模式或已被禁用的界面无法打开
---传入不存在的界面返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param bopen boolean 是否打开，false 表示关闭
---@param view any 界面枚举 InnerPopUpview
---@param exparam any 附加参数：储物箱界面传方块坐标，道具提示界面传道具ID
---@return boolean result 是否全部处理成功
function Trigger.Player:OpenInnerView(data, bopen, view, exparam) end

---打开或关闭玩家的冒险手书界面
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param bopen boolean 是否打开，false 表示关闭
---@return boolean result 是否全部处理成功
function Trigger.Player:OpenInnerView_AdventureHandBook(data, bopen) end

---打开或关闭玩家的动作表情界面
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param bopen boolean 是否打开，false 表示关闭
---@return boolean result 是否全部处理成功
function Trigger.Player:OpenInnerView_AnimView(data, bopen) end

---打开或关闭玩家的时代背包界面
---仅生存模式可用，其它模式会提示不支持并返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param bopen boolean 是否打开，false 表示关闭
---@return boolean result 是否全部处理成功
function Trigger.Player:OpenInnerView_BackPackEra(data, bopen) end

---打开或关闭玩家的角色背包界面
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param bopen boolean 是否打开，false 表示关闭
---@return boolean result 是否全部处理成功
function Trigger.Player:OpenInnerView_BackPackRole(data, bopen) end

---打开或关闭玩家的任务背包界面
---仅生存模式可用，其它模式会提示不支持并返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param bopen boolean 是否打开，false 表示关闭
---@return boolean result 是否全部处理成功
function Trigger.Player:OpenInnerView_BackPackTask(data, bopen) end

---打开或关闭玩家的状态（Buff）界面
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param bopen boolean 是否打开，false 表示关闭
---@return boolean result 是否全部处理成功
function Trigger.Player:OpenInnerView_BuffStatus(data, bopen) end

---打开或关闭地图收集界面
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param bopen boolean 是否打开，false 表示关闭
---@return boolean result 是否全部处理成功
function Trigger.Player:OpenInnerView_CollectMaps(data, bopen) end

---打开或关闭地图点赞评价界面
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param bopen boolean 是否打开，false 表示关闭
---@return boolean result 是否全部处理成功
function Trigger.Player:OpenInnerView_EvaluateMaps(data, bopen) end

---关注作者界面的占位接口，当前不产生任何效果
---打开与关闭分支都是空实现
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param bopen boolean 是否打开，false 表示关闭
---@return boolean result 恒为 false
function Trigger.Player:OpenInnerView_FollowTheAuthor(data, bopen) end

---打开或关闭邀请好友进房界面
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param bopen boolean 是否打开，false 表示关闭
---@return boolean result 是否全部处理成功
function Trigger.Player:OpenInnerView_InviteFriend(data, bopen) end

---打开或关闭道具加工界面
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param bopen boolean 是否打开，false 表示关闭
---@return boolean result 是否全部处理成功
function Trigger.Player:OpenInnerView_ItemProcessing(data, bopen) end

---打开或关闭道具提示浮窗
---道具ID为空或小于等于 0 时只会关闭已打开的提示框并返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param bopen boolean 是否打开，false 表示关闭
---@param itemid number | string 要展示的道具ID，资源ID字符串会转换成配置ID
---@return boolean result 是否全部处理成功
function Trigger.Player:OpenInnerView_ItemTips(data, bopen, itemid) end

---打开或关闭小地图界面
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param bopen boolean 是否打开，false 表示关闭
---@return boolean result 是否全部处理成功
function Trigger.Player:OpenInnerView_MiniMap(data, bopen) end

---打开或关闭迷你商店界面
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param bopen boolean 是否打开，false 表示关闭
---@return boolean result 是否全部处理成功
function Trigger.Player:OpenInnerView_MiniShop(data, bopen) end

---打开或关闭专长界面
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param bopen boolean 是否打开，false 表示关闭
---@return boolean result 是否全部处理成功
function Trigger.Player:OpenInnerView_Specialty(data, bopen) end

---打开或关闭指定位置的储物箱界面
---打开时缺少坐标或坐标无效会返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param bopen boolean 是否打开，false 表示关闭
---@param pos Mini.Vec3 储物箱所在方块坐标，打开时必填
---@return boolean result 是否全部处理成功
function Trigger.Player:OpenInnerView_StorageBox(data, bopen, pos) end

---在暂停与继续之间切换玩家的背景音乐
---按玩家与声音记录暂停状态，首次调用为暂停
---musicId 为空时不做任何操作，仍返回 true
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param musicId number | string 声音ID
---@return boolean result 是否全部切换成功
function Trigger.Player:PaseOrResumeMusic(data, musicId) end

---暂停玩家正在播放的2D背景音乐
---只对 PlayMusic 播放的背景音乐有效
---musicId 为空时不做任何操作，仍返回 true
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param musicId string 声音ID
---@return boolean result 是否全部暂停成功
function Trigger.Player:PauseMusic(data, musicId) end

---为玩家播放2D背景音乐
---播放成功后会记录该玩家该声音的播放状态，供暂停与停止接口使用
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param musicId string 声音ID
---@param volume number 音量
---@param pitch number 音调
---@param isLoop boolean 是否循环播放
---@return boolean result 是否全部播放成功
function Trigger.Player:PlayMusic(data, musicId, volume, pitch, isLoop) end

---把玩家摄像机属性恢复到默认状态
---data 为空时返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@return boolean result 是否全部重置成功
function Trigger.Player:ResetCameraAttr(data) end

---继续播放被暂停的2D背景音乐
---只对 PlayMusic 播放过的背景音乐有效
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param musicId number | string 声音ID
---@return boolean result 是否全部恢复成功
function Trigger.Player:ResumeMusic(data, musicId) end

---立即把玩家视角旋转到指定的偏航角与俯仰角
---瞬时旋转，没有平滑过渡参数
---yaw 或 pitch 为空时返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param yaw number 偏航角（度）
---@param pitch number 俯仰角（度）
---@return boolean result 是否全部旋转成功
function Trigger.Player:RotateCamera(data, yaw, pitch) end

---以动画方式改变玩家摄像机视野（FOV）
---任一参数为空返回 false；动画在客户端播放
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param isadd number 变更方式：1 增加、2 减少、3 直接设为
---@param value any 视野值
---@param animid number | string 缓动枚举 Easing
---@param time number 动画时长
---@return boolean result 是否全部下发成功
function Trigger.Player:SetCameraAnimFov(data, isadd, value, animid, time) end

---以动画方式沿单轴改变玩家摄像机位置
---value 不是 number 时直接返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param sigdir Mini.Vec3 轴向，取 x、y、z 之一
---@param isadd number 变更方式：1 增加、2 减少、3 直接设为
---@param value number 偏移量（米），内部会乘以 100 换算成厘米
---@param animid number | string 缓动枚举 Easing
---@param time number 动画时长
---@return boolean result 是否全部下发成功
function Trigger.Player:SetCameraAnimPos(data, sigdir, isadd, value, animid, time) end

---以动画方式沿单轴改变摄像机位置（不做百分位换算）
---与 SetCameraAnimPos 的唯一区别是 value 不再除以 100
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param sigdir Mini.Vec3 轴向，取 x、y、z 之一
---@param isadd number 变更方式：1 增加、2 减少、3 直接设为
---@param value any 偏移量（米），直接使用不除以 100
---@param animid number | string 缓动枚举 Easing
---@param time number 动画时长
---@return boolean result 是否全部下发成功
function Trigger.Player:SetCameraAnimPosEx(data, sigdir, isadd, value, animid, time) end

---以动画方式沿单轴改变玩家摄像机旋转角度
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param sigdir Mini.Vec3 轴向，取 x、y、z 之一
---@param isadd number 变更方式：1 增加、2 减少、3 直接设为
---@param value any 旋转角度
---@param animid number | string 缓动枚举 Easing
---@param time number 动画时长
---@return boolean result 是否全部下发成功
function Trigger.Player:SetCameraAnimRot(data, sigdir, isadd, value, animid, time) end

---开关玩家摄像机的指定属性
---attr 为空返回 false；enable 必须是 boolean
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param attr number 摄像机属性枚举 CameraModel（1 移动跟随、2 旋转跟随、3 自动归纳、4 相对旋转、5 角色半透明）
---@param enable boolean 是否启用
---@return boolean result 是否全部设置成功
function Trigger.Player:SetCameraAttrState(data, attr, enable) end

---把玩家摄像机挂载到指定对象上
---objid 为空返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param objid number 挂载目标对象ID
---@return boolean result 是否全部设置成功
function Trigger.Player:SetCameraMountObj(data, objid) end

---把玩家摄像机固定挂载到指定坐标
---pos 为空返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param pos table 挂载位置坐标
---@return boolean result 是否全部设置成功
function Trigger.Player:SetCameraMountPos(data, pos) end

---设置玩家摄像机的旋转模式
---attr 为空返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param attr number 旋转模式枚举 CameraRotate（1 全方向、2 仅偏航、3 仅俯仰、4 不旋转）
---@return boolean result 是否全部设置成功
function Trigger.Player:SetCameraRotMode(data, attr) end

---把指定玩家移出本局游戏
---会先给该玩家下发被移出提示，0.5 秒后请求房间踢人
---单机（无 zmq）模式下会对其他所有玩家执行移出
---@param data integer | integer[] 玩家ID或玩家ID数组
---@return boolean? result 是否全部移出成功，data 为空时返回 nil
function Trigger.Player:SetGameDefeat(data) end

---结束游戏并把指定玩家设为胜者
---走游戏结束流程，会触发结算
---@param data integer | integer[] 玩家ID或玩家ID数组
---@return boolean? result 是否成功结束游戏，data 为空时返回 nil
function Trigger.Player:SetGameWin(data) end

---屏蔽或恢复玩家指定的枪械动作
---attr 不是 number 或 switch 不是 boolean 时返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param attr any 枪械动作枚举 GunActionBan（1 装备、2 开火、3 装填、4 奔跑、5 开镜等）
---@param switch boolean 是否屏蔽
---@return boolean result 是否全部设置成功
function Trigger.Player:SetGunActionState(data, attr, switch) end

---禁止或允许玩家丢弃指定道具
---内部设置的是玩家的道具丢弃禁用属性 ItemDisableDrop
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param itemid number | string 道具ID，支持资源ID字符串
---@param switch? boolean 是否禁止丢弃，默认 false
---@return boolean result 是否全部设置成功
function Trigger.Player:SetItemDropAttAction(data, itemid, switch) end

---禁止或允许玩家投掷指定道具
---内部设置的是玩家的道具投掷禁用属性 ItemDisableThrow
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param itemid number | string 道具ID，支持资源ID字符串
---@param switch? boolean 是否禁止投掷，默认 false
---@return boolean result 是否全部设置成功
function Trigger.Player:SetItemThrowAttAction(data, itemid, switch) end

---把玩家切到队伍999并记录切换前的队伍
---切换前的队伍会保存在服务内部，供 SetQuitJudge 恢复
---@param data integer | integer[] 玩家ID或玩家ID数组
---@return boolean result 是否全部切换成功
function Trigger.Player:SetJoinJudge(data) end

---触发玩家手机震动
---time 缺失或小于等于 0 时返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param time number 震动时长（毫秒），需大于 0
---@param amplitude number 震动强度，1~255
---@return boolean result 是否全部触发成功
function Trigger.Player:SetMobileVibrate(data, time, amplitude) end

---把玩家恢复为加入判定前的队伍
---没有 SetJoinJudge 记录时切到队伍 0
---@param data integer | integer[] 玩家ID或玩家ID数组
---@return boolean result 是否全部恢复成功
function Trigger.Player:SetQuitJudge(data) end

---设置玩家复活点的方块坐标
---坐标会向下取整
---玩家不在指定星球时失败
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param pos Mini.Vec3 复活点坐标（方块）
---@param worldId? integer 星球ID，默认取 pos.worldId 或 pos.mapId
---@return boolean result 是否全部设置成功
function Trigger.Player:SetRevivePoint(data, pos, worldId) end

---抖动玩家镜头
---duration 或 power 为空时返回 false
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param duration number 抖动持续时间
---@param power number 抖动强度，1~1000
---@return boolean result 是否全部触发成功
function Trigger.Player:ShakeCamera(data, duration, power) end

---停止玩家正在播放的2D背景音乐
---停止成功后会清除该玩家该声音的播放记录
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param musicId string 声音ID
---@return boolean result 是否全部停止成功
function Trigger.Player:StopMusic(data, musicId) end

---停止玩家当前的镜头抖动
---@param data integer | integer[] 玩家ID或玩家ID数组
---@return boolean result 是否全部停止成功
function Trigger.Player:StopShakeCamera(data) end

---把背包栏序号换算成格子索引
---@param ix number 背包栏序号，1~100
---@return number|nil gridid 序号减 1 得到的索引，越界或非数字返回 nil
function Trigger.Player:ToBackPackGridID(ix) end

---把装备栏序号换算成格子索引
---1~5 返回 8000~8004，6~8 返回 8006~8008
---@param ix number 装备栏序号，1~8
---@return number|nil gridid 换算后的格子索引，越界或非数字返回 nil
function Trigger.Player:ToEquipGridID(ix) end

---把快捷栏序号换算成格子索引
---@param ix number 快捷栏序号，1~8
---@return number|nil gridid 序号减 1 得到的索引，越界或非数字返回 nil
function Trigger.Player:ToShortCutGridID(ix) end

---让玩家使用指定道具
---每次调用只按 itemid 使用一次，itemnum 不参与逻辑
---@param data integer | integer[] 玩家ID或玩家ID数组
---@param itemnum number 道具数量，当前引擎实现未使用该参数
---@param itemid number | string 道具ID，资源ID字符串会转换成配置ID
---@return boolean? result 是否全部使用成功，data 为空时返回 nil
function Trigger.Player:UseItem(data, itemnum, itemid) end
