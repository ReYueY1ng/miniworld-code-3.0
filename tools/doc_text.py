#!/usr/bin/env python3
"""Generate readable Chinese doc text for inferred Mini World APIs.

Used by the optional-lane generator when the wiki has no description: method
names, parameter names and inferred return types are translated through the
dictionaries below so every stub carries a purpose, parameter notes and a
return description instead of a generic placeholder.
"""

from __future__ import annotations

import re

VERBS = {
    "get": "获取",
    "set": "设置",
    "add": "添加",
    "append": "追加",
    "insert": "插入",
    "remove": "移除",
    "delete": "删除",
    "clear": "清空",
    "create": "创建",
    "new": "新建",
    "gen": "生成",
    "generate": "生成",
    "build": "构建",
    "destroy": "销毁",
    "find": "查找",
    "search": "搜索",
    "is": "判断是否",
    "has": "判断是否拥有",
    "can": "判断能否",
    "play": "播放",
    "stop": "停止",
    "pause": "暂停",
    "resume": "恢复",
    "open": "打开",
    "close": "关闭",
    "show": "显示",
    "hide": "隐藏",
    "send": "发送",
    "recv": "接收",
    "receive": "接收",
    "load": "加载",
    "save": "保存",
    "enable": "启用",
    "disable": "禁用",
    "update": "更新",
    "refresh": "刷新",
    "sync": "同步",
    "start": "开始",
    "end": "结束",
    "move": "移动",
    "teleport": "传送",
    "spawn": "生成",
    "despawn": "移除",
    "attack": "攻击",
    "hurt": "造成伤害",
    "damage": "造成伤害",
    "heal": "治疗",
    "bind": "绑定",
    "unbind": "解绑",
    "equip": "装备",
    "unequip": "卸下",
    "use": "使用",
    "buy": "购买",
    "sell": "出售",
    "count": "统计",
    "calc": "计算",
    "compare": "比较",
    "check": "检查",
    "reset": "重置",
    "call": "调用",
    "do": "执行",
    "to": "转换为",
    "from": "从",
    "push": "推送",
    "pop": "弹出",
    "register": "注册",
    "unregister": "注销",
    "lock": "锁定",
    "unlock": "解锁",
    "mount": "骑乘",
    "dismount": "取消骑乘",
    "ride": "骑乘",
    "trigger": "触发",
    "notify": "通知",
    "report": "上报",
    "query": "查询",
    "request": "请求",
    "wait": "等待",
    "jump": "跳跃",
    "rotate": "旋转",
    "scale": "缩放",
    "follow": "跟随",
    "watch": "监听",
    "listen": "监听",
    "emit": "发射",
    "explode": "引爆",
    "kill": "击杀",
    "revive": "复活",
    "respawn": "重生",
    "drop": "掉落",
    "pickup": "拾取",
    "throw": "投掷",
    "enter": "进入",
    "leave": "离开",
    "join": "加入",
    "kick": "踢出",
    "mute": "禁言",
    "unmute": "解除禁言",
    "chat": "聊天",
    "print": "打印",
    "log": "记录",
    "format": "格式化",
    "parse": "解析",
    "serialize": "序列化",
    "unserialize": "反序列化",
    "convert": "转换",
    "copy": "复制",
    "clone": "克隆",
    "replace": "替换",
    "grow": "生长",
    "shrink": "缩小",
    "fade": "淡入淡出",
    "substring": "截取子字符串",
    "angle": "角度",
    "biome": "群系",
    "group": "组",
    "params": "参数",
    "horizontal": "水平",
    "vertical": "垂直",
}

