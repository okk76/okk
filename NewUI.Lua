local P = game:GetService("Players")
local LocalPlayer = P.LocalPlayer
local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
LocalPlayer.CharacterAdded:Connect(function(NewChar)
	char = NewChar
end)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local CharacterEvents = ReplicatedStorage:WaitForChild("CharacterEvents")
local Struggle = CharacterEvents:WaitForChild("Struggle")
local GrabEvents = ReplicatedStorage:WaitForChild("GrabEvents")
local SetNetworkOwner = GrabEvents:WaitForChild("SetNetworkOwner")
local toysFolder = game.workspace:FindFirstChild(LocalPlayer.Name.."SpawnedInToys")
local UserInputService = game:GetService("UserInputService")
local Debris = game:GetService("Debris")
local group = game.workspace
local spaw = game.workspace.SpawnLocation
local hue = 0

game.Workspace.Map.MapNoises.NoisePart1.Sound1.Volume = 0
game.Workspace.Map.MapNoises.NoisePart2.Sound1.Volume = 0
game.Workspace.Map.MapNoises.NoisePart3.Sound1.Volume = 0
game.Workspace.Map.MapNoises.NoisePart4.Sound1.Volume = 0
game.Workspace.Map.MapNoises.NoisePart5.Sound1.Volume = 0
game.Workspace.Map.MapNoises.NoisePart6.Sound1.Volume = 0
game.Workspace.Map.MapNoises.NoisePart7.Sound1.Volume = 0
game.Workspace.Map.MapNoises.NoisePart8.Sound1.Volume = 0
game.Workspace.Map.MapNoises.NoisePart9.Sound1.Volume = 0
game.Workspace.Map.MapNoises.NoisePart10.Sound1.Volume = 0

spaw.Position = Vector3.new(spaw.Position, -10.85, spaw.Position)
spaw.Decal.Transparency = 0.8
RunService.Heartbeat:Connect(function()
spaw.Orientation = spaw.Orientation + Vector3.new(0, math.rad(10) * 0.1, 0)
task.wait(0.1)
end)

local function spawnItem(itemName, position, orientation)
    task.spawn(function()
        local cframe = CFrame.new(position)
        local rotation = Vector3.new(0, 90, 0)
        ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(itemName, cframe, rotation)
    end)
end

local function DestroyT(toy)
    local toy = toy or toysFolder:FindFirstChildWhichIsA("Model")
    ReplicatedStorage.MenuToys.DestroyToy:FireServer(toy)
end

local function createline()
	GrabEvents.CreateGrabLine:FireServer(spaw, spaw.CFrame)
end

local function destroyline()
	GrabEvents.DestroyGrabLine:FireServer(spaw, spaw.CFrame)
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()

local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true
local Window = Library:CreateWindow({
	Title = "Happy Mod",
	Footer = "это красти краб? нет это патрик",
	NotifySide = "Right",
	ShowCustomCursor = false,
})

local Tabs = {
	Main = Window:AddTab("Main"),
	Target = Window:AddTab("Target"),
	Fun = Window:AddTab("Fun"),
	Keybinds = Window:AddTab("Keybinds"),
	["UI Settings"] = Window:AddTab("UI Settings"),
}

local LP = Tabs.Main:AddLeftGroupbox("LocalPlayer")
local GB = Tabs.Main:AddLeftGroupbox("GrabLine")
local DF = Tabs.Main:AddRightGroupbox("Defense")
local KB = Tabs.Keybinds:AddLeftGroupbox("Teleports")
local FKB = Tabs.Keybinds:AddRightGroupbox("Functions")
local TR = Tabs.Target:AddLeftGroupbox("Target")
local CTR = Tabs.Target:AddRightGroupbox("Control")
local BL = Tabs.Target:AddLeftGroupbox("Blobman Settings")
local FN = Tabs.Fun:AddLeftGroupbox("Functions")

LP:AddSlider("WalkSpeed", {
	Text = "WalkSpeed",
	Default = 16,
	Min = 16,
	Max = 500,
	Rounding = 1,
	Compact = false,
	Callback = function(Value)
    if char and char:FindFirstChild("Humanoid") then
    char.Humanoid.WalkSpeed = Value
    end
   	char.BobbingAndCrouch.Enabled = false
   	char.BobbingAndCrouch.Enabled = true

   	LocalPlayer.CharacterAdded:Connect(function(char)
  	char:WaitForChild("Humanoid")
  	char.Humanoid.WalkSpeed = Value
  	char.BobbingAndCrouch.Enabled = false
  	char.BobbingAndCrouch.Enabled = true
    end)
	end,
})

LP:AddSlider("JumpPower", {
	Text = "JumpPower",
	Default = 24,
	Min = 24,
	Max = 300,
	Rounding = 1,
	Compact = false,
	Callback = function(Value)
    if char and char:FindFirstChild("Humanoid") then
    char.Humanoid.JumpPower = Value
    end
   	char.BobbingAndCrouch.Enabled = false
   	char.BobbingAndCrouch.Enabled = true

   	LocalPlayer.CharacterAdded:Connect(function(char)
  	char:WaitForChild("Humanoid")
  	char.Humanoid.JumpPower = Value
    end)
	end,
})

LP:AddSlider("Gravity", {
	Text = "Gravity",
	Default = 100,
	Min = 0,
	Max = 100,
	Rounding = 1,
	Compact = false,
	Callback = function(Value)
		game.workspace.Gravity = Value
	end,
})

LP:AddSlider("FOV", {
	Text = "FOV",
	Default = 70,
	Min = 70,
	Max = 120,
	Rounding = 1,
	Compact = false,
	Callback = function(Value)
		game.workspace.Camera.FieldOfView = Value
	end,
})

LP:AddToggle("Trd", {
	Text = "Unlock 3rd Person",
	Default = false,
	Callback = function(Value)
	local es = true
	local function legs()
	if not char:FindFirstChild("Left Leg") or not char:FindFirstChild("Right Leg") then
	es = false
	else
	es = true
	end
   end
   if Value then
   legs()
   LocalPlayer.CameraMaxZoomDistance = 100000
   LocalPlayer.CameraMode = 0
   LocalPlayer.DevEnableMouseLock = true
   lico = RunService.Heartbeat:Connect(function()
   char.Torso.Transparency = 0
   char.Head.Transparency = 0
   char["Left Arm"].Transparency = 0
   char["Right Arm"].Transparency = 0
   if es then
   char["Left Leg"].Transparency = 0
   char["Right Leg"].Transparency = 0
   else
   task.wait()
   end
   for _, part in ipairs(char:GetChildren()) do
        if part:IsA("Accessory") then
        part.Handle.Transparency = 0
		if part.Name == "TypingKeyboardMyWorld" then
			char.TypingKeyboardMyWorld:Destroy()
			else
			task.wait()
		end
    end
end
end)
	else
	if lico then
		lico:Disconnect()
		lico = nil
		LocalPlayer.CameraMaxZoomDistance = 0.5
   		LocalPlayer.CameraMode = 1
		LocalPlayer.DevEnableMouseLock = false
	end
	end
	end,
})

