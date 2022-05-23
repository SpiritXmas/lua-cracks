local old; old = hookmetamethod(game, "__index", function(self, index)
    if tostring(self) == "Keyinput" and index == "Text" then
        return "Pog"
    end
    
    return old(self, index)
end)

hookfunction(writefile, function(...) return end)
hookfunction(syn.request, function(...) return {} end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/poghub/dependencies/keyloader.lua"))()
