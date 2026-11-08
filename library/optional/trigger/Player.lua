---@meta

---触发器 Player 模块（Trigger.Player）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Player
Trigger.Player = {}

---变更界面模式
---@param data integer | integer[] 数据
---@param viewmode number 参数 viewmode
---@param islock boolean 是否锁定
---@return boolean result 是否成功
function Trigger.Player:ChangeViewMode(data, viewmode, islock) end

---事件格子id2格子enum
---@param gridid number 格子ID
---@return number result 数量
function Trigger.Player:EventGridID2GridEnum(gridid) end

---获取aim点
---@param objid any 对象ID
---@return table value 结果表
function Trigger.Player:GetAimPoint(objid) end

---获取backpack格子ID
---@param ix any 索引
function Trigger.Player:GetBackPackGridID(ix) end

---获取背包道具数量
---@param objid any 对象ID
---@param itemid any 道具ID
function Trigger.Player:GetBackpackItemNum(objid, itemid) end

---获取装备格子ID
---@param ix any 索引
function Trigger.Player:GetEquipGridID(ix) end

---获取firstinviter
---@param uin any 玩家Uin
function Trigger.Player:GetFirstInviter(uin) end

---获取格子道具ID
---@param playerid any 玩家ID
---@param gridid any 格子ID
function Trigger.Player:GetGridItemID(playerid, gridid) end

---获取格子道具数量
---@param playerid any 玩家ID
---@param gridid any 格子ID
---@return number value 数量
function Trigger.Player:GetGridItemNum(playerid, gridid) end

---获取rayorigin位置
---@param uin any 玩家Uin
---@return table value 结果表
function Trigger.Player:GetRayOriginPos(uin) end

---获取复活点
---@param objid any 对象ID
---@param worldId any 星球ID
---@return table value 结果表
function Trigger.Player:GetRevivePoint(objid, worldId) end

---获取shortcut格子ID
---@param ix any 索引
function Trigger.Player:GetShortCutGridID(ix) end

---判断是否拥有好友
---@param playerid any 玩家ID
---@param friendid any 好友ID
---@param flag any 开关
function Trigger.Player:HasFriend(playerid, friendid, flag) end

---判断是否mini会员
---@param playerid any 玩家ID
function Trigger.Player:IsMiniVip(playerid) end

---makecamerfvo属性
---@param playerid any 玩家ID
---@return table result 结果表
function Trigger.Player:MakeCamerFvoAttr(playerid) end

---makecamer位置属性
---@param playerid any 玩家ID
---@param dir any 方向
---@return table result 结果表
function Trigger.Player:MakeCamerPosAttr(playerid, dir) end

---makecamerrot属性
---@param playerid any 玩家ID
---@param dir any 方向
---@return table result 结果表
function Trigger.Player:MakeCamerRotAttr(playerid, dir) end

---移动格子道具
---@param playerid any 玩家ID
---@param num? any 数量
---@param gridsrc any 参数 gridsrc
---@param griddst any 参数 griddst
---@return boolean result 是否成功
function Trigger.Player:MoveGridItem(playerid, num, gridsrc, griddst) end

---通知游戏info2自身
---@param data integer | integer[] 数据
---@param content string 内容
---@return boolean result 是否成功
function Trigger.Player:NotifyGameInfo2Self(data, content) end

---通知systemmsg2自身
---@param data integer | integer[] 数据
---@param content string 内容
---@return boolean result 是否成功
function Trigger.Player:NotifySystemMsg2Self(data, content) end

---打开devgoodswearhouse
---@param uin number 玩家Uin
---@return boolean result 是否成功
function Trigger.Player:OpenDevGoodsWearHouse(uin) end

---打开inner界面
---@param data integer | integer[] 数据
---@param bopen any 是否打开
---@param view any 界面
---@param exparam any 参数 exparam
---@return boolean result 是否成功
function Trigger.Player:OpenInnerView(data, bopen, view, exparam) end

---打开inner界面adventurehandbook
---@param data any 数据
---@param bopen any 是否打开
function Trigger.Player:OpenInnerView_AdventureHandBook(data, bopen) end

---打开inner界面动画界面
---@param data any 数据
---@param bopen any 是否打开
function Trigger.Player:OpenInnerView_AnimView(data, bopen) end

