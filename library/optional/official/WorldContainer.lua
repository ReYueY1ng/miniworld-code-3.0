---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· WorldContainer<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---添加furnace
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@param blockid? string 方块ID
---@return boolean result 是否成功
function WorldContainer:AddFurnace(x, y, z, blockid) end

---添加storagebox
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@param blockid? string 方块ID
---@return boolean result 是否成功
function WorldContainer:AddStorageBox(x, y, z, blockid) end

---检查furnace
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@return boolean result 检查结果
function WorldContainer:CheckFurnace(x, y, z) end

---获取furnaceheatpercent
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@param lev? number 参数 lev
function WorldContainer:GetFurnaceHeatPercent(x, y, z, lev) end

---获取furnacemeltpercent
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
function WorldContainer:GetFurnaceMeltPercent(x, y, z) end

---is2sizeblock
---@param blockid any 方块ID
function WorldContainer:Is2Sizeblock(blockid) end

---移除furnace
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@return boolean result 是否成功
function WorldContainer:RemoveFurnace(x, y, z) end

---移除storagebox
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@return boolean result 是否成功
function WorldContainer:RemoveStorageBox(x, y, z) end

---设置格子属性
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param gridid number 格子ID
---@param attr number 属性
---@param value number 值
---@param worldId any 星球ID
function WorldContainer:SetGridAttr(x, y, z, gridid, attr, value, worldId) end

---设置summoner
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@param changeCD any 参数 changeCD
---@param CD any 冷却时间（秒）
---@param CDType any 冷却类型
---@return number result 结果数值
function WorldContainer:SetSummoner(x, y, z, changeCD, CD, CDType) end

---设置summoner等级
---@param x any X坐标
---@param y any Y坐标
---@param z any Z坐标
---@param level any 等级
---@return number result 结果数值
function WorldContainer:SetSummonerLevel(x, y, z, level) end
