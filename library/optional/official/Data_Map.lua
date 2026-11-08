---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Data.Map<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param varType any
---@param data any
function Data.Map:CreateTmpMap(varType, data) end

---官方环境独有接口（未收录于开发环境）
---@param varId any
---@param playerId any
function Data.Map:GetAllValue(varId, playerId) end

---官方环境独有接口（未收录于开发环境）
---@param varId? any
---@param playerId any
---@param key any
function Data.Map:GetMapValue(varId, playerId, key) end

---官方环境独有接口（未收录于开发环境）
---@param varId any
---@param playerId any
function Data.Map:GetShowRunData(varId, playerId) end

---官方环境独有接口（未收录于开发环境）
---@param key any
function Data.Map:GetUserDataValue(key) end

---官方环境独有接口（未收录于开发环境）
---@param key any
function Data.Map:GetUserDataValueInMap(key) end

---官方环境独有接口（未收录于开发环境）
---@param varId? any
---@param playerId any
---@param key any
function Data.Map:RemoveMapValue(varId, playerId, key) end

---官方环境独有接口（未收录于开发环境）
---@param varId? any
---@param playerId any
---@param key any
---@param value any
function Data.Map:SetMapValue(varId, playerId, key, value) end

---官方环境独有接口（未收录于开发环境）
---@param key any
---@param value any
function Data.Map:SetUserDataValue(key, value) end

---官方环境独有接口（未收录于开发环境）
---@param key any
---@param value any
function Data.Map:SetUserDataValueInMap(key, value) end

---官方环境独有接口（未收录于开发环境）
---@param key any
function Data.Map:__CheckKey(key) end
