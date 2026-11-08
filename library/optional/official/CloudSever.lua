---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· CloudSever<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---按键对云端数据表执行自动写入
---变量ID会先经 CheckVarable 解析为变量名
---自动写入的具体规则由引擎 SSMgrValueList 决定
---@param libvarid integer 库变量ID或变量名
---@param key any 键名
---@param value any 值
---@return boolean result 是否成功
function CloudSever:AutomaticByKey(libvarid, key, value) end

---把云端库变量ID解析为变量名并缓存
---解析结果同时以变量ID与变量名作为键缓存
---@param libvarid integer 库变量ID
---@return string? varname 变量名，无法解析时为 nil
function CloudSever:CheckVarable(libvarid) end

---清空指定云端数据列表
---等价于 ClearList
---@param libvarid integer 库变量ID
---@return boolean result 是否成功
function CloudSever:ClearDataList(libvarid) end

---清空指定云端变量对应的列表
---@param libvarid integer 库变量ID
---@return boolean result 是否成功
function CloudSever:ClearList(libvarid) end

---清空指定云端变量中的有序数据
---等价于 ClearList
---@param libvarid integer 库变量ID
---@return boolean result 是否成功
function CloudSever:ClearOrderData(libvarid) end

---关闭当前房间，可带倒计时与提示
---仅在房间服务 zmqMgr_ 可用时生效
---@param countdown? number 倒计时秒数，默认 0
---@param msg? string 关闭提示文本，默认空串
---@return boolean result 是否成功
function CloudSever:CloseCurRoom(countdown, msg) end

---按索引异步读取云端变量值并派发事件
---读取结果通过触发事件 eventname 回调
---失败路径不返回 false，只返回 nil
---@param libvar any 库变量ID或变量名
---@param index number 索引
---@param eventname string 结果事件名
---@param globaldata any 写入事件参数 params.def 的默认值
---@return boolean? value 请求是否发出，失败时为 nil
function CloudSever:GetAnyValueByIndex(libvar, index, eventname, globaldata) end

---按键异步读取云端变量值并派发事件
---读取结果通过触发事件 eventname 回调
---@param libvarid integer 库变量ID或变量名
---@param key any 键名
---@param eventname string 结果事件名
---@param globaldata any 写入事件参数 params.def 的默认值
---@return boolean value 请求是否发出
function CloudSever:GetAnyValueByKey(libvarid, key, eventname, globaldata) end

---按键异步读取有序数据并回调
---内部先注册一次性任务，再向数据表发起读取
---@param libvarid integer 库变量ID或变量名
---@param key any 键名
---@param callback function 读取结果回调
---@return boolean value 是否成功发起请求
function CloudSever:GetOrderDataByKey(libvarid, key, callback) end

---按索引区间异步读取有序数据并回调
---libvarid 为空或 icount 非数字时直接返回 false
---@param libvarid? integer 库变量ID或变量名
---@param icount number 读取条数，内部向下取整
---@param callback function 读取结果回调
---@return boolean result 是否成功发起请求
---@return table? cache 命中时返回的缓存数据
function CloudSever:GetOrderDataIndexArea(libvarid, icount, callback) end

---按索引异步读取有序数据的单个值并回调
---libvarid 为空或空串时返回 false
---@param libvarid? integer 库变量ID或变量名
---@param index number 索引
---@param callback function 读取结果回调
---@return boolean value 是否成功发起请求
function CloudSever:GetOrderDataIndexValue(libvarid, index, callback) end

---按数值区间异步读取有序数据并回调
---上下限会向下取整，且顺序颠倒时自动交换
---@param libvarid? integer 库变量ID或变量名
---@param icount number 读取条数
---@param minvalue number 区间下限
---@param maxvalue number 区间上限
---@param callback function 读取结果回调
---@return boolean result 是否成功发起请求
---@return table? cache 命中时返回的缓存数据
function CloudSever:GetOrderDataValueArea(libvarid, icount, minvalue, maxvalue, callback) end

---向指定玩家列表发送传送提示
---players 不是表或 msg 为空时返回 false
---@param players table 玩家ID数组
---@param msg string 提示文本
---@return boolean result 是否成功
function CloudSever:NotifyPlayerTransmitMsg(players, msg) end

