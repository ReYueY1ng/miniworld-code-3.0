---@meta

---官方环境独有接口（环境表 face=official，1.60.0）· Block<br>
---这些接口仅存在于官方环境，默认关闭。
---在 Lua.runtime.pluginArgs 中设置 "officialApi=enable" 开启。<br>
---[官方 Wiki](https://dev-wiki.mini1.cn/ugc-wiki/)

---官方环境独有接口（未收录于开发环境）
---@param blockid? string
---@param data any
---@param dir any
function Block:ConvertBlockDirToData(blockid, data, dir) end

---官方环境独有接口（未收录于开发环境）
---@param pos Mini.Vec3
---@param dim Mini.Vec3
---@param name string
---@param worldId? any
---@return boolean
function Block:CreateNormalBluePrintByName(pos, dim, name, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param x number
---@param y number
---@param z number
---@param worldId any
function Block:GetBlockCfgID(x, y, z, worldId) end

---官方环境独有接口（未收录于开发环境）
---@param blockid? string
---@param dir any
function Block:GetBlockDataByDir(blockid, dir) end

---官方环境独有接口（未收录于开发环境）
---@param blockid? string
function Block:GetBlockDefType(blockid) end

---官方环境独有接口（未收录于开发环境）
---@param blockid? string
function Block:GetBlockToolType(blockid) end

---官方环境独有接口（未收录于开发环境）
---@param uin any
function Block:GetBluePrintManager(uin) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
---@param animid any
---@param playmode any
---@return boolean
function Block:PlayAct(x, y, z, animid, playmode) end

---官方环境独有接口（未收录于开发环境）
---@param x number
---@param y number
---@param z number
---@param particleId any
---@param scale? number
---@param ptime number
---@return boolean
function Block:PlayParticleEffect(x, y, z, particleId, scale, ptime) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
---@param particleId any
---@param scale? number
---@param ptime? any
---@return boolean
function Block:PlayParticleEffectWorld(x, y, z, particleId, scale, ptime) end

---官方环境独有接口（未收录于开发环境）
---@param x number
---@param y number
---@param z number
---@param particleId any
---@return boolean
function Block:StopParticleEffectOnPos(x, y, z, particleId) end

---官方环境独有接口（未收录于开发环境）
---@param x any
---@param y any
---@param z any
---@param particleId any
---@return boolean
function Block:StopParticleEffectWorld(x, y, z, particleId) end
