---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Actor<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---角色造成伤害区域
---@param objid any 对象ID
---@param areaid any 区域ID
---@param damage any 伤害值
---@param attacktype any 攻击类型
---@param ignoreList any 忽略列表
---@param ignoreResist any 是否忽略抗性
---@param ignoreTriggerEvent any 是否忽略触发事件
function Actor:ActorHurtArea(objid, areaid, damage, attacktype, ignoreList, ignoreResist, ignoreTriggerEvent) end

---添加模组属性
---@param objid any 对象ID
---@param attrtype number 属性类型
---@param value number 值
---@return boolean result 是否成功
function Actor:AddModAttrib(objid, attrtype, value) end

---查找等级最近方块
---@param objid? any 对象ID
---@param blockid? string 方块ID
---@param blockRange number 方块范围
function Actor:FindLevelNearestBlock(objid, blockid, blockRange) end

---查找等级随机排序方块
---@param objid? any 对象ID
---@param blockid? string 方块ID
---@param blockRange number 方块范围
function Actor:FindLevelRandomsortBlock(objid, blockid, blockRange) end

---获取身体大小
---@param objid any 对象ID
---@param bodySizeType any 身体大小类型
function Actor:GetBodySize(objid, bodySizeType) end

---获取蓄力最大数量
---@param objid? any 对象ID
---@param slot number 槽位
function Actor:GetChargingMaxNum(objid, slot) end

---获取蓄力最大时间
---@param objid? any 对象ID
---@param slot number 槽位
function Actor:GetChargingMaxTime(objid, slot) end

---获取蓄力数量
---@param objid? any 对象ID
---@param slot number 槽位
function Actor:GetChargingNum(objid, slot) end

---获取蓄力时间
---@param objid? any 对象ID
---@param slot number 槽位
function Actor:GetChargingTime(objid, slot) end

---获取当前地图ID
---@param objid any 对象ID
function Actor:GetCurrMapId(objid) end

---获取枪械信息
---@param objid any 对象ID
function Actor:GetGunInfo(objid) end

---获取最近下落速度
---@param objid any 对象ID
---@return number value 结果数值
function Actor:GetLastFallSpeed(objid) end

---获取等级模式
function Actor:GetLevelMode() end

---获取主模型
---@param facade string 外观
---@return string? value 结果，失败时为 nil
function Actor:GetMainModel(facade) end

---获取朝向
---@param objid any 对象ID
function Actor:GetOrientation(objid) end

---获取覆盖重力
---@param objid? any 对象ID
function Actor:GetOverlayGravity(objid) end

---获取技能冷却
---@param objid? any 对象ID
---@param slot number 槽位
function Actor:GetSkillCD(objid, slot) end

---获取技能最大冷却
---@param objid? any 对象ID
---@param slot number 槽位
function Actor:GetSkillMaxCD(objid, slot) end

---初始化触发全局数据
function Actor:InitTriggerGlobalData() end

---判断是否拥有技能
---@param objid? any 对象ID
---@param slot number 槽位
---@return boolean? result 结果，失败时为 nil
function Actor:IsHaveSkill(objid, slot) end

---判断是否生物
---@param objid any 对象ID
---@return boolean result 是否满足条件
function Actor:IsMob(objid) end

---整理外观列表
function Actor:OrganizeFacadeList() end

---播放动作
---@param objid any 对象ID
---@param actid number 动作ID
---@return boolean result 是否成功
function Actor:PlayAct(objid, actid) end

---按ID播放动画
---@param objid any 对象ID
---@param animid any 动画ID
---@param inputloopmode any 输入循环模式
---@param playLayer any 播放层
---@param crossfade any 参数 crossfade
---@return boolean result 是否成功
function Actor:PlayAnimById(objid, animid, inputloopmode, playLayer, crossfade) end

---播放身体特效
---@param objid any 对象ID
---@param itype number | string 类型
---@return boolean result 是否成功
function Actor:PlayBodyEffect(objid, itype) end

---按文件播放身体特效
---@param objid any 对象ID
---@param filename string 文件名
---@param sync? boolean 是否同步
---@return boolean result 是否成功
function Actor:PlayBodyEffectByFile(objid, filename, sync) end

---播放技能
---@param objid? any 对象ID
---@param slot number 槽位
---@return boolean result 是否成功
function Actor:PlaySkill(objid, slot) end

---按名称播放音效
---@param objid any 对象ID
---@param name string 名称
---@param volume number 音量
---@param pitch number 音高
---@param flag number 开关
---@return boolean result 是否成功
function Actor:PlaySoundByName(objid, name, volume, pitch, flag) end