LP:AddToggle("PLCD", {
	Text = "PLCD",
	Default = false,
	Callback = function(Value)
	if Value then
	plcd = RunService.Heartbeat:Connect(function()
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "PlayerCharacterLocationDetector" and part:IsA("Part") then
            part.Transparency = 0.85
			part.Material = Enum.Material.Neon
 			hue = (hue + 0.00005) % 1
 			part.Color = Color3.fromHSV(hue, 1, 1)
		end
	end
end)
else
	if plcd then
	plcd:Disconnect()
	plcd = nil
	for _, part in ipairs(group:GetChildren()) do
        if part.Name == "PlayerCharacterLocationDetector" and part:IsA("Part") then
            part.Transparency = 1
			end
		end
	end
	end
	end,
})

LP:AddLabel("TP Mouse"):AddKeyPicker("KeyPicker", {
	Default = "Z",
	Callback = function()
	local mouse = LocalPlayer:GetMouse()
	local char = LocalPlayer.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
	char.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))  
	end
	end,
})

LP:AddToggle("LoopRagdoll", {
	Text = "Loop Ragdoll",
	Default = false,
	Callback = function(Value)
	if Value then
	rag = true
	task.spawn(function()
    while rag do
    ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(char.HumanoidRootPart)
    task.wait()
	end
    end)
   	else
	rag = false
	end
	end,
})

--local MyButton = LP:AddButton({
	--Text = "R",
	--Func = function()
		--Toggles.AntiInputLag:SetValue(false)
	--end,
--})

GB:AddSlider("StrengthPower", {
	Text = "Strength Power",
	Default = 300,
	Min = 300,
	Max = 40000,
	Rounding = 1,
	Compact = false,
	Callback = function(Value)
        strength = Value
    end,
})

GB:AddToggle("Strength", {
    Text = "Strength",
	Default = false,
	Callback = function(on)
        if on then
            strengthCon = game.workspace.ChildAdded:Connect(function(model)
                if model.Name == "GrabParts" then
                    local partToImpulse = model.GrabPart.WeldConstraint.Part1
                    if partToImpulse then
                        local fling = Instance.new("BodyVelocity", partToImpulse)
                        model:GetPropertyChangedSignal("Parent"):Connect(function()
                            if not model.Parent then
                                if UserInputService:GetLastInputType() == Enum.UserInputType.MouseButton2 then
                                    fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                    fling.Velocity = game.workspace.CurrentCamera.CFrame.LookVector * strength
                                    Debris:AddItem(fling, 1)
                                else
                                    fling:Destroy()
                                end
                            end
                        end)
                    end
                end
            end)
        elseif strengthCon then
            strengthCon:Disconnect()
        end
    end,
})

GB:AddToggle("Strong", {
	Text = "Massless Grab",
	Default = false,
	Callback = function(Value)
	local d = game.ReplicatedFirst.GrabParts.DragPart
	if Value then
		d.AlignPosition.ForceLimitMode = 1
		d.AlignPosition.Responsiveness = 200
		d.AlignPosition.MaxAxesForce = Vector3.new(10e+37, 10e+37, 10e+37)
		d.AlignOrientation.Responsiveness = 200
		d.AlignOrientation.MaxTorque = 10e+37
		else
		d.AlignPosition.ForceLimitMode = 0
		d.AlignPosition.Responsiveness = 40
		d.AlignPosition.MaxAxesForce = Vector3.new(10000, 10000, 10000)
		d.AlignOrientation.Responsiveness = 30
		d.AlignOrientation.MaxTorque = 600000
	end
	end,
})

GB:AddToggle("FartherReach", {
    Text = "FartherReach",
	Default = false,
	Callback = function(on)
	local Activator = game.ReplicatedStorage.MenuToys.LimitedTimeToyEvent
	local dead
	if on then
	local LineTexture = LocalPlayer:FindFirstChild("FartherReach")
    if LineTexture then
    LineTexture:Destroy()
	end
    local LineTexture = Instance.new("BoolValue")
    LineTexture.Name = "FartherReach"
    LineTexture.Value = true
    LineTexture.Parent = LocalPlayer
	char.GrabbingScript.Enabled = false
    char.GrabbingScript.Enabled = true
	task.delay(0.1, function()
    Activator:FireServer()
    end)
	dead = LocalPlayer.CharacterAdded:Connect(function(Character)
            Character:WaitForChild("GrabbingScript")
            Toggles.FartherReach:SetValue(false)
            Toggles.FartherReach:SetValue(true)
        end)
	else
	local LineTexture = LocalPlayer:FindFirstChild("FartherReach")
	if LineTexture then
	LineTexture:Destroy()
	end
	char.GrabbingScript.Enabled = false
    char.GrabbingScript.Enabled = true
	if dead then
	dead:Disconnect()
	dead = nil
	end
	end
    end,
})

GB:AddSlider("PacketStrength", {
        Text = "Packet Lag Strength",
        Default = 300,
        Min = 100,
        Max = 5000,
        Rounding = 0,
        Callback = function(Value)
            PacketAmount = Value
        end
    })

GB:AddToggle("PacketLag", {
        Text = "Packet Lag",
        Default = false,
        Callback = function(Value)
		local extGrabLineEvent = GrabEvents:WaitForChild("ExtendGrabLine")
		if Value then
		PacketLag = true
            task.spawn(function()
                while PacketLag do
                    pcall(function()
                        extGrabLineEvent:FireServer(string.rep("veseliepaketikiveseliepaketikiveseliepaketiki", PacketAmount))
                    end)
                    task.wait()
                end
            end)
        else
            PacketLag = false
        end
	end,
})

DF:AddToggle("AntiGrab", {
	Text = "Anti Grab",
	Default = false,
	Callback = function(Value)
		if Value then
            autoStruggleCoroutine = RunService.Heartbeat:Connect(function()
                local character = LocalPlayer.Character
                if character and character:FindFirstChild("Head") then
                    local head = character.Head
                    local partOwner = head:FindFirstChild("PartOwner")
                    if partOwner then
                        Struggle:FireServer()
                        ReplicatedStorage.GameCorrectionEvents.StopAllVelocity:FireServer()
                        for _, part in pairs(character:GetChildren()) do
                            if part:IsA("BasePart") then
                                part.Anchored = true
                            end
                        end
                        while LocalPlayer.IsHeld.Value do
                            wait()
                        end
                        for _, part in pairs(character:GetChildren()) do
                            if part:IsA("BasePart") then
                                part.Anchored = false
                            end
                        end
                    end
                end
            end)
        else
            if autoStruggleCoroutine then
                autoStruggleCoroutine:Disconnect()
                autoStruggleCoroutine = nil
            end
        end
	end,
})

DF:AddToggle("AntiVoid", {
	Text = "Anti Void",
	Default = false,
	Callback = function(Value)
	if Value then
	game.Workspace.FallenPartsDestroyHeight = -10e+37
   	else
	game.Workspace.FallenPartsDestroyHeight = -100
	end
	end,
})

