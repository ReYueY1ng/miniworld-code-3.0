---
name: miniworld-code-api-update
description: Edit and maintain Mini World UGC 3.0 Lua type definition library for LuaLS.
---

# miniworld-code-api-update

Orchestrates editing and maintaining the Mini World UGC 3.0 Lua type definition library for LuaLS code completion.

## Project Overview

**Location**: `/home/yuey1ng/mini/luaaddons/miniworld-code-3.0/`

**Structure**:
```
library/           # 31 Lua files with type definitions using ---@meta annotations
config.json        # LLS-Addons addon configuration schema
test.lua           # Manual test file (not automated tests)
```

**Key Files**:
- `Enum.lua` - All enumeration types (~100+ enums)
- `Component.lua` - Component hierarchy (Component → WorldComponent → PlayerComponent, etc.)
- `Player.lua` - Player-specific API (camera, inventory, UI, etc.)
- `World.lua` - World management API
- `GameObject.lua` - Object creation, finding, and management

## API Source Priority (CRITICAL)

When adding new APIs, follow this priority order:

| Priority | Source | Purpose |
|----------|--------|---------|
| 1 | Environment table (`ugcscriptenv.txt`) | **ONLY AUTHORITY** - API must exist here |
| 2 | Decompiled files | Get deep info / specific parameters |
| 3 | Docs (`dev-wiki.mini1.cn`) | Get basic info |

### Locating Files

**Environment table** (`ugcscriptenv.txt`):
1. Try default location: `/home/yuey1ng/mini/miniworld-scripts/3.0/environments/ugcscriptenv.txt`
2. If not found, ask user for path OR download from:
   ```
   https://github.com/ReYueY1ng/miniworld-scripts/raw/refs/heads/main/3.0/environments/ugcscriptenv.txt
   ```

**Decompiled files** (optional, for parameter signatures):
1. Try default location: `/run/media/yuey1ng/F25A9F0C5A9ECD2B/mini/dump/script_decompiled/luascript/ugc/framework`
2. If not found, ask user for path
3. If user doesn't have decompiled files → skip this source, use docs only

**Docs**: https://dev-wiki.mini1.cn/ugc-wiki/

**IMPORTANT**: Docs are for basic info only. Decompiled files for parameter signatures (parameters may differ - decompiled is authoritative). If no decompiled files available, rely on docs.

## Global API vs Trigger API (CRITICAL)

The environment table has TWO types of APIs with different parameter conventions:

### Global APIs (Top-level)

These are available globally and use **x, y, z coordinates** as separate parameters:

```
"World" = {
    "SetSpawnPoint" = function(self, x, y, z) end,
    "PlayParticleEffect" = function(self, x, y, z, particleId, scale, ptime, ...) end,
    "SpawnCreature" = function(self, x, y, z, mobid, num, ...) end,
}
"Player" = {
    "GetViewMode" = function(self, reportid, uin) end,
    ...
}
```

### Trigger APIs (Inside `Trigger` table)

These are only available in trigger context and use **pos vectors** (combined x,y,z):

```
"Trigger" = {
    "World" = {
        "SetSpawnPoint" = function(self, obiid, pos) end,
        "PlayParticleEffect" = function(self, pos, particleId, scale, ptime) end,
        "XyzToPos" = function(self, x, y, z) end,  -- Helper to create pos
    }
}
```

### Key Differences

| Aspect | Global API | Trigger API |
|--------|------------|-------------|
| Location | Top-level (`World`, `Player`) | Inside `Trigger` table |
| Coordinates | Separate `x, y, z` params | Combined `pos` vector |
| Availability | Always available | Only in trigger context |
| Helper functions | N/A | `XyzToPos`, `OffsetPos`, etc. |

### When Adding New APIs

1. **Check which context the API belongs to**:
   - If it's a general-purpose API → add to global (e.g., `World.lua`, `Player.lua`)
   - If it's trigger-specific → add to trigger context

2. **Match parameter conventions**:
   - Global: `function(self, x, y, z, ...)` 
   - Trigger: `function(self, pos, ...)`

3. **Add helper functions if needed**:
   - `XyzToPos(x, y, z)` → converts to pos vector
   - `OffsetPos(pos, x, y, z)` → offsets a pos vector

