local SelectedPlayer = nil
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
local group = game.workspace
local spaw = game.workspace.SpawnLocation
local hue = 0

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
	Footer = "тут нечего читать",
	NotifySide = "Right",
	ShowCustomCursor = true,
})

local Tabs = {
	Main = Window:AddTab("Main"),
	Target = Window:AddTab("Target"),
	Keybinds = Window:AddTab("Keybinds"),
	["UI Settings"] = Window:AddTab("UI Settings"),
}

local LP = Tabs.Main:AddLeftGroupbox("LocalPlayer")
local GB = Tabs.Main:AddLeftGroupbox("GrabLine")
local DF = Tabs.Main:AddRightGroupbox("Defense")
local KB = Tabs.Keybinds:AddLeftGroupbox("Teleports")
local TR = Tabs.Target:AddLeftGroupbox("Target")

LP:AddSlider("WalkSpeed", {
	Text = "WalkSpeed",
	Default = 16,
	Min = 16,
	Max = 500,
	Rounding = 1,
	Compact = false,
	Callback = function(Value)
		local character = game.Players.LocalPlayer.Character
      if character and character:FindFirstChild("Humanoid") then
          character.Humanoid.WalkSpeed = Value
      end
   character.BobbingAndCrouch.Disabled = true
   character.BobbingAndCrouch.Enabled = true
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
		local character = game.Players.LocalPlayer.Character
      if character and character:FindFirstChild("Humanoid") then
          character.Humanoid.JumpPower = Value
      end
	end,
})

