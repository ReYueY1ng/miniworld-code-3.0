---@meta

---星球声音组件接口（内置组件 PlanetSoundSetting · 世界组件）<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/planetsoundsetting.html)
---@class PlanetSoundSetting: Component
---@field music number | string 背景音乐
PlanetSoundSetting = {}

---设置背景音乐
---有所属World时保存音乐并为当前主玩家请求循环播放（音量100、音调1.0）；先停止本机音乐管理器的当前音乐。直接调用不检查主玩家是否在本星球，返回值不反馈播放结果。
---@param value? number | string 声音ID，默认35443；0、-1002、空串或其他类型回退默认音乐。
function PlanetSoundSetting:SetBackgroundMusic(value) end

---获取背景音乐
---返回组件保存的背景音乐标识，不查询当前主玩家实际正在播放的音乐。
---@return number | string value 返回保存的music值，默认数值35443；无World的设置调用不会更新它，直接脚本写入其他类型也会原样返回。该值不能证明已成功播放。
function PlanetSoundSetting:GetBackgroundMusic() end
