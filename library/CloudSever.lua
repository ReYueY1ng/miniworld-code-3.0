---@meta

---@alias CallbackCode
---| 0 # 成功
---| 1 # 失败
---| 2 # 数据不存在

---云服模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/cloudsever.html)
---@class CloudSever
CloudSever = {}

---设置表中指定键的值
---@param libvarid string 表变量设计名
---@param key string 获取的键值
---@param value number | string | table 任意值
---@return boolean result
function CloudSever:SetDataListBykey(libvarid, key, value) end

---获取表中指定键的值
---@param libvarid string 表变量设计名
---@param key string 获取的键值
---@param callback fun(code: CallbackCode, key: string, data: any) 更新回调(function(code/错误码...)0成功1失败2数据不存在)
---@return boolean result
function CloudSever:GetDataListByKey(libvarid, key, callback) end

---获取当前云服房间ID
---@return string roomid 房间ID
function CloudSever:GetRoomID() end

---设置表中指定键的值（别名）
---@param libvarid string 表变量设计名
---@param key string 键值
---@param value number | string | table 设置的值
---@return boolean result
function CloudSever:SetDataListValue(libvarid, key, value) end

---传送到当前地图分类房间<br>**调用限制**: 全局 30 秒冷却
---@param playerids integer | integer[] 玩家Uin或Uin数组
---@param categorys string | string[] 分类或分类数组
---@return boolean result
function CloudSever:TransmitToCurMapCategoryRoom(playerids, categorys) end

---获取房间分类
---@return string category 房间分类
function CloudSever:GetRoomCategory() end

---设置房间分类<br>**调用限制**: 全局 5 秒冷却
---@param category string 房间分类
---@return boolean result
function CloudSever:SetRoomCategory(category) end

---传送到分类房间<br>**调用限制**: 全局 30 秒冷却
---@param playerids integer | integer[] 玩家Uin或Uin数组
---@param mapid string 地图ID
---@param categorys string | string[] 分类或分类数组
---@param teleportmsg? string 传送提示消息
---@param notFollow? boolean 是否不跟随
---@return boolean result
function CloudSever:TransmitToCategoryRoom(playerids, mapid, categorys, teleportmsg, notFollow) end
