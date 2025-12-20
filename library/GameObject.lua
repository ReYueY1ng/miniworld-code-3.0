---@meta

---对象模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/gameobject.html)
---@class GameObject
GameObject = {}

---根据ID查找游戏对象
---@param id integer | string 游戏对象的唯一标识
---@return table? object 返回找到的游戏对象，如果没有找到则返回nil
function GameObject:FindObject(id) end

---根据ID查找ui对象
---@param id string ui对象的唯一标识
---@return table? object 返回找到的ui对象，如果没有找到则返回nil
function GameObject:FindUIObject(id) end

---根据ID查找方块对象 只能查找到编辑过的方块或是自定义的方块
---@param id integer | string 方块类型id
---@return table? object 返回找到的方块对象，如果没有找到则返回nil
function GameObject:FindBlockObject(id) end

---创建预制实例
---@param prefabid integer | string 预制体ID
---@param mapid integer? 星球ID
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param trigger boolean? 是否触发事件(默认true)
---@return table? object 返回创建的对象，如果创建失败则返回nil
function GameObject:CreatePrefabInst(prefabid, mapid, x, y, z, trigger) end

---创建对象
---@param objectType integer 对象类型(ObjType)
---@param prefabid number | string 预制体ID
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param num number 数量
---@param trigger boolean? 是否触发事件(默认true)
---@param mapid integer? 星球ID
---@return table[]? objects 返回创建对象的列表，如果需要objId，则需要用GetId()获取
function GameObject:CreatePrefab(objectType, prefabid, x, y, z, num, trigger, mapid) end

---删除对象(玩家，方块，世界，ui 对象不能删除)
---@param objid integer | string 对象id
---@return boolean result
function GameObject:Destroy(objid) end

---获取对象的预制id
---@param objid integer | string 对象id（掉落物，投掷物，生物可用）
---@return integer | string prefabid 预制id
---@return integer objectType 对象类型(ObjType)
function GameObject:GetObjectPrefab(objid) end
