---@meta

---生物模块管理接口  
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/monster.html)
---@class Monster
Monster = {}

---获取生物类型ID
---@param objid integer 生物objid
---@return integer | string actorid 生物defId
function Monster:GetActorID(objid) end

---获取生物类型名称
---@param objid integer 生物objid
---@return string name 生物类型名称
function Monster:GetActorName(objid) end

---替换生物
---@param objid integer 源对象ID
---@param actorid integer | string 替换的生物类型ID
---@param replacehp boolean 是否替换血量
---@return integer objid 替换后的生物id
function Monster:ReplaceActor(objid, actorid, replacehp) end

---获取生物击杀掉落经验
---@param actorid integer | string 生物类型id
---@return number exp 掉落经验
function Monster:GetMonsterDefLevelExp(actorid) end

---设置生物击杀掉落经验
---@param actorid integer | string 生物类型id
---@param exp number 掉落经验
---@return boolean result
function Monster:SetMonsterDefLevelExp(actorid, exp) end

---切换Ai行为树
---@param objid integer 生物objid
---@param treeid string 行为树ID
---@return boolean result
function Monster:ChangeAI(objid, treeid) end

---怪物对目标是否可见
---@param objid integer 怪物的对象ID
---@param targetobjid integer 目标对象ID
---@return boolean result
function Monster:CanSee(objid, targetobjid) end

---获取生物的掉落物信息
---@param actorid integer | string 生物defid
---@return [string | integer, integer, number][] dropInfos 掉落物信息 {...{道具ID，数量，概率}...}
function Monster:GetDropItemInfo(actorid) end

---设置生物被玩家驯服
---@param objid integer 对象objid
---@param playerid integer 玩家objid
---@return boolean result
function Monster:SetTameTarget(objid, playerid) end

---随机获取一个生物类型ID
---@return integer | string actorid 随机生物类型ID
function Monster:RandomActorID() end

---获取驯养主ID
---@param objid integer 生物对象ID
---@return integer ownerid 驯养主ID
function Monster:GetTamedOwnerID(objid) end

---获取生物类型外观
---@param monsterid integer | string 生物定义ID或生物预制ID
---@return string model 模型名称（如果是prefab资源会带有子部件信息，选择器选择不带子部件信息）
function Monster:GetFacade(monsterid) end