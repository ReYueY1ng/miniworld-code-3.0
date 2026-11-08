---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Listen<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param varid any
---@param playerid any
function Listen:GetVarRunDataForInnerUI(varid, playerid) end

---官方环境独有接口（未收录于开发环境）
---@param varid any
---@param index any
function Listen:GetVarTabColID(varid, index) end

---官方环境独有接口（未收录于开发环境）
---@param varid any
---@param callback any
---@param colids any
---@param sync any
---@param filtertxtcolids any
function Listen:InsertVarLinsten(varid, callback, colids, sync, filtertxtcolids) end

---官方环境独有接口（未收录于开发环境）
---@param varid any
function Listen:IsListen(varid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param data any
function Listen:OnGraphicsParamParamChange(objid, data) end

---官方环境独有接口（未收录于开发环境）
---@param varid any
function Listen:RemoveVarLinsten(varid) end

---官方环境独有接口（未收录于开发环境）
function Listen:SnycGraphicsInfo2Client() end

---官方环境独有接口（未收录于开发环境）
---@param playerId any
---@param varid any
---@param code any
---@param value any
---@param index1 any
---@param index2 any
function Listen:VarRunDataRecord(playerId, varid, code, value, index1, index2) end
