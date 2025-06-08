-- Full Sirius-Like GUI (with Icons, Click Sounds, Panel Toggle)
if not game:IsLoaded() then game.Loaded:Wait() end

local gui = Instance.new("ScreenGui")
gui.Name = "SiriusLikeUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = game:GetService("CoreGui")

-- Click Sound
local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://12221967"
clickSound.Volume = 1
clickSound.Parent = gui

-- Color Presets
local iconColors = {
	Home = Color3.fromRGB(111, 99, 255),
	Character = Color3.fromRGB(99, 201, 255),
	Scripts = Color3.fromRGB(255, 99, 99),
	Playerlist = Color3.fromRGB(99, 255, 140),
	Music = Color3.fromRGB(255, 99, 130),
}

local iconImages = {
	Home = "rbxassetid://6031094670",
	Character = "rbxassetid://6031068426",
	Scripts = "rbxassetid://6031075938",
	Playerlist = "rbxassetid://6031073915",
	Music = "rbxassetid://6031074743",
	Settings = "rbxassetid://6031280882", -- Gear icon
}

-- Top Bar
local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(0, 500, 0, 50)
topBar.Position = UDim2.new(0.5, -250, 0, 20)
topBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
topBar.BorderSizePixel = 0
topBar.Parent = gui

-- Time Display
local timeLabel = Instance.new("TextLabel", topBar)
timeLabel.Size = UDim2.new(0, 60, 1, 0)
timeLabel.Position = UDim2.new(0, 10, 0, 0)
timeLabel.Text = "07:44"
timeLabel.TextColor3 = Color3.new(1,1,1)
timeLabel.BackgroundTransparency = 1
timeLabel.TextScaled = true
timeLabel.Font = Enum.Font.SourceSansBold

-- Panels
local panels = {}
local panelNames = {"Home", "Character", "Scripts", "Playerlist", "Music"}
for _, name in ipairs(panelNames) do
	local p = Instance.new("Frame", gui)
	p.Name = name
	p.Size = UDim2.new(0, 450, 0, 250)
	p.Position = UDim2.new(0.5, -225, 0.5, -125)
	p.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	p.Visible = false
	panels[name] = p

	local label = Instance.new("TextLabel", p)
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Text = name .. " Panel"
	label.TextColor3 = Color3.new(1, 1, 1)
	label.TextScaled = true
	label.Font = Enum.Font.SourceSansBold
end

-- Button Logic
local function hideAllPanels()
	for _, p in pairs(panels) do
		p.Visible = false
	end
	settingsPanel.Visible = false
end

-- Create Smart Buttons
local i = 0
for name, color in pairs(iconColors) do
	local btn = Instance.new("ImageButton", topBar)
	btn.Size = UDim2.new(0, 30, 0, 30)
	btn.Position = UDim2.new(0, 80 + i * 35, 0.1, 0)
	btn.BackgroundColor3 = color
	btn.BorderSizePixel = 0
	btn.Image = iconImages[name]
	btn.Name = name
	i += 1

	btn.MouseButton1Click:Connect(function()
		clickSound:Play()
		hideAllPanels()
		if panels[name] then
			panels[name].Visible = true
		end
	end)
end

-- Gear Button (Settings)
local gearBtn = Instance.new("ImageButton", topBar)
gearBtn.Size = UDim2.new(0, 40, 0, 40)
gearBtn.Position = UDim2.new(1, -50, 0, 5)
gearBtn.Image = iconImages.Settings
gearBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
gearBtn.BorderSizePixel = 0

-- Settings Panel
local settingsPanel = Instance.new("Frame", gui)
settingsPanel.Name = "Settings"
settingsPanel.Size = UDim2.new(0, 500, 0, 300)
settingsPanel.Position = UDim2.new(0.5, -250, 0.5, -150)
settingsPanel.BackgroundColor3 = Color3.fromRGB(15,15,15)
settingsPanel.Visible = false

-- Title
local title = Instance.new("TextLabel", settingsPanel)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Settings"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true
title.BackgroundTransparency = 1

-- Description
local desc = Instance.new("TextLabel", settingsPanel)
desc.Size = UDim2.new(1, -20, 0, 30)
desc.Position = UDim2.new(0, 10, 0, 40)
desc.Text = "Adjust your preferences, set keybinds, and tweak performance."
desc.TextColor3 = Color3.fromRGB(200, 200, 200)
desc.Font = Enum.Font.SourceSans
desc.TextScaled = true
desc.BackgroundTransparency = 1
desc.TextWrapped = true

-- Settings Buttons
local settingsButtons = {
	{"GENERAL", Color3.fromRGB(0, 120, 255)},
	{"KEYBINDS", Color3.fromRGB(0, 200, 100)},
	{"PERFORMANCE", Color3.fromRGB(255, 140, 50)},
	{"DETECTIONS", Color3.fromRGB(255, 50, 50)},
	{"LOGGING", Color3.fromRGB(255, 220, 0)},
}

for i, data in ipairs(settingsButtons) do
	local btn = Instance.new("TextButton", settingsPanel)
	btn.Size = UDim2.new(0.4, 0, 0, 50)
	btn.Position = UDim2.new((i-1)%2==0 and 0.05 or 0.55, 0, 0.3 + math.floor((i-1)/2)*0.2, 0)
	btn.BackgroundColor3 = data[2]
	btn.Text = data[1]
	btn.Font = Enum.Font.SourceSansBold
	btn.TextScaled = true
	btn.TextColor3 = Color3.new(1,1,1)
end

-- Toggle Settings Panel
gearBtn.MouseButton1Click:Connect(function()
	clickSound:Play()
	hideAllPanels()
	settingsPanel.Visible = not settingsPanel.Visible
end)
