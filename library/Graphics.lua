---@meta

---图文信息模块管理接口  
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/graphics.html)
---@class Graphics
Graphics = {}

---创建文字板信息
---@param title string 文本内容
---@param font number 字体大小
---@param apha number 不透明度
---@param itype integer 文字板ID
---@param autoWrap? boolean 自动换行（默认自动换行）
---@return table info 文本信息内容
function Graphics:MakeGraphicsText(title, font, apha, itype, autoWrap) end

---创建漂浮文字信息
---@param title string 文本信息
---@param font number 字体大小
---@param apha number 不透明度
---@param itype integer 漂浮文字ID
---@return table info 漂浮文字信息内容
function Graphics:MakeflotageText(title, font, apha, itype) end

---创建进度条信息
---@param v1 number 当前值
---@param v2 number 最大值
---@param color number 颜色值(0xFFFFFF)
---@param itype integer 进度条ID
---@return table info 进度条信息内容
function Graphics:MakeGraphicsProgress(v1, v2, color, itype) end

---生成指向位置的箭头数据
---@param x number 方块坐标
---@param y number 方块坐标
---@param z number 方块坐标
---@param size number 缩放值
---@param color number 颜色值(0xFFFFFF)
---@param itype integer 箭头ID
---@return table info 箭头信息内容
function Graphics:MakeGraphicsArrowToPos(x, y, z, size, color, itype) end

---生成指向位置的线数据
---@param x number 方块坐标
---@param y number 方块坐标
---@param z number 方块坐标
---@param size number 缩放值
---@param color number 颜色值(0xFFFFFF)
---@param itype integer 线ID
---@return table info 线信息内容
function Graphics:MakeGraphicsLineToPos(x, y, z, size, color, itype) end

---生成指向位置的面数据
---@param x number 方块坐标
---@param y number 方块坐标
---@param z number 方块坐标
---@param size number 缩放值
---@param color number 颜色值(0xFFFFFF)
---@param itype integer 面ID
---@return table info 面信息内容
function Graphics:MakeGraphicsSurfaceToPos(x, y, z, size, color, itype) end

---生成指向对象的箭头数据
---@param objid integer 对象数据
---@param size number 缩放值
---@param color number 颜色值(0xFFFFFF)
---@param itype integer 箭头ID
---@return table info 箭头信息内容
function Graphics:MakeGraphicsArrowToActor(objid, size, color, itype) end

---生成指向对象的线数据
---@param objid integer 对象数据
---@param size number 缩放值
---@param color number 颜色值(0xFFFFFF)
---@param itype integer 线ID
---@return table info 线信息内容
function Graphics:MakeGraphicsLineToActor(objid, size, color, itype) end

---生成指向对象的面数据
---@param objid integer 对象数据
---@param size number 缩放值
---@param color number 颜色值(0xFFFFFF)
---@param itype integer 面ID
---@return table info 面信息内容
function Graphics:MakeGraphicsSurfaceToActor(objid, size, color, itype) end

---生成图片信息
---@param imgid string 图片ID
---@param scale number 缩放值
---@param apha number 透明度（0~100）
---@param itype integer 图文信息ID
---@return table info 图片信息内容
function Graphics:MakeGraphicsImage(imgid, scale, apha, itype) end

---创建图文信息
---@param x number 方块坐标
---@param y number 方块坐标
---@param z number 方块坐标
---@param graphicInfo table 图文信息
---@param x2? number X坐标偏移(缺省参数)
---@param y2? number Y坐标偏移(缺省参数)
---@return integer ret 图文对象id
function Graphics:CreateGraphicsTxtByPos(x, y, z, graphicInfo, x2, y2) end

---在生物身上创建文字板
---@param objid integer 对象objid
---@param info table 图文信息
---@param dir PositionTable 方向值（x,y,z）
---@param offest number 方向偏移距离
---@param x2? number X坐标偏移(缺省参数)
---@param y2? number Y坐标偏移(缺省参数)
---@return integer ret 图文实例ID
function Graphics:CreateGraphicsTxtByActor(objid, info, dir, offest, x2, y2) end

---在位置上创建漂浮文字
---@param x number 方块坐标
---@param y number 方块坐标
---@param z number 方块坐标
---@param info table 图文信息
---@param x2? number X坐标偏移(缺省参数)
---@param y2? number Y坐标偏移(缺省参数)
---@return integer ret 图文实例ID
function Graphics:CreateflotageTextByPos(x, y, z, info, x2, y2) end

---在生物身上创建漂浮文字
---@param objid integer 对象objid
---@param info table 图文信息
---@param dir PositionTable 方向值（x,y,z）
---@param offest number 方向偏移距离
---@param x2? number X坐标偏移(缺省参数)
---@param y2? number Y坐标偏移(缺省参数)
---@return integer ret 实例ID
function Graphics:CreateflotageTextByActor(objid, info, dir, offest, x2, y2) end

---在位置上创建进度条
---@param x number 方块坐标
---@param y number 方块坐标
---@param z number 方块坐标
---@param info table 图文信息
---@param x2? number X坐标偏移(缺省参数)
---@param y2? number Y坐标偏移(缺省参数)
---@return integer ret 实例ID
function Graphics:CreateGraphicsProgressByPos(x, y, z, info, x2, y2) end

---在生物身上创建进度条
---@param objid integer 对象ID
---@param info table 图文信息
---@param dir PositionTable 方向值（x,y,z）
---@param offest number 方向偏移距离
---@param x2? number X坐标偏移(缺省参数)
---@param y2? number Y坐标偏移(缺省参数)
---@return integer ret 实例ID
function Graphics:CreateGraphicsProgressByActor(objid, info, dir, offest, x2, y2) end

