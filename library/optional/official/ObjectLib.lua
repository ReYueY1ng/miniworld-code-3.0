---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· ObjectLib<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class ObjectLib
ObjectLib = {}

---获取区域库对象的数据
---@param libobjid integer 库对象ID
---@return table? data 区域数据表，失败时为 nil
function ObjectLib:GetAreaData(libobjid) end

---获取道具库对象的数据
---引擎实现调用 getLivingData，返回内容与 GetLivingData 相同
---@param libobjid integer 库对象ID
---@return table? data 道具数据表，失败时为 nil
function ObjectLib:GetItemData(libobjid) end

---获取生物库对象的数据
---@param libobjid integer 库对象ID
---@return table? data 生物数据表，失败时为 nil
function ObjectLib:GetLivingData(libobjid) end

---获取位置库对象的数据
---@param libobjid integer 库对象ID
---@return table? data 位置数据表，失败时为 nil
function ObjectLib:GetPositionData(libobjid) end