NOUNS = {
    "actor": "角色",
    "actors": "角色",
    "player": "玩家",
    "players": "玩家",
    "monster": "生物",
    "mob": "生物",
    "block": "方块",
    "blocks": "方块",
    "item": "道具",
    "items": "道具",
    "grid": "格子",
    "backpack": "背包",
    "buff": "状态",
    "effect": "特效",
    "sound": "音效",
    "particle": "粒子",
    "position": "位置",
    "pos": "位置",
    "coord": "坐标",
    "xyz": "XYZ",
    "world": "世界",
    "map": "地图",
    "team": "队伍",
    "hp": "血量",
    "health": "血量",
    "speed": "速度",
    "scale": "缩放",
    "rotation": "旋转",
    "euler": "欧拉角",
    "quaternion": "四元数",
    "vector": "向量",
    "color": "颜色",
    "tag": "标签",
    "tags": "标签",
    "ui": "界面",
    "view": "界面",
    "name": "名称",
    "id": "ID",
    "time": "时间",
    "count": "数量",
    "num": "数量",
    "value": "值",
    "data": "数据",
    "attr": "属性",
    "attribute": "属性",
    "skill": "技能",
    "weapon": "武器",
    "gun": "枪械",
    "anim": "动画",
    "animation": "动画",
    "model": "模型",
    "action": "动作",
    "event": "事件",
    "msg": "消息",
    "message": "消息",
    "text": "文本",
    "image": "图片",
    "img": "图片",
    "progress": "进度",
    "bar": "条",
    "size": "大小",
    "length": "长度",
    "index": "索引",
    "type": "类型",
    "list": "列表",
    "array": "数组",
    "table": "表",
    "key": "键",
    "room": "房间",
    "category": "分类",
    "server": "服务器",
    "client": "客户端",
    "cloud": "云端",
    "camera": "相机",
    "direction": "方向",
    "dir": "方向",
    "distance": "距离",
    "gravity": "重力",
    "move": "移动",
    "motion": "运动",
    "state": "状态",
    "mode": "模式",
    "level": "等级",
    "exp": "经验",
    "score": "分数",
    "reward": "奖励",
    "shop": "商店",
    "price": "价格",
    "cost": "消耗",
    "currency": "货币",
    "vip": "会员",
    "friend": "好友",
    "invite": "邀请",
    "owner": "房主",
    "host": "房主",
    "uin": "Uin",
    "obj": "对象",
    "object": "对象",
    "entity": "实体",
    "area": "区域",
    "point": "点",
    "part": "部件",
    "bone": "骨骼",
    "material": "材质",
    "texture": "纹理",
    "alpha": "透明度",
    "anchor": "锚点",
    "offset": "偏移",
    "mat": "矩阵",
    "cd": "冷却",
    "interval": "间隔",
    "delay": "延迟",
    "kind": "类型",
    "info": "信息",
    "config": "配置",
    "cfg": "配置",
    "param": "参数",
    "args": "参数",
    "callback": "回调",
    "func": "函数",
    "fn": "函数",
    "power": "强化",
    "empower": "强化",
    "bind": "绑定",
    "inst": "实例",
    "roomid": "房间ID",
    "spawnpoint": "出生点",
    "angle": "角度",
    "biome": "群系",
    "group": "组",
    "params": "参数",
    "horizontal": "水平",
    "vertical": "垂直",
    "pos1": "位置",
    "pos2": "位置",
    "possrc": "起点位置",
    "posdst": "目标位置",
    "vec1": "向量",
    "vec2": "向量",
    "xz": "XZ",
}

SPECIAL = {
    "AllAttackType": "全部攻击类型",
    "AllSound": "全部音效",
    "AllStatus": "全部状态",
    "AnyValue2Str": "将任意值转换为字符串",
    "DoObjOrArrayAction": "对对象或对象数组执行操作",
    "GetAttrVal": "获取属性值",
    "GetEffectParams": "获取特效参数",
    "GetElementID": "获取元件ID",
    "GetLastCreateBlockId": "获取最后创建的方块ID",
    "GetLastCreateCreatureId": "获取最后创建的生物ID",
    "GetLastCreateCreatureObjId": "获取最后创建的生物对象ID",
    "GetLastCreateEffectId": "获取最后创建的特效ID",
    "GetLastCreateItemId": "获取最后创建的道具ID",
    "GetMobId": "获取生物ID",
    "GetPlayerId": "获取玩家ID",
    "GetPrefabIdStr": "获取预制体ID字符串",
    "GetPrefabInfo": "获取预制体信息",
    "GetRandomColor": "获取随机颜色",
    "GetStringLength": "获取字符串长度",
    "GetUIObject": "获取界面对象",
    "GetWorld": "获取世界对象",
    "PrintTag": "打印标签",
    "SetLastCreateBlockId": "设置最后创建的方块ID",
    "SetSpawnPoint": "设置出生点",
    "GetSpawnPoint": "获取出生点",
    "SetLastCreateCreatureId": "设置最后创建的生物ID",
    "SetLastCreateEffectId": "设置最后创建的特效ID",
    "SetLastCreateItemId": "设置最后创建的道具ID",
    "SplitStr": "拆分字符串",
    "Str2Obj": "将字符串转换为对象",
    "String2Playerid": "将字符串转换为玩家ID",
    "Substring": "截取子字符串",
    "ToMobId": "转换为生物ID",
    "ToPlayerId": "转换为玩家ID",
    "TransmitToCategoryRoom": "传送到分类房间",
    "TransmitToCurMapCategoryRoom": "传送到当前地图分类房间",
    "Wait": "等待",
}

