---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Actor<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---对区域内对象统一造成伤害，当前实现为空
---引擎侧函数体为空，调用不会产生任何效果
---@param objid integer 对象ID
---@param areaid integer 区域ID
---@param damage number 伤害值
---@param attacktype number 攻击类型
---@param ignoreList table 忽略的对象ID列表
---@param ignoreResist boolean 是否忽略抗性
---@param ignoreTriggerEvent boolean 是否忽略触发事件
function Actor:ActorHurtArea(objid, areaid, damage, attacktype, ignoreList, ignoreResist, ignoreTriggerEvent) end

---为角色叠加一条模组属性加成
---attrtype 与 value 必须为数字，否则直接返回 false
---角色必须具有生物属性组件才能生效
---@param objid integer 对象ID
---@param attrtype number 属性类型编号
---@param value number 加成数值
---@return boolean result 是否叠加成功
function Actor:AddModAttrib(objid, attrtype, value) end

---查找角色周围最近的指定方块并返回坐标
---未找到方块或参数非法时返回 nil
---@param objid? integer 对象ID
---@param blockid? string 方块ID，可传资源ID字符串
---@param blockRange number 搜索范围（方块数）
---@return number? x 方块X坐标
---@return number? y 方块Y坐标
---@return number? z 方块Z坐标
function Actor:FindLevelNearestBlock(objid, blockid, blockRange) end

---以随机顺序在角色周围查找指定方块坐标
---与最近搜索的区别在于命中顺序随机
---@param objid? integer 对象ID
---@param blockid? string 方块ID，可传资源ID字符串
---@param blockRange number 搜索范围（方块数）
---@return number? x 方块X坐标
---@return number? y 方块Y坐标
---@return number? z 方块Z坐标
function Actor:FindLevelRandomsortBlock(objid, blockid, blockRange) end

---获取角色碰撞体的宽与高
---底层返回值按 1/100 换算为格，角色不存在时为 nil
---@param objid integer 对象ID
---@param bodySizeType number 身体大小类型，默认 0
---@return number? w 宽度（格）
---@return number? h 高度（格）
function Actor:GetBodySize(objid, bodySizeType) end

---获取技能槽的蓄力上限数量
---槽位会减 1 后传给底层
---@param objid? integer 对象ID
---@param slot number 技能槽位，从 1 开始
---@return number? num 蓄力上限数量
function Actor:GetChargingMaxNum(objid, slot) end

---获取技能槽的蓄力上限时间
---@param objid? integer 对象ID
---@param slot number 技能槽位，从 1 开始
---@return number? time 蓄力上限时间
function Actor:GetChargingMaxTime(objid, slot) end

---获取技能槽当前的蓄力数量
---@param objid? integer 对象ID
---@param slot number 技能槽位，从 1 开始
---@return number? num 当前蓄力数量
function Actor:GetChargingNum(objid, slot) end

---获取技能槽当前的蓄力时间
---@param objid? integer 对象ID
---@param slot number 技能槽位，从 1 开始
---@return number? time 当前蓄力时间
function Actor:GetChargingTime(objid, slot) end

---获取角色当前所在地图ID
---@param objid integer 对象ID
---@return number mapid 地图ID，取不到时为 -1
function Actor:GetCurrMapId(objid) end

---获取角色手持枪械的品质、等级与特性数
---角色不存在或未持枪时整体返回 nil
---@param objid integer 对象ID
---@return integer? quality 枪械品质
---@return integer level 枪械等级
---@return integer fertcount 特性数量
function Actor:GetGunInfo(objid) end

---获取角色最近一次下落速度
---@param objid integer 对象ID
---@return number value 下落速度，取不到时为 0
function Actor:GetLastFallSpeed(objid) end

---获取地图是否开启等级模式
---结果首次读取后缓存在 self._isStarLevelMode
---@return any? mode 等级模式开关值，未初始化时为 nil
function Actor:GetLevelMode() end

---把外观名解析为主模型资源名
---形如 ModelCompObj_<对象ID> 时查询模型组件，其余情况原样返回
---@param facade string 外观名，形如 ModelCompObj_1234
---@return string? res 主模型资源名
function Actor:GetMainModel(facade) end

---获取角色当前的欧拉角朝向
---角色不存在时返回 nil
---@param objid integer 对象ID
---@return number? x X轴角度
---@return number? y Y轴角度
---@return number? z Z轴角度
function Actor:GetOrientation(objid) end

---获取角色重力覆盖倍率
---底层存储值为倍率的 -8 倍
---@param objid? integer 对象ID
---@return number|boolean? result 重力倍率，未设置时为 1，参数非法时为 false
function Actor:GetOverlayGravity(objid) end

---获取技能槽的剩余冷却时间
---@param objid? integer 对象ID
---@param slot number 技能槽位，从 1 开始
---@return number? cd 剩余冷却秒数
function Actor:GetSkillCD(objid, slot) end

