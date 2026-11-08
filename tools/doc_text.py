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


COMPOUNDS = (
    ("short", "cut"), ("blue", "print"), ("back", "pack"), ("base", "64"),
    ("world", "id"), ("team", "id"), ("item", "id"), ("block", "id"),
    ("buff", "id"), ("player", "id"), ("actor", "id"), ("grid", "id"),
    ("var", "id"), ("ui", "id"), ("obj", "id"), ("area", "id"),
    ("model", "id"), ("music", "id"), ("anim", "id"), ("skin", "id"),
    ("effect", "id"), ("particle", "id"), ("role", "type"),
    ("nick", "name"), ("short", "cut"), ("snap", "short"),
)

TYPO_FIX = {
    "shurt": "shortcut", "usrer": "user", "usrerinfo": "userinfo",
    "avator": "avatar", "szie": "size", "nomal": "normal", "pase": "pause",
    "resum": "resume", "attched": "attached", "misssile": "missile",
    "dispath": "dispatch", "varable": "variable", "snyc": "sync",
    "linsten": "listen", "swich": "switch", "recoder": "recorder",
    "indexs": "indices", "rang": "range", "camer": "camera", "sever": "server",
    "whit": "white", "revie": "review", "mun": "num", "fvo": "fov",
    "bykey": "key", "revie": "review", "sing": "single",
}

NOISE = {"the", "of", "a", "an", "act"}

MATH_WORDS = {
    "abs": "绝对值", "ceil": "向上取整", "floor": "向下取整", "round": "四舍五入",
    "sin": "正弦", "cos": "余弦", "tan": "正切", "sqrt": "平方根", "pow": "幂",
    "pow10": "10 的幂", "log10": "常用对数", "ldexp": "浮点倍数", "deg": "角度",
    "rad": "弧度", "lerp": "插值", "div": "除法", "divide": "除法",
    "multiply": "乘法", "sub": "减法", "negate": "取负", "xor": "异或",
    "concat": "拼接", "even": "偶数", "odd": "奇数", "prime": "质数",
    "positive": "正数", "negative": "负数", "zero": "零", "greater": "大于",
    "less": "小于", "equal": "相等", "arithmetic": "四则运算", "logic": "逻辑",
}


def tokenize(method: str) -> list[str]:
    spaced = re.sub(r"([a-z0-9])([A-Z])", r"\1 \2", method)
    spaced = re.sub(r"([A-Z]+)([A-Z][a-z])", r"\1 \2", spaced)
    spaced = re.sub(r"([A-Za-z])([0-9]+)$", r"\1 \2", spaced)
    spaced = re.sub(r"[^A-Za-z0-9]+", " ", spaced)
    words = [TYPO_FIX.get(word.lower(), word.lower()) for word in spaced.split() if word]
    merged: list[str] = []
    index = 0
    while index < len(words):
        for left, right in COMPOUNDS:
            if words[index] == left and index + 1 < len(words) and words[index + 1] == right:
                merged.append(left + right)
                index += 2
                break
        else:
            merged.append(words[index])
            index += 1
    return [word for word in merged if word not in NOISE]


_SEGMENT_CACHE: dict[str, list[str] | None] = {}


def _segment(word: str) -> list[str] | None:
    if not word:
        return []
    if word in _SEGMENT_CACHE:
        return _SEGMENT_CACHE[word]
    result = None
    for size in range(len(word), 1, -1):
        head = word[:size]
        if head in VERBS or head in NOUNS or head in MATH_WORDS:
            rest = _segment(word[size:])
            if rest is not None:
                result = [head] + rest
                break
    _SEGMENT_CACHE[word] = result
    return result


def _translate(word: str) -> str:
    if word in VERBS:
        return VERBS[word]
    if word in NOUNS:
        return NOUNS[word]
    if word in MATH_WORDS:
        return MATH_WORDS[word]
    if len(word) >= 4:
        parts = _segment(word)
        if parts and len(parts) > 1:
            return "".join(_translate(part) for part in parts)
    if re.fullmatch(r"[a-z]+\d+", word):
        return _translate(re.sub(r"\d+$", "", word))
    if word.endswith("es") and word[:-2] in NOUNS:
        return NOUNS[word[:-2]]
    if word.endswith("s") and word[:-1] in NOUNS:
        return NOUNS[word[:-1]]
    return word


