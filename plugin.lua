-- Mini World UGC 3.0 LuaLS Plugin
-- Provides custom diagnostics for component validation.
--
-- IMPORTANT: This plugin uses the defineDiagnostic hack from LuaLS#2511.
-- It requires LuaLS to run with --develop=true flag:
--   * VS Code:  "Lua.languageServer.runtime.develop": true
--   * CLI:      lua-language-server --develop=true
--
-- Without --develop=true the plugin loads harmlessly but diagnostics are disabled.
-- See: https://github.com/LuaLS/lua-language-server/issues/2511

---@alias DiagnosticSeverity
---| "Error"
---| "Warning"
---| "Information"
---| "Hint"

---@alias DiagnosticNeededFileStatus
---| "Any"
---| "Opened"
---| "None"

---Register a custom diagnostic with LuaLS internals.
---Uses the hack from https://github.com/LuaLS/lua-language-server/issues/2511.
---Requires --develop=true to expose proto.diagnostic and proto.define.
---@param name string Diagnostic name (e.g. "miniworld-keyword")
---@param group string Diagnostic group (e.g. "custom")
---@param severity DiagnosticSeverity Default severity level
---@param fileStatus DiagnosticNeededFileStatus File status required for the diagnostic
---@param func fun(uri: string, callback: fun(data: {start: number, finish: number, message: string, severity?: DiagnosticSeverity})) Diagnostic implementation
---@return boolean ok Whether the diagnostic was registered successfully
local function defineDiagnostic(name, group, severity, fileStatus, func)
    local ok1, protoDiagnostic = pcall(require, "proto.diagnostic")
    if not ok1 then
        return false
    end

    local ok2, protoDefine = pcall(require, "proto.define")
    if not ok2 then
        return false
    end

    local ok3, _ = pcall(function()
        protoDiagnostic.register{name}{
            group    = group,
            severity = severity,
            status   = fileStatus,
        }
        protoDiagnostic._diagAndErrNames[name] = true
        protoDefine.DiagnosticDefaultSeverity[name] = severity
        protoDefine.DiagnosticDefaultNeededFileStatus[name] = fileStatus
        package.loaded["core.diagnostics." .. name] = func
    end)

    if not ok3 then
        return false
    end

    return true
end

local ForbidDevParamType = {
    CheckList    = true,
    Action       = true,
    PathPoint    = true,
    Scale        = true,
    Rotation     = true,
    SkeletonPoint = true,
    Vec2         = true,
    BiomeType    = true,
    EntityType   = true,
    ThrowItem    = true,
    DropItem     = true,
    Object       = true,
    Role         = true,
    UiElement    = true,
    UiState      = true,
    Entity       = true,
    Mob          = true,
    Player       = true,
}

local ForbidDevArrayParamType = {
    CustomMsg    = true,
    Vec2         = true,
    Vec3         = true,
}

local disabledLibs = {
    rawset    = true,
    require   = true,
    io        = true,
    debug     = true,
    ffi       = true,
    jit       = true,
    package   = true,
    loadstring = true,
    loadfile  = true,
    dofile    = true,
}

local keywords = {
    isValid = true, __isEnable = true, __className_ = true,
    OnDestroy = true, OnTick = true, OnDisable = true,
    OnEnable = true, OnStart = true, transform = true,
    gameObject = true, __PropertysChangeEventList = true, OnUpdate = true,
}

local mustFnList = {
    OnStart = true, OnEnable = true, OnDisable = true,
    OnDestroy = true, OnTick = true,
}

local baseComponent = {
    GetGameObject = true, GetGameObjectId = true, IsValid = true,
    AddComponent = true, RemoveComponent = true, GetComponent = true,
    PushCustomEvent = true, PushCustomEventSync = true,
    AddCustomEvent = true, RemoveCustomEvent = true,
    PushEvent = true, PushEventSync = true,
    AddEvent = true, RemoveEvent = true,
    DoTaskInTime = true, DoPeriodicTask = true, ClearAllTask = true,
    SetEventIsEnable = true, ThreadWork = true, ThreadWait = true,
    PushCloudServerMsg = true, AddCloudSeverEvent = true, RemoveCloudSeverEvent = true,
}

local nonFunctionTypes = {
    boolean = true, string = true, number = true, integer = true,
    table = true, ["nil"] = true,
}

---@param uri string
---@return table|nil
local function getState(uri)
    local ok, files = pcall(require, 'files')
    if not ok then return nil end
    return files.getState(uri)
end

