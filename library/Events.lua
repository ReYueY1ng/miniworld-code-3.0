---@meta

---@enum TriggerEvent
---触发器事件管理<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/triggerevent.html)
TriggerEvent = {
    --#region 游戏

    ---当地形组的天气改变<br>
    ---\------<br>
    ---无参数<br>
    GroupWeatherChanged = "GroupWeather.Changed",
    ---游戏时间<br>
    ---\------<br>
    ---无参数<br>
    GameHour = "Game.Hour",
    ---游戏创建<br>
    ---\------<br>
    ---无参数<br>
    GameStart = "GameStart",
    ---任意计时器改变<br>
    ---\------<br>
    ---无参数<br>
    MinitimerChange = "minitimer.change",
    ---配方合成完毕<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemnum``` — 事件中的道具数量<br>
    CraftEnd = "Craft.end",
    ---当熔炼开始<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    FurnaceBegin = "Furnace.begin",
    ---当熔炼结束<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    FurnaceEnd = "Furnace.end",

    --#endregion
    --#region 玩家

    ---当任意玩家游戏失败<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    GameAnyPlayerDefeat = "Game.AnyPlayer.Defeat",
    ---当任意玩家进入游戏<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    GameAnyPlayerEnterGame = "Game.AnyPlayer.EnterGame",
    ---当任意玩家离开游戏<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    GameAnyPlayerLeaveGame = "Game.AnyPlayer.LeaveGame",
    ---当任意玩家游戏胜利<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    GameAnyPlayerVictory = "Game.AnyPlayer.Victory",
    ---当玩家获得道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemnum``` — 事件中的道具数量<br>
    PlayerAddItem = "Player.AddItem",
    ---当玩家的背包栏放入道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerBackPackAddItem = "Player.BackPackAddItem",
    ---当玩家的背包栏发生改变<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerBackPackChange = "Player.BackPackChange",
    ---当玩家的背包栏取出道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerBackPackRemItem = "Player.BackPackRemItem",
    ---当玩家金币变化<br>
    ---\------<br>
    ---参数未知<br>
    PlayerChangeCoin = "Player.ChangeCoin",
    ---当玩家开始蓄力道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemnum``` — 事件中的道具数量<br>
    PlayerChargeItemBegin = "Player.ChargeItem.Begin",
    ---当玩家结束蓄力道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemnum``` — 事件中的道具数量<br>
    PlayerChargeItemEnd = "Player.ChargeItem.End",
    ---当玩家点击任意生物<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```blockid``` — 事件中的方块类型<br>
    PlayerClickActor = "Player.ClickActor",
    ---当玩家点击任意方块<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```blockid``` — 事件中的方块类型<br>
    PlayerClickBlock = "Player.ClickBlock",
    ---当玩家点击任意掉落物<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```blockid``` — 事件中的方块类型<br>
    PlayerClickDropItem = "Player.ClickDropItem",
    ---当玩家点击任意实体<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```blockid``` — 事件中的方块类型<br>
    PlayerClickEntity = "Player.ClickEntity",
    ---当玩家点击任意生物<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```blockid``` — 事件中的方块类型<br>
    PlayerClickMob = "Player.ClickMob",
    ---当玩家点击任意玩家<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```blockid``` — 事件中的方块类型<br>
    PlayerClickPlayer = "Player.ClickPlayer",
    ---当玩家点击任意投掷物<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```blockid``` — 事件中的方块类型<br>
    PlayerClickProjectile = "Player.ClickProjectile",
    ---当玩家消耗道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemnum``` — 事件中的道具数量<br>
    PlayerConsumeItem = "Player.ConsumeItem",
    ---当玩家丢弃道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemnum``` — 事件中的道具数量<br>
    PlayerDiscardItem = "Player.DiscardItem",
    ---当玩家的装备栏放入道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerEquipAddItem = "Player.EquipAddItem",
    ---当玩家的装备栏发生改变<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerEquipChange = "Player.EquipChange",
    ---当玩家脱下装备<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerEquipOff = "Player.EquipOff",
    ---当玩家穿上装备<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerEquipOn = "Player.EquipOn",
    ---当玩家的装备栏取出道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerEquipRemItem = "Player.EquipRemItem",
    ---当玩家持枪状态改变时<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    PlayerGunAction = "Player.GunAction",
    ---玩家发送聊天信息<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```content``` — 事件中的字符串<br>
    PlayerInputContent = "Player.InputContent",
    ---当任意玩家点击按键<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```vkey``` — 按键<br>
    PlayerInputKeyClick = "Player.InputKeyClick",
    ---当任意玩家按下按键<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```vkey``` — 按键<br>
    PlayerInputKeyDown = "Player.InputKeyDown",
    ---当任意玩家长按按键<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```vkey``` — 按键<br>
    PlayerInputKeyOnPress = "Player.InputKeyOnPress",
    ---当任意玩家抬起按键<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```vkey``` — 按键<br>
    PlayerInputKeyUp = "Player.InputKeyUp",
    ---玩家邀请好友<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    PlayerInvateFriend = "Player.InvateFriend",
    ---玩家等级模型升级<br>
    ---\------<br>
    ---参数未知<br>
    PlayerLevelModelUpgrade = "Player.LevelModelUpgrade",
    ---当玩家运动状态发生改变<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    PlayerMotionStateChange = "Player.MotionStateChange",
    ---当玩家运动状态改变结束<br>
    ---\------<br>
    ---参数未知<br>
    PlayerMotionStateChangeEnd = "Player.MotionStateChangeEnd",
    ---玩家移动<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    PlayerMoveOneBlockSize = "Player.MoveOneBlockSize",
    ---玩家发送聊天信息<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```content``` — 事件中的字符串<br>
    PlayerNewInputContent = "Player.NewInputContent",
    ---当玩家拾取道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemnum``` — 事件中的道具数量<br>
    PlayerPickUpItem = "Player.PickUpItem",
    ---玩家播放动作<br>
    ---\------<br>
    ---参数未知<br>
    PlayerPlayAction = "Player.PlayAction",
    ---玩家复活<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    PlayerRevive = "Player.Revive",
    ---玩家选中快捷栏<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    PlayerSelectShortcut = "Player.SelectShortcut",
    ---当玩家的快捷栏放入道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerShortcutAddItem = "Player.ShortcutAddItem",
    ---当玩家的快捷栏发生改变<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerShortcutChange = "Player.ShortcutChange",
    ---当玩家的快捷栏取出道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerShortcutRemItem = "Player.ShortcutRemItem",
    ---玩家使用礼包<br>
    ---\------<br>
    ---参数未知<br>
    PlayerUseGiftPack = "Player.UseGiftPack",
    ---当玩家开始使用道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemnum``` — 事件中的道具数量<br>
    PlayerUseItem = "Player.UseItem",

    --#endregion
    --#region 方块

    ---方块被创建<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    BlockAdd = "Block.Add",
    ---当方块颜色发生改变<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    BlockChangeColor = "Block.ChangeColor",
    ---当方块方向发生改变<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    BlockChangeDir = "Block.BlockChangeDir",
    ---区块额外建造<br>
    ---\------<br>
    ---参数未知<br>
    BlockChunkExtraBuild = "Block.Chunk.ExtraBuild",
    ---当储存容器内发生改变<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```itemid``` — 事件中的道具类型<br>
    BlockContainerChange = "Backpack.ItemChange",
    ---当储存容器内放入道具<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```itemid``` — 事件中的道具类型<br>
    BlockContainerPutIn = "Backpack.ItemPutIn",
    ---当储存容器内取出道具<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```itemid``` — 事件中的道具类型<br>
    BlockContainerTakeOut = "Backpack.ItemTakeOut",
    ---方块被破坏<br>
    ---\------<br>
    ---参数未知<br>
    BlockDestroyBy = "Block.DestroyBy",
    ---当方块被挖掘<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    BlockDigBegin = "Block.Dig.Begin",
    ---当方块被挖掘中断<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    BlockDigCancel = "Block.Dig.Cancel",
    ---当方块被挖掘完毕<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    BlockDigEnd = "Block.Dig.End",
    ---方块掉落模组奖励<br>
    ---\------<br>
    ---参数未知<br>
    BlockDropModReward = "Block.DropModReward",
    ---方块被放置<br>
    ---\------<br>
    ---参数未知<br>
    BlockPlaceBy = "Block.PlaceBy",
    ---当方块被破坏<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    BlockRemove = "Block.Remove",
    ---当方块开关状态发生改变<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    BlockTrigger = "Block.Trigger",

    --#endregion
    --#region 界面

    ---当前界面的元件被点击<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```uielement``` — 事件中的元件<br>
    ---```x,y,z``` — 事件中的位置<br>
    UIBtnClick = "UI.Button.Click",
    ---当前界面的元件被点击<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```uielement``` — 事件中的元件<br>
    ---```x,y,z``` — 事件中的位置<br>
    UIButtonClick = "UI.Button.NewClick",
    ---当前界面的元件被长按<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```uielement``` — 事件中的元件<br>
    ---```x,y,z``` — 事件中的位置<br>
    UIButtonLongPress = "UI.Button.LongPress",
    ---当前界面的元件被按下<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```uielement``` — 事件中的元件<br>
    ---```x,y,z``` — 事件中的位置<br>
    UIButtonTouchBegin = "UI.Button.TouchBegin",
    ---当前界面的元件被抬起<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```uielement``` — 事件中的元件<br>
    ---```x,y,z``` — 事件中的位置<br>
    UIButtonTouchEnd = "UI.Button.TouchEnd",
    ---UI容器活动<br>
    ---\------<br>
    ---参数未知<br>
    UIContainerActivity = "UI.Container.Activity",
    ---UI容器按下<br>
    ---\------<br>
    ---参数未知<br>
    UIContainerPress = "UI.Container.Press",
    ---UI容器释放<br>
    ---\------<br>
    ---参数未知<br>
    UIContainerRelease = "UI.Container.Release",
    ---当前界面的元件被长按<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```uielement``` — 事件中的元件<br>
    ---```x,y,z``` — 事件中的位置<br>
    UIGLoader3DLongPress = "UI.GLoader3D.LongPress",
    ---当前界面的元件被按下<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```uielement``` — 事件中的元件<br>
    ---```x,y,z``` — 事件中的位置<br>
    UIGLoader3DTouchBegin = "UI.GLoader3D.TouchBegin",
    ---当前界面的元件被点击<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```uielement``` — 事件中的元件<br>
    ---```x,y,z``` — 事件中的位置<br>
    UIGLoader3DTouchClick = "UI.GLoader3D.NewClick",
    ---当前界面的元件被抬起<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```uielement``` — 事件中的元件<br>
    ---```x,y,z``` — 事件中的位置<br>
    UIGLoader3DTouchEnd = "UI.GLoader3D.TouchEnd",
    ---UI网格点击<br>
    ---\------<br>
    ---参数未知<br>
    UIGridClick = "UI.Grid.Click",
    ---当前界面被关闭<br>
    ---\------<br>
    ---```CustomUI``` — 事件中的界面<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    UIHide = "UI.Hide",
    ---玩家在界面输入字符串<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```content``` — 事件中的字符串<br>
    ---```uielement``` — 事件中的元件<br>
    UILostFocus = "UI.LostFocus",
    ---当前界面被打开<br>
    ---\------<br>
    ---```CustomUI``` — 事件中的界面<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    UIShow = "UI.Show",
    ---当前界面的元件动画装载器播放完毕<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```uielement``` — 事件中的元件<br>
    ---```x,y,z``` — 事件中的位置<br>
    UISpineComplete = "UI.SpineComplete",

    --#endregion
    --#region 特效

    ---当特效创建在任意实体<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```effectid``` — 事件中的特效类型<br>
    ParticleEntityOnCreate = "Particle.Entity.OnCreate",
    ---当特效创建在任意掉落物<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```effectid``` — 事件中的特效类型<br>
    ParticleItemOnCreate = "Particle.Item.OnCreate",
    ---当特效创建在任意生物<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```effectid``` — 事件中的特效类型<br>
    ParticleMobOnCreate = "Particle.Mob.OnCreate",
    ---当特效创建在任意对象<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```effectid``` — 事件中的特效类型<br>
    ParticleObjectOnCreate = "Particle.Object.OnCreate",
    ---当特效创建在任意玩家<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```effectid``` — 事件中的特效类型<br>
    ParticlePlayerOnCreate = "Particle.Player.OnCreate",
    ---当特效创建在任意位置<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```effectid``` — 事件中的特效类型<br>
    ParticlePosOnCreate = "Particle.Pos.OnCreate",
    ---当特效创建在任意投掷物<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```effectid``` — 事件中的特效类型<br>
    ParticleProjectileOnCreate = "Particle.Projectile.OnCreate",

    --#endregion
    --#region 开发者

    ---任意玩家购买或提取开发者商店道具<br>
    ---\------<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    DeveloperBuyItem = "Developer.BuyItem",

    --#endregion
    --#region 对象

    ---当任意玩家和任意玩家碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    PlayerCollide = "Player.Collide.Begin",
    ---当任意玩家和任意区域碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    PlayerCollideToAreaObj = "Player.CollideAreaObj",
    ---当任意玩家和任意掉落物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    PlayerCollideToDropItem = "Player.CollideDropItem",
    ---当任意玩家和任意实体碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    PlayerCollideToEntity = "Player.CollideEntity",
    ---当任意玩家和任意投掷物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    PlayerCollideToMissile = "Player.CollideMissile",
    ---当任意玩家和任意生物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    PlayerCollideToMob = "Player.CollideMob",
    ---当任意玩家和任意玩家碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    PlayerCollideToPlayer = "Player.CollidePlayer",
    ---当任意生物和任意生物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    MobCollide = "Actor.Collide.Begin",
    ---当任意生物和任意区域碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    MobCollideToAreaObj = "Mob.CollideAreaObj",
    ---当任意生物和任意掉落物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    MobCollideToDropItem = "Mob.CollideDropItem",
    ---当任意生物和任意实体碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    MobCollideToEntity = "Mob.CollideEntity",
    ---当任意生物和任意投掷物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    MobCollideToMissile = "Mob.CollideMissile",
    ---当任意生物和任意生物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    MobCollideToMob = "Mob.CollideMob",
    ---当任意生物和任意玩家碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    MobCollideToPlayer = "Mob.CollidePlayer",
    ---当任意投掷物和任意区域碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    MissileCollideToAreaObj = "Missile.CollideAreaObj",
    ---当任意投掷物和任意掉落物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    MissileCollideToDropItem = "Missile.CollideDropItem",
    ---当任意投掷物和任意实体碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    MissileCollideToEntity = "Missile.CollideEntity",
    ---当任意投掷物和任意投掷物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    MissileCollideToMissile = "Missile.CollideMissile",
    ---当任意投掷物和任意生物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    MissileCollideToMob = "Missile.CollideMob",
    ---当任意投掷物和任意玩家碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    MissileCollideToPlayer = "Missile.CollidePlayer",
    ---当任意掉落物和任意区域碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    DropItemCollideToAreaObj = "DropItem.CollideAreaObj",
    ---当任意掉落物和任意掉落物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    DropItemCollideToDropItem = "DropItem.CollideDropItem",
    ---当任意掉落物和任意实体碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    DropItemCollideToEntity = "DropItem.CollideEntity",
    ---当任意掉落物和任意投掷物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    DropItemCollideToMissile = "DropItem.CollideMissile",
    ---当任意掉落物和任意生物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    DropItemCollideToMob = "DropItem.CollideMob",
    ---当任意掉落物和任意玩家碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    DropItemCollideToPlayer = "DropItem.CollidePlayer",
    ---当任意实体和任意区域碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    EntityCollideToAreaObj = "Entity.CollideAreaObj",
    ---当任意实体和任意掉落物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    EntityCollideToDropItem = "Entity.CollideDropItem",
    ---当任意实体和任意实体碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    EntityCollideToEntity = "Entity.CollideEntity",
    ---当任意实体和任意投掷物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    EntityCollideToMissile = "Entity.CollideMissile",
    ---当任意实体和任意生物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    EntityCollideToMob = "Entity.CollideMob",
    ---当任意实体和任意玩家碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    EntityCollideToPlayer = "Entity.CollidePlayer",
    ---当任意区域和任意区域碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    AreaObjCollideToAreaObj = "AreaObj.CollideAreaObj",
    ---当任意区域和任意掉落物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    AreaObjCollideToDropItem = "AreaObj.CollideDropItem",
    ---当任意区域和任意实体碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    AreaObjCollideToEntity = "AreaObj.CollideEntity",
    ---当任意区域和任意投掷物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    AreaObjCollideToMissile = "AreaObj.CollideMissile",
    ---当任意区域和任意生物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    AreaObjCollideToMob = "AreaObj.CollideMob",
    ---当任意区域和任意玩家碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    AreaObjCollideToPlayer = "AreaObj.CollidePlayer",
    ---当任意玩家进入区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    PlayerAreaIn = "Player.AreaIn",
    ---当任意玩家离开区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    PlayerAreaOut = "Player.AreaOut",
    ---当任意生物进入区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    MobAreaIn = "Actor.AreaIn",
    ---当任意生物离开区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    MobAreaOut = "Actor.AreaOut",
    ---当任意投掷物进入区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    MissileAreaIn = "Missile.AreaIn",
    ---当任意投掷物离开区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    MissileAreaOut = "Missile.AreaOut",
    ---当任意掉落物进入区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    DropItemAreaIn = "DropItem.AreaIn",
    ---当任意掉落物离开区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    DropItemAreaOut = "DropItem.AreaOut",
    ---当任意实体进入区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    EntityAreaIn = "Entity.AreaIn",
    ---当任意实体离开区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    EntityAreaOut = "Entity.AreaOut",
    ---当任意区域进入区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    AreaObjAreaIn = "AreaObj.AreaIn",
    ---当任意区域离开区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    AreaObjAreaOut = "AreaObj.AreaOut",
    ---当任意生物被创建<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的投掷物类型<br>
    ---```areaid``` — 事件中的区域<br>
    MobCreate = "Actor.Create",
    ---当任意实体被创建<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的投掷物类型<br>
    ---```areaid``` — 事件中的区域<br>
    EntityCreate = "Entity.Create",
    ---当任意区域被创建<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的投掷物类型<br>
    ---```areaid``` — 事件中的区域<br>
    AreaObjCreate = "AreaObj.Create",

    --#endregion
    --#region 角色

    ---当任意玩家受到伤害<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    PlayerBeHurt = "Player.BeHurt",
    ---当任意玩家被击败<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    PlayerDie = "Player.Die",
    ---当任意生物受到伤害<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    MobBeHurt = "Actor.BeHurt",
    ---当任意生物被击败<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    MobDie = "Actor.Die",
    ---当任意玩家开始攻击<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    PlayerAttack = "Player.Attack",
    ---当任意玩家攻击命中<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    PlayerAttackHit = "Player.AttackHit",
    ---当任意玩家造成伤害<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    PlayerDamageActor = "Player.DamageActor",
    ---当任意玩家击败目标<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    PlayerDefeatActor = "Player.DefeatActor",
    ---当任意生物开始攻击<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    MobAttack = "Actor.Attack",
    ---当任意生物攻击命中<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    MobAttackHit = "Actor.AttackHit",
    ---当任意生物击败目标<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    MobBeat = "Actor.Beat",
    ---当任意生物造成伤害<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    MobDamage = "Actor.Damage",
    ---当任意玩家获得状态<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```buffid``` — 事件中的状态<br>
    ---```eventobjid``` — 触发事件的对象<br>
    PlayerAddBuff = "Player.AddBuff",
    ---当任意玩家失去状态<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```buffid``` — 事件中的状态<br>
    ---```eventobjid``` — 触发事件的对象<br>
    PlayerRemoveBuff = "Player.RemoveBuff",
    ---当任意生物获得状态<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```buffid``` — 事件中的状态<br>
    ---```eventobjid``` — 触发事件的对象<br>
    MobAddBuff = "Actor.AddBuff",
    ---当任意生物失去状态<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```buffid``` — 事件中的状态<br>
    ---```eventobjid``` — 触发事件的对象<br>
    MobRemoveBuff = "Actor.RemoveBuff",
    ---当任意玩家的属性改变<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    PlayerChangeAttr = "Player.ChangeAttr",
    ---当任意生物的属性改变<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    MobChangeAttr = "Actor.ChangeAttr",
    ---当角色举起角色<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ActorPickupActor = "Actor.PickupActor",
    ---当任意玩家权限发生改变<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    PlayerAttrStateChange = "Player.AttrStateChange",
    ---当任意生物权限发生改变<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    MobAttrStateChange = "Mob.AttrStateChange",
    ---当任意玩家骑乘坐骑/载具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    PlayerMountActor = "Player.MountActor",
    ---当任意生物骑乘坐骑/载具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    MobMountActor = "Actor.MountActor",
    ---当任意玩家取消骑乘<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    PlayerDismountActor = "Player.DismountActor",
    ---当任意生物取消骑乘<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    MobDismountActor = "Actor.DismountActor",

    --#endregion
    --#region 投掷物

    ---投掷物创建<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    MissileCreate = "Missile.Create",
    ---当投掷物击中任意区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ProjectileHitAreaObj = "Projectile.Hit.AreaObj",
    ---当投掷物击中任意方块<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ProjectileHitBlock = "Projectile.Hit.Block",
    ---当投掷物击中任意实体<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ProjectileHitEntity = "Projectile.Hit.Entity",
    ---当投掷物击中任意掉落物<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ProjectileHitItem = "Projectile.Hit.Item",
    ---当投掷物击中任意生物<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ProjectileHitMob = "Projectile.Hit.Mob",
    ---当投掷物击中任意玩家<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ProjectileHitPlayer = "Projectile.Hit.Player",
    ---当投掷物击中任意投掷物<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ProjectileHitProj = "Projectile.Hit.Proj",

    --#endregion
    --#region 掉落物

    ---当掉落物创建<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ItemCreate = "Item.Create",
    ---当掉落物被拾取<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    DropItemPickup = "DropItem.Pickup",
    ---当掉落物消失<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ItemDisappear = "Item.Disappear",
    ---物品增加持续时间<br>
    ---\------<br>
    ---参数未知<br>
    ItemAddDuration = "Item.AddDuration",
    ---物品损坏<br>
    ---\------<br>
    ---参数未知<br>
    ItemDamage = "Item.Damage",
    ---物品销毁<br>
    ---\------<br>
    ---参数未知<br>
    ItemDestroy = "Item.Destroy",
    ---物品丢弃<br>
    ---\------<br>
    ---参数未知<br>
    ItemDiscardItem = "Item.DiscardItem",
    ---物品消耗<br>
    ---\------<br>
    ---参数未知<br>
    ItemExpend = "Item.expend",
    ---物品拾取<br>
    ---\------<br>
    ---参数未知<br>
    ItemPickup = "Item.Pickup",

    --#endregion
    --#region 其他

    ---当任意生物获得状态<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```buffid``` — 事件中的状态<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ActorAddBuff = "Actor.AddBuff",
    ---当任意生物进入区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ActorAreaIn = "Actor.AreaIn",
    ---当任意生物离开区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ActorAreaOut = "Actor.AreaOut",
    ---当任意对象开始攻击<br>
    ---\------<br>
    ---参数未知<br>
    ActorAttack = "Object.Attack",
    ---当任意生物攻击命中<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    ActorAttackHit = "Actor.AttackHit",
    ---当任意生物受到伤害<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ActorBeHurt = "Actor.BeHurt",
    ---当任意生物击败目标<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    ActorBeat = "Actor.Beat",
    ---当任意生物的属性改变<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ActorChangeAttr = "Actor.ChangeAttr",
    ---当任意生物动作改变<br>
    ---\------<br>
    ---参数未知<br>
    ActorChangeMotion = "Actor.ChangeMotion",
    ---当任意生物点击生物<br>
    ---\------<br>
    ---参数未知<br>
    ActorClickActor = "Actor.ClickActor",
    ---当任意生物和任意生物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ActorCollide = "Actor.Collide.Begin",
    ---当任意生物被创建<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的投掷物类型<br>
    ---```areaid``` — 事件中的区域<br>
    ActorCreate = "Actor.Create",
    ---当任意生物造成伤害<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    ActorDamage = "Actor.Damage",
    ---当任意生物被击败<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ActorDie = "Actor.Die",
    ---当任意生物被投掷物击中<br>
    ---\------<br>
    ---参数未知<br>
    ActorProjectileHit = "Actor.Projectile.Hit",
    ---当任意生物失去状态<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```buffid``` — 事件中的状态<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ActorRemoveBuff = "Actor.RemoveBuff",
    ---当任意生物播放动画<br>
    ---\------<br>
    ---参数未知<br>
    AtorPlayAnim = "Ator.PlayAnim",
    ---背包物品改变<br>
    ---\------<br>
    ---参数未知<br>
    BackpackItemChange = "Backpack.ItemChange",
    ---背包物品放入<br>
    ---\------<br>
    ---参数未知<br>
    BackpackItemPutIn = "Backpack.ItemPutIn",
    ---背包物品取出<br>
    ---\------<br>
    ---参数未知<br>
    BackpackItemTakeOut = "Backpack.ItemTakeOut",
    ---生物群落生物生成<br>
    ---\------<br>
    ---参数未知<br>
    BiomeActorSpawn = "Biome.ActorSpawn",
    ---蓝图建造开始<br>
    ---\------<br>
    ---参数未知<br>
    BluePrintBuildBegin = "BluePrint.BuildBegin",
    ---建造生物生成<br>
    ---\------<br>
    ---参数未知<br>
    BuildActorSpawn = "Build.ActorSpawn",
    ---建造基础生物生成<br>
    ---\------<br>
    ---参数未知<br>
    BuildBaseActorSpawn = "Build.BaseActorSpawn",
    ---建造基础僵尸生成<br>
    ---\------<br>
    ---参数未知<br>
    BuildBaseZombieSpawn = "Build.BaseZombieSpawn",
    ---建造放置<br>
    ---\------<br>
    ---参数未知<br>
    BuildPlace = "Build.Place",
    ---建造报告<br>
    ---\------<br>
    ---参数未知<br>
    BuildReport = "Build.Report",
    ---建造僵尸生成<br>
    ---\------<br>
    ---参数未知<br>
    BuildZombieSpawn = "Build.ZombieSpawn",
    ---检查召唤者<br>
    ---\------<br>
    ---参数未知<br>
    CheckSummoner = "Summoner.CheckSummoner",
    ---城市报告<br>
    ---\------<br>
    ---参数未知<br>
    CityReport = "City.Report",
    ---计算机发送订单事件<br>
    ---\------<br>
    ---参数未知<br>
    ComputerSendOrderEvent = "Computer.SendOrderEvent",
    ---物品提示打开<br>
    ---\------<br>
    ---参数未知<br>
    ItemTipsOpen = "ItemTips.Open",
    ---主任务检查<br>
    ---\------<br>
    ---参数未知<br>
    MainTaskCheck = "MainTask.Check",
    ---主任务获得<br>
    ---\------<br>
    ---参数未知<br>
    MainTaskGain = "MainTask.Gain",
    ---当任意生物被玩家点击<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    MobBeClick = "Actor.ClickActor",
    ---当任意生物动作改变<br>
    ---\------<br>
    ---参数未知<br>
    MobChangeMotion = "Actor.ChangeMotion",
    ---当任意生物运动状态发生改变<br>
    ---\------<br>
    ---参数未知<br>
    MobMotionStateChange = "Mob.MotionStateChange",
    ---当任意生物被投掷物击中<br>
    ---\------<br>
    ---参数未知<br>
    MobProjectileHit = "Actor.Projectile.Hit",
    ---剧情开始<br>
    ---\------<br>
    ---参数未知<br>
    PlotBegin = "Plot.begin",
    ---剧情结束<br>
    ---\------<br>
    ---参数未知<br>
    PlotEnd = "Plot.end",
    ---QQ音乐播放开始<br>
    ---\------<br>
    ---参数未知<br>
    QQMusicPlayBegin = "QQMusic.PlayBegin",
    ---时间线事件生物生成<br>
    ---\------<br>
    ---参数未知<br>
    TLEventActorSpawn = "TLFrameEvent.ActorSpawn",
    ---任务更新<br>
    ---\------<br>
    ---参数未知<br>
    TaskUpdate = "Task.Update",
    ---传送匹配响应<br>
    ---\------<br>
    ---参数未知<br>
    TeleportMatchRsp = "CloudTeleport.MacthRsp",
    ---天气改变<br>
    ---\------<br>
    ---参数未知<br>
    WeatherChanged = "Weather.Changed"

    --#endregion
}