## Spelling Errors — DO NOT FIX

Do NOT fix spelling errors (e.g., ColorGrandient, Lenght, toFistTime). This is an official issue.
- Can add comments explaining
- Preserve engine's original spelling

## Adding New API Types

### Step 1: Verify API Exists in Environment Table

```bash
grep -i "api_name" <environment_table_path>
```

If NOT found → STOP. API does not exist in official environment.

### Step 2: Determine Target File

| API Type | Target File |
|----------|-------------|
| Player methods | `Player.lua` |
| World methods | `World.lua` |
| GameObject methods | `GameObject.lua` |
| Component methods | `Component.lua` |
| Enumerations | `Enum.lua` |
| Events | `Events.lua` |
| Other | Match existing pattern |

### Step 3: Get Parameter Signatures

1. Check decompiled files for exact parameters:
   ```bash
   grep -r "api_name" /run/media/yuey1ng/F25A9F0C5A9ECD2B/mini/dump/script_decompiled/luascript/ugc/framework/
   ```

2. If not found, check docs: https://dev-wiki.mini1.cn/ugc-wiki/

### Step 4: Add Type Definition

Follow existing patterns exactly:

```lua
---Description in Chinese<br>[Link](url)
---@class ClassName
---@field protected fieldName type Description
ClassName = {}

---Description in Chinese
---@param param type Description
---@return type description
function ClassName:MethodName(param) end
```

**Key Conventions**:
- `---@meta` at top of file
- `---@protected` on methods only accessible within class hierarchy
- `---@generic` for type parameters (see Component.lua)
- **Chinese comments required** for all API documentation (except BaseEnv)
- HTML `<br>` tags in doc comments for line breaks

## Enum System (CRITICAL)

`Enum.lua` has TWO sections that MUST BOTH be maintained:

### Modern Enums (PascalCase) — TOP of file

```lua
---@enum Ability
---动作总开关
Ability = {
    Attack = 26,                   -- 普通攻击
    Break = 16,                    -- 破坏方块
    -- ...
}
```

### Legacy Enums (UPPER_SNAKE_CASE) — INSIDE `--#region hiddenenum`

```lua
--#region hiddenenum

---@enum ABSOLUTECAMPTYPE
---绝对阵营
---@see AbsoluteCampType
ABSOLUTECAMPTYPE = {
    ANY = 999,       -- 任意队伍
    ENEMY = 201,     -- 中立敌对
    -- ...
}

--#endregion
```

### Adding New Enums — Decision Tree

1. **Check if wiki has the enum**:
   - Visit: https://dev-wiki.mini1.cn/ugc-wiki/
   - Search for the enum name

2. **If wiki HAS the enum**:
   - Add PascalCase version **ABOVE** `--#region hiddenenum`
   - Add UPPER_SNAKE_CASE version **INSIDE** `--#region hiddenenum`
   - Add `---@see PascalCaseName` to legacy enum

3. **If wiki DOES NOT have the enum**:
   - Add **ONLY** inside `--#region hiddenenum`
   - No PascalCase version needed

### Enum Format Rules

- **PascalCase**: `Ability`, `BlockAttr`, `CreatureAttr`
- **UPPER_SNAKE_CASE**: `CREATUREATTR`, `HURTTYPE`, `ITEMATTR`
- Values must match exactly
- Chinese comments for each field
- `---@see` links legacy to modern

### Nested Enums in Environment Table

The environment table has nested enum structures. For example:

```
DoHarmStatus = {
    AttackType = { first = 0, second = 1, ... },  -- 近战, 远战
    HarmType = { first = 0, second = 1, ... },    -- 物理, 元素, 燃烧, ...
    HarmInherit = { first = 0, second = 1, ... }, -- 不继承, 自动
}
```

**How to handle nested enums**:

1. **Check if parent is a real enum**: If parent only contains sub-enums (no direct values), it's a namespace, not an enum
2. **Treat sub-enums as independent enums**: Each sub-enum becomes its own `---@enum`
3. **Naming convention**:
   - Parent namespace: `DoHarmStatus` (not an enum itself)
   - Sub-enums: `DoHarmStatusAttackType`, `DoHarmStatusHarmType`, `DoHarmStatusHarmInherit`
