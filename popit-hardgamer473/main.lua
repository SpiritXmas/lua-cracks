local old; old = hookfunction(game.HttpGet, function(self, url)
    if url == "https://pastebin.com/raw/NsieY5J7" then
        return string.gsub("return {'urclientid'}", "urclientid", game:GetService("RbxAnalyticsService"):GetClientId())
    else
        return old(self, "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/popit-hardgamer473/dependencies/kavoui.lua")
    end
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/popit-hardgamer473/dependencies/loader.lua"))()