---@enum ObjectEvent
---组件事件管理<br>
---[查看文档](https://dev-wiki.mini1.cn/ugc-wiki/apis/componentevent.html)
ObjectEvent = {
    --#region 玩家

    ---当此玩家获得状态<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```buffid``` — 事件中的状态<br>
    ---```eventobjid``` — 触发事件的对象<br>
    PlayerAddBuff = "Player.AddBuff",
    ---当此玩家获得道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemnum``` — 事件中的道具数量<br>
    PlayerAddItem = "Player.AddItem",
    ---当此玩家进入区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    PlayerAreaIn = "Player.AreaIn",
    ---当此玩家离开区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    PlayerAreaOut = "Player.AreaOut",
    ---玩家手臂进入消息<br>
    ---\------<br>
    ---参数未知<br>
    PlayerArmEntryMsg = "Player.ArmEntryMsg",
    ---当此玩家开始攻击<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    PlayerAttack = "Player.Attack",
    ---当此玩家攻击命中<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    PlayerAttackHit = "Player.AttackHit",
    ---当此玩家权限发生改变<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    PlayerAttrStateChange = "Player.AttrStateChange",
    ---当此玩家背包栏放入道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中玩家选中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerBackPackAddItem = "Player.BackPackAddItem",
    ---当此玩家背包栏发生改变<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中玩家选中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerBackPackChange = "Player.BackPackChange",
    ---当此玩家背包栏取出道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中玩家选中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerBackPackRemItem = "Player.BackPackRemItem",
    ---当此玩家受到伤害<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    PlayerBeHurt = "Player.BeHurt",
    ---当此玩家属性改变<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    PlayerChangeAttr = "Player.ChangeAttr",
    ---当此玩家金币变化<br>
    ---\------<br>
    ---参数未知<br>
    PlayerChangeCoin = "Player.ChangeCoin",
    ---当此玩家开始蓄力道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemnum``` — 事件中的道具数量<br>
    PlayerChargeItemBegin = "Player.ChargeItem.Begin",
    ---当此玩家结束蓄力道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemnum``` — 事件中的道具数量<br>
    PlayerChargeItemEnd = "Player.ChargeItem.End",
    ---当此玩家点击任意生物<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```blockid``` — 事件中的方块类型<br>
    PlayerClickActor = "Player.ClickActor",
    ---当此玩家点击任意方块<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```blockid``` — 事件中的方块类型<br>
    PlayerClickBlock = "Player.ClickBlock",
    ---当此玩家点击任意掉落物<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```blockid``` — 事件中的方块类型<br>
    PlayerClickDropItem = "Player.ClickDropItem",
    ---当此玩家点击任意实体<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```blockid``` — 事件中的方块类型<br>
    PlayerClickEntity = "Player.ClickEntity",
    ---当此玩家点击任意生物<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```blockid``` — 事件中的方块类型<br>
    PlayerClickMob = "Player.ClickMob",
    ---当此玩家点击任意玩家<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```blockid``` — 事件中的方块类型<br>
    PlayerClickPlayer = "Player.ClickPlayer",
    ---当此玩家点击任意投掷物<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```blockid``` — 事件中的方块类型<br>
    PlayerClickProjectile = "Player.ClickProjectile",
    ---当此玩家和任意玩家碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    PlayerCollide = "Player.Collide.Begin",
    ---当此玩家消耗道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemnum``` — 事件中的道具数量<br>
    PlayerConsumeItem = "Player.ConsumeItem",
    ---当此玩家造成伤害<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    PlayerDamageActor = "Player.DamageActor",
    ---当此玩家游戏失败<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    PlayerDefeat = "Game.AnyPlayer.Defeat",
    ---当此玩家击败目标<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    PlayerDefeatActor = "Player.DefeatActor",
    ---玩家破坏方块<br>
    ---\------<br>
    ---参数未知<br>
    PlayerDestroyBlock = "Player.PlayerDestroyBlock",
    ---当此玩家被击败<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    PlayerDie = "Player.Die",
    ---当此玩家丢弃道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemnum``` — 事件中的道具数量<br>
    PlayerDiscardItem = "Player.DiscardItem",
    ---此角色取消骑乘<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    PlayerDismountActor = "Player.DismountActor",
    ---玩家闪避<br>
    ---\------<br>
    ---参数未知<br>
    PlayerDodge = 15,
    ---当此玩家进入游戏<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    PlayerEnterGame = "Game.AnyPlayer.EnterGame",
    ---当此玩家装备栏放入道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中玩家选中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerEquipAddItem = "Player.EquipAddItem",
    ---当此玩家装备栏发生改变<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中玩家选中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerEquipChange = "Player.EquipChange",
    ---当此玩家脱下装备<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerEquipOff = "Player.EquipOff",
    ---当此玩家穿上装备<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerEquipOn = "Player.EquipOn",
    ---当此玩家装备栏取出道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中玩家选中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerEquipRemItem = "Player.EquipRemItem",
    ---玩家开火<br>
    ---\------<br>
    ---参数未知<br>
    PlayerFire = 11,
    ---玩家开火前<br>
    ---\------<br>
    ---参数未知<br>
    PlayerFireBefore = 16,
    ---玩家枪械恢复中<br>
    ---\------<br>
    ---参数未知<br>
    PlayerGunRecovering = 18,
    ---玩家枪械冷却<br>
    ---\------<br>
    ---参数未知<br>
    PlayerGunRecoveryCD = 17,
    ---玩家爆头<br>
    ---\------<br>
    ---参数未知<br>
    PlayerHeadShot = 13,
    ---玩家发送聊天信息<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```content``` — 事件中的字符串<br>
    PlayerInputContent = "Player.InputContent",
    ---当此玩家点击按键<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```vkey``` — 按键<br>
    PlayerInputKeyClick = "Player.InputKeyClick",
    ---当此玩家按下按键<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```vkey``` — 按键<br>
    PlayerInputKeyDown = "Player.InputKeyDown",
    ---当此玩家长按按键<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```vkey``` — 按键<br>
    PlayerInputKeyOnPress = "Player.InputKeyOnPress",
    ---当此玩家抬起按键<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```vkey``` — 按键<br>
    PlayerInputKeyUp = "Player.InputKeyUp",
    ---此玩家邀请好友<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    PlayerInvateFriend = "Player.InvateFriend",
    ---当此玩家离开游戏<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    PlayerLeaveGame = "Game.AnyPlayer.LeaveGame",
    ---玩家等级模型升级<br>
    ---\------<br>
    ---参数未知<br>
    PlayerLevelModelUpgrade = "Player.LevelModelUpgrade",
    ---当玩家运动状态发生改变<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    PlayerMotionStateChange = "Player.MotionStateChange",
    ---当玩家运动状态改变结束<br>
    ---\------<br>
    ---参数未知<br>
    PlayerMotionStateChangeEnd = "Player.MotionStateChangeEnd",
    ---当任意玩家骑乘坐骑/载具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    PlayerMountActor = "Player.MountActor",
    ---此玩家移动<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    PlayerMoveOneBlockSize = "Player.MoveOneBlockSize",
    ---玩家发送聊天信息<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```content``` — 事件中的字符串<br>
    PlayerNewInputContent = "Player.NewInputContent",
    ---当此玩家拾取道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemnum``` — 事件中的道具数量<br>
    PlayerPickUpItem = "Player.PickUpItem",
    ---玩家播放动作<br>
    ---\------<br>
    ---参数未知<br>
    PlayerPlayAction = "Player.PlayAction",
    ---玩家装填弹药<br>
    ---\------<br>
    ---参数未知<br>
    PlayerReload = 12,
    ---当此玩家失去状态<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```buffid``` — 事件中的状态<br>
    ---```eventobjid``` — 触发事件的对象<br>
    PlayerRemoveBuff = "Player.RemoveBuff",
    ---此玩家复活<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    PlayerRevive = "Player.Revive",
    ---此玩家选中快捷栏<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中玩家选中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    PlayerSelectShortcut = "Player.SelectShortcut",
    ---当此玩家快捷栏放入道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中玩家选中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerShortcutAddItem = "Player.ShortcutAddItem",
    ---当此玩家快捷栏发生改变<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中玩家选中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerShortcutChange = "Player.ShortcutChange",
    ---当此玩家快捷栏取出道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```shortix``` — 事件中玩家选中的快捷栏<br>
    ---```itemnum``` — 事件中的道具数量<br>
    ---```itemix``` — 事件中的装备栏<br>
    PlayerShortcutRemItem = "Player.ShortcutRemItem",
    ---玩家使用礼包<br>
    ---\------<br>
    ---参数未知<br>
    PlayerUseGiftPack = "Player.UseGiftPack",
    ---当此玩家开始使用道具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```itemnum``` — 事件中的道具数量<br>
    PlayerUseItem = "Player.UseItem",
    ---当此玩家游戏胜利<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    PlayerVictory = "Game.AnyPlayer.Victory",

    --#endregion
    --#region 方块

    ---此类方块被创建<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```eventobjid``` — 触发事件的对象<br>
    BlockAdd = 21,
    ---当此类方块颜色发生改变<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    BlockChangeColor = 30,
    ---当此类方块方向发生改变<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    BlockChangeDir = "Block.BlockChangeDir",
    ---当此类方块被被点击<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    BlockClicked = 33,
    ---当储存容器内发生改变<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```itemid``` — 事件中的道具类型<br>
    BlockContainerChange = 27,
    ---当储存容器内放入道具<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```itemid``` — 事件中的道具类型<br>
    BlockContainerPutIn = 28,
    ---当储存容器内取出道具<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```itemid``` — 事件中的道具类型<br>
    BlockContainerTakeOut = 29,
    ---当此类方块被被破坏<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    BlockDestroy = 23,
    ---当此类方块被被挖掘<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    BlockDigBegin = 24,
    ---当此类方块被被挖掘中断<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    BlockDigCancel = 25,
    ---当此类方块被被挖掘完毕<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    BlockDigEnd = 26,
    ---方块被放置<br>
    ---\------<br>
    ---参数未知<br>
    BlockPlaceBy = 20,
    ---当此类方块被被破坏<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    BlockRemove = "Block.Remove",
    ---当此类方块开关状态发生改变<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    OnInteract = 6,

    --#endregion
    --#region 对象

    ---当对象的当前组件属性发生改变<br>
    ---\------<br>
    ---无参数<br>
    OnPropertyChange = "OnPropertyChange",
    ---当此对象播放动画时<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ObjectPlayAnim = "Actor.PlayAnim",

    --#endregion
    --#region 角色

    ---当此角色获得状态<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```buffid``` — 事件中的状态<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ObjectAddBuff = "ObjectAddBuff",
    ---当此角色开始攻击<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    ObjectAttack = "ObjectAttack",
    ---当此角色攻击命中<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    ObjectAttackHit = "ObjectAttackHit",
    ---当此角色权限改变<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ObjectAttrStateChange = "ObjectAttrStateChange",
    ---此角色被玩家点击<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ObjectBeClick = "Actor.ClickActor",
    ---当此角色受到伤害<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ObjectBeHurt = "ObjectBeHurt",
    ---当此角色属性改变<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ObjectChangeAttr = "ObjectChangeAttr",
    ---当此角色和任意玩家碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ObjectCollide = "ObjectCollide",
    ---当此角色和任意区域碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ObjectCollideByAreaObj = "Object.CollideAreaObj",
    ---当此角色和任意掉落物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ObjectCollideByDropItem = "Object.CollideDropItem",
    ---当此角色和任意实体碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ObjectCollideByEntity = "Object.CollideEntity",
    ---当此角色和任意投掷物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ObjectCollideByMissile = "Object.CollideMissile",
    ---当此角色和任意生物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ObjectCollideByMob = "Object.CollideMob",
    ---当此角色和任意玩家碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ObjectCollideByPlayer = "Object.CollidePlayer",
    ---当此角色造成伤害<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    ObjectDamage = "ObjectDamage",
    ---当此角色击败目标<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    ObjectDefeat = "ObjectDefeat",
    ---当此角色被击败<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ObjectDie = "ObjectDie",
    ---此角色取消骑乘<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ObjectDismountActor = "ObjectDismountActor",
    ---当此角色运动状态发生改变<br>
    ---\------<br>
    ---参数未知<br>
    ObjectMotionStateChange = "ObjectMotionStateChange",
    ---当此角色运动状态改变结束<br>
    ---\------<br>
    ---参数未知<br>
    ObjectMotionStateChangeEnd = "ObjectMotionStateChangeEnd",
    ---此角色骑乘<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ObjectMountActor = "ObjectMountActor",
    ---当此角色失去状态<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```buffid``` — 事件中的状态<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ObjectRemoveBuff = "ObjectRemoveBuff",

    --#endregion
    --#region 其他

    ---当任意生物获得状态<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```buffid``` — 事件中的状态<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ActorAddBuff = "Actor.AddBuff",
    ---当任意生物进入区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ActorAreaIn = "Actor.AreaIn",
    ---当任意生物离开区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ActorAreaOut = "Actor.AreaOut",
    ---当任意对象开始攻击<br>
    ---\------<br>
    ---参数未知<br>
    ActorAttack = "Object.Attack",
    ---当任意生物攻击命中<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    ActorAttackHit = "Actor.AttackHit",
    ---当任意生物受到伤害<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ActorBeHurt = "Actor.BeHurt",
    ---当任意生物击败目标<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    ActorBeat = "Actor.Beat",
    ---当任意生物的属性改变<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ActorChangeAttr = "Actor.ChangeAttr",
    ---当任意生物动作改变<br>
    ---\------<br>
    ---参数未知<br>
    ActorChangeMotion = "Actor.ChangeMotion",
    ---当任意生物点击生物<br>
    ---\------<br>
    ---参数未知<br>
    ActorClickActor = "Actor.ClickActor",
    ---当任意生物和任意生物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ActorCollide = "Actor.Collide.Begin",
    ---当任意生物被创建<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的投掷物类型<br>
    ---```areaid``` — 事件中的区域<br>
    ActorCreate = "Actor.Create",
    ---当任意生物造成伤害<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    ActorDamage = "Actor.Damage",
    ---当任意生物被击败<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ActorDie = "Actor.Die",
    ---演员进入视野<br>
    ---\------<br>
    ---参数未知<br>
    ActorEnterAOI = 14,
    ---当角色举起角色<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ActorPickupActor = "Actor.PickupActor",
    ---当任意生物被投掷物击中<br>
    ---\------<br>
    ---参数未知<br>
    ActorProjectileHit = "Actor.Projectile.Hit",
    ---演员右键抬起<br>
    ---\------<br>
    ---参数未知<br>
    ActorRClickUp = 7,
    ---当任意生物失去状态<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```buffid``` — 事件中的状态<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ActorRemoveBuff = "Actor.RemoveBuff",
    ---玩家能否拾取物品<br>
    ---\------<br>
    ---参数未知<br>
    CanPlayerPickUpItem = "Player.CanPlayerPickUpItem",
    ---任意玩家购买或提取开发者商店道具<br>
    ---\------<br>
    ---```itemid``` — 事件中的道具类型<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    DeveloperBuyItem = "Developer.BuyItem",
    ---当任意实体被创建<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的投掷物类型<br>
    ---```areaid``` — 事件中的区域<br>
    EntityCreate = "Entity.Create",
    ---装备物品事件<br>
    ---\------<br>
    ---参数未知<br>
    EquipItemEvent = "Player.EquipItemEvent",
    ---交互方块放置<br>
    ---\------<br>
    ---参数未知<br>
    InteractBlock2Place = "Player.InteractBlock2Place",
    ---物品增加持续时间<br>
    ---\------<br>
    ---参数未知<br>
    ItemAddDuration = "Item.AddDuration",
    ---当任意生物获得状态<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```buffid``` — 事件中的状态<br>
    ---```eventobjid``` — 触发事件的对象<br>
    MobAddBuff = "Actor.AddBuff",
    ---当任意生物进入区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    MobAreaIn = "Actor.AreaIn",
    ---当任意生物离开区域<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    MobAreaOut = "Actor.AreaOut",
    ---当任意生物开始攻击<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    MobAttack = "Actor.Attack",
    ---当任意生物攻击命中<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    MobAttackHit = "Actor.AttackHit",
    ---当任意生物权限发生改变<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    MobAttrStateChange = "Mob.AttrStateChange",
    ---当任意生物被玩家点击<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    MobBeClick = "Actor.ClickActor",
    ---当任意生物受到伤害<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    MobBeHurt = "Actor.BeHurt",
    ---当任意生物击败目标<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    MobBeat = "Actor.Beat",
    ---当任意生物的属性改变<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    MobChangeAttr = "Actor.ChangeAttr",
    ---当任意生物动作改变<br>
    ---\------<br>
    ---参数未知<br>
    MobChangeMotion = "Actor.ChangeMotion",
    ---当任意生物和任意生物碰撞开始<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    MobCollide = "Actor.Collide.Begin",
    ---当任意生物被创建<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```itemid``` — 事件中的投掷物类型<br>
    ---```areaid``` — 事件中的区域<br>
    MobCreate = "Actor.Create",
    ---当任意生物造成伤害<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    ---```hurtlv``` — 事件中的伤害值<br>
    MobDamage = "Actor.Damage",
    ---当任意生物被击败<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    MobDie = "Actor.Die",
    ---当任意生物取消骑乘<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    MobDismountActor = "Actor.DismountActor",
    ---当任意生物运动状态发生改变<br>
    ---\------<br>
    ---参数未知<br>
    MobMotionStateChange = "Mob.MotionStateChange",
    ---当任意生物骑乘坐骑/载具<br>
    ---\------<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```toobjid``` — 事件中的目标对象<br>
    ---```targetactorid``` — 事件中的目标生物类型<br>
    MobMountActor = "Actor.MountActor",
    ---当任意生物被投掷物击中<br>
    ---\------<br>
    ---参数未知<br>
    MobProjectileHit = "Actor.Projectile.Hit",
    ---生物右键抬起<br>
    ---\------<br>
    ---参数未知<br>
    MobRClickUp = 7,
    ---当任意生物失去状态<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```buffid``` — 事件中的状态<br>
    ---```eventobjid``` — 触发事件的对象<br>
    MobRemoveBuff = "Actor.RemoveBuff",
    ---鼠标事件<br>
    ---\------<br>
    ---参数未知<br>
    MouseEvent = 8,
    ---当受到致命伤害<br>
    ---\------<br>
    ---参数未知<br>
    OnBeDeadlyHurt = 19,
    ---当离开世界前<br>
    ---\------<br>
    ---参数未知<br>
    OnBeforeLeaveWorld = 34,
    ---当方块被创建<br>
    ---\------<br>
    ---参数未知<br>
    OnBlockAdd = 21,
    ---当方块被破坏<br>
    ---\------<br>
    ---参数未知<br>
    OnBlockDestroy = 23,
    ---当方块被放置<br>
    ---\------<br>
    ---参数未知<br>
    OnBlockPlaceBy = 20,
    ---当此类方块被被破坏<br>
    ---\------<br>
    ---```x,y,z``` — 事件中的位置<br>
    ---```blockid``` — 事件中的方块类型<br>
    ---```eventobjid``` — 触发事件的对象<br>
    ---```actorid``` — 触发事件的生物类型<br>
    OnBlockRemove = "Block.Remove",
    ---当碰撞<br>
    ---\------<br>
    ---参数未知<br>
    OnCollide = 4,
    ---当碰撞开始<br>
    ---\------<br>
    ---参数未知<br>
    OnCollideBegin = 3,
    ---当碰撞结束<br>
    ---\------<br>
    ---参数未知<br>
    OnCollideEnd = 5,
    ---当进入世界<br>
    ---\------<br>
    ---参数未知<br>
    OnEnterWorld = 1,
    ---当离开世界<br>
    ---\------<br>
    ---参数未知<br>
    OnLeaveWorld = 2,
    ---当模型改变<br>
    ---\------<br>
    ---参数未知<br>
    OnModelChange = 10004,
    ---当声音动作<br>
    ---\------<br>
    ---参数未知<br>
    OnSoundAction = 10003,
    ---当投掷角色<br>
    ---\------<br>
    ---参数未知<br>
    OnThrowActor = 35,
    ---UI装备改变<br>
    ---\------<br>
    ---参数未知<br>
    UIEquitChange = 10,
    ---UI网格改变<br>
    ---\------<br>
    ---参数未知<br>
    UIGridChange = 9,
    ---使用物品脚本事件<br>
    ---\------<br>
    ---参数未知<br>
    UseItemScriptEvent = "Player.UseItemScriptEvent"
    --#endregion
}