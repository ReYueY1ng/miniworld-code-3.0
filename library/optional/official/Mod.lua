---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Mod<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param objType any
---@param cfgId number
function Mod:GetAssetIdByCfg(objType, cfgId) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Mod:GetAssetIdByObjId(objid) end

---官方环境独有接口（未收录于开发环境）
---@param avatarInfo any
---@param cacheId any
---@param filename any
function Mod:GetAvatarHeadInfo(avatarInfo, cacheId, filename) end

---官方环境独有接口（未收录于开发环境）
---@param objType any
---@param cfgId number
function Mod:GetCustomAssetId(objType, cfgId) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param objType any
function Mod:GetCustomAssetIdByObjId(objid, objType) end

---官方环境独有接口（未收录于开发环境）
---@param inputId any
function Mod:GetDefIdByCfg(inputId) end

---官方环境独有接口（未收录于开发环境）
---@param wtype any
---@return boolean
function Mod:SetWeatherType(wtype) end
