---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· GameObject<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---创建一个空的编辑用角色对象
---对象不保存到区块
---对象类型被设为 ObjType.Empty
---@return userdata? obj 空角色对象，创建失败时为 nil
function GameObject:CreateEditEmptyActor() end

---查找方块对应的游戏对象
---@param id number 方块对象ID，传数字时先按方块类型映射为资源ID
---@return userdata? obj 方块对象，未找到时为 nil
function GameObject:FindBlockObjectForInternal(id) end

---获取游戏对象的类型
---@param objId integer 对象ID
---@return number? objtype 对象类型（ObjType），对象不存在时为 nil
function GameObject:GetObjType(objId) end

---获取当前世界的游戏对象
---@return userdata? world 世界游戏对象，失败时为 nil
function GameObject:GetWorld() end
