---@meta

---普通变量数据管理接口<br>
---数量限制: <br>
---全局变量 300<br>
---玩家变量 300<br>
---玩家云变量 100<br>
---单玩家总存储大小限制: 64KB<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/data.html)
---@class Data
Data = {}

---设置变量值
---@param varId string 变量ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value any 设置的值
---@return boolean result
function Data:SetValue(varId, playerId, value) end

---获取变量值
---@param varId string 变量ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@return any value 返回值
function Data:GetValue(varId, playerId) end

---数值变量增加值
---@param varId string 变量ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value number 设置的值
---@return number value 返回值
function Data:IncreasesValue(varId, playerId, value) end

---打包蓝图数据
---@param varId string 变量ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param x number 起始X坐标
---@param y number 起始Y坐标
---@param z number 起始Z坐标
---@param x2 number 结束X坐标
---@param y2 number 结束Y坐标
---@param z2 number 结束Z坐标
---@return any value 蓝图数据
function Data:DoPackBluePrint(varId, playerId, x, y, z, x2, y2, z2) end

---数组变量数据管理接口
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/array.html)
---@class Data.Array
Data.Array = {}

---设置组对应索引的值，索引值不允许大于数组当前大小
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value any 具体值
---@param index integer 索引
---@return boolean result
function Data.Array:SetValue(varId, playerId, value, index) end

---插入数据到数组，index为空就加到最后
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value any 具体值
---@param index? integer 索引
---@return boolean result
function Data.Array:InsertValue(varId, playerId, value, index) end

---替换组中的值
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param newvalue any 具体值
---@param oldvalue any 具体值
---@return boolean result
function Data.Array:ReplaceValue(varId, playerId, newvalue, oldvalue) end

---获取对应索引数据
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param index integer 索引
---@return any value 返回值
function Data.Array:GetValue(varId, playerId, index) end

---获取数据对应索引
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value any 具体值
---@return integer index 索引
function Data.Array:GetIndexByValue(varId, playerId, value) end

---删除数组中该值的所有数据
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value any 具体值
---@return boolean result
function Data.Array:RemoveByValue(varId, playerId, value) end

---删除索引的值
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param index integer 索引
---@return boolean result
function Data.Array:Remove(varId, playerId, index) end

---清理数组数据
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@return boolean result
function Data.Array:Clear(varId, playerId) end

---数组排序
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param isUp SortType 排序方式
---@return boolean result
function Data.Array:Sort(varId, playerId, isUp) end

---获取数组长度
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@return integer num 数量
function Data.Array:GetSize(varId, playerId) end

---获取数组所有数据
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@return table array 数组
function Data.Array:GetAllValue(varId, playerId) end

---获取数组最大值
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@return number max 数值
function Data.Array:GetMax(varId, playerId) end

---获取数组最小值
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@return number min 数值
function Data.Array:GetMin(varId, playerId) end

---获取数组随机值
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@return number min 数值
function Data.Array:RandomValue(varId, playerId) end

---组是否有值
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value any 具体值
---@return boolean result
function Data.Array:HasValue(varId, playerId, value) end

---任意组索引是否有任意值
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param index integer 索引
---@return boolean result
function Data.Array:HasValueByNo(varId, playerId, index) end

---组合并
---@param varId string 被合并的组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param index integer 索引
---@param mergevarId string 合并组ID
---@param mergeplayerId integer? 玩家ID（全局变量传nil）
---@return boolean result
function Data.Array:InsertValues(varId, playerId, index, mergevarId, mergeplayerId) end

---删除组中对应组的值
---@param varId string 被删除的组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param removevarId string 删除组ID
---@param removeplayerId integer? 玩家ID（全局变量传nil）
---@return boolean result
function Data.Array:RemoveByValues(varId, playerId, removevarId, removeplayerId) end

---获取任意组种任意值的数量
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value any 具体值
---@return integer num 数量
function Data.Array:GetCountByValue(varId, playerId, value) end

---数值组指定索引值增加指定值
---@param varId string 组ID
---@param playerId integer? 玩家ID（全局变量传nil）
---@param value number 数值
---@param index integer 索引
---@return boolean result
function Data.Array:IncreasesValue(varId, playerId, value, index) end

---创建临时数组
---@param varType integer 数组类型
---@param data table 数据
---@return integer tmpArrayId 临时数组ID
function Data.Array:CreateTmpArray(varType, data) end

---检查两个标签数组是否有交集
---@param strsA string[] 标签数组A
---@param mathcmode integer 匹配模式
---@param strsB string[] 标签数组B
---@param bexactmatch boolean 是否精确匹配
---@return boolean result 是否有交集
function Data.Array:HasIntersectionByTags(strsA, mathcmode, strsB, bexactmatch) end

---二维表变量数据管理接口<br>
---最大行数: 1999 最大列数: 50<br>
---导入限制: 全局变量 512KB 玩家变量 102.4KB<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/table.html)
---@class Data.Table
Data.Table = {}

