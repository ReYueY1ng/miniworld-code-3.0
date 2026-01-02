---@meta

---玩家模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/player.html)
---@class Player
Player = {}

---获取房主uin
---@return integer uin 玩家Uin
function Player:GetHostUin() end

---设置玩家是否胜利
---@param objid integer 玩家Uin
---@param result TeamResults 游戏结果
---@return boolean result
function Player:SetGameResults(objid, result) end

---设置玩家胜利
---@param objid integer 玩家Uin
---@return boolean result
function Player:SetGameWin(objid) end

---获取玩家手持道具
---@param objid integer 玩家Uin
---@return integer|string itemid 道具ID
function Player:GetCurToolID(objid) end

---获取玩家当前选中快捷栏索引
---@param objid integer 玩家Uin
---@return number index 索引值
function Player:GetShotcutIndex(objid) end

---设置玩家当前选中快捷栏索引
---@param objid integer 玩家Uin
---@param index integer 快捷栏索引（1~8）
---@return boolean result
function Player:SetShotcutIndex(objid, index) end

---设置道具技能时间
---@param objid integer 玩家Uin
---@param itemid integer|string 道具类型
---@param cd number 冷却时间
---@return boolean result
function Player:SetSkillCD(objid, itemid, cd) end

---玩家在指定位置复活
---@param objid integer 玩家Uin
---@param x number 方块坐标
---@param y number 方块坐标
---@param z number 方块坐标
---@return boolean result
function Player:ReviveToPos(objid, x, y, z) end

---设置玩家复活点
---@param objid integer 玩家Uin
---@param x number 方块坐标
---@param y number 方块坐标
---@param z number 方块坐标
---@return boolean result
function Player:SetRevivePoint(objid, x, y, z) end

---使玩家显示飘窗文字
---@param objid integer 玩家Uin
---@param info string 文本内容
---@return boolean result
function Player:NotifyGameInfo2Self(objid, info) end

---玩家旋转摄像机角度
---@param objid integer 玩家Uin
---@param yaw number 视角偏移旋转角度
---@param pitch number 视角仰望旋转角度
---@param issmooth? boolean 是否平滑
---@param iscorrectyaw? boolean 是否修正
---@param deltayaw? number 视角偏移平滑变化量
---@param deltapitch? number 视角仰望变化量
---@return boolean result
function Player:RotateCamera(objid, yaw, pitch, issmooth, iscorrectyaw, deltayaw, deltapitch) end

---抖动玩家镜头
---@param objid integer 玩家ID
---@param power number 强度(取值范围1-1000)
---@param duration number 持续时间
---@return boolean result
function Player:ShakeCamera(objid, power, duration) end

---停止抖动玩家镜头
---@param objid integer 玩家ID
---@return boolean result
function Player:StopShakeCamera(objid) end

---玩家旋转摄像机角度朝向actor
---@param objid integer 玩家id
---@param targetid integer 目标对象objid
---@return boolean result
function Player:RotateCameraToActor(objid, targetid) end

---玩家改变视角
---@param objid integer 玩家Uin
---@param viewmode ViewPortType 视角枚举
---@param islock boolean 是否锁定
---@return boolean result
function Player:ChangeViewMode(objid, viewmode, islock) end

---玩家是否装备了某件装备
---@param objid integer 玩家Uin
---@param itemid integer|string 道具类型
---@return boolean result
function Player:IsEquipByResID(objid, itemid) end

---获取玩家准心位置
---@param objid integer 玩家Uin
---@return number x 坐标
---@return number y 坐标
---@return number z 坐标
function Player:GetAimPos(objid) end

---获取玩家准心方向
---@param objid integer 玩家Uin
---@return PositionTable pos 坐标
function Player:GetAimDir(objid) end

---获取玩家射线检测起点位置
---@param objid integer 玩家Uin
---@return number x 方块坐标
---@return number y 方块坐标
---@return number z 方块坐标
function Player:GetRayOriginPos(objid) end

---对玩家播放背景音乐2D
---@param objid integer 玩家Uin
---@param musicId integer | string 声音ID
---@param volume number 声音大小
---@param pitch number 声音音调
---@param isLoop boolean 是否循环
---@return boolean result
function Player:PlayMusic(objid, musicId, volume, pitch, isLoop) end

---玩家停止播放背景音乐2D
---@param objid integer 玩家Uin
---@param musicId integer | string 声音ID
---@return boolean result
function Player:StopMusic(objid, musicId) end

---玩家暂停/恢复播放背景音乐
---@param objid number 玩家Uin
---@param musicId integer | string 声音ID
---@param pause boolean true暂停/false恢复
---@return boolean result
function Player:PauseMusic(objid, musicId, pause) end

---打开一个UI界面
---@param objid integer 玩家Uin
---@param uiname string 自定义UIID
---@param effectid? integer 动画ID(缺省参数)
---@param time? number 动画持续时间(缺省参数)
---@return boolean result
function Player:OpenUIView(objid, uiname, effectid, time) end