PARAM_DESC = {
    "objid": "对象ID",
    "targetid": "目标对象ID",
    "targetobjid": "目标对象ID",
    "doobj": "造成伤害的对象ID",
    "playerid": "玩家ID",
    "uin": "玩家Uin",
    "reportid": "同步报告ID",
    "gridindex": "背包格子索引",
    "index": "索引",
    "pos": "位置",
    "position": "位置",
    "posbegin": "起点位置",
    "posend": "终点位置",
    "dst": "目标位置",
    "dir": "方向",
    "x": "X坐标",
    "y": "Y坐标",
    "z": "Z坐标",
    "worldid": "星球ID",
    "world": "世界对象",
    "mapid": "地图ID",
    "itemid": "道具ID",
    "blockid": "方块ID",
    "mobid": "生物ID",
    "actorid": "角色ID",
    "actorids": "角色ID或其数组",
    "effectid": "特效ID",
    "particleid": "粒子ID",
    "particleids": "粒子ID或其数组",
    "tags": "标签",
    "icount": "引用计数",
    "badd": "是否为添加操作",
    "count": "数量",
    "num": "数量",
    "value": "值",
    "data": "数据",
    "key": "键名",
    "time": "时间（秒）",
    "second": "秒数",
    "cd": "冷却时间（秒）",
    "speed": "速度",
    "scale": "缩放",
    "rotation": "旋转",
    "color": "颜色",
    "name": "名称",
    "type": "类型",
    "itype": "类型",
    "id": "ID",
    "text": "文本",
    "msg": "消息",
    "uiid": "界面ID",
    "elementid": "元件ID",
    "attridx": "属性索引",
    "mode": "模式",
    "state": "状态",
    "flag": "开关",
    "enable": "是否启用",
    "callback": "回调函数",
    "fn": "回调函数",
    "func": "回调函数",
    "param": "参数",
    "args": "参数",
    "str": "字符串",
    "content": "内容",
    "mark": "分隔符",
    "startidx": "起始索引",
    "endidx": "结束索引",
    "cmp": "组件",
    "areaid": "区域ID",
    "damage": "伤害值",
    "attacktype": "攻击类型",
    "buffid": "状态ID",
    "skillname": "技能名",
    "level": "等级",
    "exp": "经验值",
    "hp": "血量",
    "maxhp": "最大血量",
    "radius": "半径",
    "size": "大小",
    "offset": "偏移",
    "rot": "旋转",
    "obj": "对象",
    "actor": "角色",
    "player": "玩家",
    "list": "列表",
    "isall": "是否作用于全部对象",
    "badd": "是否添加",
    "bshow": "是否显示",
    "bopen": "是否打开",
    "cancontrol": "是否允许控制",
    "bexactmatch": "是否精确匹配",
    "mathcmode": "匹配方式",
    "animid": "动画ID",
    "animtime": "动画时长",
    "url": "资源地址",
    "filepath": "文件路径",
    "filename": "文件名",
    "partname": "部件名称",
    "bonename": "骨骼名称",
    "modelstr": "模型资源",
    "instanceid": "实例ID",
    "instid": "实例ID",
    "tabval": "表数据",
    "snapshot": "快照数据",
    "version": "版本号",
    "elementid": "元件ID",
    "possrc": "起点位置",
    "posdst": "目标位置",
    "vec1": "向量",
    "vec2": "向量",
    "angle": "角度",
}