def _phrase(words: list[str]) -> str:
    return "".join(_translate(word) for word in words)


CONNECTORS = ("by", "in", "on", "for", "with", "from", "to", "and", "or")

ADD_VERBS = {"add", "insert", "append", "push", "move", "mount", "put", "set"}


def _compose(words: list[str]) -> str:
    if not words:
        return ""
    for connector in CONNECTORS:
        if connector not in words:
            continue
        index = words.index(connector)
        before, after = words[:index], words[index + 1:]
        if not before or not after:
            continue
        left, right = _compose(before), _compose(after)
        if connector == "by":
            return "按" + right + left
        if connector == "in":
            return "在" + right + "中" + left
        if connector == "on":
            return "在" + right + "上" + left
        if connector == "for":
            return "为" + right + left
        if connector == "with":
            return "使用" + right + left
        if connector == "from":
            return "从" + right + left
        if connector == "to":
            if before[0] in ADD_VERBS:
                head, rest = before[0], _compose(before[1:])
                return "将" + rest + _translate(head) + "到" + right
            return left + "转换为" + right
        joiner = "和" if connector == "and" else "或"
        return left + joiner + right
    return _phrase(words)


def purpose(method: str) -> str:
    if method in SPECIAL:
        return SPECIAL[method]
    words = tokenize(method)
    if not words:
        return f"调用 {method}"
    while words and words[-1] in CONNECTORS:
        words = words[:-1]
    if not words:
        return f"调用 {method}"
    if words[0] == "on" and len(words) > 1:
        return _compose(words[1:]) + "时触发"
    if words[0] in MATH_WORDS:
        rest = _compose(words[1:])
        return f"计算{MATH_WORDS[words[0]]}{rest}" if rest else f"计算{MATH_WORDS[words[0]]}"
    if words[0] == "get" and len(words) > 1 and words[1] in ("is", "has", "can"):
        flags, index = [], 1
        while index < len(words) and words[index] in ("is", "has", "can"):
            flags.append(words[index])
            index += 1
        prefix = "判断是否拥有" if "has" in flags else "判断是否"
        return prefix + _compose(words[index:])
    if words[0] == "get" and len(words) > 1 and words[1] in MATH_WORDS:
        rest = _compose(words[2:])
        return f"获取{MATH_WORDS[words[1]]}{rest}"
    return _compose(words)


def param_desc(name: str) -> str:
    key = name.lower()
    if key in PARAM_DESC:
        return PARAM_DESC[key]
    if re.fullmatch(r"pos\d*", key):
        return "位置"
    if re.fullmatch(r"vec\d*", key):
        return "向量"
    if re.fullmatch(r"v\d+", key):
        return "数值"
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


def return_info(type_text: str, method: str, params: list[str] | None = None,
                index: int = 0) -> tuple[str, str]:
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
    if index:
        name = f"result{index + 1}"
    elif lowered.startswith(("get", "find", "query")):
        name = "value"
    elif "Mini.Vec3" in type_text:
        name = "pos"
    if name in params:
        name = "ret" if not index else f"ret{index + 1}"
    return name, desc


VERBS.update({
    "make": "生成", "modify": "修改", "alter": "修改", "turn": "转换",
    "split": "拆分", "sort": "排序", "export": "导出", "apply": "应用",
    "expand": "扩展", "extend": "扩展", "fill": "填充", "interact": "交互",
    "activate": "激活", "pick": "拾取", "wear": "穿戴", "collect": "收集",
    "evaluate": "评价", "deal": "处理", "operate": "操作", "upgrade": "升级",
    "finish": "完成", "skip": "跳过", "quit": "退出", "vibrate": "震动",
    "snap": "吸附", "melt": "融化", "login": "登录", "ban": "封禁",
    "capture": "捕获", "gain": "获得", "share": "分享", "trace": "追踪",
    "decode": "解码", "extract": "提取", "judge": "判定", "detection": "检测",
    "preview": "预览", "edit": "编辑", "del": "删除", "forbid": "禁止",
    "allow": "允许", "escape": "逃脱", "die": "使死亡", "shoot": "发射",
    "aim": "瞄准", "defeat": "击败", "exchange": "兑换", "pay": "支付",
    "broadcast": "广播", "contain": "包含", "exist": "存在", "summoner": "召唤",
})

