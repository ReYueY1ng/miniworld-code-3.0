---@meta

---星球环境组件接口（内置组件 PlanetEnvironmentSetting）<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/planetenvironmentsetting.html)
---@class PlanetEnvironmentSetting: Component
PlanetEnvironmentSetting = {}

---设置天空盒模板
---保存天空盒模板；仅当当前主玩家位于本星球且World存在时更新全局环境并请求刷新。模板读取、资源加载和最终显示不作为返回成功条件。
---@param value? Mini.SkyBox 天空盒模板索引或环境资源ID，默认0。
---@param forceRefresh any （wiki 未声明类型，此处用 any）
---@return Mini.Bool result 参数是number或string并写入属性后返回true，非当前星球或无World也为true；其他类型返回false。true不表示模板有效、资源加载成功或渲染完成。
function PlanetEnvironmentSetting:SetSkybox(value, forceRefresh) end

---设置天空盒贴图
---按贴图类型保存星球天空盒覆盖图片，当前星球存在环境接口时立即请求应用；同一类型覆盖旧配置，返回值不验证图片解析或加载结果。
---@param itype Mini.Number 贴图类型：1天空、2太阳、3月亮。
---@param value Mini.String 图片资源编码（类型_ID等），兼容数值图片ID。
---@return Mini.Bool result 贴图类型通过范围校验且图片为string或number，保存后返回true；校验失败返回false。非当前星球、接口缺失、空字符串或资源解析/加载失败仍可能为true。
function PlanetEnvironmentSetting:SetSkyBoxMap(itype, value) end

---设置天空盒颜色
---按时间节点与颜色类型保存天空盒颜色覆盖配置；当前星球才尝试应用，并可能开启自定义天空。颜色alpha仅保存在配置中，当前应用链只使用RGB。
---@param timeNode Mini.Number 小时节点0/4/6/8/12/16/18/20/24，>24为全部。
---@param itype Mini.Number 颜色类型，见SkyboxColor（1～12）。
---@param value? Mini.Color Mini.Color，RGB通常0～255、a默认255；兼容0xRRGGBB。
---@return Mini.Bool result 参数通过校验并保存覆盖配置返回true；校验不通过返回false。非当前星球、环境接口缺失或时间节点无效仍可能返回true，不代表已显示。 颜色无法解析时返回false；传入不可索引的错误类型可能抛Lua错误，不能当作false分支。
function PlanetEnvironmentSetting:SetSkyBoxColor(timeNode, itype, value) end

---设置天空盒属性
---按时间节点和属性类型保存天空盒数值覆盖，当前星球才尝试应用；可能开启自定义天空。属性9模板虽通过校验，但当前下游没有执行分支，不能依此切换模板。
---@param timeNode Mini.Number 小时节点0/4/6/8/12/16/18/20/24，>24为全部。
---@param itype Mini.Number 属性类型，见SkyboxAttr（1～14）；9模板仅保存。
---@param value Mini.Number 属性值；10水透明度0透明/100不透明，11水镜面度用百分值。
---@return Mini.Bool result 参数通过校验并保存覆盖配置返回true；校验不通过返回false。非当前星球、环境接口缺失或时间节点无效仍可能返回true，不代表已显示。 属性9虽被保存但下游无执行分支。
function PlanetEnvironmentSetting:SetSkyBoxAttr(timeNode, itype, value) end

---设置天空盒属性(不带时间)
---保存不随时间节点变化的整体金属度或粗糙度覆盖；同一属性覆盖旧值，当前星球且环境接口存在时请求应用到全局材质参数，可能开启自定义天空。
---@param itype Mini.Number 1整体金属度、2整体粗糙度（SkyboxAttrNoTime）。
---@param value Mini.Number 材质强度标量，可传数值或数值字符串。
---@return Mini.Bool result 类型/范围校验与数值转换通过并保存后返回true，失败返回false；非当前星球或环境接口缺失时仍返回true，不确认全局材质已更新。
function PlanetEnvironmentSetting:SetSkyBoxAttrWithNoTime(itype, value) end

---设置天空盒开关
---按时间节点保存星球天空盒雾开关覆盖；当前星球才尝试应用，可能开启自定义天空；不改变其他天空盒开关。
---@param timeNode Mini.Number 小时节点0/4/6/8/12/16/18/20/24，>24为全部。
---@param itype Mini.Number 雾开关类型，SkyboxSwitch.Fogenable（1）。
---@param value Mini.Bool true开雾，false关雾。
---@return Mini.Bool result 参数通过校验并保存覆盖配置返回true；校验不通过返回false。非当前星球、环境接口缺失或时间节点无效仍可能返回true，不代表已显示。
function PlanetEnvironmentSetting:SetSkyBoxSwitch(timeNode, itype, value) end