---按键移除云端数据列表中的条目
---内部转调 RemoveDataListValue
---@param libvarid integer 库变量ID或变量名
---@param key any 键名
---@return boolean result 由底层写入接口返回
function CloudSever:RemoveDataListByKey(libvarid, key) end

---按键移除云端数据列表中的条目
---实现调用 setValueByKey 时未传 value，删除效果依赖引擎对缺省参数的处理
---@param libvarid integer 库变量ID或变量名
---@param key any 键名
---@return boolean result 由底层写入接口返回
function CloudSever:RemoveDataListValue(libvarid, key) end

---按键移除云端有序数据
---内部转调 RemoveDataListValue，同样未显式传 value
---@param libvarid integer 库变量ID或变量名
---@param key any 键名
---@return boolean result 由底层写入接口返回
function CloudSever:RemoveOrderDataByKey(libvarid, key) end

---向同地图房间广播自定义消息
---**调用限制**: 仅白名单用户可用
---仅白名单用户可用
---租用房间模式下走 zmqMgr_ 跨房间广播，否则只触发本地云端消息事件
---@param msg string 消息ID或消息名，需为非空字符串
---@param customdata? table 自定义数据表，序列化为JSON发送
---@param roomids string | table 目标房间ID（字符串或字符串数组），省略则广播全部
---@return boolean result 是否成功
function CloudSever:SendSeverMsg(msg, customdata, roomids) end

---在一段时间内禁止其他玩家加入当前房间
---仅在 zmqMgr_ 可用时生效
---@param seconds? number 禁入秒数，默认 0
---@return boolean result 是否成功
function CloudSever:SetForbidJoin(seconds) end

---按键写入云端有序数据
---内部转调 SetDataListValue
---@param libvarid integer 库变量ID或变量名
---@param Key any 键名（注意大写 K）
---@param value any 值
---@return boolean result 是否成功
function CloudSever:SetOrderDataBykey(libvarid, Key, value) end

---把玩家传送到其他房间，房间标识固定为 other
---内部转调 TransmitToRoom，不返回传送结果
---@param playerid integer 玩家ID或玩家ID数组
---@param msg string 传送提示文本
---@param notFollow boolean 是否不跟随队友
function CloudSever:TransmitOtherRoom(playerid, msg, notFollow) end

---把玩家传送到指定地图
---同一玩家 15 秒内只能传送一次，超频会收到提示
---数组模式下只对未冷却的玩家发起传送
---@param playerid number | table 玩家ID或玩家ID数组，0 会被忽略
---@param mapid any 目标地图ID
---@param msg string 传送提示文本
---@param reportData any 上报数据
---@param noConfirm boolean 是否跳过确认弹窗
---@param notFollow boolean 是否不跟随队友
---@return boolean result 是否成功发起传送
function CloudSever:TransmitToMap(playerid, mapid, msg, reportData, noConfirm, notFollow) end

---把玩家传送到指定房间
---同一玩家 15 秒内只能传送一次
---roomid 不是非空字符串时直接返回 false
---@param playerid number | table 玩家ID或玩家ID数组，0 会被忽略
---@param roomid string 目标房间ID，需为非空字符串
---@param msg string 传送提示文本
---@param notFollow boolean 是否不跟随队友
---@return boolean result 是否成功发起传送
function CloudSever:TransmitToRoom(playerid, roomid, msg, notFollow) end

---注册按键的数据更新监听
---监听任务名由 libvarid 与 key 拼接，已存在同名任务时注册失败
---@param libvarid? integer 库变量ID或变量名
---@param key any 键名
---@param callback function 更新回调
---@return boolean result 是否注册成功
function CloudSever:UpdateDataListByKey(libvarid, key, callback) end

---异步查询目标地图的房间信息并通知线程池
---结果通过 threadpool 通知 task 名 "transmap"..mapid，字段含 cantransm、msg、room_user_count、target_author_uin
---供 TransmitToCategoryRoom 内部使用，一般不直接调用
---@param mapid any 地图ID
function CloudSever:__GetMapInfo(mapid) end
