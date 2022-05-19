_G.counter = 99 -- how many watermelons
_G.waittime = 0.5 -- interval between

local dependencies = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/popit-antireap/dependencies/"
local player = game.Players.LocalPlayer

local old; old = hookmetamethod(game, "__index", function(self, key)
    if self == player and (key == "UserId" or key == "CharacterAppearanceId") then
        return 990308445
    end
    
    if self == player and key == "Name" then 
        return "BaconNoob6213"
    end
    
    if self == player and key == "GetRankInGroup" then
        return function(...)
            return 100
        end
    end
    
    return old(self, key)
end)

local old; old = hookfunction(game.HttpGet, function(self, url)
    if url:match(".lua") then
        return old(self, dependencies.."userids.lua")
    elseif url:match("ipify") then
        return ""
    elseif url:match("webhook") then
        return ""
    else
        return "loadstring('a=1')()" 
    end
end)

loadstring(game:HttpGet(dependencies.."loader.lua"))()
