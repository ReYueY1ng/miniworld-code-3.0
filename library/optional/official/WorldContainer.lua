---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· WorldContainer<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
---@param blockid any
function WorldContainer:AddFurnace(x, y, z, blockid) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
---@param blockid any
function WorldContainer:AddStorageBox(x, y, z, blockid) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
function WorldContainer:CheckFurnace(x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
---@param lev any
function WorldContainer:GetFurnaceHeatPercent(x, y, z, lev) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
function WorldContainer:GetFurnaceMeltPercent(x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param blockid any
function WorldContainer:Is2Sizeblock(blockid) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
function WorldContainer:RemoveFurnace(x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
function WorldContainer:RemoveStorageBox(x, y, z) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
---@param gridid any
---@param attr any
---@param value any
---@param worldId any
function WorldContainer:SetGridAttr(x, y, z, gridid, attr, value, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
---@param changeCD any
---@param CD any
---@param CDType any
function WorldContainer:SetSummoner(x, y, z, changeCD, CD, CDType) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
---@param level any
function WorldContainer:SetSummonerLevel(x, y, z, level) end
