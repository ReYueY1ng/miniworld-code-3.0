---@meta

---模型组件接口（内置组件 Model）<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/cmpapis/model.html)
---@class Model: Component
Model = {}

---添加Avatar部件
---请求给角色身体添加Avatar模型部件，底层关闭额外检查；需要对象、模型组件及绑定存在，不等待加载，不返回结果。
---@param ePart Mini.Number Avatar部位编号，见Avatar_Parts枚举。
---@param idModel Mini.Number Avatar模型ID；非正值用于隐藏部件。
function Model:AddAvatarPartModel(ePart, idModel) end

---alteravatar部件颜色
---返回值类型未在 wiki 声明。
---@param idModel any （wiki 未声明类型，此处用 any）
---@param ePart any （wiki 未声明类型，此处用 any）
---@param aMaskToColors any （wiki 未声明类型，此处用 any）
function Model:AlterAvatarPartColor(idModel, ePart, aMaskToColors) end

---按挂点新增子部件
---追加子部件后依次设置类型、挂点和模型；编号只代表新增的数据项，不保证挂点有效或资源已加载。
---@param modelStr Mini.Model 模型资源串，如UGCPackage_s_资源ID或mob_3101。
---@param anchorId Mini.Number 挂点编号，见GunAnchorType或AvatarAnchorType。
---@param partType Mini.Number 部件类型：0普通，1 Avatar。
---@return Mini.Number result 返回新增部件从1开始的编号，亦为追加后的部件数量；缺少对象、组件或实体导致追加失败时返回0。
function Model:AddAnchorMeshItemWithParam(modelStr, anchorId, partType) end

---检查挂点子部件
---检查子部件记录中是否存在指定挂点，不证明当前可见或完成加载。
---@param anchorId Mini.Number 枪械或Avatar挂点编号。
---@return Mini.Bool result 存在至少一个匹配项返回true；参数无效、未找到或缺少对象/组件返回false。
function Model:HasAnchorMesh(anchorId) end

---设置肤色子部件模型
---更新已有SKIN挂点贴图部件并请求异步换图，不新增部件；缺少对象或组件时不执行，无返回值，不保证加载成功。
---@param modelStr Mini.Model 贴图模型资源串；空字符串恢复原贴图。
function Model:SetSkinAnchorItemModel(modelStr) end

---获取挂点子部件索引
---读取首个匹配挂点的底层索引，从0开始；传给本组件大多数子部件修改接口前须加1。
---@param anchorId Mini.Number 枪械或Avatar挂点编号。
---@return Mini.Number value 返回首个匹配项从0开始的索引；参数无效、未找到或缺少对象/组件时返回-1。
function Model:GetAnchorMeshIdByType(anchorId) end

---获取全部锚点mesh道具
---返回值类型未在 wiki 声明。
function Model:GetAllAnchorMeshItem() end

---设置皮肤特效更新
---设置角色身体的皮肤特效更新开关；依赖对象、模型组件、绑定及身体，不代表立即刷新或同步完成，无返回值。
---@param flag Mini.Bool true启用皮肤特效更新，false关闭。
function Model:SetNeedUpdateSkinEffect(flag) end

---设置渲染朝向更新
---设置角色身体的渲染朝向偏移更新开关，启用时还将现有主模型局部旋转清零；缺少对象、组件、绑定或身体时不执行，无返回值。
---@param flag Mini.Bool true启用渲染朝向更新，false关闭。
function Model:SetNeedUpdateRenderYawOffset(flag) end

---设置头部视线更新
---设置角色身体的头部视线更新开关；实际执行还受动画能否转头等条件影响，缺少对象、组件、绑定或身体时不执行，无返回值。
---@param flag Mini.Bool true允许头部视线更新，false关闭。
function Model:SetNeedUpdateLookUp(flag) end

---设置模型可见性
---设置模型可见性；同值时提前返回。非单机路径在编辑器隐藏期间请求显示时只记录状态，组件禁用时底层可能不应用，无返回值。
---@param value Mini.Bool true显示，false隐藏。
---@param forceSet? Mini.Bool 强制设置，默认false；同值仍会跳过。
function Model:SetVisibility(value, forceSet) end

---获取骨骼世界坐标
---查询主模型骨骼的原生世界坐标；需有主模型与蒙皮骨架。本函数不做除100换算，实际共返回成功标志及X/Y/Z三个数值，当前单返回槽仅声明首个标志。
---@param name Mini.String 主模型中的真实骨骼名称。
---@return Mini.Bool value 首个返回值为是否找到骨骼；成功还返回原生世界坐标X/Y/Z，失败时为false,0,0,0。缺少对象、组件、绑定、主模型、骨架或骨骼均视为失败；后3个返回值未单独声明类型槽。
function Model:GetBonePositionByName(name) end

