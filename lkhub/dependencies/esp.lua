local module = {}
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local S_CG = game:GetService("CoreGui")
local Camera = workspace.CurrentCamera

local plrsToUPD = {}
local tracers = false


function espFolder()
    local fold = Instance.new("Folder",S_CG)
    fold.Name = "LKESP"
    return fold
end

function Dist(pointA, pointB)
	return math.sqrt(math.pow(pointA.X - pointB.X, 2) + math.pow(pointA.Y - pointB.Y, 2))
end

function GetClosest(points, dest)
	local closest
    local min = math.huge
	for _,v in pairs(points) do
		local dist = Dist(v, dest)
		if dist < min then
			min = dist
			closest = v
		end
	end
	return closest
end

local espFold = S_CG:FindFirstChild("LKESP") or espFolder()

function reloadESP()
    espFold:ClearAllChildren()
    local function createESP(v)
        if v.Team == nil or v.Team ~= plr.Team then
            if Drawing == nil then
                if espFold:FindFirstChild(v.Name) then espFold:FindFirstChild(v.Name):Destroy() end
                local esp = Instance.new("BoxHandleAdornment",espFold)
                esp.Name = v.Name
                esp.Color3 = v.TeamColor.Color
                esp.ZIndex = 1
                esp.Transparency = 0.4
                esp.Adornee = v.Character
                esp.Size = v.Character:GetExtentsSize()
                esp.AlwaysOnTop = true
                local BillboardGui = Instance.new("BillboardGui",esp)
                BillboardGui.AlwaysOnTop = true
                BillboardGui.Adornee = v.Character
                BillboardGui.Size = UDim2.new(2.5,40,1,5)
                BillboardGui.StudsOffset = Vector3.new(0,3.5,0)
                local TextLabel = Instance.new("TextLabel",BillboardGui)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Text = v.Name
                TextLabel.Size = UDim2.new(1,0,1,0)
                TextLabel.TextScaled = true
                TextLabel.TextStrokeTransparency = 0.75
                TextLabel.TextColor3 = Color3.new(1,1,1)
                TextLabel.Font = Enum.Font.Gotham
            else
                local found
                for _,__ in pairs(plrsToUPD) do
                    if __.p == v then
                        found = true
                    end
                end
                if not found then
                    local Box = Drawing.new("Quad")
                    Box.Visible = false
                    Box.PointA = Vector2.new(0, 0)
                    Box.PointB = Vector2.new(0, 0)
                    Box.PointC = Vector2.new(0, 0)
                    Box.PointD = Vector2.new(0, 0)
                    Box.Color = v.TeamColor.Color
                    Box.Thickness = 2
                    Box.Transparency = 1
                    
                    local Tracer = Drawing.new("Line")
                    Tracer.Visible = false
                    Tracer.Color = v.TeamColor.Color
                    Tracer.Thickness = 1
                    Tracer.Transparency = 1

                    table.insert(plrsToUPD,{p=v,b=Box,t=Tracer})
                end
            end
        end  
    end
    for _,v in pairs(plrs:GetPlayers()) do
        if v.Character and v ~= plr and v.Character.Head then
            createESP(v)
            v.CharacterAdded:Connect(function()
                createESP(v)
            end)
            
        end
    end
end

local c

function module:ESP()
    print("LKHUB | ESP Loaded")
    reloadESP()

    plrs.PlayerAdded:Connect(reloadESP)
    plrs.PlayerRemoving:Connect(reloadESP)

    c = game:GetService("RunService").RenderStepped:Connect(function()
        for _,v in pairs(plrsToUPD) do
            local pl = v.p
            local Box = v.b
            local Tracer = v.t
    
            if pl.Team ~= nil and pl.Team == plr.Team then
                Box.Visible = false
                Tracer.Visible = false
                plrsToUPD[_] = nil
                continue
            end
    
            if pl.Character and pl.Character:FindFirstChildOfClass("Humanoid") and pl.Character:FindFirstChild("HumanoidRootPart") and pl.Character:FindFirstChildOfClass("Humanoid").Health > 0 and pl.Character:FindFirstChild("Head") then
                local pos, OnScreen = Camera:WorldToViewportPoint(pl.Character.HumanoidRootPart.Position)
                if OnScreen then 
                    --box esp
                    local points = {}
                    local c = 0
                    for _,v in pairs(pl.Character:GetChildren()) do
                        if v:IsA("BasePart") then
                            c = c + 1
                            local p = Camera:WorldToViewportPoint(v.Position)
                            if v.Name == "HumanoidRootPart" then
                                p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, 0, -v.Size.Z)).p)
                            elseif v.Name == "Head" then
                                p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, v.Size.Y/2, v.Size.Z/1.25)).p)
                            elseif string.match(v.Name, "Left") then
                                p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(-v.Size.X/2, 0, 0)).p)
                            elseif string.match(v.Name, "Right") then
                                p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(v.Size.X/2, 0, 0)).p)
                            end
                            points[c] = p
                        end
                    end
                    local Left = GetClosest(points, Vector2.new(0, pos.Y))
                    local Right = GetClosest(points, Vector2.new(Camera.ViewportSize.X, pos.Y))
                    local Top = GetClosest(points, Vector2.new(pos.X, 0))
                    local Bottom = GetClosest(points, Vector2.new(pos.X, Camera.ViewportSize.Y))
    
                    if Left ~= nil and Right ~= nil and Top ~= nil and Bottom ~= nil then
                        Box.PointA = Vector2.new(Right.X, Top.Y)
                        Box.PointB = Vector2.new(Left.X, Top.Y)
                        Box.PointC = Vector2.new(Left.X, Bottom.Y)
                        Box.PointD = Vector2.new(Right.X, Bottom.Y)
    
                        Box.Visible = true
                        Box.Color = pl.TeamColor.Color
                    else 
                        Box.Visible = false
                    end
    
                    --tracers
    
                    if tracers then
                        Tracer.From = Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y)
                        Tracer.To = Vector2.new(pos.X,pos.Y)
                        Tracer.Visible = true
                        Tracer.Color = pl.TeamColor.Color
                    end
                else 
                    Box.Visible = false
                    Tracer.Visible = false
                end
            else
                Box.Visible = false
                Tracer.Visible = false
                if not plrs:FindFirstChild(pl) then
                    plrsToUPD[_] = nil
                end
            end
        end
    end)    
end

function module:DestroyESP()
    espFold:Destroy()
    c:Disconnect()
    for _,v in pairs(plrsToUPD) do
        v.b.Visible = false
        v.t.Visible = false
    end
    plrsToUPD = {}
    print("LKHUB | ESP Unloaded")
end

function module:Tracers(Value)
    print("LKHUB | Tracers",(Value and "Enabled" or "Disabled"))
    
    tracers = Value
end

return module
