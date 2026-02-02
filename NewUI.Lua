setfpscap(999)
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
local PlayerEvents = ReplicatedStorage:WaitForChild("PlayerEvents")
local StickyPartEvent = PlayerEvents:WaitForChild("StickyPartEvent")
local SetNetworkOwner = GrabEvents:WaitForChild("SetNetworkOwner")
local toysFolder = game.workspace:FindFirstChild(LocalPlayer.Name.."SpawnedInToys")
local UserInputService = game:GetService("UserInputService")
local Debris = game:GetService("Debris")
local group = game.workspace
local spaw = game.workspace.SpawnLocation
local hue = 0
local posX = 0
local posY = 15
local posZ = 0

pcall(function()
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
local newgrab = game.ReplicatedFirst.GrabParts.GrabPart.AttachSound
local oldgrab = game.ReplicatedFirst.GrabParts.GrabPart.AttachSound1
local newhold = game.ReplicatedFirst.GrabParts.GrabPart.BeamSound
local oldhold = game.ReplicatedFirst.GrabParts.GrabPart.BeamSound1
newgrab.Name = "AttachSound1"
oldgrab.Name = "AttachSound"
newhold.Name = "BeamSound1"
oldhold.Name = "BeamSound"
end)

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

local function explode(toy, hitpart, pos)
ReplicatedStorage.BombEvents.BombExplode:FireServer(toy, hitpart, pos)
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

local function notify(title, content, duration)
		Library:Notify({
			Title = title or "Notification",
			Description = content or "",
			Time = duration or 5,
		})
end

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true
local Window = Library:CreateWindow({
	Title = "изи бриджи",
	Footer = "бэм бэм бэм",
	NotifySide = "Right",
	ShowCustomCursor = false,
})

local Tabs = {
	Main = Window:AddTab("Main"),
	Target = Window:AddTab("Target"),
	Auras = Window:AddTab("Auras"),
	Misc = Window:AddTab("Misc"),
	Keybinds = Window:AddTab("Keybinds"),
	["UI Settings"] = Window:AddTab("Settings"),
}

local LP = Tabs.Main:AddLeftGroupbox("LocalPlayer")
local GB = Tabs.Main:AddLeftGroupbox("GrabLine")
local DF = Tabs.Main:AddRightGroupbox("Defense")
local KB = Tabs.Keybinds:AddLeftGroupbox("Teleports")
local FKB = Tabs.Keybinds:AddRightGroupbox("Functions")
local TR = Tabs.Target:AddLeftGroupbox("Target")
local CTR = Tabs.Target:AddRightGroupbox("Control")
local WL = Tabs.Target:AddLeftGroupbox("Whitelist")
local BL = Tabs.Target:AddRightGroupbox("Blobman Settings")
local MC = Tabs.Misc:AddLeftGroupbox("Functions")
local SRV = Tabs.Misc:AddRightGroupbox("Server")
local AU = Tabs.Auras:AddLeftGroupbox("Default Auras")
local BAU = Tabs.Auras:AddRightGroupbox("Blobman Auras")

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

local InfJump = false

LP:AddToggle("InfiniteJump", {
	Text = "Infinite Jump",
	Default = false,
	Callback = function(Value)
	InfJump = Value
	end,
})

UserInputService.JumpRequest:Connect(function()
if InfJump and char:FindFirstChild("Humanoid") then
char:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
end
end)

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

LP:AddButton("InputLag", {
        Text = "Input Lag",
        Func = function()
		SetNetworkOwner:FireServer(char.HumanoidRootPart, char.HumanoidRootPart.CFrame)
	end,
})

LP:AddButton("BreakPLCD", {
        Text = "Break PLCD",
        Func = function()
		for _, plcd in ipairs(workspace:GetChildren()) do
			if plcd.Name == "PlayerCharacterLocationDetector" then
			local distance = (plcd.Position - char:FindFirstChild("HumanoidRootPart").Position).Magnitude
				if distance < 5 then
				char.Humanoid.Health = 0
				plcd.CFrame = CFrame.new(0, -math.huge, 0)
					LocalPlayer.CharacterAdded:Wait()
					task.wait(0.25)
					LocalPlayer.Character:WaitForChild("Humanoid", 3).Health = 0
				end
			end
		end
	end,
})

local function antiloop()
	LocalPlayer.CharacterAdded:Connect(function(pers)
		pers:WaitForChild("HumanoidRootPart")
		if selectedplot == "Plot1" then
			pers.HumanoidRootPart.CFrame = game.workspace.Plots.Plot1.PlotArea.CFrame * CFrame.new(0, 10, 0)
		elseif selectedplot == "Plot2" then
			pers.HumanoidRootPart.CFrame = game.workspace.Plots.Plot2.PlotArea.CFrame * CFrame.new(0, 10, 0)
		elseif selectedplot == "Plot3" then
			pers.HumanoidRootPart.CFrame = game.workspace.Plots.Plot3.PlotArea.CFrame * CFrame.new(0, 10, 0)
		elseif selectedplot == "Plot4" then
			pers.HumanoidRootPart.CFrame = game.workspace.Plots.Plot4.PlotArea.CFrame * CFrame.new(0, 10, 0)
		elseif selectedplot == "Plot5" then
			pers.HumanoidRootPart.CFrame = game.workspace.Plots.Plot5.PlotArea.CFrame * CFrame.new(0, 10, 0)
		end
	end)
end

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
	Max = 100000,
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

GB:AddToggle("KillGrabLine", {
    Text = "Kill GrabLine",
	Default = false,
	Callback = function(on)
        if on then
            killCon = game.workspace.ChildAdded:Connect(function(model)
                if model.Name == "GrabParts" then
                    local partTokill = model.GrabPart.WeldConstraint.Part1.Parent
                    if partTokill then
					SetNetworkOwner:FireServer(partTokill.HumanoidRootPart, partTokill.HumanoidRootPart.CFrame)
					partTokill.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
                    end
                end
            end)
        elseif killCon then
        killCon:Disconnect()
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
		d.AlignPosition.MaxAxesForce = Vector3.new(math.huge, math.huge, math.huge)
		d.AlignOrientation.Responsiveness = 200
		d.AlignOrientation.MaxTorque = math.huge
		else
		d.AlignPosition.ForceLimitMode = 0
		d.AlignPosition.Responsiveness = 40
		d.AlignPosition.MaxAxesForce = Vector3.new(10000, 10000, 10000)
		d.AlignOrientation.Responsiveness = 30
		d.AlignOrientation.MaxTorque = 600000
	end
	end,
})

--GB:AddLabel("Anchor"):AddKeyPicker("KeyPicker", {
--	Default = "X",
--	Callback = function()
--	local parts = game.workspace.GrabParts
--	local item = parts.GrabPart.WeldConstraint.Part1
--	local anchor = Instance.new("BodyPosition", item)
--	anchor.Position = char.HumanoidRootPart.Position + Vector3.new(0, 15, 0)
--	anchor.MaxForce = Vector3.new(10e+37, 10e+37, 10e+37)
--	anchor.D = 100
--	end,
--})

GB:AddSlider("LinesAmount", {
        Text = "Lines Amount",
        Default = 1,
        Min = 1,
        Max = 500,
        Rounding = 1,
        Callback = function(Value)
        LagLinesAmount = Value
        end
})

GB:AddButton("LagServer", {
        Text = "Lag Server",
        Func = function()
		for i = 1, LagLinesAmount do
        GrabEvents.CreateGrabLine:FireServer(spaw, spaw.CFrame)
		GrabEvents.DestroyGrabLine:FireServer(char.Torso, char.Torso.CFrame)
		task.wait()
        end
	end,
})

DF:AddDropdown("Type Of Anti Grab", {
	Values = { "Default" , "AntiThrow" },
	Default = nil, -- number index of the value / string
	Multi = false, -- true / false, allows multiple choices to be selected
	Callback = function(Value)
		TypeOfAntiGrab = Value
	end,
})

DF:AddToggle("AntiGrab", {
	Text = "Anti Grab",
	Default = false,
	Callback = function(Value)
	if Value then
        antigrab = RunService.Heartbeat:Connect(function()
            if char and char:FindFirstChild("Head") then
                local head = char.Head
				local hrp = char:FindFirstChild("HumanoidRootPart")
                local partOwner = head:FindFirstChild("PartOwner")
				local isHeld = LocalPlayer:FindFirstChild("IsHeld")
                if partOwner or isHeld.Value then
					if TypeOfAntiGrab == "Default" then
						Struggle:FireServer()
						ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(char.HumanoidRootPart, 0)
						ReplicatedStorage.GameCorrectionEvents.StopAllVelocity:FireServer()
						task.wait()
						char.Humanoid.Sit = false
					elseif TypeOfAntiGrab == "AntiThrow" then
						Struggle:FireServer()
						hrp.Anchored = true
						ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(char.HumanoidRootPart, 0)
						ReplicatedStorage.GameCorrectionEvents.StopAllVelocity:FireServer()
						while partOwner do
						task.wait()
						end
						char.Humanoid.Sit = false
						hrp.Anchored = false
               		end
            	end
			end
    	end)
    elseif antigrab then
		antigrab:Disconnect()
    	antigrab = nil
    end
	end,
})

DF:AddDropdown("Type Of Counterattack", {
	Values = { "Fling" , "Kill" },
	Default = nil, -- number index of the value / string
	Multi = false, -- true / false, allows multiple choices to be selected
	Callback = function(Value)
		TypeOfCounterattack = Value
	end,
})

