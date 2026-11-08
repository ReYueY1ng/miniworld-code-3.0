---@meta

---召唤生物方块组件接口（内置组件 SummonMobBlock · 方块组件）<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/summonmobblock.html)
---@class SummonMobBlock: Component
---@field mobType number 召唤生物
---@field detectRange number 检测范围(格)
---@field summonProbability number 召唤概率
---@field checkInterval number 检测间隔(s)
---@field emergeAnim Mini.ModelAction 蹦出动作(生物)
---@field emergeEffect number | string 蹦出特效
SummonMobBlock = {}

---召唤生物
---在目标方块位置强制召唤 mobType 指定的生物，忽略检测范围与概率；先播放特效、删除原方块，再尝试创建生物。
---@param pos any 方块坐标（触发器自动传入，脚本调用时需提供）。（wiki 未声明类型，此处用 any）
---@return Mini.Mob result 创建列表首项作为新生物对象 ID 返回；编辑模式、位置格式不符/缺坐标、无地图、原位置为空或创建未返回对象时为 nil。取整后 y<=0 时创建路径拒绝生物，但原方块已被删除。
function SummonMobBlock:SummonAt(pos) end
