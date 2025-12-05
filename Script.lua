game.workspace.SpawnLocation.Decal.Texture = "rbxasset://textures/face.png"
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
   Name = "Unlock Third Person",
   CurrentValue = false,
   Callback = function(Value)
   if Value == true then
   game.Players.LocalPlayer.CameraMaxZoomDistance = 100000
   game.Players.LocalPlayer.CameraMode = 0
   	Rayfield:Notify({
   Title = "Unlock Third Person",
   Content = "On",
   Duration = 3,
   Image = 4483362458,
})
   else
   game.Players.LocalPlayer.CameraMaxZoomDistance = 0.5
   game.Players.LocalPlayer.CameraMode = 1
      	Rayfield:Notify({
   Title = "Unlock Third Person",
   Content = "Off",
   Duration = 3,
   Image = 4483362458,
})
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
   Content = "On",
   Duration = 3,
   Image = 4483362458,
})
   else
   game.Players.LocalPlayer.DevCameraOcclusionMode = 0
	   	Rayfield:Notify({
   Title = "InvisCam Mode",
   Content = "Off",
   Duration = 3,
   Image = 4483362458,
})
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
		d.AlignOrientation.MaxTorque = 10e+37
   Rayfield:Notify({
   Title = "Massless Grab",
   Content = "On",
   Duration = 3,
   Image = 4483362458,
})
		else
		d.AlignPosition.ForceLimitMode = 0
		d.AlignPosition.Responsiveness = 40
		d.AlignPosition.MaxAxesForce = Vector3.new(10000, 10000, 10000)
		d.AlignOrientation.Responsiveness = 30
		d.AlignOrientation.MaxTorque = 600000
   Rayfield:Notify({
   Title = "Massless Grab",
   Content = "Off",
   Duration = 3,
   Image = 4483362458,
})
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

local Toggle = Tab:CreateButton({
   Name = "Freze Object",
   Callback = function(Value)
   local lp = game.Players.LocalPlayer
   lp.Character.GrabbingScript.Disabled = true
   lp.Character.GrabbingScript.Enabled = true
   end,
})

local Toggle = Tab:CreateKeybind({
   Name = "Anti Kick Shuriken",
   CurrentKeybind = "R",
   HoldToInteract = false,
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
   Name = "Anti Kick Kunai",
   Callback = function(Value)
   local lp = game.Players.LocalPlayer
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   local f = toy.NinjaKunai.StickyPart
   local t = lp.Character.HumanoidRootPart
   lp.Character.Torso.CanCollide = false
   f.Anchored = true
   t.Anchored = true
	f.CanTouch = false
	f.CanQuery = false
   f.CFrame = t.CFrame * CFrame.Angles(math.rad(90), math.rad(90), 0)
	wait(0.03)
	f.CFrame = f.CFrame + Vector3.new(0, -0.5, 0)
   toy.NinjaKunai.Name = "AntiKick"
	f.CanTouch = true
	f.CanQuery = true
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
   toy.ToolPencil.SoundPart.CanQuery = false
   t.Anchored = true
   f.Anchored = true
	f.CanTouch = false
	f.CanQuery = false
	f.CFrame = t.CFrame * CFrame.Angles(0, math.rad(180), 0)
	wait(0.03)
	f.CFrame = f.CFrame + Vector3.new(0, -0.85, 0)
	wait(0.03)
	f.CanTouch = true
	f.CanQuery = true
   t.Anchored = false
   f.Anchored = false
   wait(1)
   lp.Character.Torso.CanCollide = true
   toy.ToolPencil.Name = "PENCIL!!!"
	end,
})

local Section = Tab:CreateSection("Settings")

