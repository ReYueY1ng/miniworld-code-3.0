---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Listen<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---获取变量的运行数据供内置界面使用
---变量未被监听时返回 nil
---@param varid integer 变量ID
---@param playerid integer 玩家ID，该玩家无数据时回退到 0 号数据
---@return table? data 运行数据；表类型变量会把列索引映射为列ID
function Listen:GetVarRunDataForInnerUI(varid, playerid) end

---获取表变量指定列的列ID
---变量未监听时取到 nil 索引会直接报错
---@param varid integer 变量ID
---@param index number 列序号
---@return number colid 列ID
function Listen:GetVarTabColID(varid, index) end

---注册变量监听并回放缓存消息
---同一回调重复注册不会重复添加
---注册时会先回放该变量在缓存池中的消息
---code：0 删除，1 新增，2 修改，3 全量
---@param varid integer 变量ID
---@param callback function 变更回调，参数为 code、value、row、col
---@param colids table 需要监听的列ID数组，省略表示监听整个变量
---@param sync any 是否同步到客户端
---@param filtertxtcolids table 需要过滤敏感词的列ID数组
---@return boolean result 是否注册成功
function Listen:InsertVarLinsten(varid, callback, colids, sync, filtertxtcolids) end

---判断变量是否已被监听
---监听整表时只返回 true，不返回列信息
---@param varid integer 变量ID
---@return boolean? result 是否已监听，未监听时无返回值
---@return table? colids 已监听的列信息
function Listen:IsListen(varid) end

---响应图形参数变更并刷新界面
---由图形监听回调内部调用
---@param objid integer 对象ID
---@param data any 变更数据，data[1] 为字符串时更新文本，为数字时更新进度
function Listen:OnGraphicsParamParamChange(objid, data) end

---注销变量监听
---@param varid integer 变量ID
---@return boolean result 是否存在并移除成功
function Listen:RemoveVarLinsten(varid) end

---把图形信息同步给客户端
---直接转调 Service.Graphics 的同名方法
function Listen:SnycGraphicsInfo2Client() end

---记录并分发变量运行数据变更
---变量尚未监听时消息先进入缓存池，注册监听后回放
---列级监听会对 filtertxtcolids 中的列做敏感词过滤
---@param playerId? number 玩家ID，默认 0 表示公共数据
---@param varid integer 变量ID
---@param code any 变更类型：0 删除，1 新增，2 修改，3 全量
---@param value table 变更值
---@param index1 any 行索引
---@param index2 any 列索引
function Listen:VarRunDataRecord(playerId, varid, code, value, index1, index2) end