DF:AddToggle("Counterattack", {
	Text = "Counterattack",
	Default = false,
	Callback = function(Value)
	if Value then
    CA = RunService.Heartbeat:Connect(function()
    if char and char:FindFirstChild("Head") then
    local head = char.Head
    local partOwner = head:FindFirstChild("PartOwner")
    if partOwner then 
	local targeted = P:FindFirstChild(partOwner.Value)
	if targeted and targeted.Character then
	if TypeOfCounterattack == "Kill" then
	SetNetworkOwner:FireServer(targeted.Character.HumanoidRootPart, targeted.Character.HumanoidRootPart.CFrame)
	targeted.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
	GrabEvents.DestroyGrabLine:FireServer(targeted.Character.HumanoidRootPart)
	elseif TypeOfCounterattack == "Fling" then
	SetNetworkOwner:FireServer(targeted.Character.HumanoidRootPart, targeted.Character.HumanoidRootPart.CFrame)
	local VEL = Instance.new("BodyVelocity", targeted.Character.HumanoidRootPart)
	VEL.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
   	VEL.Velocity = Vector3.new(1000000, 1000000, 10000000)
	task.wait(1)
	targeted.Character.HumanoidRootPart.BodyVelocity:Destroy()
	end
	end
    end
    end
	task.wait()
    end)
    else
	if CA then
	CA:Disconnect()
	CA = nil
    end
    end
	end,
})

DF:AddToggle("AntiBurn", {
	Text = "Anti Burn",
	Default = false,
	Callback = function(Value)
	local plotbar = game.workspace.Plots.Plot3.Barrier.PlotBarrier
	local oldplotpos = plotbar.CFrame
		if Value then
            antiburn = RunService.Heartbeat:Connect(function()
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local hrp = char.HumanoidRootPart
                    if hrp.FirePlayerPart.CanBurn.Value then
                    plotbar.CFrame = hrp.CFrame
					task.wait()
					plotbar.CFrame = oldplotpos
                    end
                end
            end)
        else
            if antiburn then
                antiburn:Disconnect()
                antiburn = nil
            end
        end
	end,
})

function antiExplode()
    workspace.ChildAdded:Connect(function(boom)
        if boom:IsA("Part") and boom.Name == "Part" then
            if (boom.Position - char.HumanoidRootPart.Position).Magnitude <= 20 then
                char.HumanoidRootPart.Anchored = true
                task.wait()
                while char["Left Arm"]:FindFirstChild("RagdollLimbPart") and char["Left Arm"].RagdollLimbPart.CanCollide do
                    task.wait()
                end
                char.HumanoidRootPart.Anchored = false -- Снимаем фиксацию
            end
        end
    end)
end

DF:AddToggle("AntiExplode", {
	Text = "Anti Explode",
	Default = false,
	Callback = function(Value)
		if Value then
		task.spawn(antiExplode)
        end
	end,
})

local antiGucciConnectionTrain
	local safePositionTrain
	local restoreFramesTrain = 0
	local function startAntiGucciTrain()
		local character = char
		local humanoid = character:WaitForChild("Humanoid")
		local rootPart = character:WaitForChild("HumanoidRootPart")
		safePositionTrain = rootPart.Position
		local folder = workspace.Map.AlwaysHereTweenedObjects
		local train = folder and folder:FindFirstChild("Train")
		local seat
		if train then
	    	for _, d in ipairs(train:GetDescendants()) do
 	       	if d:IsA("Seat") then
  	      	    seat = d
  	       	   break
 	     	  end
	  	  end
		end
		safePositionTrain = rootPart.CFrame
		if seat then rootPart.CFrame = seat.CFrame + Vector3.new(0, 2, 0) seat:Sit(humanoid) end
		humanoid:GetPropertyChangedSignal("Jump"):Connect(function() if humanoid.Jump and humanoid.Sit then restoreFramesTrain = 15 end end)
		if antiGucciConnectionTrain then antiGucciConnectionTrain:Disconnect() end
		antiGucciConnectionTrain = RunService.Heartbeat:Connect(function()
			if not rootPart or not humanoid then return end
			ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(rootPart, 0)
			if restoreFramesTrain > 0 then rootPart.CFrame = safePositionTrain restoreFramesTrain = restoreFramesTrain - 1 end
		end)
		task.spawn(function() while humanoid.Sit do task.wait() end task.wait(0.25) rootPart.CFrame = safePositionTrain end)
	end
	local function stopAntiGucciTrain()
	local character = char
	local humanoid = character:WaitForChild("Humanoid")
		if antiGucciConnectionTrain then antiGucciConnectionTrain:Disconnect() antiGucciConnectionTrain = nil end
		local trainFolder = workspace.Map.AlwaysHereTweenedObjects
	if trainFolder and trainFolder:FindFirstChild("Train") then humanoid.Sit = true task.wait(0.05) humanoid.Sit = false end
end

local autoGucciActiveTrain =  false

