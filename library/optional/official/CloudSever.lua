---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· CloudSever<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---按键automatic
---@param libvarid any 库变量ID
---@param key any 键名
---@param value any 值
---@return boolean result 是否成功
function CloudSever:AutomaticByKey(libvarid, key, value) end

---检查varable
---@param libvarid any 库变量ID
function CloudSever:CheckVarable(libvarid) end

---清空数据列表
---@param libvarid any 库变量ID
function CloudSever:ClearDataList(libvarid) end

---清空列表
---@param libvarid any 库变量ID
---@return boolean result 是否成功
function CloudSever:ClearList(libvarid) end

---清空order数据
---@param libvarid any 库变量ID
function CloudSever:ClearOrderData(libvarid) end

---关闭cur房间
---@param countdown? number 参数 countdown
---@param msg? string 消息
---@return boolean result 是否成功
function CloudSever:CloseCurRoom(countdown, msg) end

---按索引获取any值
---@param libvar any 参数 libvar
---@param index any 索引
---@param eventname any 事件名称
---@param globaldata any 参数 globaldata
---@return boolean value 是否成功
function CloudSever:GetAnyValueByIndex(libvar, index, eventname, globaldata) end

---按键获取any值
---@param libvarid any 库变量ID
---@param key any 键名
---@param eventname any 事件名称
---@param globaldata any 参数 globaldata
---@return boolean value 是否成功
function CloudSever:GetAnyValueByKey(libvarid, key, eventname, globaldata) end

---按键获取order数据
---@param libvarid any 库变量ID
---@param key any 键名
---@param callback any 回调函数
---@return boolean value 是否成功
function CloudSever:GetOrderDataByKey(libvarid, key, callback) end

---获取order数据索引区域
---@param libvarid? any 库变量ID
---@param icount number 引用计数
---@param callback any 回调函数
---@return boolean value 是否成功
function CloudSever:GetOrderDataIndexArea(libvarid, icount, callback) end

---获取order数据索引值
---@param libvarid? any 库变量ID
---@param index any 索引
---@param callback any 回调函数
---@return boolean value 是否成功
function CloudSever:GetOrderDataIndexValue(libvarid, index, callback) end

---获取order数据值区域
---@param libvarid? any 库变量ID
---@param icount number 引用计数
---@param minvalue number 参数 minvalue
---@param maxvalue number 参数 maxvalue
---@param callback any 回调函数
---@return boolean value 是否成功
function CloudSever:GetOrderDataValueArea(libvarid, icount, minvalue, maxvalue, callback) end

---通知玩家transmit消息
---@param players table 玩家
---@param msg any 消息
---@return boolean result 是否成功
function CloudSever:NotifyPlayerTransmitMsg(players, msg) end

---按键移除数据列表
---@param libvarid any 库变量ID
---@param key any 键名
function CloudSever:RemoveDataListByKey(libvarid, key) end

---移除数据列表值
---@param libvarid any 库变量ID
---@param key any 键名
---@return boolean result 是否成功
function CloudSever:RemoveDataListValue(libvarid, key) end

---按键移除order数据
---@param libvarid any 库变量ID
---@param key any 键名
function CloudSever:RemoveOrderDataByKey(libvarid, key) end

---发送sever消息
---**调用限制**: 仅白名单用户可用
---@param msg string 消息
---@param customdata? table 参数 customdata
---@param roomids string | table 参数 roomids
---@return boolean result 是否成功
function CloudSever:SendSeverMsg(msg, customdata, roomids) end

---设置forbid加入
---@param seconds? number 参数 seconds
---@return boolean result 是否成功
function CloudSever:SetForbidJoin(seconds) end

---设置order数据bykey
---@param libvarid any 库变量ID
---@param Key any 键名
---@param value any 值
function CloudSever:SetOrderDataBykey(libvarid, Key, value) end

---transmitother房间
---@param playerid any 玩家ID
---@param msg any 消息
---@param notFollow any 不跟随
function CloudSever:TransmitOtherRoom(playerid, msg, notFollow) end

---transmit转换为地图
---@param playerid number | table 玩家ID
---@param mapid any 地图ID
---@param msg any 消息
---@param reportData any 参数 reportData
---@param noConfirm any 参数 noConfirm
---@param notFollow any 不跟随
---@return boolean result 是否成功
function CloudSever:TransmitToMap(playerid, mapid, msg, reportData, noConfirm, notFollow) end

---transmit转换为房间
---@param playerid number | table 玩家ID
---@param roomid string 房间ID
---@param msg any 消息
---@param notFollow any 不跟随
---@return boolean result 是否成功
function CloudSever:TransmitToRoom(playerid, roomid, msg, notFollow) end

---按键更新数据列表
---@param libvarid? any 库变量ID
---@param key any 键名
---@param callback any 回调函数
---@return boolean result 是否成功
function CloudSever:UpdateDataListByKey(libvarid, key, callback) end

---获取地图信息
---@param mapid any 地图ID
function CloudSever:__GetMapInfo(mapid) end
