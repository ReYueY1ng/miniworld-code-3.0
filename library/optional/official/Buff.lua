---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Buff<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---获取状态配置ID
---@param buffid number | string 状态ID
function Buff:GetBuffCfgId(buffid) end

---获取状态defticks
---@param buffid any 状态ID
function Buff:GetBuffDefTicks(buffid) end

---获取状态IDandlv
---@param buffid any 状态ID
function Buff:GetBuffIdAndLv(buffid) end

---获取状态名称
---@param objid number 对象ID
---@param buffid any 状态ID
function Buff:GetBuffName(objid, buffid) end

---获取转换为c状态ID
---@param buffid any 状态ID
function Buff:GetToCBuffId(buffid) end

---刷新全部状态tick
---@param objid any 对象ID
---@return boolean result 是否成功
function Buff:RefreshAllBuffTick(objid) end
