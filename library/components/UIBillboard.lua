---@meta

---显示板组件接口（内置组件 UIBillboard）<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/uibillboard.html)
---@class UIBillboard: Component
UIBillboard = {}

---设置显示状态
---设置默认显示状态，已启动时请求刷新表现；最终是否可见还受编辑器隐藏、显示距离和面板就绪状态影响。
---@param visible Mini.Bool 是否显示，true显示、false隐藏。
---@return Mini.Bool result 参数为 boolean 并写入 defaultVisible 时返回 true；否则返回 false。
function UIBillboard:SetVisible(visible) end

---是否可见
---查询 defaultVisible 与编辑器隐藏标记组合出的逻辑可见状态，不检查面板创建结果或摄像机距离。
---@return Mini.Bool result defaultVisible 不为 false 且未被编辑器隐藏时返回 true，否则返回 false。
function UIBillboard:IsVisible() end

---获取显示板类型
---读取当前 contentType 属性，不进行类型切换或面板创建。
---@return Mini.Number value 原样返回 contentType；正常枚举为 0 图片、1 文字、2 进度条、3 自定义界面。
function UIBillboard:GetType() end

---获取显示板界面
---读取界面类型显示板绑定的非空 UI 工程 ID，不检查工程资源是否存在或界面是否已创建。
---@return Mini.String value contentType 为 Interface（3）且 uiProjectId 为非空字符串时返回该字符串；其他情况返回 nil。
function UIBillboard:GetInterface() end

---设置宽度
---设置显示板宽度属性，数值截断到 0～200 米；提交 Host 的显示尺寸换算后四舍五入到厘米，最小为 1 厘米，已启动时请求刷新。
---@param state Mini.Number 宽度（米），0～200，超范围截断。
---@return Mini.Bool result 写入属性并请求刷新时返回 true；参数不是 number 时返回 false，不代表面板已创建或最终显示成功。
function UIBillboard:SetWidth(state) end

---设置高度
---设置显示板高度属性，数值截断到 0～200 米；提交 Host 的显示尺寸换算后四舍五入到厘米，最小为 1 厘米，已启动时请求刷新。
---@param state Mini.Number 高度（米），0～200，超范围截断。
---@return Mini.Bool result 写入属性并请求刷新时返回 true；参数不是 number 时返回 false，不代表面板已创建或最终显示成功。
function UIBillboard:SetHeight(state) end

---设置底板不透明度
---设置底板不透明度并请求刷新表现；数值截断到 0～100，0 为透明，100 为不透明。
---@param state Mini.Number 底板不透明度（%），0～100，超范围截断。
---@return Mini.Bool result 写入属性并请求刷新时返回 true；参数不是 number 时返回 false，不代表面板已创建或最终显示成功。
function UIBillboard:SetBackgroundOpacity(state) end

---设置整体不透明度
---设置显示板整体不透明度并请求刷新表现；数值截断到 0～100，0 为透明，100 为不透明。
---@param state Mini.Number 整体不透明度（%），0～100，超范围截断。
---@return Mini.Bool result 写入属性并请求刷新时返回 true；参数不是 number 时返回 false，不代表面板已创建或最终显示成功。
function UIBillboard:SetOverallOpacity(state) end

---平滑改变显示板属性
---按线性动画修改整体不透明度、底板不透明度或自发光强度；先记录截断后的目标值，同一属性的新调用替换旧动画。
---@param property Mini.Number 属性：11底板不透明度、12整体不透明度、13发光。
---@param time Mini.Number 动画时长（秒），小于等于0时立即应用。
---@param ptype Mini.Number 1增加、2减少，其他有效数值设为目标。
---@param value Mini.Number 变化量或目标值；不透明度0～100，发光0～2。
---@return Mini.Bool result 参数或属性不支持、发光模式不符时返回 false；无 Host 时记录目标后返回 true；已有 Host 时返回动画调用结果或 false。动画调用前已写入目标，false 不保证属性未改变。
function UIBillboard:SmoothChangeAttr(property, time, ptype, value) end

---设置发光强度
---仅在自发光模式 Emissive（1）下设置发光强度，并请求刷新生成内容；数值截断到 0～2。
---@param state Mini.Number 发光强度，0～2，仅自发光模式有效。
---@return Mini.Bool result 参数为 number 且为自发光模式时写入属性并返回 true；参数类型错误或非自发光模式返回 false。
function UIBillboard:SetLight(state) end

---设置显示距离
---设置显示距离上限，数值截断到 1～64 米；已启动时请求更新 Host 可见距离，内部换算为厘米。
---@param state Mini.Number 显示距离上限（米），1～64，超范围截断。
---@return Mini.Bool result 写入属性并请求刷新时返回 true；参数不是 number 时返回 false，不代表面板已创建或最终显示成功。
function UIBillboard:SetDisplayDistance(state) end

---设置底板颜色
---设置底板颜色并请求刷新；颜色数值先向下取整，不接受十六进制字符串或 Mini.Color 对象。
---@param value Mini.Number RGB/ARGB颜色数值（0～0xFFFFFFFF）。
---@return Mini.Bool result 数值在允许范围内并转换、写入属性时返回 true；非 number 或范围外返回 false。
function UIBillboard:SetBackgroundColor(value) end

---设置整体颜色
---设置显示板整体颜色并请求刷新；颜色数值先向下取整，不接受十六进制字符串或 Mini.Color 对象。
---@param value Mini.Number RGB/ARGB颜色数值（0～0xFFFFFFFF）。
---@return Mini.Bool result 数值在允许范围内并转换、写入属性时返回 true；非 number 或范围外返回 false。
function UIBillboard:SetOverallColor(value) end
