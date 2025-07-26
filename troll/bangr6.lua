-- by pyst
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- Create the ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "BangV2GUI"

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

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = MainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(60, 60, 80)
mainStroke.Thickness = 2
mainStroke.Parent = MainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
titleBar.BorderSizePixel = 0
titleBar.Parent = MainFrame

local titleBarCorner = Instance.new("UICorner")
titleBarCorner.CornerRadius = UDim.new(0, 12)
titleBarCorner.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(0.7, 0, 1, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "BANG V2"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = titleBar

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = true
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = titleBar

local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0, 6)
closeButtonCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
    -- Turn off the feature if it's on before closing
    if following then
        following = false
        toggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        toggleButton.Text = "OFF"
    end
    ScreenGui:Destroy()
end)

-- Content Area
local contentArea = Instance.new("Frame")
contentArea.Name = "ContentArea"
contentArea.Size = UDim2.new(1, -20, 1, -50)
contentArea.Position = UDim2.new(0, 10, 0, 40)
contentArea.BackgroundTransparency = 1
contentArea.Parent = MainFrame

-- Target Input Section
local targetSection = Instance.new("Frame")
targetSection.Name = "TargetSection"
targetSection.Size = UDim2.new(1, 0, 0, 50)
targetSection.Position = UDim2.new(0, 0, 0, 10)
targetSection.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
targetSection.BorderSizePixel = 0
targetSection.Parent = contentArea

local targetCorner = Instance.new("UICorner")
targetCorner.CornerRadius = UDim.new(0, 8)
targetCorner.Parent = targetSection

local targetLabel = Instance.new("TextLabel")
targetLabel.Name = "TargetLabel"
targetLabel.Size = UDim2.new(0.3, 0, 1, 0)
targetLabel.Position = UDim2.new(0, 10, 0, 0)
targetLabel.BackgroundTransparency = 1
targetLabel.Text = "TARGET"
targetLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
targetLabel.TextScaled = true
targetLabel.Font = Enum.Font.GothamBold
targetLabel.Parent = targetSection

local targetTextBox = Instance.new("TextBox")
targetTextBox.Name = "TargetTextBox"
targetTextBox.Size = UDim2.new(0.6, 0, 0.7, 0)
targetTextBox.Position = UDim2.new(0.35, 0, 0.15, 0)
targetTextBox.PlaceholderText = "Enter target name"
targetTextBox.Text = ""
targetTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
targetTextBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
targetTextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
targetTextBox.BorderSizePixel = 0
targetTextBox.TextScaled = true
targetTextBox.Font = Enum.Font.Gotham
targetTextBox.Parent = targetSection

local textBoxCorner = Instance.new("UICorner")
textBoxCorner.CornerRadius = UDim.new(0, 6)
textBoxCorner.Parent = targetTextBox

-- Toggle Section
local toggleSection = Instance.new("Frame")
toggleSection.Name = "ToggleSection"
toggleSection.Size = UDim2.new(1, 0, 0, 50)
toggleSection.Position = UDim2.new(0, 0, 0, 70)
toggleSection.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
toggleSection.BorderSizePixel = 0
toggleSection.Parent = contentArea

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 8)
toggleCorner.Parent = toggleSection

local toggleLabel = Instance.new("TextLabel")
toggleLabel.Name = "ToggleLabel"
toggleLabel.Size = UDim2.new(0.4, 0, 1, 0)
toggleLabel.Position = UDim2.new(0, 10, 0, 0)
toggleLabel.BackgroundTransparency = 1
toggleLabel.Text = "BANG"
toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleLabel.TextScaled = true
toggleLabel.Font = Enum.Font.GothamBold
toggleLabel.Parent = toggleSection

local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0.5, 0, 0.7, 0)
toggleButton.Position = UDim2.new(0.45, 0, 0.15, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
toggleButton.BorderSizePixel = 0
toggleButton.Text = "OFF"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextScaled = true
toggleButton.Font = Enum.Font.GothamBold
toggleButton.Parent = toggleSection

local toggleButtonCorner = Instance.new("UICorner")
toggleButtonCorner.CornerRadius = UDim.new(0, 6)
toggleButtonCorner.Parent = toggleButton

-- Instructions
local instructionsLabel = Instance.new("TextLabel")
instructionsLabel.Name = "InstructionsLabel"
instructionsLabel.Size = UDim2.new(1, 0, 0, 60)
instructionsLabel.Position = UDim2.new(0, 0, 0, 130)
instructionsLabel.BackgroundTransparency = 1
instructionsLabel.Text = "Enter target name and click BANG\nto start following them"
instructionsLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
instructionsLabel.TextScaled = true
instructionsLabel.Font = Enum.Font.Gotham
instructionsLabel.Parent = contentArea

-- Functionality
local following = false
local targetPlayer = nil
local animationId = "189854234" -- 182789003 use this id if u prefer

toggleButton.MouseButton1Click:Connect(function()
    if not following then
        -- Start following
        local targetName = targetTextBox.Text:lower()
        targetPlayer = nil
        
        for _, player in pairs(Players:GetPlayers()) do
            if player.Name:lower():find(targetName) or player.DisplayName:lower():find(targetName) then
                targetPlayer = player
                break
            end
        end
        
        if targetPlayer and targetPlayer.Character then
            following = true
            toggleButton.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
            toggleButton.Text = "ON"
            
            -- Animation
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://" .. animationId
            local animator = humanoid:LoadAnimation(animation)

            coroutine.wrap(function()
                local lastCFrame = nil
                while following do
                    local targetCharacter = targetPlayer.Character
                    if targetCharacter and targetCharacter.PrimaryPart then
                        local targetCFrame = targetCharacter.PrimaryPart.CFrame
                        
                        -- Position your character behind and face the target
                        local followCFrame = targetCFrame * CFrame.new(0, 0, 1.2) -- Slightly closer to the target
                        
                        if not lastCFrame or (followCFrame.Position - lastCFrame.Position).Magnitude > 0.1 or
                            (followCFrame.LookVector - lastCFrame.LookVector).Magnitude > 0.1 then
                            lastCFrame = followCFrame

                            -- Move behind the target and face it
                            LocalPlayer.Character:SetPrimaryPartCFrame(
                                CFrame.new(followCFrame.Position) *
                                CFrame.Angles(0, math.atan2(-targetCFrame.LookVector.X, -targetCFrame.LookVector.Z), 0)
                            )
                        end
                        
                        -- Play animation
                        animator:Play()
                        task.wait(0.1)
                        animator:Stop()
                        task.wait(0.1)
                    else
                        -- Stop if target is invalid
                        following = false
                        toggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
                        toggleButton.Text = "OFF"
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
        toggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        toggleButton.Text = "OFF"
    end
end)