-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SuckR6GUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- Main Frame
local MainFrame = Instance.new("Frame")
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
local TitleBar = Instance.new("Frame")
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
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = TitleBar
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "SUCK R6"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button
local CloseButton = Instance.new("TextButton")
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
local MinimizeButton = Instance.new("TextButton")
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
ContentArea.Size = UDim2.new(1, -20, 1, -50)
ContentArea.Position = UDim2.new(0, 10, 0, 40)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

-- Username Input Box
local UsernameBox = Instance.new("TextBox")
UsernameBox.Name = "UsernameBox"
UsernameBox.Parent = ContentArea
UsernameBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
UsernameBox.Size = UDim2.new(1, 0, 0, 40)
UsernameBox.Position = UDim2.new(0, 0, 0, 10)
UsernameBox.Font = Enum.Font.Gotham
UsernameBox.PlaceholderText = "Target's Username"
UsernameBox.Text = ""
UsernameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
UsernameBox.TextScaled = true
local UsernameBoxCorner = Instance.new("UICorner")
UsernameBoxCorner.CornerRadius = UDim.new(0, 8)
UsernameBoxCorner.Parent = UsernameBox

-- Toggle Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ContentArea
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
ToggleButton.Size = UDim2.new(1, 0, 0, 40)
ToggleButton.Position = UDim2.new(0, 0, 0, 60)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "Start"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextScaled = true
ToggleButton.BorderSizePixel = 0
local ToggleButtonCorner = Instance.new("UICorner")
ToggleButtonCorner.CornerRadius = UDim.new(0, 8)
ToggleButtonCorner.Parent = ToggleButton

-- Instructions Label
local InstructionsLabel = Instance.new("TextLabel")
InstructionsLabel.Name = "InstructionsLabel"
InstructionsLabel.Parent = ContentArea
InstructionsLabel.Size = UDim2.new(1, 0, 0, 40)
InstructionsLabel.Position = UDim2.new(0, 0, 0, 110)
InstructionsLabel.BackgroundTransparency = 1
InstructionsLabel.Text = "Enter username and press Start."
InstructionsLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
InstructionsLabel.TextScaled = true
InstructionsLabel.Font = Enum.Font.Gotham

-- GUI Logic
local minimized = false
local running = false
local originalGravity
local attachmentLoop
local animTrack
local targetPlayer

MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    MainFrame.Size = minimized and UDim2.new(0, 320, 0, 40) or UDim2.new(0, 320, 0, 200)
    ContentArea.Visible = not minimized
end)

CloseButton.MouseButton1Click:Connect(function()
    -- Turn off the feature if it's running
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
            attachmentLoop = nil
        end
        if animTrack then
            animTrack:Stop()
            animTrack = nil
        end
    end
    ScreenGui:Destroy()
end)

ToggleButton.MouseButton1Click:Connect(function()
    if not running then
        ToggleButton.Text = "Stop"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
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

            -- Find the target's torso or lower body part (Pelvis area)
            local targetTorso = targetPlayer.Character:FindFirstChild("LowerTorso") or targetPlayer.Character:FindFirstChild("UpperTorso")

            if humanoidRootPart and targetRootPart and targetTorso then
                originalGravity = workspace.Gravity
                workspace.Gravity = 0 -- Set gravity to 0 to keep the character floating

                -- Play animation
                local animationId = "rbxassetid://178130996" -- Replace with valid animation ID
                local animation = Instance.new('Animation')
                animation.AnimationId = animationId

                local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    animTrack = humanoid:LoadAnimation(animation)
                    animTrack:Play()
                    animTrack:AdjustSpeed(1)
                end

                -- Attach the local player character to the target character's torso (this does not loop)
                attachmentLoop = game:GetService("RunService").Heartbeat:Connect(function()
                    if running then
                        -- Update the local player's position to be in front of the target's torso
                        humanoidRootPart.CFrame = targetTorso.CFrame * CFrame.new(0, -2.3, -1.0) * CFrame.Angles(0, math.pi, 0)
                    end
                end)
            end
        end
    else
        -- Stop the process and everything running
        ToggleButton.Text = "Start"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
        running = false

        -- Restore gravity
        if originalGravity then
            workspace.Gravity = originalGravity
        end

        -- Disconnect loops and stop animations
        if attachmentLoop then
            attachmentLoop:Disconnect() -- Disconnect the attachment loop
            attachmentLoop = nil -- Clear the loop variable to prevent accidental access
        end
        if animTrack then
            animTrack:Stop() -- Stop the animation
            animTrack = nil -- Clear the animation variable
        end
    end
end)