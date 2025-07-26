-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- Create the ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GetBangedR6"
ScreenGui.Parent = game.CoreGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 200)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

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
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 12)
TitleBarCorner.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(0.7, 0, 1, 0)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "GET BANGED R6"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -40, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = TitleBar

local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(0, 6)
CloseButtonCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    -- Stop the feature if it's running
    if following then
        following = false
        if activeAnimation then
            activeAnimation:Stop()
            activeAnimation = nil
        end
    end
    ScreenGui:Destroy()
end)

-- Content Area
local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, -20, 1, -50)
ContentArea.Position = UDim2.new(0, 10, 0, 40)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

-- Target Input Section
local TargetSection = Instance.new("Frame")
TargetSection.Name = "TargetSection"
TargetSection.Size = UDim2.new(1, 0, 0, 50)
TargetSection.Position = UDim2.new(0, 0, 0, 10)
TargetSection.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TargetSection.BorderSizePixel = 0
TargetSection.Parent = ContentArea

local TargetCorner = Instance.new("UICorner")
TargetCorner.CornerRadius = UDim.new(0, 8)
TargetCorner.Parent = TargetSection

local TargetLabel = Instance.new("TextLabel")
TargetLabel.Name = "TargetLabel"
TargetLabel.Size = UDim2.new(0.3, 0, 1, 0)
TargetLabel.Position = UDim2.new(0, 10, 0, 0)
TargetLabel.BackgroundTransparency = 1
TargetLabel.Text = "TARGET"
TargetLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetLabel.TextScaled = true
TargetLabel.Font = Enum.Font.GothamBold
TargetLabel.Parent = TargetSection

local TargetTextBox = Instance.new("TextBox")
TargetTextBox.Name = "TargetTextBox"
TargetTextBox.Size = UDim2.new(0.6, 0, 0.7, 0)
TargetTextBox.Position = UDim2.new(0.35, 0, 0.15, 0)
TargetTextBox.PlaceholderText = "Enter target name"
TargetTextBox.Text = ""
TargetTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetTextBox.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
TargetTextBox.BorderSizePixel = 0
TargetTextBox.TextScaled = true
TargetTextBox.Font = Enum.Font.Gotham
TargetTextBox.Parent = TargetSection

local TargetTextBoxCorner = Instance.new("UICorner")
TargetTextBoxCorner.CornerRadius = UDim.new(0, 6)
TargetTextBoxCorner.Parent = TargetTextBox

-- Toggle Button Section
local ToggleSection = Instance.new("Frame")
ToggleSection.Name = "ToggleSection"
ToggleSection.Size = UDim2.new(1, 0, 0, 50)
ToggleSection.Position = UDim2.new(0, 0, 0, 70)
ToggleSection.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
ToggleSection.BorderSizePixel = 0
ToggleSection.Parent = ContentArea

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleSection

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.Name = "ToggleLabel"
ToggleLabel.Size = UDim2.new(0.3, 0, 1, 0)
ToggleLabel.Position = UDim2.new(0, 10, 0, 0)
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Text = "STATUS"
ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleLabel.TextScaled = true
ToggleLabel.Font = Enum.Font.GothamBold
ToggleLabel.Parent = ToggleSection

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0.6, 0, 0.7, 0)
ToggleButton.Position = UDim2.new(0.35, 0, 0.15, 0)
ToggleButton.Text = "START"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
ToggleButton.BorderSizePixel = 0
ToggleButton.TextScaled = true
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Parent = ToggleSection

local ToggleButtonCorner = Instance.new("UICorner")
ToggleButtonCorner.CornerRadius = UDim.new(0, 6)
ToggleButtonCorner.Parent = ToggleButton

-- Instructions
local InstructionsLabel = Instance.new("TextLabel")
InstructionsLabel.Name = "InstructionsLabel"
InstructionsLabel.Size = UDim2.new(1, 0, 0, 60)
InstructionsLabel.Position = UDim2.new(0, 0, 0, 130)
InstructionsLabel.BackgroundTransparency = 1
InstructionsLabel.Text = "Enter target name and click START\nAutomatically follows and bangs target"
InstructionsLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
InstructionsLabel.TextScaled = true
InstructionsLabel.Font = Enum.Font.Gotham
InstructionsLabel.Parent = ContentArea

-- Functionality
local following = false
local targetPlayer = nil
local animationId = "189854234"
local activeAnimation

ToggleButton.MouseButton1Click:Connect(function()
    if not following then
        -- Start following
        local targetName = TargetTextBox.Text:lower()
        targetPlayer = nil
        
        for _, player in pairs(Players:GetPlayers()) do
            if player.Name:lower():find(targetName) or player.DisplayName:lower():find(targetName) then
                targetPlayer = player
                break
            end
        end
        
        if targetPlayer and targetPlayer.Character then
            following = true
            ToggleButton.Text = "STOP"
            ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
            
            -- Play Animation
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                local animation = Instance.new("Animation")
                animation.AnimationId = "rbxassetid://" .. animationId
                activeAnimation = humanoid:LoadAnimation(animation)
                activeAnimation:Play()
            end

            coroutine.wrap(function()
                local lastPosition = nil
                while following do
                    local targetCharacter = targetPlayer.Character
                    if targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = targetCharacter.HumanoidRootPart
                        local targetPosition = targetHRP.Position
                        local targetLookVector = targetHRP.CFrame.LookVector

                        -- Position in front of the target
                        local forwardCFrame = targetHRP.CFrame * CFrame.new(0, 0, -2.5) -- Slightly forward
                        local backwardCFrame = targetHRP.CFrame * CFrame.new(0, 0, -1.3) -- Much closer to target

                        -- Forward motion
                        local tweenForward = TweenService:Create(
                            LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),
                            TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                            {CFrame = forwardCFrame}
                        )
                        tweenForward:Play()
                        tweenForward.Completed:Wait()

                        -- Backward motion
                        local tweenBackward = TweenService:Create(
                            LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),
                            TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                            {CFrame = backwardCFrame}
                        )
                        tweenBackward:Play()
                        tweenBackward.Completed:Wait()

                        -- Stop if target becomes invalid
                        lastPosition = targetPosition
                    else
                        following = false
                        ToggleButton.Text = "START"
                        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
                        break
                    end
                end
            end)()
        else
            print("Target not found!")
        end
    else
        -- Stop following
        following = false
        ToggleButton.Text = "START"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        
        -- Stop Animation
        if activeAnimation then
            activeAnimation:Stop()
            activeAnimation = nil
        end
    end
end)