NOUNS.update({
    "task": "任务", "var": "变量", "order": "订单", "graphics": "图文",
    "prefab": "预制体", "component": "组件", "cmp": "组件", "string": "字符串",
    "element": "元件", "base": "基础", "sky": "天空", "random": "随机",
    "storage": "存储", "shortcut": "快捷栏", "tool": "工具", "res": "资源",
    "target": "目标", "shooter": "射手", "hand": "手", "str": "字符串",
    "smooth": "平滑", "math": "数学", "pack": "背包", "bool": "布尔值",
    "nick": "昵称", "frame": "帧", "filter": "过滤", "user": "用户",
    "userinfo": "用户信息", "loader": "加载器", "icon": "图标", "number": "数字",
    "btree": "行为树", "back": "背包", "guide": "引导", "cur": "当前",
    "any": "任意", "transmit": "传送", "skin": "皮肤", "ex": "扩展",
    "row": "行", "col": "列", "run": "运行", "desc": "描述", "transform": "变换",
    "yaw": "偏航角", "dirty": "脏标记", "mini": "迷你", "visible": "可见",
    "chain": "连锁", "furnace": "熔炉", "projectile": "抛射物", "function": "函数",
    "equal": "相等", "ray": "射线", "first": "首次", "valid": "有效",
    "near": "附近", "tick": "刻", "avatar": "形象", "status": "状态",
    "slider": "滑块", "line": "线", "info": "信息", "tab": "页签",
    "asset": "资源", "permissions": "权限", "permit": "权限", "immune": "免疫",
    "rot": "旋转", "marker": "标记", "blueprint": "蓝图", "float": "浮点数",
    "values": "值", "psychedelic": "迷幻", "vision": "视野", "screen": "屏幕",
    "display": "显示", "craft": "合成", "crafting": "合成", "food": "食物",
    "val": "值", "tree": "树", "movement": "移动", "bound": "边界",
    "size": "尺寸", "initial": "初始", "summer": "夏日", "fish": "钓鱼",
    "role": "角色", "objective": "目标", "results": "结果", "shake": "震动",
    "tips": "提示", "times": "次数", "death": "死亡", "relative": "相对",
    "creature": "生物", "transfer": "转移", "tostring": "字符串",
    "maps": "地图", "container": "容器", "obj": "对象", "type": "类型",
    "auto": "自动", "enough": "足够", "empty": "空", "stack": "堆叠",
    "normal": "普通", "rod": "鱼竿", "not": "不", "city": "城市",
    "horse": "马", "spine": "骨骼", "pic": "图片", "rows": "行",
    "tmp": "临时", "midway": "中途", "down": "下", "rule": "规则",
    "life": "生命", "dev": "开发", "sync": "同步", "listen": "监听",
    "weather": "天气", "instance": "实例", "eye": "眼睛", "height": "高度",
    "riding": "骑乘", "forever": "永久", "able": "能够", "be": "为",
    "forward": "前进", "white": "白", "living": "存活", "req": "请求",
    "zombie": "僵尸", "setting": "设置", "system": "系统", "msg": "消息",
    "coin": "金币", "advertising": "广告", "ads": "广告", "left": "左",
    "mob": "生物", "explosion": "爆炸", "snapshot": "快照", "chunk": "区块",
    "percent": "百分比", "center": "中心", "relation": "关系", "light": "光照",
    "rect": "矩形", "range": "范围", "durability": "耐久", "enchant": "附魔",
    "mouse": "鼠标", "attached": "附着", "precious": "珍稀",
    "manager": "管理器", "lv": "等级", "cmd": "指令", "test": "测试",
    "dispatch": "分发", "inscription": "铭文", "spell": "法术",
    "automatic": "自动", "variable": "变量", "server": "服务器",
    "other": "其他", "magazine": "弹匣", "colors": "颜色", "color": "颜色",
    "local": "本地", "bounceback": "回弹", "txt": "文本", "touch": "触摸",
    "csv": "CSV", "nil": "空", "billboard": "公告牌", "internal": "内部",
    "btn": "按钮", "begin": "开始", "record": "记录", "error": "错误",
    "head": "头部", "ai": "AI", "aquatic": "水生", "mass": "质量",
    "base64": "Base64", "general": "通用", "reported": "上报",
    "strength": "强度", "survive": "生存", "real": "真实",
    "developer": "开发者", "mall": "商城", "ability": "能力",
    "hitted": "受击", "used": "已使用", "coins": "金币", "clip": "片段",
    "polaroid": "拍立得", "home": "家", "bad": "坏", "native": "原生",
    "next": "下一个", "playing": "播放中", "broadcast": "广播",
    "replaceable": "可替换", "svr": "服务器", "login": "登录", "mid": "中间",
    "flag": "标记", "planet": "星球", "ms": "毫秒", "boxtime": "宝箱时间",
    "worldid": "星球ID", "match": "匹配", "station": "站点", "snow": "雪",
    "heat": "热度", "sizeblock": "方块尺寸", "space": "空间", "spc": "特殊",
    "switch": "开关", "parent": "父级", "beacon": "信标", "font": "字体",
    "single": "单个", "des": "描述", "arrow": "箭头", "nav": "导航",
    "path": "路径", "surface": "表面", "opt": "可选", "fixed": "固定",
    "un": "取消", "enum": "枚举", "inviter": "邀请者", "origin": "原点",
    "house": "房屋", "goods": "商品", "book": "书", "adventure": "冒险",
    "era": "时代", "specialty": "专长", "fov": "视野", "win": "获胜",
    "mobile": "移动端", "areas": "区域", "loaded": "已加载",
    "lut": "查找表", "template": "模板", "inner": "内部", "index": "索引",
    "mark": "标记", "off": "关闭", "up": "开启", "destruct": "销毁",
    "discard": "丢弃", "isinteger": "是否为整数", "isnil": "是否为空",
    "v3": "三维向量", "att": "属性", "indexs": "索引用表",
})