---获取技能槽的最大冷却时间
---@param objid? integer 对象ID
---@param slot number 技能槽位，从 1 开始
---@return number? maxcd 最大冷却秒数
function Actor:GetSkillMaxCD(objid, slot) end

---初始化触发器全局数据管理器引用
---内部按需懒调用，一般无需手动执行
function Actor:InitTriggerGlobalData() end

---判断技能槽是否已装配技能
---参数非法时返回 nil，角色不存在时返回 false
---@param objid? integer 对象ID
---@param slot number 技能槽位，从 1 开始
---@return boolean? has 是否拥有技能
function Actor:IsHaveSkill(objid, slot) end

---判断对象ID是否为生物
---对象ID必须大于 4294967296 且能在生物表中找到
---@param objid number 对象ID
---@return boolean result 是否是生物
function Actor:IsMob(objid) end

---重建可用的生物与道具外观列表
---结果写入 self.facadeList，元素形如 mob_<ID>、block_<ID>、item_<ID>
---会遍历生物表与道具表，开销较大
function Actor:OrganizeFacadeList() end

---让角色播放指定触发器动作
---玩家对象走客户端任务下发，其他角色直接在服务端播放
---动作ID需存在于触发器动作表
---@param objid integer 对象ID
---@param actid number 动作ID
---@return boolean result 是否播放成功
function Actor:PlayAct(objid, actid) end

---按动画ID在角色身上播放动画
---@param objid integer 对象ID
---@param animid number | string 动画ID
---@param inputloopmode any 循环模式
---@param playLayer any 播放层
---@param crossfade any 过渡融合时长
---@return boolean result 是否播放成功
function Actor:PlayAnimById(objid, animid, inputloopmode, playLayer, crossfade) end

---播放角色身上的指定类型身体特效
---类型校验条件写成或，任意值都会通过
---@param objid integer 对象ID
---@param itype number | string 特效类型，可传编号或资源名
---@return boolean result 是否播放成功
function Actor:PlayBodyEffect(objid, itype) end

---按特效文件播放角色身体特效
---@param objid integer 对象ID
---@param filename string 特效文件名
---@param sync? boolean 是否同步给其他玩家，默认 true
---@return boolean result 是否播放成功
function Actor:PlayBodyEffectByFile(objid, filename, sync) end

---模拟按下技能槽触发技能
---最终调用底层技能输入按下接口
---@param objid? integer 对象ID
---@param slot number 技能槽位，从 1 开始
---@return boolean result 是否触发成功
function Actor:PlaySkill(objid, slot) end

---在角色位置播放指定名称音效
---@param objid integer 对象ID
---@param name string 音效资源名
---@param volume number 音量，默认 1
---@param pitch number 音调，默认 1
---@param flag number 播放标志，默认 3
---@return boolean result 是否播放成功
function Actor:PlaySoundByName(objid, name, volume, pitch, flag) end

---让一个角色对另一个角色造成伤害
---伤害值必须大于 0，先走受击组件再退回基础受击流程
---@param objid integer 攻击者对象ID
---@param targetid integer 目标对象ID
---@param damage number 伤害值
---@param attacktype number 攻击类型，默认固定伤害
---@param ignoreResist boolean 是否忽略抗性，默认 false
---@param ignoreTriggerEvent boolean 是否忽略触发事件
---@return boolean result 是否造成伤害成功
function Actor:PlayerHurt(objid, targetid, damage, attacktype, ignoreResist, ignoreTriggerEvent) end

---设置角色操作是否交由脚本接管
---@param objid? integer 对象ID
---@param b boolean 是否交由脚本控制
---@return boolean result 是否设置成功
function Actor:SetActorControl(objid, b) end

---设置角色的水平或俯仰朝向
---@param objid? integer 对象ID
---@param itype number 朝向类型：FaceType.Yaw 水平，FaceType.Pitch 俯仰
---@param value any 目标角度（度）
---@return boolean result 是否设置成功
function Actor:SetActorDir(objid, itype, value) end

---设置角色是否免疫受击
---当前值已与目标值相同时返回 false
---@param objid integer 对象ID
---@param value boolean 是否免疫受击
---@return boolean result 是否发生变更
function Actor:SetBehitDisable(objid, value) end

---按特效文件设置身体特效缩放
---小于等于 0 会改成 1，大于 5 会截断为 5
---@param objid number 对象ID
---@param filename string 特效文件名
---@param scale number 缩放比例，取值 0 到 5
---@return boolean result 是否设置成功
function Actor:SetBodyEffectScaleByFile(objid, filename, scale) end

---设置角色是否参与碰撞
---会同步碰撞状态到客户端
---当前值已相同时返回 false
---@param objid integer 对象ID
---@param value boolean 是否参与碰撞
---@return boolean result 是否发生变更
function Actor:SetCanCollide(objid, value) end

