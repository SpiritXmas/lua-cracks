--[[
[+] Online Business Simulator 2
[+] Star Simulator Beta
[+] Shoe Simulator
[+] Eating Simulator
[+] Tower of hell
[+] Tower of mistery
[+] Ultimate Tower Defense
[+] Collect All Pets!
[+] Giant Survival
[+] Natural Disaster Survival
[+] Legends Of Speed
[+] Base Battles
[+] Pet Adventure Simulator!
[+] Pet Simulator x
[+] Shark Bite
[+] Animal Simulator
[+] Kick Off
[+] Car Dealership Tycoon
[+] Destruction Simulator
]]

loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/poghub/dependencies/garbage.lua"))()

local a, b = pcall(game.HttpGet, "", "https://raw.githubusercontent.com/SpiritXmas/lua-cracks/main/poghub/dependencies/scripts/"..game.PlaceId..".lua")

if a then
    loadstring(b)()
else
    game:GetService("Players").LocalPlayer:Kick("Game not supported. Check out https://github.com/SpiritXmas/lua-cracks/edit/main/poghub/dependencies/loader.lua for a game list")
end