DF:AddToggle("AntiGrabGucci", {
		Text = "Anti Gucci Train",
		Default = false,
		Callback = function(Value)
			autoGucciActiveTrain = Value

			if Value then
				startAntiGucciTrain()
				notify("Anti Gucci (Train)", "Processing", 3)

				task.spawn(function()
					while autoGucciActiveTrain do
						local trainFolder = workspace.Map.AlwaysHereTweenedObjects
						local trainExists = trainFolder and trainFolder:FindFirstChild("Train")

						if not trainExists then
							stopAntiGucciTrain() 
							notify("Anti Gucci (Train)", "Train lost", 3)

							local retries = 0
							repeat
								task.wait()
								retries = retries + 1
								trainFolder = workspace.Map.AlwaysHereTweenedObjects
							until (trainFolder and trainFolder:FindFirstChild("Train")) or retries > 25 or not autoGucciActiveTrain

							if autoGucciActiveTrain and trainFolder and trainFolder:FindFirstChild("Train") then
								startAntiGucciTrain()
								notify("Anti Gucci (Train)", "Fixed", 3)
							end
						end
						task.wait(0.1) 
					end
				end)
			else
				autoGucciActiveTrain = false
				stopAntiGucciTrain()
				notify("Anti Gucci (Train)", "Disabled.", 3)
			end
		end
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

DF:AddDropdown("AntiKickItem", {
	Values = { "NinjaShuriken", "NinjaKunai", "ToolCleaver", "ToolDiggingForkRusty", "ToolPickaxe" },
	Default = nil, -- number index of the value / string
	Multi = false, -- true / false, allows multiple choices to be selected
	Callback = function(Value)
		antikick = Value
	end,
})

local function ClearKunai()
local plr = game.Players.LocalPlayer
local inv = workspace:FindFirstChild(plr.Name.."SpawnedInToys")
local destroyrem = game.ReplicatedStorage:FindFirstChild("MenuToys") and game.ReplicatedStorage.MenuToys:FindFirstChild("DestroyToy")			
	if inv and destroyrem then
		for _, v in pairs(inv:GetChildren()) do
			if v.Name == "AntiKick" or v.Name == antikick then
				pcall(function() destroyrem:FireServer(v) end)
			end
		end
	end
end

Options.AntiKickItem:OnChanged(function()
ClearKunai()
end)

DF:AddToggle("AntiKick", {
	Text = "Anti Kick",
	Default = false,
	Callback = function(Value)
		_G.ShurikenAntiKick = Value
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
						if antikick == "NinjaShuriken" then
						stickyEvent:FireServer(kunai.StickyPart, firePart, CFrame.new(0, 0, 0.025) * CFrame.Angles(0, math.rad(90), math.rad(90)))
						elseif antikick == "NinjaKunai" then
						stickyEvent:FireServer(kunai.StickyPart, firePart, CFrame.new(0, -1, 0.075) * CFrame.Angles(0, math.rad(90), math.rad(90)))
						elseif antikick == "ToolCleaver" then
						stickyEvent:FireServer(kunai.StickyPart, firePart, CFrame.new(-0.5, 0, 0) * CFrame.Angles(math.rad(90), math.rad(180), 0))
						elseif antikick == "ToolDiggingForkRusty" then
						stickyEvent:FireServer(kunai.StickyPart, firePart, CFrame.new(0, 0.75, 0.2) * CFrame.Angles(math.rad(-60), math.rad(180), math.rad(180)))
						elseif antikick == "ToolPickaxe" then
						stickyEvent:FireServer(kunai.StickyPart, firePart, CFrame.new(0, -2.25, 0) * CFrame.Angles(math.rad(-90), math.rad(180), math.rad(90)))
						end
						end
						
						for _, obj in pairs(kunai:GetChildren()) do
								if not obj:FindFirstChild("Highlight") then
									local high = Instance.new("Highlight", kunai)
									high.FillTransparency = 1
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
									spawnRemote:InvokeServer(name, currentHRP.CFrame * CFrame.new(0, 12, 15), Vector3.new(0,0,0))
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
						local kunai = inv and inv:FindFirstChild(antikick)
						
						if workspace.PlotItems.PlayersInPlots:FindFirstChild(plr.Name) then 
							local boolik, house = CheckForHome()
							if boolik and house and workspace.Plots:FindFirstChild(house.Name) then
								local sign = workspace.Plots[house.Name]:FindFirstChild("PlotSign")
								if sign and sign.ThisPlotsOwners.Value.TimeRemainingNum.Value > 89 then 
									kunai = SpawnToy(antikick)
									if kunai == nil then continue end
									kunai.Name = "AntiKick" 
									StickKunai(kunai)
								end
							end
						end
						
						if not kunai then
							if workspace.PlotItems.PlayersInPlots:FindFirstChild(plr.Name) then continue end 
							kunai = SpawnToy(antikick)
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

DF:AddDropdown("AntiInputLagItem", {
	Values = { "PoopPileSparkle", "FoodHamburger", "CupMugWhite", "FoodBanana", "FoodCoconut", "FoodSodaCan", "CupMugBrown", "FoodBread", "FoodBroccoli", "FoodDippyEgg", "FoodDonut", "FoodHotdog", "FoodMayonnaise", "FoodMeatStick", "FoodMushroomPoison", "FoodPizzaCheese", "PoopPile", "FoodPizzaPepperoni", "FoodFrenchFries", "FoodCakePink", "InstrumentBrassBugle", "InstrumentBrassTrumpet", "InstrumentBrassVuvuzela", "InstrumentDrumBongos", "InstrumentDrumSnare", "InstrumentGuitarAcoustic", "InstrumentGuitarBanjo", "InstrumentGuitarLyre", "InstrumentGuitarUkulele", "InstrumentGuitarViolin", "InstrumentPianoKeyboard", "InstrumentPianoMelodica", "InstrumentVoiceMicrophone", "InstrumentWoodwindOcarina", "InstrumentWoodwindSaxophone" },
	Default = nil, -- number index of the value / string
	Multi = false, -- true / false, allows multiple choices to be selected
	MaxVisibleDropdownItems = 15,
	Callback = function(Value)
		selectedItem = Value
	end,
})

Options.AntiInputLagItem:OnChanged(function()
Toggles.AntiNetwork:SetValue(false)
Toggles.AntiNetwork:SetValue(true)
end)


DF:AddToggle("AntiNetwork", {
	Text = "Anti Network",
	Default = false,
	Callback = function(Value)
	local Item = selectedItem
	local toy = nil
	local holdPart = nil
	local function CheckForPlot()
	if not workspace.PlotItems.PlayersInPlots:FindFirstChild(LocalPlayer.Name) then 
		return false
		end
		for _, v in pairs(workspace.Plots:GetChildren()) do
			local sign = v:FindFirstChild("PlotSign")
			local owners = sign and sign:FindFirstChild("ThisPlotsOwners")
			if owners then
				for _, b in pairs(owners:GetChildren()) do
					if b.Value == LocalPlayer.Name then
						local folder = workspace.PlotItems:FindFirstChild(v.Name)
							if folder then
							return true, folder
						end
					end
				end
			end
		end
	return false
	end
	if Value then
	antiinput = true
	if not toysFolder:FindFirstChild(Item) then
	repeat 
    task.wait()
    until LocalPlayer.CanSpawnToy.Value == true or Value == false
	pcall(function()
	spawnItem(Item, spaw.Position + Vector3.new(0, 100, 0))
	end)
	repeat 
    task.wait()
	toy = toysFolder:FindFirstChild(Item)
    until toy or Value == false
	holdPart = toy:WaitForChild("HoldPart")
	task.wait()
	end
	grabanti = RunService.Heartbeat:Connect(function()
	task.wait(0.1)
	pcall(function()
	holdPart.HoldItemRemoteFunction:InvokeServer(toy, char)
	end)
	end)
	task.spawn(function()
	while antiinput do
	pcall(function()
	holdPart.DropItemRemoteFunction:InvokeServer(toy, spaw.CFrame * CFrame.new(0, 1000, 0), Vector3.zero)
	end)
	task.wait(0.25)
	end
	end)
	task.spawn(function()
	while antiinput do
	if not toysFolder:FindFirstChild(Item) then
	repeat 
    task.wait()
    until LocalPlayer.CanSpawnToy.Value == true or antiinput == false
	pcall(function()
	spawnItem(Item, spaw.Position + Vector3.new(0, 100, 0))
	end)
	repeat 
    task.wait()
	toy = toysFolder:FindFirstChild(Item)
    until toy or Value == false
	holdPart = toy:WaitForChild("HoldPart")
	end
	task.wait()
	end
	end)
	else
	antiinput = false
	if grabanti then
	grabanti:Disconnect()
	grabanti = nil
	end
	if toysFolder:FindFirstChild(Item) then
	DestroyT(toysFolder:FindFirstChild(Item))
	end
    end
    end,
})

DF:AddButton({
	Text = "Anti Banana (Delete Legs)",
	Func = function()
	repeat
	ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(char.HumanoidRootPart, 0.5)
	task.wait()
	until char.Humanoid.Ragdolled.Value == true or char.Humanoid.Health == 0
	char["Left Leg"].CFrame = CFrame.new(100000, -100000, 100000)
	char["Right Leg"].CFrame = CFrame.new(100000, -100000, 100000)
	task.wait(0.1)
	SetNetworkOwner:FireServer(char.HumanoidRootPart, char.HumanoidRootPart.CFrame)
	task.wait(0.1)
	task.spawn(function()
    while char.Humanoid.Health > 0 do
	char.Humanoid.HipHeight = 2
	task.wait()
	end
	end)
	task.wait(0.1)
	Toggles.Trd:SetValue(false)
	Toggles.Trd:SetValue(true)
	end,
})

DF:AddToggle("LoopTp", {
	Text = "Loop TP",
	Default = false,
	Callback = function(Value)
	LoopTP = Value
        task.spawn(function()
            while LoopTP do
            local x = math.random(-500, 500)
			local y = math.random(30, 480)
			local z = math.random(-500, 500)
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
			task.wait(0.03)
			end
		end)
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
		Default = nil,
		Multi = false,
		MaxVisibleDropdownItems = 35,
		Callback = function(Selected)
		selectedTarget = getPlayerFromSelection(Selected)
	end,
})

Options.TargetPlayer:OnChanged(function()
Toggles.GrabAntiKick:SetValue(false)
task.wait()
Toggles.GrabAntiKick:SetValue(true)
end)

CTR:AddButton({
	Text = "babah",
	Func = function()
		local tar = selectedTarget
		local targetHRP = tar.Character:FindFirstChild("HumanoidRootPart")
		repeat 
    	task.wait()
    	until LocalPlayer.CanSpawnToy.Value == true or Value == false
		pcall(function()
		spawnItem("BallSnowball", char.HumanoidRootPart.Position + Vector3.new(0, 15, 20))	
		end)
		bom = toysFolder:WaitForChild("BallSnowball", 5)
		task.wait(0.05)
		repeat
		SetNetworkOwner:FireServer(bom.SoundPart, bom.SoundPart.CFrame)
		task.wait()
		until bom.SoundPart:FindFirstChild("PartOwner")
		GrabEvents.DestroyGrabLine:FireServer(bom.SoundPart)
		task.wait(0.05)
		local args = {
    		[1] = {
        	["Hitbox"] = bom:FindFirstChild("SoundPart"),
        	["Model"] = bom,
        	["PositionPart"] = bom.PrimaryPart,
    		},
    	[2] = targetHRP:FindFirstChild("RagdollTouchedHitbox").Position,
		}
		game.ReplicatedStorage.BombEvents.BombExplode:FireServer(unpack(args))
	end,
})

CTR:AddButton({
	Text = "Kill",
	Func = function()
		local tar = selectedTarget
		local pos = char.HumanoidRootPart.CFrame
		local startWait = tick()
		repeat
		char.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
		SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
		task.wait()
		until tar.Character.Humanoid.Sit == true and tar.Character.Head.PartOwner.Value == LocalPlayer.Name or tick() - startWait > 3
		task.wait(0.05)
		tar.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
		task.wait(0.05)
		GrabEvents.DestroyGrabLine:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
    	char.HumanoidRootPart.CFrame = pos
	end,
})

CTR:AddButton({
	Text = "Bring Target Grab",
	Func = function()
		local tar = selectedTarget
		local pos = char.HumanoidRootPart.CFrame
		local startWait = tick()
		repeat
		char.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
		task.wait()
		SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
		until tar.Character.Humanoid.Sit == true and tar.Character.Head.PartOwner.Value == LocalPlayer.Name or tick() - startWait > 3
		tar.Character.HumanoidRootPart.CFrame = pos
    	char.HumanoidRootPart.CFrame = pos  
		GrabEvents.DestroyGrabLine:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
		SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
		GrabEvents.DestroyGrabLine:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	end,
})

CTR:AddButton({
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
		task.wait()
		dropB:FireServer(leftWeld, tar.Character.HumanoidRootPart)
		task.wait()
		grabB:FireServer(leftDet, tar.Character.HumanoidRootPart, leftWeld)
		task.wait(0.1)
    	char.HumanoidRootPart.CFrame = pos
		task.wait(0.5)
		dropB:FireServer(leftWeld, tar.Character.HumanoidRootPart)
	end,
})

CTR:AddButton({
	Text = "Kill Target Blob",
	Func = function()
		local tar = selectedTarget
		local pos = char.HumanoidRootPart.CFrame
		local hum = char and char:FindFirstChild("Humanoid")
		local seat = hum and hum.SeatPart
		local seatParent = seat.Parent
		local grabB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
		local dropB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
		local releaseB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
		local leftDet = seatParent:FindFirstChild("LeftDetector")
		local rightDet = seatParent:FindFirstChild("RightDetector")
		local leftWeld = leftDet and leftDet:FindFirstChild("LeftWeld")
		local rightWeld = rightDet and rightDet:FindFirstChild("RightWeld")
		repeat
		char.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
		grabB:FireServer(leftDet, tar.Character.HumanoidRootPart, leftWeld)
		task.wait()
		releaseB:FireServer(leftWeld, tar.Character.HumanoidRootPart)
		task.wait(0.05)
		tar.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
		until tar.Character.Humanoid.Health == 0
		task.wait(0.05)
    	char.HumanoidRootPart.CFrame = pos
	end,
})

CTR:AddButton({
	Text = "Remove Legs and Arms",
	Func = function()
		local tar = selectedTarget
		game.Workspace.FallenPartsDestroyHeight = -100
		tar.Character["Left Leg"].CFrame = CFrame.new(100000, -math.huge, 100000)
		tar.Character["Right Leg"].CFrame = CFrame.new(100000, -math.huge, 100000)
		tar.Character["Left Arm"].CFrame = CFrame.new(100000, -math.huge, 100000)
		tar.Character["Right Arm"].CFrame = CFrame.new(100000, -math.huge, 100000)
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
	if Value then
	Lgrab = true
	repeat 
    task.wait()
    until LocalPlayer.CanSpawnToy.Value == true or Value == false
	spawnItem("PalletLightBrown", char.HumanoidRootPart.Position + Vector3.new(0, 5, 20))
	palletL = toysFolder:WaitForChild("PalletLightBrown")
	palletL.Name = "loopgrabragdoll"
	SP = palletL:WaitForChild("SoundPart")
	repeat
	pcall(function()
	SetNetworkOwner:FireServer(SP, SP.CFrame)
	task.wait()	
	end)
	until SP:FindFirstChild("PartOwner") or Value == false
	SP.CanCollide = false
	for _, part in ipairs(palletL:GetChildren()) do
    if part.Name == "Part" and part:IsA("Part") then
    part.Transparency = 1
    end
    end
	local bodypos = Instance.new("BodyPosition", SP)
	bodypos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bodypos.D = 12500
	bodypos.Position = Vector3.new(0, 1000000, 0)
	task.wait()
	if lok then
	local bop = Instance.new("BodyPosition")
	bop.Position = tar.Character.HumanoidRootPart.Position + Vector3.new(0, -2.4, 0)
	bop.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bop.Parent = tar.Character.HumanoidRootPart
	end
	task.spawn(function()
	while Lgrab do
    SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	task.wait()
	end
	end)
	task.spawn(function()
	while Lgrab do
    task.wait(0.05)
	SP.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 0)
	task.wait()
	SP.CFrame = CFrame.new(0, 1000000, 0)
	end
	end)
	task.spawn(function()
    while Lgrab do
	local distance = (char.HumanoidRootPart.Position - tar.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude 
    if tar and tar.Character and tar.Character:FindFirstChild("HumanoidRootPart") then
	if distance > 20 then
    char.HumanoidRootPart.CFrame = tar.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 0, 5)
	char.HumanoidRootPart.Velocity = Vector3.zero
    char.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
    char.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
    end
    end
	task.wait(0.5)  
    end
	end)
	else
	Lgrab = false
	pcall(function()
	SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	GrabEvents.DestroyGrabLine:FireServer(tar.Character.HumanoidRootPart)	
	end)
	if toysFolder:FindFirstChild("loopgrabragdoll") then
	DestroyT(toysFolder:FindFirstChild("loopgrabragdoll"))
	end
	tar.Character.HumanoidRootPart.BodyPosition:Destroy()
	end
	end,
})

CTR:AddDropdown("Lock Variant", {
	Values = { "OneHand", "TwoHands" },
	Default = nil, -- number index of the value / string
	Multi = false, -- true / false, allows multiple choices to be selected
	Callback = function(Value)
		selectedVariant = Value
	end,
})

CTR:AddSlider("LockSpeed", {
        Text = "Lock Speed",
        Default = 0,
        Min = 0,
        Max = 0.5,
        Rounding = 10,
        Callback = function(Value)
        lockwait = Value
    end
})

	CTR:AddToggle("Lock Target", {
	Text = "Lock Target",
	Default = false,
	Callback = function(Value)
	local tar = selectedTarget
	local pos = char.HumanoidRootPart.CFrame
	local hum = char and char:FindFirstChild("Humanoid")
	local seat = hum and hum.SeatPart
	local seatParent = seat.Parent
	local grabB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
	local dropB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
	local releaseB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
	local leftDet = seatParent:FindFirstChild("LeftDetector")
	local rightDet = seatParent:FindFirstChild("RightDetector")
	local leftWeld = leftDet and leftDet:FindFirstChild("LeftWeld")
	local rightWeld = rightDet and rightDet:FindFirstChild("RightWeld")
	if Value then
	LockB = true
	local distance = (char.HumanoidRootPart.Position - tar.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude
	if distance > 50 then
	seatParent.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
	task.wait(0.25)
	grabB:FireServer(rightDet, tar.Character.HumanoidRootPart, rightWeld)
	task.wait(0.25)
	char.HumanoidRootPart.CFrame = pos
	task.wait(0.5)
	dropB:FireServer(rightWeld, tar.Character.HumanoidRootPart)
	end
	task.spawn(function()
	while LockB do
	if selectedVariant == "OneHand" then
	grabB:FireServer(leftDet, tar.Character.HumanoidRootPart, leftWeld)
	task.wait(lockwait)
	releaseB:FireServer(leftWeld, tar.Character.HumanoidRootPart)
	task.wait(lockwait)
	elseif selectedVariant == "TwoHands" then
	grabB:FireServer(leftDet, tar.Character.HumanoidRootPart, leftWeld)
	task.wait(lockwait)
	releaseB:FireServer(leftWeld, tar.Character.HumanoidRootPart)
	task.wait(lockwait)
	grabB:FireServer(rightDet, tar.Character.HumanoidRootPart, rightWeld)
	task.wait(lockwait)
	releaseB:FireServer(rightWeld, tar.Character.HumanoidRootPart)
	task.wait(lockwait)
	end
	task.wait()
	end
	end)
	else
	LockB = false
	end
	end,
})

	TR:AddToggle("LoopGrabKick", {
	Text = "Loop Grab Kick",
	Default = false,
	Callback = function(Value)
	local tar = selectedTarget
	local pos = char.HumanoidRootPart.CFrame
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local tRoot = tar.Character:FindFirstChild("HumanoidRootPart")
	if Value then
	Lgrabk = true
    local bop = Instance.new("BodyPosition")
	bop.Position = char.HumanoidRootPart.Position + Vector3.new(posX, posY, posZ)
	bop.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bop.D = 100
	bop.Parent = tar.Character.HumanoidRootPart
	local bog = Instance.new("BodyGyro")
	bog.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
	bog.Parent = tar.Character.HumanoidRootPart
	repeat
	char.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
	SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	task.wait()
	until tar.Character.Humanoid.Sit == true and tar.Character.Head.PartOwner.Value == LocalPlayer.Name or Lgrabk == false
    if LgrabS == false then
	tar.Character.HumanoidRootPart.BodyPosition:Destroy()
	tar.Character.HumanoidRootPart.BodyGyro:Destroy()
	else
	char.HumanoidRootPart.CFrame = pos
	tar.Character.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ)
	tar.Character.Head.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ)
	tar.Character["Left Leg"].CFrame = char.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ)
	tar.Character["Right Leg"].CFrame = char.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ)
	tar.Character["Left Arm"].CFrame = char.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ)
	tar.Character["Right Arm"].CFrame = char.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ)
	ragdoS = true
	task.spawn(function()
	while Lgrabk do
	task.wait()
	--GrabEvents.DestroyGrabLine:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	--if tar.IsHeld.Value == false then
	SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	--end
	GrabEvents.DestroyGrabLine:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	if tar.Character.HumanoidRootPart.BodyPosition then
	tar.Character.HumanoidRootPart.BodyPosition.Position = char.HumanoidRootPart.Position + Vector3.new(posX, posY, posZ)
	end
	end
	end)

	task.spawn(function()
    while Lgrabk do
	local distance = (char.HumanoidRootPart.Position - tar.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude
    if tar and tar.Character and tar.Character:FindFirstChild("HumanoidRootPart") then
	if distance > 17.5 then
	pos = char.HumanoidRootPart.CFrame
	char.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
	SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	task.wait(0.25)	
	tar.Character.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ)
	tar.Character.Head.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ)
	tar.Character["Left Leg"].CFrame = char.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ)
	tar.Character["Right Leg"].CFrame = char.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ)
	tar.Character["Left Arm"].CFrame = char.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ)
	tar.Character["Right Arm"].CFrame = char.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ)
	char.HumanoidRootPart.CFrame = pos
    char.HumanoidRootPart.Velocity = Vector3.zero
    char.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
    char.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
    end
    end
	task.wait(0.25)  
    end
	end)

	task.spawn(function()
	local function setup(character)
    if not character or not character:FindFirstChild("HumanoidRootPart") then
    return nil, nil
    end
    tRoot = character.HumanoidRootPart
    local bop = Instance.new("BodyPosition")
    bop.Position = char.HumanoidRootPart.Position + Vector3.new(posX, posY, posZ)
    bop.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bop.D = 100
    bop.Parent = tRoot
    local bog = Instance.new("BodyGyro")
    bog.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bog.Parent = tRoot
    return bop, bog
	end
	tar.CharacterAdded:Connect(function(character)
	character:WaitForChild("HumanoidRootPart")
	if Lgrabk then
	setup(character)
	end
	end)
	end)

	end

	else
	Lgrabk = false
	ragdoS = false
	tar.Character.HumanoidRootPart.BodyPosition:Destroy()
	tar.Character.HumanoidRootPart.BodyGyro:Destroy()
	end
	end,
})

