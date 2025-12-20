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