---删除位置上的图文信息
---@param x number 方块坐标
---@param y number 方块坐标
---@param z number 方块坐标
---@param itype integer 图文信息ID
---@param graphType integer 图文类型枚举值(GraphicsType)
---@return boolean result
function Graphics:RemoveGraphicsByPos(x, y, z, itype, graphType) end

---删除生物的图文信息
---@param objid integer 对象objid
---@param itype integer 图文信息ID
---@param graphType integer 图文类型枚举值(GraphicsType)
---@return boolean result
function Graphics:RemoveGraphicsByObjID(objid, itype, graphType) end

---更新图文信息的文字内容
---@param graphid integer 文字板实例ID
---@param title string 文本内容
---@param fontsize number 字体大小
---@param apha number 不透明度
---@param isync boolean 是否同步到客机(间隔N帧刷新只需要最后一次传true即可)
---@return boolean result
function Graphics:UpdateGraphicsTextById(graphid, title, fontsize, apha, isync) end

---更新进度条的进度
---@param graphid integer 进度条实例ID
---@param val1 number 当前值
---@param val2 number 最大值
---@param isync boolean 是否同步到客机(间隔N帧刷新只需要最后一次传true即可)
---@return boolean result
function Graphics:UpdateGraphicsProgressById(graphid, val1, val2, isync) end

---创建生物指向位置的箭头
---@param objid integer 对象objid
---@param info table 图文信息
---@param dir PositionTable 方向值（x,y,z）
---@param offset number 方向偏移距离
---@return boolean result
function Graphics:CreateGraphicsArrowByActorToPos(objid, info, dir, offset) end

---创建生物指向生物的箭头
---@param objid integer 对象objid
---@param info table 图文信息
---@param dir PositionTable 方向值（x,y,z）
---@param offset number 方向偏移距离
---@return boolean result
function Graphics:CreateGraphicsArrowByActorToActor(objid, info, dir, offset) end

---创建位置指向位置的箭头
---@param pos PositionTable 位置坐标（x,y,z）
---@param info table 图文信息
---@return boolean result
function Graphics:CreateGraphicsArrowByPosToPos(pos, info) end

---创建位置指向生物的箭头
---@param pos PositionTable 位置坐标（x,y,z）
---@param info table 图文信息
---@return boolean result
function Graphics:CreateGraphicsArrowByPosToActor(pos, info) end

---创建生物与位置的线
---@param objid integer 对象objid
---@param info table 图文信息
---@param dir PositionTable 方向值（x,y,z）
---@param offset number 方向偏移距离
---@return boolean result
function Graphics:CreateGraphicsLineByActorToPos(objid, info, dir, offset) end

---创建指向生物的线
---@param objid integer 对象objid
---@param info table 图文信息
---@param dir PositionTable 方向值（x,y,z）
---@param offset number 方向偏移距离
---@return boolean result
function Graphics:CreateGraphicsLineByActorToActor(objid, info, dir, offset) end

---创建位置指向位置的线
---@param pos PositionTable 位置坐标（x,y,z）
---@param info table 图文信息
---@return boolean result
function Graphics:CreateGraphicsLineByPosToPos(pos, info) end

---创建位置指向生物的线
---@param pos PositionTable 位置坐标（x,y,z）
---@param info table 图文信息
---@return boolean result
function Graphics:CreateGraphicsLineByPosToActor(pos, info) end

---创建生物与位置的面
---@param objid integer 对象objid
---@param info table 图文信息
---@param dir PositionTable 方向值（x,y,z）
---@param offset number 方向偏移距离
---@return boolean result
function Graphics:CreateGraphicsSurfaceByActorToPos(objid, info, dir, offset) end

---创建生物与生物的引导面
---@param objid integer 对象objid
---@param info table 图文信息
---@param dir PositionTable 方向值（x,y,z）
---@param offest number 方向偏移距离
---@return boolean result
function Graphics:CreateGraphicsSurfaceByActorToActor(objid, info, dir, offest) end

---创建位置指向位置的面
---@param pos PositionTable 位置坐标（x,y,z）
---@param info table 图文信息
---@return boolean result
function Graphics:CreateGraphicsSurfaceByPosToPos(pos, info) end

---创建位置指向生物的面
---@param pos PositionTable 位置坐标（x,y,z）
---@param info table 图文信息
---@return boolean result
function Graphics:CreateGraphicsSurfaceByPosToActor(pos, info) end

---将src相关的所有图文信息，转移到des身上
---@param srcObjid integer 对象ID
---@param desObjid integer 对象ID
---@return boolean result
function Graphics:ReplaceAllGraphics(srcObjid, desObjid) end

---在位置上创建图像
---@param x number 方块坐标
---@param y number 方块坐标
---@param z number 方块坐标
---@param info table 图文信息
---@param x2? number X坐标偏移(缺省参数)
---@param y2? number Y坐标偏移(缺省参数)
---@return boolean result
function Graphics:CreateGraphicsImageByPos(x, y, z, info, x2, y2) end

---在生物上创建图像
---@param objid integer 对象ID
---@param info table 图文信息
---@param dir PositionTable 方向值（x,y,z）
---@param offest number 方向偏移距离
---@param x2? number X坐标偏移(缺省参数)
---@param y2? number Y坐标偏移(缺省参数)
---@return boolean result
function Graphics:CreateGraphicsImageByActor(objid, info, dir, offest, x2, y2) end

---获取玩家昵称或称号的偏移高度 玩家脚本调用
---@param objid integer 对象ID
---@param itype integer 类型(PlayerNameType)
---@param callback fun(height: number) 回调函数 height: 高度值（未展示 0）
function Graphics:GetInnerGraphicsOffset(objid, itype, callback) end