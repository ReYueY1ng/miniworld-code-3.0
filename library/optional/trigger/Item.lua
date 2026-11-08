---@meta

---触发器 Item 模块（Trigger.Item）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Item
Trigger.Item = {}

---清空指定位置存储框内的全部道具
---目标位置没有容器或星球不存在时返回 false
---@param pos Mini.Vec3 存储框坐标表，需含 x/y/z
---@param worldId integer 星球ID，不填表示当前星球
---@return boolean result 是否清空成功
function Trigger.Item:ClearStorageBox(pos, worldId) end

---比较两个道具ID是否相同
---直接比较原值，任一为 nil 时返回 false
---@param itemid? number | string 道具ID
---@param itemid2 any 另一个道具ID
---@return boolean result 是否相同
function Trigger.Item:CompareItemid(itemid, itemid2) end

---向指定位置的存储框放入道具
---只要 pos 是表就返回 true，容器不存在或放入失败同样返回该值
---调用后会记录最近创建的道具ID
---@param itemid number | string 道具ID，可为配置ID或资源ID字符串
---@param num number 放入数量
---@param pos Mini.Vec3 存储框坐标表，需含 x/y/z
---@param worldId integer 星球ID，不填表示当前星球
---@return boolean? result 坐标为表即返回 true，否则为 nil
function Trigger.Item:CreateItemToStorageBox(itemid, num, pos, worldId) end

---从指定位置存储框移除指定道具
---数量不填时内部按 999999 处理
---容器不存在时返回 false
---@param itemid number | string 道具ID，可为配置ID或资源ID字符串
---@param num number 移除数量，不填表示全部
---@param pos Mini.Vec3 存储框坐标表，需含 x/y/z
---@param worldId integer 星球ID，不填表示当前星球
---@return boolean? result 是否移除成功，pos 不是表时为 nil
function Trigger.Item:DespawnItemFromStorageBox(itemid, num, pos, worldId) end

---获取道具类型对应的外观资源名
---字符串参数不做校验，直接拼成 itemprefab_<参数>
---数字参数先查自定义资源ID，再回退为 item_<类型ID>
---@param itemid number | string 道具类型ID或道具预制资源ID
---@return string? name 外观名，形如 itemprefab_<资源ID> 或 item_<类型ID>，无法解析时为 nil
function Trigger.Item:GetFacade(itemid) end

---原样返回传入的道具ID
---占位接口，不做任何转换
---@param itemid number | string 道具ID，数字或资源ID字符串
---@return number|string id 传入的ID原值
function Trigger.Item:ToItemID(itemid) end