local Button = Tab:CreateToggle({
   Name = "Cry (Need Campfire)",
   CurrentValue = false,
   Callback = function(Value)
       local lp = game.Players.LocalPlayer
   local f = lp.Character.OnFireAnimationScript
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   local c = toy.Campfire
   local e = game.workspace.Plots.Plot3.Barrier.PlotBarrier.CFrame
   local function CRY()
   c.FirePlayerPart.CFrame = lp.Character.HumanoidRootPart.CFrame
   task.wait(0.3)
   c.FirePlayerPart.CFrame = CFrame.new(154.299103, 250.697739, 331.101624, 0.930420518, -3.53281782e-09, -0.366493821, 1.9336921e-09, 1, -4.73042405e-09, 0.366493821, 3.69259712e-09, 0.930420518)
   f.Disabled = true
   task.wait(0.3)
   game.workspace.Plots.Plot3.Barrier.PlotBarrier.CFrame = lp.Character.HumanoidRootPart.CFrame
   task.wait(0.3)
   game.workspace.Plots.Plot3.Barrier.PlotBarrier.CFrame = e
   end
   local function check()
	   if c and f.Disabled == false then
	   CRY()
	   else
	   f.Enabled = true
	   game.workspace.Plots.Plot3.Barrier.PlotBarrier.CFrame = lp.Character.HumanoidRootPart.CFrame
	   task.wait(0.3)
	   game.workspace.Plots.Plot3.Barrier.PlotBarrier.CFrame = e
	   lp.Character.Animate.Disabled = true
	   lp.Character.Animate.Enabled = true 
   end
   end

   if Value == true then
   check()
   else
   f.Enabled = true
   lp.Character.Animate.Disabled = true
   lp.Character.Animate.Enabled = true
   end

	Rayfield:Notify({
   Title = "Cry",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

   end,
})

local Button = Tab:CreateButton({
   Name = "Break Barrier (Need Snowball)",
   Callback = function()
   local lp = game.Players.LocalPlayer
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   local b = toy.BallSnowball.Main
   if b then
	   b.CFrame = CFrame.new(330.336456, -10.305584, 476.507538, 0.469516784, 4.47039059e-21, -0.882923543, 4.50381006e-20, 1, 2.90133115e-20, 0.882923543, -5.33874355e-20, 0.469516784)
	   task.wait(0.12)
	   b.Velocity = Vector3.new(-1000, -10, 0)
   end
	Rayfield:Notify({
   Title = "Break Barrier",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})

   end,
})

local Button = Tab:CreateButton({
   Name = "Set Boobs",
   Callback = function()
   local lp = game.Players.LocalPlayer
   local toy = game.workspace.PlotItems.Plot3
   local h = lp.Character.Torso
   if toy:FindFirstChild("a") then
   toy.FoodCoconut.SoundPart.CFrame = h.CFrame + Vector3.new(-0.7, 0.2, -0.5)
   toy.FoodCoconut.SoundPart.Anchored = true
   toy.FoodCoconut.SoundPart.CanCollide = false
   toy.FoodCoconut.Name = "b"
   else
   toy.FoodCoconut.SoundPart.CFrame = h.CFrame + Vector3.new(-0.7, 0.2, 0.5)
   toy.FoodCoconut.SoundPart.Anchored = true
   toy.FoodCoconut.SoundPart.CanCollide = false
   toy.FoodCoconut.Name = "a"  
	end
end,
})

local Button = Tab:CreateButton({
   Name = "Boobs",
   Callback = function()
	local lp = game.Players.LocalPlayer
local toy = game.workspace.PlotItems.Plot3
local h = lp.Character.Torso

if toy:FindFirstChild("a") and toy:FindFirstChild("b") then
    while true do
        -- Получаем CFrame торса (включая позицию и поворот)
        local torsoCF = h.CFrame
        
        -- Преобразуем локальные смещения относительно торса
        -- Используем :ToWorldSpace() для правильного учета поворота
        local offsetA = CFrame.new(-0.5, 0.2, 0.6)
        local offsetB = CFrame.new(0.5, 0.2, 0.6)
        
        toy.a.SoundPart.CFrame = torsoCF:ToWorldSpace(offsetA)
        toy.b.SoundPart.CFrame = torsoCF:ToWorldSpace(offsetB)
        
        -- Остальные настройки
        toy.a.SoundPart.Velocity = Vector3.new(0, 0, 0)
        toy.b.SoundPart.Velocity = Vector3.new(0, 0, 0)
        toy.a.SoundPart.Anchored = false
        toy.b.SoundPart.Anchored = false
        toy.a.SoundPart.CanCollide = false
        toy.b.SoundPart.CanCollide = false
        toy.a.SoundPart.CanQuery = false
        toy.b.SoundPart.CanQuery = false
        
        wait(0.01)
    end
  end
end,
})

local Button = Tab:CreateButton({
   Name = "Set Boombox",
   Callback = function()
   local lp = game.Players.LocalPlayer
   local toy = game.workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   local h = lp.Character.Torso
   local b = toy.Boombox.ColorPart
   if b then
	   while true do
	b.CFrame = h.CFrame + Vector3.new(1.5, 0, 0) + h.CFrame.LookVector
	b.Veclocity = Vector3.new(0, 0, 0)
	h.CanCollide = false
		   wait(0.001)
	   end
	end
end,
})

local o = false

local Toggle = Tab:CreateToggle({
   Name = "PLCD",
   CurrentValue = false,
   Callback = function(Value)
	local w = game.workspace
	o = Value
	if o then
	task.spwan(function()
	while o do
		for _, part in ipairs(w:GetChildren()) do
        if p.Name == "PlayerCharacterLocationDetector" then
            p.Transparency = 0.7
			p.BrickColor = BrickColor.new("Hot pink")
			task.wait(0.2)
					end
				end
			end
		end)
	end
end,
})

local Button = Tab:CreateToggle({
   Name = "Disable Barrier Collisions",
   CurrentValue = false,
   Callback = function(Value)
	local group = game.Workspace.Plots.Plot1:FindFirstChild("Barrier")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "PlotBarrier" and part:IsA("Part") then
		if Value == true then
            part.CanCollide = false
			else
			part.CanCollide = true
			end
        end
    end
end
	local group = game.Workspace.Plots.Plot2:FindFirstChild("Barrier")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "PlotBarrier" and part:IsA("Part") then
            if Value == true then
            part.CanCollide = false
			else
			part.CanCollide = true
			end
        end
    end
end
	local group = game.Workspace.Plots.Plot3:FindFirstChild("Barrier")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "PlotBarrier" and part:IsA("Part") then
            if Value == true then
            part.CanCollide = false
			else
			part.CanCollide = true
			end
        end
    end
end
	local group = game.Workspace.Plots.Plot4:FindFirstChild("Barrier")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "PlotBarrier" and part:IsA("Part") then
            if Value == true then
            part.CanCollide = false
			else
			part.CanCollide = true
			end
        end
    end
end
	local group = game.Workspace.Plots.Plot5:FindFirstChild("Barrier")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "PlotBarrier" and part:IsA("Part") then
            if Value == true then
            part.CanCollide = false
			else
			part.CanCollide = true
			end
        end
    end
end
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

local Toggle = Tab:CreateToggle({
   Name = "Anti Fire",
   CurrentValue = false,
   Callback = function(Value)
   local R = game:GetService("RunService")
   local lp = game.Players.LocalPlayer.Character
   local t = game.workspace.Plots.Plot3.Barrier.PlotBarrier
   local old = t.Position

   local c = nil

   local function F()
	   if lp and lp.Humanoid.Health > 0 then
		   t.Position = lp.HumanoidRootPart.Position
		   task.wait(0.3)
		   t.Position = old
		   print(1)
	   end
   end

   if Value == true then
   if c then
	   c:Disconnect()
	   c = nil
   end
   end

   c = R.Heartbeat:Connect(function()

   if lp.HumanoidRootPart.FirePlayerPart.CanBurn == true then
	F()
	print(2)

   else
	   if c then
		   c:Disconnect()
		   c = nil
	   end
	end
   end)


	Rayfield:Notify({
   Title = "Anti Burn",
   Content = "Done",
   Duration = 3,
   Image = 4483362458,
})
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Anti Void",
   CurrentValue = false,
   Callback = function(Value)
   if Value == true then
	game.Workspace.FallenPartsDestroyHeight = -100000
   else
	game.Workspace.FallenPartsDestroyHeight = 0
		end
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

local Button = Tab:CreateToggle({
   Name = "Water Transparency",
   CurrentValue = false,
   Callback = function(Value)
   	local group = game.Workspace.Map.AlwaysHereTweenedObjects.Ocean.Object:FindFirstChild("ObjectModel")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "Ocean" and part:IsA("Part") then
		if Value == true then
            part.Transparency = 0.7
			else
			part.Transparency = 0
			end
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

local Section = Tab:CreateSection("Happy Mod")

local Button = Tab:CreateButton({
   Name = "Reload Script",
   Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/okk76/okk/refs/heads/main/Script.lua"))()
			
   end,
})  

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

local Button = Tab:CreateButton({
   Name = "Dex Mobile",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
	print("Done!")

	Rayfield:Notify({
   Title = "Dex Mobile",
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