VERBS.update({
    "init": "初始化",
    "have": "拥有",
    "organize": "整理",
    "play": "播放",
    "charging": "蓄力",
    "read": "读取",
    "write": "写入",
    "change": "变更",
    "chang": "变更",
    "increases": "增加",
    "increase": "增加",
    "try": "尝试",
    "pause": "暂停",
    "stop": "停止",
})

NOUNS.update({
    "game": "游戏",
    "slot": "槽位",
    "curr": "当前",
    "global": "全局",
    "nearest": "最近",
    "randomsort": "随机排序",
    "lastfall": "下落",
    "last": "最近",
    "fall": "下落",
    "charging": "蓄力",
    "charginginfo": "蓄力信息",
    "charge": "蓄力",
    "body": "身体",
    "overlay": "覆盖",
    "orientation": "朝向",
    "modattrib": "模组属性",
    "mod": "模组",
    "attrib": "属性",
    "facade": "外观",
    "control": "控制",
    "behit": "受击",
    "collide": "碰撞",
    "act": "动作",
    "music": "音乐",
    "file": "文件",
    "main": "主",
    "max": "最大",
    "min": "最小",
    "volume": "音量",
    "pitch": "音高",
    "face": "朝向",
    "property": "属性",
    "alive": "存活",
    "switch": "开关",
    "teamid": "队伍ID",
    "varid": "变量ID",
    "libvarid": "库变量ID",
    "gridid": "格子ID",
    "range": "范围",
    "blockrange": "方块范围",
    "atttype": "属性类型",
    "attrtype": "属性类型",
    "actortype": "角色类型",
    "playmode": "播放模式",
    "actionattr": "动作属性",
    "cmpname": "组件名称",
    "musicid": "音乐ID",
    "emitid": "发射物ID",
    "ptime": "粒子时长",
    "ptme": "粒子时长",
    "itemnum": "道具数量",
    "actid": "动作ID",
    "posbeg": "起点位置",
    "firstsearch": "首次搜索",
    "boundszie": "边界大小",
    "btreevar": "行为树变量",
    "all": "全部",
    "self": "自身",
    "custom": "自定义",
    "no": "不",
    "loop": "循环",
})

PARAM_DESC.update({
    "slot": "槽位",
    "teamid": "队伍ID",
    "varid": "变量ID",
    "libvarid": "库变量ID",
    "gridid": "格子ID",
    "val": "值",
    "switch": "开关",
    "cmpname": "组件名称",
    "musicid": "音乐ID",
    "pitch": "音高",
    "volume": "音量",
    "blockrange": "方块范围",
    "atttype": "属性类型",
    "attrtype": "属性类型",
    "actortype": "角色类型",
    "playmode": "播放模式",
    "actionattr": "动作属性",
    "bartype": "进度条类型",
    "col": "列",
    "ix": "索引",
    "objida": "对象A的ID",
    "objidb": "对象B的ID",
    "itemnum": "道具数量",
    "actid": "动作ID",
    "emitid": "发射物ID",
    "posbeg": "起点位置",
    "ptime": "粒子时长",
    "ptme": "粒子时长",
    "call_back": "回调函数",
    "face": "朝向",
    "property": "属性",
    "alive": "是否存活",
    "sync": "是否同步",
    "isadd": "是否添加",
    "isauto": "是否自动",
    "ishost": "是否Host",
    "isequal": "是否相等",
    "ignoreresist": "是否忽略抗性",
    "ignoretriggerevent": "是否忽略触发事件",
    "file": "文件",
    "filename": "文件名",
    "b": "参数 B",
    "set": "设置值",
    "ability": "能力",
    "isloop": "是否循环",
    "yaw": "偏航角",
    "libobjid": "库对象ID",
    "iconname": "图标名称",
    "ignorelist": "忽略列表",
    "ischarging": "是否蓄力中",
    "maxnum": "最大数量",
    "firstsearch": "首次搜索",
    "maxcd": "最大冷却",
    "dim": "维度",
    "gridtype": "格子类型",
    "iteminfo": "道具信息",
    "desc": "描述",
    "notfollow": "不跟随",
    "epart": "部件",
    "hasinertance": "是否有惯性",
    "monsterid": "生物ID",
    "roletype": "角色类型",
    "pause": "是否暂停",
    "offest": "偏移",
    "rotate": "旋转",
    "scene": "场景",
    "relativing": "相对值",
    "centerx": "中心X坐标",
    "centery": "中心Y坐标",
    "centerz": "中心Z坐标",
    "h": "高度",
    "ktype": "键类型",
    "sigdir": "信号方向",
    "inputloopmode": "输入循环模式",
    "playlayer": "播放层",
})


