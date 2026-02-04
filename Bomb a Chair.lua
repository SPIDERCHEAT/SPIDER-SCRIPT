-- If the UI already exists, remove it to prevent duplicates.
pcall(function()
    game:GetService("CoreGui"):FindFirstChild("SpiderCheat_UI"):Destroy()
end)

-- ///////////////////////////////////////////////////////////////////
-- SERVICES
-- ///////////////////////////////////////////////////////////////////

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")

-- ///////////////////////////////////////////////////////////////////
-- GUI (User Interface)
-- ///////////////////////////////////////////////////////////////////

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SpiderCheat_UI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

-- //////////////////// NEW ////////////////////
-- Open Button (Visible when MainFrame is closed)
local OpenButton = Instance.new("TextButton")
OpenButton.Name = "OpenButton"
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 150, 0, 40)
OpenButton.Position = UDim2.new(1, -160, 0, 10) -- Top-right corner of the screen
OpenButton.BackgroundColor3 = Color3.fromRGB(10, 15, 20)
OpenButton.BorderSizePixel = 1
OpenButton.BorderColor3 = Color3.fromRGB(0, 255, 128)
OpenButton.Font = Enum.Font.Code
OpenButton.Text = "SHOW MENU"
OpenButton.TextColor3 = Color3.fromRGB(0, 255, 128)
OpenButton.TextSize = 18
OpenButton.ZIndex = 10
OpenButton.Visible = false -- Initially hidden because the menu is open

local OpenButtonCorner = Instance.new("UICorner")
OpenButtonCorner.CornerRadius = UDim.new(0, 5)
OpenButtonCorner.Parent = OpenButton

local OpenButtonGradient = Instance.new("UIGradient")
OpenButtonGradient.Parent = OpenButton
OpenButtonGradient.Color = ColorSequence.new(Color3.fromRGB(255, 0, 85), Color3.fromRGB(0, 255, 128))
OpenButtonGradient.Rotation = 45

-- Main frame for the menu
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 15, 20)
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 128)
MainFrame.BorderSizePixel = 1
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -160)
MainFrame.Size = UDim2.new(0, 420, 0, 320)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true -- Start visible
MainFrame.ClipsDescendants = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local UIGradient = Instance.new("UIGradient")
UIGradient.Parent = MainFrame
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 128)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 85)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 128))
})
UIGradient.Rotation = 90

local GridBg = Instance.new("ImageLabel")
GridBg.Name = "GridBg"
GridBg.Parent = MainFrame
GridBg.BackgroundTransparency = 1
GridBg.Image = "rbxassetid://215148643"
GridBg.ScaleType = Enum.ScaleType.Tile
GridBg.TileSize = UDim2.new(0, 30, 0, 30)
GridBg.ImageColor3 = Color3.fromRGB(0, 255, 128)
GridBg.ImageTransparency = 0.9
GridBg.Size = UDim2.new(1, 0, 1, 0)
GridBg.ZIndex = 0

local Scanlines = Instance.new("ImageLabel")
Scanlines.Name = "Scanlines"
Scanlines.Parent = MainFrame
Scanlines.BackgroundTransparency = 1
Scanlines.Image = "rbxassetid://357909529"
Scanlines.ScaleType = Enum.ScaleType.Tile
Scanlines.TileSize = UDim2.new(1, 0, 0, 4)
Scanlines.ImageColor3 = Color3.new(0, 0, 0)
Scanlines.ImageTransparency = 0.8
Scanlines.Size = UDim2.new(1, 0, 1, 0)
Scanlines.ZIndex = 0

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 25, 30)
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.ZIndex = 2

local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 8)
TitleBarCorner.Parent = TitleBar

local TitleBarStroke = Instance.new("UIStroke")
TitleBarStroke.Parent = TitleBar
TitleBarStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
TitleBarStroke.Color = Color3.fromRGB(40, 45, 50)
TitleBarStroke.Thickness = 2

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = TitleBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.Font = Enum.Font.Code
TitleLabel.Text = "S P I D E R C H E A T"
TitleLabel.TextColor3 = Color3.fromRGB(255, 0, 85)
TitleLabel.TextSize = 24
TitleLabel.ZIndex = 3

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0.5, -15)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 85)
CloseButton.BackgroundTransparency = 0.2
CloseButton.BorderSizePixel = 0
CloseButton.Font = Enum.Font.Code
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20
CloseButton.ZIndex = 4

local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(0, 4)
CloseButtonCorner.Parent = CloseButton

local CloseButtonStroke = Instance.new("UIStroke")
CloseButtonStroke.Parent = CloseButton
CloseButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
CloseButtonStroke.Color = Color3.fromRGB(255, 0, 85)
CloseButtonStroke.Thickness = 1.5

local MoneyInput = Instance.new("TextBox")
MoneyInput.Name = "MoneyInput"
MoneyInput.Parent = MainFrame
MoneyInput.BackgroundColor3 = Color3.fromRGB(20, 25, 30)
MoneyInput.BorderColor3 = Color3.fromRGB(40, 45, 50)
MoneyInput.BorderSizePixel = 2
MoneyInput.Position = UDim2.new(0.05, 0, 0.2, 0)
MoneyInput.Size = UDim2.new(0.9, 0, 0, 40)
MoneyInput.Font = Enum.Font.Code
MoneyInput.PlaceholderText = "Enter Money Amount..."
MoneyInput.Text = "100000000000000000"
MoneyInput.TextColor3 = Color3.fromRGB(0, 255, 128)
MoneyInput.TextSize = 16
MoneyInput.ClearTextOnFocus = false
MoneyInput.ZIndex = 2

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 5)
InputCorner.Parent = MoneyInput

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = MainFrame
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 75)
ToggleButton.Position = UDim2.new(0.05, 0, 0.45, 0)
ToggleButton.Size = UDim2.new(0.9, 0, 0, 50)
ToggleButton.Font = Enum.Font.Code
ToggleButton.Text = "[ ADD MONEY ]"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 22
ToggleButton.ZIndex = 2

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 5)
ButtonCorner.Parent = ToggleButton

