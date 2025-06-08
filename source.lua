local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "CustomTopBarAndSettings"

-- สร้าง TopBar
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(0, 400, 0, 50)
topBar.Position = UDim2.new(0.5, -200, 0, 20)
topBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
topBar.BorderSizePixel = 0
topBar.AnchorPoint = Vector2.new(0, 0)
topBar.Parent = screenGui
topBar.BackgroundTransparency = 0.1

-- เวลา
local timeLabel = Instance.new("TextLabel")
timeLabel.Size = UDim2.new(0, 60, 1, 0)
timeLabel.Position = UDim2.new(0, 10, 0, 0)
timeLabel.Text = "07:44"
timeLabel.TextColor3 = Color3.new(1,1,1)
timeLabel.TextScaled = true
timeLabel.Font = Enum.Font.SourceSansBold
timeLabel.BackgroundTransparency = 1
timeLabel.Parent = topBar

-- ปุ่มไอคอนสี
local icons = {
	{Color = Color3.fromRGB(111, 99, 255)}, -- Home
	{Color = Color3.fromRGB(99, 201, 255)}, -- User
	{Color = Color3.fromRGB(255, 99, 99)}, -- Book
	{Color = Color3.fromRGB(99, 255, 140)}, -- Friends
	{Color = Color3.fromRGB(255, 99, 130)}, -- Music
}

for i, data in ipairs(icons) do
	local icon = Instance.new("TextButton")
	icon.Size = UDim2.new(0, 30, 0, 30)
	icon.Position = UDim2.new(0, 80 + (i - 1) * 35, 0.1, 0)
	icon.BackgroundColor3 = data.Color
	icon.Text = ""
	icon.BorderSizePixel = 0
	icon.Parent = topBar
end

-- ปุ่ม Settings (Gear)
local gearBtn = Instance.new("TextButton")
gearBtn.Size = UDim2.new(0, 40, 0, 40)
gearBtn.Position = UDim2.new(1, -50, 0, 5)
gearBtn.Text = "⚙️"
gearBtn.TextScaled = true
gearBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
gearBtn.TextColor3 = Color3.new(1,1,1)
gearBtn.Parent = topBar
gearBtn.BorderSizePixel = 0

-- Settings Panel
local settingsPanel = Instance.new("Frame")
settingsPanel.Size = UDim2.new(0, 500, 0, 300)
settingsPanel.Position = UDim2.new(0.5, -250, 0.5, -150)
settingsPanel.BackgroundColor3 = Color3.fromRGB(15,15,15)
settingsPanel.BorderSizePixel = 0
settingsPanel.Visible = false
settingsPanel.Parent = screenGui

-- Settings Title
local settingsTitle = Instance.new("TextLabel")
settingsTitle.Size = UDim2.new(1, 0, 0, 40)
settingsTitle.Text = "Settings"
settingsTitle.TextColor3 = Color3.new(1,1,1)
settingsTitle.Font = Enum.Font.SourceSansBold
settingsTitle.TextScaled = true
settingsTitle.BackgroundTransparency = 1
settingsTitle.Parent = settingsPanel

-- คำอธิบาย
local settingsDesc = Instance.new("TextLabel")
settingsDesc.Size = UDim2.new(1, -20, 0, 30)
settingsDesc.Position = UDim2.new(0, 10, 0, 40)
settingsDesc.Text = "Adjust your preferences, set new keybinds, test out new features and more."
settingsDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
settingsDesc.Font = Enum.Font.SourceSans
settingsDesc.TextScaled = true
settingsDesc.BackgroundTransparency = 1
settingsDesc.TextWrapped = true
settingsDesc.Parent = settingsPanel

-- ปุ่มใน Settings
local buttons = {
	{"GENERAL", Color3.fromRGB(0, 120, 255)},
	{"KEYBINDS", Color3.fromRGB(0, 180, 90)},
	{"PERFORMANCE", Color3.fromRGB(255, 140, 50)},
	{"DETECTIONS", Color3.fromRGB(255, 50, 50)},
	{"LOGGING", Color3.fromRGB(255, 200, 0)},
}

for i, data in ipairs(buttons) do
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.3, 0, 0, 60)
	btn.Position = UDim2.new(0.05 + ((i - 1) % 2) * 0.5, 0, 0.35 + math.floor((i - 1) / 2) * 0.25, 0)
	btn.BackgroundColor3 = data[2]
	btn.Text = data[1]
	btn.TextScaled = true
	btn.Font = Enum.Font.SourceSansBold
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Parent = settingsPanel
end

-- toggle ปุ่ม settings
gearBtn.MouseButton1Click:Connect(function()
	settingsPanel.Visible = not settingsPanel.Visible
end)