LP:AddSlider("Gravity", {
	Text = "Gravity",
	Default = 100,
	Min = 0,
	Max = 1000,
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
		local group = LocalPlayer.Character
   if Value then
   LocalPlayer.CameraMaxZoomDistance = 100000
   LocalPlayer.CameraMode = 0
   lico = RunService.Heartbeat:Connect(function()
	for _, part in ipairs(group:GetChildren()) do
        if part:IsA("Accessory") then
        part.Handle.Transparency = 0
		group.Torso.Transparency = 0
		group.Head.Transparency = 0
		group["Left Leg"].Transparency = 0
		group["Left Arm"].Transparency = 0
		group["Right Leg"].Transparency = 0
		group["Right Arm"].Transparency = 0
		if part.Name == "TypingKeyboardMyWorld" then
			group.TypingKeyboardMyWorld:Destroy()
			else
			task.wait(0.01)
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
            part.Transparency = 0.8
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

local MyButton = LP:AddButton({
	Text = "Reset",
	Func = function()
		LocalPlayer.Character.Humanoid.Health = 0
	end,
})

--local MyButton = LP:AddButton({
	--Text = "R",
	--Func = function()
		--Toggles.AntiInputLag:SetValue(false)
	--end,
--})

GB:AddToggle("Strong", {
	Text = "Strong GrabLine",
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

DF:AddToggle("AntiExplosion", {
	Text = "Anti Explosion",
	Default = false,
	Callback = function(Value)
	if Value then
	antiexp = RunService.Heartbeat:Connect(function()
	if char.Humanoid.Ragdolled.Value == true then
	char:FindFirstChild("HumanoidRootPart").Anchored = true
	char:FindFirstChild("HumanoidRootPart").Velocity = Vector3.new(0, 0, 0)
	else
	char:FindFirstChild("HumanoidRootPart").Anchored = false
	end
	end)
	else
	if antiexp then
    antiexp:Disconnect()
    antiexp = nil
	end
	end
	end,
})

DF:AddToggle("AntiVoid", {
	Text = "Anti Void",
	Default = true,
	Callback = function(Value)
	if Value then
	game.Workspace.FallenPartsDestroyHeight = -10e+37
   	else
	game.Workspace.FallenPartsDestroyHeight = -100
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
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local firePart = hrp:WaitForChild("FirePlayerPart") or hrp:WaitForChild("FirePlayerPart", 5)

	local function checkantikick()
		if toysFolder:FindFirstChild("NinjaKunai") then
		task.wait()
		else
		spawnItem("NinjaKunai", hrp.Position + Vector3.new(0, 7.5, 20))
		local startWait = tick()
        repeat 
        RunService.Heartbeat:Wait()
		kunai = toysFolder:FindFirstChild("NinjaKunai")
        until kunai or tick() - startWait > 1
		task.wait(0.05)
		local HL = Instance.new("Highlight")
		HL.FillTransparency = 1
		HL.Parent = kunai
		SetNetworkOwner:FireServer(kunai.StickyPart, kunai.StickyPart.CFrame)
		end
	end

	if Value then
	antikick = true
		spawnItem("NinjaKunai", hrp.Position + Vector3.new(0, 7.5, 20))
		local startWait = tick()
        repeat 
        RunService.Heartbeat:Wait()
		kunai = toysFolder:FindFirstChild("NinjaKunai")
        until kunai or tick() - startWait > 1
		task.wait(0.05)
		SetNetworkOwner:FireServer(kunai.StickyPart, kunai.StickyPart.CFrame)
		local HL = Instance.new("Highlight")
		HL.FillTransparency = 1
		HL.Parent = kunai
		--ReplicatedStorage.PlayerEvents.StickyPartEvent:FireServer(kunai.StickyPart, firePart, CFrame.new(0, -1, 0.075) * CFrame.Angles(0,math.rad(90),math.rad(90)))
		task.spawn(function()
		while antikick do
		checkantikick()
		task.wait(0.1)
		ReplicatedStorage.PlayerEvents.StickyPartEvent:FireServer(kunai.StickyPart, firePart, CFrame.new(0, -1, 0.075) * CFrame.Angles(0,math.rad(90),math.rad(90)))
		end
		end)
	else
		antikick = false
		DestroyT(toysFolder:FindFirstChild("NinjaKunai"))
	end
	end,
})

DF:AddDropdown("Anti Input Lag Item", {
	Values = { "FoodSodaCan", "FoodHamburger", "CupMugWhite", "FoodBanana", "FoodCoconut", "PoopPileSparkle", "CupMugBrown", "FoodBread", "FoodBroccoli", "FoodDippyEgg", "FoodDonut", "FoodHotdog", "FoodMayonnaise", "FoodMeatStick", "FoodMushroomPoison", "FoodPizzaCheese", "PoopPile", "FoodPizzaPepperoni", "FoodFrenchFries", "FoodCakePink", "InstrumentBrassBugle", "InstrumentBrassTrumpet", "InstrumentBrassVuvuzela", "InstrumentDrumBongos", "InstrumentDrumSnare", "InstrumentGuitarAcoustic", "InstrumentGuitarBanjo", "InstrumentGuitarLyre", "InstrumentGuitarUkulele", "InstrumentGuitarViolin", "InstrumentPianoKeyboard", "InstrumentPianoMelodica", "InstrumentVoiceMicrophone", "InstrumentWoodwindOcarina", "InstrumentWoodwindSaxophone" },
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
		end
	end

	if Value then

		spawnItem(Item, spaw.Position + Vector3.new(0, 100, 0))

		antiinput = RunService.Heartbeat:Connect(function()
		checkantiunput()
		local startWait = tick()
        repeat 
        RunService.Heartbeat:Wait()
		toy = toysFolder:FindFirstChild(Item)
        until toy or tick() - startWait > 1 or Value == false

		local holdPart = toy:FindFirstChild("HoldPart")

		task.wait()
		holdPart.HoldItemRemoteFunction:InvokeServer(toy, char)
		task.wait()
		holdPart.DropItemRemoteFunction:InvokeServer(toy, spaw.CFrame * CFrame.new(0, 500000, 0), Vector3.new(0, 0, 0))
		toy.SoundPart.CanCollide = false
		end)
	else
    	antiinput:Disconnect()
		antiinput = nil
		DestroyT(toy)
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

	TR:AddToggle("LoopGrab", {
	Text = "Loop Grab",
	Default = false,
	Callback = function(Value)
	local tar = selectedTarget
	local pos = char.HumanoidRootPart.CFrame
	if Value then
	Lgrab = true
	char.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
	task.wait(0.25)
	SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	local bop = Instance.new("BodyPosition")
	bop.Position = char.HumanoidRootPart.Position + Vector3.new(0, 20, 0)
	bop.Parent = tar.Character.HumanoidRootPart
	--task.wait()
	--char.HumanoidRootPart.CFrame = pos
	--task.wait(0.03)
	--tar.Character.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
	task.spawn(function()
	while Lgrab do
	task.wait()
    SetNetworkOwner:FireServer(tar.Character.HumanoidRootPart, tar.Character.HumanoidRootPart.CFrame)
	task.wait()
	--tar.Character.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
	GrabEvents.CreateGrabLine:FireServer(tar.Character.HumanoidRootPart, Vector3.zero, tar.Character.HumanoidRootPart.Position, false)   
	GrabEvents.DestroyGrabLine:FireServer(tar.Character.HumanoidRootPart)
	--GrabEvents.CreateGrabLine:FireServer(tar.Character.HumanoidRootPart, Vector3.zero, tar.Character.HumanoidRootPart.Position, false)
	end
	end)
	else
	char.HumanoidRootPart.Anchored = false
	Lgrab = false
	tar.Character.HumanoidRootPart.BodyPosition:Destroy()
	end
	end,
})

	TR:AddToggle("Ragdoll", {
	Text = "Ragdoll",
	Default = false,
	Callback = function(Value)
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local tar = selectedTarget

	if Value then
	ragdo = true

	spawnItem("PalletLightBrown", hrp.Position + Vector3.new(0, 7.5, 20))

	local startWait = tick()
    repeat 
    RunService.Heartbeat:Wait()
	pallet = toysFolder:FindFirstChild("PalletLightBrown")
    until pallet or tick() - startWait > 1

	task.wait(0.25)
	SetNetworkOwner:FireServer(pallet.SoundPart, pallet.SoundPart.CFrame)
	pallet.SoundPart.CanCollide = false
	local bodypos = Instance.new("BodyPosition")
	bodypos.MaxForce = Vector3.new(10e+37, 10e+37, 10e+37)
	bodypos.Position = Vector3.new(0, 1000000, 0)
	bodypos.Parent = toysFolder:FindFirstChild("PalletLightBrown").SoundPart

	task.spawn(function()
	while ragdo do
		task.wait(0.1)
		pallet.SoundPart.CFrame = tar.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 0) * CFrame.Angles(0, math.rad(90), 0)
		task.wait(0.05)
		pallet.SoundPart.CFrame = CFrame.new(0, 1000000, 0)
		pallet.SoundPart.CanCollide = false
	end
	end)

	else
		ragdo = false
		DestroyT(pallet)
	  end
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
Toggles.AntiInputLag:SetValue(false)
Toggles.AntiGrab:SetValue(false)
Toggles.AntiVoid:SetValue(false)
Toggles.AntiKick:SetValue(false)
Toggles.LoopTp:SetValue(false)
Toggles.Trd:SetValue(false)
Toggles.PLCD:SetValue(false)
Toggles.Strong:SetValue(false)
Toggles.DisableBarrierCollisions:SetValue(false)
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