local ButtonStroke = Instance.new("UIStroke")
ButtonStroke.Parent = ToggleButton
ButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
ButtonStroke.Color = Color3.fromRGB(0, 255, 127)
ButtonStroke.Thickness = 1.5

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 0, 0.75, 0)
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Font = Enum.Font.Code
StatusLabel.Text = "STATUS: IDLE"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
StatusLabel.TextSize = 18
StatusLabel.ZIndex = 2

local FooterLabel = Instance.new("TextLabel")
FooterLabel.Name = "FooterLabel"
FooterLabel.Parent = MainFrame
FooterLabel.BackgroundTransparency = 1
FooterLabel.Position = UDim2.new(0, 0, 0.9, 0)
FooterLabel.Size = UDim2.new(1, 0, 0, 30)
FooterLabel.Font = Enum.Font.Code
FooterLabel.Text = "INSTAGRAM [ SPIDERCHEAT ]"
FooterLabel.TextColor3 = Color3.fromRGB(100, 100, 100)
FooterLabel.TextSize = 14
FooterLabel.ZIndex = 2

-- ///////////////////////////////////////////////////////////////////
-- SCRIPT LOGIC
-- ///////////////////////////////////////////////////////////////////

local isLooping = false
local moneyLoopThread = nil

local BuyOrEquipEvent = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("Shop"):WaitForChild("BuyOrEquipItem")

function startMoneyLoop()
    moneyLoopThread = task.spawn(function()
        while isLooping do
            local moneyAmount = tonumber(MoneyInput.Text) or 1e18
            local exploitValue = -math.abs(moneyAmount)
            local args = {"Mine", exploitValue, "Bombs", "EquippedBomb", "Default Bomb"}
            pcall(function() BuyOrEquipEvent:FireServer(unpack(args)) end)
            task.wait(0.1)
        end
    end)
end

function stopMoneyLoop()
    if moneyLoopThread then
        task.cancel(moneyLoopThread)
        moneyLoopThread = nil
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    isLooping = not isLooping
    if isLooping then
        ToggleButton.Text = "[ STOP ]"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 0, 50)
        ButtonStroke.Color = Color3.fromRGB(255, 0, 85)
        StatusLabel.Text = "STATUS: ADDING MONEY..."
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 127)
        startMoneyLoop()
    else
        ToggleButton.Text = "[ ADD MONEY ]"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 75)
        ButtonStroke.Color = Color3.fromRGB(0, 255, 127)
        StatusLabel.Text = "STATUS: STOPPED"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 85)
        stopMoneyLoop()
    end
end)

-- ///////////////////////////////////////////////////////////////////
-- UI EFFECTS & TOGGLE LOGIC (CORRECTED)
-- ///////////////////////////////////////////////////////////////////

local glitchChars = {"S", "P", "I", "D", "E", "R", "C", "H", "E", "A", "T", "#", "*", "@", "!", "$", "%"}
local originalTitle = "S P I D E R C H E A T"

task.spawn(function()
    while task.wait() do
        UIGradient.Offset = UIGradient.Offset + Vector2.new(0, 0.02)
        if UIGradient.Offset.Y >= 1 then UIGradient.Offset = Vector2.new(0, -1) end
        
        if MainFrame.Visible and math.random(1, 20) == 1 then
            local newTitle = ""
            for i = 1, #originalTitle do
                if string.sub(originalTitle, i, i) ~= " " and math.random(1, 5) == 1 then
                    newTitle = newTitle .. glitchChars[math.random(1, #glitchChars)]
                else
                    newTitle = newTitle .. string.sub(originalTitle, i, i)
                end
            end
            TitleLabel.Text = newTitle
            task.wait(0.1)
            TitleLabel.Text = originalTitle
        end
    end
end)

local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

-- Function to OPEN the menu
function openMenu()
    OpenButton.Visible = false
    MainFrame.Visible = true
    MainFrame.Position = UDim2.new(0.5, -210, 0.5, -180) -- Start slightly higher for a nice drop-in effect
    MainFrame.BackgroundTransparency = 1 -- Start invisible
    
    local openTween = TweenService:Create(MainFrame, tweenInfo, {
        Position = UDim2.new(0.5, -210, 0.5, -160),
        BackgroundTransparency = 0
    })
    openTween:Play()
end

-- Function to CLOSE the menu
function closeMenu()
    local closeTween = TweenService:Create(MainFrame, tweenInfo, {
        Position = UDim2.new(0.5, -210, 0.5, -180),
        BackgroundTransparency = 1
    })
    closeTween:Play()
    closeTween.Completed:Wait() -- Wait for animation to finish
    MainFrame.Visible = false
    OpenButton.Visible = true
end

-- Connect the buttons to their respective functions
CloseButton.MouseButton1Click:Connect(closeMenu)
OpenButton.MouseButton1Click:Connect(openMenu)

-- Connect the keyboard toggle
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.RightControl then
        -- Check which state the menu is in and call the correct function
        if MainFrame.Visible then
            closeMenu()
        else
            openMenu()
        end
    end
end)
