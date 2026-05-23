#!/usr/bin/env python3
"""Update Events.lua with wiki documentation changes."""

import re

def read_file(path):
    with open(path, 'r', encoding='utf-8') as f:
        return f.read()

def write_file(path, content):
    with open(path, 'w', encoding='utf-8') as f:
        f.write(content)

def find_event_block(lines, event_name):
    """Find the line index of an event's key=value line."""
    for i, line in enumerate(lines):
        stripped = line.strip()
        if re.match(rf'^{event_name}\s*=', stripped):
            return i
    return -1

def find_comment_start(lines, event_line_idx):
    """Find the start of the comment block before an event line."""
    i = event_line_idx - 1
    while i >= 0 and lines[i].strip().startswith('---'):
        i -= 1
    return i + 1

def add_param_to_event(lines, event_name, param_line):
    """Add a parameter line to an event's comment block."""
    idx = find_event_block(lines, event_name)
    if idx < 0:
        return False
    
    # Find the comment block start
    comment_start = find_comment_start(lines, idx)
    
    # Find the last param line (before the event line)
    last_param_idx = idx - 1
    while last_param_idx > comment_start and lines[last_param_idx].strip().startswith('---```'):
        last_param_idx -= 1
    last_param_idx += 1
    
    # Insert the new param line
    lines.insert(last_param_idx, param_line)
    return True

def add_filter_annotation(lines, event_name, filter_lines):
    """Add filter annotation to an event's comment block."""
    idx = find_event_block(lines, event_name)
    if idx < 0:
        return False
    
    # Find the comment block start
    comment_start = find_comment_start(lines, idx)
    
    # Find the 传参 section
    chuan_can_idx = -1
    for i in range(comment_start, idx):
        if '---传参---' in lines[i]:
            chuan_can_idx = i
            break
    
    if chuan_can_idx < 0:
        return False
    
    # Insert filter lines before 传参
    for j, line in enumerate(filter_lines):
        lines.insert(chuan_can_idx + j, line)
    
    return True