---@param obj table
---@return string|nil
local function getKeyName(obj)
    if not obj then return nil end
    if obj.type == 'tablefield' then
        return obj.field and obj.field[1]
    elseif obj.type == 'tableindex' then
        if obj.index then
            if obj.index.type == 'string' then
                return obj.index[1]
            elseif obj.index.type == 'number' then
                return tostring(obj.index[1])
            end
        end
    end
    return nil
end

---@param source table
---@param key string
---@return table|nil
local function getTableFieldValue(source, key)
    for _, obj in ipairs(source) do
        if getKeyName(obj) == key then
            return obj.value
        end
    end
    return nil
end

---@param node table
---@return boolean, string|nil
local function getMiniTypeName(node)
    if not node then return false, nil end
    if node.type == 'getfield' then
        if node.node and node.node.type == 'getglobal' then
            local baseName = node.node[1]
            if baseName == 'Mini' then
                local fieldName = node.field and node.field[1]
                if fieldName then
                    return true, 'Mini.' .. fieldName
                end
            end
        end
    elseif node.type == 'getglobal' then
        return false, node[1]
    elseif node.type == 'string' then
        return false, node[1]
    end
    return false, nil
end

---@param propTable table
---@param callback fun(data: {start: number, finish: number, message: string, severity?: DiagnosticSeverity})
---@param checkForbid boolean
local function checkPropertyTypes(propTable, callback, checkForbid)
    for _, obj in ipairs(propTable) do
        local key = getKeyName(obj)
        if key and obj.value and obj.value.type == 'table' then
            local typeNode = getTableFieldValue(obj.value, 'type')
            if typeNode then
                local isMini, typeName = getMiniTypeName(typeNode)
                if isMini then
                    local bareType = typeName:sub(6)
                    if checkForbid and ForbidDevParamType[bareType] then
                        callback{
                            start = typeNode.start,
                            finish = typeNode.finish,
                            message = ('属性定义是无效的类型 key: %s'):format(key),
                        }
                    end
                elseif typeNode.type == 'nil' then
                    if not checkForbid then
                        callback{
                            start = typeNode.start,
                            finish = typeNode.finish,
                            message = ('属性定义是无效类型 key: %s'):format(key),
                        }
                    end
                elseif typeNode.type == 'string' then
                    local strValue = typeNode[1]
                    if strValue and strValue ~= '' then
                        if checkForbid and ForbidDevParamType[strValue] then
                            callback{
                                start = typeNode.start,
                                finish = typeNode.finish,
                                message = ('属性定义是无效的类型 key: %s'):format(key),
                            }
                        end
                    elseif not checkForbid then
                        callback{
                            start = typeNode.start,
                            finish = typeNode.finish,
                            message = ('属性定义是无效类型 key: %s'):format(key),
                        }
                    end
                else
                    if not checkForbid then
                        callback{
                            start = typeNode.start,
                            finish = typeNode.finish,
                            message = ('属性定义是无效类型 key: %s'):format(key),
                        }
                    end
                end
            end
        end
    end
end

---@param argsTable table
---@param callback fun(data: {start: number, finish: number, message: string, severity?: DiagnosticSeverity})
local function checkArrayItemTypes(argsTable, callback)
    for _, obj in ipairs(argsTable) do
        local key = getKeyName(obj)
        if key and obj.value and obj.value.type == 'table' then
            local returnNode = getTableFieldValue(obj.value, 'returnType')
            if returnNode then
                local isRetMini, retTypeName = getMiniTypeName(returnNode)
                if isRetMini and retTypeName == 'Mini.Array' then
                    local itemNode = getTableFieldValue(obj.value, 'itemType')
                    if not itemNode then
                        callback{
                            start = returnNode.start,
                            finish = returnNode.finish,
                            message = ('组的itemType类型 无效的类型 key: %s'):format(key),
                        }
                    else
                        local isItemMini, itemTypeName = getMiniTypeName(itemNode)
                        if isItemMini then
                            local bareItem = itemTypeName:sub(6)
                            if ForbidDevParamType[bareItem] or ForbidDevArrayParamType[bareItem] then
                                callback{
                                    start = itemNode.start,
                                    finish = itemNode.finish,
                                    message = ('组的itemType类型 无效的类型 key: %s'):format(key),
                                }
                            end
                        elseif itemNode.type == 'string' then
                            local strVal = itemNode[1]
                            if strVal and (ForbidDevParamType[strVal] or ForbidDevArrayParamType[strVal]) then
                                callback{
                                    start = itemNode.start,
                                    finish = itemNode.finish,
                                    message = ('组的itemType类型 无效的类型 key: %s'):format(key),
                                }
                            end
                        else
                            callback{
                                start = itemNode.start,
                                finish = itemNode.finish,
                                message = ('组的itemType类型 无效的类型 key: %s'):format(key),
                            }
                        end
                    end
                end
            end
        end
    end
