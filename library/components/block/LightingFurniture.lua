---@meta

---灯光（内置组件 LightingFurniture · 方块组件）<br>
---为方块添加灯光家具能力，可配置光源和开关状态。
---@class LightingFurniture: Component
---@field controlMode number 控制方式
---@field defaultGear number 光照强度(档位0)
---@field gears table[] 控制档位
---@field curGear number
LightingFurniture = {}
