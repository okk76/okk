local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "Script",
   LoadingTitle = "Script",
   LoadingSubtitle = "Script", 
})

local Tab = Window:CreateTab("Player", 7992557358)

local Section = Tab:CreateSection("Settings")

local Slider = Tab:CreateSlider({
   Name = "Speed",
   Range = {0, 500},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 16,
   Flag = "Slider1",
   Callback = function(Value)
   if Value == 69 then
	   print("ВАААА шесдесят девят посхалко")
   else
      print(Value)

	  end
      
      local character = game.Players.LocalPlayer.Character
      if character and character:FindFirstChild("Humanoid") then
          character.Humanoid.WalkSpeed = Value
		  
      end
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Disable Crouch",
   CurrentValue = false,
   Callback = function(Value)
   game.Players.LocalPlayer.Character.BobbingAndCrouch.Disable = Value
   end,
})

local Slider = Tab:CreateSlider({
   Name = "JumpPower",
   Range = {0, 500},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 50,
   Flag = "Slider1",
   Callback = function(Value)
   if Value == 69 then
	   print("ВАААА шесдесят девят посхалко")
   else
      print(Value)

	  end
      
      local character = game.Players.LocalPlayer.Character
      if character and character:FindFirstChild("Humanoid") then
          character.Humanoid.JumpPower = Value
		  
      end
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Gravity",
   Range = {0, 500},
   Increment = 1,
   Suffix = " ",
   CurrentValue = 196,
   Flag = "Slider1",
   Callback = function(Value)
   if Value == 69 then
	   print("ВАААА шесдесят девят посхалко")
   else
      print(Value)

	  end
	  
	  game.Workspace.Gravity = Value

   end,
})

local Slider = Tab:CreateSlider({
   Name = "FOV",
   Range = {30, 120},
   Increment = 1,
   Suffix = " ",
   CurrentValue = 70,
   Flag = "Slider1",
   Callback = function(Value)
   if Value == 69 then
	   print("ВАААА шесдесят девят посхалко")
   else
      print(Value)

	  end
	  
	  game.Workspace.Camera.FieldOfView = Value

   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Callback = function(Value)
   game.workspace.LocalPlayer.Character.Torso.CanCollide = Value
   game.workspace.LocalPlayerHead.CanCollide = Value
   end,
})