---更新整个表的数据信息（支持字符串键名或数字索引）
---@param varId string 表ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param value {[string | integer]: any}[] 表内的值（如 {{name="test", value=1}} 或 {{1, 2}}）
---@return boolean result
function Data.Table:UpdateAllValue(varId, playerId, value) end

---清理表格数据
---@param varId string 表ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@return boolean result
function Data.Table:Clear(varId, playerId) end

---在末尾插入一行数据
---@param varId string 表ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param ... any 按照列顺序编写的值 中间值不能传nil
function Data.Table:InsertValue(varId, playerId, ...) end

---在某行插入一行数据（value只支持数字索引数组，不支持字符串键名）
---@param varId string 表ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param value any[] 插入的值（按列顺序的数组，如 {value1, value2, value3}）
---@param row? integer 行索引（空值则为最后一行）
---@return boolean result
function Data.Table:InsertValueByRow(varId, playerId, value, row) end

---获取表格数据
---@param varId string 表ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param row integer 行索引
---@param col integer | string 列索引或列名
---@return any value 返回值
function Data.Table:GetValue(varId, playerId, row, col) end

---获取表格全部数据
---@param varId string 表ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@return table[] table 表格
function Data.Table:GetAllValue(varId, playerId) end

---设置表格数据
---@param varId string 表ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param row integer | integer[] 行索引或行索引数组
---@param col integer | string 列索引或列名
---@param value any 设置的值
---@return boolean result
function Data.Table:SetValue(varId, playerId, row, col, value) end

---删除某行全部数据
---@param varId string 表ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param row integer | integer[] 行索引或行索引数组
---@return boolean result
function Data.Table:RemoveRow(varId, playerId, row) end

---获取某列的所有值
---@param varId string 表ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param col integer | string 列索引或列名
---@return any[] values 某列的所有值
function Data.Table:GetValuesByCol(varId, playerId, col) end

---获取行数
---@param varId string 表ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@return integer size 行数
function Data.Table:GetRows(varId, playerId) end

---获取列数
---@param varId string 表ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@return integer size 列数
function Data.Table:GetCols(varId, playerId) end

---获取列索引
---@param varId string 表ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param colname string 列名
function Data.Table:GetColIndex(varId, playerId, colname) end

---获取指定列和值的行索引（默认判断值相等）
---@param varId string 表ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param col integer | string 列索引或列名
---@param value any 查询的值
---@param cmp fun(a: any, value: any)? 筛选函数（可为nil，默认 a == value）
---@return integer row 行索引
function Data.Table:GetRowIndex(varId, playerId, col, value, cmp) end

---获取指定列和值的所有行索引（默认判断值相等）
---@param varId string 表ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param col integer | string 列索引或列名
---@param value any 查询的值
---@param cmp fun(a: any, value: any)? 筛选函数（可为nil，默认 a == value）
---@return integer[] rows 行索引
function Data.Table:GetRowIndexs(varId, playerId, col, value, cmp) end

---获取表格列的key
---@param varId string 表ID
---@return string[] colKeys 列的key
function Data.Table:GetTableColKeys(varId) end

---一维(kv)表/排行榜 变量数据管理接口<br>
---非全局云变量建议使用阻塞接口<br>
---本地变量没有请求限制<br>
---数量限制: <br>
---全局云排行榜变量: 15<br>
---全局云KV表变量: 10<br>
---存储限制: <br>
---本地排行榜: 100<br>
---云排行榜: 1000, 每次最多获取 100 名<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/map.html)
---@class Data.Map
Data.Map = {}

---@alias KVValue string | number | boolean | table
---@alias KVCallBack fun(code: ErrorCode, key: string, value: KVValue)

---回调设置kv数据
---@param varId string kv表/排行榜变量ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param key number | string 键值（数值key会转换成字符串）
---@param value KVValue 具体值
---@param callback KVCallBack 回调函数
---@return boolean result
function Data.Map:SetValueAndCallBack(varId, playerId, key, value, callback) end

---阻塞设置kv数据
---@param varId string kv表/排行榜变量ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param key number | string 键值（数值key会转换成字符串）
---@param value KVValue 具体值
---@return ErrorCode code 错误码（ErrorCode）
---@return string key 键值
---@return KVValue value 具体值
function Data.Map:SetValueAndBlock(varId, playerId, key, value) end

---回调删除指定key的数据
---@param varId string kv表/排行榜变量ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param key number | string 键值（数值key会转换成字符串）
---@param callback fun(code: integer, key: string) 回调函数
---@return boolean result
function Data.Map:RemoveValueAndCallBack(varId, playerId, key, callback) end

---阻塞删除指定key的数据
---@param varId string kv表/排行榜变量ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param key number | string 键值（数值key会转换成字符串）
---@return ErrorCode code 错误码（ErrorCode）
---@return string key 键值
function Data.Map:RemoveValueAndBlock(varId, playerId, key) end

