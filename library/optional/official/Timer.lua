---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Timer<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---判断计时器是否处于暂停状态
---ID 为空或计时器管理器不存在时返回 false
---@param id any 计时器ID
---@return boolean result 是否暂停
function Timer:IsPause(id) end

---判断计时器是否正在运行
---ID 为空或计时器管理器不存在时返回 false
---@param id any 计时器ID
---@return boolean result 是否运行中
function Timer:IsPlaying(id) end