---设置身体子网格可见性
---先检查角色身体是否存在该子网格，再请求设置其显示状态；不修改子部件组中的visibility。
---@param name Mini.String 角色身体的子网格名称。
---@param isshow? Mini.Bool true显示，false隐藏，默认false。
---@return Mini.Bool result 存在目标网格时返回身体显示接口结果；名称类型错误、无对象或找不到网格时返回false。
function Model:SetSubMeshVisible(name, isshow) end

---设置自定义模型启用
---设置模型组件启用状态，不代表资源已经加载或模型当前可见。
---@param value Mini.Bool true启用自定义模型，false禁用。
---@return Mini.Bool result 布尔参数且调用到模型组件时返回true；缺少对象或组件时返回false；参数类型错误时实际返回nil。
function Model:SetCustomModel(value) end

---设置子部件染色
---请求设置指定子部件的一个遮罩染色区域；参数均须为数字，缺少组件/实体或编号越界时不执行，不保证贴图处理或最终显示完成，无返回值。
---@param r Mini.Number 红通道，通常0～1。
---@param g Mini.Number 绿通道，通常0～1。
---@param b Mini.Number 蓝通道，通常0～1。
---@param iMesh Mini.Number 子部件编号，从1开始，0不表示全部。
---@param ePart Mini.Number Avatar部位编号。
---@param idModel Mini.Number 原贴图与遮罩使用的Avatar模型ID。
---@param iMask Mini.Number 染色遮罩编号：1、2、3。
function Model:SetAnchorMeshColor(r, g, b, iMesh, ePart, idModel, iMask) end

---设置子部件可见性
---记录并请求应用指定或全部子部件的可见性；加载期间可延后应用，Avatar项经身体Avatar组件处理，其他项更新绑定物体，无返回值。
---@param iMesh Mini.Number 子部件编号，从1开始；小于等于0表示全部。
---@param visible Mini.Bool true显示，false隐藏。
function Model:SetAnchorMeshVisiblity(iMesh, visible) end

---获取完整模型数据
---读取包含运行期间已写入修改的模型组件JSON数据，不等待异步加载，也不证明客户端最终显示状态。
---@return Mini.String value 返回紧凑JSON字符串；底层无组件数据时为空字符串，缺少对象或模型组件时返回nil。
function Model:GetModelData() end

---设置锚点mesh组
---返回值类型未在 wiki 声明。
---@param value any （wiki 未声明类型，此处用 any）
function Model:SetAnchorMeshGroup(value) end

---获取模型
---读取当前模型组件记录的资源标识字符串，不等待模型加载完成。
---@return Mini.Model value 返回模型资源串；未取得对象或模型组件时返回 nil。
function Model:GetModel() end

---设置模型
---按模型资源串设置对象模型；会清空材质和子部件缓存，模型串改变时先移除旧子部件。资源加载与最终显示另行完成；本声明未开放实际返回值。
---@param value Mini.Model 类型_标识形式的模型资源串，如mob_3101或itemprefab_预制ID。
function Model:SetModel(value) end

---获取颜色
---读取指定材质的 RGB 颜色并转换为十六进制字符串；实际返回字符串，沿用现有 Mini.Color 类型槽。
---@param index Mini.Number 材质序号，从1开始。
---@return Mini.Color value 返回小写 0xrrggbb 字符串；索引越界时为 0xffffff，未取得对象或模型组件时为 nil。
function Model:GetColor(index) end

---设置颜色
---设置材质 RGB 颜色，Alpha 固定为 1；编号 0 或合并子网格模型会设置全部材质。参数错误时不执行，无返回值。
---@param index Mini.Number 材质序号，从1开始，0表示全部。
---@param value Mini.Color RGB数值、十六进制串或{r,g,b}，通道0～255，忽略Alpha。
function Model:SetColor(index, value) end

---获取材质透明度
---读取指定材质的不透明度，不等待模型加载；0 全透明，1 完全不透明。
---@param index Mini.Number 材质序号，从1开始。
---@return Mini.Number value 返回 0～1 的材质不透明度；索引越界时底层返回 0，未取得对象或模型组件时返回 1.0。
function Model:GetAlpha(index) end

---设置材质透明度
---设置材质不透明度，底层将数值截断至 0～1；模型加载期间可先记录，最终表现受材质支持情况影响，无返回值。
---@param index Mini.Number 材质序号，从1开始，0表示全部。
---@param value Mini.Number 不透明度，0透明、1不透明；超范围截断。
function Model:SetAlpha(index, value) end

