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
---@param ... any 参数
function CloudSever:TransmitToCurMapCategoryRoom(...) end

---获取房间分类
---@param ... any 参数
function CloudSever:GetRoomCategory(...) end

---设置房间分类<br>**调用限制**: 全局 5 秒冷却
---@param ... any 参数
function CloudSever:SetRoomCategory(...) end

---传送到分类房间<br>**调用限制**: 全局 30 秒冷却
---@param ... any 参数
function CloudSever:TransmitToCategoryRoom(...) end