TR:AddCheckbox("LoopGrabKickRagdoll", {
	Text = "Loop Grab Kick Ragdoll",
	Default = false,
	Callback = function(Value)
	local tar = selectedTarget
	if Value then
	vall = true
	repeat 
    task.wait()
    until LocalPlayer.CanSpawnToy.Value == true or Value == false
	spawnItem("PalletLightBrown", char.HumanoidRootPart.Position + Vector3.new(0, 5, 20))
	pallet = toysFolder:WaitForChild("PalletLightBrown")
	pallet.Name = "RAGDOLL"
	SP = pallet:WaitForChild("SoundPart")
	repeat
	pcall(function()
	SetNetworkOwner:FireServer(SP, SP.CFrame)
	task.wait()	
	end)
	until SP:FindFirstChild("PartOwner") or Value == false
	SP.CanCollide = false
	for _, part in ipairs(pallet:GetChildren()) do
    if part.Name == "Part" and part:IsA("Part") then
    part.Transparency = 1
    end
    end
	local bodypos = Instance.new("BodyPosition", SP)
	bodypos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bodypos.D = 12500
	bodypos.Position = Vector3.new(0, 1000000, 0)
	task.wait()
	while vall do
	pcall(function()
	tar = selectedTarget
	if ragdoS then
	task.wait(0.075)
	SP.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 0)
	task.wait()
	SP.CFrame = CFrame.new(0, 1000000, 0)
	end
	end)
	task.wait()
	end
	else
	vall = false
	if toysFolder:FindFirstChild("RAGDOLL") then
	DestroyT(toysFolder:FindFirstChild("RAGDOLL"))
	end
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
	local leftWeld = leftDet and leftDet:FindFirstChild("LeftWeld")
	local rightDet = seatParent:FindFirstChild("RightDetector")
	local rightWeld = rightDet and rightDet:FindFirstChild("RightWeld")
	if Value then
	LgrabB = true
	leftDet.LeftWeld.Enabled = false
	leftDet.LeftAlignOrientation.Enabled = false
	local bopB = Instance.new("BodyPosition")
	bopB.Position = char.HumanoidRootPart.Position + Vector3.new(0, 27.5, 0)
	bopB.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bopB.D = 100
	bopB.Parent = tar.Character.HumanoidRootPart
	repeat
	seatParent.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
	seatParent.HumanoidRootPart.Velocity = Vector3.zero
    seatParent.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
    seatParent.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
	grabB:FireServer(rightDet, tar.Character.HumanoidRootPart, rightWeld)
	task.wait()
	SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	until tar.Character.Humanoid.Sit or LgrabB == false
    seatParent.HumanoidRootPart.Velocity = Vector3.zero
    seatParent.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
    seatParent.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
    seatParent.HumanoidRootPart.CFrame = posB
	task.spawn(function()
	while LgrabB do
	if tar.Character.Humanoid.Health > 0 then    
	grabB:FireServer(leftDet, tar.Character.HumanoidRootPart, leftWeld)
	task.wait()
	dropB:FireServer(leftWeld, tar.Character.HumanoidRootPart)
	end
	task.wait()
	end
	end)
	else
	LgrabB = false
	tar.Character.HumanoidRootPart.BodyPosition:Destroy()
	leftDet.LeftWeld.Enabled = true
	leftDet.LeftAlignOrientation.Enabled = true
	end
	end,
})

