local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "StormHub"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 400, 0, 360)
frame.Position = UDim2.new(0.5, -200, 0.5, -180)
frame.BackgroundColor3 = Color3.fromRGB(180, 220, 255)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local shadow = Instance.new("ImageLabel", frame)
shadow.Size = UDim2.new(1, 20, 1, 20)
shadow.Position = UDim2.new(0, -10, 0, -10)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageTransparency = 0.6
shadow.ZIndex = 0

local title = Instance.new("TextLabel", frame)
title.Text = "⚡️Storm Hub⚡️"
title.Size = UDim2.new(1, -20, 0, 40)
title.Position = UDim2.new(0, 10, 0, 10)
title.TextColor3 = Color3.fromRGB(30, 30, 30)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextXAlignment = Enum.TextXAlignment.Center

local credit = Instance.new("TextLabel", frame)
credit.Text = "by samireblen07"
credit.Size = UDim2.new(0, 150, 0, 20)
credit.Position = UDim2.new(0, 10, 0, 50)
credit.TextColor3 = Color3.fromRGB(80, 80, 80)
credit.BackgroundTransparency = 1
credit.Font = Enum.Font.Gotham
credit.TextSize = 14
credit.TextXAlignment = Enum.TextXAlignment.Left

local tabBar = Instance.new("ScrollingFrame", frame)
tabBar.Size = UDim2.new(1, -20, 0, 35)
tabBar.Position = UDim2.new(0, 10, 0, 80)
tabBar.CanvasSize = UDim2.new(0, 700, 0, 35)
tabBar.ScrollBarThickness = 4
tabBar.BackgroundTransparency = 1
tabBar.HorizontalScrollBarInset = Enum.ScrollBarInset.Always
tabBar.ScrollingDirection = Enum.ScrollingDirection.X

local tabs = {
    {"Player", ""},
    {"Troll", "☠️"},
    {"Admin", "🛡️"},
    {"House", "🏠"},
    {"Car", "🚗"},
    {"Avatar", "👕"},
    {"Fun", "⚡️🔲"}
}

local tabButtons = {}
local contentFrames = {}

for i, tabData in ipairs(tabs) do
    local tabName, icon = tabData[1], tabData[2]
    local tabBtn = Instance.new("TextButton", tabBar)
    tabBtn.Text = tabName .. " " .. icon
    tabBtn.Size = UDim2.new(0, 90, 0, 30)
    tabBtn.Position = UDim2.new(0, (i - 1) * 95, 0, 0)
    tabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tabBtn.TextColor3 = Color3.fromRGB(50, 50, 50)
    tabBtn.Font = Enum.Font.Gotham
    tabBtn.TextSize = 14
    tabBtn.BorderSizePixel = 0
    Instance.new("UICorner", tabBtn).CornerRadius = UDim.new(0, 8)
tabButtons[tabName] = tabBtn

    local content = Instance.new("Frame", frame)
    content.Size = UDim2.new(1, -20, 1, -130)
    content.Position = UDim2.new(0, 10, 0, 120)
    content.BackgroundTransparency = 1
    content.Visible = (i == 1)
    contentFrames[tabName] = content
end

for name, btn in pairs(tabButtons) do
    btn.MouseButton1Click:Connect(function()
        for tab, frame in pairs(contentFrames) do
            frame.Visible = (tab == name)
        end
    end)
end

game.StarterGui:SetCore("SendNotification", {
    Title = "Storm Hub",
    Text = "You are using ⚡️Storm Hub⚡️",
    Duration = 5
})