---玩家造成伤害
---@param objid any 对象ID
---@param targetid any 目标对象ID
---@param damage any 伤害值
---@param attacktype any 攻击类型
---@param ignoreResist any 是否忽略抗性
---@param ignoreTriggerEvent any 是否忽略触发事件
function Actor:PlayerHurt(objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end

---设置角色控制
---@param objid? any 对象ID
---@param b boolean 参数 B
---@return boolean result 是否成功
function Actor:SetActorControl(objid, b) end

---设置角色方向
---@param objid? any 对象ID
---@param itype number 类型
---@param value any 值
---@return boolean result 是否成功
function Actor:SetActorDir(objid, itype, value) end

---设置受击禁用
---@param objid any 对象ID
---@param value boolean 值
---@return boolean result 是否成功
function Actor:SetBehitDisable(objid, value) end

---按文件设置身体特效缩放
---@param objid number 对象ID
---@param filename any 文件名
---@param scale number 缩放
---@return boolean result 是否成功
function Actor:SetBodyEffectScaleByFile(objid, filename, scale) end

---设置判断能否碰撞
---@param objid any 对象ID
---@param value boolean 值
---@return boolean result 是否成功
function Actor:SetCanCollide(objid, value) end

---设置蓄力
---@param objid? any 对象ID
---@param slot number 槽位
---@param ischarging boolean 是否蓄力中
---@return boolean result 是否成功
function Actor:SetCharging(objid, slot, ischarging) end

---设置蓄力值
---@param objid? any 对象ID
---@param slot number 槽位
---@param value number 值
---@return boolean result 是否成功
function Actor:SetChargingValue(objid, slot, value) end

---设置蓄力信息
---@param objid? any 对象ID
---@param slot number 槽位
---@param max number 最大
---@param num number 数量
---@param maxnum number 最大数量
---@param isauto boolean 是否自动
---@return boolean result 是否成功
function Actor:SetCharginginfo(objid, slot, max, num, maxnum, isauto) end

---设置first搜索
---@param objid any 对象ID
---@param firstsearch boolean 首次搜索
---@return boolean result 是否成功
function Actor:SetFirstSearch(objid, firstsearch) end

---设置模组属性
---@param objid any 对象ID
---@param attrtype number 属性类型
---@param value number 值
---@return boolean result 是否成功
function Actor:SetModAttrib(objid, attrtype, value) end

---设置运动变更
---@param objid any 对象ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return boolean result 是否成功
function Actor:SetMotionChange(objid, x, y, z) end

---设置朝向
---@param objid any 对象ID
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@return boolean result 是否成功
function Actor:SetOrientation(objid, x, y, z) end

---设置覆盖重力
---@param objid? any 对象ID
---@param val number 值
---@return boolean result 是否成功
function Actor:SetOverlayGravity(objid, val) end

---设置骑乘位置
---@param objid any 对象ID
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
function Actor:SetRidePosition(objid, x, y, z) end

---设置缩放
---@param objid any 对象ID
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@return boolean result 是否成功
function Actor:SetScale(objid, x, y, z) end

---设置技能冷却
---@param objid? any 对象ID
---@param slot number 槽位
---@param cd number 冷却时间（秒）
---@return boolean result 是否成功
function Actor:SetSkillCD(objid, slot, cd) end

---设置技能冷却信息
---@param objid? any 对象ID
---@param slot number 槽位
---@param maxcd number 最大冷却
---@param isauto boolean 是否自动
---@return boolean result 是否成功
function Actor:SetSkillCDInfo(objid, slot, maxcd, isauto) end

---技能判断是否蓄力
---@param objid? any 对象ID
---@param slot number 槽位
---@return boolean? result 结果，失败时为 nil
function Actor:SkillIsCharging(objid, slot) end

---停止全部动画
---@param objid any 对象ID
---@return boolean result 是否成功
function Actor:StopAllAnim(objid) end

---停止身体特效
---@param objid any 对象ID
---@param itype number | string 类型
---@return boolean result 是否成功
function Actor:StopBodyEffect(objid, itype) end

---触发属性变更事件
---@param objid any 对象ID
---@param atttype any 属性类型
---@param val any 值
---@return boolean result 是否成功
function Actor:TriggerAttrChangeEvent(objid, atttype, val) end

---尝试移动转换为不搜索
---@param objid? any 对象ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return boolean result 是否成功
function Actor:TryMoveToNoSearch(objid, x, y, z) end
