---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· ObjectLib<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class ObjectLib
ObjectLib = {}

---获取区域数据
---@param libobjid any 库对象ID
function ObjectLib:GetAreaData(libobjid) end

---获取道具数据
---@param libobjid any 库对象ID
function ObjectLib:GetItemData(libobjid) end

---获取living数据
---@param libobjid any 库对象ID
function ObjectLib:GetLivingData(libobjid) end

---获取位置数据
---@param libobjid any 库对象ID
function ObjectLib:GetPositionData(libobjid) end