local MyButton = DF:AddButton({
	Text = "Anti Banana (Delete Legs)",
	Func = function()
	repeat
	ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(char.HumanoidRootPart, 3)
	task.wait()
	until char.Humanoid.Ragdolled.Value == true or char.Humanoid.Health == 0
	char["Left Leg"].CFrame = CFrame.new(100000, -100000, 100000)
	char["Right Leg"].CFrame = CFrame.new(100000, -100000, 100000)
	task.wait(0.1)
	spawnItem("FoodPlate", char.HumanoidRootPart.Position + Vector3.new(0, 0, 20))
	local startWait = tick()
    repeat 
    RunService.Heartbeat:Wait()
	plate = toysFolder:FindFirstChild("FoodPlate")
    until plate or tick() - startWait > 2
	task.wait(0.25)
	DestroyT(plate)
	task.spawn(function()
    while char.Humanoid.Health > 0 do
	char.Humanoid.HipHeight = 2
	task.wait()
	end
	end)
	end,
})


DF:AddToggle("AntiLag", {
	Text = "Anti Lag",
	Default = false,
	Callback = function(Value)
	if Value then
LocalPlayer.PlayerScripts.CharacterAndBeamMove.Disabled = true
   	else
LocalPlayer.PlayerScripts.CharacterAndBeamMove.Disabled = false
	end
	end,
})

DF:AddToggle("WaterWalk", {
	Text = "WaterWalk",
	Default = false,
	Callback = function(Value)
	local water = game.Workspace.Map.AlwaysHereTweenedObjects.Ocean.Object:FindFirstChild("ObjectModel")
if water then
    for _, part in ipairs(water:GetChildren()) do
        if part.Name == "Ocean" and part:IsA("Part") then
            part.CanCollide = Value
        end
    end
end
	end,
})

DF:AddSlider("WaterTransparency", {
	Text = "Water Transparency",
	Default = 0,
	Min = 0,
	Max = 1,
	Rounding = 1,
	Compact = false,
	Callback = function(Num)
	local water = game.Workspace.Map.AlwaysHereTweenedObjects.Ocean.Object:FindFirstChild("ObjectModel")
if water then
    for _, part in ipairs(water:GetChildren()) do
        if part.Name == "Ocean" and part:IsA("Part") then
            part.Transparency = Num
        end
    end
end
	end,
})

DF:AddToggle("LoopTp", {
	Text = "Loop TP",
	Default = false,
	Callback = function(Value)
	LoopTP = Value
        if Value then
            task.spawn(function()
                while LoopTP do
            local x = math.random(-500, 500)
			local y = math.random(30, 480)
			local z = math.random(-500, 500)
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
			task.wait(0.03)
				end
			end)
		else
		task.wait(0.3)
		LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0)
        end
		
	end,
})

DF:AddToggle("DisableBarrierCollisions", {
	Text = "Disable Barrier Collisions",
	Default = false,
	Callback = function(Value)
	for plotNumber = 1, 5 do
            local plotName = "Plot" .. plotNumber
            local plot = game.Workspace.Plots[plotName]
            
            if plot then
                -- Обработка Barrier
                local group = plot:FindFirstChild("Barrier")
                if group then
                    for _, part in ipairs(group:GetChildren()) do
                        if part.Name == "PlotBarrier" and part:IsA("Part") then
                            part.CanCollide = not Value
                            part.CanQuery = not Value
                        end
                    end
                end
                
                -- Обработка PlotArea
                local plotArea = plot:FindFirstChild("PlotArea")
                if plotArea and plotArea:IsA("BasePart") then
                    plotArea.CanQuery = not Value
                end
            end
        end
	end,
})

local MyButton = DF:AddButton({
	Text = "Break Barrier",
	Func = function()
	local hrp = char:FindFirstChild("HumanoidRootPart")
		spawnItem("FoodHamburger", spaw.Position + Vector3.new(0, 100, 0))
		local startWait = tick()
        repeat 
        RunService.Heartbeat:Wait()
		breaker = toysFolder:FindFirstChild("FoodHamburger")
        until breaker or tick() - startWait > 1
		task.wait(0.05)
		breaker.HoldPart.HoldItemRemoteFunction:InvokeServer(breaker, char)
		task.wait()
		ReplicatedStorage.HoldEvents.Use:FireServer(breaker)
		task.wait(1.88)
		hrp.CFrame = CFrame.new(250, 1, 460)
	end,
})

