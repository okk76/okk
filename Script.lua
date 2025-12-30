local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local SelectedPlayer = nil
local P = game:GetService("Players")
local LocalPlayer = P.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GrabEvents = ReplicatedStorage:WaitForChild("GrabEvents")
local SetNetworkOwner = GrabEvents:WaitForChild("SetNetworkOwner")
local toysFolder = workspace:FindFirstChild(LocalPlayer.Name.."SpawnedInToys")

local function spawnItem(itemName, position, orientation)
    task.spawn(function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local cframe = CFrame.new(position)
        local rotation = Vector3.new(0, 90, 0)
        ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(itemName, cframe, rotation)
    end)
end

local function holdItem(itemName)
    task.spawn(function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
        ReplicatedStorage.HoldEvents.Hold:InvokeServer(itemName)
    end)
end

local function DestroyT(toy)
    local toy = toy or toysFolder:FindFirstChildWhichIsA("Model")
    ReplicatedStorage.MenuToys.DestroyToy:FireServer(toy)
end


local function Joined(pl)

   Rayfield:Notify({
   Title = pl.DisplayName .. "_Joined",
   Content = pl.Name,
   Duration = 3,
   Image = 10747373176,
   })

local es = Instance.new("Sound")
es.SoundId = "rbxassetid://3270235822"
es.Parent = workspace
es.Volume = 0.25
es:Play()
task.wait(3)
	es:Destroy()

end

P.PlayerAdded:Connect(Joined)

local function Leave(pl)
   Rayfield:Notify({
   Title = pl.DisplayName .. "_Leave",
   Content = pl.Name,
   Duration = 3,
   Image = 10747373176,
   })

local ex = Instance.new("Sound")
ex.SoundId = "rbxassetid://111124523"
ex.Parent = workspace
ex.Volume = 0.1
ex:Play()
task.wait(3)
	ex:Destroy()

end

P.PlayerRemoving:Connect(Leave)

