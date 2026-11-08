---@meta

---生物种植组件（内置组件 Plant · 角色组件）<br>
---为生物添加种植工作能力，可配置种植区域、工作模式、道具标签和冷却。
---@class Plant: Component
---@field centerPoint Mini.Vec3 中心点
---@field xLength number x长度
---@field yLength number y长度
---@field zLength number z长度
---@field currentX number 当前x
---@field currentZ number 当前Z
---@field cdTime number cd时间
---@field plantItemTags string[] 开垦所需道具标签
---@field plantSearchType number 开垦所需道具标签搜索类型
---@field seedItemTags string[] 种子道具标签
---@field seedSearchType number 种子道具标签搜索类型
---@field waterItemTags string[] 浇水道具标签
---@field waterSearchType number 浇水道具标签搜索类型
---@field fertilizerItemTags string[] 施肥道具标签
---@field fertilizerSearchType number 施肥道具标签搜索类型
---@field currentState number 当前状态
---@field currentMode number 当前模式
---@field currentWorkPos Mini.Vec3 当前工作位置
---@field isAdd boolean 是否增加
---@field isAddX boolean 是否增加X
---@field isForceAdd boolean 是否强制增加
---@field magicMode number 工作执行模式
---@field magicAction Mini.ModelAction 魔法动作
---@field magicHoeEffect number | string 魔法开垦特效
---@field magicPlantEffect number | string 魔法种植特效
---@field magicHarvestEffect number | string 魔法收获特效
---@field magicPickEffect number | string 魔法拾取特效
---@field magicFertilizeEffect number | string 魔法施肥特效
---@field magicWaterEffect number | string 魔法浇水特效
Plant = {}

---判断当前是否处于工作中。
---@return boolean result 返回是否正在工作。
function Plant:IsWorking() end

---获取当前工作状态编号。
---@return number value 返回当前工作状态编号。
function Plant:GetWorkingState() end

---获取当前工作模式编号。
---@return number value 返回当前工作模式编号；攀爬模式会按种植模式返回。
function Plant:GetWorkingMode() end

---停止当前工作并清理移动目标。
function Plant:SetStopWork() end

---按指定工作模式开始工作。
---@param arg1 number 工作模式编号，1开垦、2种植、3收获、4拾取、5施肥、6浇水。
---@param num number 数量
---@return boolean result 返回是否成功开始工作；区域无效、模式重复或条件不满足时返回 false。
function Plant:SetStartWork(arg1, num) end

---设置生物种植工作的区域范围。
---@param arg1 number 区域中心点。
---@param pos Mini.Vec3 X 轴长度。
---@param arg3 number Y 轴长度。
---@param num number Z 轴长度。
---@param arg5 number 参数 arg5
---@param num2 number 参数 num2
---@param arg7 number 参数 arg7
---@param num3 number 参数 num3
function Plant:SetArea(arg1, pos, arg3, num, arg5, num2, arg7, num3) end

---设置工作冷却时间。
---@param arg1 number 冷却时间，单位秒。
---@param num number 数量
function Plant:SetCdTime(arg1, num) end

---设置开垦工作所需道具标签。
---@param arg1 any 开垦所需道具标签数组。（组件类型 Mini.Array(Mini.Tag) 未映射，此处用 any）
---@param arg2 number 标签搜索类型，1全部、2任意。
---@param num number 数量
function Plant:SetPlantItemTags(arg1, arg2, num) end

---设置种植所需种子道具标签。
---@param arg1 any 种子道具标签数组。（组件类型 Mini.Array(Mini.Tag) 未映射，此处用 any）
---@param arg2 number 标签搜索类型，1全部、2任意。
---@param num number 数量
function Plant:SetSeedItemTags(arg1, arg2, num) end

---设置浇水所需道具标签。
---@param arg1 any 浇水道具标签数组。（组件类型 Mini.Array(Mini.Tag) 未映射，此处用 any）
---@param arg2 number 标签搜索类型，1全部、2任意。
---@param num number 数量
function Plant:SetWaterItemTags(arg1, arg2, num) end

---设置施肥所需道具标签。
---@param arg1 any 施肥道具标签数组。（组件类型 Mini.Array(Mini.Tag) 未映射，此处用 any）
---@param arg2 number 标签搜索类型，1全部、2任意。
---@param num number 数量
function Plant:SetFertilizerItemTags(arg1, arg2, num) end

---让生物前往种植区域周边的起始位置。
function Plant:GotoStartPos() end
