---@meta

---Window（内置组件 Window · 方块组件）<br>
---为方块添加窗户能力，可配置开关、自动变形和垂直组合表现。
---@class Window: Component
---@field subMeshNormal1 number 1格高正常子模型
---@field subMeshMirror1 number 1格高镜像子模型
---@field subMeshNormal2 number 2格高正常子模型
---@field subMeshMirror2 number 2格高镜像子模型
---@field autoTransform boolean 自动变换
---@field linkedOperation boolean
---@field openAnimId number
---@field closeAnimId number
---@field openSound number | string 打开音效
---@field closeSound number | string 关闭音效
Window = {}