local Window = Rayfield:CreateWindow({
   Name = "Happy Mod",
   LoadingTitle = "Happy Mod",
   LoadingSubtitle = "100% Free",
   Theme = "Amethyst",
   ToggleUIKeybind = "X",
   Icon = 10723396107,
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

   local acs = false

local Toggle = Tab:CreateToggle({
   Name = "Unlock Third Person",
   CurrentValue = false,
   Callback = function(Value)
        acs = Value
		local group = game.Players.LocalPlayer.Character

        if Value then
            task.spawn(function()
                while acs do
    for _, part in ipairs(group:GetChildren()) do
        if part:IsA("Accessory") then
            part.Handle.Transparency = 0
			group.Torso.Transparency = 0
			group.Head.Transparency = 0
			group["Left Leg"].Transparency = 0
			group["Left Arm"].Transparency = 0
			group["Right Leg"].Transparency = 0
			group["Right Arm"].Transparency = 0
    end
end
    task.wait(0.03)
			end
        end)
	end

   if Value == true then
   game.Players.LocalPlayer.DevEnableMouseLock = true
   game.Players.LocalPlayer.CameraMaxZoomDistance = 100000
   game.Players.LocalPlayer.CameraMode = 0
   	Rayfield:Notify({
   Title = "Unlock Third Person",
   Content = "On",
   Duration = 3,
   Image = 4483362458,
})

   else
   game.Players.LocalPlayer.DevEnableMouseLock = false
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

local PLCD = false

local Toggle = Tab:CreateToggle({
    Name = "PLCD",
    CurrentValue = false,
    Callback = function(Value)
        PLCD = Value
		local group = game.Workspace
        if Value then
            task.spawn(function()
                while PLCD do

    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "PlayerCharacterLocationDetector" and part:IsA("Part") then
            part.Transparency = 0.6
			part.BrickColor = BrickColor.new("Hot pink")
    end
end
                    task.wait(0.03)
                end
            end)
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

local function GetPlayerList()
    local list = {}
    for _, player in pairs(P:GetPlayers()) do
    table.insert(list, player.Name)
    end
    return list
end

local PlayerDropdown = Tab:CreateDropdown({
    Name = "TP To",
    Options = GetPlayerList(),
    CurrentOption = {},
    MultipleOptions = false,
    Callback = function(Option)
        SelectedPlayer = Option[1]
    end,
})

P.PlayerAdded:Connect(function()
    PlayerDropdown:Refresh(GetPlayerList())
end)

P.PlayerRemoving:Connect(function()
    PlayerDropdown:Refresh(GetPlayerList())
end)

Tab:CreateButton({
    Name = "TP To Player",
    Callback = function()
        if SelectedPlayer then
            local target = P:FindFirstChild(SelectedPlayer)
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(3, 1, 0)
					LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
            else
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Character is nil",
                    Duration = 3
                })
            end
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Player is nil",
                Duration = 3
            })
        end
    end
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

local Tab = Window:CreateTab("GrabLine", 10723404472)

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
   CurrentKeybind = "K",
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

local Section = Tab:CreateSection("Settings")

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

local Tab = Window:CreateTab("Defense", 10734951847)

local Section = Tab:CreateSection("Settings")

local LoopTP = false

Tab:CreateToggle({
    Name = "Loop TP",
    CurrentValue = false,
    Callback = function(Value)
	local lp = P.LocalPlayer.Character
        LoopTP = Value

        if Value then
            task.spawn(function()
                while LoopTP do
                    lp.HumanoidRootPart.CFrame = CFrame.new(569.652527, 13.6484346, -394.444519, -0.953733981, -3.01659959e-08, -0.300651759, -5.31917044e-09, 1, -8.34617495e-08, 0.300651759, -7.80010865e-08, -0.953733981)
                    task.wait(0.025)
					lp.HumanoidRootPart.CFrame = CFrame.new(79.1195755, 303.694733, 365.037109, 0.300712913, 9.96221416e-08, -0.953714728, -1.43715875e-08, 1, 9.99255008e-08, 0.953714728, -1.63424936e-08, 0.300712913)
                    task.wait(0.025)
					lp.HumanoidRootPart.CFrame = CFrame.new(42.507618, -6.35040426, -631.584534, -0.976292491, -4.06780316e-08, -0.2164554, -1.58035363e-08, 1, -1.16648309e-07, 0.2164554, -1.10462111e-07, -0.976292491)
                    task.wait(0.025)
					lp.HumanoidRootPart.CFrame = CFrame.new(-556.111572, -7.35040474, 651.426941, -0.766063511, -1.1517696e-07, 0.642764866, -4.87707155e-08, 1, 1.21063692e-07, -0.642764866, 6.13943811e-08, -0.766063511)
                    task.wait(0.025)
					lp.HumanoidRootPart.CFrame = CFrame.new(-406.163055, -6.35040474, -518.774292, -0.963627636, 2.03066879e-08, -0.267248422, -1.42729943e-08, 1, 1.27448985e-07, 0.267248422, 1.26627796e-07, -0.963627636)
                    task.wait(0.025)
					lp.HumanoidRootPart.CFrame = CFrame.new(602.923462, 26.6475773, 133.185562, 0.325559855, 5.51754091e-08, 0.945521414, 2.13931295e-09, 1, -5.90910822e-08, -0.945521414, 2.12604512e-08, 0.325559855)
                    task.wait(0.025)
					lp.HumanoidRootPart.CFrame = CFrame.new(-555.959473, -6.35040426, 651.610535, -0.731328487, -7.58439569e-08, 0.682025373, -6.26779766e-08, 1, 4.39950867e-08, -0.682025373, -1.05731077e-08, -0.731328487)
                    task.wait(0.025)
                end
            end)
        end
    end,
})

local Toggle = Tab:CreateKeybind({
   Name = "Anti Kick Kunai",
   CurrentKeybind = "R",
   HoldToInteract = false,
   Callback = function(Value)
   local lp = game.Players.LocalPlayer
   local t = lp.Character["Left Leg"]
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   spawnItem("NinjaKunai", t.Position)
   task.wait(0.3)
   lp.Character.HumanoidRootPart.CFrame = toy.NinjaKunai.StickyPart.CFrame * CFrame.new(3, 5, 3)
   task.wait(0.1)
   local f = toy.NinjaKunai.StickyPart
   SetNetworkOwner:FireServer(f, f.CFrame)
   lp.Character.Torso.CanCollide = false
   f.CFrame = t.CFrame * CFrame.Angles(0, 0, math.rad(90))
   task.wait(0.03)
   toy.NinjaKunai.Name = "AntiKick"
   lp.Character.Torso.CanCollide = true
	end,
})

local Toggle = Tab:CreateButton({
   Name = "Anti Kick Kunai",
   Callback = function(Value)
   local lp = game.Players.LocalPlayer
   local t = lp.Character["Left Leg"]
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   spawnItem("NinjaKunai", t.Position)
   task.wait(0.3)
   lp.Character.HumanoidRootPart.CFrame = toy.NinjaKunai.StickyPart.CFrame * CFrame.new(0, 5, 0)
   task.wait(0.5)
   local f = toy.NinjaKunai.StickyPart
   SetNetworkOwner:FireServer(f, lp.Character.HumanoidRootPart.CFrame)
   lp.Character.Torso.CanCollide = false
   task.wait(0.1)
   f.CFrame = t.CFrame * CFrame.Angles(0, 0, math.rad(90))
   task.wait(0.03)
   toy.NinjaKunai.Name = "AntiKick"
   lp.Character.Torso.CanCollide = true
	end,
})

local Button = Tab:CreateButton({
   Name = "Break Barrier",
   Callback = function()
   local lp = game.Players.LocalPlayer
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   spawnItem("BallSnowball", lp.Character.HumanoidRootPart.Position)
   task.wait(0.3)
   lp.Character.HumanoidRootPart.CFrame = toy.BallSnowball.SoundPart.CFrame * CFrame.new(3, 1, 3)
   task.wait(0.5)
   SetNetworkOwner:FireServer(toy.BallSnowball.SoundPart, toy.BallSnowball.SoundPart.CFrame)
   --task.wait(0.3)
   --toy.BallSnowball.SoundPart.Velocity = Vector3.new(0, 50, 0)
   task.wait(0.3)
   toy.BallSnowball.SoundPart.CFrame = CFrame.new(323.090332, -5.35040426, 453.156372, 0.438423634, -1.12835792e-07, -0.898768425, 2.95022073e-09, 1, -1.24105767e-07, 0.898768425, 5.17593364e-08, 0.438423634)
   task.wait(0.1)
   toy.BallSnowball.SoundPart.Velocity = Vector3.new(0, -100, 0)
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
			part.CanQuery = false
			game.workspace.Plots.Plot1.PlotArea.CanQuery = false
			else
			part.CanCollide = true
			part.CanQuery = true
			game.workspace.Plots.Plot1.PlotArea.CanQuery = true
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
			part.CanQuery = false
			game.workspace.Plots.Plot2.PlotArea.CanQuery = false
			else
			part.CanCollide = true
			part.CanQuery = true
			game.workspace.Plots.Plot2.PlotArea.CanQuery = true
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
			part.CanQuery = false
			game.workspace.Plots.Plot3.PlotArea.CanQuery = false
			else
			part.CanCollide = true
			part.CanQuery = true
			game.workspace.Plots.Plot3.PlotArea.CanQuery = true
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
			part.CanQuery = false
			game.workspace.Plots.Plot4.PlotArea.CanQuery = false
			else
			part.CanCollide = true
			part.CanQuery = true
			game.workspace.Plots.Plot4.PlotArea.CanQuery = true
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
			part.CanQuery = false
			game.workspace.Plots.Plot5.PlotArea.CanQuery = false
			else
			part.CanCollide = true
			part.CanQuery = true
			game.workspace.Plots.Plot5.PlotArea.CanQuery = true
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
   Name = "Anti Lag",
   CurrentValue = false,
   Callback = function(Value)
      local p = game:GetService("Players")
      local lp = p.LocalPlayer
      lp.PlayerScripts.CharacterAndBeamMove.Disabled = not Value
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
   Title = "Anti Fire",
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
	game.Workspace.FallenPartsDestroyHeight = -10e+37
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

local Tab = Window:CreateTab("Target", 10734964441)

local Section = Tab:CreateSection("Target")

local function GetPlayerList()
    local list = {}
    for _, player in pairs(P:GetPlayers()) do
            table.insert(list, player.Name)
    end
    return list
end

local PlayerDropdown = Tab:CreateDropdown({
    Name = "Set Target",
    Options = GetPlayerList(),
    CurrentOption = {},
    MultipleOptions = false,
    Callback = function(Option)
        Selected = Option[1]
    end,
})

P.PlayerAdded:Connect(function()
    PlayerDropdown:Refresh(GetPlayerList())
end)

P.PlayerRemoving:Connect(function()
    PlayerDropdown:Refresh(GetPlayerList())
end)

local LoopTP = false

Tab:CreateToggle({
    Name = "Loop Banana",
    CurrentValue = false,
    Callback = function(Value)
	local lp = P.LocalPlayer.Character
	local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
	local tar = P:FindFirstChild(Selected)
	local oldpos = lp.HumanoidRootPart.CFrame
        LoopBanana = Value

        if Value then
            task.spawn(function()
                while LoopBanana do
				if toy.FoodBanana then
				toy.FoodBanana.Main.CFrame = tar.Character["Left Leg"].CFrame
				task.wait(0.125)
				toy.FoodBanana.Main.CFrame = CFrame.new(537.325378, 62.6786575, -217.988876, -0.829166114, -2.66711231e-05, 0.55900228, 0.000436577422, 0.999999642, 0.000695285795, -0.559002101, 0.0008205552, -0.829165816)
				task.wait(0.05)
					end
                end
            end)
        end
    end,
})

Tab:CreateToggle({
    Name = "Loop Snowball",
    CurrentValue = false,
    Callback = function(Value)
	local lp = P.LocalPlayer.Character
	local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
	local tar = P:FindFirstChild(Selected)
	local oldpos = lp.HumanoidRootPart.CFrame
        LoopSnowball = Value

        if Value then
            task.spawn(function()
                while LoopSnowball do
				spawnItem("BallSnowball", lp.HumanoidRootPart.Position)
   				task.wait(0.5)
				lp.HumanoidRootPart.CFrame = toy.BallSnowball.SoundPart.CFrame * CFrame.new(5, 1, 5)
				task.wait(0.2)
				SetNetworkOwner:FireServer(toy.BallSnowball.SoundPart, toy.BallSnowball.SoundPart.CFrame)
				task.wait(0.3)
				toy.BallSnowball.SoundPart.CFrame = CFrame.new(0, 1000, 0)
				lp.HumanoidRootPart.CFrame = oldpos
				task.wait(0.3)
				toy.BallSnowball.SoundPart.CFrame = tar.Character.HumanoidRootPart.RagdollTouchedHitbox.CFrame
				task.wait(0.75)
				DestroyT(toysFolder:FindFirstChild("BallSnowball"))
                end
            end)
        end
    end,
})

Tab:CreateToggle({
    Name = "Loop Bomb",
    CurrentValue = false,
    Callback = function(Value)
	local lp = P.LocalPlayer.Character
	local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
	local tar = P:FindFirstChild(Selected)
	local oldpos = lp.HumanoidRootPart.CFrame
        LoopBomb = Value

        if Value then
            task.spawn(function()
                while LoopBomb do
				spawnItem("BombMissile", lp.HumanoidRootPart.Position)
   				task.wait(0.5)
				lp.HumanoidRootPart.CFrame = toy.BombMissile.Button.CFrame * CFrame.new(5, 1, 5)
				task.wait(0.2)
   				SetNetworkOwner:FireServer(toy.BombMissile.Button, toy.BombMissile.Button.CFrame)
				task.wait(0.3)
				toy.BombMissile.Button.CFrame = CFrame.new(0, 10000, 0)
				lp.HumanoidRootPart.CFrame = oldpos
				task.wait(0.1)
				toy.BombMissile.OrientingPart.CFrame = tar.Character.HumanoidRootPart.CFrame
				task.wait(0.3)
				--DestroyT(toysFolder:FindFirstChild("BombMissile"))
                end
            end)
        end
    end,
})

Tab:CreateToggle({
    Name = "Loop NIGGER",
    CurrentValue = false,
    Callback = function(Value)
	local lp = P.LocalPlayer.Character
	local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
	local tar = P:FindFirstChild(Selected)
	local oldpos = lp.HumanoidRootPart.CFrame
        LoopOven = Value
		local function NN()
		while LoopOven do
			task.wait(0.75)
			toy.NIGGER.PaintPlayerPart.CFrame = tar.Character.HumanoidRootPart.CFrame
			toy.NIGGER.GlassWindow.CFrame = tar.Character.HumanoidRootPart.CFrame
			task.wait(0.75)
			toy.NIGGER.PaintPlayerPart.CFrame = CFrame.new(537.325378, 62.6786575, -217.988876, -0.829166114, -2.66711231e-05, 0.55900228, 0.000436577422, 0.999999642, 0.000695285795, -0.559002101, 0.0008205552, -0.829165816)
			toy.NIGGER.GlassWindow.CFrame = CFrame.new(537.325378, 62.6786575, -217.988876, -0.829166114, -2.66711231e-05, 0.55900228, 0.000436577422, 0.999999642, 0.000695285795, -0.559002101, 0.0008205552, -0.829165816)
		end
	end

        if Value == true then
				spawnItem("OvenDarkGray", lp.HumanoidRootPart.Position)
				task.wait(0.5)
				lp.HumanoidRootPart.CFrame = toy.OvenDarkGray.PaintPlayerPart.CFrame * CFrame.new(3, 3, 3)
   				task.wait(1)
   				SetNetworkOwner:FireServer(toy.OvenDarkGray.ButtonOven, toy.OvenDarkGray.ButtonOven.CFrame)
				SetNetworkOwner:FireServer(toy.OvenDarkGray.PaintPlayerPart, toy.OvenDarkGray.PaintPlayerPart.CFrame)
				SetNetworkOwner:FireServer(toy.OvenDarkGray.GlassWindow, toy.OvenDarkGray.GlassWindow.CFrame)
				SetNetworkOwner:FireServer(toy.OvenDarkGray.Main, toy.OvenDarkGray.Main.CFrame)
				task.wait(1)
				toy.OvenDarkGray.Name = "NIGGER"
				task.spawn(function()
				NN()
				end)
				else
				DestroyT(toysFolder:FindFirstChild("NIGGER"))
        end
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
   Name = "Set ASS",
   Callback = function()
   local lp = game.Players.LocalPlayer
   local toy = game.workspace.PlotItems.Plot3
   local h = lp.Character.Torso
   if toy:FindFirstChild("c") then
   toy.FoodCoconut.SoundPart.CFrame = h.CFrame + Vector3.new(-0.7, 0.2, -0.5)
   toy.FoodCoconut.SoundPart.Anchored = true
   toy.FoodCoconut.SoundPart.CanCollide = false
   toy.FoodCoconut.Name = "d"
   else
   toy.FoodCoconut.SoundPart.CFrame = h.CFrame + Vector3.new(-0.7, 0.2, 0.5)
   toy.FoodCoconut.SoundPart.Anchored = true
   toy.FoodCoconut.SoundPart.CanCollide = false
   toy.FoodCoconut.Name = "c"  
	end
end,
})

local Button = Tab:CreateButton({
   Name = "Boobs",
   Callback = function()
	local lp = game.Players.LocalPlayer
local toy = game.workspace.PlotItems.Plot3
local h = P:FindFirstChild(Selected)

if toy:FindFirstChild("a") and toy:FindFirstChild("b") then
    while true do
        local torsoCF = h.Character.Torso.CFrame
        local lookVector = torsoCF.LookVector
        local rightVector = torsoCF.RightVector
        local upVector = torsoCF.UpVector
        local basePosition = torsoCF.Position + lookVector * 0.65
        local invertedOrientation = CFrame.Angles(math.rad(180), 0, 0)
        
        local posA = basePosition - rightVector * 0.5 + upVector * 0.2
        toy.a.SoundPart.CFrame = CFrame.new(posA) * invertedOrientation
        
        local posB = basePosition + rightVector * 0.5 + upVector * 0.2
        toy.b.SoundPart.CFrame = CFrame.new(posB) * invertedOrientation
        
        toy.a.SoundPart.Velocity = Vector3.new(0, 0.1, 0)
        toy.b.SoundPart.Velocity = Vector3.new(0, 0.1, 0)
        toy.a.SoundPart.Anchored = false
        toy.b.SoundPart.Anchored = false
        
        wait(0.01)
    end
end
end,
})

local Button = Tab:CreateButton({
   Name = "ASS",
   Callback = function()
	local lp = game.Players.LocalPlayer
local toy = game.workspace.PlotItems.Plot3
local h = P:FindFirstChild(Selected)

if toy:FindFirstChild("c") and toy:FindFirstChild("d") then
    while true do
        local torsoCF = h.Character.Torso.CFrame
        local lookVector = torsoCF.LookVector
        local rightVector = torsoCF.RightVector
        local upVector = torsoCF.UpVector
        local basePosition = torsoCF.Position + lookVector * -0.5
		local invertedOrientation = CFrame.Angles(math.rad(180), 0, 0)

		local posC = basePosition - rightVector * 0.5 + upVector * -0.85
        toy.c.SoundPart.CFrame = CFrame.new(posC) * invertedOrientation

		local posD = basePosition - rightVector * -0.5 + upVector * -0.85
        toy.d.SoundPart.CFrame = CFrame.new(posD) * invertedOrientation

        toy.c.SoundPart.Velocity = Vector3.new(0, 0.1, 0)
	    toy.d.SoundPart.Velocity = Vector3.new(0, 0.1, 0)
	    toy.c.SoundPart.Anchored = false
		toy.d.SoundPart.Anchored = false
        wait(0.01)
    end
end
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

local Tab = Window:CreateTab("Other", 10734964441)

local Section = Tab:CreateSection("Settings")

local Toggle = Tab:CreateButton({
   Name = "???",
   Callback = function(Value)
   local lp = game.Players.LocalPlayer
   local toy = workspace:FindFirstChild(lp.Name.."SpawnedInToys")
   local t = lp.Character.HumanoidRootPart
   spawnItem("Pencil", t)
   task.wait(0.5)
   SetNetworkOwner:FireServer(toy.ToolPencil.SoundPart)
   task.wait(1)
   local f = toy.ToolPencil.StickyPart
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

local Slider = Tab:CreateSlider({
   Name = "Map Noises",
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
   Name = "Screams",
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

local ez = Instance.new("Sound")
ez.SoundId = "rbxassetid://17148249625"
ez.Parent = workspace
ez.Volume = 0.25
ez:Play()
task.wait(3)
	ez:Destroy()
game.workspace.SpawnLocation.Decal.Texture = "rbxasset://textures/face.png"
