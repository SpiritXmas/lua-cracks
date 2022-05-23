local a, b = pcall(game.HttpGet, "", "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/srmhub/dependencies/scripts/"..game.PlaceId..".lua")

if a then
    loadstring(b)()
else
    game:GetService("Players").LocalPlayer:Kick("Game not supported.")
end
