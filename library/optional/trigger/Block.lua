---@meta

---触发器 Block 模块（Trigger.Block）<br>
---仅在触发器环境中可用，坐标参数使用 pos 向量。<br>
---默认关闭：在 Lua.runtime.pluginArgs 中设置 "triggerApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/introduction/scriptinteraction.html)
---@class Trigger.Block
Trigger.Block = {}

---检查方块朝向是否等于或异于指定方向
---取不到位置上的方块朝向时一律返回 false
---@param pos Mini.Vec3 方块坐标表，需含 x/y/z
---@param dir Mini.Vec3 用于比较的方向值（FaceDir 枚举）
---@param val any 比较方式：true 判断等于 dir，false 判断不等于 dir
---@param worldId integer 星球ID，不填或传 -1 表示当前所在星球
---@return boolean result 是否满足比较条件，坐标为非表或方向/比较值为空时返回 false
function Trigger.Block:CheckBlockDir(pos, dir, val, worldId) end

---比较指定位置的方块类型是否与给定ID一致
---先读取位置上的方块类型再按 flag 比较，读取失败直接返回 false
---@param pos table 方块坐标表，需含 x/y/z
---@param flag boolean true 判断相等，false 判断不相等
---@param blockid number | string 方块类型ID，自定义方块可传资源ID字符串
---@param worldId integer 星球ID，不填或传 -1 表示当前所在星球
---@return boolean result 比较结果，坐标非法或取不到方块类型时返回 false
function Trigger.Block:CompareBlockID(pos, flag, blockid, worldId) end

---在指定位置放置一个方块
---成功后记录最近创建的方块ID，供触发器事件读取
---方块类型为 4095（空气）时直接失败
---@param pos Mini.Vec3 目标坐标表，需含 x/y/z
---@param blockid number | string 方块类型ID，自定义方块可传资源ID字符串
---@param face? number 方块朝向或方块数据值，默认 0
---@param worldId integer 星球ID，不填或传 -1 表示当前所在星球
---@return boolean result 是否放置成功
function Trigger.Block:CreateBlock(pos, blockid, face, worldId) end

---放置带颜色和开关状态的特殊方块
---开关状态在方块放置成功后单独设置，设置结果不影响返回值
---颜色与开关只对颜色方块、功能方块有效
---@param pos? Mini.Vec3 目标坐标表，需含 x/y/z
---@param blockid number | string 方块类型ID，自定义方块可传资源ID字符串
---@param face? number 方块朝向或方块数据值，默认 0
---@param color any 颜色值（0xRRGGBB），仅颜色方块生效
---@param switch boolean 功能方块开关状态（布尔值）
---@param worldId integer 星球ID，不填或传 -1 表示当前所在星球
---@return boolean result 方块是否放置成功
function Trigger.Block:CreateSpcBlock(pos, blockid, face, color, switch, worldId) end

---销毁指定位置的方块且不产生掉落物
---默认触发方块破坏相关事件
---坐标缺失或星球不存在时返回 false
---@param pos? Mini.Vec3 目标坐标表，需含 x/y/z
---@param worldId number 星球ID，不填或传 -1 表示当前所在星球
---@return boolean result 是否销毁成功
function Trigger.Block:DestroyBlock(pos, worldId) end

---销毁指定位置的方块并产生掉落物
---与 DestroyBlock 相同，但销毁后按方块掉落表生成掉落物
---坐标缺失或星球不存在时返回 false
---@param pos? Mini.Vec3 目标坐标表，需含 x/y/z
---@param worldId integer 星球ID，不填或传 -1 表示当前所在星球
---@return boolean result 是否销毁成功
function Trigger.Block:DestroyBlockDrop(pos, worldId) end

---读取指定位置方块的类型ID
---坐标为小数时向下取整
---@param pos Mini.Vec3 方块坐标表，需含 x/y/z
---@param worldId number 星球ID，不填或传 -1 表示当前所在星球
---@return number|string|boolean? id 方块类型ID，自定义方块返回资源ID字符串；坐标为非表返回 false，星球不存在返回 nil
function Trigger.Block:GetBlockID(pos, worldId) end

---检查功能方块开关状态是否等于给定值
---非功能方块读到的状态为 false，此时传 flag=false 会返回 true
---坐标为非表时直接返回 false
---@param pos Mini.Vec3 方块坐标表，需含 x/y/z
---@param flag boolean 期望的开关状态（布尔值）
---@param worldId number 星球ID，不填或传 -1 表示当前所在星球
---@return boolean result 开关状态是否与 flag 一致
function Trigger.Block:GetBlockSwitchStatus(pos, flag, worldId) end

---获取方块类型对应的外观资源名
---字符串参数不做校验，直接拼成 blockprefab_<参数>
---数字参数优先返回自定义资源ID，其次返回 block_<类型ID>，都取不到时为 nil
---@param blockid number | string 方块类型ID或方块预制资源ID
---@return string? result 外观名，形如 blockprefab_<资源ID> 或 block_<类型ID>，无法解析时为 nil
function Trigger.Block:GetFacade(blockid) end

---在指定位置按蓝图覆盖放置整套方块
---目标星球不存在时会提示并返回 false
---坐标为非表或蓝图字符串非法时返回 false
---@param pos Mini.Vec3 蓝图起始坐标表，需含 x/y/z
---@param blueprint string 蓝图资源ID，形如 类型,蓝图键[,mod路径]
---@param angle number 放置旋转角度
---@param mirror boolean 是否镜像放置
---@param placeMode boolean 是否先清空蓝图覆盖区域再放置
---@param worldId? integer 星球ID，默认取 pos.worldId 或 pos.mapId
---@return boolean result 是否放置成功
function Trigger.Block:ReplaceBluePrint(pos, blueprint, angle, mirror, placeMode, worldId) end

---修改颜色方块的显示颜色
---仅颜色方块生效，其他方块返回 false
---颜色会映射到最接近的可用颜色方块
---@param pos Mini.Vec3 方块坐标表，需含 x/y/z
---@param color number 颜色值（0xRRGGBB），支持数字或 0x 前缀字符串
---@param worldId number 星球ID，不填或传 -1 表示当前所在星球
---@return boolean result 是否修改成功
function Trigger.Block:SetBlockColor(pos, color, worldId) end

---设置方块朝向并触发方块变向事件
---方块已处于目标朝向时直接返回 true
---成功后会派发 BlockChangeDir 事件
---@param pos Mini.Vec3 方块坐标表，需含 x/y/z
---@param dir number 方向值（FaceDir 枚举）
---@param worldId number 星球ID，不填或传 -1 表示当前所在星球
---@return boolean result 是否设置成功
function Trigger.Block:SetBlockDir(pos, dir, worldId) end

---设置功能方块的开关状态
---开关值不是布尔值或星球不存在时返回 false
---只对功能方块有意义
---@param pos Mini.Vec3 方块坐标表，需含 x/y/z
---@param switch boolean 开关状态（布尔值）
---@param worldId integer 星球ID，不填或传 -1 表示当前所在星球
---@return boolean result 是否设置成功
function Trigger.Block:SetBlockSwichState(pos, switch, worldId) end
