local UwU = {}

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()

function UwU:Notify(text, discription)
 print(text, discription)
local Notifaction = Instance.new("ScreenGui")
local Message = Instance.new("Frame")
local MessageLine = Instance.new("TextLabel")
local MessageLineCorner = Instance.new("UICorner")
local MessageName = Instance.new("TextLabel")
local MessageCorner = Instance.new("UICorner")
local Discription = Instance.new("TextLabel")
local closeButton = Instance.new("TextButton")
local closeButtonCorner = Instance.new("UICorner")

Notifaction.Name = "Notifaction"
Notifaction.Parent = game.CoreGui
 
Message.Name = "Message"
Message.Parent = Notifaction
Message.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Message.Position = UDim2.new(0.0059760958, 0, 0.700247109, 0)
Message.Size = UDim2.new(0, 0, 0, 0)

MessageLine.Name = "MessageLine"
MessageLine.Parent = Message
MessageLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MessageLine.BorderSizePixel = 0
MessageLine.Position = UDim2.new(0.0212765727, 0, 0.51111114, 0)
MessageLine.Size = UDim2.new(0, 0, 0, 0)
MessageLine.Font = Enum.Font.SourceSans
MessageLine.Text = ""
MessageLine.TextColor3 = Color3.fromRGB(0, 0, 0)
MessageLine.TextScaled = true
MessageLine.TextSize = 14.000
MessageLine.TextWrapped = true
 --0, 501, 0, 8
MessageLineCorner.Name = "MessageLineCorner"
MessageLineCorner.Parent = MessageLine
 
MessageName.Name = "MessageName"
MessageName.Parent = Message
MessageName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MessageName.BackgroundTransparency = 1.000
MessageName.BorderColor3 = Color3.fromRGB(255, 255, 255)
MessageName.BorderSizePixel = 0
MessageName.Position = UDim2.new(0.0212765727, 0, 0, 0)
MessageName.Size = UDim2.new(0, 0, 0, 0)
MessageName.Font = Enum.Font.GothamBold
MessageName.Text = text
MessageName.TextColor3 = Color3.fromRGB(255, 255, 255)
MessageName.TextSize = 54.000
MessageName.TextWrapped = true
MessageName.Visible = false
 --0, 507, 0, 58
MessageCorner.Name = "MessageCorner"
MessageCorner.Parent = Message
 
Discription.Name = "Discription"
Discription.Parent = Message
Discription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Discription.BackgroundTransparency = 1.000
Discription.Position = UDim2.new(0.0212765727, 0, 0.626035988, 0)
Discription.Size = UDim2.new(0, 0, 0, 0)
Discription.Font = Enum.Font.Gotham
Discription.Text = discription
Discription.TextColor3 = Color3.fromRGB(255, 255, 255)
Discription.TextSize = 18.000
Discription.Visible = false
 --0, 501, 0, 43
 
closeButton.Name = "closeButton"
closeButton.Parent = Message
closeButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
closeButton.Position = UDim2.new(0.900919974, 0, 0, 0)
closeButton.Size = UDim2.new(0, 51, 0, 45)
closeButton.Font = Enum.Font.Gotham
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = false
closeButton.TextSize = 30
closeButton.TextWrapped = false
closeButton.AutoButtonColor = false
closeButton.Visible = false
 
closeButtonCorner.Name = "closeButtonCorner"
closeButtonCorner.Parent = closeButton
 
closeButton.MouseEnter:Connect(function()
   TweenService:Create(
      closeButton,
      TweenInfo.new(.3, Enum.EasingStyle.Quad),
      {BackgroundColor3 = Color3.fromRGB(40,40,40)}
   ):Play()
end)
 
closeButton.MouseLeave:Connect(function()
   TweenService:Create(
      closeButton,
      TweenInfo.new(.3, Enum.EasingStyle.Quad),
      {BackgroundColor3 = Color3.fromRGB(35,35,35)}
   ):Play()
end)
 
