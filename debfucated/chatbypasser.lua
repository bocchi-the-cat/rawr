-- https://www.reddit.com/r/robloxhackers/s/0c664HbdJv
if _G.CrisisLoaded then
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "CRISIS",
		Text = "Already loaded",
		Duration = 5
	})
	return
end

_G.CrisisLoaded = true

-- removed set clipboard on load bc fuck you

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Discord Invite",
	Text = "Invite copied! Paste it in your browser. Made by CRISIS deobsfucked by humans",
	Duration = 5
})

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "WARNINGG",
	Text = "don't spam the same message  or it will end up tagging ",
	Duration = 15
})

local playerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CrisisGUI"
screenGui.Parent = playerGui
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false

local loadingMainFrame = Instance.new("Frame")
loadingMainFrame.Name = "MainFrame"
loadingMainFrame.Size = UDim2.new(1, 0, 1, 0)
loadingMainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
loadingMainFrame.Parent = screenGui

local loadingTitleLabel = Instance.new("TextLabel")
loadingTitleLabel.Name = "Title"
loadingTitleLabel.Size = UDim2.new(1, 0, 0, 150)
loadingTitleLabel.Position = UDim2.new(0, 0, 0.35, 0)
loadingTitleLabel.BackgroundTransparency = 1
loadingTitleLabel.Text = "CRISIS"
loadingTitleLabel.Font = Enum.Font.GothamBlack
loadingTitleLabel.TextSize = 90
loadingTitleLabel.TextColor3 = Color3.new(1, 1, 1)
loadingTitleLabel.TextStrokeTransparency = 1
loadingTitleLabel.Parent = loadingMainFrame

-- wtf
local effects = {}
for i = 1, 50 do
	local clone = loadingTitleLabel:Clone()
	clone.Name = "TitleEffect"
	clone.TextTransparency = 0.7
	clone.TextColor3 = Color3.new(1, 1, 1)
	clone.Position = clone.Position + UDim2.new(0, math.random(-5, 5), 0, math.random(-5, 5))
	clone.ZIndex = 0
	clone.Parent = loadingMainFrame
	table.insert(effects, clone)
end

local authorLabel = Instance.new("TextLabel")
authorLabel.Name = "Author"
authorLabel.Size = UDim2.new(1, 0, 0, 30)
authorLabel.Position = UDim2.new(0, 0, 0.55, 0)
authorLabel.BackgroundTransparency = 1
authorLabel.Text = "-made by swzzychrist and twig defucked by humans"
authorLabel.Font = Enum.Font.Gotham
authorLabel.TextSize = 20
authorLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
authorLabel.Parent = loadingMainFrame

local progressFrame = Instance.new("Frame")
progressFrame.Name = "ProgressFrame"
progressFrame.Size = UDim2.new(0.6, 0, 0.05, 0)
progressFrame.Position = UDim2.new(0.2, 0, 0.8, 0)
progressFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
progressFrame.Parent = loadingMainFrame

local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(0, 8)
progressCorner.Parent = progressFrame

local progressBar = Instance.new("Frame")
progressBar.Name = "ProgressBar"
progressBar.Size = UDim2.new(0, 0, 1, 0) -- Starts at 0 width
progressBar.BackgroundColor3 = Color3.new(1, 1, 1)
progressBar.Parent = progressFrame

local progressBarCorner = Instance.new("UICorner")
progressBarCorner.CornerRadius = UDim.new(0, 8)
progressBarCorner.Parent = progressBar

-- useless ahhh
task.spawn(function()
	progressBar:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 2)
end)


--[[
	bypass/character replacment
]]

local charMap = {
	a = "ส", b = "ხ", c = "ϲ", d = "d", e = "ҿ", f = "ƭ", g = "ɡ", h = "ꜧ", i = "เ่", j = "j",
	k = "ϗ", l = "Ɩ", m = "m", n = "ถ", o = "o", p = "p", q = "q", r = "ꞅ", s = "ऽ", t = "t",
	u = "ม", v = "v", w = "ѡ", x = "ӽ", y = "ⴘ", z = "z",
	["1"] = "1", ["2"] = "2", ["3"] = "3", ["4"] = "4", ["5"] = "5", ["6"] = "6", ["7"] = "7", ["8"] = "8", ["9"] = "9", ["0"] = "0",
	[" "] = " "
}