---回调更新指定key的数据 全局云KV变量可用
---@param varId string kv表变量ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param key number | string 键值（数值key会转换成字符串）
---@param callback KVCallBack 回调函数
---@return boolean result
function Data.Map:UpdateValueAndCallback(varId, playerId, key, callback) end

---回调获取kv数据
---@param varId string kv表/排行榜变量ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param key number | string 键值（数值key会转换成字符串）
---@param callback KVCallBack 回调函数
---@return boolean result
function Data.Map:GetValueAndCallBack(varId, playerId, key, callback) end

---阻塞获取kv数据
---@param varId string kv表/排行榜变量ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param key number | string 键值（数值key会转换成字符串）
---@return ErrorCode code 错误码（ErrorCode）
---@return string key 键值
---@return KVValue value 具体值
function Data.Map:GetValueAndBlock(varId, playerId, key) end

---回调获取排行榜指定排名索引的值
---@param varId string 排行榜变量ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param index integer 排名索引
---@param ascending boolean 是否升序
---@param callback fun(code: integer, key: string, value: number, index: integer, ascending: boolean, extendinfo: KVValue) 回调函数
---@return boolean result
function Data.Map:GetIndexValueAndCallback(varId, playerId, index, ascending, callback) end

---阻塞获取排行榜指定排名索引的值
---@param varId string 排行榜变量ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param index integer 排名索引
---@param ascending boolean 是否升序
---@return ErrorCode code 错误码（ErrorCode）
---@return string key 键值
---@return number value 数值
---@return integer index 排名索引
---@return boolean ascending 是否升序
---@return KVValue extendinfo 附带信息
function Data.Map:GetIndexValueAndBlock(varId, playerId, index, ascending) end

---回调获取排行榜指定前num个值
---@param varId string 排行榜变量ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param num integer 数量
---@param ascending boolean 是否升序
---@param callback fun(code: ErrorCode, num: integer, ascending: boolean, datas: {k: string, v: number, info: KVValue}[]) 回调函数
---@return boolean result
function Data.Map:GetNumValuesAndCallback(varId, playerId, num, ascending, callback) end

---回调获取排行榜值为min~max区间的所有值
---@param varId string 排行榜变量ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param min number 最小值
---@param max number 最大值
---@param ascending boolean 是否升序
---@param pagesize integer 单次返回数量
---@param callback fun(code: ErrorCode, min: integer, max: integer, ascending: boolean, datas: {k: string, v: number, info: KVValue}[]) 回调函数
---@return boolean result
function Data.Map:GetRangeValuesAndCallback(varId, playerId, min, max, ascending, pagesize, callback) end

---阻塞设置排行榜的值
---@param varId string 排行榜变量ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param key string | number 键值（小数会向下取整，科学计数法会返回失败）
---@param value number 数值
---@param extendinfo KVValue 附带信息（附带信息只会更新不会删除，如果需要删除请使用 RemoveValueAndBlock / RemoveValueAndCallBack）
---@return ErrorCode code 错误码（ErrorCode）
---@return string key 键值
---@return number value 数值
function Data.Map:SetRankValueAndBlock(varId, playerId, key, value, extendinfo) end

---清空kv表/排行榜
---@param varId string 排行榜变量ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@return boolean result
function Data.Map:ClearData(varId, playerId) end

---阻塞增加排行榜的值
---@param varId string 排行榜变量ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param key string | number 键值（小数会向下取整，科学计数法会返回失败）
---@param value number 数值
---@param extendinfo KVValue 附带信息（附带信息只会更新不会删除，如果需要删除请使用 RemoveValueAndBlock / RemoveValueAndCallBack）
---@return ErrorCode code 错误码（ErrorCode）
---@return string key 键值
---@return number value 数值
function Data.Map:IncreasesRankValueAndBlock(varId, playerId, key, value, extendinfo) end

---回调增加排行榜的值
---@param varId string 排行榜变量ID
---@param playerId? integer 玩家uin（全局变量传nil）
---@param key string | number 键值（小数会向下取整，科学计数法会返回失败）
---@param value number 数值
---@param extendinfo KVValue 附带信息（附带信息只会更新不会删除，如果需要删除请使用 RemoveValueAndBlock / RemoveValueAndCallBack）
---@param callback fun(code: ErrorCode, key: string) 回调函数
---@return boolean result
function Data.Map:IncreasesRankValueAndCallback(varId, playerId, key, value, extendinfo, callback) end

---回调获取排行榜排名为min~max区间的所有值
---@param varId string 排行榜变量ID
---@param playerId integer? 玩家uin（全局变量传nil）
---@param min integer 最小排名
---@param max integer 最大排名
---@param ascending boolean 是否升序
---@param callback fun(code: ErrorCode, min: integer, max: integer, ascending: boolean, datas: {k: string, v: number, info: KVValue}[]) 回调函数
---@return boolean result
function Data.Map:GetRangeIndexsAndCallback(varId, playerId, min, max, ascending, callback) end