4. **Add Chinese names from `__info`**: Use the `name` field from `__info` for comments

**Example**:

```lua
---@enum DoHarmStatusAttackType
---攻击类型
DoHarmStatusAttackType = {
    First = 0,  -- 近战
    Second = 1  -- 远战
}
```

## Component Lifecycle Pattern

Components declare lifecycle methods via `openFnArgs`:

```lua
local test = {}
test.openFnArgs = {
    OnStart = true
}

function test:OnStart()
    -- Implementation here
end
```

## Generic Type Parameters

Component access uses LLS generics for type safety:

```lua
---@generic cmp: Component
---@param cmpid `cmp` Component ID
---@return cmp cmp Component object
function Component:GetComponent(cmpid) end
```

## Method Stubs vs Implementations

Most method bodies are **empty stubs** for type-checking only:

```lua
function GameObject:FindObject(id) end  -- Empty stub
```

**DO NOT** "complete" stubs that should stay empty.

## Verification

No automated tests. Verify by:

1. Open a `.lua` file in VS Code with LuaLS configured
2. Check autocompletion works for Mini World APIs
3. Verify type errors appear for invalid API usage
4. Use `test.lua` to validate type resolution

## Common Patterns

### Adding a New Player Method

```lua
---获取玩家背包物品数量
---@param objid number 玩家ID
---@return number count 物品数量
function Player:GetBackpackItemNum(objid) end
```

### Adding a New World Method

```lua
---设置方块
---@param x number X坐标
---@param y number Y坐标
---@param z number Z坐标
---@param blockid number 方块ID
---@param blockdata number 方块数据
---@return boolean success 是否成功
function World:SetBlock(x, y, z, blockid, blockdata) end
```

### Adding a New Enum (Wiki Has It)

**Modern (above hiddenenum)**:
```lua
---@enum NewEnum
---新枚举说明
NewEnum = {
    Value1 = 1, -- 说明1
    Value2 = 2  -- 说明2
}
```

**Legacy (inside hiddenenum)**:
```lua
---@enum NEW_ENUM
---新枚举说明
---@see NewEnum
NEW_ENUM = {
    VALUE_1 = 1, -- 说明1
    VALUE_2 = 2  -- 说明2
}
```

### Adding a New Enum (Wiki Does NOT Have It)

**Only inside hiddenenum**:
```lua
---@enum NEW_ENUM
---新枚举说明
NEW_ENUM = {
    VALUE_1 = 1, -- 说明1
    VALUE_2 = 2  -- 说明2
}
```

## Workflow for Adding New API

1. **Locate Environment Table**: Check default path, ask user or download if not found
2. **Verify**: Check `ugcscriptenv.txt` for API existence
3. **Research**: Get parameters from decompiled files (ask user if not found) or docs
4. **Locate**: Find correct file and position
5. **Add**: Follow exact patterns above
6. **Verify**: Test with LuaLS in VS Code
7. **Document**: Add Chinese comments

## Workflow for Adding New Enum

1. **Check wiki**: Visit https://dev-wiki.mini1.cn/ugc-wiki/
2. **If wiki has it**:
   - Add PascalCase above `--#region hiddenenum`
   - Add UPPER_SNAKE_CASE inside `--#region hiddenenum`
   - Link with `---@see`
3. **If wiki does NOT have it**:
   - Add ONLY inside `--#region hiddenenum`
4. **Verify**: Test enum completion in VS Code

## Things to Avoid

- **NEVER** fix spelling errors (official issue)
- **NEVER** add API not in `ugcscriptenv.txt`
- **NEVER** skip Chinese comments
- **NEVER** break dual enum system
- **NEVER** complete empty stubs
- **NEVER** use `as any`, `@ts-ignore` equivalents
- **NEVER** add without verifying parameters (use decompiled files if available, otherwise docs)

## Quick Reference

| Task | File | Action |
|------|------|--------|
| Add Player API | `Player.lua` | Add method stub with Chinese docs |
| Add World API | `World.lua` | Add method stub with Chinese docs |
| Add Enum (in wiki) | `Enum.lua` | Add both PascalCase + UPPER_SNAKE_CASE |
| Add Enum (not in wiki) | `Enum.lua` | Add only UPPER_SNAKE_CASE in hiddenenum |
| Add Component | `Component.lua` | Follow generic pattern |
| Add Event | `Events.lua` | Add to TriggerEvent enum |