def main():
    events_lua = '/home/yuey1ng/mini/luaaddons/miniworld-code-3.0/library/Events.lua'
    content = read_file(events_lua)
    lines = content.split('\n')
    
    changes = 0
    
    # ============================================================
    # TASK 1: Add 5 missing TriggerEvents
    # ============================================================
    print("Task 1: Adding 5 missing TriggerEvents...")
    
    # Find the UI section - look for UIGLoader3DLongPress
    uigl3d_idx = find_event_block(lines, 'UIGLoader3DLongPress')
    if uigl3d_idx >= 0:
        # Find the end of this event's comment block
        insert_idx = uigl3d_idx + 1
        # Skip any trailing empty lines
        while insert_idx < len(lines) and lines[insert_idx].strip() == '':
            insert_idx += 1
        
        new_events = [
            '    ---当任意玩家打开游戏界面<br>',
            '    ---\\---过滤参数---<br>',
            '    ---```uiid``` — 界面ID<br>',
            '    ---\\---传参---<br>',
            '    ---```CustomUI``` — 事件中的界面<br>',
            '    ---```eventobjid``` — 触发事件的对象<br>',
            '    ---```x,y,z``` — 事件中的位置<br>',
            '    ---```eventworldid``` — 事件中的星球<br>',
            '    PlayerOpenInnerView = "Player.OpenInnerView",',
            '',
            '    ---当任意玩家关闭游戏界面<br>',
            '    ---\\---过滤参数---<br>',
            '    ---```uiid``` — 界面ID<br>',
            '    ---\\---传参---<br>',
            '    ---```CustomUI``` — 事件中的界面<br>',
            '    ---```eventobjid``` — 触发事件的对象<br>',
            '    ---```x,y,z``` — 事件中的位置<br>',
            '    ---```eventworldid``` — 事件中的星球<br>',
            '    PlayerCloseInnerView = "Player.CloseInnerView",',
            '',
            '    ---当前界面的触摸滑动开始<br>',
            '    ---\\---过滤参数---<br>',
            '    ---```elementid``` — 元件ID<br>',
            '    ---\\---传参---<br>',
            '    ---```eventobjid``` — 触发事件的对象<br>',
            '    ---```uielement``` — 事件中的元件<br>',
            '    ---```x,y,z``` — 事件中的位置<br>',
            '    ---```eventworldid``` — 事件中的星球<br>',
            '    UIScrollPaneTouchBegin = "UI.ScrollPane.TouchBegin",',
            '',
            '    ---当前界面的触摸滑动结束<br>',
            '    ---\\---过滤参数---<br>',
            '    ---```elementid``` — 元件ID<br>',
            '    ---\\---传参---<br>',
            '    ---```eventobjid``` — 触发事件的对象<br>',
            '    ---```uielement``` — 事件中的元件<br>',
            '    ---```x,y,z``` — 事件中的位置<br>',
            '    ---```eventworldid``` — 事件中的星球<br>',
            '    UIScrollPaneTouchEnd = "UI.ScrollPane.TouchEnd",',
            '',
            '    ---当前界面的惯性滑动结束<br>',
            '    ---\\---过滤参数---<br>',
            '    ---```elementid``` — 元件ID<br>',
            '    ---\\---传参---<br>',
            '    ---```eventobjid``` — 触发事件的对象<br>',
            '    ---```uielement``` — 事件中的元件<br>',
            '    ---```x,y,z``` — 事件中的位置<br>',
            '    ---```eventworldid``` — 事件中的星球<br>',
            '    UIScrollPaneScrollEnd = "UI.ScrollPane.ScrollEnd",',
        ]
        
        for j, line in enumerate(new_events):
            lines.insert(insert_idx + j, line)
        changes += 5
        print(f"  Added 5 TriggerEvents after UIGLoader3DLongPress")
    else:
        print("  WARNING: Could not find UIGLoader3DLongPress")
    
    # ============================================================
    # TASK 2: Add eventworldid to all events that need it
    # ============================================================
    print("Task 2: Adding eventworldid parameter...")
    
    # TriggerEvent - events that need eventworldid
    trigger_events_needing_eventworldid = [
        'PlayerRevive', 'PlayerMoveOneBlockSize', 'PlayerSelectShortcut',
        'PlayerInvateFriend', 'GameAnyPlayerEnterGame', 'GameAnyPlayerLeaveGame',
        'GameAnyPlayerVictory', 'GameAnyPlayerDefeat',
        'PlayerClickBlock', 'PlayerClickPlayer', 'PlayerClickMob',
        'PlayerClickProjectile', 'PlayerClickDropItem', 'PlayerClickEntity',
        'PlayerInputKeyClick', 'PlayerInputKeyDown', 'PlayerInputKeyUp', 'PlayerInputKeyOnPress',
        'PlayerNewInputContent', 'PlayerGunAction',
        'PlayerMotionStateChange', 'PlayerMotionStateChangeEnd',
        'PlayerAddItem', 'PlayerUseItem', 'PlayerChargeItemBegin',
        'PlayerConsumeItem', 'PlayerPickUpItem', 'PlayerDiscardItem', 'PlayerChargeItemEnd',
        'PlayerShortcutChange', 'PlayerShortcutAddItem', 'PlayerShortcutRemItem',
        'PlayerBackPackChange', 'PlayerBackPackAddItem', 'PlayerBackPackRemItem',
        'PlayerEquipChange', 'PlayerEquipAddItem', 'PlayerEquipRemItem',
        'PlayerEquipOn', 'PlayerEquipOff',
        'BlockAdd', 'BlockRemove',
        'BlockDigBegin', 'BlockDigEnd', 'BlockDigCancel',
        'BlockTrigger', 'BlockChangeColor', 'BlockChangeDir',
        'BlockContainerChange', 'BlockContainerPutIn', 'BlockContainerTakeOut',
        'UISpineComplete', 'UIShow', 'UIHide',
        'UIButtonClick', 'UIButtonTouchBegin', 'UIButtonTouchEnd', 'UIButtonLongPress',
        'UIGLoader3DTouchClick', 'UIGLoader3DTouchBegin', 'UIGLoader3DTouchEnd', 'UIGLoader3DLongPress',
        'ParticlePosOnCreate', 'ParticleObjectOnCreate', 'ParticlePlayerOnCreate',
        'ParticleMobOnCreate', 'ParticleProjectileOnCreate', 'ParticleItemOnCreate', 'ParticleEntityOnCreate',
        'DeveloperBuyItem',
        'PlayerCollideToPlayer', 'PlayerCollideToMob', 'PlayerCollideToMissile',
        'PlayerCollideToDropItem', 'PlayerCollideToEntity', 'PlayerCollideToAreaObj',
        'MobCollideToPlayer', 'MobCollideToMob', 'MobCollideToMissile',
        'MobCollideToDropItem', 'MobCollideToEntity', 'MobCollideToAreaObj',
        'MissileCollideToPlayer', 'MissileCollideToMob', 'MissileCollideToMissile',
        'MissileCollideToDropItem', 'MissileCollideToEntity', 'MissileCollideToAreaObj',
        'DropItemCollideToPlayer', 'DropItemCollideToMob', 'DropItemCollideToMissile',
        'DropItemCollideToDropItem', 'DropItemCollideToEntity', 'DropItemCollideToAreaObj',
        'EntityCollideToPlayer', 'EntityCollideToMob', 'EntityCollideToMissile',
        'EntityCollideToDropItem', 'EntityCollideToEntity', 'EntityCollideToAreaObj',
        'AreaObjCollideToPlayer', 'AreaObjCollideToMob', 'AreaObjCollideToMissile',
        'AreaObjCollideToDropItem', 'AreaObjCollideToEntity', 'AreaObjCollideToAreaObj',
        'PlayerAreaIn', 'PlayerAreaOut', 'MobAreaIn', 'MobAreaOut',
        'MissileAreaIn', 'MissileAreaOut', 'DropItemAreaIn', 'DropItemAreaOut',
        'EntityAreaIn', 'EntityAreaOut', 'AreaObjAreaIn', 'AreaObjAreaOut',
        'MobCreate', 'EntityCreate', 'AreaObjCreate',
        'PlayerBeHurt', 'PlayerDie', 'MobBeHurt', 'MobDie',
        'PlayerAttack', 'PlayerAttackHit', 'PlayerDefeatActor', 'PlayerDamageActor',
        'MobAttack', 'MobAttackHit', 'MobBeat', 'MobDamage',
        'PlayerAddBuff', 'PlayerRemoveBuff', 'MobAddBuff', 'MobRemoveBuff',
        'PlayerChangeAttr', 'MobChangeAttr',
        'ActorPickupActor', 'PlayerAttrStateChange', 'MobAttrStateChange',
        'PlayerMountActor', 'MobMountActor', 'PlayerDismountActor', 'MobDismountActor',
        'MissileCreate',
        'ProjectileHitBlock', 'ProjectileHitPlayer', 'ProjectileHitMob',
        'ProjectileHitProj', 'ProjectileHitItem', 'ProjectileHitEntity',
        'ItemCreate', 'DropItemPickup', 'ItemDisappear',
    ]
    
    eventworldid_line = '---```eventworldid``` — 事件中的星球<br>'
    
    for event_name in trigger_events_needing_eventworldid:
        idx = find_event_block(lines, event_name)
        if idx < 0:
            continue
        
        # Check if eventworldid already exists
        comment_start = find_comment_start(lines, idx)
        has_eventworldid = False
        for i in range(comment_start, idx):
            if 'eventworldid' in lines[i]:
                has_eventworldid = True
                break
        
        if not has_eventworldid:
            add_param_to_event(lines, event_name, eventworldid_line)
            changes += 1
    
    # ObjectEvent - events that need eventworldid
    object_events_needing_eventworldid = [
        'PlayerEnterGame', 'PlayerLeaveGame', 'PlayerVictory', 'PlayerDefeat',
        'PlayerClickBlock', 'PlayerClickPlayer', 'PlayerClickMob',
        'PlayerClickProjectile', 'PlayerClickDropItem', 'PlayerClickEntity',
        'PlayerInputKeyClick', 'PlayerInputKeyDown', 'PlayerInputKeyUp', 'PlayerInputKeyOnPress',
        'PlayerNewInputContent',
        'ObjectMotionStateChange', 'ObjectMotionStateChangeEnd',
        'PlayerAddItem', 'PlayerUseItem', 'PlayerChargeItemBegin',
        'PlayerConsumeItem', 'PlayerPickUpItem', 'PlayerChargeItemEnd',
        'PlayerShortcutChange', 'PlayerShortcutAddItem', 'PlayerShortcutRemItem',
        'PlayerBackPackChange', 'PlayerBackPackAddItem', 'PlayerBackPackRemItem',
        'PlayerEquipChange', 'PlayerEquipAddItem', 'PlayerEquipRemItem',
        'PlayerEquipOn', 'PlayerEquipOff',
        'PlayerRevive', 'PlayerMoveOneBlockSize', 'PlayerInvateFriend', 'PlayerSelectShortcut',
        'BlockAdd', 'BlockClicked', 'BlockRemove',
        'BlockDigBegin', 'BlockDigEnd', 'BlockDigCancel',
        'OnInteract', 'BlockChangeColor', 'BlockChangeDir',
        'BlockContainerChange', 'BlockContainerPutIn', 'BlockContainerTakeOut',
        'OnPropertyChange',
        'ObjectCollideByPlayer', 'ObjectCollideByMob', 'ObjectCollideByMissile',
        'ObjectCollideByDropItem', 'ObjectCollideByEntity', 'ObjectCollideByAreaObj',
        'ObjectBeClick', 'ObjectBeHurt', 'ObjectDie',
        'ObjectAttack', 'ObjectAttackHit', 'ObjectDefeat', 'ObjectDamage',
        'ObjectAddBuff', 'ObjectRemoveBuff',
        'ObjectAttrStateChange', 'ObjectChangeAttr',
        'ObjectMountActor', 'ObjectDismountActor',
    ]
    
    for event_name in object_events_needing_eventworldid:
        idx = find_event_block(lines, event_name)
        if idx < 0:
            continue
        
        comment_start = find_comment_start(lines, idx)
        has_eventworldid = False
        for i in range(comment_start, idx):
            if 'eventworldid' in lines[i]:
                has_eventworldid = True
                break
        
        if not has_eventworldid:
            add_param_to_event(lines, event_name, eventworldid_line)
            changes += 1
    
    print(f"  Added eventworldid to {changes - 5} events")
    
    # ============================================================
    # TASK 3: Add filter parameter annotations
    # ============================================================
    print("Task 3: Adding filter parameter annotations...")
    
    filter_annotations = {
        # KeyCode events
        'PlayerInputKeyClick': ['---@see KeyCode', '---```KeyCode``` — 按键枚举<br>'],
        'PlayerInputKeyDown': ['---@see KeyCode', '---```KeyCode``` — 按键枚举<br>'],
        'PlayerInputKeyUp': ['---@see KeyCode', '---```KeyCode``` — 按键枚举<br>'],
        'PlayerInputKeyOnPress': ['---@see KeyCode', '---```KeyCode``` — 按键枚举<br>'],
        # RoleMotion events
        'PlayerMotionStateChange': ['---@see RoleMotion', '---```RoleMotion``` — 角色行为枚举<br>'],
        'PlayerMotionStateChangeEnd': ['---@see RoleMotion', '---```RoleMotion``` — 角色行为枚举<br>'],
        # Gun events
        'PlayerGunAction': ['---@see GunState', '---@see GunAction', '---```GunState``` — 枪械状态<br>', '---```GunAction``` — 枪械触发事件类型<br>'],
        # RoleAttr events
        'PlayerChangeAttr': ['---@see RoleAttr', '---```RoleAttr``` — 生物/玩家属性<br>'],
        'MobChangeAttr': ['---@see RoleAttr', '---```RoleAttr``` — 生物/玩家属性<br>'],
        # Ability events
        'PlayerAttrStateChange': ['---@see Ability', '---```Ability``` — 动作总开关<br>'],
        'MobAttrStateChange': ['---@see Ability', '---```Ability``` — 动作总开关<br>'],
        # Area events
        'PlayerAreaIn': ['---```areaid``` — 区域id<br>'],
        'PlayerAreaOut': ['---```areaid``` — 区域id<br>'],
        'MobAreaIn': ['---```areaid``` — 区域id<br>'],
        'MobAreaOut': ['---```areaid``` — 区域id<br>'],
        'MissileAreaIn': ['---```areaid``` — 区域id<br>'],
        'MissileAreaOut': ['---```areaid``` — 区域id<br>'],
        'DropItemAreaIn': ['---```areaid``` — 区域id<br>'],
        'DropItemAreaOut': ['---```areaid``` — 区域id<br>'],
        'EntityAreaIn': ['---```areaid``` — 区域id<br>'],
        'EntityAreaOut': ['---```areaid``` — 区域id<br>'],
        'AreaObjAreaIn': ['---```areaid``` — 区域id<br>'],
        'AreaObjAreaOut': ['---```areaid``` — 区域id<br>'],
        # Timer event
        'MinitimerChange': ['---```timerid``` — 计时器id<br>'],
        # UI filter events
        'UILostFocus': ['---```elementid``` — 元件ID<br>'],
        'UISpineComplete': ['---```elementid``` — 元件ID<br>'],
        'UIShow': ['---```uiid``` — 界面ID<br>'],
        'UIHide': ['---```uiid``` — 界面ID<br>'],
        'UIButtonClick': ['---```elementid``` — 元件ID<br>'],
        'UIButtonTouchBegin': ['---```elementid``` — 元件ID<br>'],
        'UIButtonTouchEnd': ['---```elementid``` — 元件ID<br>'],
        'UIButtonLongPress': ['---```elementid``` — 元件ID<br>'],
        'UIGLoader3DTouchClick': ['---```elementid``` — 元件ID<br>'],
        'UIGLoader3DTouchBegin': ['---```elementid``` — 元件ID<br>'],
        'UIGLoader3DTouchEnd': ['---```elementid``` — 元件ID<br>'],
        'UIGLoader3DLongPress': ['---```elementid``` — 元件ID<br>'],
    }
    
    filter_count = 0
    for event_name, filter_lines in filter_annotations.items():
        idx = find_event_block(lines, event_name)
        if idx < 0:
            continue
        
        comment_start = find_comment_start(lines, idx)
        
        # Check if filter already exists
        has_filter = False
        for i in range(comment_start, idx):
            if '@see' in lines[i] or '过滤参数' in lines[i]:
                has_filter = True
                break
        
        if not has_filter:
            add_filter_annotation(lines, event_name, filter_lines)
            filter_count += 1
    
    print(f"  Added filter annotations to {filter_count} events")
    
    # ============================================================
    # TASK 4: Add targetactorid to collision events
    # ============================================================
    print("Task 4: Adding targetactorid to collision events...")
    
    collision_events = [
        'PlayerCollideToPlayer', 'PlayerCollideToMob', 'PlayerCollideToMissile',
        'PlayerCollideToDropItem', 'PlayerCollideToEntity', 'PlayerCollideToAreaObj',
        'MobCollideToPlayer', 'MobCollideToMob', 'MobCollideToMissile',
        'MobCollideToDropItem', 'MobCollideToEntity', 'MobCollideToAreaObj',
        'MissileCollideToPlayer', 'MissileCollideToMob', 'MissileCollideToMissile',
        'MissileCollideToDropItem', 'MissileCollideToEntity', 'MissileCollideToAreaObj',
        'DropItemCollideToPlayer', 'DropItemCollideToMob', 'DropItemCollideToMissile',
        'DropItemCollideToDropItem', 'DropItemCollideToEntity', 'DropItemCollideToAreaObj',
        'EntityCollideToPlayer', 'EntityCollideToMob', 'EntityCollideToMissile',
        'EntityCollideToDropItem', 'EntityCollideToEntity', 'EntityCollideToAreaObj',
        'AreaObjCollideToPlayer', 'AreaObjCollideToMob', 'AreaObjCollideToMissile',
        'AreaObjCollideToDropItem', 'AreaObjCollideToEntity', 'AreaObjCollideToAreaObj',
        'ObjectCollideByPlayer', 'ObjectCollideByMob', 'ObjectCollideByMissile',
        'ObjectCollideByDropItem', 'ObjectCollideByEntity', 'ObjectCollideByAreaObj',
    ]
    
    targetactorid_line = '---```targetactorid``` — 事件中的目标生物类型<br>'
    
    targetactorid_count = 0
    for event_name in collision_events:
        idx = find_event_block(lines, event_name)
        if idx < 0:
            continue
        
        comment_start = find_comment_start(lines, idx)
        
        # Check if targetactorid already exists
        has_targetactorid = False
        for i in range(comment_start, idx):
            if 'targetactorid' in lines[i]:
                has_targetactorid = True
                break
        
        if not has_targetactorid:
            # Find the toobjid line and insert after it
            toobjid_idx = -1
            for i in range(comment_start, idx):
                if 'toobjid' in lines[i]:
                    toobjid_idx = i
                    break
            
            if toobjid_idx >= 0:
                lines.insert(toobjid_idx + 1, targetactorid_line)
                targetactorid_count += 1
    
    print(f"  Added targetactorid to {targetactorid_count} collision events")
    
    # ============================================================
    # Write the updated file
    # ============================================================
    write_file(events_lua, '\n'.join(lines))
    print(f"\nTotal changes: {changes - 5 + filter_count + targetactorid_count}")
    print("Done!")

if __name__ == '__main__':
    main()