DF:AddToggle("AntiKick", {
	Text = "Anti Kick",
	Default = false,
	Callback = function(Value)
		_G.ShurikenAntiKick = Value

			local function ClearKunai()
				local plr = game.Players.LocalPlayer
				local inv = workspace:FindFirstChild(plr.Name.."SpawnedInToys")
				local destroyrem = game.ReplicatedStorage:FindFirstChild("MenuToys") and game.ReplicatedStorage.MenuToys:FindFirstChild("DestroyToy")
				
				if inv and destroyrem then
					for _, v in pairs(inv:GetChildren()) do
						if v.Name == "AntiKick" or v.Name == "NinjaShuriken" then
							pcall(function() destroyrem:FireServer(v) end)
						end
					end
				end
			end

			if Value then
				task.spawn(function()
					local plr = game.Players.LocalPlayer
					local ReplicatedStorage = game:GetService("ReplicatedStorage")
					
					local setOwner = ReplicatedStorage:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")
					local stickyEvent = ReplicatedStorage:WaitForChild("PlayerEvents"):WaitForChild("StickyPartEvent")
					local spawnRemote = ReplicatedStorage.MenuToys.SpawnToyRemoteFunction
					local destroyrem = ReplicatedStorage:WaitForChild("MenuToys"):WaitForChild("DestroyToy")
					local canSpawn = plr:WaitForChild("CanSpawnToy")

					local function getHRP()
						if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
							return plr.Character.HumanoidRootPart
						else
							local character = plr.CharacterAdded:Wait()
							return character:WaitForChild("HumanoidRootPart")
						end
					end

					local function CheckForHome()
						if not workspace.PlotItems.PlayersInPlots:FindFirstChild(plr.Name) then 
							return false
						end
						for _, v in pairs(workspace.Plots:GetChildren()) do
							local sign = v:FindFirstChild("PlotSign")
							local owners = sign and sign:FindFirstChild("ThisPlotsOwners")
							if owners then
								for _, b in pairs(owners:GetChildren()) do
									if b.Value == plr.Name then
										local folder = workspace.PlotItems:FindFirstChild(v.Name)
										if folder then return true, folder end
									end
								end
							end
						end
						return false
					end

					local function StickKunai(kunai)
						if not kunai or not kunai:FindFirstChild("StickyPart") then return end
						local currentHRP = getHRP()
						if not currentHRP then return end
						
						if kunai:FindFirstChild("SoundPart") then
							if not kunai.SoundPart:FindFirstChild("PartOwner") or kunai.SoundPart.PartOwner.Value ~= plr.Name then 
								setOwner:FireServer(kunai.SoundPart, kunai.SoundPart.CFrame)
							end
						end
						
						local firePart = currentHRP:FindFirstChild("FirePlayerPart") or currentHRP:WaitForChild("FirePlayerPart", 5)
						if firePart then
							stickyEvent:FireServer(kunai.StickyPart, firePart, CFrame.new(0, 0, 0) * CFrame.Angles(0,math.rad(90),math.rad(90)))
						end
						
						for _, obj in pairs(kunai:GetChildren()) do
							if obj.Name == "Pyramid" then
								obj.CanTouch = false; obj.CanCollide = false; obj.CanQuery = false;
								if not obj:FindFirstChild("Highlight") then
									local high = Instance.new("Highlight", kunai)
									high.FillTransparency = 1
								end
							end
						end
					end

					local function SpawnToy(name)
						local t = tick()
						while not canSpawn.Value do
							if not _G.ShurikenAntiKick or tick() - t > 5 then return nil end
							task.wait(0.1)
						end

						local currentHRP = getHRP()
						if currentHRP then
							task.spawn(function()
								pcall(function()
									spawnRemote:InvokeServer(name, currentHRP.CFrame * CFrame.new(0, 12, 20), Vector3.new(0,0,0))
								end)
							end)
						end
						
						local boolik, house = CheckForHome()
						local inv = workspace:FindFirstChild(plr.Name.."SpawnedInToys")
						
						if boolik and house then 
							return house:WaitForChild(name, 2)
						elseif not workspace.PlotItems.PlayersInPlots:FindFirstChild(plr.Name) and inv then 
							return inv:WaitForChild(name, 2)
						end
						return nil
					end

					while _G.ShurikenAntiKick do 
						task.wait(0.005)

						if not plr.Character or not plr.Character:FindFirstChild("Humanoid") or plr.Character.Humanoid.Health <= 0 then 
							continue 
						end
						
						local inv = workspace:FindFirstChild(plr.Name.."SpawnedInToys")
						local kunai = inv and inv:FindFirstChild("NinjaShuriken")
						
						if workspace.PlotItems.PlayersInPlots:FindFirstChild(plr.Name) then 
							local boolik, house = CheckForHome()
							if boolik and house and workspace.Plots:FindFirstChild(house.Name) then
								local sign = workspace.Plots[house.Name]:FindFirstChild("PlotSign")
								if sign and sign.ThisPlotsOwners.Value.TimeRemainingNum.Value > 89 then 
									kunai = SpawnToy("NinjaShuriken")
									if kunai == nil then continue end
									kunai.Name = "AntiKick" 
									StickKunai(kunai)
								end
							end
						end
						
						if not kunai then
							if workspace.PlotItems.PlayersInPlots:FindFirstChild(plr.Name) then continue end 
							kunai = SpawnToy("NinjaShuriken")
							if kunai == nil then continue end 
							kunai.Name = "AntiKick"
							if not kunai then continue end 
						end
						
						repeat
							if kunai and kunai:FindFirstChild("StickyPart") and kunai.StickyPart.CanTouch == true then
								StickKunai(kunai)
								kunai.Name = "AntiKick"
							end
							task.wait(0.3)
						until not kunai or not _G.ShurikenAntiKick
							or not kunai:FindFirstChild("StickyPart")
							or kunai.StickyPart.CanTouch == false 
							or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") 
							or not kunai:FindFirstChild("StickyPart") 
							or (plr.Character.HumanoidRootPart.Position - kunai.StickyPart.Position).Magnitude >= 20

						if not kunai or not kunai:FindFirstChild("StickyPart") or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") or (plr.Character.HumanoidRootPart.Position - kunai.StickyPart.Position).Magnitude >= 20 then 
							ClearKunai()
						end 
						
						pcall(function()
							repeat
								task.wait(0.05)
							until not _G.ShurikenAntiKick or not plr.Character or not plr.Character:FindFirstChild("Humanoid") or not kunai or not kunai:FindFirstChild("StickyPart") or not kunai.StickyPart:FindFirstChild("StickyWeld") or not kunai.StickyPart.StickyWeld.Part1
							
							if not kunai or not kunai:FindFirstChild("StickyPart") or (plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health <= 0) or not kunai["StickyPart"]:FindFirstChild("StickyWeld").Part1 then 
								ClearKunai()
							end
						end)
					end
				end)
			else
			_G.ShurikenAntiKick = false
			ClearKunai()
		end
	end,
})

DF:AddDropdown("Anti Input Lag Item", {
	Values = { "PoopPileSparkle", "FoodHamburger", "CupMugWhite", "FoodBanana", "FoodCoconut", "FoodSodaCan", "CupMugBrown", "FoodBread", "FoodBroccoli", "FoodDippyEgg", "FoodDonut", "FoodHotdog", "FoodMayonnaise", "FoodMeatStick", "FoodMushroomPoison", "FoodPizzaCheese", "PoopPile", "FoodPizzaPepperoni", "FoodFrenchFries", "FoodCakePink", "InstrumentBrassBugle", "InstrumentBrassTrumpet", "InstrumentBrassVuvuzela", "InstrumentDrumBongos", "InstrumentDrumSnare", "InstrumentGuitarAcoustic", "InstrumentGuitarBanjo", "InstrumentGuitarLyre", "InstrumentGuitarUkulele", "InstrumentGuitarViolin", "InstrumentPianoKeyboard", "InstrumentPianoMelodica", "InstrumentVoiceMicrophone", "InstrumentWoodwindOcarina", "InstrumentWoodwindSaxophone" },
	Default = nil, -- number index of the value / string
	Multi = false, -- true / false, allows multiple choices to be selected
	Callback = function(Value)
		selectedItem = Value
	end,
})

DF:AddToggle("AntiInputLag", {
	Text = "Anti Input Lag",
	Default = false,
	Callback = function(Value)
	local Item = selectedItem
	local hrpp = char:FindFirstChild("HumanoidRootPart").Position
	local toy = toysFolder:FindFirstChild(Item)

	local function checkantiunput()
		if toysFolder:FindFirstChild(Item) then
		task.wait()
		else
		spawnItem(Item, spaw.Position + Vector3.new(0, 100, 0))
		local startWait = tick()
        repeat 
        RunService.Heartbeat:Wait()
		toy = toysFolder:FindFirstChild(Item)
        until toy or tick() - startWait > 1 or Value == false

		local holdPart = toy:FindFirstChild("HoldPart")
		end
	end

	if Value then
	antiinput = true
		spawnItem(Item, spaw.Position + Vector3.new(0, 100, 0))
		local startWait = tick()
        repeat 
        RunService.Heartbeat:Wait()
		toy = toysFolder:FindFirstChild(Item)
        until toy or tick() - startWait > 1 or Value == false
		local holdPart = toy:FindFirstChild("HoldPart")
		task.spawn(function()
		while antiinput do
		checkantiunput()
		task.wait()
		holdPart.HoldItemRemoteFunction:InvokeServer(toy, char)
		task.wait()
		holdPart.DropItemRemoteFunction:InvokeServer(toy, spaw.CFrame * CFrame.new(0, 500000, 0), Vector3.new(0, 0, 0))
		toy.SoundPart.CanCollide = false
		end
		end)
	else
		antiinput = false
		if toysFolder:FindFirstChild(Item) then
		DestroyT(toy)
		else
		task.wait()
		end
      end
    end,
})

local function getPlayerList()
    local list = {}
    for _, player in pairs(P:GetPlayers()) do
            table.insert(list, player.DisplayName .. " (" .. player.Name .. ")")
    end
    return list
end

P.PlayerAdded:Connect(function()
    Options.TargetPlayer:SetValues(getPlayerList())
end)