---播放动画
---将动画标识转换为字符串后请求角色播放动画；循环参数转换为角色动画循环模式。实际布尔返回值未在本声明中开放，不代表动画已显示。
---@param tag Mini.ModelAction 模型动画名称或编号。
---@param speed Mini.Number 播放速度倍率，1为原速。
---@param isLoop Mini.Bool true循环播放，false单次播放。
function Model:PlayAni(tag, speed, isLoop) end

---新增子部件
---追加一个子部件并设置模型、挂点及局部变换；非空挂点名交给底层校验，空挂点名改用头部挂点。无返回值，追加成功不代表模型已加载。
---@param modelStr Mini.Model 子部件模型资源串，如mob_3101。
---@param boneName Mini.SkeletonPoint 骨骼挂点名称；为空时使用头部挂点。
---@param pos? Mini.Vec3 挂点相对位置{x,y,z}，场景单位；省略不设置。
---@param scale? Mini.Scale 各轴缩放{x,y,z}，1为原大小；省略不设置。
---@param rotate? Mini.Rotation 局部欧拉角{x,y,z}，单位度；省略不设置。
---@param partName? Mini.String 子部件名称，允许重名；省略时自动命名。
function Model:AddAnchorMeshItemForTrigger(modelStr, boneName, pos, scale, rotate, partName) end

---删除子部件（骨骼）
---删除骨骼挂点名完全匹配的所有子部件，并提交部件变更；无匹配时不删除，无返回值。
---@param boneName Mini.SkeletonPoint 需要删除的骨骼挂点名称。
function Model:RemoveAnchorMeshItemByBoneName(boneName) end

---删除子部件（部件名）
---删除部件标识完全匹配的所有子部件，并提交部件变更；重名部件会一起删除，无返回值。
---@param partName Mini.String 需要删除的子部件名称；重名项一起删除。
function Model:RemoveAnchorMeshItemByName(partName) end

---删除子部件（编号）
---按当前顺序删除子部件；小于等于 0 时删除全部，大于 0 时删除指定编号，无返回值。
---@param index Mini.Number 子部件编号，从1开始；小于等于0删除全部。
function Model:RemoveAnchorMeshItem(index) end

---修改子部件
---修改已有子部件的模型、名称与局部变换；编号小于等于 0 时遍历全部。非空骨骼名提交底层校验，空值保留原挂点；不新增部件，无返回值。
---@param index Mini.Number 子部件编号，从1开始；小于等于0修改全部。
---@param modelStr Mini.Model 子部件模型资源串，如mob_3101。
---@param boneName Mini.SkeletonPoint 骨骼挂点名称；为空时保留原挂点。
---@param pos? Mini.Vec3 挂点相对位置{x,y,z}，场景单位；省略保留原值。
---@param scale? Mini.Scale 各轴缩放{x,y,z}，1为原大小；省略保留原值。
---@param rotate? Mini.Rotation 局部欧拉角{x,y,z}，单位度；省略保留原值。
---@param partName? Mini.String 子部件名称，允许重名；省略保留原名。
function Model:SetAnchorMeshItemAttribute(index, modelStr, boneName, pos, scale, rotate, partName) end

---设置子模型可见性
---记录指定子模型名称的可见性并请求更新，主模型加载期间延后应用；实际布尔返回值未在本声明中开放，true 仅表示已提交给模型组件。
---@param name Mini.String 当前模型中的子模型名称。
---@param visible Mini.Bool true显示、false隐藏；兼容字符串true/false。
function Model:SetSubModelVisible(name, visible) end

---设置矩阵vector2f
---返回值类型未在 wiki 声明。
---@param index any （wiki 未声明类型，此处用 any）
---@param key any （wiki 未声明类型，此处用 any）
---@param valueTable any （wiki 未声明类型，此处用 any）
function Model:SetMatVector2f(index, key, valueTable) end

---设置材质三维向量
---设置材质着色器三维向量，需先等待IsMatInited()为true；参数错误、仍在加载或缺少对象/组件时不执行，底层布尔结果不向上传递，无返回值。
---@param index Mini.Number 材质序号，从1开始，0表示全部。
---@param key Mini.String 着色器三维向量属性名。
---@param valueTable Mini.Vec3 三维向量{x,y,z}，单位由着色器属性定义。
function Model:SetMatVector3f(index, key, valueTable) end

---设置矩阵vector4f
---返回值类型未在 wiki 声明。
---@param index any （wiki 未声明类型，此处用 any）
---@param key any （wiki 未声明类型，此处用 any）
---@param valueTable any （wiki 未声明类型，此处用 any）
function Model:SetMatVector4f(index, key, valueTable) end