## Verification Checklist

After any change:

- [ ] API exists in `ugcscriptenv.txt`
- [ ] Parameters verified (decompiled files if available, otherwise docs)
- [ ] Chinese comments added
- [ ] Enum dual system maintained (if applicable)
- [ ] No spelling fixes
- [ ] Empty stubs left empty
- [ ] LuaLS autocompletion works
- [ ] Type errors appear for invalid usage

## API Permission System (DevApiCfg)

The `DevApiCfg.lua` defines permission control for third-party Mods. Understanding this is CRITICAL when adding new APIs.

### API Availability Levels

| Level | Description |
|-------|-------------|
| ✅ All Mods | No `uin_list` restriction, available to everyone |
| ❌ Whitelist Only | Has `uin_list`, only specific UINs can call |
| ❌ Not Available | `dismethods` or not in `devServices` |

### ✅ APIs Available to All Mods

These APIs have no `uin_list` restriction:

| API | Service |
|-----|---------|
| `CustomUI.GetUIViewAttrValue` | CustomUI |
| `CustomUI.GetElementAttrValue` | CustomUI |
| `World.AddGameTimes` | World |
| `CloudSever.SendSeverMsg` | CloudSever |

### ❌ Whitelist-Only APIs (16 UINs)

These APIs require `LuaApi3_InternalApi` whitelist:

**Data**: DoPackBluePrint
**Block**: CreateObsBluePrint, PlaceBluePrint, UnbindBluePrintRegion, SaveBluePrintRegionData, BluePrintSaveAsNewId, BluePrintSetUploadInteral, DeleteBluePrint, GetBluePrintBlockInfo, CaptureAndUploadScreenshot, LoadObsBluePrint, UnloadObsBluePrint, StopPlaceObsBluePrint, GetObsBluePrintStatus, GetObsBluePrintPos
**Item**: CreateItemInstInBackpack, SetObjData, GetObjData, GetItemModelComp, GetObjDataByGrid, SetObjDataByGrid
**Player**: ChangeViewModeForMod, HasHandheldGun, GunGetMagazine, SetCrawl, AddMagazine, GetVisibleRange, SetVisibleRange
**Monster**: SetPersistance
**Backpack**: GetGridGunInfo
**Listen**: SetBlockAll
**OfficeUtils**: GetActivateProgress, SendClientReportEvent
**CustomUI**: SetUrlIcon

### Other Whitelist APIs

| API | Whitelist Key | UIN Count |
|-----|---------------|-----------|
| `Item.GetGunBaseDesc` | LuaApi3_Item_GetGunBaseDesc | 8 |
| `Item.CreateBindItemInBackpack` | LuaApi3_Item_CreateBindItemInBackpack | 5 |
| `CustomUI.SetSysSettingBtnVisible` | LuaApi3_CustomUI_SetSysSettingBtnVisible | 5 |
| `Player.SetCameraShake` | LuaApi3_Player_SetCameraShake | 10 |
| `Player.GetSkinlist` | LuaApi3_Player_GetSkinlist | 6 |
| `Player.GetSkinSeatInfos` | LuaApi3_Player_GetSkinSeatInfos | 5 |
| `Player.OpenMiniShopPage` | LuaApi3_Player_OpenMiniShopPage | 5 |
| `Player.OpenMiniShopItemPage` | LuaApi3_Player_OpenMiniShopItemPage | 5 |
| `Player.OpenMiniShopWarehousePage` | LuaApi3_Player_OpenMiniShopWarehousePage | 5 |
| `Player.GetHorseRealID` | LuaApi3_Player_GetHorseRealID | 5 |
| `Player.GetPersonInfo` | LuaApi3_Player_GetPersonInfo | 6 |
| `Player.GetBlockAtlasInfo` | LuaApi3_Player_GetBlockAtlasInfo | 5 |
| `World.SetChunkRectAlwaysLoaded` | LuaApi3_World_SetChunkRectAlwaysLoaded | 1 |
| `Player.OpenActView` | trigger_api_MiraclesEventsPage | 26 |
| `Player.OpenShopTryOnView` | trigger_api_SkinTrialShop | 9 |
| `Player.OpenShopSkinBuyDialog` | trigger_api_SkinTrialShop | 9 |
| `Player.OpenShopGiveGiftView` | trigger_api_SendGiftsToFriends | 6 |
| `Player.OpenFriendChatPage` | trigger_api_SendGiftsToFriends | 6 |
| `OfficeUtils.ReportActivateDataForUin` | trigger_api_UploadActData | 5 |
| `CloudSever.TransmitToCategoryRoom` | trigger_api3_MapTagTransfer | 23 |
| `CloudSever.TransmitToCurMapCategoryRoom` | trigger_api3_MapTagTransfer | 23 |
| `CloudSever.GetRoomCategory` | trigger_api3_MapTagTransfer | 23 |
| `CloudSever.SetRoomCategory` | trigger_api3_MapTagTransfer | 23 |
| `Trigger.TransmitToCategoryRoom` | trigger_api3_MapTagTransfer | 23 |