P.PlayerRemoving:Connect(function()
    Options.TargetPlayer:SetValues(getPlayerList())
end)

local function getPlayerFromSelection(selection)
		if not selection then return nil end
		local username = selection:match("%((.-)%)")
		if username then
			return P:FindFirstChild(username)
		end
		return nil
	end

TR:AddDropdown("TargetPlayer", {
		Values = getPlayerList(),
		Default = 1,
		Multi = false,
		Callback = function(Selected)
			selectedTarget = getPlayerFromSelection(Selected)
		end,
	})

Options.TargetPlayer:OnChanged(function()
Toggles.GrabAntiKick:SetValue(false)
task.wait()
Toggles.GrabAntiKick:SetValue(true)
end)

local MyButton = CTR:AddButton({
	Text = "Kill",
	Func = function()
		local tar = selectedTarget
		local pos = char.HumanoidRootPart.CFrame
		char.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
		task.wait(0.25)
		repeat
		char.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
		SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
		task.wait()
		until tar.Character.Humanoid.Sit == true and tar.Character.Head.PartOwner.Value == LocalPlayer.Name
		tar.Character.Humanoid.Health = 0
		GrabEvents.CreateGrabLine:FireServer(tar.Character.HumanoidRootPart, Vector3.zero, tar.Character.HumanoidRootPart.Position, false)   
		GrabEvents.DestroyGrabLine:FireServer(tar.Character.HumanoidRootPart)
    	task.wait(0.1)
    	char.HumanoidRootPart.CFrame = pos
	end,
})

local MyButton = CTR:AddButton({
	Text = "Bring Target Grab",
	Func = function()
		local tar = selectedTarget
		local pos = char.HumanoidRootPart.CFrame
		char.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
		task.wait(0.25)
		repeat
		char.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
		SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
		task.wait()
		until tar.Character.Humanoid.Sit == true and tar.Character.Head.PartOwner.Value == LocalPlayer.Name or Value == false
		tar.Character.HumanoidRootPart.CFrame = pos
    	char.HumanoidRootPart.CFrame = pos
		GrabEvents.CreateGrabLine:FireServer(tar.Character.HumanoidRootPart, Vector3.zero, tar.Character.HumanoidRootPart.Position, false)   
		GrabEvents.DestroyGrabLine:FireServer(tar.Character.HumanoidRootPart)
	end,
})

local MyButton = CTR:AddButton({
	Text = "Bring Target Blob",
	Func = function()
		local tar = selectedTarget
		local pos = char.HumanoidRootPart.CFrame
		local hum = char and char:FindFirstChild("Humanoid")
		local seat = hum and hum.SeatPart
		local seatParent = seat.Parent
		local grabB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
		local dropB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
		local leftDet = seatParent:FindFirstChild("LeftDetector")
		local leftWeld = leftDet and leftDet:FindFirstChild("LeftWeld")
		char.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
		task.wait(0.25)
		grabB:FireServer(leftDet, tar.Character.HumanoidRootPart, leftWeld)
		task.wait(0.25)
		SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
    	char.HumanoidRootPart.CFrame = pos
		task.wait(0.75)
		dropB:FireServer(leftWeld, tar.Character.HumanoidRootPart)
	end,
})

local MyButton = CTR:AddButton({
	Text = "Remove Legs and Arms",
	Func = function()
		local tar = selectedTarget
		local hrp = char:FindFirstChild("HumanoidRootPart")
		game.Workspace.FallenPartsDestroyHeight = -100
		tar.Character["Left Leg"].CFrame = CFrame.new(100000, -100000, 100000)
		tar.Character["Right Leg"].CFrame = CFrame.new(100000, -100000, 100000)
		tar.Character["Left Arm"].CFrame = CFrame.new(100000, -100000, 100000)
		tar.Character["Right Arm"].CFrame = CFrame.new(100000, -100000, 100000)
		task.wait(0.25)
		spawnItem("ChildrensTableBenchSmall", tar.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 20))
		local startWait = tick()
    	repeat 
    	RunService.Heartbeat:Wait()
		palletr = toysFolder:FindFirstChild("ChildrensTableBenchSmall")
    	until palletr or tick() - startWait > 1
		task.wait(0.25)
		if palletr then
		DestroyT(palletr)
		else
		task.wait()
		end
		game.Workspace.FallenPartsDestroyHeight = -10e+37
	end,
})

CTR:AddCheckbox("LoopGrabLock", {
	Text = "Loop Grab Lock",
	Default = false,
	Callback = function(Value)
		lock = Value
	end,
})

