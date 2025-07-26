-- Variables
local running = false
local originalGravity
local attachmentLoop
local animTrack
local targetPlayer
local minimized = false

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local UsernameBox = Instance.new("TextBox")
local ToggleButton = Instance.new("TextButton")

-- GUI Properties
ScreenGui.Name = "GetSuckedGUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.Size = UDim2.new(0, 320, 0, 200)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -100)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(60, 60, 80)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- Title Bar
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BorderSizePixel = 0

local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 12)
TitleBarCorner.Parent = TitleBar

-- Title Label
Title.Name = "Title"
Title.Parent = TitleBar
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "Get Sucked"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button
CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -40, 0, 5)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true
CloseButton.BorderSizePixel = 0

local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(0, 6)
CloseButtonCorner.Parent = CloseButton

-- Minimize Button
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = TitleBar
MinimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -75, 0, 5)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextScaled = true
MinimizeButton.BorderSizePixel = 0

local MinimizeButtonCorner = Instance.new("UICorner")
MinimizeButtonCorner.CornerRadius = UDim.new(0, 6)
MinimizeButtonCorner.Parent = MinimizeButton

-- Content Area
local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, -20, 1, -60)
ContentArea.Position = UDim2.new(0, 10, 0, 50)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

-- Username Input Box
UsernameBox.Name = "UsernameBox"
UsernameBox.Parent = ContentArea
UsernameBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
UsernameBox.Size = UDim2.new(1, 0, 0, 40)
UsernameBox.Position = UDim2.new(0, 0, 0, 0)
UsernameBox.Font = Enum.Font.Gotham
UsernameBox.PlaceholderText = "Target's Username"
UsernameBox.Text = ""
UsernameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
UsernameBox.TextSize = 18
UsernameBox.BorderSizePixel = 0

local UsernameBoxCorner = Instance.new("UICorner")
UsernameBoxCorner.CornerRadius = UDim.new(0, 10)
UsernameBoxCorner.Parent = UsernameBox

-- Toggle Button
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ContentArea
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
ToggleButton.Size = UDim2.new(1, 0, 0, 40)
ToggleButton.Position = UDim2.new(0, 0, 0, 60)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "Start"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 18
ToggleButton.BorderSizePixel = 0

local ToggleButtonCorner = Instance.new("UICorner")
ToggleButtonCorner.CornerRadius = UDim.new(0, 10)
ToggleButtonCorner.Parent = ToggleButton

-- GUI Logic

MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    MainFrame.Size = minimized and UDim2.new(0, 300, 0, 30) or UDim2.new(0, 300, 0, 150)
end)

CloseButton.MouseButton1Click:Connect(function()
    -- If running, turn off the feature first
    if running then
        if ToggleButton then
            ToggleButton.Text = "Start"
            ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
        end
        running = false
        if originalGravity then
            workspace.Gravity = originalGravity
        end
        if attachmentLoop then
            attachmentLoop:Disconnect()
        end
        if animTrack then
            animTrack:Stop()
        end
    end
    ScreenGui:Destroy()
end)

ToggleButton.MouseButton1Click:Connect(function()
    if not running then
        ToggleButton.Text = "Stop"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        running = true

        local victim = UsernameBox.Text:lower()

        -- Find target player by matching either username or display name
        for _, player in pairs(game.Players:GetPlayers()) do
            if string.find(player.Name:lower(), victim) or string.find(player.DisplayName:lower(), victim) then
                targetPlayer = player
                break
            end
        end

        if targetPlayer then
            local localPlayer = game.Players.LocalPlayer
            local humanoidRootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
            local targetRootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart and targetRootPart then
                originalGravity = workspace.Gravity
                workspace.Gravity = 0

                while running and humanoidRootPart and targetRootPart and humanoidRootPart.Position.Y <= 44 do
                    wait()
                    humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 1.5, 0)
                end

                wait(1)

                -- Attach to the target player
                attachmentLoop = game:GetService("RunService").Stepped:Connect(function()
                    humanoidRootPart.CFrame = targetRootPart.CFrame * CFrame.new(0, 2.3, -1.1) * CFrame.Angles(0, math.pi, 0)
                    humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                end)

                wait(1)

                -- Play animation
                local animationId = "rbxassetid://5918726674" -- Replace with valid animation ID
                local animation = Instance.new('Animation')
                animation.AnimationId = animationId

                local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    animTrack = humanoid:LoadAnimation(animation)
                    animTrack:Play()
                    animTrack:AdjustSpeed(1)
                end

            end
        end
    else
        ToggleButton.Text = "Start"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        running = false
        if originalGravity then
            workspace.Gravity = originalGravity
        end
        if attachmentLoop then
            attachmentLoop:Disconnect()
        end
        if animTrack then
            animTrack:Stop()
        end
    end
end)