---设置材质颜色属性
---设置材质着色器RGBA颜色，需先等待IsMatInited()为true；加载期间底层拒绝设置。参数类型错误或缺少对象/组件时不执行，底层布尔结果不向上传递，无返回值。
---@param index Mini.Number 材质序号，从1开始，0表示全部。
---@param key Mini.String 着色器颜色属性名。
---@param valueTable Mini.Color RGBA颜色表{r,g,b,a}，四通道必填，通常0～255。
function Model:SetMatColor(index, key, valueTable) end

---设置材质数值属性
---设置材质着色器数值属性，需先等待IsMatInited()为true；参数错误、仍在加载或缺少对象/组件时不执行，底层布尔结果不向上传递，无返回值。
---@param index Mini.Number 材质序号，从1开始，0表示全部。
---@param key Mini.String 着色器数值属性名。
---@param value Mini.Number 属性数值，单位和范围由着色器定义。
function Model:SetMatFloat(index, key, value) end

---设置材质布尔属性
---设置材质着色器布尔关键字，需先等待IsMatInited()为true；参数错误、仍在加载或缺少对象/组件时不执行，底层布尔结果不向上传递，无返回值。
---@param index Mini.Number 材质序号，从1开始，0表示全部。
---@param key Mini.String 着色器关键字名称。
---@param value Mini.Bool true启用关键字，false关闭。
function Model:SetMatBool(index, key, value) end

---设置材质贴图属性
---请求设置和加载材质贴图，需先等待IsMatInited()为true；参数错误、名称/资源为空、仍在加载或缺少对象/组件时不执行，不保证异步加载成功，底层返回值不向上传递。
---@param index Mini.Number 材质序号，从1开始，0表示全部。
---@param key Mini.String 非空的着色器贴图属性名。
---@param value Mini.String 贴图标识：8_云资源两段ID、0_内置UI资源ID或本地资源路径。
function Model:SetMatTexture(index, key, value) end

---获取材质颜色属性
---先读组件记录的颜色属性，客户端可回退读取材质；实际返回普通Lua表{r,g,b,a}，使用Mini.Color描述同形颜色数据，不构造Mini.Color实例。
---@param index Mini.Number 材质序号，从1开始。
---@param key Mini.String 着色器颜色属性名。
---@return Mini.Color value 返回含r/g/b/a的表，底层归一化通道各乘255，不取整；编号越界或未找到属性时四通道均为255。参数类型错误或缺少对象/组件时返回nil。
function Model:GetMatColor(index, key) end

---获取材质数值属性
---先读组件记录的数值属性，客户端可回退读取材质。
---@param index Mini.Number 材质序号，从1开始。
---@param key Mini.String 着色器数值属性名。
---@return Mini.Number value 返回记录或材质中的数值；编号越界或未找到属性时为1.0，参数类型错误或缺少对象/组件时返回nil。
function Model:GetMatFloat(index, key) end

---获取材质布尔属性
---先读组件记录的布尔关键字，客户端可回退读取材质。
---@param index Mini.Number 材质序号，从1开始。
---@param key Mini.String 着色器关键字名称。
---@return Mini.Bool value 返回关键字状态；编号越界、关键字不存在或未启用时为false，参数类型错误或缺少对象/组件时为nil。
function Model:GetMatBool(index, key) end

---获取矩阵vector2f
---返回值类型未在 wiki 声明。
---@param index any （wiki 未声明类型，此处用 any）
---@param key any （wiki 未声明类型，此处用 any）
function Model:GetMatVector2f(index, key) end

---获取材质三维向量
---先读组件记录的三维向量，客户端可回退读取材质；实际返回普通Lua表{x,y,z}，Mini.Vec3只描述同形数据，不执行坐标换算。
---@param index Mini.Number 材质序号，从1开始。
---@param key Mini.String 着色器三维向量属性名。
---@return Mini.Vec3 value 返回含x/y/z的原始数值表；编号越界或未找到属性时各分量均为0，参数类型错误或缺少对象/组件时为nil。
function Model:GetMatVector3f(index, key) end

---获取矩阵vector4f
---返回值类型未在 wiki 声明。
---@param index any （wiki 未声明类型，此处用 any）
---@param key any （wiki 未声明类型，此处用 any）
function Model:GetMatVector4f(index, key) end

---查询材质初始化状态
---查询模型组件是否结束等待模型加载阶段，可作SetMat系列前置条件；不证明所有异步贴图或最终画面已完成。
---@return Mini.Bool result 底层不再等待模型加载时返回true；仍在等待或缺少对象/组件时返回false。
function Model:IsMatInited() end