CTR:AddToggle("LoopGrab", {
	Text = "Loop Grab",
	Default = false,
	Callback = function(Value)
	local tar = selectedTarget
	lok = lock
	local function ragdoll()
	while Lgrab do
	task.wait(0.05)
	pallet.SoundPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0)
	task.wait()
	pallet.SoundPart.CFrame = CFrame.new(0, 1000000, 0)
	end
	end
	if Value then
	Lgrab = true
	spawnItem("FoodPlate", char.HumanoidRootPart.Position + Vector3.new(0, 5, 20))
	local startWait = tick()
	repeat 
    RunService.Heartbeat:Wait()
	pallet = toysFolder:FindFirstChild("FoodPlate")
    until pallet or tick() - startWait > 3
	task.wait(0.2)
	SetNetworkOwner:FireServer(pallet.SoundPart, pallet.SoundPart.CFrame)
	pallet.SoundPart.CanCollide = false
	pallet.SoundPart.Transparency = 1
	local bodypos = Instance.new("BodyPosition")
	bodypos.MaxForce = Vector3.new(10e+37, 10e+37, 10e+37)
	bodypos.D = 12500
	bodypos.Position = Vector3.new(0, 1000000, 0)
	bodypos.Parent = toysFolder:FindFirstChild("FoodPlate").SoundPart
	char.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
	task.wait(0.25)
	if lok then
	local bop = Instance.new("BodyPosition")
	bop.Position = tar.Character.HumanoidRootPart.Position
	bop.MaxForce = Vector3.new(10e+37, 10e+37, 10e+37)
	bop.Parent = tar.Character.HumanoidRootPart
	else
	task.wait()
	end
	task.spawn(function()
	while Lgrab do
    SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	task.wait()
	end
	end)
	task.spawn(function()
	ragdoll()
	end)
	else
	Lgrab = false
	DestroyT(pallet)
	SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	GrabEvents.CreateGrabLine:FireServer(tar.Character.HumanoidRootPart, Vector3.zero, tar.Character.HumanoidRootPart.Position, false)   
	GrabEvents.DestroyGrabLine:FireServer(tar.Character.HumanoidRootPart)
	tar.Character.HumanoidRootPart.BodyPosition:Destroy()
	end
	end,
})

	CTR:AddToggle("Lock Target", {
	Text = "Lock Target",
	Default = false,
	Callback = function(Value)
	local tar = selectedTarget
	local hum = char and char:FindFirstChild("Humanoid")
	local pos = char.HumanoidRootPart.CFrame
	local seat = hum and hum.SeatPart
	local seatParent = seat.Parent
	local grabB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
	local dropB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
	local leftDet = seatParent:FindFirstChild("LeftDetector")
	local rightDet = seatParent:FindFirstChild("RightDetector")
	local leftWeld = leftDet and leftDet:FindFirstChild("LeftWeld")
	local rightWeld = rightDet and rightDet:FindFirstChild("RightWeld")
	if Value then
	LockB = true
	seatParent.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
	task.wait(0.25)
	grabB:FireServer(rightDet, tar.Character.HumanoidRootPart, rightWeld)
	task.wait(0.5)
	char.HumanoidRootPart.CFrame = pos
	task.wait(0.5)
	dropB:FireServer(rightWeld, tar.Character.HumanoidRootPart)
	task.spawn(function()
	while LockB do
	grabB:FireServer(leftDet, tar.Character.HumanoidRootPart, leftWeld)
	--grabB:FireServer(rightDet, tar.Character.HumanoidRootPart, rightWeld)
	task.wait()
	--dropB:FireServer(rightWeld, tar.Character.HumanoidRootPart)
	dropB:FireServer(leftWeld, tar.Character.HumanoidRootPart)
	end
	end)
	else
	LockB = false
	end
	end,
})

	TR:AddToggle("LoopGrabKickStable", {
	Text = "Loop Grab Kick Stable",
	Default = false,
	Callback = function(Value)
	local tar = selectedTarget
	local pos = char.HumanoidRootPart.CFrame
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local function ragdoll()
	while ragdoS do
	task.wait(0.05)
	pallet.SoundPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, 0, math.rad(90))
	task.wait()
	pallet.SoundPart.CFrame = CFrame.new(0, 1000000, 0)
	end
	end
	if Value then
	LgrabkS = true
	ragdoS = true
	spawnItem("FoodPlate", hrp.Position + Vector3.new(0, 5, 20))
	local startWait = tick()
	repeat 
    RunService.Heartbeat:Wait()
	pallet = toysFolder:FindFirstChild("FoodPlate")
    until pallet or tick() - startWait > 3
	task.wait(0.15)
	SetNetworkOwner:FireServer(pallet.SoundPart, pallet.SoundPart.CFrame)
	pallet.SoundPart.CanCollide = false
	pallet.SoundPart.Transparency = 1
	local bodypos = Instance.new("BodyPosition")
	bodypos.MaxForce = Vector3.new(10e+37, 10e+37, 10e+37)
	bodypos.D = 12500
	bodypos.Position = Vector3.new(0, 1000000, 0)
	bodypos.Parent = toysFolder:FindFirstChild("FoodPlate").SoundPart
    local bop = Instance.new("BodyPosition")
	bop.Position = char.HumanoidRootPart.Position + Vector3.new(0, 15, 0)
	bop.MaxForce = Vector3.new(10e+37, 10e+37, 10e+37)
	bop.D = 100
	bop.Parent = tar.Character.HumanoidRootPart
	local bog = Instance.new("BodyGyro")
	bog.MaxTorque = Vector3.new(10e+37, 10e+37, 10e+37)
	bog.Parent = tar.Character.HumanoidRootPart
	repeat
	char.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
	SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	task.wait()
	until tar.Character.Humanoid.Sit == true and tar.Character.Head.PartOwner.Value == LocalPlayer.Name or LgrabkS == false
    if LgrabS == false then
	tar.Character.HumanoidRootPart.BodyPosition:Destroy()
	tar.Character.HumanoidRootPart.BodyGyro:Destroy()
	else
    char.HumanoidRootPart.CFrame = pos
	task.spawn(function()
	while LgrabkS do
	task.wait()
	SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	task.wait()
	GrabEvents.CreateGrabLine:FireServer(tar.Character.HumanoidRootPart, Vector3.zero, tar.Character.HumanoidRootPart.Position, false)
	GrabEvents.DestroyGrabLine:FireServer(tar.Character.HumanoidRootPart)
	GrabEvents.CreateGrabLine:FireServer(tar.Character.HumanoidRootPart, Vector3.zero, tar.Character.HumanoidRootPart.Position, false)
	end
	end)
	task.spawn(function()
	ragdoll()
	end)
	end
	else
	LgrabkS = false
	ragdoS = false
	DestroyT(pallet)
	tar.Character.HumanoidRootPart.BodyPosition:Destroy()
	tar.Character.HumanoidRootPart.BodyGyro:Destroy()
	end
	end,
})

	TR:AddToggle("LoopGrabKickFast", {
	Text = "Loop Grab Kick Fast",
	Default = false,
	Callback = function(Value)
	local tar = selectedTarget
	local pos = char.HumanoidRootPart.CFrame
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local function ragdoll()
	while ragdoS do
	task.wait(0.05)
	pallet.SoundPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0)
	task.wait()
	pallet.SoundPart.CFrame = CFrame.new(0, 1000000, 0)
	end
	end
	if Value then
	LgrabkS = true
	ragdoS = true
	spawnItem("FoodPlate", hrp.Position + Vector3.new(0, 5, 20))
	local startWait = tick()
	repeat 
    RunService.Heartbeat:Wait()
	pallet = toysFolder:FindFirstChild("FoodPlate")
    until pallet or tick() - startWait > 3
	task.wait(0.15)
	SetNetworkOwner:FireServer(pallet.SoundPart, pallet.SoundPart.CFrame)
	pallet.SoundPart.CanCollide = false
	pallet.SoundPart.Transparency = 1
	local bodypos = Instance.new("BodyPosition")
	bodypos.MaxForce = Vector3.new(10e+37, 10e+37, 10e+37)
	bodypos.D = 12500
	bodypos.Position = Vector3.new(0, 1000000, 0)
	bodypos.Parent = toysFolder:FindFirstChild("FoodPlate").SoundPart
    local bop = Instance.new("BodyPosition")
	bop.Position = char.HumanoidRootPart.Position + Vector3.new(0, 15, 0)
	bop.MaxForce = Vector3.new(10e+37, 10e+37, 10e+37)
	bop.D = 100
	bop.Parent = tar.Character.HumanoidRootPart
	local bog = Instance.new("BodyGyro")
	bog.MaxTorque = Vector3.new(10e+37, 10e+37, 10e+37)
	bog.Parent = tar.Character.HumanoidRootPart
	repeat
	char.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
	SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	task.wait()
	until tar.Character.Humanoid.Sit == true and tar.Character.Head.PartOwner.Value == LocalPlayer.Name or LgrabkS == false
    if LgrabS == false then
	tar.Character.HumanoidRootPart.BodyPosition:Destroy()
	tar.Character.HumanoidRootPart.BodyGyro:Destroy()
	else
    char.HumanoidRootPart.CFrame = pos
	task.spawn(function()
	while LgrabkS do
	task.wait()
	SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	end
	end)
	task.spawn(function()
	while LgrabkS do
	task.wait()
	GrabEvents.CreateGrabLine:FireServer(tar.Character.HumanoidRootPart, Vector3.zero, tar.Character.HumanoidRootPart.Position, false)
	GrabEvents.DestroyGrabLine:FireServer(tar.Character.HumanoidRootPart)
	end
	end)
	task.spawn(function()
	ragdoll()
	end)
	end
	else
	LgrabkS = false
	ragdoS = false
	DestroyT(pallet)
	tar.Character.HumanoidRootPart.BodyPosition:Destroy()
	tar.Character.HumanoidRootPart.BodyGyro:Destroy()
	end
	end,
})