def tokenize(method: str) -> list[str]:
    spaced = re.sub(r"([a-z0-9])([A-Z])", r"\1 \2", method)
    spaced = re.sub(r"([A-Z]+)([A-Z][a-z])", r"\1 \2", spaced)
    spaced = re.sub(r"[^A-Za-z0-9]+", " ", spaced)
    return [word.lower() for word in spaced.split() if word]


def _translate(word: str) -> str:
    if word in VERBS:
        return VERBS[word]
    if word in NOUNS:
        return NOUNS[word]
    return word


def _phrase(words: list[str]) -> str:
    return "".join(_translate(word) for word in words)


def purpose(method: str) -> str:
    if method in SPECIAL:
        return SPECIAL[method]
    words = tokenize(method)
    if not words:
        return f"调用 {method}"
    for connector in ("by", "in", "on", "for", "with", "from", "to"):
        if connector not in words:
            continue
        index = words.index(connector)
        before, after = words[:index], words[index + 1:]
        if not before or not after:
            continue
        if connector == "by":
            return "按" + _phrase(after) + _phrase(before)
        if connector == "in":
            return "在" + _phrase(after) + "中" + _phrase(before)
        if connector == "on":
            return "在" + _phrase(after) + "上" + _phrase(before)
        if connector == "for":
            return "为" + _phrase(after) + _phrase(before)
        if connector == "with":
            return "使用" + _phrase(after) + _phrase(before)
        if connector == "from":
            return "从" + _phrase(after) + _phrase(before)
        if connector == "to":
            return _phrase(before) + "转换为" + _phrase(after)
    return _phrase(words)


def param_desc(name: str) -> str:
    key = name.lower()
    if key in PARAM_DESC:
        return PARAM_DESC[key]
    if re.fullmatch(r"pos\d*", key):
        return "位置"
    if re.fullmatch(r"vec\d*", key) or re.fullmatch(r"v\d+", key):
        return "向量"
    words = tokenize(name)
    if words and all(word in NOUNS for word in words):
        return "".join(NOUNS[word] for word in words)
    if key.startswith(("is", "has", "can")):
        rest = key[2:] if key.startswith("is") else key[3:]
        return "是否" + _phrase(tokenize(rest) or [rest])
    for suffix, label in (("name", "名称"), ("num", "数量"), ("count", "数量"),
                          ("time", "时间"), ("id", "ID")):
        if key.endswith(suffix) and len(key) > len(suffix):
            stem = key[: -len(suffix)]
            return _phrase(tokenize(stem)) + label
    return f"参数 {name}"


def return_info(type_text: str, method: str, params: list[str] | None = None) -> tuple[str, str]:
    params = params or []
    lowered = method.lower()
    if type_text == "boolean":
        if lowered.startswith(("is", "has", "can")):
            desc = "是否满足条件"
        elif lowered.startswith(("check", "compare")):
            desc = "检查结果"
        else:
            desc = "是否成功"
    elif type_text in ("number", "integer") or type_text.startswith("integer |"):
        if lowered.startswith("calc"):
            desc = "计算结果"
        elif "count" in lowered or "num" in lowered:
            desc = "数量"
        elif "length" in lowered:
            desc = "长度"
        else:
            desc = "结果数值"
    elif type_text == "string":
        desc = "结果字符串"
    elif "Mini.Vec3" in type_text:
        desc = "位置或向量"
    elif type_text == "table":
        desc = "结果表"
    elif type_text.endswith("?"):
        desc = "结果，失败时为 nil"
    else:
        desc = "执行结果"

    name = "result"
    if lowered.startswith(("get", "find", "query")):
        name = "value"
    elif "Mini.Vec3" in type_text:
        name = "pos"
    if name in params:
        name = "ret"
    return name, desc
