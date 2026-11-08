---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Data.Array<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---清理数组中的空值，当前实现为空
---引擎侧函数体只有 return，不清理任何数据
---@param varId integer 变量ID
---@param playerId integer 玩家ID
function Data.Array:ClearNilValue(varId, playerId) end

---把数组对象转换为普通 Lua 数组
---属性数组与变量数组都会取出全部元素
---@param array table 数组对象
---@return table|userdata result 普通数组，非数组对象时原样返回
function Data.Array:ConvertNomalArray(array) end

---校验道具数组是否有效且类型匹配
---对象无效或类型不匹配时返回 nil
---变量数组分支为空，直接返回 nil
---@param data any 待校验的数组对象
---@param itemType number 道具类型
---@return userdata? data 校验通过的数组对象
function Data.Array:DealArrayData(data, itemType) end

---把标签统一转换为数组或字符串向量
---varType 不为空时不做任何转换，直接返回 nil
---空字符串标签会被丢弃
---isToC 为 false 时原样返回或包装成单元素表
---@param tags? number | string | table 标签，可为字符串、表或数组对象
---@param isToC boolean 是否转换为 C++ 字符串向量
---@param varType number 变量值类型
---@param outval any 复用的输出向量
---@return table|userdata? result 转换结果，标签为空时返回 nil
function Data.Array:DealTagToArrayData(tags, isToC, varType, outval) end
