local url_redirects = {
    ["https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/madcity-weiny/dependencies/discordui.lua";
    ["https://raw.githubusercontent.com/weiny-ez/w-main/main/2.lua"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/madcity-weiny/dependencies/script.lua";
    ["https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Kronos"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/madcity-weiny/dependencies/kronosui.lua";
}

local old; old = hookfunction(game.HttpGet, function(self, url)
    if url_redirects[url] then
        return old(self, url_redirects[url])
    end
    rconsolewarn("UNHANDLED URL: "..url)
    return old(self, url)
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/madcity-weiny/dependencies/loader.lua"))()
