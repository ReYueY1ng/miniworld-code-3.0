---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Mod<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---按对象类型与配置ID获取资源ID
---道具实际为方块时会自动按方块类型查询
---cfgId 非数字或 ModPackMgr 不存在时返回 nil
---@param objType number 对象类型（ObjType）
---@param cfgId number 配置ID
---@return string? assetId 资源ID，未分配时为 nil
function Mod:GetAssetIdByCfg(objType, cfgId) end

---按对象ID获取资源ID
---引擎返回空串时转为 nil
---@param objid integer 对象ID
---@return string? assetId 资源ID，未分配时为 nil
function Mod:GetAssetIdByObjId(objid) end

---生成并缓存角色头像信息
---首次调用会自动创建 data/ugc/local/avatar/ 目录
---UIActorBodyManager 或 avatarInfo 缺失时返回 nil
---@param avatarInfo any 角色外观信息
---@param cacheId any 缓存ID
---@param filename string 输出文件名，相对 data/ugc/local/avatar/
---@return any? result 引擎返回的头像数据，无法查询时为 nil
function Mod:GetAvatarHeadInfo(avatarInfo, cacheId, filename) end

---获取自定义模组资源的资源ID
---道具实际为方块时会按方块类型查询
---仅当引擎判定为 Lua 可用的自定义资源时返回
---@param objType number 对象类型（ObjType）
---@param cfgId number 配置ID，需大于 0
---@return string? assetId 资源ID，非自定义资源时为 nil
function Mod:GetCustomAssetId(objType, cfgId) end

---按对象ID获取自定义资源ID
---Projectile 与 DropItem 会先取道具ID并按 Item 类型处理
---对象不存在时返回 nil
---@param objid integer 对象ID
---@param objType number 对象类型（ObjType）
---@return string|number? assetId 自定义资源ID，非自定义资源时回退为配置ID
function Mod:GetCustomAssetIdByObjId(objid, objType) end

---把资源ID或数字转换为配置ID
---数字字符串按 tonumber 解析，其余按资源ID查询已分配ID
---@param inputId any 配置ID（数字或数字字符串）或资源ID字符串
---@return number? cfgId 配置ID，无法转换时为 nil
function Mod:GetDefIdByCfg(inputId) end

---设置当前天气类型
---ModPackMgr 不存在时直接返回 true
---@param wtype number 天气类型
---@return boolean result 是否设置成功
function Mod:SetWeatherType(wtype) end
