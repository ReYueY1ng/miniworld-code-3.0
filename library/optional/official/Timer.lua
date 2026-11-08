---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Timer<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---判断是否暂停
---@param id any ID
---@return boolean result 是否满足条件
function Timer:IsPause(id) end

---判断是否playing
---@param id any ID
---@return boolean result 是否满足条件
function Timer:IsPlaying(id) end
