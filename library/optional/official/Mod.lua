---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Mod<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---按配置获取assetID
---@param objType any 对象类型
---@param cfgId number 配置ID
function Mod:GetAssetIdByCfg(objType, cfgId) end

---按对象ID获取assetID
---@param objid any 对象ID
function Mod:GetAssetIdByObjId(objid) end

---获取avatarhead信息
---@param avatarInfo any 参数 avatarInfo
---@param cacheId any cacheID
---@param filename any 文件名
function Mod:GetAvatarHeadInfo(avatarInfo, cacheId, filename) end

---获取自定义assetID
---@param objType any 对象类型
---@param cfgId number 配置ID
function Mod:GetCustomAssetId(objType, cfgId) end

---按对象ID获取自定义assetID
---@param objid any 对象ID
---@param objType any 对象类型
function Mod:GetCustomAssetIdByObjId(objid, objType) end

---按配置获取defID
---@param inputId any inputID
function Mod:GetDefIdByCfg(inputId) end

---设置weather类型
---@param wtype any 参数 wtype
---@return boolean result 是否成功
function Mod:SetWeatherType(wtype) end
