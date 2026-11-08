---@meta

---星球基础环境组件接口（内置组件 PlanetBaseEnvSetting）<br>[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/planetbaseenvsetting.html)
---@class PlanetBaseEnvSetting: Component
PlanetBaseEnvSetting = {}

---设置重力
---保存星球重力倍率并调用所属World的重力设置；不会把脚本输入截断到编辑器0.1至10范围。底层拒绝负值，但本方法仍可能保存负值并返回true。
---@param value? Mini.Number 重力倍率，默认0.6；有效值大于等于0。
---@return Mini.Bool number参数且存在World.SetGravityFactor时返回true，仅表示已调用底层；参数类型错误或依赖缺失返回false。World缺失时数值仍已保存，负值被底层拒绝时也可能返回true。
function PlanetBaseEnvSetting:SetGravity(value) end

---获取重力
---读取组件保存的重力倍率，不向World查询当前实际重力。
---@return Mini.Number 返回组件gravity数值，默认0.6；可能与World最终采用的重力不同，例如之前写入被底层拒绝或覆盖受来源优先级限制。
function PlanetBaseEnvSetting:GetGravity() end

---设置天气组天气
---设置星球全局天气规则或指定地形组天气；0组仅更新全局规则与组件属性，其他组调用World天气管理器，不把一次调用视作天气已经切换成功。
---@param groupid Mini.Number 天气组ID，见WeatherGroup（0～9）。
---@param weatherid Mini.Number 天气ID，见WeatherType（0～11），0为随机天气。
---@return Mini.Bool 参数为number、天气非负且存在所需World接口时返回true；参数无效或无World返回false。true不确认天气组存在或切换结果；0组无World时也已保存weather属性。
function PlanetBaseEnvSetting:SetGroupWeather(groupid, weatherid) end

---获取天气组天气
---查询天气组：0组返回组件保存的全局天气规则，其他组向所属World读取当前组天气；这两条路径的值分别表示规则与当前天气。
---@param groupid Mini.Number 天气组ID，见WeatherGroup（0～9）。
---@return Mini.Number 0组返回组件weather（默认0随机）；其他组返回World查询结果，缺少环境或指定组不存在时底层回退1晴天；参数非number或非0组无World时返回nil。
function PlanetBaseEnvSetting:GetGroupWeather(groupid) end
