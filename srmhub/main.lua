local old; old = hookmetamethod(game, "__index", function(self, index)
    if tostring(self) == "KeyBox" and index == "Text" then
        return "gaynite"
    end 
    
    return old(self, index)
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/srmhub/dependencies/loader.lua"))()
