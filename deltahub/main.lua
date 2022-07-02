local url_redirects = {
    ["https://raw.githubusercontent.com/lxnnydev/Delta-PSX/main/main.lua"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/deltahub/dependencies/game.lua";
}

local old; old = hookfunction(game.HttpGet, function(self, url)
    if url_redirects[url] then
        return old(self, url_redirects[url])
    end
    
    if url:match("verify.php") then
        return "valid"
    end
end)

hookfunction(syn.request, function(...) return {} end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/deltahub/dependencies/loader.lua"))()
