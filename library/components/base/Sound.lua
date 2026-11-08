---@meta

---音效组件接口（内置组件 Sound · 基础组件）<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/sound.html)
---@class Sound: Component
---@field soundId number | string
---@field isPlayNow boolean
---@field isLoop boolean 判断是否循环
---@field volume number 音量
---@field playingMode number 播放中模式
---@field playblast Mini.GroupView
Sound = {}

---播放声音
---先停止对象当前声音，再按当前声音资源、音量、循环和2D/3D配置请求重新播放；使用动态播放类型，不受仅玩法开始时的立即播放开关限制。组件缺失时不处理，无返回值，不确认资源加载或播放成功。
function Sound:PlaySound() end
