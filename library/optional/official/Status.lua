---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Status<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class Status
Status = {}

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param buffid? string
---@param bufflv? number
---@param customticks? number
---@return boolean
function Status:AddBuff(objid, buffid, bufflv, customticks) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Status:ClearAllBadBuff(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Status:ClearAllBuff(objid) end

---官方环境独有接口（未收录于开发环境）
---@param buff any
function Status:GetBuffCfg(buff) end

---官方环境独有接口（未收录于开发环境）
---@param buff? string
---@return boolean
function Status:GetBuffData(buff) end

---官方环境独有接口（未收录于开发环境）
---@param buffid? string
function Status:GetBuffDefDesc(buffid) end

---官方环境独有接口（未收录于开发环境）
---@param buffid? string
function Status:GetBuffDefLevel(buffid) end

---官方环境独有接口（未收录于开发环境）
---@param buffid? string
function Status:GetBuffDefName(buffid) end

---官方环境独有接口（未收录于开发环境）
---@param buffid? string
function Status:GetBuffDefTicks(buffid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param buffid? string
function Status:GetBuffIndex(objid, buffid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param buffid? string
function Status:GetBuffLeftTime(objid, buffid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Status:GetBuffList(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param buffid? string
function Status:GetBuffName(objid, buffid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param buffid? string
function Status:GetBuffNumByBuffid(objid, buffid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param buffid? string
---@param bufflv? number
---@return boolean
function Status:HasBuff(objid, buffid, bufflv) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@return boolean
function Status:RefreshAllBuffTick(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param buffid? string
---@return boolean
function Status:RemoveBuff(objid, buffid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param buffsrc any
---@param buffsrclv any
---@param buffdst any
---@param buffdstlv any
---@param customticks any
---@return boolean
function Status:ReplaceBuff(objid, buffsrc, buffsrclv, buffdst, buffdstlv, customticks) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param isForbid any
---@return boolean
function Status:SetForbidAddBuff(objid, isForbid) end