TR:AddToggle("LoopBlobKick", {
	Text = "Loop Blob Kick",
	Default = false,
	Callback = function(Value)
	local tar = selectedTarget
	local hum = char and char:FindFirstChild("Humanoid")
	local seat = hum and hum.SeatPart
	local seatParent = seat.Parent
    local blob = toysFolder:FindFirstChild("CreatureBlobman")
    local posB = seatParent.HumanoidRootPart.CFrame
	local grabB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
	local dropB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
	local leftDet = seatParent:FindFirstChild("LeftDetector")
	local rightDet = seatParent:FindFirstChild("RightDetector")
	local leftWeld = leftDet and leftDet:FindFirstChild("LeftWeld")
	local rightWeld = rightDet and rightDet:FindFirstChild("RightWeld")
	if Value then
    if not blob then
    spawnItem("CreatureBlobman", hrp.Position + Vector3.new(0, 5, 15))
    repeat
	task.wait()
	until blob or Value == false
    task.wait(0.125)
    blob.VehicleSeat:Sit(hum)
    task.wait(0.125)
	LgrabB = true
	local bopB = Instance.new("BodyPosition")
	bopB.Position = char.HumanoidRootPart.Position + Vector3.new(0, 25, 0)
	bopB.MaxForce = Vector3.new(10e+37, 10e+37, 10e+37)
	bopB.D = 100
	bopB.Parent = tar.Character.HumanoidRootPart
	repeat
	seatParent.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
	seatParent.HumanoidRootPart.Velocity = Vector3.zero
    seatParent.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
    seatParent.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
	SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	task.wait()
	until tar.Character.Humanoid.Sit == true and tar.Character.Head.PartOwner.Value == LocalPlayer.Name or LgrabB == false
	if LgrabB == false then
	tar.Character.HumanoidRootPart.BodyPosition:Destroy()
	else
    seatParent.HumanoidRootPart.Velocity = Vector3.zero
    seatParent.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
    seatParent.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
    seatParent.HumanoidRootPart.CFrame = posB
    GrabEvents.CreateGrabLine:FireServer(tar.Character.HumanoidRootPart, Vector3.zero, tar.Character.HumanoidRootPart.Position, false)   
	GrabEvents.DestroyGrabLine:FireServer(tar.Character.HumanoidRootPart)
	task.wait(0.25)
	task.spawn(function()
	while LgrabB do
    seatParent.HumanoidRootPart.Velocity = Vector3.zero
    seatParent.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
    seatParent.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero       
	grabB:FireServer(leftDet, tar.Character.HumanoidRootPart, leftWeld)
	dropB:FireServer(leftWeld, tar.Character.HumanoidRootPart)
	task.wait()
	end
	end)
	end
	else
	LgrabB = false
    tar.Character.HumanoidRootPart.BodyPosition:Destroy()
	end
	end,
})

	CTR:AddToggle("LoopBanana", {
	Text = "Loop Banana",
	Default = false,
	Callback = function(Value)
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local tar = selectedTarget
	local pos = char.HumanoidRootPart.CFrame
	if Value then
	Lbanana = true
    spawnItem("FoodBanana", hrp.Position + Vector3.new(0, 5, 20))
	local startWait = tick()
    repeat 
    RunService.Heartbeat:Wait()
	banan = toysFolder:FindFirstChild("FoodBanana")
    until banan or tick() - startWait > 1
	task.wait(0.05)
	local holdPart = banan:FindFirstChild("HoldPart")
	holdPart.HoldItemRemoteFunction:InvokeServer(banan, char)
	ReplicatedStorage.HoldEvents.Use:FireServer(banan)
	local startWait = tick()
	local parts = toysFolder:FindFirstChild("FoodBanana").EdiblePart
    repeat 
    RunService.Heartbeat:Wait()
    until not parts or tick() - startWait > 3
	task.wait(0.05)
	holdPart.DropItemRemoteFunction:InvokeServer(banan, hrp.CFrame * CFrame.new(-3, 5, 0), Vector3.new(0, 0, 0))
	task.wait(0.5)
	SetNetworkOwner:FireServer(toysFolder.FoodBanana.SoundPart, toysFolder.FoodBanana.SoundPart.CFrame)
	task.wait(0.5)
	task.spawn(function()
	while Lbanana do
	task.wait(0.25)
	banan.SoundPart.CFrame = tar.Character["Left Leg"].CFrame
	task.wait(0.1)
	banan.SoundPart.CFrame = CFrame.new(118, 296, 330)
	banan.SoundPart.Velocity = Vector3.new(0, 0, 0)
	end
	end)
	else
	Lbanana = false
	if toysFolder:FindFirstChild("FoodBanana") then
		DestroyT(toysFolder:FindFirstChild("FoodBanana"))
		else
		task.wait()
		end
	end
	end,
})

local MyButton = TR:AddButton({
	Text = "Blob Kick",
	Func = function()
		local tar = selectedTarget
		local pos = char.HumanoidRootPart.CFrame
		local hum = char and char:FindFirstChild("Humanoid")
		local seat = hum and hum.SeatPart
		local seatParent = seat.Parent
		local grabB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
		local dropB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
		local leftDet = seatParent:FindFirstChild("LeftDetector")
		local rightDet = seatParent:FindFirstChild("RightDetector")
		local leftWeld = leftDet and leftDet:FindFirstChild("LeftWeld")
		local rightWeld = rightDet and rightDet:FindFirstChild("RightWeld")
		local bopBk = Instance.new("BodyPosition")
		bopBk.Position = tar.Character.HumanoidRootPart.Position + Vector3.new(0, 25, 0)
		bopBk.MaxForce = Vector3.new(10e+37, 10e+37, 10e+37)
		bopBk.D = 100
		bopBk.Parent = tar.Character.HumanoidRootPart
		seatParent.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
		seatParent.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
		repeat
		pcall(function()
		SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
		SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
		end)
		seatParent.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
		seatParent.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
		task.wait()
		until tar.Character.Humanoid.Sit == true and tar.Character.Head.PartOwner.Value == LocalPlayer.Name or LgrabB == false
		seatParent.HumanoidRootPart.Anchored = true
		task.wait(0.25)
		GrabEvents.CreateGrabLine:FireServer(tar.Character.HumanoidRootPart, Vector3.zero, tar.Character.HumanoidRootPart.Position, false)   
		GrabEvents.DestroyGrabLine:FireServer(tar.Character.HumanoidRootPart)
		tar.Character.HumanoidRootPart.BodyPosition:Destroy()
		grabB:FireServer(leftDet, tar.Character.HumanoidRootPart, leftWeld)
		task.wait(1.25)
		DestroyT(seatParent)
	end,
})

		CTR:AddToggle("GrabAntiKick", {
		Text = "Grab Anti Kick",
		Default = false,
		Callback = function(Value)
		local tar = selectedTarget
		local function GrabToy(toy)
		local part = toy:FindFirstChild("SoundPart")
		if part then
		SetNetworkOwner:FireServer(part, part.CFrame)
		if part:FindFirstChild("PartOwner") and part.PartOwner.Value == LocalPlayer.Name then
		part.CFrame = CFrame.new(0, 1000, 0)
				end
			end
		end

		if Value then
		GrabAntiKick = true
			task.spawn(function()
				while GrabAntiKick do
				if tar then
					local toysFolderTarget = workspace:FindFirstChild(tar.Name.."SpawnedInToys")
					if toysFolderTarget then
						if toysFolderTarget:FindFirstChild("NinjaKunai") then
							GrabToy(toysFolderTarget.NinjaKunai)
						end

						if toysFolderTarget:FindFirstChild("NinjaShuriken") then
							GrabToy(toysFolderTarget.NinjaShuriken)
						end

						if toysFolderTarget:FindFirstChild("ToolCleaver") then
							GrabToy(toysFolderTarget.ToolCleaver)
						end

						if toysFolderTarget:FindFirstChild("ToolPencil") then
							GrabToy(toysFolderTarget.ToolPencil)
						end

						if toysFolderTarget:FindFirstChild("ToolDiggingForkRusty") then
							GrabToy(toysFolderTarget.ToolDiggingForkRusty)
						end

						if toysFolderTarget:FindFirstChild("ToolPickaxe") then
							GrabToy(toysFolderTarget.ToolPickaxe)
						end

						--if toysFolderTarget:FindFirstChild("NinjaKatana") then
							--GrabToy(toysFolderTarget.NinjaKatana)
						--end
					end
				end
			task.wait()
		end
		end)
		else
		GrabAntiKick = false
		end
	end,
})