---打开inner界面backpackera
---@param data any 数据
---@param bopen any 是否打开
function Trigger.Player:OpenInnerView_BackPackEra(data, bopen) end

---打开inner界面backpackrole
---@param data any 数据
---@param bopen any 是否打开
function Trigger.Player:OpenInnerView_BackPackRole(data, bopen) end

---打开inner界面backpacktask
---@param data any 数据
---@param bopen any 是否打开
function Trigger.Player:OpenInnerView_BackPackTask(data, bopen) end

---打开inner界面状态status
---@param data any 数据
---@param bopen any 是否打开
function Trigger.Player:OpenInnerView_BuffStatus(data, bopen) end

---打开inner界面collectmaps
---@param data any 数据
---@param bopen any 是否打开
function Trigger.Player:OpenInnerView_CollectMaps(data, bopen) end

---打开inner界面evaluatemaps
---@param data any 数据
---@param bopen any 是否打开
function Trigger.Player:OpenInnerView_EvaluateMaps(data, bopen) end

---打开inner界面跟随theauthor
---@param data any 数据
---@param bopen any 是否打开
function Trigger.Player:OpenInnerView_FollowTheAuthor(data, bopen) end

---打开inner界面邀请好友
---@param data any 数据
---@param bopen any 是否打开
function Trigger.Player:OpenInnerView_InviteFriend(data, bopen) end

---打开inner界面道具processing
---@param data any 数据
---@param bopen any 是否打开
function Trigger.Player:OpenInnerView_ItemProcessing(data, bopen) end

---打开inner界面道具tips
---@param data any 数据
---@param bopen any 是否打开
---@param itemid any 道具ID
function Trigger.Player:OpenInnerView_ItemTips(data, bopen, itemid) end

---打开inner界面mini地图
---@param data any 数据
---@param bopen any 是否打开
function Trigger.Player:OpenInnerView_MiniMap(data, bopen) end

---打开inner界面mini商店
---@param data any 数据
---@param bopen any 是否打开
function Trigger.Player:OpenInnerView_MiniShop(data, bopen) end

---打开inner界面specialty
---@param data any 数据
---@param bopen any 是否打开
function Trigger.Player:OpenInnerView_Specialty(data, bopen) end

---打开inner界面storagebox
---@param data any 数据
---@param bopen any 是否打开
---@param pos any 位置
function Trigger.Player:OpenInnerView_StorageBox(data, bopen, pos) end

---paseor恢复音乐
---@param data integer | integer[] 数据
---@param musicId any 音乐ID
---@return boolean result 是否成功
function Trigger.Player:PaseOrResumeMusic(data, musicId) end

---暂停音乐
---@param data integer | integer[] 数据
---@param musicId any 音乐ID
---@return boolean result 是否成功
function Trigger.Player:PauseMusic(data, musicId) end

---播放音乐
---@param data integer | integer[] 数据
---@param musicId any 音乐ID
---@param volume any 音量
---@param pitch any 音高
---@param isLoop any 是否循环
---@return boolean result 是否成功
function Trigger.Player:PlayMusic(data, musicId, volume, pitch, isLoop) end

---重置相机属性
---@param data integer | integer[] 数据
---@return boolean result 是否成功
function Trigger.Player:ResetCameraAttr(data) end

---恢复音乐
---@param data integer | integer[] 数据
---@param musicId any 音乐ID
---@return boolean result 是否成功
function Trigger.Player:ResumeMusic(data, musicId) end

---旋转相机
---@param data integer | integer[] 数据
---@param yaw any 偏航角
---@param pitch any 音高
---@return boolean result 是否成功
function Trigger.Player:RotateCamera(data, yaw, pitch) end

---设置相机动画fov
---@param data integer | integer[] 数据
---@param isadd any 是否添加
---@param value any 值
---@param animid any 动画ID
---@param time any 时间（秒）
---@return boolean result 是否成功
function Trigger.Player:SetCameraAnimFov(data, isadd, value, animid, time) end

---设置相机动画位置
---@param data any 数据
---@param sigdir any 信号方向
---@param isadd any 是否添加
---@param value number 值
---@param animid any 动画ID
---@param time any 时间（秒）
---@return boolean result 是否成功
function Trigger.Player:SetCameraAnimPos(data, sigdir, isadd, value, animid, time) end