local Button = Tab:CreateButton({
   Name = "Sit",
   Callback = function()
game.Players.LocalPlayer.Character.Humanoid.Sit = true

	Rayfield:Notify({
   Title = "Sit",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

   end,
})  

local Button = Tab:CreateButton({
   Name = "Reset",
   Callback = function()
game.Players.LocalPlayer.Character.Humanoid.Health = 0

	Rayfield:Notify({
   Title = "Reset",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

   end,
})  

local Tab = Window:CreateTab("FTAP", 4483362458)

local Section = Tab:CreateSection("Settings")

local Button = Tab:CreateButton({
   Name = "Disable Barrier Collisions",
   Callback = function()
	local group = game.Workspace.Plots.Plot1:FindFirstChild("Barrier")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "PlotBarrier" and part:IsA("Part") then
            part.CanCollide = false
        end
    end
end
	local group = game.Workspace.Plots.Plot2:FindFirstChild("Barrier")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "PlotBarrier" and part:IsA("Part") then
            part.CanCollide = false
        end
    end
end
	local group = game.Workspace.Plots.Plot3:FindFirstChild("Barrier")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "PlotBarrier" and part:IsA("Part") then
            part.CanCollide = false
        end
    end
end
	local group = game.Workspace.Plots.Plot4:FindFirstChild("Barrier")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "PlotBarrier" and part:IsA("Part") then
            part.CanCollide = false
        end
    end
end
	local group = game.Workspace.Plots.Plot5:FindFirstChild("Barrier")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "PlotBarrier" and part:IsA("Part") then
            part.CanCollide = false
        end
    end
end
	print("Done!")

	Rayfield:Notify({
   Title = "Disable Barrier Collisions",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

   end,
})

local Button = Tab:CreateButton({
   Name = "Unlock Third Person",
   Callback = function()
   game.Players.LocalPlayer.CameraMaxZoomDistance = 100000
   game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic

	Rayfield:Notify({
   Title = "Unlock Third Person",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

   end,
}) 

local Toggle = Tab:CreateToggle({
   Name = "WaterWalk",
   CurrentValue = false,
   Callback = function(Value)
   	local group = game.Workspace.Map.AlwaysHereTweenedObjects.Ocean.Object:FindFirstChild("ObjectModel")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "Ocean" and part:IsA("Part") then
            part.CanCollide = Value
        end
    end
end
	print("Done!")

		Rayfield:Notify({
   Title = "WaterWalk",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

   end,
})

local Button = Tab:CreateButton({
   Name = "Water Transparency",
   Callback = function()
   	local group = game.Workspace.Map.AlwaysHereTweenedObjects.Ocean.Object:FindFirstChild("ObjectModel")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "Ocean" and part:IsA("Part") then
            part.Transparency = 0.7
        end
    end
end
	print("Done!")

	Rayfield:Notify({
   Title = "Water Transparency",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "Remove Clouds",
   Callback = function()
   game.Workspace.Terrain.Clouds:Destroy()
	print("Done!")

	Rayfield:Notify({
   Title = "Remove Clouds",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Toggle = Tab:CreateButton({
   Name = "Shuffle Line Sounds",
   Callback = function(Value)
	local newgrab = game.ReplicatedFirst.GrabParts.GrabPart.AttachSound
	local oldgrab = game.ReplicatedFirst.GrabParts.GrabPart.AttachSound1
	local newhold = game.ReplicatedFirst.GrabParts.GrabPart.BeamSound
	local oldhold = game.ReplicatedFirst.GrabParts.GrabPart.BeamSound1
	newgrab.Name = "AttachSound1"
    oldgrab.Name = "AttachSound"
	newhold.Name = "BeamSound1"
    oldhold.Name = "BeamSound"
	print("Done!")

		Rayfield:Notify({
   Title = "Shuffle Line Sounds",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

   end,
})

local Slider = Tab:CreateSlider({
   Name = "Line Sounds",
   Range = {0, 1},
   Increment = 0.01,
   Suffix = "Volume",
   CurrentValue = 0.05,
   Callback = function(Value)
   	local newgrab = game.ReplicatedFirst.GrabParts.GrabPart.AttachSound
	local oldgrab = game.ReplicatedFirst.GrabParts.GrabPart.AttachSound1
	local newhold = game.ReplicatedFirst.GrabParts.GrabPart.BeamSound
	local oldhold = game.ReplicatedFirst.GrabParts.GrabPart.BeamSound1
	newgrab.Volume = Value
    oldgrab.Volume = VAlue
	newhold.Volume = Value
    oldhold.Volume = Value
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Map Sounds",
   Range = {0, 1},
   Increment = 0.01,
   Suffix = "Volume",
   CurrentValue = 0.02,
   Callback = function(Value)
    game.Workspace.Map.MapNoises.NoisePart1.Sound1.Volume = Value
	game.Workspace.Map.MapNoises.NoisePart2.Sound1.Volume = Value
	game.Workspace.Map.MapNoises.NoisePart3.Sound1.Volume = Value
	game.Workspace.Map.MapNoises.NoisePart4.Sound1.Volume = Value
	game.Workspace.Map.MapNoises.NoisePart5.Sound1.Volume = Value
	game.Workspace.Map.MapNoises.NoisePart6.Sound1.Volume = Value
	game.Workspace.Map.MapNoises.NoisePart7.Sound1.Volume = Value
	game.Workspace.Map.MapNoises.NoisePart8.Sound1.Volume = Value
	game.Workspace.Map.MapNoises.NoisePart9.Sound1.Volume = Value
	game.Workspace.Map.MapNoises.NoisePart10.Sound1.Volume = Value
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Scream Sounds",
   Range = {0, 1},
   Increment = 0.01,
   Suffix = "Volume",
   CurrentValue = 0.3,
   Callback = function(Value)

   end,
})


local Button = Tab:CreateButton({
   Name = "Move Spawn",
   Callback = function()
			local spawn = game.Workspace.SpawnLocation
		spawn.CanCollide = true	
   spawn.Transparency = 0.7
spawn.Position = Vector3.new(0, 50, 0)

Rayfield:Notify({
   Title = "Move Spawn",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})
			
end,
})

local Slider = Tab:CreateSlider({
   Name = "X",
   Range = {-1000, 1000},
   Increment = 0.1,
   Suffix = "Studs",
   CurrentValue = 0,
   Callback = function(Value)
   local S = game.Workspace.SpawnLocation
S.Position = Vector3.new(Value, S.Position.Y, S.Position.Z)
end,
})

local Slider = Tab:CreateSlider({
   Name = "Y",
   Range = {-1000, 1000},
   Increment = 0.1,
   Suffix = "Studs",
   CurrentValue = 0,
   Callback = function(Value)
    local S = game.Workspace.SpawnLocation
S.Position = Vector3.new(S.Position.X, Value, S.Position.Z)
end,
})

local Slider = Tab:CreateSlider({
   Name = "Z",
   Range = {-1000, 1000},
   Increment = 0.1,
   Suffix = "Studs",
   CurrentValue = 0,
   Callback = function(Value)
   local S = game.Workspace.SpawnLocation
S.Position = Vector3.new(S.Position.X, S.Position.Y, Value)
end,
})

local Section = Tab:CreateSection("Teleport")

local Button = Tab:CreateButton({
   Name = "Spawn",
   Callback = function()
   local spawn = game.Workspace.SpawnLocation
   game.Players.LocalPlayer.Character.HumanoidRootPart.Position = spawn.Position + Vector3.new(0, 5, 0)
   game.Players.LocalPlayer.Character.Head.Position = spawn.Position + Vector3.new(0, 5, 0)
   game.Players.LocalPlayer.Character.Torso.Position = spawn.Position + Vector3.new(0, 5, 0)
	Rayfield:Notify({
   Title = "Tp To Spawn",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Tab = Window:CreateTab("Other Scripts", 4483362458)

local Section = Tab:CreateSection("Scripts")

local Button = Tab:CreateButton({
   Name = "InfiniteYield",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/refs/heads/master/source"))()
   
	print("Done!")

	Rayfield:Notify({
   Title = "Infinite Yield",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "SystemBroken",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
   
	print("Done!")

	Rayfield:Notify({
   Title = "SystemBroken",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "Dex",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/refs/heads/main/dex.lua"))()
	print("Done!")

	Rayfield:Notify({
   Title = "Dex",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Section = Tab:CreateSection("FTAP Scripts")

local Button = Tab:CreateButton({
   Name = "Posral",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/Brovaky/Friendly/refs/heads/main/Friendly'))()
	print("Done!")

	Rayfield:Notify({
   Title = "Posral",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "TheChosenOne",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-The-chosen-one-ftap-script-55069"))()
	print("Done!")

	Rayfield:Notify({
   Title = "TheChosenOne",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "Tokra",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/sladostrastnik/TokraScript/refs/heads/main/Loader.luau"))()
	print("Done!")

	Rayfield:Notify({
   Title = "Tokra",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "Cosmic Hub",
   Callback = function()
   getgenv().gethui = function() return game.CoreGui end
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Jeffepicy/CosmicHub/refs/heads/main/CosmicHub",true))()
	print("Done!")

	Rayfield:Notify({
   Title = "Cosmic Hub",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "Verbal Hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/VerbalHubz/Verbal-Hub/refs/heads/main/Verbal%20Hub%20V3",true))()
	print("Done!")

	Rayfield:Notify({
   Title = "Verbal Hub",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "Poop Hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ilovepoop0653/PoopHUB/refs/heads/main/IlovePoop"))()
	print("Done!")

	Rayfield:Notify({
   Title = "Poop",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "BlizT Hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/BlizTBr/scripts/refs/heads/main/FTAP.lua"))()
	print("Done!")

	Rayfield:Notify({
   Title = "BlizT Hub",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})



local Button = Tab:CreateButton({
   Name = "SRV9",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Oxwoey/Main/refs/heads/main/ScriptHub/srv9FREE"))()
	print("Done!")

	Rayfield:Notify({
   Title = "SRV9",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "RuHub",
   Callback = function()
   local Main = game:HttpGet("https://gitlab.com/cooldawghaha/gitlabswitch/-/raw/main/MainBranch?ref_type=heads")
	print("Done!")

	Rayfield:Notify({
   Title = "RuHub",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})
