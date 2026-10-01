-- ============================================================================
-- Mini World UGC environment export
-- format: mwenviron/1   generator: fixture
-- face: dev
-- game: 9.9.9
-- generated: 2026-01-01 00:00:00
-- stats: tables=10 functions=6 refs=3 userdata=1 truncated=1 maxdepth=4
-- ============================================================================
return {
    ["$meta"] = {
        ["__metatable"] = "read only",
        ["__newindex"] = {
            ["hidden"] = "from gData",
        },
        ["__index"] = {
            ["$meta"] = {
                ["__metatable"] = "read only",
                ["__index"] = {
                    ["hidden"] = "from gData",
                },
            },
            ["Escaped"] = {
                ["$$meta"] = "a real key that looks reserved",
                ["$$ref"] = "a real key that looks reserved",
                ["$$weird$"] = 3,
            },
            ["Mini"] = {
                ["Class"] = function(className, super) end, --[[@F:/Script/luascript/ugc/framework/base/paramstypedef.lua:12]]
            },
            ["Player"] = {
                ["GetHostUin"] = function(self, uin) end, --[[@F:/Script/luascript/ugc/framework/services/player.lua:35; @service Player.GetHostUin; @mtype ClientData; @rtype Uin_TimeLimit=(10,"调用频繁，请稍后尝试！")]]
                ["GetFriendList"] = function(self, uin, page) end, --[[@unresolved Player.GetFriendList]]
                ["Native"] = function() end, --[[@C]]
                ["Builtins"] = function() end, --[[@builtin]]
                ["Limited"] = function(self, a) end, --[[@service Player.Limited; @mtype SyncPack; @rtype CompareParam=(3); @rtype ResetCompareParam=(3,"SetScale")]]
            },
            ["Shared"] = {
                ["name"] = "shared node",
            },
            ["Cyclic"] = {
                ["leaf"] = {
                    ["$meta"] = {
                        ["__index"] = {
                            ["$truncated"] = true,
                        },
                    },
                },
                ["name"] = "cyclic",
                ["parent"] = { ["$ref"] = {"$meta", "__index", "Cyclic"} },
                ["sibling"] = { ["$ref"] = {"$meta", "__index", "Shared"} },
            },
            ["Enums"] = {
                ["A"] = 1,
                ["B"] = 2,
            },
            ["Scalars"] = {
                ["ascii"] = "hello",
                ["ctrl"] = "a\nb\tc",
                ["huge"] = 1/0,
                ["num"] = 42,
                ["quoted"] = "say \"hi\"",
                ["ratio"] = 1.5,
                ["unicode"] = "自定义方块作物",
            },
            ["Totals"] = {
                ["limit"] = { ["name"] = "调用频繁", ["wait"] = 10 },
                ["yes"] = true,
            },
            ["Udata"] = { ["$userdata"] = "file (0x1)" },
        },
    },
}
