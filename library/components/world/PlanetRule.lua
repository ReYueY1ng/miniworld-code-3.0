---@meta

---星球规则组件接口（内置组件 PlanetRule · 世界组件）<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/planetrule.html)
---@class PlanetRule: Component
---@field voidNightEnabled boolean 虚空之夜
PlanetRule = {}

---设置虚空之夜
---保存星球虚空之夜许可开关并写入所属World规则；不会立即开启或结束一次虚空之夜，后续天气逻辑读取该许可。
---@param value? boolean true允许虚空之夜，false禁止，默认true。
---@return boolean result boolean参数且存在World时调用设置并返回true；类型错误或无World时返回nil，无World但类型有效时仍会保存组件开关。
function PlanetRule:SetVoidNightEnabled(value) end

---获取虚空之夜
---读取组件保存的虚空之夜许可开关；不查询当前是否正处于虚空之夜，也不读取World实际天气。
---@return boolean value 属性恰为false时返回false，其他值（含nil）返回true；组件默认true。
function PlanetRule:GetVoidNightEnabled() end
