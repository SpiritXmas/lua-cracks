local url_redirects = {
    ["https://raw.githubusercontent.com/L1ZOT/Project-PJM/main/Notifycation"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/proj-meow-petsimx/dependencies/notification.lua";
    ["https://raw.githubusercontent.com/L1ZOT/Project-PJM/main/6284583030.Mana"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/proj-meow-petsimx/dependencies/petsimx.lua";
    ["https://gitlab.com/L1ZOT/test-project/-/raw/main/PJM-GUI"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/proj-meow-petsimx/dependencies/mainui.lua";
    ["https://gitlab.com/L1ZOT/test-project/-/raw/main/PJM-Prompt"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/proj-meow-petsimx/dependencies/prompt.lua";
}

local old; old = hookfunction(game.HttpGet, function(self, url)
    if url_redirects[url] then
        return old(self, url_redirects[url])
    end
    
    rconsolewarn("UNHANDLED URL: "..url)
end)

local old; old = hookmetamethod(game, "__index", function(self, index)
    if tostring(self) == "KeyTextBox" and index == "Text" then
        return "Bgt543fdnvuigfjkdfegay"
    end
    
    return old(self, index)
end)

hookfunction(syn.request, function(...) return {} end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/proj-meow-petsimx/dependencies/loader.lua"))()