end

local function findComponentTables(state)
    local guide = require 'parser.guide'
    local componentTables = {}
    guide.eachSourceType(state.ast, 'setfield', function(source)
        if source.field then
            local key = source.field[1]
            if (key == 'propertys' or key == 'openFnArgs') and source.node then
                componentTables[source.node] = true
            end
        end
    end)
    return componentTables
end

local function isComponentFile(state)
    local guide = require 'parser.guide'

    -- 检查是否有 propertys 或 openFnArgs
    local found = false
    guide.eachSourceType(state.ast, 'setfield', function(source)
        if source.field then
            local key = source.field[1]
            if key == 'propertys' or key == 'openFnArgs' then
                found = true
            end
        end
    end)
    if found then return true end

    -- 检查是否有 ---@class 注解继承了 Component
    -- LuaLS 将注解存储在 state.ast.docs 数组中
    if state.ast.docs then
        for _, doc in ipairs(state.ast.docs) do
            if doc.type == 'doc.class' and doc.extends then
                for _, ext in ipairs(doc.extends) do
                    local parentName = ext[1]
                    if parentName and (
                        parentName == 'Component'
                        or parentName == 'WorldComponent'
                        or parentName == 'PlayerComponent'
                        or parentName == 'ActorComponent'
                        or parentName == 'MobComponent'
                        or parentName == 'EntityComponent'
                        or parentName == 'BlockComponent'
                        or parentName == 'UIComponent'
                        or parentName:find('Component')
                    ) then
                        return true
                    end
                end
            end
        end
    end

    return false
end

---@param source table
---@return table|string|nil
local function getParentKey(source)
    local node = source.node
    if not node then return nil end
    if node.type == 'getlocal' or node.type == 'getglobal' then
        return node[1]
    end
    return node
end

local function collectFieldsByParent(state)
    local guide = require 'parser.guide'
    local fieldsByParent = {}
    guide.eachSourceType(state.ast, 'setmethod', function(source)
        if source.node and source.method then
            local key = getParentKey(source)
            if key then
                if not fieldsByParent[key] then fieldsByParent[key] = {} end
                fieldsByParent[key][source.method[1]] = true
            end
        end
    end)
    guide.eachSourceType(state.ast, 'setfield', function(source)
        if source.node and source.field then
            local key = getParentKey(source)
            if key then
                if not fieldsByParent[key] then fieldsByParent[key] = {} end
                fieldsByParent[key][source.field[1]] = true
            end
        end
    end)
    return fieldsByParent
end

---@param uri string
---@param callback fun(ast: table, guide: table)
local function withAst(uri, callback)
    local state = getState(uri)
    if not state then return end
    local ast = state.ast
    if not ast then return end

    local ok, guide = pcall(require, 'parser.guide')
    if not ok then return end

    callback(ast, guide)
end

defineDiagnostic("miniworld-keyword", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        guide.eachSourceType(ast, 'setfield', function(source)
            if source.field and source.field[1] == 'propertys' then
                if source.value and source.value.type == 'table' then
                    for _, obj in ipairs(source.value) do
                        local key = getKeyName(obj)
                        if key and keywords[key] then
                            local keyNode = obj.field or obj.index
                            if keyNode then
                                callback{
                                    start = keyNode.start,
                                    finish = keyNode.finish,
                                    message = ('属性定义是关键词 key: %s'):format(key),
                                }
                            end
                        end
                    end
                end
            end
        end)
    end)
end)

defineDiagnostic("miniworld-openfnargs-missing", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        local state = getState(uri)
        local fieldsByParent = collectFieldsByParent(state)

        guide.eachSourceType(ast, 'setfield', function(source)
            if source.field and source.field[1] == 'openFnArgs' then
                if source.value and source.value.type == 'table' then
                    local parent = getParentKey(source)
                    local fields = parent and fieldsByParent[parent] or {}
                    for _, obj in ipairs(source.value) do
                        local key = getKeyName(obj)
                        if key and not fields[key] then
                            local keyNode = obj.field or obj.index
                            if keyNode then
                                callback{
                                    start = keyNode.start,
                                    finish = keyNode.finish,
                                    message = ('开放函数没有定义: %s'):format(key),
                                }
                            end
                        end
                    end
                end
            end
        end)
    end)
end)

