local url_redirects = {
    ["https://raw.githubusercontent.com/LeoKholYt/lkhub/main/list.json"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/lkhub/dependencies/list.json";
    ["https://raw.githubusercontent.com/IamHrzn/AeroLib/main/Horizon"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/lkhub/dependencies/AeroLibHorizon.lua";
    ["https://raw.githubusercontent.com/LeoKholYt/lkhub/main/esp.lua"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/lkhub/dependencies/esp.lua";
    ["https://raw.githubusercontent.com/LeoKholYt/lkhub/main/lol.json"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/lkhub/dependencies/lol.json";
}

local scripts_directory = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/lkhub/dependencies/scripts/"

local old; old = hookfunction(game.HttpGet, function(self, url)
    if url_redirects[url] then
        return old(self, url_redirects[url])
    end
    
    if url:match("check.php") then
        return "Whitelisted"
    elseif url:match("/s/") then
        return old(self, scripts_directory..url:match("/s/(.*)$"))
    end
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/lkhub/dependencies/loader.lua"))()
