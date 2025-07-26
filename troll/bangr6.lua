-- by pyst
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- Variables
local following = false
local targetPlayer = nil
local animationId = "189854234" -- original animation ID
local animator

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local UsernameBox = Instance.new("TextBox")
local ToggleButton = Instance.new("TextButton")

-- GUI Properties
ScreenGui.Name = "BangV2GUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- Main Frame
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
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 12)
TitleBarCorner.Parent = TitleBar

-- Title Label
Title.Name = "Title"
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "BANG V2"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = TitleBar

-- Close Button
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

-- Content Area
local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, -20, 1, -50)
ContentArea.Position = UDim2.new(0, 10, 0, 40)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

-- Username Section
local UsernameSection = Instance.new("Frame")
UsernameSection.Name = "UsernameSection"
UsernameSection.Size = UDim2.new(1, 0, 0, 50)
UsernameSection.Position = UDim2.new(0, 0, 0, 10)
UsernameSection.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
UsernameSection.BorderSizePixel = 0
UsernameSection.Parent = ContentArea

local UsernameCorner = Instance.new("UICorner")
UsernameCorner.CornerRadius = UDim.new(0, 8)
UsernameCorner.Parent = UsernameSection

local UsernameLabel = Instance.new("TextLabel")
UsernameLabel.Name = "UsernameLabel"
UsernameLabel.Size = UDim2.new(0.4, 0, 1, 0)
UsernameLabel.Position = UDim2.new(0, 10, 0, 0)
UsernameLabel.BackgroundTransparency = 1
UsernameLabel.Text = "TARGET"
UsernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
UsernameLabel.TextScaled = true
UsernameLabel.Font = Enum.Font.GothamBold
UsernameLabel.Parent = UsernameSection

-- Username Input Box
UsernameBox.Name = "UsernameBox"
UsernameBox.Size = UDim2.new(0.5, 0, 0.7, 0)
UsernameBox.Position = UDim2.new(0.45, 0, 0.15, 0)
UsernameBox.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
UsernameBox.BorderSizePixel = 0
UsernameBox.Font = Enum.Font.Gotham
UsernameBox.PlaceholderText = "Username"
UsernameBox.Text = ""
UsernameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
UsernameBox.TextScaled = true
UsernameBox.Parent = UsernameSection

local UsernameBoxCorner = Instance.new("UICorner")
UsernameBoxCorner.CornerRadius = UDim.new(0, 6)
UsernameBoxCorner.Parent = UsernameBox

-- Toggle Section
local ToggleSection = Instance.new("Frame")
ToggleSection.Name = "ToggleSection"
ToggleSection.Size = UDim2.new(1, 0, 0, 50)
ToggleSection.Position = UDim2.new(0, 0, 0, 70)
ToggleSection.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
ToggleSection.BorderSizePixel = 0
ToggleSection.Parent = ContentArea

local ToggleSectionCorner = Instance.new("UICorner")
ToggleSectionCorner.CornerRadius = UDim.new(0, 8)
ToggleSectionCorner.Parent = ToggleSection

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.Name = "ToggleLabel"
ToggleLabel.Size = UDim2.new(0.4, 0, 1, 0)
ToggleLabel.Position = UDim2.new(0, 10, 0, 0)
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Text = "BANG"
ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleLabel.TextScaled = true
ToggleLabel.Font = Enum.Font.GothamBold
ToggleLabel.Parent = ToggleSection

-- Toggle Button
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0.5, 0, 0.7, 0)
ToggleButton.Position = UDim2.new(0.45, 0, 0.15, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
ToggleButton.BorderSizePixel = 0
ToggleButton.Text = "OFF"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextScaled = true
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Parent = ToggleSection

local ToggleButtonCorner = Instance.new("UICorner")
ToggleButtonCorner.CornerRadius = UDim.new(0, 6)
ToggleButtonCorner.Parent = ToggleButton



-- GUI Logic
CloseButton.MouseButton1Click:Connect(function()
    if following then
        following = false
        if ToggleButton then
            ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
            ToggleButton.Text = "OFF"
        end
        if animator then
            animator:Stop()
            animator = nil
        end
    end
    ScreenGui:Destroy()
end)

ToggleButton.MouseButton1Click:Connect(function()
    if not following then
        local targetName = UsernameBox.Text:lower()
        targetPlayer = nil
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Name:lower():find(targetName) or player.DisplayName:lower():find(targetName) then
                targetPlayer = player
                break
            end
        end
        if targetPlayer and targetPlayer.Character then
            following = true
            ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
            ToggleButton.Text = "ON"
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://" .. animationId
            animator = humanoid:LoadAnimation(animation)
            coroutine.wrap(function()
                while following do
                    local targetCharacter = targetPlayer.Character
                    if targetCharacter and targetCharacter.PrimaryPart then
                        local targetCFrame = targetCharacter.PrimaryPart.CFrame
                        local followCFrame = targetCFrame * CFrame.new(0, 0, 1.2)
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(
                            CFrame.new(followCFrame.Position) *
                            CFrame.Angles(0, math.atan2(-targetCFrame.LookVector.X, -targetCFrame.LookVector.Z), 0)
                        )
                        animator:Play()
                        task.wait(0.1)
                        animator:Stop()
                        task.wait(0.1)
                    else
                        following = false
                        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
                        ToggleButton.Text = "OFF"
                        break
                    end
                end
            end)()
        else
            print("Target not found!")
        end
    else
        following = false
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        ToggleButton.Text = "OFF"
        if animator then
            animator:Stop()
            animator = nil
        end
    end
end)