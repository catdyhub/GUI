local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomGUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- เมนูแถบด้านบน
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(0, 500, 0, 50)
topBar.Position = UDim2.new(0.5, -250, 0, 20)
topBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
topBar.BorderSizePixel = 0
topBar.Parent = screenGui

-- ตัวอย่างไอคอนในแถบ
local icons = {
	{Color = Color3.fromRGB(120, 100, 255)}, -- บ้าน
	{Color = Color3.fromRGB(100, 200, 255)}, -- คน
	{Color = Color3.fromRGB(255, 120, 120)}, -- หนังสือ
	{Color = Color3.fromRGB(100, 255, 120)}, -- กลุ่ม
	{Color = Color3.fromRGB(255, 100, 100)}, -- เพลง
}

for i, iconData in ipairs(icons) do
	local icon = Instance.new("TextButton")
	icon.Size = UDim2.new(0, 40, 0, 40)
	icon.Position = UDim2.new(0, 60 * (i - 1), 0, 5)
	icon.BackgroundColor3 = iconData.Color
	icon.Text = ""
	icon.Parent = topBar
end

-- ปุ่มรูปเฟือง
local settingsBtn = Instance.new("TextButton")
settingsBtn.Size = UDim2.new(0, 40, 0, 40)
settingsBtn.Position = UDim2.new(1, -50, 0, 5)
settingsBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
settingsBtn.Text = "⚙"
settingsBtn.TextColor3 = Color3.new(1, 1, 1)
settingsBtn.Parent = topBar

-- หน้าต่าง Settings
local settingsFrame = Instance.new("Frame")
settingsFrame.Size = UDim2.new(0, 400, 0, 250)
settingsFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
settingsFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
settingsFrame.Visible = false
settingsFrame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Settings"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = settingsFrame

-- ปุ่มหมวดใน Settings
local categories = {
	{"GENERAL", Color3.fromRGB(50, 100, 255)},
	{"KEYBINDS", Color3.fromRGB(50, 200, 100)},
	{"PERFORMANCE", Color3.fromRGB(255, 150, 50)},
	{"DETECTIONS", Color3.fromRGB(255, 50, 50)},
	{"LOGGING", Color3.fromRGB(255, 200, 50)},
}

for i, cat in ipairs(categories) do
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0.45, 0, 0, 40)
	button.Position = UDim2.new((i - 1) % 2 * 0.5 + 0.025, 0, 0.15 + math.floor((i - 1) / 2) * 0.2, 0)
	button.BackgroundColor3 = cat[2]
	button.Text = cat[1]
	button.TextColor3 = Color3.new(1, 1, 1)
	button.Font = Enum.Font.SourceSansBold
	button.TextScaled = true
	button.Parent = settingsFrame
end

-- กดเปิด Settings
settingsBtn.MouseButton1Click:Connect(function()
	settingsFrame.Visible = not settingsFrame.Visible
end)
