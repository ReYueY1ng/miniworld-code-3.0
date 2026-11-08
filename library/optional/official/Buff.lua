---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Buff<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---把状态ID统一转换为状态配置ID
---数字ID原样返回
---@param buffid number | string 状态ID（数字配置ID或资源ID字符串）
---@return number? cfgid 状态配置ID，资源ID无法解析时为 nil
function Buff:GetBuffCfgId(buffid) end

---获取状态的默认持续 tick 数
---@param buffid number | string 状态ID（数字配置ID或资源ID字符串）
---@return number? ticks 默认持续 tick 数，失败时为 nil
function Buff:GetBuffDefTicks(buffid) end

---把状态ID拆分为基础状态ID和等级
---自定义状态直接返回配置ID和等级 1
---普通状态按 ID/1000 取整和 ID%1000 拆分
---@param buffid number | string 状态ID（数字配置ID或资源ID字符串）
---@return number buffid 状态配置ID
---@return number lv 状态等级
function Buff:GetBuffIdAndLv(buffid) end

---获取对象身上指定状态的名称
---@param objid number 对象ID
---@param buffid number | string 状态ID（可带等级）
---@return string? name 状态名称，对象未携带该状态时为 nil
function Buff:GetBuffName(objid, buffid) end

---获取状态对应的基础状态ID
---普通状态取 ID/1000 去掉等级部分
---自定义状态返回自身ID
---@param buffid number | string 状态ID（数字配置ID或资源ID字符串）
---@return number? buffid 基础状态ID，无法解析时为 nil
function Buff:GetToCBuffId(buffid) end

---刷新对象身上全部状态的 tick 计时
---仅对拥有生物属性的角色生效
---@param objid integer 对象ID
---@return boolean result 是否刷新成功
function Buff:RefreshAllBuffTick(objid) end
