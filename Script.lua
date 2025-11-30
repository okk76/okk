local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "Happy Mod",
   LoadingTitle = "Happy Mod",
   LoadingSubtitle = "100% Free",
   Theme = "Amethyst",
   ToggleUIKeybind = "X",
   Icon = 10734943448,
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

local Button = Tab:CreateButton({
   Name = "ESP (loadstring)",
   CurrentValue = false,
   Callback = function(Value)
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Yahahahau/Ultimate-Esp-v1/refs/heads/main/Ultimate%20esp%20v1.lua"))()

	Rayfield:Notify({
   Title = "ESP",
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
   Range = {0, 250},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 50,
   Callback = function(Value)
   local lp = game.Players.LocalPlayer
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   toy.CreatureBlobman.HumanoidCreature.JumpPower = Value

   end,
})

local Button = Tab:CreateSlider({
	Name = "Blobman HipHeight",
   Range = {0, 50},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 50,
   Callback = function(Value)
   local lp = game.Players.LocalPlayer
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   toy.CreatureBlobman.HumanoidCreature.HipHeight = Value

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

local Toggle = Tab:CreateToggle({
   Name = "TP To Spawn Grab",
   CurrentValue = false,
   Callback = function(Value)
   local lp = game.Players.LocalPlayer
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   if Value == true then
   toy.CreatureBlobman.LeftDetector.LeftWeld.Mode = 0
   toy.CreatureBlobman.RightDetector.RightWeld.Mode = 0
   else
   toy.CreatureBlobman.LeftDetector.LeftWeld.Mode = 1
   toy.CreatureBlobman.RightDetector.RightWeld.Mode = 1
	end
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

local Section = Tab:CreateSection("GrabLine")

local Toggle = Tab:CreateToggle({
   Name = "Massless Grab",
   CurrentValue = false,
   Callback = function(Value)
   local d = game.ReplicatedFirst.GrabParts.DragPart
	if Value == true then
		d.AlignPosition.ForceLimitMode = 1
		d.AlignPosition.Responsiveness = 200
		d.AlignPosition.MaxAxesForce = Vector3.new(10e+37, 10e+37, 10e+37)
		d.AlignOrientation.Responsiveness = 200
		else
		d.AlignPosition.ForceLimitMode = 0
		d.AlignPosition.Responsiveness = 40
		d.AlignPosition.MaxAxesForce = Vector3.new(10000, 10000, 10000)
		d.AlignOrientation.Responsiveness = 30
	end
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Move To Spawn Grab",
   CurrentValue = false,
   Callback = function(Value)
   local d = game.ReplicatedFirst.GrabParts.DragPart
	if Value == true then
		d.AlignPosition.Mode = 0
		else
		d.AlignPosition.Mode = 1
	end
   end,
})

local Toggle = Tab:CreateKeybind({
   Name = "Freze Object",
   CurrentKeybind = "Z",
   HoldToInteract = false,
   Callback = function(Value)
   local lp = game.Players.LocalPlayer
   lp.Character.GrabbingScript.Disabled = true
   lp.Character.GrabbingScript.Enabled = true
   end,
})

local Toggle = Tab:CreateKeybind({
   Name = "Anti Kick Kunai",
   CurrentKeybind = "R",
   HoldToInteract = false,
   Callback = function(Value)
   local lp = game.Players.LocalPlayer
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   local f = toy.NinjaKunai.StickyPart
   local t = lp.Character.HumanoidRootPart
   lp.Character.Torso.CanCollide = false
   f.Anchored = true
   t.Anchored = true
   f.CFrame = t.CFrame + Vector3.new(0.75, 0, 0)
   toy.NinjaKunai.Name = "AntiKick"
   t.Anchored = false
   f.Anchored = false
   wait(1)
   lp.Character.Torso.CanCollide = true
	end,
})

local Toggle = Tab:CreateButton({
   Name = "Anti Kick Kunai",
   Callback = function(Value)
   local lp = game.Players.LocalPlayer
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   local f = toy.NinjaKunai.StickyPart
   local t = lp.Character.HumanoidRootPart
   lp.Character.Torso.CanCollide = false
   f.Anchored = true
   t.Anchored = true
   f.CFrame = t.CFrame + Vector3.new(0.75, 0, 0)
   toy.NinjaKunai.Name = "AntiKick"
   t.Anchored = false
   f.Anchored = false
   wait(1)
   lp.Character.Torso.CanCollide = true
	end,
})

local Toggle = Tab:CreateButton({
   Name = "Anti Kick Shuriken",
   Callback = function(Value)
   local lp = game.Players.LocalPlayer
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   local f = toy.NinjaShuriken.StickyPart
   local t = lp.Character.HumanoidRootPart
   lp.Character.Torso.CanCollide = false
   f.Anchored = true
   t.Anchored = true
   f.CFrame = t.CFrame * CFrame.Angles(math.rad(90), 0, 0)
   t.Anchored = false
   f.Anchored = false
   wait(1)
   lp.Character.Torso.CanCollide = true
   toy.NinjaShuriken.Name = "AntiKick"
	end,
})

local Toggle = Tab:CreateButton({
   Name = "???",
   Callback = function(Value)
   local lp = game.Players.LocalPlayer
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   local f = toy.ToolPencil.StickyPart
   local t = lp.Character.HumanoidRootPart
   lp.Character.Torso.CanCollide = false
   t.Anchored = true
   f.Anchored = true
   f.CFrame = t.CFrame + Vector3.new(0, -0.7, 0) * CFrame.Angles(math.rad(180), 0, 0)
   t.Anchored = false
   f.Anchored = false
   wait(1)
   lp.Character.Torso.CanCollide = true
   toy.ToolPencil.Name = "PENCIL!!!"
	end,
})

local Section = Tab:CreateSection("Settings")

local Toggle = Tab:CreateButton({
   Name = "PLCD",
   Callback = function(Value)
	local pi = game.workspace
	while true do
    for _, part in ipairs(pi:GetChildren()) do
        if part.Name == "PlayerCharacterLocationDetector" and part:IsA("Part") then
            part.Transparency = 0.7
			part.BrickColor = BrickColor.new("Hot pink")
			wait(0.01)
				end
    		end
		end
	end,
})

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

local Toggle = Tab:CreateToggle({
   Name = "Disable Blur",
   CurrentValue = false,
   Callback = function(Value)
   local B = game.workspace.Camera.Blur
   if Value == true then
   B.Enabled = false
   else
   B.Enabled = true
	end

	Rayfield:Notify({
   Title = "Disable Blur",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})
   end,
})

local on = nil

local Toggle = Tab:CreateToggle({
   Name = "Anti Fire",
   CurrentValue = false,
   Callback = function(Value)
       local T = game.workspace.Map.Hole.PoisonSmallHole.ExtinguishPart
       local old = T.Position
       
       if Value then
           if on then
               on:Disconnect()
               on = nil
           end
           
           on = game:GetService("RunService").Heartbeat:Connect(function()
               local lp = game.Players.LocalPlayer.Character
               local hrp = lp.HumanoidRootPart
               
               if lp.Humanoid.Health > 0 then
                   if hrp.FirePlayerPart.CanBurn.Value == true then
                       T.Position = hrp.Position
                       task.wait(0.03)
                       T.Position = old
                   end
               end
           end)
           if on then
               on:Disconnect()
               on = nil
           end
       end
	   		Rayfield:Notify({
   Title = "Anti Fire",
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

local Toggle = Tab:CreateToggle({
   Name = "Revert Default Line Skin",
   CurrentValue = false,
   Callback = function(Value)
   local p = game.Players.LocalPlayer.FartherReach
   if Value == true then
   p.Value = false

   Rayfield:Notify({
   Title = "Revert Default Line Skin",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})
   else
   p.Value = true
	end
   end,
})

local Toggle = Tab:CreateButton({
   Name = "Get Gamepass Line Skin",
   Callback = function()
   local p = game.Players.LocalPlayer.FartherReach
   if not p then
   local x = Instance.new("BoolValue")
   x.Name = "FartherReach"
   x.Parent = game.Players.LocalPlayer
   x.Value = true
   end

   Rayfield:Notify({
   Title = "Get Gamepass Line Skin",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Line Width0",
   Range = {0, 10},
   Increment = 0.01,
   Suffix = " ",
   CurrentValue = 0.375,
   Callback = function(Value)
   local L = game.ReplicatedFirst.GrabParts.BeamPart
   L.GrabBeam.Width0 = Value
end,
})

local Slider = Tab:CreateSlider({
   Name = "Line Width1",
   Range = {0, 10},
   Increment = 0.01,
   Suffix = " ",
   CurrentValue = 0.375,
   Callback = function(Value)
   local L = game.ReplicatedFirst.GrabParts.BeamPart
   L.GrabBeam.Width1 = Value
end,
})

local Toggle = Tab:CreateButton({
   Name = "Revert Line Width",
   Callback = function(Value)
   local L = game.ReplicatedFirst.GrabParts.BeamPart
   L.GrabBeam.Width0 = 0.375
   L.GrabBeam.Width1 = 0.375
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Line Texture Length",
   Range = {0, 100},
   Increment = 0.1,
   Suffix = " ",
   CurrentValue = 5,
   Callback = function(Value)
   local L = game.ReplicatedFirst.GrabParts.BeamPart
   L.GrabBeam.TextureLength = Value
end,
})

local Slider = Tab:CreateSlider({
   Name = "Line Texture Speed",
   Range = {0, 10},
   Increment = 0.1,
   Suffix = " ",
   CurrentValue = 6,
   Callback = function(Value)
   local L = game.ReplicatedFirst.GrabParts.BeamPart
   L.GrabBeam.TextureSpeed = Value
end,
})

local Toggle = Tab:CreateToggle({
   Name = "Remove Line Texture",
   CurrentValue = false,
   Callback = function(Value)
   local L = game.ReplicatedFirst.GrabParts.BeamPart
   local p = game.Players.LocalPlayer.FartherReach
   if Value == true then
   p.Value = false
   L.GrabBeam.Texture = ""
   else
   p.Value = true
   L.GrabBeam.Texture = "rbxassetid://8933346550"
   end
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

local Toggle = Tab:CreateToggle({
   Name = "Unlock Third Person",
   CurrentValue = false,
   Callback = function(Value)
   if Value == true then
   game.Players.LocalPlayer.CameraMaxZoomDistance = 100000
   game.Players.LocalPlayer.CameraMode = 0
   	Rayfield:Notify({
   Title = "Unlock Third Person",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})
   else
   game.Players.LocalPlayer.CameraMaxZoomDistance = 0.5
   game.Players.LocalPlayer.CameraMode = 1
	end

   end,
})

local Toggle = Tab:CreateToggle({
   Name = "InvisCam Mode",
   CurrentValue = false,
   Callback = function(Value)
   if Value == true then
   game.Players.LocalPlayer.DevCameraOcclusionMode = 1
   	Rayfield:Notify({
   Title = "InvisCam Mode",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})
   else
   game.Players.LocalPlayer.DevCameraOcclusionMode = 0
	end

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
   local pls = game:GetService("Players")
	   while true do
	   for _, pl in pairs(pls:GetPlayers()) do
		      if pl.Character then
			  pl.Character.HumanoidRootPart.Scream.Volume = Value
			  end
			  end
			  wait(0.03)
			end
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

local Button = Tab:CreateKeybind({
   Name = "Spawn",
   CurrentKeybind = "One",
   HoldToInteract = false,
   Callback = function(Keybind)
   local spawn = game.Workspace.SpawnLocation
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 5, 0)
   game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	Rayfield:Notify({
   Title = "Tp To Spawn",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateKeybind({
   Name = "Wicth House",
   CurrentKeybind = "Four",
   HoldToInteract = false,
   Callback = function(Keybind)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(250, 1, 460)
   game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	Rayfield:Notify({
   Title = "Tp To Witch House",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateKeybind({
   Name = "Green House",
   CurrentKeybind = "Three",
   HoldToInteract = false,
   Callback = function(Keybind)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-535, 5, 90)
   game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	Rayfield:Notify({
   Title = "Tp To Green House",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateKeybind({
   Name = "Pink House",
   CurrentKeybind = "Two",
   HoldToInteract = false,
   Callback = function(Keybind)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-492, 5, -167)
   game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	Rayfield:Notify({
   Title = "Tp To Pink House",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateKeybind({
   Name = "Blue House",
   CurrentKeybind = "Five",
   HoldToInteract = false,
   Callback = function(Keybind)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(512, 85, -340)
   game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	Rayfield:Notify({
   Title = "Tp To Blue House",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateKeybind({
   Name = "Chense House",
   CurrentKeybind = "Six",
   HoldToInteract = false,
   Callback = function(Keybind)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(553, 125, -75)
   game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	Rayfield:Notify({
   Title = "Tp To Chense House",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateKeybind({
   Name = "Barn",
   CurrentKeybind = "Seven",
   HoldToInteract = false,
   Callback = function(Keybind)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-195, 65, -285)
   game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	Rayfield:Notify({
   Title = "Tp To Barn",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateKeybind({
   Name = "Mountain House",
   CurrentKeybind = "Eight",
   HoldToInteract = false,
   Callback = function(Keybind)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-282, 80, 313)
   game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	Rayfield:Notify({
   Title = "Tp To Moiuntain House",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateKeybind({
   Name = "Island",
   CurrentKeybind = "Nine",
   HoldToInteract = false,
   Callback = function(Keybind)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(72, 348, 341)
   game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	Rayfield:Notify({
   Title = "Tp To Island",
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
   Name = "Poop Hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ilovepoop0653/PoopHUB/refs/heads/main/IlovePoop"))()
	print("Done!")

	Rayfield:Notify({
   Title = "Poop Hub",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

end,
})

local Button = Tab:CreateButton({
   Name = "Bloody",
   Callback = function()
   loadstring(game:HttpGet("https://pastefy.app/DZLhyq4n/raw",true))()
	print("Done!")

	Rayfield:Notify({
   Title = "Bloody",
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
   Name = "Faldes X",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/Artss1/Faldes_X/refs/heads/main/FTAP_V2%20Faldes_X'))()
	print("Done!")

	Rayfield:Notify({
   Title = "Faldes X",
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
