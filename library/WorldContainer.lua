---@meta

---容器模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/worldcontainer.html)
---@class WorldContainer
WorldContainer = {}

---检测是否是储物箱
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@return boolean isStorage
function WorldContainer:CheckStorage(x, y, z) end

---清空储物箱
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@return boolean result
function WorldContainer:ClearStorageBox(x, y, z) end

---检测储物箱空余格子，传入道具ID同时检测已存该道具的格子
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param itemid integer | string 道具类型ID
---@return boolean isEmpty
function WorldContainer:CheckStorageEmptyGrid(x, y, z, itemid) end

---设置储物箱道具
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param offset integer 仓库格子索引(从1开始)
---@param itemid integer | string 道具类型ID
---@param num integer 道具数量
---@return boolean result
function WorldContainer:SetStorageItem(x, y, z, offset, itemid, num) end

---获取储物箱道具ID
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param offset integer 仓库格子索引(从1开始)
---@return integer | string itemid 道具类型ID
---@return integer num 道具数量
function WorldContainer:GetStorageItem(x, y, z, offset) end

---给储物箱添加道具
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param itemid integer | string 道具类型ID
---@param num integer 道具数量
---@return integer relNum 成功添加数量
function WorldContainer:AddStorageItem(x, y, z, itemid, num) end

---移除储物箱内指定类型的道具
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param itemid integer | string 道具类型ID
---@param num integer 道具数量
---@return boolean result
function WorldContainer:RemoveStorageItemByID(x, y, z, itemid, num) end

---移除储物箱内指定格子的道具
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param offset integer 仓库格子索引(从1开始)
---@param num integer 道具数量
---@return boolean result
function WorldContainer:RemoveStorageItemByIndex(x, y, z, offset, num) end

---将一定数量道具添加到储物箱中
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param itemid integer | string 道具类型ID
---@param num integer 道具数量
---@return integer relNum 成功添加数量
function WorldContainer:AddItemToContainer(x, y, z, itemid, num) end

---移除储物箱内一定数量道具
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param itemid integer | string 道具类型ID
---@param num integer 道具数量
---@return boolean result
function WorldContainer:RemoveContainerItemByID(x, y, z, itemid, num) end

---清空指定位置的储物箱
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@return boolean result
function WorldContainer:ClearContainer(x, y, z) end

---给当前世界的储物箱添加道具
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param itemids {itemId: integer | string, itemNum: integer}[] 道具类型ID
---@return integer relNum 成功添加数量
function WorldContainer:AddWorldStorageItems(x, y, z, itemids) end

---获取储物箱内指定格子的道具实例ID
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param offset integer 仓库格子索引(从1开始)
---@return integer instanceid 实例ID
function WorldContainer:GetStorageItemInstanceId(x, y, z, offset) end

---获取储物箱里所有的道具实例（只取通过接口创建的道具实例）
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@return integer[] instanceids 实例ID表
function WorldContainer:GetAllStorageItemInstanceIds(x, y, z) end

---玩家和指定位置的储物箱或熔炉交换道具
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param offset integer 仓库格子索引(从1开始)
---@param playerid integer 玩家ID
---@param grid integer 玩家格子索引
---@return boolean result
function WorldContainer:SwapContainerItem(x, y, z, offset, playerid, grid) end

---获取格子属性
---@param x number x坐标
---@param y number y坐标
---@param z number z坐标
---@param offset integer 仓库格子索引(从1开始)
---@param attr integer 属性枚举(GridAttr)
---@return number value 属性值
function WorldContainer:GetGridAttr(x, y, z, offset, attr) end