TYPO_FIX.update({"dis": "cancel", "recoverinitial": "restore", "itemidand": "itemid"})

VERBS.update({"cancel": "取消", "restore": "恢复"})

NOUNS.update({
    "itemid": "道具ID", "blockid": "方块ID", "buffid": "状态ID",
    "playerid": "玩家ID", "actorid": "角色ID", "objid": "对象ID",
    "gridid": "格子ID", "varid": "变量ID", "uiid": "界面ID",
    "teamid": "队伍ID", "areaid": "区域ID", "worldid": "星球ID",
    "modelid": "模型ID", "musicid": "音乐ID", "animid": "动画ID",
    "skinid": "皮肤ID", "effectid": "特效ID", "particleid": "粒子ID",
    "roletype": "角色类型", "box": "框", "def": "定义", "recorder": "记录器",
    "uin": "Uin", "cbuffid": "状态ID", "ver": "版本", "nickname": "昵称",
})


NOUNS.update({
    "pass": "通过", "single": "单人", "screenshot": "截图", "missile": "抛射物",
    "indices": "索引列表", "band": "频段", "and": "和", "or": "或",
    "review": "审核", "author": "作者", "processing": "处理中", "ix": "图标",
    "snapshort": "截图",
})
VERBS.update({"pass": "通过"})


VERBS.update({"swap": "交换", "click": "点击", "hover": "悬停"})


NOUNS.update({"visibility": "可见", "static": "静态", "restype": "资源类型", "groupview": "分组", "mesh": "网格"})
