---@meta

---骑乘组件接口（内置组件 Ride）<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/ride.html)
---@class Ride: Component
Ride = {}

---设置允许受控制
---设置当前坐骑是否接受骑乘者控制，并标记骑乘数据待保存；需要底层RideComponent。临时坐骑AI执行期间控制查询仍为false，不负责发起骑乘。
---@param value? Mini.Bool true允许骑乘者控制，false禁止，默认true。
function Ride:SetIsPlayerContrl(value) end

---获取允许受控制
---读取坐骑当前是否允许骑乘者控制；临时坐骑正在执行AI时底层强制返回false，可能不同于配置开关。
---@return Mini.Bool value 返回底层控制开关；临时坐骑AI执行期间为false；未创建底层RideComponent时为nil。
function Ride:GetIsPlayerContrl() end

---设置允许自由转动
---设置主座位骑乘者是否可自由旋转朝向；false时底层按坐骑朝向更新骑乘者及相机，true时允许独立旋转，不是坐骑自身转向开关。
---@param value? Mini.Bool 主座位朝向：true独立旋转，false跟随坐骑，默认true。
function Ride:SetIsRote(value) end

---获取允许自由转动
---读取主座位骑乘者是否可独立旋转朝向的开关；其他座位不使用此值。
---@return Mini.Bool value true允许主座位骑乘者独立旋转，false表示跟随坐骑朝向；无底层RideComponent时返回nil。
function Ride:GetIsRote() end