defineDiagnostic("miniworld-openfnargs-type", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        guide.eachSourceType(ast, 'setfield', function(source)
            if source.field and source.field[1] == 'openFnArgs' then
                if source.value and source.value.type == 'table' then
                    for _, obj in ipairs(source.value) do
                        local key = getKeyName(obj)
                        if key then
                            local val = obj.value
                            if not val or (val.type ~= 'table' and val.type ~= 'boolean') then
                                local keyNode = obj.field or obj.index
                                if keyNode then
                                    callback{
                                        start = keyNode.start,
                                        finish = keyNode.finish,
                                        message = ('开放函数值类型错误: %s'):format(key),
                                    }
                                end
                            end
                        end
                    end
                end
            end
        end)
    end)
end)

defineDiagnostic("miniworld-lifecycle", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        local state = getState(uri)
        local componentTables = findComponentTables(state)

        guide.eachSourceType(ast, 'setfield', function(source)
            if source.field then
                local key = source.field[1]
                if key and mustFnList[key] then
                    if source.node and componentTables[source.node] then
                        local val = source.value
                        if val and nonFunctionTypes[val.type] then
                            callback{
                                start = source.field.start,
                                finish = source.field.finish,
                                message = ('%s 字段必须是函数'):format(key),
                            }
                        end
                    end
                end
            end
        end)
    end)
end)

defineDiagnostic("miniworld-official", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        local state = getState(uri)
        local componentTables = findComponentTables(state)

        guide.eachSourceType(ast, 'setfield', function(source)
            if source.field then
                local key = source.field[1]
                if key and key ~= 'Init' and baseComponent[key] then
                    if source.node and componentTables[source.node] then
                        callback{
                            start = source.field.start,
                            finish = source.field.finish,
                            message = ('组件定义 %s 无效，字段为官方函数'):format(key),
                        }
                    end
                end
            end
        end)

        guide.eachSourceType(ast, 'setmethod', function(source)
            if source.method then
                local key = source.method[1]
                if key and key ~= 'Init' and baseComponent[key] then
                    if source.node and componentTables[source.node] then
                        callback{
                            start = source.method.start,
                            finish = source.method.finish,
                            message = ('组件定义 %s 无效，字段为官方函数'):format(key),
                        }
                    end
                end
            end
        end)
    end)
end)

defineDiagnostic("miniworld-property-type", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        guide.eachSourceType(ast, 'table', function(source)
            local parent = source.parent
            if parent and parent.type == 'tablefield' then
                local parentKey = getKeyName(parent)
                if parentKey == 'propertys' then
                    checkPropertyTypes(source, callback, false)
                end
            end
        end)
    end)
end)

defineDiagnostic("miniworld-forbid-dev-type", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        guide.eachSourceType(ast, 'table', function(source)
            local parent = source.parent
            if parent and parent.type == 'tablefield' then
                local parentKey = getKeyName(parent)
                if parentKey == 'propertys' then
                    checkPropertyTypes(source, callback, true)
                end
            end
        end)
    end)
end)

defineDiagnostic("miniworld-array-itemtype", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        guide.eachSourceType(ast, 'table', function(source)
            local parent = source.parent
            if parent and parent.type == 'tablefield' then
                local parentKey = getKeyName(parent)
                if parentKey == 'openFnArgs' then
                    checkArrayItemTypes(source, callback)
                end
            end
        end)
    end)
end)

-- ============================================================================
-- 诊断6-8: openFnArgs 验证
-- ============================================================================

---Valid ParamType bare names (without "Mini." prefix) for openFnArgs params/returnType.
local validOpenFnArgsParamTypes = {
    ["String"] = true, ["Number"] = true, ["Bool"] = true,
    ["Vec3"] = true, ["Color"] = true, ["Area"] = true,
    ["CustomMsg"] = true, ["Sound"] = true, ["Effect"] = true,
    ["Block"] = true, ["Item"] = true, ["Mob"] = true,
    ["MobType"] = true, ["Player"] = true, ["Enum"] = true,
    ["Model"] = true, ["Picture"] = true, ["ModelAction"] = true,
    ["SkeletonPoint"] = true, ["Buff"] = true, ["Scale"] = true,
    ["Rotation"] = true, ["Blueprint"] = true, ["ThrowItem"] = true,
    ["DropItem"] = true, ["Object"] = true, ["Role"] = true,
    ["UiElement"] = true, ["UiState"] = true, ["Entity"] = true,
    ["EntityType"] = true, ["Tag"] = true,
}

---Iterate over all openFnArgs table values in the AST.
---Handles both setfield (X.openFnArgs = {...}) and tablefield ({openFnArgs = {...}}).
---@param ast table Root AST node
---@param callback fun(t: table) Called for each openFnArgs table
local function forEachOpenFnArgsTable(ast, callback)
    local guide = require 'parser.guide'
    guide.eachSourceType(ast, 'table', function(source)
        local parent = source.parent
        if parent then
            local isOpenFnArgs = false
            if parent.type == 'tablefield' then
                isOpenFnArgs = getKeyName(parent) == 'openFnArgs'
            elseif parent.type == 'setfield' then
                isOpenFnArgs = parent.field and parent.field[1] == 'openFnArgs'
            end
            if isOpenFnArgs then
                callback(source)
            end
        end
    end)
