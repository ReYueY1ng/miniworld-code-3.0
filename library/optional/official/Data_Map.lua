---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Data.Map<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---创建一个临时的键值表对象
---不写入玩家变量，只用于本地构造与比较
---@param varType number 变量的值类型
---@param data any 初始数据表
---@return userdata map 临时键值表对象
function Data.Map:CreateTmpMap(varType, data) end

---获取键值变量的全部内容
---变量不存在时返回 nil
---@param varId integer 变量ID
---@param playerId integer 玩家ID
---@return table? data 键值对表
function Data.Map:GetAllValue(varId, playerId) end

---读取键值变量中指定键的值
---@param varId? integer 变量ID
---@param playerId integer 玩家ID
---@param key any 键名
---@return any? value 键对应的值
function Data.Map:GetMapValue(varId, playerId, key) end

---把键值变量内容转成可显示的字符串列表
---最多输出 100 条
---表类型的值会先编码再拼接
---@param varId integer 变量ID
---@param playerId integer 玩家ID
---@return table list 形如 key=value 的字符串数组
function Data.Map:GetShowRunData(varId, playerId) end

---读取全局用户数据的指定键
---读取的是跨地图全局键值表
---@param key any 键名
---@return any? value 键对应的值
function Data.Map:GetUserDataValue(key) end

---读取当前地图内用户数据的指定键
---读取的是仅本地图有效的键值表
---@param key any 键名
---@return any? value 键对应的值
function Data.Map:GetUserDataValueInMap(key) end

---删除键值变量中的指定键
---@param varId? integer 变量ID
---@param playerId integer 玩家ID
---@param key any 键名
---@return any? result 底层删除结果
function Data.Map:RemoveMapValue(varId, playerId, key) end

---写入键值变量中指定键的值
---键名需通过 __CheckKey 校验才会写入
---@param varId? integer 变量ID
---@param playerId integer 玩家ID
---@param key any 键名
---@param value any 要写入的值
---@return any? result 底层写入结果
function Data.Map:SetMapValue(varId, playerId, key, value) end

---写入全局用户数据的指定键
---写入的是跨地图全局键值表
---@param key any 键名
---@param value any 要写入的值
---@return any? result 底层写入结果
function Data.Map:SetUserDataValue(key, value) end

---写入当前地图内用户数据的指定键
---写入的是仅本地图有效的键值表
---@param key any 键名
---@param value any 要写入的值
---@return any? result 底层写入结果
function Data.Map:SetUserDataValueInMap(key, value) end

---校验并规范化键值表的键名
---字符串键长度上限 50，且只允许字母、数字和英文符号
---数字键会被转成字符串
---@param key any 待校验的键名
---@return string? key 规范化后的键名，非法时为 nil
function Data.Map:__CheckKey(key) end
