---@meta

---资源模块管理接口<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/mod.html)
---@class Mod
Mod = {}

---通过资源id获取defid
---@param assetId string 资源id
---@return number cfgid defid
function Mod:GetCfgIdByAssetId(assetId) end