end

---Check if a node is a valid ParamType for openFnArgs.
---@param node table AST node
---@return boolean
local function isValidOpenFnArgsParamType(node)
    local isMini, typeName = getMiniTypeName(node)
    if isMini then
        local bareType = typeName:sub(6)
        return validOpenFnArgsParamTypes[bareType] == true
    end
    return false
end

-- 诊断6: openFnArgs params 类型无效
defineDiagnostic("miniworld-openfnargs-params", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, _)
        forEachOpenFnArgsTable(ast, function(openFnArgsTable)
            for _, methodEntry in ipairs(openFnArgsTable) do
                local methodName = getKeyName(methodEntry)
                if methodName and methodEntry.value and methodEntry.value.type == 'table' then
                    local paramsNode = getTableFieldValue(methodEntry.value, 'params')
                    if paramsNode and paramsNode.type == 'table' then
                        for i, paramEntry in ipairs(paramsNode) do
                            local param = paramEntry.value or paramEntry
                            if param and param.type ~= 'string' then
                                if not isValidOpenFnArgsParamType(param) then
                                    callback{
                                        start = param.start,
                                        finish = param.finish,
                                        message = '开放函数参数的类型错误: ' .. methodName .. ' 第' .. i .. '个参数',
                                    }
                                end
                            end
                        end
                    end
                end
            end
        end)
    end)
end)

-- 诊断7: displayName 不是字符串
defineDiagnostic("miniworld-openfnargs-displayname", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, _)
        forEachOpenFnArgsTable(ast, function(openFnArgsTable)
            for _, methodEntry in ipairs(openFnArgsTable) do
                local methodName = getKeyName(methodEntry)
                if methodName and methodEntry.value and methodEntry.value.type == 'table' then
                    local displayNameNode = getTableFieldValue(methodEntry.value, 'displayName')
                    if displayNameNode and displayNameNode.type ~= 'string' then
                        callback{
                            start = displayNameNode.start,
                            finish = displayNameNode.finish,
                            message = '开放函数函数名displayName类型错误不是字符串: ' .. methodName,
                        }
                    end
                end
            end
        end)
    end)
end)

-- 诊断8: returnType 类型无效
defineDiagnostic("miniworld-openfnargs-returntype", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, _)
        forEachOpenFnArgsTable(ast, function(openFnArgsTable)
            for _, methodEntry in ipairs(openFnArgsTable) do
                local methodName = getKeyName(methodEntry)
                if methodName and methodEntry.value and methodEntry.value.type == 'table' then
                    local returnTypeNode = getTableFieldValue(methodEntry.value, 'returnType')
                    if returnTypeNode and not isValidOpenFnArgsParamType(returnTypeNode) then
                        callback{
                            start = returnTypeNode.start,
                            finish = returnTypeNode.finish,
                            message = '开放函数参数的returnType类型错误不支持: ' .. methodName,
                        }
                    end
                end
            end
        end)
    end)
end)

defineDiagnostic("miniworld-customdata-missing-def", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        guide.eachSourceType(ast, 'table', function(source)
            local parent = source.parent
            if parent and parent.type == 'tablefield' then
                local parentKey = getKeyName(parent)
                if parentKey == 'propertys' then
                    for _, obj in ipairs(source) do
                        local key = getKeyName(obj)
                        if key and obj.value and obj.value.type == 'table' then
                            local typeNode = getTableFieldValue(obj.value, 'type')
                            if typeNode then
                                local isCustomData = false
                                if typeNode.type == 'string' and typeNode[1] == 'CustomData' then
                                    isCustomData = true
                                end
                                local isMini, typeName = getMiniTypeName(typeNode)
                                if isMini and typeName == 'Mini.CustomData' then
                                    isCustomData = true
                                end
                                if isCustomData then
                                    local customDefNode = getTableFieldValue(obj.value, 'customDef')
                                    if not customDefNode or customDefNode.type == 'nil' then
                                        callback{
                                            start = typeNode.start,
                                            finish = typeNode.finish,
                                            message = '自定义结构类型customDef定义无效',
                                        }
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end)
end)

defineDiagnostic("miniworld-script-support-event", "custom", "Information", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        guide.eachSourceType(ast, 'getglobal', function(source)
            if source[1] == 'ScriptSupportEvent' then
                callback{
                    start = source.start,
                    finish = source.finish,
                    message = '建议使用组件事件系统替代 ScriptSupportEvent',
                }
            end
        end)
    end)
