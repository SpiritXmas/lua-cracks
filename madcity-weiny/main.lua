local coregui = game:GetService("CoreGui")

local key_input = nil;
task.spawn(function()
    repeat 
        wait()
        pcall(function()
            key_input = coregui.Discord.MainFrame.TopFrame.TopFrameHolder.ServersHolder.ServerFrame.ChannelContentFrame.ChannelHolder.Textbox.TextboxTitle.TextboxFrame.TextBox
        end)
    until key_input
end)

local old; old = hookmetamethod(game, "__index", function(self, index)
    if self == key_input and index == "Text" then
        return "N6bvoD77A02AM"
    end
    
    return old(self, index)
end)

local url_redirects = {
    ["https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/madcity-weiny/dependencies/discordui.lua";
    ["https://raw.githubusercontent.com/weiny-ez/w-main/main/2.lua"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/madcity-weiny/dependencies/script.lua";
    ["https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Kronos"] = "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/madcity-weiny/dependencies/kronosui.lua";
}

local old; old = hookfunction(game.HttpGet, function(self, url)
    if url_redirects[url] then
        return old(self, url_redirects[url])
    end
    
    if url:match("SpiritXmas") then
        return old(self, url)
    end
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/madcity-weiny/dependencies/loader.lua"))()
