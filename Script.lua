local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "Script",
   LoadingTitle = "Script",
   LoadingSubtitle = "Script", 
})

local Tab = Window:CreateTab("Player", 10747373176)

local Section = Tab:CreateSection("Settings")

local Slider = Tab:CreateSlider({
   Name = "WalkSpeed",
   Range = {0, 500},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 16,
   Callback = function(Value)
      local character = game.Players.LocalPlayer.Character
      if character and character:FindFirstChild("Humanoid") then
          character.Humanoid.WalkSpeed = Value
      end
	  local lp = game.Players.LocalPlayer
   lp.Character.BobbingAndCrouch.Disabled = true
   end,
})

local Toggle = Tab:CreateButton({
   Name = "Revert Crouch",
   Callback = function(Value)
   local lp = game.Players.LocalPlayer
   lp.Character.BobbingAndCrouch.Enabled = true
   end,
})

local Slider = Tab:CreateSlider({
   Name = "JumpPower",
   Range = {0, 500},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 50,
   Callback = function(Value)
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
   Callback = function(Value)
	  game.Workspace.Gravity = Value

   end,
})

local Slider = Tab:CreateSlider({
   Name = "FOV",
   Range = {30, 120},
   Increment = 1,
   Suffix = " ",
   CurrentValue = 70,
   Callback = function(Value)
	  game.Workspace.Camera.FieldOfView = Value

   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Callback = function(Value)
   local e = game.Players.LocalPlayer.Character
   if Value == true then
   e.Torso.CanCollide = false
   e.Head.CanCollide = false
   else
   e.Torso.CanCollide = true
   e.Head.CanCollide = true
	end
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

local Tab = Window:CreateTab("Blobman", 10709782230)

local Section = Tab:CreateSection("Settings")

local Button = Tab:CreateSlider({
	Name = "HitBox Size",
   Range = {1, 150},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 1,
   Callback = function(Value)
   local lp = game.Players.LocalPlayer
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   toy.CreatureBlobman.LeftDetector.Size = Vector3.new(Value, Value, Value)
   toy.CreatureBlobman.RightDetector.Size = Vector3.new(Value, Value, Value)

   end,
})

local Button = Tab:CreateSlider({
	Name = "Blobman WalkSpeed",
   Range = {1, 250},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 20,
   Callback = function(Value)
   local lp = game.Players.LocalPlayer
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   toy.CreatureBlobman.HumanoidCreature.WalkSpeed = Value

   end,
})

local Button = Tab:CreateSlider({
	Name = "Blobman JumpPower",
   Range = {1, 250},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 50,
   Callback = function(Value)
   local lp = game.Players.LocalPlayer
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   toy.CreatureBlobman.HumanoidCreature.JumpPower = Value

   end,
})

local Keybind = Tab:CreateKeybind({
   Name = "BlobmanJump",
   CurrentKeybind = "C",
   HoldToInteract = false,
   Callback = function(Keybind)
   local lp = game.Players.LocalPlayer
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   toy.CreatureBlobman.HumanoidCreature.Jump = true
   
   end,
})

local Button = Tab:CreateKeybind({
   Name = "Kick",
   CurrentKeybind = "Q",
   HoldToInteract = false,
   Callback = function(Keybind)
   local lp = game.Players.LocalPlayer
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   game.Workspace.Food.SpawningPlatform.CFrame = CFrame.new(335, 15, 391)
   game.Workspace.Food.SpawningPlatform.Transparency = 0
   game.Workspace.Food.SpawningPlatform.CanCollide = true
   game.Workspace.Ladders.SpawningPlatform.CFrame = CFrame.new(324, 7, 338)
   game.Workspace.Ladders.SpawningPlatform.Orientation = Vector3.new (90, 0, 0) 
   game.Workspace.Ladders.SpawningPlatform.Transparency = 0.5
   game.Workspace.Ladders.SpawningPlatform.CanCollide = true
   toy.CreatureBlobman.HumanoidRootPart.CFrame = CFrame.new(335, 17, 391)
	Rayfield:Notify({
   Title = "Kick",
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
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 5, 0)
	Rayfield:Notify({
   Title = "Tp To Spawn",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "Wicth House",
   Callback = function()
   local spawn = game.Workspace.SpawnLocation
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(250, 1, 460)
	Rayfield:Notify({
   Title = "Tp To Witch House",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "Green House",
   Callback = function()
   local spawn = game.Workspace.SpawnLocation
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-535, 5, 90)
	Rayfield:Notify({
   Title = "Tp To Green House",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "Pink House",
   Callback = function()
   local spawn = game.Workspace.SpawnLocation
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-492, 5, -167)
	Rayfield:Notify({
   Title = "Tp To Pink House",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "Blue House",
   Callback = function()
   local spawn = game.Workspace.SpawnLocation
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(512, 85, -340)
	Rayfield:Notify({
   Title = "Tp To Blue House",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "Chense House",
   Callback = function()
   local spawn = game.Workspace.SpawnLocation
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(553, 125, -75)
	Rayfield:Notify({
   Title = "Tp To Chense House",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "Barn",
   Callback = function()
   local spawn = game.Workspace.SpawnLocation
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-195, 65, -285)
	Rayfield:Notify({
   Title = "Tp To Barn",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "Mountain House",
   Callback = function()
   local spawn = game.Workspace.SpawnLocation
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-282, 80, 313)
	Rayfield:Notify({
   Title = "Tp To Moiuntain House",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Tab = Window:CreateTab("Other Scripts", 10734943448)

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

local Button = Tab:CreateButton({
   Name = "Venom X",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/lololofffff/Venom-X/refs/heads/main/FTAP"))()
	print("Done!")

	Rayfield:Notify({
   Title = "Venom X",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})