end)

defineDiagnostic("miniworld-missing-isvalid", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        local getComponentCalls = {}
        local isValidCalls = {}

        guide.eachSourceType(ast, 'call', function(source)
            if source.node then
                local funcName = nil
                if source.node.type == 'getmethod' and source.node.method then
                    funcName = source.node.method[1]
                elseif source.node.type == 'getfield' and source.node.field then
                    funcName = source.node.field[1]
                end
                if funcName == 'GetComponent' then
                    table.insert(getComponentCalls, {
                        start = source.start,
                        finish = source.finish,
                        node = source,
                    })
                elseif funcName == 'IsValid' then
                    table.insert(isValidCalls, {
                        start = source.start,
                        finish = source.finish,
                    })
                end
            end
        end)

        for _, call in ipairs(getComponentCalls) do
            local funcStart = nil
            local funcFinish = nil

            local current = call.node.parent
            while current do
                if current.type == 'function' then
                    funcStart = current.start
                    funcFinish = current.finish
                    break
                end
                current = current.parent
            end

            if funcStart then
                local foundValid = false
                for _, validCall in ipairs(isValidCalls) do
                    if validCall.start >= funcStart and validCall.finish <= funcFinish then
                        foundValid = true
                        break
                    end
                end

                if not foundValid then
                    callback{
                        start = call.node.start,
                        finish = call.node.finish,
                        message = '缓存的组件应先调用 IsValid() 判断有效性',
                    }
                end
            end
        end
    end)
end)

defineDiagnostic("miniworld-disabled-stdlib", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        guide.eachSourceType(ast, 'getglobal', function(source)
            local name = source[1]
            if name and disabledLibs[name] then
                callback{
                    start = source.start,
                    finish = source.finish,
                    message = ('%s 在 Mini World 环境中被禁用'):format(name),
                }
            end
        end)

        guide.eachSourceType(ast, 'getfield', function(source)
            local baseName = nil
            if source.node and source.node.type == 'getglobal' then
                baseName = source.node[1]
            elseif source.node and source.node.type == 'getfield' then
                local current = source.node
                while current and current.type == 'getfield' do
                    current = current.node
                end
                if current and current.type == 'getglobal' then
                    baseName = current[1]
                end
            end
            if baseName and disabledLibs[baseName] then
                callback{
                    start = source.node.start,
                    finish = source.node.finish,
                    message = ('%s 在 Mini World 环境中被禁用'):format(baseName),
                }
            end
        end)
    end)
end)

-- ============================================================================
-- openFnArgs 验证增强
-- ============================================================================

---@type table<string, boolean>
local validOpenFnArgsFields = {
    displayName = true,
    params = true,
    returnType = true,
    itemType = true,
}

defineDiagnostic("miniworld-openfnargs-invalid-value", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, _)
        forEachOpenFnArgsTable(ast, function(openFnArgsTable)
            for _, obj in ipairs(openFnArgsTable) do
                local key = getKeyName(obj)
                if key and obj.value then
                    local val = obj.value
                    if val.type == 'boolean' and val[1] == false then
                        callback{
                            start = val.start,
                            finish = val.finish,
                            message = ('openFnArgs.%s 值为 false 无效，等同于不声明'):format(key),
                        }
                    elseif val.type == 'number' then
                        callback{
                            start = val.start,
                            finish = val.finish,
                            message = ('openFnArgs.%s 值类型错误，应为 true 或 table'):format(key),
                        }
                    elseif val.type == 'string' then
                        callback{
                            start = val.start,
                            finish = val.finish,
                            message = ('openFnArgs.%s 值类型错误，应为 true 或 table'):format(key),
                        }
                    end
                end
            end
        end)
    end)
end)

defineDiagnostic("miniworld-openfnargs-invalid-field", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, _)
        forEachOpenFnArgsTable(ast, function(openFnArgsTable)
            for _, obj in ipairs(openFnArgsTable) do
                local key = getKeyName(obj)
                if key and obj.value and obj.value.type == 'table' then
                    for _, field in ipairs(obj.value) do
                        local fieldName = getKeyName(field)
                        if fieldName and not validOpenFnArgsFields[fieldName] then
                            local fieldNode = field.field or field.index
                            if fieldNode then
                                callback{
                                    start = fieldNode.start,
                                    finish = fieldNode.finish,
                                    message = ('openFnArgs.%s 包含框架不识别的字段: %s'):format(key, fieldName),
                                }
                            end
                        end
                    end
                end
            end
        end)
    end)
end)