### ❌ Not Available (dismethods)

These methods are **completely invisible** to third-party Mods:

**Object Methods**:
- gameObject: GetId, Destroy, AddTag, RemoveTag, HasTag, GetObjType, IsValid, GetWorldId, PushEvent, PushEventSync, PushCustomEvent, PushCustomEventSync, PushCloudServerMsg, AddCustomEvent, AddEvent, AddCloudSeverEvent, RemoveEvent, RemoveCustomEvent, RemoveTriggerEvent, RemoveCloudSeverEvent, SaveInChunk, DoTaskInTime, DoPeriodicTask, ClearTaskByCmp, SetTaskIsPauseByCmp, SetEventIsEnable, IsEventEnable, SetComponentIndex, HasComponent
- worldObject: GetObjType, GetId, IsValid, PushEvent, PushEventSync, PushCustomEvent, PushCustomEventSync, PushCloudServerMsg, AddCustomEvent, AddEvent, AddTriggerEvent, AddCloudSeverEvent, RemoveEvent, RemoveCustomEvent, RemoveTriggerEvent, RemoveCloudSeverEvent, DoTaskInTime, DoPeriodicTask, ClearTaskByCmp, SetTaskIsPauseByCmp, SetComponentIndex, SetEventIsEnable, IsEventEnable, HasComponent, GetWorldId
- BlockObject: (similar list)

**Service Methods**:
- Log: PrintDevLog, PrintLog, DealLog, PcallErrorInfo, GetStrFromLine, PcallError, IsOpenLog, ModLoad, PrintRunInfo
- GameObject: CreateGameObject, CreateEditActor, CreateGameObjectDefault, FindGameObject, GetWorldObject, CreatePrefabInstObject, PushCustomEvent, CreatePrefabObject
- Area: GetObjInstanceID
- Item: _BeginModifyItem, _BeginModifyItemByGridIndex
- Chat: SendMsg
- Player: GetActorByObjid, GetObjTypeByActor, ChangeCustomModelOld
- Actor: GetActorByObjid, GetObjTypeByActor, ChangeCustomModelOld, CheckSyncAction
- Monster: GetActorByObjid, GetObjTypeByActor, ChangeCustomModelOld
- CustomUI: CreateElementId, CloneElementId
- World: GetWorldById, GetWorldId

### Frequency Limits

Some APIs have cooldown restrictions:

| API | Limit | Message |
|-----|-------|---------|
| `Player.GetFriendList` | 10s per UIN | "调用频繁，请稍后尝试！" |
| `Player.GetPersonInfo` | 5s per UIN | "调用频繁，请稍后尝试！" |
| `Player.PlayAdvertising` | 90s per UIN | "调用频繁，请稍后尝试！" |
| `OfficeUtils.GetActivateReward` | 10s per UIN | "请求频繁,请稍后再试！" |
| `CloudSever.SendSeverMsg` | 15s global | - |
| `CloudSever.TransmitToMap` | 30s global | - |

### When Adding New APIs

1. **Check `devapicfg.lua`** for permission configuration
2. **Check `devServices`** to see if API is exposed to third-party Mods
3. **Add appropriate comments** in type definitions:
   - `---@deprecated` or note if API is whitelist-only
   - Note frequency limits if applicable
4. **Do NOT add dismethods** to type definitions (they're invisible to Mods)
