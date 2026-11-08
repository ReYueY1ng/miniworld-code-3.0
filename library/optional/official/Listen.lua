---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Listen<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---为inner界面获取varrun数据
---@param varid any 变量ID
---@param playerid any 玩家ID
function Listen:GetVarRunDataForInnerUI(varid, playerid) end

---获取vartabcolID
---@param varid any 变量ID
---@param index any 索引
function Listen:GetVarTabColID(varid, index) end

---插入varlinsten
---@param varid any 变量ID
---@param callback any 回调函数
---@param colids table 参数 colids
---@param sync any 是否同步
---@param filtertxtcolids table 参数 filtertxtcolids
---@return boolean result 是否成功
function Listen:InsertVarLinsten(varid, callback, colids, sync, filtertxtcolids) end

---判断是否监听
---@param varid any 变量ID
---@return boolean result 是否满足条件
function Listen:IsListen(varid) end

---ongraphics参数参数变更
---@param objid any 对象ID
---@param data any 数据
function Listen:OnGraphicsParamParamChange(objid, data) end

---移除varlinsten
---@param varid any 变量ID
---@return boolean result 是否成功
function Listen:RemoveVarLinsten(varid) end

---snycgraphicsinfo2客户端
function Listen:SnycGraphicsInfo2Client() end

---varrun数据record
---@param playerId? number 玩家ID
---@param varid any 变量ID
---@param code any 参数 code
---@param value table 值
---@param index1 any 参数 index1
---@param index2 any 参数 index2
function Listen:VarRunDataRecord(playerId, varid, code, value, index1, index2) end