defineDiagnostic("miniworld-openfnargs-params-array", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, _)
        forEachOpenFnArgsTable(ast, function(openFnArgsTable)
            for _, methodEntry in ipairs(openFnArgsTable) do
                local methodName = getKeyName(methodEntry)
                if methodName and methodEntry.value and methodEntry.value.type == 'table' then
                    local paramsNode = getTableFieldValue(methodEntry.value, 'params')
                    if paramsNode and paramsNode.type == 'table' then
                        for i, paramEntry in ipairs(paramsNode) do
                            local param = paramEntry.value or paramEntry
                            if param then
                                local isMini, typeName = getMiniTypeName(param)
                                if isMini and typeName == 'Mini.Array' then
                                    callback{
                                        start = param.start,
                                        finish = param.finish,
                                        message = ('openFnArgs.%s.params[%d] 禁止使用 Mini.Array'):format(methodName, i),
                                    }
                                end
                            end
                        end
                    end
                end
            end
        end)
    end)
end)

defineDiagnostic("miniworld-openfnargs-array-no-itemtype", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, _)
        forEachOpenFnArgsTable(ast, function(openFnArgsTable)
            for _, methodEntry in ipairs(openFnArgsTable) do
                local methodName = getKeyName(methodEntry)
                if methodName and methodEntry.value and methodEntry.value.type == 'table' then
                    local returnTypeNode = getTableFieldValue(methodEntry.value, 'returnType')
                    if returnTypeNode then
                        local isMini, typeName = getMiniTypeName(returnTypeNode)
                        if isMini and typeName == 'Mini.Array' then
                            local itemTypeNode = getTableFieldValue(methodEntry.value, 'itemType')
                            if not itemTypeNode then
                                callback{
                                    start = returnTypeNode.start,
                                    finish = returnTypeNode.finish,
                                    message = ('openFnArgs.%s returnType 为 Mini.Array 但缺少 itemType'):format(methodName),
                                }
                            end
                        end
                    end
                end
            end
        end)
    end)
end)

-- ============================================================================
-- 组件结构验证
-- ============================================================================

---@type table<string, string>
local lifecycleSignatures = {
    OnStart = "OnStart(isFirstCreate: boolean)",
    OnDestroy = "OnDestroy(isRemoving: boolean)",
    OnSave = "OnSave(isPB: boolean): table",
    OnLoad = "OnLoad(data: table)",
}

defineDiagnostic("miniworld-onupdate-ineffective", "custom", "Information", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        local componentTables = findComponentTables(getState(uri))
        guide.eachSourceType(ast, 'setmethod', function(source)
            if source.method and source.method[1] == 'OnUpdate' then
                if source.node and componentTables[source.node] then
                    callback{
                        start = source.method.start,
                        finish = source.method.finish,
                        message = 'OnUpdate 对自定义组件无效，引擎只对官方组件调用 OnUpdate，请使用 OnTick',
                    }
                end
            end
        end)
    end)
end)

defineDiagnostic("miniworld-property-outside", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        local componentTables = findComponentTables(getState(uri))
        local propertysKeys = {}

        guide.eachSourceType(ast, 'setfield', function(source)
            if source.field and source.field[1] == 'propertys' then
                if source.value and source.value.type == 'table' then
                    for _, obj in ipairs(source.value) do
                        local key = getKeyName(obj)
                        if key then
                            propertysKeys[key] = true
                        end
                    end
                end
            end
        end)

        guide.eachSourceType(ast, 'setfield', function(source)
            if source.node and componentTables[source.node] and source.field then
                local key = source.field[1]
                if key and key ~= 'propertys' and key ~= 'openFnArgs'
                    and not mustFnList[key] and not baseComponent[key]
                    and not propertysKeys[key]
                    and key ~= 'Init' and key ~= 'OnToRunMode'
                    and key ~= 'OnSetEnableByPos' and key ~= 'OnClear' then
                    local val = source.value
                    if val and val.type ~= 'table' then
                        callback{
                            start = source.field.start,
                            finish = source.field.finish,
                            message = ('属性 %s 应在 propertys 中定义或在 OnStart 中赋值'):format(key),
                        }
                    end
                end
            end
        end)
    end)
end)

defineDiagnostic("miniworld-triggerevent-restriction", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        local componentTables = findComponentTables(getState(uri))

        guide.eachSourceType(ast, 'call', function(source)
            if source.node then
                local funcName = nil
                if source.node.type == 'getmethod' and source.node.method then
                    funcName = source.node.method[1]
                elseif source.node.type == 'getfield' and source.node.field then
                    funcName = source.node.field[1]
                end
                if funcName == 'AddTriggerEvent' then
                    if source.node.node and componentTables[source.node.node] then
                        callback{
                            start = source.node.start,
                            finish = source.node.finish,
                            message = 'AddTriggerEvent 仅在 WorldComponent/PlayerComponent 中有效',
                        }
                    end
                end
            end
        end)
    end)