---隐藏一个UI界面
---@param objid integer 玩家Uin
---@param uiname string 自定义UIID
---@param effectid? integer 动画ID(缺省参数)
---@param time? number 动画持续时间(缺省参数)
---@return boolean result
function Player:HideUIView(objid, uiname, effectid, time) end

---获取客机类型
---@param objid integer 玩家Uin
---@return DeviceType
function Player:GetClientInfo(objid) end

---获取玩家昵称
---@param objid integer 玩家Uin
---@return string name 玩家昵称
function Player:GetNickname(objid) end

---打开开发者商店商品购买弹框（开发者账号和自定义按钮点击事件可用）
---@param objid integer 玩家Uin
---@param devGoodsId integer 商品ID
---@param customDesc string 自定义商品描述
---@return ErrorCode code 成功
function Player:OpenDevGoodsBuyDialog(objid, devGoodsId, customDesc) end

---打开开发者商店商品详情页
---@param objid number 玩家Uin
---@param devGoodsId number 商品ID
---@return ErrorCode code 成功
function Player:OpenDevGoodsBuyDetailedDialog(objid, devGoodsId) end

---玩家打开开发者商店（仅开发者可用）
---@param objid integer 玩家Uin
---@return boolean result
function Player:OpenDevStore(objid) end

---打开开发者商品二级分类
---@param objid integer 玩家Uin
---@param page integer 分类页码
---@param name string 分类名称
---@return boolean result
function Player:OpenDevStoreTab(objid, page, name) end

---打开开发者商店一级页面
---@param objid integer 玩家Uin
---@param pagetype MiniShopPage 页面枚举值
---@param pagetitle string 页面标题
---@return boolean result
function Player:OpenDevGoodsPage(objid, pagetype, pagetitle) end

---获取玩家的消费统计（有5s冷却限制，触发冷却返回nil)
---@param playerid integer 玩家Uin
---@param tbegin number 开始时间
---@param tend number 结束时间
---@param costtype MiniCurrency 查询类型
---@return number icount 消费数量(-1 请求失败)
function Player:GetPlayerCostStatic(playerid, tbegin, tend, costtype) end

---玩家自定义数据上报埋点
---@param playerid integer 玩家Uin
---@param eventstr string 事件名称
---@return boolean result
function Player:StandReportEvent(playerid, eventstr) end

---清空运动趋势(配合'禁止移动'使用)
---@param uin integer 玩家Uin
---@return boolean result
function Player:ClearMotion(uin) end

---玩家手机震动
---@param playerid integer 玩家Uin
---@param time number 震动时长(单位：ms)
---@param amplitude number 震动强度(范围：1~255)
---@return boolean result
function Player:SetMobileVibrate(playerid, time, amplitude) end

---@deprecated
---根据玩家uin，3D坐标获取玩家屏幕2D坐标(坐标要*100)
---@see Player.GetScreenSpacePosV2
---@param playerid integer 玩家Uin
---@param x number 坐标
---@param y number 坐标
---@param z number 坐标
---@return number retX x坐标
---@return number retY y坐标
function Player:GetScreenSpacePos(playerid, x, y, z) end

---根据玩家uin，3D坐标获取玩家屏幕2D坐标
---@param playerid integer 玩家Uin
---@param x number 坐标
---@param y number 坐标
---@param z number 坐标
---@return number retX x坐标
---@return number retY y坐标
function Player:GetScreenSpacePosV2(playerid, x, y, z) end

---发送好友申请
---@param playerid integer 玩家Uin
---@param uin2 integer 要添加的好友Uin
---@return boolean result
function Player:SendFriendApply(playerid, uin2) end

---玩家摄像机变换到位置
---@param playerid integer 玩家Uin
---@param vec PositionTable 位置坐标
---@param animid Easing 线性变换枚举
---@param time number 动画时间
---@return boolean result
function Player:SetCameraPosTransformTo(playerid, vec, animid, time) end

---玩家摄像机旋转到角度
---@param playerid integer 玩家Uin
---@param vec PositionTable 角度坐标
---@param animid Easing 线性变换枚举
---@param time number 动画时间
---@return boolean result
function Player:SetCameraRotTransformTo(playerid, vec, animid, time) end

---玩家摄像机Fvo变换到值
---@param playerid integer 玩家Uin
---@param fov number fov值
---@param animid Easing 线性变换枚举
---@param time number 动画时间
---@return boolean result
function Player:SetCameraFovTransformTo(playerid, fov, animid, time) end

---玩家摄像机变换相对位置
---@param playerid integer 玩家Uin
---@param vec PositionTable 位置坐标(100=1方块)
---@param animid Easing 线性变换枚举
---@param time number 动画时间
---@return boolean result
function Player:SetCameraPosTransformBy(playerid, vec, animid, time) end