local function transformText(text)
	local newText = ""
	for i = 1, #text do
		local char = text:sub(i, i):lower()
		newText = newText .. (charMap[char] or char)
	end
	return newText
end

task.wait(3)
screenGui:Destroy()

--[[
	thebypassgui
]]

local mainGui = Instance.new("ScreenGui")
mainGui.Name = "MainGui"
mainGui.Parent = playerGui

local crisisMainFrame = Instance.new("Frame")
crisisMainFrame.Size = UDim2.new(0, 300, 0, 250)
crisisMainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
crisisMainFrame.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
crisisMainFrame.Active = true
crisisMainFrame.Draggable = true
crisisMainFrame.Parent = mainGui

local crisisMainFrameCorner = Instance.new("UICorner")
crisisMainFrameCorner.CornerRadius = UDim.new(0, 12)
crisisMainFrameCorner.Parent = crisisMainFrame

local crisisMainFrameGradient = Instance.new("UIGradient")
crisisMainFrameGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(76, 76, 76)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(51, 51, 51))
})
crisisMainFrameGradient.Rotation = 90
crisisMainFrameGradient.Parent = crisisMainFrame

local crisisTitleLabel = Instance.new("TextLabel")
crisisTitleLabel.Size = UDim2.new(1, 0, 0, 40)
crisisTitleLabel.Position = UDim2.new(0, 0, 0, 0)
crisisTitleLabel.Text = "CRISIS"
crisisTitleLabel.BackgroundTransparency = 1
crisisTitleLabel.TextColor3 = Color3.new(1, 1, 1)
crisisTitleLabel.Font = Enum.Font.GothamBold
crisisTitleLabel.TextSize = 22
crisisTitleLabel.Parent = crisisMainFrame

local messageBox = Instance.new("TextBox")
messageBox.Size = UDim2.new(0.9, 0, 0, 40)
messageBox.Position = UDim2.new(0.05, 0, 0.25, 0)
messageBox.PlaceholderText = "Enter your message..."
messageBox.Text = ""
messageBox.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
messageBox.TextColor3 = Color3.new(1, 1, 1)
messageBox.ClearTextOnFocus = false
messageBox.Parent = crisisMainFrame

local messageBoxCorner = Instance.new("UICorner")
messageBoxCorner.CornerRadius = UDim.new(0, 8)
messageBoxCorner.Parent = messageBox

local sendButton = Instance.new("TextButton")
sendButton.Size = UDim2.new(0.9, 0, 0, 40)
sendButton.Position = UDim2.new(0.05, 0, 0.55, 0)
sendButton.Text = "Send"
sendButton.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
sendButton.TextColor3 = Color3.new(1, 1, 1)
sendButton.Parent = crisisMainFrame

local sendButtonCorner = Instance.new("UICorner")
sendButtonCorner.CornerRadius = UDim.new(0, 8)
sendButtonCorner.Parent = sendButton

local supportButton = Instance.new("TextButton")
supportButton.Size = UDim2.new(0.9, 0, 0, 40)
supportButton.Position = UDim2.new(0.05, 0, 0.75, 0)
supportButton.Text = "Support"
supportButton.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
supportButton.TextColor3 = Color3.new(1, 1, 1)
supportButton.Parent = crisisMainFrame

local supportButtonCorner = Instance.new("UICorner")
supportButtonCorner.CornerRadius = UDim.new(0, 8)
supportButtonCorner.Parent = supportButton


sendButton.MouseButton1Click:Connect(function()
    local text = messageBox.Text
    if text and text ~= "" then
        local transformedMessage = transformText(text)
        pcall(function()
            local TextChatService = game:GetService("TextChatService")
            local GeneralChannel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
            if GeneralChannel then
                GeneralChannel:SendAsync(transformedMessage)
            else
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "CRISIS",
                    Text = "Chat channel not found!",
                    Duration = 5
                })
            end
        end)
        messageBox.Text = ""
    end
end)

supportButton.MouseButton1Click:Connect(function()
    pcall(function()
        setclipboard("https://voxlis.com") -- nothing better to point this to
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Support",
            Text = "Discord invite copied! Paste it in your browser.",
            Duration = 5
        })
    end)
end)