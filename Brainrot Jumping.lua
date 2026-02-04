-- If the UI already exists, remove it to prevent duplicates.
pcall(function()
    game:GetService("CoreGui"):FindFirstChild("SpiderCheat_UI"):Destroy()
end)

-- ///////////////////////////////////////////////////////////////////
-- GUI (User Interface)
-- ///////////////////////////////////////////////////////////////////

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SpiderCheat_UI"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global -- Ensures UI is on top

-- Main frame for the menu
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 15, 20) -- Dark blue/black background
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 128) -- Bright green border
MainFrame.BorderSizePixel = 1
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -160)
MainFrame.Size = UDim2.new(0, 420, 0, 320)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true -- Start visible

-- UI Corner for a modern, rounded look
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Animated Border Effect
local UIGradient = Instance.new("UIGradient")
UIGradient.Parent = MainFrame
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 128)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 85)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 128))
})
UIGradient.Rotation = 90

-- Background Grid for hacker aesthetic
local GridBg = Instance.new("ImageLabel")
GridBg.Name = "GridBg"
GridBg.Parent = MainFrame
GridBg.BackgroundTransparency = 1
GridBg.Image = "rbxassetid://215148643" -- Grid texture
GridBg.ScaleType = Enum.ScaleType.Tile
GridBg.TileSize = UDim2.new(0, 30, 0, 30)
GridBg.ImageColor3 = Color3.fromRGB(0, 255, 128)
GridBg.ImageTransparency = 0.9
GridBg.Size = UDim2.new(1, 0, 1, 0)
GridBg.ZIndex = 0

-- Scanlines effect for a CRT monitor look
local Scanlines = Instance.new("ImageLabel")
Scanlines.Name = "Scanlines"
Scanlines.Parent = MainFrame
Scanlines.BackgroundTransparency = 1
Scanlines.Image = "rbxassetid://357909529" -- Scanline texture
Scanlines.ScaleType = Enum.ScaleType.Tile
Scanlines.TileSize = UDim2.new(1, 0, 0, 4)
Scanlines.ImageColor3 = Color3.new(0, 0, 0)
Scanlines.ImageTransparency = 0.8
Scanlines.Size = UDim2.new(1, 0, 1, 0)
Scanlines.ZIndex = 0

-- Menu Title Bar
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

-- Title Label
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = TitleBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.Font = Enum.Font.Code -- Hacker-style font
TitleLabel.Text = "S P I D E R C H E A T"
TitleLabel.TextColor3 = Color3.fromRGB(255, 0, 85) -- Hot pink/red color
TitleLabel.TextSize = 24
TitleLabel.ZIndex = 3

-- Input box for the money value
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
MoneyInput.Text = "99999999999999999999" -- Default large value
MoneyInput.TextColor3 = Color3.fromRGB(0, 255, 128) -- Hacker green
MoneyInput.TextSize = 16
MoneyInput.ClearTextOnFocus = false
MoneyInput.ZIndex = 2

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 5)
InputCorner.Parent = MoneyInput

-- Start / Stop Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = MainFrame
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 75) -- Green for "Start"
ToggleButton.Position = UDim2.new(0.05, 0, 0.45, 0)
ToggleButton.Size = UDim2.new(0.9, 0, 0, 50)
ToggleButton.Font = Enum.Font.Code
ToggleButton.Text = "[ START EXPLOIT ]"
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

-- Status display label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 0, 0.75, 0)
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Font = Enum.Font.Code
StatusLabel.Text = "STATUS: IDLE"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0) -- Yellow for status
StatusLabel.TextSize = 18
StatusLabel.ZIndex = 2

-- Footer text
local FooterLabel = Instance.new("TextLabel")
FooterLabel.Name = "FooterLabel"
FooterLabel.Parent = MainFrame
FooterLabel.BackgroundTransparency = 1
FooterLabel.Position = UDim2.new(0, 0, 0.9, 0)
FooterLabel.Size = UDim2.new(1, 0, 0, 30)
FooterLabel.Font = Enum.Font.Code
FooterLabel.Text = "INSTAGRAM [ SPIDERCHEAT ]"
FooterLabel.TextColor3 = Color3.fromRGB(100, 100, 100) -- Gray color
FooterLabel.TextSize = 14
FooterLabel.ZIndex = 2

-- ///////////////////////////////////////////////////////////////////
-- SCRIPT LOGIC
-- ///////////////////////////////////////////////////////////////////

local isLooping = false
local moneyLoopThread = nil
local runService = game:GetService("RunService")

-- Path to the RemoteEvent (ensure this is correct for the game you are in)
local GiveOutRewardEvent = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Roulette"):WaitForChild("GiveOutReward")

-- Main function to send the money request
function startMoneyLoop()
    moneyLoopThread = task.spawn(function()
        while isLooping do
            -- Read the money value from the input box
            -- tonumber converts the text to a number. If it fails, use a default large number.
            local moneyValue = tonumber(MoneyInput.Text) or 9e18

            -- Arguments table for the remote event
            local args = {
                {
                    value = moneyValue,
                    type = "Money",
                    chance = 0.01 -- This value is from your original script
                }
            }
            
            -- Fire the RemoteEvent safely using pcall to prevent the script from crashing on error
            pcall(function()
                GiveOutRewardEvent:FireServer(unpack(args))
            end)
            
            task.wait(0.1) -- Small delay to prevent server lag or being kicked
        end
    end)
end

-- Function to stop the loop
function stopMoneyLoop()
    if moneyLoopThread then
        task.cancel(moneyLoopThread) -- Safely terminate the thread
        moneyLoopThread = nil
    end
end

-- Button click event
ToggleButton.MouseButton1Click:Connect(function()
    isLooping = not isLooping -- Invert the loop state

    if isLooping then
        -- START
        ToggleButton.Text = "[ STOP EXPLOIT ]"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 0, 50) -- Red for "Stop"
        ButtonStroke.Color = Color3.fromRGB(255, 0, 85)
        StatusLabel.Text = "STATUS: RUNNING..."
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 127) -- Green
        startMoneyLoop()
    else
        -- STOP
        ToggleButton.Text = "[ START EXPLOIT ]"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 75) -- Green for "Start"
        ButtonStroke.Color = Color3.fromRGB(0, 255, 127)
        StatusLabel.Text = "STATUS: STOPPED"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 85) -- Red
        stopMoneyLoop()
    end
end)

-- ///////////////////////////////////////////////////////////////////
-- UI EFFECTS & TOGGLE
-- ///////////////////////////////////////////////////////////////////

-- Animate the UI for a more "alive" feel
local glitchChars = {"S", "P", "I", "D", "E", "R", "C", "H", "E", "A", "T", "#", "*", "@", "!", "$", "%"}
local originalTitle = "S P I D E R C H E A T"

task.spawn(function()
    while task.wait() do
        -- Animate border
        UIGradient.Offset = UIGradient.Offset + Vector2.new(0, 0.02)
        if UIGradient.Offset.Y >= 1 then
            UIGradient.Offset = Vector2.new(0, -1)
        end
        
        -- Title glitch effect
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

-- Toggle menu visibility with the RightControl key
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    -- Ignore input if it's being used for typing in a textbox
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.RightControl then
        MainFrame.Visible = not MainFrame.Visible
    end
end)