---设置相机动画位置ex
---@param data integer | integer[] 数据
---@param sigdir any 信号方向
---@param isadd any 是否添加
---@param value any 值
---@param animid any 动画ID
---@param time any 时间（秒）
---@return boolean result 是否成功
function Trigger.Player:SetCameraAnimPosEx(data, sigdir, isadd, value, animid, time) end

---设置相机动画rot
---@param data integer | integer[] 数据
---@param sigdir any 信号方向
---@param isadd any 是否添加
---@param value any 值
---@param animid any 动画ID
---@param time any 时间（秒）
---@return boolean result 是否成功
function Trigger.Player:SetCameraAnimRot(data, sigdir, isadd, value, animid, time) end

---设置相机属性状态
---@param data integer | integer[] 数据
---@param attr any 属性
---@param enable any 是否启用
---@return boolean result 是否成功
function Trigger.Player:SetCameraAttrState(data, attr, enable) end

---设置相机骑乘对象
---@param data integer | integer[] 数据
---@param objid any 对象ID
---@return boolean result 是否成功
function Trigger.Player:SetCameraMountObj(data, objid) end

---设置相机骑乘位置
---@param data integer | integer[] 数据
---@param pos any 位置
---@return boolean result 是否成功
function Trigger.Player:SetCameraMountPos(data, pos) end

---设置相机rot模式
---@param data integer | integer[] 数据
---@param attr any 属性
---@return boolean result 是否成功
function Trigger.Player:SetCameraRotMode(data, attr) end

---设置游戏defeat
---@param data integer | integer[] 数据
---@return boolean result 是否成功
function Trigger.Player:SetGameDefeat(data) end

---设置游戏win
---@param data integer | integer[] 数据
---@return boolean result 是否成功
function Trigger.Player:SetGameWin(data) end

---设置枪械动作状态
---@param data integer | integer[] 数据
---@param attr any 属性
---@param switch any 开关
---@return boolean result 是否成功
function Trigger.Player:SetGunActionState(data, attr, switch) end

---设置道具掉落att动作
---@param data integer | integer[] 数据
---@param itemid any 道具ID
---@param switch? boolean 开关
---@return boolean result 是否成功
function Trigger.Player:SetItemDropAttAction(data, itemid, switch) end

---设置道具投掷att动作
---@param data integer | integer[] 数据
---@param itemid any 道具ID
---@param switch? boolean 开关
---@return boolean result 是否成功
function Trigger.Player:SetItemThrowAttAction(data, itemid, switch) end

---设置加入judge
---@param data integer | integer[] 数据
---@return boolean result 是否成功
function Trigger.Player:SetJoinJudge(data) end

---设置mobilevibrate
---@param data integer | integer[] 数据
---@param time any 时间（秒）
---@param amplitude any 参数 amplitude
---@return boolean result 是否成功
function Trigger.Player:SetMobileVibrate(data, time, amplitude) end

---设置quitjudge
---@param data integer | integer[] 数据
---@return boolean result 是否成功
function Trigger.Player:SetQuitJudge(data) end

---设置复活点
---@param data integer | integer[] 数据
---@param pos Mini.Vec3 位置
---@param worldId? any 星球ID
---@return boolean result 是否成功
function Trigger.Player:SetRevivePoint(data, pos, worldId) end

---shake相机
---@param data integer | integer[] 数据
---@param duration any 参数 duration
---@param power any 强化
---@return boolean result 是否成功
function Trigger.Player:ShakeCamera(data, duration, power) end

---停止音乐
---@param data integer | integer[] 数据
---@param musicId any 音乐ID
---@return boolean result 是否成功
function Trigger.Player:StopMusic(data, musicId) end

---停止shake相机
---@param data integer | integer[] 数据
---@return boolean result 是否成功
function Trigger.Player:StopShakeCamera(data) end

---转换为backpack格子ID
---@param ix number 索引
function Trigger.Player:ToBackPackGridID(ix) end

---转换为装备格子ID
---@param ix number 索引
function Trigger.Player:ToEquipGridID(ix) end

---转换为shortcut格子ID
---@param ix number 索引
function Trigger.Player:ToShortCutGridID(ix) end

---使用道具
---@param data integer | integer[] 数据
---@param itemnum any 道具数量
---@param itemid any 道具ID
---@return boolean result 是否成功
function Trigger.Player:UseItem(data, itemnum, itemid) end