end)

defineDiagnostic("miniworld-openfnargs-params-format", "custom", "Hint", "Opened", function(uri, callback)
    withAst(uri, function(ast, _)
        forEachOpenFnArgsTable(ast, function(openFnArgsTable)
            for _, methodEntry in ipairs(openFnArgsTable) do
                local methodName = getKeyName(methodEntry)
                if methodName and methodEntry.value and methodEntry.value.type == 'table' then
                    local paramsNode = getTableFieldValue(methodEntry.value, 'params')
                    if paramsNode and paramsNode.type == 'table' then
                        local expectLabel = true
                        for i, paramEntry in ipairs(paramsNode) do
                            local param = paramEntry.value or paramEntry
                            if param then
                                if expectLabel and param.type ~= 'string' then
                                    callback{
                                        start = param.start,
                                        finish = param.finish,
                                        message = ('openFnArgs.%s.params[%d] 建议在类型前添加标签字符串'):format(methodName, i),
                                    }
                                elseif not expectLabel and param.type == 'string' then
                                    callback{
                                        start = param.start,
                                        finish = param.finish,
                                        message = ('openFnArgs.%s.params[%d] 此处应为类型而非标签'):format(methodName, i),
                                    }
                                end
                                expectLabel = not expectLabel
                            end
                        end
                    end
                end
            end
        end)
    end)
end)

defineDiagnostic("miniworld-missing-return", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        if not isComponentFile(getState(uri)) then return end

        local hasTopLevelReturn = false
        guide.eachSourceType(ast, 'return', function(source)
            -- 检查是否在函数内部
            local inFunction = false
            local current = source.parent
            while current do
                if current.type == 'function' then
                    inFunction = true
                    break
                end
                current = current.parent
            end
            if inFunction then return end

            if source and #source > 0 then
                hasTopLevelReturn = true
            end
        end)

        if not hasTopLevelReturn then
            callback{
                start = 0,
                finish = 0,
                message = '组件文件缺少 return 语句，应在文件末尾 return 组件表',
            }
        end
    end)
end)

defineDiagnostic("miniworld-return-type", "custom", "Warning", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        if not isComponentFile(getState(uri)) then return end

        guide.eachSourceType(ast, 'return', function(source)
            -- 检查是否在函数内部：向上遍历父节点链
            local inFunction = false
            local current = source.parent
            while current do
                if current.type == 'function' then
                    inFunction = true
                    break
                end
                current = current.parent
            end
            if inFunction then return end

            if source and #source > 0 then
                local retVal = source[1]
                if retVal and retVal.type ~= 'table' and retVal.type ~= 'getglobal'
                    and retVal.type ~= 'getfield' and retVal.type ~= 'getlocal'
                    and retVal.type ~= 'call' and retVal.type ~= 'getmethod' then
                    callback{
                        start = retVal.start,
                        finish = retVal.finish,
                        message = '组件文件返回值必须是表',
                    }
                end
            end
        end)
    end)
end)

defineDiagnostic("miniworld-lifecycle-signature", "custom", "Hint", "Opened", function(uri, callback)
    withAst(uri, function(ast, guide)
        local componentTables = findComponentTables(getState(uri))

        guide.eachSourceType(ast, 'setmethod', function(source)
            if source.method then
                local methodName = source.method[1]
                local expectedSig = lifecycleSignatures[methodName]
                if expectedSig and source.node and componentTables[source.node] then
                    if source.value and source.value.type == 'function' then
                        local params = source.value
                        if methodName == 'OnStart' then
                            if #params == 0 then
                                callback{
                                    start = source.method.start,
                                    finish = source.method.finish,
                                    message = ('建议使用签名: %s'):format(expectedSig),
                                }
                            end
                        elseif methodName == 'OnDestroy' then
                            if #params == 0 then
                                callback{
                                    start = source.method.start,
                                    finish = source.method.finish,
                                    message = ('建议使用签名: %s'):format(expectedSig),
                                }
                            end
                        elseif methodName == 'OnSave' then
                            if #params == 0 then
                                callback{
                                    start = source.method.start,
                                    finish = source.method.finish,
                                    message = ('建议使用签名: %s'):format(expectedSig),
                                }
                            end
                        elseif methodName == 'OnLoad' then
                            if #params == 0 then
                                callback{
                                    start = source.method.start,
                                    finish = source.method.finish,
                                    message = ('建议使用签名: %s'):format(expectedSig),
                                }
                            end
                        end
                    end
                end
            end
        end)
    end)
end)