CTR:AddToggle("LoopBanana", {
	Text = "Loop Banana",
	Default = false,
	Callback = function(Value)
	local tar = selectedTarget
	local pos = char.HumanoidRootPart.CFrame
	if Value then
	Lbanana = true
	E = false
	repeat 
    task.wait()
    until LocalPlayer.CanSpawnToy.Value == true or Value == false
	pcall(function()
	spawnItem("FoodBanana", char.HumanoidRootPart.Position + Vector3.new(0, 5, 20))
	end)
	banan = toysFolder:WaitForChild("FoodBanana", 5)
	banan.Name = "loopbanan"
	local holdPart = banan:WaitForChild("HoldPart")
	task.wait(0.05)
	pcall(function()
	holdPart.HoldItemRemoteFunction:InvokeServer(banan, char)
	ReplicatedStorage.HoldEvents.Use:FireServer(banan)
	end)
    repeat
	if banan:FindFirstChild("EdiblePart") then
    task.wait()
	else
	E = true
	end
	task.wait()
    until E or Value == false
	holdPart.DropItemRemoteFunction:InvokeServer(banan, char.HumanoidRootPart.CFrame * CFrame.new(-3, 5, 0), Vector3.new(0, 0, 0))
	repeat
	SetNetworkOwner:FireServer(banan.SoundPart, banan.SoundPart.CFrame)
	task.wait() 
	until banan.SoundPart:FindFirstChild("PartOwner") and banan.SoundPart:FindFirstChild("PartOwner").Value == LocalPlayer.Name or Value == false
	GrabEvents.DestroyGrabLine:FireServer(banan.SoundPart)  
	task.spawn(function()
	while Lbanana do
	task.wait(0.05)
	banan.SoundPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, -1, 0)
	end
	end)
	task.spawn(function()
	while Lbanana do
	task.wait(0.05)
	banan.SoundPart.Velocity = Vector3.new(300, 0, 300)
	task.wait(0.05)
	banan.SoundPart.Velocity = Vector3.new(-300, 0, 300)
	task.wait(0.05)
	banan.SoundPart.Velocity = Vector3.new(-300, 0, -300)
	task.wait(0.05)
	banan.SoundPart.Velocity = Vector3.new(300, 0, -300)
	end
	end)
	else
	Lbanana = false
	if toysFolder:FindFirstChild("loopbanan") then
	DestroyT(toysFolder:FindFirstChild("loopbanan"))
	end
	end
	end,
})

TR:AddButton({
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
		end)
		seatParent.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
		seatParent.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
		task.wait()
		until tar.Character.Humanoid.Sit == true and tar.Character.Head.PartOwner.Value == LocalPlayer.Name
		task.wait()
		seatParent.HumanoidRootPart.Anchored = true
		task.wait(0.25)
		SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)  
		GrabEvents.DestroyGrabLine:FireServer(tar.Character.HumanoidRootPart)
		tar.Character.HumanoidRootPart.BodyPosition:Destroy()
		grabB:FireServer(leftDet, tar.Character.HumanoidRootPart, leftWeld)
		task.wait(1)
		DestroyT(seatParent)
	end,
})

CTR:AddToggle("GrabAntiKick", {
		Text = "Grab Anti Kick",
		Default = false,
		Callback = function(Value)
		local tar = selectedTarget
		if Value then
		GrabAntiKick = true
		while GrabAntiKick do
		if tar then
		local toysFolderTarget = workspace:FindFirstChild(tar.Name.."SpawnedInToys")
		for _, obj in ipairs(toysFolderTarget:GetChildren()) do
		pcall(function()
		if obj:FindFirstChild("StickyPart") then
		SetNetworkOwner:FireServer(obj.SoundPart, obj.SoundPart.CFrame)
		SetNetworkOwner:FireServer(obj.Hitbox, obj.Hitbox.CFrame)
		SetNetworkOwner:FireServer(obj.MeshPart, obj.MeshPart.CFrame)
		end
		end)	
		end
		end
		task.wait()
		end
		else
		GrabAntiKick = false
		end
	end,
})

CTR:AddButton({
	Text = "Steal Anti InputLag",
	Func = function()
	local tar = selectedTarget
	local toysFolderTarget = workspace:FindFirstChild(tar.Name.."SpawnedInToys")
		for _, obj in ipairs(toysFolderTarget:GetChildren()) do
			pcall(function()
				if obj:FindFirstChild("HoldPart") then
					obj.HoldPart.HoldItemRemoteFunction:InvokeServer(obj, char)
					obj.HoldPart.HoldItemRemoteFunction:InvokeServer(obj, char)
					obj.HoldPart.HoldItemRemoteFunction:InvokeServer(obj, char)
					obj.HoldPart.HoldItemRemoteFunction:InvokeServer(obj, char)
					obj.HoldPart.HoldItemRemoteFunction:InvokeServer(obj, char)
					task.wait()
					obj.HoldPart.DropItemRemoteFunction:InvokeServer(obj, char)
				end
			end)	
		end
	end,
})

BL:AddToggle("AutoSit", {
	Text = "Auto Sit",
	Default = false,
	Callback = function(Value)
	local blob = toysFolder:FindFirstChild("CreatureBlobman")
	local function spawnblobman()
	repeat 
    task.wait()
    until LocalPlayer.CanSpawnToy.Value == true or Value == false
	pcall(function()
	spawnItem("CreatureBlobman", char.HumanoidRootPart.Position + Vector3.new(0, 5, 20))
	end)
	repeat 
    task.wait()
	blob = toysFolder:FindFirstChild("CreatureBlobman")
    until blob or Value == false
	end
	if Value then
	autosit = true
	task.spawn(function()
	while autosit do
	if not blob then
	spawnblobman()
	blob:WaitForChild("VehicleSeat")
	blob.VehicleSeat:Sit(char.Humanoid)
	end
	task.wait()
	if blob:FindFirstChild("VehicleSeat") then
	blob.VehicleSeat:Sit(char.Humanoid)
	else
	spawnblobman()
	blob:WaitForChild("VehicleSeat")
	blob.VehicleSeat:Sit(char.Humanoid)
	end
	end
	end)
	else
	autosit = false
	end
	end,
})

