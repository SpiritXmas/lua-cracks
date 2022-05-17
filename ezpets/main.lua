local url_redirects = {
    ["https://raw.githubusercontent.com/TurfuGoldy/GoldenScripts/main/VenyxUI.lua"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/ezpets/dependencies/venyxui.lua";
    ["https://raw.githubusercontent.com/TurfuGoldy/GoldenScripts/main/versions.txt"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/ezpets/dependencies/versions.txt";
    ["https://raw.githubusercontent.com/TurfuGoldy/GoldenScripts/main/AkaliNotif.lua"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/ezpets/dependencies/akalinotif.lua";
}

hookfunction(os.time, function(...) return 2 end)
hookfunction(os.date, function(...) return "2" end)

local old; old = hookfunction(game.HttpGet, function(self, url)
    if url_redirects[url] then
        return old(self, url_redirects[url])
    end
    rconsolewarn(url)
    return "309569542"
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/ezpets/dependencies/loader.lua"))()
