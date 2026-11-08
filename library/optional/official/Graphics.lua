---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Graphics<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---查找指定坐标上的图文信息
---转发引擎 GraphicsApi:findGraphics，仅返回调用成功状态
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param playerid integer 玩家ID
---@param itype number 图文类型
---@return boolean result 是否成功找到或处理
function Graphics:FindGraphics(x, y, z, playerid, itype) end

---在客户端读取玩家内嵌图文的偏移高度
---原始值大于 0 时会减去 100 的基准高度
---reportid 非空时通过 DataSycMgr 把结果回传宿主
---@param reportid integer 主控端回传报告ID，省略则不回传
---@param objid integer 保留参数，当前未使用
---@param tuin integer 目标玩家Uin
---@param itype number 图文类型（PlayerNameType：昵称/称号/头部特效）
---@return number offest 偏移高度，玩家或身体不存在时为 0
function Graphics:GetInnerGraphicsOffset_OnClient(reportid, objid, tuin, itype) end

---把图文信息同步到客户端
---转发引擎 GraphicsApi:snycGraphicsInfo2Client
---@return boolean result 是否同步成功
function Graphics:SnycGraphicsInfo2Client() end
