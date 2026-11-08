---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· WorldContainer<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---在指定坐标放置一个熔炉容器
---方块ID留空时使用默认熔炉
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param blockid? string 方块ID，可传资源ID字符串
---@return boolean result 是否添加成功
function WorldContainer:AddFurnace(x, y, z, blockid) end

---在指定坐标放置一个储物箱容器
---方块ID留空时使用默认储物箱
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param blockid? string 方块ID，可传资源ID字符串
---@return boolean result 是否添加成功
function WorldContainer:AddStorageBox(x, y, z, blockid) end

---检查指定坐标是否存在熔炉
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return boolean result 是否存在熔炉
---@return string? blockid 熔炉方块ID
function WorldContainer:CheckFurnace(x, y, z) end

---获取熔炉的加热进度百分比
---坐标不是熔炉时返回 nil
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param lev? number 燃料槽等级，默认 1
---@return number? percent 加热进度百分比
function WorldContainer:GetFurnaceHeatPercent(x, y, z, lev) end

---获取熔炉的熔炼进度百分比
---坐标不是熔炉时返回 nil
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return number? percent 熔炼进度百分比
function WorldContainer:GetFurnaceMeltPercent(x, y, z) end

---判断方块ID是否属于两格高方块
---仅认 1180、1181、390008、390103、390105 这几个ID
---@param blockid number | string 方块ID
---@return boolean result 是否两格高
function WorldContainer:Is2Sizeblock(blockid) end

---移除指定坐标的熔炉容器
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return boolean result 是否移除成功
function WorldContainer:RemoveFurnace(x, y, z) end

---移除指定坐标的储物箱容器
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@return boolean result 是否移除成功
function WorldContainer:RemoveStorageBox(x, y, z) end

---设置容器格子的数量、耐久或韧性
---坐标会向下取整
---储物箱格子序号超出箱子格数时失败
---熔炉只接受原料槽与燃料槽
---数值会被夹取到格子最大值
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param gridid number 格子序号，从 1 开始
---@param attr number 属性：GridAttr.ItemNum 数量、Durable 耐久、Toughness 韧性
---@param value number 目标数值
---@param worldId integer 星球ID
---@return boolean|integer result 成功为 true，数量清空时返回 0，失败为 false
function WorldContainer:SetGridAttr(x, y, z, gridid, attr, value, worldId) end

---设置召唤器方块的冷却时间与冷却类型
---冷却类型每次都会写入，冷却时间只在 changeCD 为 true 时写入
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param changeCD any 是否修改冷却时间
---@param CD any 冷却时间（秒）
---@param CDType number 冷却类型
---@return number result 成功为 1，失败为 0
function WorldContainer:SetSummoner(x, y, z, changeCD, CD, CDType) end

---设置召唤器方块的等级
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param level number 目标等级
---@return number result 成功为 1，失败为 0
function WorldContainer:SetSummonerLevel(x, y, z, level) end