---设置技能槽的蓄力状态
---@param objid? integer 对象ID
---@param slot number 技能槽位，从 1 开始
---@param ischarging boolean 是否处于蓄力中
---@return boolean result 是否设置成功
function Actor:SetCharging(objid, slot, ischarging) end

---设置技能槽当前的蓄力值
---@param objid? integer 对象ID
---@param slot number 技能槽位，从 1 开始
---@param value number 蓄力值
---@return boolean result 是否设置成功
function Actor:SetChargingValue(objid, slot, value) end

---一次性写入技能槽的蓄力参数
---六个参数类型必须全部正确，否则整次设置失败
---@param objid? integer 对象ID
---@param slot number 技能槽位，从 1 开始
---@param max number 蓄力上限时间
---@param num number 当前蓄力数量
---@param maxnum number 蓄力上限数量
---@param isauto boolean 是否自动蓄力
---@return boolean result 是否设置成功
function Actor:SetCharginginfo(objid, slot, max, num, maxnum, isauto) end

---设置角色是否优先搜索目标
---@param objid integer 对象ID
---@param firstsearch boolean 是否优先搜索
---@return boolean result 是否设置成功
function Actor:SetFirstSearch(objid, firstsearch) end

---直接设置角色的模组属性值
---与 AddModAttrib 的区别是覆盖而非叠加
---@param objid integer 对象ID
---@param attrtype number 属性类型编号
---@param value number 属性数值
---@return boolean result 是否设置成功
function Actor:SetModAttrib(objid, attrtype, value) end

---设置角色每帧附加的位移速度
---玩家走客户端接口，其他角色直接设置运动速度
---@param objid integer 对象ID
---@param x number X分量
---@param y number Y分量
---@param z number Z分量
---@return boolean result 是否设置成功
function Actor:SetMotionChange(objid, x, y, z) end

---设置角色或对象的欧拉角朝向
---非对象实体只应用 Y 轴角度，X 与 Z 被忽略
---@param objid integer 对象ID
---@param x number X轴角度
---@param y number Y轴角度
---@param z number Z轴角度
---@return boolean result 是否设置成功
function Actor:SetOrientation(objid, x, y, z) end

---设置角色重力覆盖倍率
---越界值会被夹取，底层按倍率的 -8 倍存储
---@param objid? integer 对象ID
---@param val number 重力倍率，限制在 -1 到 10
---@return boolean result 是否设置成功
function Actor:SetOverlayGravity(objid, val) end

---设置对象骑乘组件的挂点位置
---对象或骑乘组件不存在时静默忽略
---@param objid integer 对象ID
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
function Actor:SetRidePosition(objid, x, y, z) end

---设置角色或对象的缩放比例
---非对象实体只取 Y 轴数值作为统一缩放
---@param objid integer 对象ID
---@param x number X轴缩放
---@param y number Y轴缩放
---@param z number Z轴缩放
---@return boolean result 是否设置成功
function Actor:SetScale(objid, x, y, z) end

---设置技能槽的冷却时间
---@param objid? integer 对象ID
---@param slot number 技能槽位，从 1 开始
---@param cd number 冷却时间（秒）
---@return boolean result 是否设置成功
function Actor:SetSkillCD(objid, slot, cd) end

---设置技能槽的最大冷却与自动冷却
---@param objid? integer 对象ID
---@param slot number 技能槽位，从 1 开始
---@param maxcd number 最大冷却时间（秒）
---@param isauto boolean 是否自动进入冷却
---@return boolean result 是否设置成功
function Actor:SetSkillCDInfo(objid, slot, maxcd, isauto) end

---判断技能槽是否正在蓄力
---参数非法时返回 nil，角色不存在时返回 false
---@param objid? integer 对象ID
---@param slot number 技能槽位，从 1 开始
---@return boolean? charging 是否蓄力中
function Actor:SkillIsCharging(objid, slot) end

---停止角色身上播放的全部动画
---@param objid integer 对象ID
---@return any? result 底层停止结果，角色不存在时为 false
function Actor:StopAllAnim(objid) end

---停止角色身上的指定类型身体特效
---类型校验条件写成或，任意值都会通过
---@param objid integer 对象ID
---@param itype number | string 特效类型，可传编号或资源名
---@return boolean result 是否停止成功
function Actor:StopBodyEffect(objid, itype) end

---手动派发角色属性变更事件
---玩家派发 Player.ChangeAttr，其他角色派发 Actor.ChangeAttr
---只触发事件，不会真正修改属性值
---@param objid integer 对象ID
---@param atttype number 属性类型
---@param val any 变化后的值
---@return boolean? result 对象不存在时为 false，正常时无返回值
function Actor:TriggerAttrChangeEvent(objid, atttype, val) end

---让角色朝目标点移动且不做寻路搜索
---@param objid? integer 对象ID
---@param x number 目标X坐标
---@param y number 目标Y坐标
---@param z number 目标Z坐标
---@return boolean result 是否下发成功
function Actor:TryMoveToNoSearch(objid, x, y, z) end
