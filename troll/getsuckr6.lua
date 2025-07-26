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
local UsernameBox = Instance.new("TextBox")
local ToggleButton = Instance.new("TextButton")

-- GUI Properties
ScreenGui.Name = "GetSuckedGUI"
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
Title.Text = "Get Sucked"
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
ToggleLabel.Text = "STATUS"
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
ToggleButton.Text = "Start"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextScaled = true
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Parent = ToggleSection

local ToggleButtonCorner = Instance.new("UICorner")
ToggleButtonCorner.CornerRadius = UDim.new(0, 6)
ToggleButtonCorner.Parent = ToggleButton

-- Instructions
local InstructionsLabel = Instance.new("TextLabel")
InstructionsLabel.Name = "InstructionsLabel"
InstructionsLabel.Size = UDim2.new(1, 0, 0, 40)
InstructionsLabel.Position = UDim2.new(0, 0, 0, 130)
InstructionsLabel.BackgroundTransparency = 1
InstructionsLabel.Text = "Enter username and click Start"
InstructionsLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
InstructionsLabel.TextScaled = true
InstructionsLabel.Font = Enum.Font.Gotham
InstructionsLabel.Parent = ContentArea

-- GUI Logic
CloseButton.MouseButton1Click:Connect(function()
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
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        running = true

        local victim = UsernameBox.Text:lower()

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

                attachmentLoop = game:GetService("RunService").Stepped:Connect(function()
                    humanoidRootPart.CFrame = targetRootPart.CFrame * CFrame.new(0, 2.3, -1.1) * CFrame.Angles(0, math.pi, 0)
                    humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                end)

                wait(1)

                local animationId = "rbxassetid://148840371"
                local animation = Instance.new('Animation')
                animation.AnimationId = animationId

                local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    animTrack = humanoid:LoadAnimation(animation)
                    animTrack:Play()
                    animTrack:AdjustSpeed(3)
                end
            end
        end
    else
        ToggleButton.Text = "Start"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
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