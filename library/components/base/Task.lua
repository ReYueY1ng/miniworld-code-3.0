---@meta

---任务（内置组件 Task · 基础组件）<br>
---为对象添加任务能力，可配置和管理任务相关数据。
---@class Task: Component
Task = {}

---清空全部任务
---@vararg any
function Task:ClearAllTask(...) end

---开始任务连锁
---@vararg any
function Task:StartTaskChain(...) end
