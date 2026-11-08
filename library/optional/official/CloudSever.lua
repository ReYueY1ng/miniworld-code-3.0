---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· CloudSever<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param libvarid any
---@param key any
---@param value any
function CloudSever:AutomaticByKey(libvarid, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param libvarid any
function CloudSever:CheckVarable(libvarid) end

---官方环境独有接口（未收录于开发环境）
---@param libvarid any
function CloudSever:ClearDataList(libvarid) end

---官方环境独有接口（未收录于开发环境）
---@param libvarid any
function CloudSever:ClearList(libvarid) end

---官方环境独有接口（未收录于开发环境）
---@param libvarid any
function CloudSever:ClearOrderData(libvarid) end

---官方环境独有接口（未收录于开发环境）
---@param countdown any
---@param msg any
function CloudSever:CloseCurRoom(countdown, msg) end

---官方环境独有接口（未收录于开发环境）
---@param libvar any
---@param index any
---@param eventname any
---@param globaldata any
function CloudSever:GetAnyValueByIndex(libvar, index, eventname, globaldata) end

---官方环境独有接口（未收录于开发环境）
---@param libvarid any
---@param key any
---@param eventname any
---@param globaldata any
function CloudSever:GetAnyValueByKey(libvarid, key, eventname, globaldata) end

---官方环境独有接口（未收录于开发环境）
---@param libvarid any
---@param key any
---@param callback any
function CloudSever:GetOrderDataByKey(libvarid, key, callback) end

---官方环境独有接口（未收录于开发环境）
---@param libvarid any
---@param icount any
---@param callback any
function CloudSever:GetOrderDataIndexArea(libvarid, icount, callback) end

---官方环境独有接口（未收录于开发环境）
---@param libvarid any
---@param index any
---@param callback any
function CloudSever:GetOrderDataIndexValue(libvarid, index, callback) end

---官方环境独有接口（未收录于开发环境）
---@param libvarid any
---@param icount any
---@param minvalue any
---@param maxvalue any
---@param callback any
function CloudSever:GetOrderDataValueArea(libvarid, icount, minvalue, maxvalue, callback) end

---官方环境独有接口（未收录于开发环境）
---@param players any
---@param msg any
function CloudSever:NotifyPlayerTransmitMsg(players, msg) end

---官方环境独有接口（未收录于开发环境）
---@param libvarid any
---@param key any
function CloudSever:RemoveDataListByKey(libvarid, key) end

---官方环境独有接口（未收录于开发环境）
---@param libvarid any
---@param key any
function CloudSever:RemoveDataListValue(libvarid, key) end

---官方环境独有接口（未收录于开发环境）
---@param libvarid any
---@param key any
function CloudSever:RemoveOrderDataByKey(libvarid, key) end

---官方环境独有接口（未收录于开发环境）
---**调用限制**: 仅白名单用户可用
---@param msg any
---@param customdata any
---@param roomids any
function CloudSever:SendSeverMsg(msg, customdata, roomids) end

---官方环境独有接口（未收录于开发环境）
---@param seconds any
function CloudSever:SetForbidJoin(seconds) end

---官方环境独有接口（未收录于开发环境）
---@param libvarid any
---@param Key any
---@param value any
function CloudSever:SetOrderDataBykey(libvarid, Key, value) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param msg any
---@param notFollow any
function CloudSever:TransmitOtherRoom(playerid, msg, notFollow) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param mapid any
---@param msg any
---@param reportData any
---@param noConfirm any
---@param notFollow any
function CloudSever:TransmitToMap(playerid, mapid, msg, reportData, noConfirm, notFollow) end

---官方环境独有接口（未收录于开发环境）
---@param playerid any
---@param roomid any
---@param msg any
---@param notFollow any
function CloudSever:TransmitToRoom(playerid, roomid, msg, notFollow) end

---官方环境独有接口（未收录于开发环境）
---@param libvarid any
---@param key any
---@param callback any
function CloudSever:UpdateDataListByKey(libvarid, key, callback) end

---官方环境独有接口（未收录于开发环境）
---@param mapid any
function CloudSever:__GetMapInfo(mapid) end
