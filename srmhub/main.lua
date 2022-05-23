local url_redirects = {
    ["https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/srmhub/dependencies/kavoui.lua";
    ["https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/srmhub/dependencies/uilib.lua";
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
    if tostring(self) == "KeyBox" and index == "Text" then
        return "gaynite"
    end 
    
    return old(self, index)
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/srmhub/dependencies/loader.lua"))()
