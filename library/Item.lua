---@meta

---道具模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/item.html)
---@class Item
Item = {}

---获取道具名称
---@param itemid integer | string 道具ID
---@return string itemname 道具名称
function Item:GetItemName(itemid) end

---在资源库里随机获取一个道具ID
---@return integer itemid 道具ID
function Item:RandomItemID() end

---在资源库里随机获取一个投掷物ID
---@return integer itemid 道具ID
function Item:RandomProjectileID() end

---获取道具属性
---@param itemid integer | string 道具ID
---@param attr integer 属性类型枚举（ItemAttr）
---@return number value 属性值
function Item:GetAttr(itemid, attr) end

---获取道具描述
---@param itemid integer | string 道具ID
---@return string itemname 道具描述
function Item:GetItemDesc(itemid) end

---获取自定义枪械的属性(仅自定义枪械有效)
---@param itemid integer | string 道具ID
---@param attrname string 属性名(GunAttr)
---@return any value 返回的值
function Item:GetCustomGunAttr(itemid, attrname) end

---获取道具配方的数量
---@param itemid integer | string 道具ID
---@return integer num 配方数量
function Item:GetCraftIDNum(itemid) end

---获取道具的配方材料和数量
---@param itemid integer | string 道具ID
---@return [integer | string, integer][] num 原料信息 {{itemid, itemnum}}
function Item:GetCraftMaterialAndNum(itemid) end

---获取道具类型外观
---@param itemid integer | string 道具ID
---@return string facade 道具类型外观
function Item:GetFacade(itemid) end

---在位置上创建道具实例的掉落物
---@param itemid integer | string 道具ID
---@param pos PositionTable 掉落物位置
---@return integer objid 对象objid
function Item:CreateItemInstInWorld(itemid, pos) end

---在位置上创建枪械道具实例的掉落物
---@param itemid integer | string 道具ID
---@param pos PositionTable 掉落物位置
---@return integer objid 对象objid
function Item:CreateGunInWorld(itemid, pos) end

---获取装备道具所对应的装备栏
---@param itemid integer | string 道具ID
---@return integer grid 装备栏位置 BackpackBeginIndex.Equip + (EquipSlotType)
function Item:GetEquipItemGridID(itemid) end

---修改枪械道具实例的属性
---@param instid string 道具实例id
---@param key string 属性的枚举(GunAttr)
---@param value number | string | boolean 值
---@return boolean result
function Item:ModifyGunAttribute(instid, key, value) end

---获取枪械道具实例的属性
---@param instid string 道具实例id
---@param key string 属性的枚举(GunAttr)
---@return number | string | boolean value 值
function Item:GetGunAttribute(instid, key) end

---获取枪预制的属性
---@param instid string 道具实例id
---@param key string 属性的枚举(GunAttr)
---@return number | string | boolean value 值
function Item:GetGunPrefabAttribute(instid, key) end

---根据道具实例ID获取道具ID
---@param instid string 道具实例id
---@return integer | string itemid 道具id
function Item:GetItemIdByInstanceId(instid) end

---给道具实例添加一个模型子部件（如果界面模型使用了道具实例的模型，则修改模型后需要隔大约0.5秒等数据同步客机后再刷新界面）
---@param instid string 道具实例id
---@param partName string 子部件名字
---@param boneName string 挂点
---@param modelStr string 模型
---@param offset PositionTable 位置偏移
---@param rot PositionTable 旋转
---@param scale PositionTable 缩放
---@return string partName 部件名字
function Item:AddSubModelPart(instid, partName, boneName, modelStr, offset, rot, scale) end

---删除一个道具实例的模型子部件
---@param instid string 道具实例id
---@param partName string 子部件名字
---@return boolean result
function Item:DeleteSubModelPart(instid, partName) end

---修改一个道具实例的模型子部件
---@param instid string 道具实例id
---@param partName string 子部件名字
---@param boneName string 挂点
---@param modelStr string 模型
---@param offset PositionTable 位置偏移
---@param rot PositionTable 旋转
---@param scale PositionTable 缩放
---@return boolean result
function Item:ReplaceSubModelPart(instid, partName, boneName, modelStr, offset, rot, scale) end

---设置道具实例的自定义数据string
---@param instid string 道具实例id
---@param key string 键
---@param value string 值
---@return boolean result
function Item:SetStringCustomData(instid, key, value) end

---设置道具实例的自定义数据bool
---@param instid string 道具实例id
---@param key string 键
---@param value boolean 值
---@return boolean result
function Item:SetBoolCustomData(instid, key, value) end

---设置道具实例的自定义数据number
---@param instid string 道具实例id
---@param key string 键
---@param value number 值
---@return boolean result
function Item:SetNumberCustomData(instid, key, value) end

---设置道具实例的自定义数据Object
---@param instid string 道具实例id
---@param key string 键
---@param value table 值
---@return boolean result
function Item:SetObjCustomData(instid, key, value) end

---设置道具实例的自定义数据Array
---@param instid string 道具实例id
---@param key string 键
---@param value any[] 值
---@return boolean result
function Item:SetArrayCustomData(instid, key, value) end

---获取道具实例的自定义数据string
---@param instid string 道具实例id
---@param key string 键
---@return string value 值
function Item:GetStringCustomData(instid, key) end

---获取道具实例的自定义数据bool
---@param instid string 道具实例id
---@param key string 键
---@return boolean value 值
function Item:GetBoolCustomData(instid, key) end

---获取道具实例的自定义数据number
---@param instid string 道具实例id
---@param key string 键
---@return number value 值
function Item:GetNumberCustomData(instid, key) end

---获取道具实例的自定义数据Object
---@param instid string 道具实例id
---@param key string 键
---@return table value 值
function Item:GetObjCustomData(instid, key) end

---获取道具实例的自定义数据Array
---@param instid string 道具实例id
---@param key string 键
---@return any[] value 值
function Item:GetArrayCustomData(instid, key) end

---获取具有道具实例ID的道具外观
---@param instid string 道具实例id
---@return string facade 道具实例外观
function Item:GetItemInstFacade(instid) end

---获取掉落物或者投掷物的格子属性
---@param objid integer 对象ID
---@param attr integer 属性枚举(GridAttr)
---@return number value 属性值
function Item:GetGridAttr(objid, attr) end