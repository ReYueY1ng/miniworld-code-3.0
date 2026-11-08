---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Status<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)
---@class Status
Status = {}

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param buffid any
---@param bufflv any
---@param customticks any
function Status:AddBuff(objid, buffid, bufflv, customticks) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Status:ClearAllBadBuff(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Status:ClearAllBuff(objid) end

---官方环境独有接口（未收录于开发环境）
---@param buff any
function Status:GetBuffCfg(buff) end

---官方环境独有接口（未收录于开发环境）
---@param buff any
function Status:GetBuffData(buff) end

---官方环境独有接口（未收录于开发环境）
---@param buffid any
function Status:GetBuffDefDesc(buffid) end

---官方环境独有接口（未收录于开发环境）
---@param buffid any
function Status:GetBuffDefLevel(buffid) end

---官方环境独有接口（未收录于开发环境）
---@param buffid any
function Status:GetBuffDefName(buffid) end

---官方环境独有接口（未收录于开发环境）
---@param buffid any
function Status:GetBuffDefTicks(buffid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param buffid any
function Status:GetBuffIndex(objid, buffid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param buffid any
function Status:GetBuffLeftTime(objid, buffid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Status:GetBuffList(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param buffid any
function Status:GetBuffName(objid, buffid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param buffid any
function Status:GetBuffNumByBuffid(objid, buffid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param buffid any
---@param bufflv any
function Status:HasBuff(objid, buffid, bufflv) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
function Status:RefreshAllBuffTick(objid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param buffid any
function Status:RemoveBuff(objid, buffid) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param buffsrc any
---@param buffsrclv any
---@param buffdst any
---@param buffdstlv any
---@param customticks any
function Status:ReplaceBuff(objid, buffsrc, buffsrclv, buffdst, buffdstlv, customticks) end

---官方环境独有接口（未收录于开发环境）
---@param objid any
---@param isForbid any
function Status:SetForbidAddBuff(objid, isForbid) end
