---@meta

---生物贴图切换(针对狼狗等生物)（内置组件 TextureSwitcher · 角色组件）<br>
---为生物添加贴图切换能力，可根据昼夜等条件自动切换贴图。
---@class TextureSwitcher: Component
TextureSwitcher = {}

---设置生物是否可以自动切换到夜晚贴图。
---@param arg1 number 是否允许自动切换夜晚贴图。
---@param flag boolean 开关
function TextureSwitcher:SetAbleChangeNightTexture(arg1, flag) end