CTR:AddButton({
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

TR:AddSlider("TargetPosX", {
	Text = "Target Pos X",
	Default = 0,
	Min = -15,
	Max = 15,
	Rounding = 1,
	Compact = false,
	Callback = function(Value)
		posX = Value
	end,
})

TR:AddSlider("TargetPosY", {
	Text = "Target Pos Y",
	Default = 15,
	Min = -15,
	Max = 15,
	Rounding = 1,
	Compact = false,
	Callback = function(Value)
		posY = Value
	end,
})

TR:AddSlider("TargetPosZ", {
	Text = "Target Pos Z",
	Default = 0,
	Min = -15,
	Max = 15,
	Rounding = 1,
	Compact = false,
	Callback = function(Value)
		posZ = Value
	end,
})

P.PlayerAdded:Connect(function()
    Options.SelectPlayerr:SetValues(getPlayerList())
end)

P.PlayerRemoving:Connect(function()
    Options.SelectPlayer:SetValues(getPlayerList())
end)

WL:AddDropdown("SelectPlayer", {
		Values = getPlayerList(),
		Default = nil,
		Multi = false,
		MaxVisibleDropdownItems = 15,
		Callback = function(Selected)
		selectedPlayer = getPlayerFromSelection(Selected)
	end,
})

WL:AddToggle("AntiGrabPlayer", {
	Text = "Anti Grab Player",
	Default = false,
	Callback = function(Value)
	local player = selectedPlayer
	if Value then
            antigrabplayer = RunService.Heartbeat:Connect(function()
			if player then
                local character = player.Character
                if character and character:FindFirstChild("Head") then
                    local head = character.Head
                    local partOwner = head:FindFirstChild("PartOwner")
                    if partOwner then
					if partOwner and partOwner.Value == LocalPlayer.Name then
					task.wait()
					else
					task.wait()
					local oldposition = char.HumanoidRootPart.CFrame
					char.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
					task.wait()
					SetNetworkOwner:FireServer(character.HumanoidRootPart, character.HumanoidRootPart.CFrame)  
					GrabEvents.DestroyGrabLine:FireServer(character.HumanoidRootPart, character.HumanoidRootPart.CFrame)
					task.wait()
					char.HumanoidRootPart.CFrame = oldposition
					task.wait(0.25)
					end
					end
                end
			end
        end)
    else
        if antigrabplayer then
            antigrabplayer:Disconnect()
            antigrabplayer = nil
            end
        end
	end,
})

WL:AddButton({
	Text = "Break",
	Func = function()
		local player = selectedPlayer
		local pos = char.HumanoidRootPart.CFrame
		local hum = char and char:FindFirstChild("Humanoid")
		local seat = hum and hum.SeatPart
		local seatParent = seat.Parent
		local grabB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
		local dropB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
		local releaseB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
		local leftDet = seatParent:FindFirstChild("LeftDetector")
		local rightDet = seatParent:FindFirstChild("RightDetector")
		local leftWeld = leftDet and leftDet:FindFirstChild("LeftWeld")
		local rightWeld = rightDet and rightDet:FindFirstChild("RightWeld")
		grabB:FireServer(leftDet, player.Character.HumanoidRootPart, leftWeld)
		task.wait()
		releaseB:FireServer(leftWeld, player.Character.HumanoidRootPart)
		player.Character.Humanoid.WalkSpeed = PWS
		player.Character.Humanoid.JumpPower = PJP
	end,
})

WL:AddSlider("PlayerWalkSpeed", {
        Text = "Player WalkSpeed",
        Default = 16,
        Min = 16,
        Max = 500,
        Rounding = 0,
        Callback = function(Value)
        PWS = Value
    end
})

WL:AddSlider("PlayerJumpPower", {
        Text = "Player JumpPower",
        Default = 24,
        Min = 24,
        Max = 500,
        Rounding = 0,
        Callback = function(Value)
        PJP = Value
    end
})

KB:AddLabel("Spawn"):AddKeyPicker("KeyPicker1", {
	Default = "One",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(0, 5, 0)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

KB:AddLabel("Plot 1"):AddKeyPicker("KeyPicker2", {
	Default = "Two",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(-492, 5, -167)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

KB:AddLabel("Plot 2"):AddKeyPicker("KeyPicker3", {
	Default = "Three",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(-535, 5, 90)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

KB:AddLabel("Plot 3"):AddKeyPicker("KeyPicker4", {
	Default = "Four",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(250, 1, 460)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

KB:AddLabel("Plot 4"):AddKeyPicker("KeyPicker5", {
	Default = "Five",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(512, 89, -340)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

KB:AddLabel("Plot 5"):AddKeyPicker("KeyPicker6", {
	Default = "Six",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(553, 129, -75)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

KB:AddLabel("Barn"):AddKeyPicker("KeyPicker7", {
	Default = "Seven",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(-195, 69, -285)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

KB:AddLabel("House"):AddKeyPicker("KeyPicker8", {
	Default = "Eight",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(-282, 84, 313)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

KB:AddLabel("Island"):AddKeyPicker("KeyPicker9", {
	Default = "Nine",
	Callback = function()
	char.HumanoidRootPart.CFrame = CFrame.new(72, 352, 341)
   	char.HumanoidRootPart.Velocity = Vector3.new(0, 1, 0)
	end,
})

MC:AddToggle("PLCD", {
	Text = "PLCD View",
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

MC:AddToggle("Shaders", {
	Text = "Shaders",
	Default = false,
	Callback = function(Value)
	local water = game.Workspace.Map.AlwaysHereTweenedObjects.Ocean.Object:FindFirstChild("ObjectModel")
	local Lighting = game:GetService("Lighting")
	if Value then
	Lighting.ClockTime = 7.5
	local blur = Instance.new("BlurEffect", Lighting)
	blur.Size = 3
	local sunrays = Instance.new("SunRaysEffect", Lighting)
	sunrays.Intensity = 0.1
    for _, part in ipairs(water:GetChildren()) do
        if part.Name == "Ocean" and part:IsA("Part") then
            part.Transparency = 1
        end
    end
   	else
	Lighting.ClockTime = 14
	Lighting.Blur:Destroy()
	Lighting.SunRays:Destroy()
    for _, part in ipairs(water:GetChildren()) do
        if part.Name == "Ocean" and part:IsA("Part") then
            part.Transparency = 0
        end
    end
	end
	end,
})

MC:AddToggle("DisableBarrierCollisions", {
	Text = "Disable Barrier Collisions",
	Default = false,
	Callback = function(Value)
	for plotNumber = 1, 5 do
            local plotName = "Plot" .. plotNumber
            local plot = game.Workspace.Plots[plotName]
            
            if plot then
                local group = plot:FindFirstChild("Barrier")
                if group then
                    for _, part in ipairs(group:GetChildren()) do
                        if part.Name == "PlotBarrier" and part:IsA("Part") then
                            part.CanCollide = not Value
                            part.CanQuery = not Value
                        end
                    end
                end
                
                local plotArea = plot:FindFirstChild("PlotArea")
                if plotArea and plotArea:IsA("BasePart") then
                    plotArea.CanQuery = not Value
                end
            end
        end
	end,
})

MC:AddToggle("WaterWalk", {
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

MC:AddToggle("LoopRagdoll", {
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

MC:AddToggle("BoomBox", {
	Text = "BoomBox",
	Default = false,
	Callback = function(Value)
	if Value then
		repeat 
    		task.wait()
    	until LocalPlayer.CanSpawnToy.Value == true

		pcall(function()
			spawnItem("Boombox", char.HumanoidRootPart.Position + Vector3.new(0, 10, 20))	
		end)

		local box = toysFolder:WaitForChild("Boombox")
		local CP = box:WaitForChild("ColorPart")

		task.wait(0.05)

		for _, obj in ipairs(box:GetChildren()) do
			if obj:IsA("Part") or obj:IsA("MeshPart") then
    			obj.CanCollide = false
			end
    	end

		boombox = RunService.Heartbeat:Connect(function()
			if not CP:FindFirstChild("PartOwner") or CP:FindFirstChild("PartOwner").Value ~= LocalPlayer.Name then
				SetNetworkOwner:FireServer(CP, CP.CFrame)
			end
			CP.CFrame = char.Torso.CFrame * CFrame.new(0, -0.1, 1.25) * CFrame.Angles(0, math.rad(180), 0)
			CP.Velocity = Vector3.zero
		end)

   		elseif boombox then
		boombox:Disconnect()
		boombox = nil
		if toysFolder:FindFirstChild("Boombox") then
		DestroyT(toysFolder:FindFirstChild("Boombox"))
		end	

		end
	end,
})

MC:AddToggle("FartherReach", {
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

MC:AddButton("PencilPenis", {
        Text = "PencilPenis",
        Func = function()
		repeat 
    	task.wait()
    	until LocalPlayer.CanSpawnToy.Value == true or Value == false
		pcall(function()
		spawnItem("ToolPencil", char.HumanoidRootPart.Position + Vector3.new(0, 5, 20))	
		end)
		pen = toysFolder:WaitForChild("ToolPencil", 5)
		task.wait(0.05)
		SetNetworkOwner:FireServer(pen.SoundPart, pen.SoundPart.CFrame)
		task.wait(0.05)
		StickyPartEvent:FireServer(pen.StickyPart, char.Torso, CFrame.new(0, -0.75, 0) * CFrame.Angles(0, math.rad(180), 0))
	end,
})

SRV:AddButton({
	Text = "Break Barrier",
	Func = function()
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local breaker
	repeat 
    task.wait()
    until LocalPlayer.CanSpawnToy.Value == true
	pcall(function()
	spawnItem("FoodHamburger", spaw.Position + Vector3.new(0, 100, 0))	
	end)
	local breaker = toysFolder:WaitForChild("FoodHamburger")
	local holdpart = breaker:WaitForChild("HoldPart")
	holdpart.HoldItemRemoteFunction:InvokeServer(breaker, char)
	ReplicatedStorage.HoldEvents.Use:FireServer(breaker)
	task.wait(1.8)
	hrp.CFrame = CFrame.new(250, 1, 460)
	end,
})

SRV:AddButton({
	Text = "Grab All Items",
	Func = function()
	for _, obj in ipairs(game.Workspace:GetDescendants()) do
	pcall(function()
    if obj:FindFirstChild("HoldPart") then
    obj.HoldPart.HoldItemRemoteFunction:InvokeServer(obj, char)
    obj.HoldPart.DropItemRemoteFunction:InvokeServer(obj, char)
    end
    end)
    end
	end,
})

SRV:AddSlider("PacketStrength", {
        Text = "Packet Lag Strength",
        Default = 500,
        Min = 500,
        Max = 50000,
        Rounding = 0,
        Callback = function(Value)
        PacketAmount = Value
    end
})

SRV:AddButton("PacketLagButton", {
        Text = "Packet Lag",
        Func = function()
		local extGrabLineEvent = GrabEvents:WaitForChild("ExtendGrabLine")
		extGrabLineEvent:FireServer(string.rep("🤣🤣🤣🤣🤣", PacketAmount))
	end,
})

SRV:AddToggle("PacketLag", {
        Text = "Loop Packet Lag",
        Default = false,
        Callback = function(Value)
		local extGrabLineEvent = GrabEvents:WaitForChild("ExtendGrabLine")
		if Value then
		PacketLag = true
            while PacketLag do
               extGrabLineEvent:FireServer(string.rep("🤣🤣🤣🤣🤣", PacketAmount))
			   task.wait(0.5)
            end
        else
            PacketLag = false
        end
	end,
})

local function spawnShurikens()
    repeat
		task.wait()
	until LocalPlayer.CanSpawnToy.Value == true
    pcall(function()
        spawnItem("NinjaShuriken", char.HumanoidRootPart.Position + Vector3.new(0, 5, 25))
    end)
end

SRV:AddDropdown("SelProp", {
		Values = { "InnerUFO", "OuterUFO", "CaveCart", "Train" },
		Default = nil,
		Multi = false,
		Callback = function(Sel)
		Modelbreak = Sel
	end,
})
  
SRV:AddButton("BreakProp", {
        Text = "Break",
        Func = function()
		chosenModel = Modelbreak
		if chosenModel == "InnerUFO" then
		local model = workspace.Map.AlwaysHereTweenedObjects.InnerUFO.Object
		local partremove = model.ObjectModel.Body
		elseif chosenModel == "OuterUFO" then
		local model = workspace.Map.AlwaysHereTweenedObjects.OuterUFO.Object
		local partremove = model.ObjectModel.Body
		elseif chosenModel == "CaveCart" then
		local model = workspace.Map.AlwaysHereTweenedObjects.CaveCart.Object
		local partremove = model.ObjectModel:FindFirstChild("Part")
		elseif chosenModel == "Train" then
		local model = workspace.Map.AlwaysHereTweenedObjects.Train.Object
		local partremove = model.ObjectModel.BallOctagon
		end
		for i = 1, 11 do
        spawnShurikens()
		task.wait(0.1)
		end
		task.wait(0.5)
		for _, del in ipairs(toysFolder:GetChildren()) do
			pcall(function()
    			if del:FindFirstChild("StickyPart") and del.Name == "NinjaShuriken" then
					SetNetworkOwner:FireServer(del.SoundPart, del.SoundPart.CFrame)
				task.wait()
					StickyPartEvent:FireServer(del.StickyPart, partremove, CFrame.new(0, 0, 0))
    			end
    		end)
    	end
		model.FollowThisPart.AlignOrientation.Enabled = false
		model.FollowThisPart.AlignPosition.Enabled = false
	end,
})

SRV:AddButton("BringAll", {
    Text = "Bring All",
    Func = function()
	local posj = char.HumanoidRootPart.CFrame
	for _, plrsnearby in ipairs(P:GetPlayers()) do
		if plrsnearby ~= LocalPlayer and plrsnearby.Character then
			local plrsnearbyRoot = plrsnearby.Character:FindFirstChild("HumanoidRootPart")
			local plrsnearbyHum = char:FindFirstChildOfClass("Humanoid")
				if plrsnearbyRoot and plrsnearbyHum and plrsnearbyHum.Health > 0 then
					if plrsnearby.InPlot.Value == false then
						local startWait = tick()
						repeat
						char.HumanoidRootPart.CFrame = plrsnearbyRoot.CFrame * CFrame.new(0, 0, 3)
						SetNetworkOwner:FireServer(plrsnearbyRoot, plrsnearbyRoot.CFrame)
						task.wait()
						until plrsnearbyHum.Sit == true and plrsnearby.Character.Head.PartOwner.Value == LocalPlayer.Name or tick() - startWait > 0.5
						plrsnearbyRoot.CFrame = posj
						task.wait(0.05)
						char.HumanoidRootPart.CFrame = posj
					end
				end
			end
		end
	end,
})

SRV:AddToggle("BananaAll", {
	Text = "Banana All",
	Default = false,
	Callback = function(Value)
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if Value then
	E = false
	repeat 
    task.wait()
    until LocalPlayer.CanSpawnToy.Value == true or Value == false
	pcall(function()
	spawnItem("FoodBanana", char.HumanoidRootPart.Position + Vector3.new(0, 5, 20))
	end)
	banan = toysFolder:WaitForChild("FoodBanana", 5)
	banan.Name = "loopbananall"
	local holdPart = banan:WaitForChild("HoldPart")
	task.wait(0.05)
	pcall(function()
	holdPart.HoldItemRemoteFunction:InvokeServer(banan, char)
	ReplicatedStorage.HoldEvents.Use:FireServer(banan)
	end)
    repeat
	if banan:FindFirstChild("EdiblePart") then
    task.wait()
	else
	E = true
	end
	task.wait()
    until E or Value == false
	holdPart.DropItemRemoteFunction:InvokeServer(banan, char.HumanoidRootPart.CFrame * CFrame.new(-3, 5, 0), Vector3.new(0, 0, 0))
	repeat
	SetNetworkOwner:FireServer(banan.SoundPart, banan.SoundPart.CFrame)
	task.wait() 
	until banan.SoundPart:FindFirstChild("PartOwner") and banan.SoundPart:FindFirstChild("PartOwner").Value == LocalPlayer.Name or Value == false
	GrabEvents.DestroyGrabLine:FireServer(banan.SoundPart)
	task.wait(0.05)
	banan.SoundPart.CFrame = CFrame.new(153, 250, 335)
	banan.SoundPart.Velocity = Vector3.new(0, 0, 0)
	BananaAll = true
	while BananaAll do
	for _, plrs in ipairs(P:GetPlayers()) do
		if plrs ~= LocalPlayer and plrs.Character then
			local plrsRoot = plrs.Character:FindFirstChild("HumanoidRootPart")
			local plrsHum = char:FindFirstChildOfClass("Humanoid")
				if plrsRoot and plrsHum and plrsHum.Health > 0 then
					banan.SoundPart.CFrame = plrsRoot.CFrame * CFrame.new(0, -1, 0)
					banan.SoundPart.Velocity = Vector3.new(0, -100, 0)
					task.wait(0.15)
					banan.SoundPart.CFrame = CFrame.new(153, 250, 335)
					banan.SoundPart.Velocity = Vector3.new(0, 0, 0)
				end
			end
		end
		task.wait(0.15)
	end
	else
	BananaAll = false
	if toysFolder:FindFirstChild("loopbananall") then
	DestroyT(toysFolder:FindFirstChild("loopbananall"))
	end
	end
	end,
})

FKB:AddLabel("TP Mouse"):AddKeyPicker("Tpbind", {
	Default = "Z",
	Callback = function()
	local mouse = LocalPlayer:GetMouse()
	local char = LocalPlayer.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
	char.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))  
	end
	end,
})

FKB:AddLabel("Jerk Off"):AddKeyPicker("jerkoffbind", {
	Default = "G",
	Callback = function(Value)
	animator = char:WaitForChild("Humanoid"):WaitForChild("Animator")
	local anim = Instance.new("Animation", char.Humanoid)
	anim.AnimationId = "rbxassetid://168268306"
	jerkoff = animator:LoadAnimation(anim)
	jerkoffanimation = Value; jerkoff:Play()
	task.spawn(function()
	while jerkoffanimation do
	jerkoff.TimePosition = 0.3
	task.wait(0.075)
	end
	end)
	end,
})

FKB:AddLabel("PacketLag"):AddKeyPicker("LagBind", {
	Default = "T",
	Callback = function()
	local extGrabLineEvent = GrabEvents:WaitForChild("ExtendGrabLine")
	extGrabLineEvent:FireServer(string.rep("🤣🤣🤣🤣🤣", PacketAmount))
	Library:Notify({
	Title = "Keybind",
	Description = "Packet Lag",
	Time = 3,
	})
	end,
})

FKB:AddLabel("Spawn And Sit Blobman"):AddKeyPicker("seatblobbind", {
	Default = "X",
	Callback = function()
	local blobm
	task.wait()
	if not blob then
	repeat 
    task.wait()
    until LocalPlayer.CanSpawnToy.Value == true
	pcall(function()
	spawnItem("CreatureBlobman", char.HumanoidRootPart.Position + Vector3.new(0, 5, 20))
	end)
	repeat 
    task.wait()
	blobm = toysFolder:FindFirstChild("CreatureBlobman")
    until blobm
	end
	blobm:WaitForChild("VehicleSeat")
	blobm.VehicleSeat:Sit(char.Humanoid)
	end,
})

FKB:AddLabel("Blob Kick"):AddKeyPicker("blobkickbind", {
	Default = "H",
	Callback = function()
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
		end)
		seatParent.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
		seatParent.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
		task.wait()
		until tar.Character.Humanoid.Sit == true and tar.Character.Head.PartOwner.Value == LocalPlayer.Name
		task.wait()
		seatParent.HumanoidRootPart.Anchored = true
		task.wait(0.25)
		SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)  
		GrabEvents.DestroyGrabLine:FireServer(tar.Character.HumanoidRootPart)
		tar.Character.HumanoidRootPart.BodyPosition:Destroy()
		grabB:FireServer(leftDet, tar.Character.HumanoidRootPart, leftWeld)
		task.wait(1)
		DestroyT(seatParent)
	end,
})

FKB:AddLabel("Anchor"):AddKeyPicker("AnchorBind", {
	Default = "K",
	Callback = function()
	char.GrabbingScript.Enabled = false
    char.GrabbingScript.Enabled = true
	end,
})

--FKB:AddLabel("Explode"):AddKeyPicker("explodebind", {
	--Default = "R",
	--Callback = function()
	--local mouse = LocalPlayer:GetMouse()
	--spawnItem("BombMissile", char.HumanoidRootPart.Position + Vector3.new(0, 17.5, 20))
	--local bomb = toysFolder:WaitForChild("BombMissile", 3)
	--task.wait(0.1)
	--explode(bomb, mouse.Target, mouse.Hit.Position)
	--end,
--})

AU:AddDropdown("GrabAuraType", {
		Values = { "Players", "Toys", "Both" },
		Default = nil,
		Multi = false,
		Callback = function(Selected)
		GrabAuraType = Selected
	end,
})

AU:AddSlider("GrabAuraRadius", {
	Text = "Grab Aura Radius",
	Default = 15,
	Min = 5,
	Max = 20,
	Rounding = 1,
	Compact = false,
	Callback = function(Value)
	GrabAuraRadius = Value
	end,
})

AU:AddToggle("GrabAura", {
	Text = "Grab Aura",
	Default = false,
	Callback = function(Value)
	if Value then
	GrabAura = true
	while GrabAura do
	if GrabAuraType == "Players" then
		for _, plrsnearby in ipairs(P:GetPlayers()) do
			if plrsnearby ~= LocalPlayer and plrsnearby.Character then
				local plrsnearbyRoot = plrsnearby.Character:FindFirstChild("HumanoidRootPart")
				local plrsnearbyHum = char:FindFirstChildOfClass("Humanoid")
					if plrsnearbyRoot and plrsnearbyHum and plrsnearbyHum.Health > 0 then
						local distance = (plrsnearbyRoot.Position - char:FindFirstChild("HumanoidRootPart").Position).Magnitude
						if distance <= GrabAuraRadius then
							SetNetworkOwner:FireServer(plrsnearbyRoot, plrsnearbyRoot.CFrame)
						end
					end
				end
			end
		end
		task.wait(0.01)
	end
	else
	GrabAura = false
	end
	end,
})

BAU:AddDropdown("BlobGrabAuraType", {
		Values = { "LeftHand", "RightHand", "BothHands" },
		Default = nil,
		Multi = false,
		Callback = function(Selected)
		BlobGrabAuraType = Selected
	end,
})

BAU:AddSlider("BlobGrabAuraRadius", {
	Text = "Blob Grab Aura Radius",
	Default = 25,
	Min = 5,
	Max = 50,
	Rounding = 1,
	Compact = false,
	Callback = function(Value)
	BlobGrabAuraRadius = Value
	end,
})

BAU:AddSlider("BlobGrabAuraSpeed", {
	Text = "Blob Grab Aura Speed",
	Default = 0.5,
	Min = 0.01,
	Max = 1,
	Rounding = 10,
	Compact = false,
	Callback = function(Value)
	BlobGrabAuraSpeed = Value
	end,
})

BAU:AddToggle("BlobGrabAura", {
	Text = "Blob Grab Aura",
	Default = false,
	Callback = function(Value)
	local hum = char and char:FindFirstChild("Humanoid")
	local seat = hum and hum.SeatPart
	local seatParent = seat.Parent
	local grabB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
	local dropB = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
	local leftDet = seatParent:FindFirstChild("LeftDetector")
	local rightDet = seatParent:FindFirstChild("RightDetector")
	local leftWeld = leftDet and leftDet:FindFirstChild("LeftWeld")
	local rightWeld = rightDet and rightDet:FindFirstChild("RightWeld")
	if Value then
	BlobGrabAura = true
	while BlobGrabAura do
		for _, plrsnearby in ipairs(P:GetPlayers()) do
			if plrsnearby ~= LocalPlayer and plrsnearby.Character then
				local plrsnearbyRoot = plrsnearby.Character:FindFirstChild("HumanoidRootPart")
				local plrsnearbyHum = char:FindFirstChildOfClass("Humanoid")
				if plrsnearbyRoot and plrsnearbyHum and plrsnearbyHum.Health > 0 then
					local distance = (plrsnearbyRoot.Position - char:FindFirstChild("HumanoidRootPart").Position).Magnitude
					if distance <= BlobGrabAuraRadius then
					if BlobGrabAuraType == "LeftHand" then
						grabB:FireServer(leftDet, plrsnearbyRoot, leftWeld)
						task.wait(BlobGrabAuraSpeed)
						dropB:FireServer(leftWeld, plrsnearbyRoot)
						task.wait(BlobGrabAuraSpeed)
					elseif BlobGrabAuraType == "RightHand" then
						grabB:FireServer(rightDet, plrsnearbyRoot, rightWeld)
						task.wait(BlobGrabAuraSpeed)
						dropB:FireServer(rightWeld, plrsnearbyRoot)
						task.wait(BlobGrabAuraSpeed)
					elseif BlobGrabAuraType == "BothHands" then
						grabB:FireServer(leftDet, plrsnearbyRoot, leftWeld)
						task.wait(BlobGrabAuraSpeed)
						dropB:FireServer(leftWeld, plrsnearbyRoot)
						task.wait(BlobGrabAuraSpeed)
						grabB:FireServer(rightDet, plrsnearbyRoot, rightWeld)
						task.wait(BlobGrabAuraSpeed)
						dropB:FireServer(rightWeld, plrsnearbyRoot)
						task.wait(BlobGrabAuraSpeed)	
					end
					end
				end
			end
		end
		task.wait()
	end
	else
	BlobGrabAura = false
	end
	end,
})

AU:AddSlider("BananaAuraRadius", {
	Text = "Banana Aura Radius",
	Default = 15,
	Min = 5,
	Max = 50,
	Rounding = 1,
	Compact = false,
	Callback = function(Value)
	BananaAuraRadius = Value
	end,
})

AU:AddToggle("BananaAura", {
	Text = "Banana Aura",
	Default = false,
	Callback = function(Value)
	if Value then
	E = false
	repeat 
    task.wait()
    until LocalPlayer.CanSpawnToy.Value == true or Value == false
	pcall(function()
	spawnItem("FoodBanana", char.HumanoidRootPart.Position + Vector3.new(0, 5, 20))
	end)
	bananA = toysFolder:WaitForChild("FoodBanana", 5)
	bananA.Name = "bananaura"
	local holdPart = bananA:WaitForChild("HoldPart")
	task.wait(0.05)
	pcall(function()
	holdPart.HoldItemRemoteFunction:InvokeServer(bananA, char)
	ReplicatedStorage.HoldEvents.Use:FireServer(bananA)
	end)
    repeat
	if bananA:FindFirstChild("EdiblePart") then
    task.wait()
	else
	E = true
	end
	task.wait()
    until E or Value == false
	holdPart.DropItemRemoteFunction:InvokeServer(bananA, char.HumanoidRootPart.CFrame * CFrame.new(-3, 5, 0), Vector3.new(0, 0, 0))
	repeat
	SetNetworkOwner:FireServer(bananA.SoundPart, bananA.SoundPart.CFrame)
	task.wait() 
	until bananA.SoundPart:FindFirstChild("PartOwner") and bananA.SoundPart:FindFirstChild("PartOwner").Value == LocalPlayer.Name or Value == false
	task.wait(0.1)
	GrabEvents.DestroyGrabLine:FireServer(bananA.SoundPart)
	bananA.SoundPart.CFrame = CFrame.new(153, 250, 335)
	bananA.SoundPart.Velocity = Vector3.new(0, 0, 0)
	BananaAura = true
	while BananaAura do
	for _, plrsnearby in ipairs(P:GetPlayers()) do
		if plrsnearby ~= LocalPlayer and plrsnearby.Character then
			local plrsnearbyRoot = plrsnearby.Character:FindFirstChild("HumanoidRootPart")
			local plrsnearbyHum = char:FindFirstChildOfClass("Humanoid")
				if plrsnearbyRoot and plrsnearbyHum and plrsnearbyHum.Health > 0 then
					local distance = (plrsnearbyRoot.Position - char:FindFirstChild("HumanoidRootPart").Position).Magnitude
					if distance <= BananaAuraRadius then
						bananA.SoundPart.CFrame = plrsnearbyRoot.CFrame * CFrame.new(0, -1, 0)
						bananA.SoundPart.Velocity = Vector3.new(0, -100, 0)
						task.wait(0.1)
						bananA.SoundPart.CFrame = CFrame.new(153, 250, 335)
						bananA.SoundPart.Velocity = Vector3.new(0, 0, 0)
					end
				end
			end
		end
		task.wait(0.05)
	end
	else
	BananaAura = false
	if toysFolder:FindFirstChild("bananaura") then
	DestroyT(toysFolder:FindFirstChild("bananaura"))
	end
	end
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
Toggles.WaterWalk:SetValue(false)
Toggles.LoopGrabKick:SetValue(false)
Toggles.LoopBlobKick:SetValue(false)
Toggles.LoopGrab:SetValue(false)
Toggles.LoopBanana:SetValue(false)
Toggles.GrabAntiKick:SetValue(false)
Toggles.Strength:SetValue(false)
Toggles.PacketLag:SetValue(false)
Toggles.FartherReach:SetValue(false)
Toggles.AntiNetwork:SetValue(false)
Toggles.AntiGrabGucci:SetValue(false)
Toggles.KillGrabLine:SetValue(false)
Toggles.Counterattack:SetValue(false)
Toggles.AntiBurn:SetValue(false)
Toggles.AntiGrabPlayer:SetValue(false)
Toggles.InfiniteJump:SetValue(false)
Toggles.AntiExplode:SetValue(false)
Toggles.Shaders:SetValue(false)
Toggles.BananaAura:SetValue(false)
Toggles.BlobGrabAura:SetValue(false)
Toggles.GrabAura:SetValue(false)
Toggles.BoomBox:SetValue(false)
Toggles.LoopGrabKickRagdoll:SetValue(false)
Toggles.AutoSit:SetValue(false)
Toggles.BananaAll:SetValue(false)
jerkoffanimation = false
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