local MyButton = TR:AddButton({
	Text = "Destroy Blobman Gucci",
	Func = function()
		local tar = selectedTarget
		local pos = char.HumanoidRootPart.CFrame
		local hum = char and char:FindFirstChild("Humanoid")
		local toysFolderTarget = workspace:FindFirstChild(tar.Name.."SpawnedInToys")
		if tar and toysFolderTarget then
			local blobm = toysFolderTarget:FindFirstChild("CreatureBlobman")
			blobm:FindFirstChild("VehicleSeat"):Sit(hum)
			task.wait(0.1)
			hum.Sit = false
			hum.Jump = true											
			task.wait()
			char.HumanoidRootPart.CFrame = pos
			char.HumanoidRootPart.Velocity = Vector3.zero
		end
	end,
})

FN:AddToggle("Boobs", {
	Text = "Boobs (Only in Plots)",
	Default = false,
	Callback = function(Value)
	local function checkplots()
	if game.workspace.Plots.Plot1.PlotSign.ThisPlotsOwners.Value.Value == LocalPlayer.Name then
		PlayerPlot = game.workspace.PlotItems.Plot1
	else
	if game.workspace.Plots.Plot2.PlotSign.ThisPlotsOwners.Value.Value == LocalPlayer.Name then
		PlayerPlot = game.workspace.PlotItems.Plot2
	else
	if game.workspace.Plots.Plot3.PlotSign.ThisPlotsOwners.Value.Value == LocalPlayer.Name then
		PlayerPlot = game.workspace.PlotItems.Plot3
	else
	if game.workspace.Plots.Plot4.PlotSign.ThisPlotsOwners.Value.Value == LocalPlayer.Name then
		PlayerPlot = game.workspace.PlotItems.Plot4
	else
	if game.workspace.Plots.Plot5.PlotSign.ThisPlotsOwners.Value.Value == LocalPlayer.Name then
		PlayerPlot = game.workspace.PlotItems.Plot5
	end
	end
	end
	end
	end
	end	
	print(PlayerPlot)
	checkplots()
	print(PlayerPlot)
  	--local toy = PlayerPlot
   	--local h = char.Torso
  	--if toy:FindFirstChild("a") then
   	--toy.FoodCoconut.SoundPart.CFrame = h.CFrame + Vector3.new(-0.7, 0.2, -0.5)
  	--toy.FoodCoconut.SoundPart.Anchored = true
   	--toy.FoodCoconut.SoundPart.CanCollide = false
   	--toy.FoodCoconut.Name = "b"
   	--else
   	--toy.FoodCoconut.SoundPart.CFrame = h.CFrame + Vector3.new(-0.7, 0.2, 0.5)
	--toy.FoodCoconut.SoundPart.Anchored = true
	--toy.FoodCoconut.SoundPart.CanCollide = false
  	--toy.FoodCoconut.Name = "a"  
    end,
})

KB:AddLabel("Spawn"):AddKeyPicker("KeyPicker", {
	Default = "One",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(0, 5, 0)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

KB:AddLabel("Plot 1"):AddKeyPicker("KeyPicker", {
	Default = "Two",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(-492, 5, -167)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

KB:AddLabel("Plot 2"):AddKeyPicker("KeyPicker", {
	Default = "Three",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(-535, 5, 90)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

KB:AddLabel("Plot 3"):AddKeyPicker("KeyPicker", {
	Default = "Four",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(250, 1, 460)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

KB:AddLabel("Plot 4"):AddKeyPicker("KeyPicker", {
	Default = "Five",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(512, 89, -340)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

KB:AddLabel("Plot 5"):AddKeyPicker("KeyPicker", {
	Default = "Six",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(553, 129, -75)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

KB:AddLabel("Barn"):AddKeyPicker("KeyPicker", {
	Default = "Seven",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(-195, 69, -285)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

KB:AddLabel("House"):AddKeyPicker("KeyPicker", {
	Default = "Eight",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(-282, 84, 313)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

KB:AddLabel("Island"):AddKeyPicker("KeyPicker", {
	Default = "Nine",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(72, 352, 341)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

-- UI Settings
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")

MenuGroup:AddLabel("Menu bind")
	:AddKeyPicker("MenuKeybind", { Default = "Q", NoUI = true, Text = "Menu keybind" })

MenuGroup:AddButton("Unload", function()
Toggles.LoopRagdoll:SetValue(false)
Toggles.AntiGrab:SetValue(false)
Toggles.AntiVoid:SetValue(false)
Toggles.AntiKick:SetValue(false)
Toggles.LoopTp:SetValue(false)
Toggles.Trd:SetValue(false)
Toggles.PLCD:SetValue(false)
Toggles.Strong:SetValue(false)
Toggles.DisableBarrierCollisions:SetValue(false)
Toggles.LoopGrabKickStable:SetValue(false)
Toggles.LoopBlobKick:SetValue(false)
Toggles.LoopGrab:SetValue(false)
Toggles.LoopBanana:SetValue(false)
Toggles.GrabAntiKick:SetValue(false)
Toggles.Strength:SetValue(false)
Toggles.PacketLag:SetValue(false)
Toggles.FartherReach:SetValue(false)
Toggles.AntiInputLag:SetValue(false)
task.wait()
Library:Unload()
end)

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- Adds our MenuKeybind to the ignore list
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder("MyScriptHub")
SaveManager:SetFolder("MyScriptHub/specific-game")
SaveManager:SetSubFolder("specific-place") -- if the game has multiple places inside of it (for example: DOORS)
-- you can use this to save configs for those places separately
-- The path in this script would be: MyScriptHub/specific-game/settings/specific-place
-- [ This is optional ]

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs["UI Settings"])

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs["UI Settings"])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()














