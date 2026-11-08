---@meta

---生成方块（内置组件 GenerateBlock · 方块组件）<br>
---为方块添加生成能力，可配置生成的方块或资源。
---@class GenerateBlock: Component
---@field generateRule table[] 生成规则
---@field generateData string 生成数据
---@field spawnMode number 刷怪方式
---@field intervalMin number 刷怪间隔最小(秒)
---@field intervalMax number 刷怪间隔最大(秒)
---@field spawnRange number 刷新范围(格)
---@field spawnEffect number | string 刷新特效
---@field spawnedUids string
GenerateBlock = {}
