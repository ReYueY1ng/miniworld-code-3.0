---@meta

---方块模块管理接口  
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/block.html)
---@class Block
Block = {}

---是否为固体方块
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@return boolean result
function Block:IsSolidBlock(x, y, z) end

---是否是液体方块
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@return boolean result
function Block:IsLiquidBlock(x, y, z) end

---是否是空气方块
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@return boolean result
function Block:IsAirBlock(x, y, z) end

---获取指定位置的方块类型
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@return integer | string blockid 方块类型ID
function Block:GetBlockID(x, y, z) end

---设置位置方块数据
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@param blockid integer | string 方块类型ID
---@param data integer 方块朝向等数据
---@return boolean result
function Block:SetBlockAll(x, y, z, blockid, data) end

---摧毁方块
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@param dropitem boolean 是否掉落
---@return boolean result
function Block:DestroyBlock(x, y, z, dropitem) end

---放置方块
---@param blockid integer | string 方块类型ID
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@param face? integer 朝向
---@param color? integer 十六进制颜色值(0XFFFFFF 颜色方块类型才生效)
---@return boolean result
function Block:PlaceBlock(blockid, x, y, z, face, color) end

---替换方块
---@param blockid integer | string 方块类型ID
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@param face? integer 朝向
---@param color? integer 十六进制颜色值(0XFFFFFF 颜色方块类型才生效)
---@return boolean result
function Block:ReplaceBlock(blockid, x, y, z, face, color) end

---获取方块数据
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@return integer data 具体的值
function Block:GetBlockData(x, y, z) end

---设置方块数据 更新当前位置方块
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@param data integer 方块朝向等数据
---@return boolean result
function Block:SetBlockData(x, y, z, data) end

---获取方块朝向
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@return integer dir 返回类型(FaceDir)
function Block:GetBlockDir(x, y, z) end

---播放方块动作
---@param pos PositionTable 位置
---@param animid integer|string 动作id
---@param speed number 播放速度
---@param loop integer 循环模式(AnimMode)
---@return boolean result
function Block:PlayAnim(pos, animid, speed, loop) end

---设置方块设置属性状态
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@param attrtype integer 属性枚举(BlockLimits)
---@param switch boolean 是否开关
---@return boolean result
function Block:SetBlockSettingAttState(x, y, z, attrtype, switch) end

---获取方块设置属性状态
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@param attrtype integer 属性枚举(BlockAttr)
---@return boolean state
function Block:GetBlockSettingAttState(x, y, z, attrtype) end

---获取功能方块的开关状态
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@return boolean status
function Block:GetBlockSwitchStatus(x, y, z) end

---获取方块的通电状态
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@return boolean status
function Block:GetBlockPowerStatus(x, y, z) end

---在资源库里随机获取一个方块
---@return integer blockid 随机的方块类型
function Block:RandomBlockID() end

---获取方块名称
---@param blockid integer | string 方块类型ID
---@return string name 方块名称
function Block:GetBlockDefName(blockid) end

---获取方块描述
---@param blockid integer | string 方块类型ID
---@return string ret 方块描述
function Block:GetBlockDefDesc(blockid) end

---放置蓝图
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@param blueprint string 蓝图资源ID
---@param angle number 旋转角度
---@param mirror boolean 是否镜像
---@param placeMode boolean 是否蓝图区域全部覆盖
---@return boolean result
function Block:ReplaceBluePrint(x, y, z, blueprint, angle, mirror, placeMode) end

---播放方块裂纹特效
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@param process integer 进度(1~10)
---@return boolean result
function Block:PlayCrackEffect(x, y, z, process) end

---播放方块损毁特效
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@return boolean result
function Block:PlayDestroyEffect(x, y, z) end

---获取方块掉落物信息
---@param blockid integer | string 方块ID
---@param itype integer 类型（1手持敲方块，2手持道具正确，3手持道具不正确）
---@return [integer | string, integer, number] dropinfo 返回掉落道具信息{itemid, itemnum, odds} 道具,数量,概率
function Block:GetBlockDropItemType(blockid, itype) end

---获取方块的采集经验
---@param blockid integer | string 方块ID
---@return number exp 经验值
function Block:GetBlockDropExp(blockid) end

---设置方块颜色
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@param color integer 颜色值
---@return boolean result
function Block:SetBlockColor(x, y, z, color) end

---设置方块开关状态
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@param isactive boolean 是否开启
---@return boolean result
function Block:SetBlockSwichState(x, y, z, isactive) end

---设置方块方向
---@param x integer 位置坐标
---@param y integer 位置坐标
---@param z integer 位置坐标
---@param dir integer 方向值(FaceDir)
---@return boolean result
function Block:SetBlockDir(x, y, z, dir) end

---获取方块类型外观
---@param blockid integer | string 方块类型ID或方块预制ID
---@return string facade 方块类型外观
function Block:GetFacade(blockid) end

---设置方块纹理颜色（仅支持草块、土块、树叶、花草等方块，其它方块暂不支持；设置后不会存档；玩法转编辑后需要重进地图才可还原）
---@param blockid integer | string 方块类型ID
---@param color integer 颜色值(0:还原默认颜色)
---@param alpha number 混合比例(0-100)
---@param slotindex integer 材质槽索引(默认1)
---@return boolean result
function Block:SetBlockTextureColor(blockid, color, alpha, slotindex) end