closeButton.MouseButton1Click:Connect(function()
   closeButton.TextSize = 10
   TweenService:Create(
      closeButton,
      TweenInfo.new(.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
      {TextSize = 30}
   ):Play()


   TweenService:Create(
   MessageLine,
   TweenInfo.new(.2, Enum.EasingStyle.Quad),
   {Size = UDim2.new(0, 0, 0, 8)}
):Play()
repeat task.wait() until MessageLine.Size == UDim2.new(0, 0, 0, 8)
   TweenService:Create(
   MessageName,
   TweenInfo.new(.2, Enum.EasingStyle.Quad),
   {Size = UDim2.new(0, 0, 0, 58)}
):Play()
closeButton.Visible = false
TweenService:Create(
   Discription,
   TweenInfo.new(.2, Enum.EasingStyle.Quad),
   {Size = UDim2.new(0, 0, 0, 43)}
):Play()
repeat task.wait() until Discription.Size == UDim2.new(0, 0, 0, 43)
MessageName.Visible = false
Discription.Visible = false
 
TweenService:Create(
   Message,
   TweenInfo.new(.2, Enum.EasingStyle.Quad),
   {Size = UDim2.new(0, 0, 0, 135)}
):Play()
 
repeat wait() until Message.Size == UDim2.new(0, 0, 0, 135)
game.CoreGui.Notifaction:Destroy()
end)
 
 
 
 
TweenService:Create(
   Message,
   TweenInfo.new(.2, Enum.EasingStyle.Quad),
   {Size = UDim2.new(0, 0, 0, 135)}
):Play()
 
repeat wait() until Message.Size == UDim2.new(0, 0, 0, 135)
 
TweenService:Create(
   Message,
   TweenInfo.new(.2, Enum.EasingStyle.Quad),
   {Size = UDim2.new(0, 519, 0, 135)}
):Play()
 
repeat wait() until Message.Size == UDim2.new(0, 519, 0, 135)
MessageName.Visible = true
Discription.Visible = true
closeButton.Visible = true
 
TweenService:Create(
   MessageLine,
   TweenInfo.new(.2, Enum.EasingStyle.Quad),
   {Size = UDim2.new(0, 0, 0, 8)}
):Play()
 
TweenService:Create(
   MessageName,
   TweenInfo.new(.2, Enum.EasingStyle.Quad),
   {Size = UDim2.new(0, 0, 0, 58)}
):Play()
 
TweenService:Create(
   Discription,
   TweenInfo.new(.2, Enum.EasingStyle.Quad),
   {Size = UDim2.new(0, 0, 0, 43)}
):Play()
 
repeat wait() until MessageLine.Size == UDim2.new(0, 0, 0, 8)
 
TweenService:Create(
   MessageLine,
   TweenInfo.new(.2, Enum.EasingStyle.Quad),
   {Size = UDim2.new(0, 501, 0, 8)}
):Play()
 
TweenService:Create(
   MessageName,
   TweenInfo.new(.2, Enum.EasingStyle.Quad),
   {Size = UDim2.new(0, 507, 0, 58)}
):Play()
 
TweenService:Create(
   Discription,
   TweenInfo.new(.2, Enum.EasingStyle.Quad),
   {Size = UDim2.new(0, 501, 0, 43)}
):Play()
 
repeat wait() until MessageLine.Size == UDim2.new(0, 501, 0, 8)
 
TweenService:Create(
   MessageLine,
   TweenInfo.new(20, Enum.EasingStyle.Quad),
   {Size = UDim2.new(0, 0, 0, 8)}
):Play()
 
repeat wait() until MessageLine.Size == UDim2.new(0, 0, 0, 8)
TweenService:Create(
   MessageName,
   TweenInfo.new(.2, Enum.EasingStyle.Quad),
   {Size = UDim2.new(0, 0, 0, 58)}
):Play()
closeButton.Visible = false
 
TweenService:Create(
   Discription,
   TweenInfo.new(.2, Enum.EasingStyle.Quad),
   {Size = UDim2.new(0, 0, 0, 43)}
):Play()
repeat task.wait() until Discription.Size == UDim2.new(0, 0, 0, 43)
MessageName.Visible = false
Discription.Visible = false
 
TweenService:Create(
   Message,
   TweenInfo.new(.2, Enum.EasingStyle.Quad),
   {Size = UDim2.new(0, 0, 0, 135)}
):Play()
 
repeat wait() until Message.Size == UDim2.new(0, 0, 0, 135)
game.CoreGui.Notifaction:Destroy()
end
 
return UwU
