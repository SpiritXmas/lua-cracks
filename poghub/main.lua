local url_redirects = {
    ["https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/poghub/dependencies/kavoui.lua";
    ["https://raw.githubusercontent.com/03sAlt/discord.gg-x4gGhjVxXz/main/Loader.lua"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/poghub/dependencies/loader.lua";
    ["https://pastebin.com/raw/DnDhCpxd"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/poghub/dependencies/wallyv2";
}

local old; old = hookfunction(game.HttpGet, function(self, url)
    if url_redirects[url] then
        return old(self, url_redirects[url])
    end
    
    if url:match("SpiritXmas") then
        return old(self, url)
    end
end)

local old; old = hookmetamethod(game, "__index", function(self, index)
    if tostring(self) == "Keyinput" and index == "Text" then
        return "Pog"
    end
    
    return old(self, index)
end)

local old; old = hookfunction(game.StarterGui.SetCore, function(...)
    if ({...})[3].Text:match("Credits") then return end

    return old(...)
end)

hookfunction(writefile, function(...) return end)
hookfunction(syn.request, function(...) return {} end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/poghub/dependencies/keyloader.lua"))()