---玩家摄像机旋转相对角度
---@param playerid integer 玩家Uin
---@param vec PositionTable 角度坐标
---@param animid Easing 线性变换枚举
---@param time number 动画时间
---@return boolean result
function Player:SetCameraRotTransformBy(playerid, vec, animid, time) end

---玩家摄像机Fvo变换相对值
---@param playerid integer 玩家Uin
---@param fov number fov值
---@param animid Easing 线性变换枚举
---@param time number 动画时间
---@return boolean result
function Player:SetCameraFovTransformBy(playerid, fov, animid, time) end

---设置玩家的摄像机设置开关
---@param playerid integer 玩家Uin
---@param attr CameraModel 摄像机属性
---@param enable boolean 开关(true开启 false关闭)
---@return boolean result
function Player:SetCameraAttrState(playerid, attr, enable) end

---设置玩家的摄像机旋转模式
---@param playerid integer 玩家Uin
---@param attr CameraRotate 摄像机旋转模式
---@return boolean result
function Player:SetCameraRotMode(playerid, attr) end

---设置玩家的摄像机挂载到对象
---@param playerid integer 玩家Uin
---@param objid integer 挂载对象ID
---@return boolean result
function Player:SetCameraMountObj(playerid, objid) end

---设置玩家的摄像机挂载到位置
---@param playerid integer 玩家Uin
---@param pos PositionTable 挂载位置坐标
---@return boolean result
function Player:SetCameraMountPos(playerid, pos) end

---重置玩家摄像机
---@param playerid integer 玩家Uin
---@return boolean result
function Player:ResetCameraAttr(playerid) end

---打开可以操作的箱子
---@param objid integer 玩家Uin
---@param x number 方块坐标
---@param y number 方块坐标
---@param z number 方块坐标
---@return boolean result
function Player:OpenBoxByPos(objid, x, y, z) end

---获取玩家首次邀请人(阻塞接口，请求间隔10s)
---@param objid integer 被邀请的玩家Uin
---@return integer uin 邀请人的玩家Uin(获取失败时返回错误码)
function Player:GetFirstInviter(objid) end

---判断两个玩家是否是好友(阻塞接口)
---@param playerid integer 玩家Uin
---@param playerid2 integer 玩家Uin2
---@return boolean result
function Player:HasFriend(playerid, playerid2) end

---获取玩家VIP等级
---@param playerid integer 玩家Uin
---@return integer viplevel vip等级
function Player:GetMiniVipLevel(playerid) end

---改变玩家移动方式
---@param objid integer 玩家Uin
---@param moveType MoveType 飞行枚举
---@return boolean result
function Player:ChangPlayerMoveType(objid, moveType) end

---触发器播放广告接口
---@param objid integer 玩家ID
---@param adname string 广告名称
---@return number code 执行结果 ErrorCode
---@return integer objid 玩家ID
---@return string adname 广告名称
function Player:PlayAdvertising(objid, adname) end

---玩家组显示游戏内弹窗
---@param uin integer 玩家Uin
---@param iview InnerPopUpview 弹窗类型枚举
---@param bopen boolean 打开或者关闭
---@param data? any 根据前面枚举传参（储物箱需要传入位置）
---@return boolean result
function Player:OpenInnerView(uin, iview, bopen, data) end

---设置玩家道具设置属性
---@param objid integer 玩家ID
---@param itemid integer|string 道具ID
---@param atttype ItemAbility 掉落属性枚举
---@param switch boolean 是否打开
---@return boolean result
function Player:SetItemAttAction(objid, itemid, atttype, switch) end

---玩家强制打开UI界面
---@param objid integer 玩家Uin
---@param itemid WorkeStage 枚举
---@return boolean code 成功(true)
function Player:ForceOpenBoxUI(objid, itemid) end

---设置道具技能进入冷却
---@param objid integer 玩家Uin
---@param itemid integer|string 道具ID
---@param cd? number CD时间
---@return boolean result
function Player:ItemSkillCDEnter(objid, itemid, cd) end

---设置道具技能结束冷却
---@param objid integer 玩家Uin
---@param itemid integer|string 道具ID
---@return boolean result
function Player:ItemSkillCDDone(objid, itemid) end

---设置玩家枪械权限
---@param objid integer 玩家Uin
---@param action integer 枪禁用状态枚举
---@param switch boolean 是否打开
---@return boolean result
function Player:SetGunActionState(objid, action, switch) end

---获取玩家视角模式
---@param uin integer 玩家Uin
---@return ViewPortType viewmode 视角模式
function Player:GetViewMode(uin) end

---获取玩家复活点
---@param objid integer 玩家Uin
---@return number x 方块坐标
---@return number y 方块坐标
---@return number z 方块坐标
function Player:GetRevivePoint(objid) end

---获取租赁云服务器服主
---@return integer uin 玩家Uin （仅租赁云服生效）
function Player:GetRentCloudServerOwner() end

---将玩家移出本局游戏
---@param objid integer 玩家Uin
---@return boolean result
function Player:RemovePlayer(objid) end