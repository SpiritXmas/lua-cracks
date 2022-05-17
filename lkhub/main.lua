local base_url = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/lkhub/"

local old; old = hookfunction(game.HttpGet, function(self, url)
    if url:match("check.php") then
        return "Whitelisted"
    end

    return old(self, url)
end)
