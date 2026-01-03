local SelectedPlayer = nil
local P = game:GetService("Players")
local LocalPlayer = P.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local CharacterEvents = ReplicatedStorage:WaitForChild("CharacterEvents")
local Struggle = CharacterEvents:WaitForChild("Struggle")
local GrabEvents = ReplicatedStorage:WaitForChild("GrabEvents")
local SetNetworkOwner = GrabEvents:WaitForChild("SetNetworkOwner")
local toysFolder = workspace:FindFirstChild(LocalPlayer.Name.."SpawnedInToys")
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

local function holdItem(itemName)
    task.spawn(function()
        ReplicatedStorage.HoldEvents.Hold:InvokeServer(itemName)
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
	Icon = 10723396107,
	NotifySide = "Right",
	ShowCustomCursor = true,
})

local Tabs = {
	Main = Window:AddTab("Main", "user"),
	["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

local LP = Tabs.Main:AddLeftGroupbox("LocalPlayer")
local GB = Tabs.Main:AddRightGroupbox("GrabLine")
local DF = Tabs.Main:AddLeftGroupbox("Defense")

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

LP:AddToggle("3rd", {
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

LP:AddLabel("Keybind"):AddKeyPicker("KeyPicker", {
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

DF:AddToggle("Anti Grab", {
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

DF:AddToggle("Loop Tp", {
	Text = "Loop TP",
	Default = false,
	Callback = function(Value)
	LoopTP = Value
        if Value then
            task.spawn(function()
                while LoopTP do
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(569.652527, 13.6484346, -394.444519, -0.953733981, -3.01659959e-08, -0.300651759, -5.31917044e-09, 1, -8.34617495e-08, 0.300651759, -7.80010865e-08, -0.953733981)
                    task.wait(0.02)
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(79.1195755, 303.694733, 365.037109, 0.300712913, 9.96221416e-08, -0.953714728, -1.43715875e-08, 1, 9.99255008e-08, 0.953714728, -1.63424936e-08, 0.300712913)
                    task.wait(0.02)
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(42.507618, -6.35040426, -631.584534, -0.976292491, -4.06780316e-08, -0.2164554, -1.58035363e-08, 1, -1.16648309e-07, 0.2164554, -1.10462111e-07, -0.976292491)
                    task.wait(0.02)
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-556.111572, -7.35040474, 651.426941, -0.766063511, -1.1517696e-07, 0.642764866, -4.87707155e-08, 1, 1.21063692e-07, -0.642764866, 6.13943811e-08, -0.766063511)
                    task.wait(0.02)
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-406.163055, -6.35040474, -518.774292, -0.963627636, 2.03066879e-08, -0.267248422, -1.42729943e-08, 1, 1.27448985e-07, 0.267248422, 1.26627796e-07, -0.963627636)
                    task.wait(0.02)
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(602.923462, 26.6475773, 133.185562, 0.325559855, 5.51754091e-08, 0.945521414, 2.13931295e-09, 1, -5.90910822e-08, -0.945521414, 2.12604512e-08, 0.325559855)
                    task.wait(0.02)
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-555.959473, -6.35040426, 651.610535, -0.731328487, -7.58439569e-08, 0.682025373, -6.26779766e-08, 1, 4.39950867e-08, -0.682025373, -1.05731077e-08, -0.731328487)
                    task.wait(0.02)
				end
			end)
		else
		task.wait(0.3)
		LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0)
        end
		
	end,
})

DF:AddToggle("Anti Kick", {
	Text = "Anti Kick",
	Default = false,
	Callback = function(Value)
	local function ClearKunai()
				if toysFolder then
					for _, v in pairs(toysFolder:GetChildren()) do
						if v.Name == "AntiKick" or v.Name == "NinjaShuriken" then
							pcall(function() DestroyT:FireServer(v) end)
						end
					end
				end
			end
	end,
})

DF:AddToggle("Anti Input Lag", {
	Text = "Anti Input Lag",
	Default = false,
	Callback = function(Value)
	if Value then
        _G.AntiInputLag = true

        task.spawn(function()
          local char = LocalPlayer.Character
          local hrp = char and char:FindFirstChild("HumanoidRootPart")
          if not hrp then return end

          local ToyName = "FoodSodaCan"
          local RS = game:GetService("ReplicatedStorage")
          local Workspace = game:GetService("Workspace")
          local SpawnRemote = RS.MenuToys.SpawnToyRemoteFunction

          while _G.AntiInputLag do
            local toysFolder = Workspace:FindFirstChild(LocalPlayer.Name.."SpawnedInToys")
            local burger = toysFolder and toysFolder:FindFirstChild(ToyName)

            if not burger then
              task.spawn(function()
                pcall(function()
                  local spawnCF = hrp.CFrame * CFrame.new(0, 5, 0)
                  SpawnRemote:InvokeServer(ToyName, spawnCF, Vector3.new(0,0,0))
                end)
              end)
              
              local startWait = tick()
              repeat 
                game:GetService("RunService").Heartbeat:Wait()
                toysFolder = Workspace:FindFirstChild(LocalPlayer.Name.."SpawnedInToys")
                burger = toysFolder and toysFolder:FindFirstChild(ToyName)
              until burger or tick() - startWait > 1 or not _G.AntiInputLag
            end

            if burger and burger.Parent then
              local holdPart = burger:FindFirstChild("HoldPart")
              
              if holdPart then
                local holdingPlayer = holdPart:FindFirstChild("HoldingPlayer") and holdPart.HoldingPlayer.Value

                if holdingPlayer and holdingPlayer ~= LocalPlayer then
                  pcall(function()
                    holdPart.DropItemRemoteFunction:InvokeServer(
                      burger,
                      hrp.CFrame * CFrame.new(0, 2000, 0),
                      Vector3.new(0,0,0)
                    )
                  end)
                  burger:Destroy()
                else
                  pcall(function()
                    holdPart.HoldItemRemoteFunction:InvokeServer(burger, char)
                  end)
                  task.wait()
                  
                  pcall(function()
                    holdPart.DropItemRemoteFunction:InvokeServer(
                      burger,
                      hrp.CFrame * CFrame.new(0, 2000, 0),
                      Vector3.new(0,0,0)
                    )
                  end)
                  task.wait()
                end
              end
            end
          end
        end)
      else
        _G.AntiInputLag = false
      end
    end,
})


-- UI Settings
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")

MenuGroup:AddLabel("Menu bind")
	:AddKeyPicker("MenuKeybind", { Default = "Q", NoUI = true, Text = "Menu keybind" })

MenuGroup:AddButton("Unload", function()
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