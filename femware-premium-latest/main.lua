local url_redirects = {
    ["https://raw.githubusercontent.com/JackHiggly/FemWare/main/UI"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/femware-premium-latest/dependencies/ui.lua";
    ["https://raw.githubusercontent.com/JackHiggly/FemWare/main/ESP"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/femware-premium-latest/dependencies/esp.lua";
    ["https://raw.githubusercontent.com/Tobias020108Back/YBA-AUT/main/Criminality-Semi-Godmode.lua"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/femware-premium-latest/dependencies/semi-godmode.lua";
    ["https://raw.githubusercontent.com/JackHiggly/FemWare/main/Con1"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/femware-premium-latest/dependencies/con";
}

local old; old = hookfunc(game.HttpGet, function(self, url)
    if url_redirects[url] then
        return old(self, url_redirects[url])
    end
end)

hookfunction(setclipboard, function(...) end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/femware-premium-latest/dependencies/loader.lua"))()
