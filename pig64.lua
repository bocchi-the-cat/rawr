if getgenv()._billTP and getgenv()._billTP.cleanup then
    getgenv()._billTP.cleanup()
end

getgenv()._billTP = {}

local tpActive = true -- default: enabled
local running = true
local toggleButton

local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local function getHumanoid()
    return lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
end

local humanoid = getHumanoid()
if not humanoid then
    lp.CharacterAdded:Wait()
    humanoid = getHumanoid()
end

local originalWalkSpeed = humanoid.WalkSpeed
local originalJumpPower = humanoid.JumpPower

-- Create toggle button in CoreGui
local function createButton()
    if toggleButton then toggleButton:Destroy() end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "_BillTPGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game:GetService("CoreGui")

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 180, 0, 40)
    button.Position = UDim2.new(0, 20, 0, 100)
    button.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Text = "[Bill TP] Enabled"
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 18
    button.Parent = screenGui

    button.MouseButton1Click:Connect(function()
        tpActive = not tpActive
        button.Text = "[Bill TP] " .. (tpActive and "Enabled" or "Disabled")
        button.BackgroundColor3 = tpActive and Color3.fromRGB(0, 128, 0) or Color3.fromRGB(128, 0, 0)

        humanoid = getHumanoid()
        if tpActive then
            if humanoid then
                humanoid.WalkSpeed = 0
                humanoid.JumpPower = 0
            end
        else
            if humanoid then
                humanoid.WalkSpeed = originalWalkSpeed
                humanoid.JumpPower = originalJumpPower
            end
        end
    end)

    toggleButton = button
end

createButton()

lp.CharacterAdded:Connect(function(char)
    humanoid = char:WaitForChild("Humanoid")
    if tpActive and humanoid then
        humanoid.WalkSpeed = 0
        humanoid.JumpPower = 0
    end
end)

local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
if not hrp then
    lp.CharacterAdded:Wait()
    repeat wait() hrp = lp.Character:FindFirstChild("HumanoidRootPart") until hrp
end

local bills = workspace:WaitForChild("Collectables"):WaitForChild("Bills")
local delayBetweenTeleports = 0.1

local function getPosition(obj)
    if obj:IsA("BasePart") then
        return obj.Position
    elseif obj:IsA("Model") then
        if obj.PrimaryPart then
            return obj.PrimaryPart.Position
        else
            for _, child in ipairs(obj:GetDescendants()) do
                if child:IsA("BasePart") then
                    return child.Position
                end
            end
        end
    end
    return nil
end

local loopThread = coroutine.create(function()
    while running do
        if tpActive then
            for i, bill in ipairs(bills:GetChildren()) do
                if not running then break end
                if tpActive then
                    local pos = getPosition(bill)
                    if pos then
                        -- Teleport 2 studs down from the model
                        hrp.CFrame = CFrame.new(pos + Vector3.new(0, -2, 0))
                        print(string.format("[Teleport] #%d → %s at %s", i, bill.Name, tostring(pos)))
                    else
                        print(string.format("[Skip] #%d → %s has no valid position", i, bill.Name))
                    end
                    wait(delayBetweenTeleports)
                end
            end
        end
        wait(1)
    end
end)

coroutine.resume(loopThread)

getgenv()._billTP.cleanup = function()
    running = false
    humanoid = getHumanoid()
    if humanoid then
        humanoid.WalkSpeed = originalWalkSpeed
        humanoid.JumpPower = originalJumpPower
    end
    if toggleButton then toggleButton:Destroy() end
    local cg = game:GetService("CoreGui")
    if cg:FindFirstChild("_BillTPGui") then
        cg["_BillTPGui"]:Destroy()
    end
end
