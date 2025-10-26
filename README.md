evade:
```
getgenv().farmTickets = false
getgenv().farmRevives = false
getgenv().noRender = false
getgenv().TrackMePlease = true -- optional tracking (i promise it doesnt track if set to false)

loadstring(game:HttpGet('https://raw.githubusercontent.com/bocchi-the-cat/rawr/refs/heads/main/evade.lua'))()
```
piggy:
```
getgenv().TrackMePlease = true -- optional tracking
loadstring(game:HttpGet('https://raw.githubusercontent.com/bocchi-the-cat/rawr/refs/heads/main/piggy.lua'))()
```
no render (open source) :
```
loadstring(game:HttpGet('https://raw.githubusercontent.com/bocchi-the-cat/rawr/refs/heads/main/no%20render.lua'))()
-- to disable execute it again :) 
```

Vulnerable Point (Entry point by yessor ARCHIVE):
```
VPstarterSettings = {}
VPstarterSettings.profile = "" -- Put in value to change profile, leave blank for default
VPstarterSettings.keybindAllow = true -- Keybind Enabled or not

loadstring(game:HttpGet('https://raw.githubusercontent.com/bocchi-the-cat/rawr/refs/heads/main/archive/VulnerablePoint.lua'))()
```
