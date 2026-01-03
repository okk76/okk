	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local CoreGui = game:GetService("CoreGui")

	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()

	local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
	local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
	local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
	local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

	local Options = Library.Options
	local Toggles = Library.Toggles

	Library.ForceCheckbox = false

	local Window = Library:CreateWindow({
		Title = "КРЯК КОТАКБАСИКА!!",
		Footer = "ЭТО РЕАЛЬНО ОН!",
		NotifySide = "Right",
		ShowCustomCursor = false,
	})

	local Tabs = {
		Defense = Window:AddTab("Script", "user"),
		["UI Settings"] = Window:AddTab("UI Settings", "settings")
	}

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local StarterGui = game:GetService("StarterGui")
	local PS = game:GetService("Players")
	local RS = game:GetService("ReplicatedStorage")
	local R = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	local Workspace = workspace
	local Player = PS.LocalPlayer
	local Camera = Workspace.CurrentCamera
	local CE = RS:WaitForChild("CharacterEvents", 10)
	local BeingHeld = Player:WaitForChild("IsHeld", 10)
	local StruggleEvent = CE and CE:WaitForChild("Struggle")

	local function notify(title, content, duration)
		Library:Notify({
			Title = title or "Notification",
			Description = content or "",
			Time = duration or 5,
		})
	end

	local paintPartsBackup = {}
	local paintConnections = {}
	local function deleteAllPaintParts()
		for _, obj in ipairs(Workspace:GetDescendants()) do
			if obj:IsA("BasePart") and obj.Name == "PaintPlayerPart" then
				local clone = obj:Clone()
				clone.Archivable = true
				paintPartsBackup[obj:GetDebugId()] = { clone = clone, parent = obj.Parent }
				obj:Destroy()
			end
		end
	end
	local function restorePaintParts()
		for _, data in pairs(paintPartsBackup) do
			if data.clone and data.parent then data.clone.Parent = data.parent end
		end
		paintPartsBackup = {}
	end
	local function watchNewPaintParts()
		table.insert(paintConnections, Workspace.DescendantAdded:Connect(function(obj)
			if obj:IsA("BasePart") and obj.Name == "PaintPlayerPart" then
				task.defer(function()
					if obj and obj.Parent then
						local clone = obj:Clone()
						clone.Archivable = true
						paintPartsBackup[obj:GetDebugId()] = { clone = clone, parent = obj.Parent }
						obj:Destroy()
					end
				end)
			end
		end))
	end
	local function disconnectWatchers()
		for _, conn in ipairs(paintConnections) do if conn.Connected then conn:Disconnect() end end
		paintConnections = {}
	end
	local function setTouchQuery(state)
		local char = Workspace:FindFirstChild(Player.Name)
		if not char then return end
		for _, v in ipairs(char:GetChildren()) do
			if v:IsA("Part") or v:IsA("BasePart") then v.CanTouch = state v.CanQuery = state end
		end
	end

	local antiGucciConnection
	local safePosition
	local restoreFrames = 0
	local function spawnBlobman()
		local args = {[1] = "CreatureBlobman", [2] = CFrame.new(0, 5000000, 0), [3] = Vector3.new(0, 60, 0)}
		pcall(function() ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(unpack(args)) end)
		local folder = Workspace:WaitForChild(Player.Name.."SpawnedInToys", 5)
		if folder and folder:FindFirstChild("CreatureBlobman") then
			local blob = folder.CreatureBlobman
			if blob:FindFirstChild("Head") then blob.Head.CFrame = CFrame.new(0, 50000, 0) blob.Head.Anchored = true end
			notify("Success", "Blobman Spawned!", 3)
		end
	end
	local function startAntiGucci()
		local character = Player.Character or Player.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")
		local rootPart = character:WaitForChild("HumanoidRootPart")
		safePosition = rootPart.Position
		local folder = Workspace:FindFirstChild(Player.Name.."SpawnedInToys")
		local blob = folder and folder:FindFirstChild("CreatureBlobman")
		local seat = blob and blob:FindFirstChild("VehicleSeat")
		if not blob then spawnBlobman() task.wait(1) folder = Workspace:FindFirstChild(Player.Name.."SpawnedInToys") blob = folder and folder:FindFirstChild("CreatureBlobman") seat = blob and blob:FindFirstChild("VehicleSeat") end
		if seat and seat:IsA("VehicleSeat") then rootPart.CFrame = seat.CFrame + Vector3.new(0, 2, 0) seat:Sit(humanoid) end
		humanoid:GetPropertyChangedSignal("Jump"):Connect(function() if humanoid.Jump and humanoid.Sit then restoreFrames = 15 safePosition = rootPart.Position end end)
		if antiGucciConnection then antiGucciConnection:Disconnect() end
		antiGucciConnection = R.Heartbeat:Connect(function()
			if not rootPart or not humanoid then return end
			ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(rootPart, 0)
			if restoreFrames > 0 then rootPart.CFrame = CFrame.new(safePosition) restoreFrames = restoreFrames - 1 end
		end)
		task.spawn(function() while humanoid.Sit do task.wait(1) end task.wait(0.5) rootPart.CFrame = CFrame.new(safePosition) end)
	end
	local function stopAntiGucci()
		if antiGucciConnection then antiGucciConnection:Disconnect() antiGucciConnection = nil end
		local blobFolder = Workspace:FindFirstChild(Player.Name.."SpawnedInToys")
		if blobFolder and blobFolder:FindFirstChild("CreatureBlobman") then blobFolder.CreatureBlobman:Destroy() end
	end

	local antiGucciConnectionTrain
	local safePositionTrain
	local restoreFramesTrain = 0
	local function startAntiGucciTrain()
		local character = Player.Character or Player.CharacterAdded:Wait()
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

		if seat then rootPart.CFrame = seat.CFrame + Vector3.new(0, 2, 0) seat:Sit(humanoid) end
		humanoid:GetPropertyChangedSignal("Jump"):Connect(function() if humanoid.Jump and humanoid.Sit then restoreFramesTrain = 15 safePositionTrain = rootPart.Position end end)
		if antiGucciConnectionTrain then antiGucciConnectionTrain:Disconnect() end
		antiGucciConnectionTrain = R.Heartbeat:Connect(function()
			if not rootPart or not humanoid then return end
			ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(rootPart, 0)
			if restoreFramesTrain > 0 then rootPart.CFrame = CFrame.new(safePositionTrain) restoreFramesTrain = restoreFramesTrain - 1 end
		end)
		task.spawn(function() while humanoid.Sit do task.wait(1) end task.wait(0.5) rootPart.CFrame = CFrame.new(safePositionTrain) end)
	end
	local function stopAntiGucciTrain()
		if antiGucciConnectionTrain then antiGucciConnectionTrain:Disconnect() antiGucciConnectionTrain = nil end
		local trainFolder = workspace.Map.AlwaysHereTweenedObjects
		if trainFolder and trainFolder:FindFirstChild("Train") then ResetPlayer(game.Players.LocalPlayer) end
end

	local DefenseGroup = Tabs.Defense:AddLeftGroupbox("Defense")

	local antiGrabExplosionConn, antiGrabHeldConn, antiGrabStruggleConn, antiGrabHumConn, antiGrabAnchorConn
	local antiGrabRootCF, antiGrabRootPos, antiGrabHardFreeze = nil, nil, false

	local function antiGrabUnfreeze(char)
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if hrp then
		hrp.Anchored = false
		if hrp:FindFirstChild("FreezeJoint") then
			hrp.FreezeJoint:Destroy()
		end
	end
	antiGrabHardFreeze = false
	if antiGrabAnchorConn then
		antiGrabAnchorConn:Disconnect()
		antiGrabAnchorConn = nil
	end
	end

	local function antiGrabFreezeInPlace(char)
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	antiGrabRootCF = hrp.CFrame
	antiGrabRootPos = hrp.Position
	antiGrabHardFreeze = true
	if not hrp:FindFirstChild("FreezeJoint") then
		local align = Instance.new("AlignPosition")
		align.Name = "FreezeJoint"
		align.Mode = Enum.PositionAlignmentMode.OneAttachment
		align.MaxForce = 1e6
		align.MaxVelocity = 0
		align.Responsiveness = 200
		local att = Instance.new("Attachment", hrp)
		align.Attachment0 = att
		align.Position = antiGrabRootPos
		align.Parent = hrp
	end
	antiGrabAnchorConn = R.Heartbeat:Connect(function()
		if antiGrabHardFreeze and hrp then
			hrp.AssemblyLinearVelocity = Vector3.zero
			hrp.AssemblyAngularVelocity = Vector3.zero
			hrp.CFrame = antiGrabRootCF
		end
	end)
	end

	local function antiGrabReconnect()
	local char = Player.Character or Player.CharacterAdded:Wait()
	local hum = char:WaitForChild("Humanoid")
	local hrp = char:WaitForChild("HumanoidRootPart")
	local fp = hrp:FindFirstChild("FirePlayerPart")
	if fp then fp:Destroy() end
	if antiGrabHumConn then antiGrabHumConn:Disconnect() end
	antiGrabHumConn = hum.Changed:Connect(function(p)
		if p == "Sit" and hum.Sit then
			if not (hum.SeatPart and tostring(hum.SeatPart.Parent) == "CreatureBlobman") then
				hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
				hum.Sit = false
			end
		end
	end)
	end

	local autoStruggleConn = nil

	DefenseGroup:AddToggle("AntiGrabObsidian", {
		Text = "Anti Grab",
		Default = false,
		Callback = function(Value)
			local RunService = game:GetService("RunService")
			local ReplicatedStorage = game:GetService("ReplicatedStorage")
			local localPlayer = game:GetService("Players").LocalPlayer
			

			local Struggle = ReplicatedStorage:FindFirstChild("CharacterEvents") and ReplicatedStorage.CharacterEvents:FindFirstChild("Struggle")

			if Value then

				if autoStruggleConn then autoStruggleConn:Disconnect() end
				
				autoStruggleConn = RunService.Heartbeat:Connect(function()
					local character = localPlayer.Character
					if character and character:FindFirstChild("Head") then
						local head = character.Head
						

						if head:FindFirstChild("PartOwner") then
							
						
							task.spawn(function()
								
								if Struggle then Struggle:FireServer(localPlayer) end
								

								pcall(function()
									ReplicatedStorage.GameCorrectionEvents.StopAllVelocity:FireServer()
								end)
								

								for _, part in pairs(character:GetChildren()) do
									if part:IsA("BasePart") then
										part.Anchored = true
									end
								end
								
								
								local isHeld = localPlayer:FindFirstChild("IsHeld")
								while isHeld and isHeld.Value do
									task.wait()
								end
								

								for _, part in pairs(character:GetChildren()) do
									if part:IsA("BasePart") then
										part.Anchored = false
									end
								end
							end)
						end
					end
				end)
			else

				if autoStruggleConn then 
					autoStruggleConn:Disconnect() 
					autoStruggleConn = nil 
				end
				

				local char = localPlayer.Character
				if char then
					for _, part in pairs(char:GetChildren()) do
						if part:IsA("BasePart") then
							part.Anchored = false
						end
					end
				end
			end
		end
	})

	local antiBlob1T=false
	local function antiBlob1F()
		antiBlob1T=true
		workspace.DescendantAdded:Connect(function(toy)
			if toy.Name=="CreatureBlobman" and antiBlob1T then
				toy.LeftDetector:Destroy()
				toy.RightDetector:Destroy()
			end
		end)
	end
	DefenseGroup:AddToggle("AntiBlobmanToggle", {
	Text="Anti Blobman", 
	Default=false,
	Callback=function(on)
		if on then antiBlob1F() else antiBlob1T=false end
	end
	})

	local antiExplodeT=false
	local function antiExplodeF()
		antiExplodeT=true
		local char=Player.Character
		if not char then return end
		local hrp=char:WaitForChild("HumanoidRootPart")
		workspace.ChildAdded:Connect(function(model)
			if model.Name=="Part" and antiExplodeT then
				local mag=(model.Position-hrp.Position).Magnitude
				if mag<=20 then
					hrp.Anchored=true
					wait(0.01)
					while char["Right Arm"].RagdollLimbPart.CanCollide do wait(0.001) end
					hrp.Anchored=false
				end
			end
		end)
	end
	DefenseGroup:AddToggle("AntiExplosionToggle", {
	Text="Anti Explosion", 
	Default=false,
	Callback=function(on)
		if on then antiExplodeF() else antiExplodeT=false end
	end
	})

	local hookBurnConn
	local function hookBurn(char)
		local hum = char:WaitForChild("Humanoid")
		local hrp = char:WaitForChild("HumanoidRootPart")
		char.PrimaryPart = hrp
		if hookBurnConn then hookBurnConn:Disconnect() end
		hookBurnConn = hum.FireDebounce.Changed:Connect(function(isBurning)
			if isBurning then
				local me = char
				local oldCF = hrp.CFrame
				local plots = workspace:FindFirstChild("Plots")
				if plots and plots:FindFirstChild("Plot2") then
					local plot2 = plots.Plot2
					local barrier = plot2:FindFirstChild("Barrier")
					local pb = barrier and barrier:FindFirstChild("PlotBarrier")
					if pb and pb:IsA("BasePart") then
						local safeCF = pb.CFrame * CFrame.new(0, 6, 0)
						me:SetPrimaryPartCFrame(safeCF)
						task.wait(0.3)
						local firePart = me:FindFirstChild("FirePlayerPart", true)
						if firePart then
							for _, obj in ipairs(firePart:GetChildren()) do
								if obj:IsA("Sound") then obj:Stop() end
								if obj:IsA("Light") or obj:IsA("ParticleEmitter") then obj.Enabled = false end
							end
							if firePart:FindFirstChild("CanBurn") then firePart.CanBurn.Value = false end
							if hum:FindFirstChild("FireDebounce") then hum.FireDebounce.Value = false end
						end
						task.wait(0.6)
						if me and me.PrimaryPart then me:SetPrimaryPartCFrame(oldCF) end
					end
				end
			end
		end)
	end
	DefenseGroup:AddToggle("AntiBurnToggle", {
		Text = "Anti Burn",
		Default = false,
		Callback = function(on)
			if on then hookBurn(Player.Character) elseif hookBurnConn then hookBurnConn:Disconnect() end
		end
	})

	local antiVoidConn
	local VOID_THRESHOLD = -50
	local SAFE_HEIGHT = 100
	DefenseGroup:AddToggle("AntiVoidToggle", {
	Text = "Anti Void",
	Default = false,
	Callback = function(on)
		if on then
			if antiVoidConn then antiVoidConn:Disconnect() end
			antiVoidConn = R.Heartbeat:Connect(function()
				local char = Player.Character
				if char and char.PrimaryPart then
				local pos = char.PrimaryPart.Position
				if pos.Y < VOID_THRESHOLD then
					local safePos = Vector3.new(pos.X, pos.Y + SAFE_HEIGHT, pos.Z)
					char:SetPrimaryPartCFrame(CFrame.new(safePos))
					char.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
				end
				end
			end)
		else
			if antiVoidConn then antiVoidConn:Disconnect() antiVoidConn = nil end
		end
	end
	})

	local createGrabLineCopy, extendGrabLineCopy
	local grabFolder = ReplicatedStorage:FindFirstChild("GrabEvents")
	if grabFolder then
		local originalCreate = grabFolder:FindFirstChild("CreateGrabLine")
		local originalExtend = grabFolder:FindFirstChild("ExtendGrabLine")
		if originalCreate then createGrabLineCopy = originalCreate:Clone() end
		if originalExtend then extendGrabLineCopy = originalExtend:Clone() end
	end
	DefenseGroup:AddToggle("AntiLagToggle", {
	Text = "Anti Lag",
	Default = false,
	Callback = function(Value)
		if Value then
			local grabFolder = ReplicatedStorage:FindFirstChild("GrabEvents")
			if grabFolder then
				local create = grabFolder:FindFirstChild("CreateGrabLine")
				local extend = grabFolder:FindFirstChild("ExtendGrabLine")
				if create and create:IsA("RemoteEvent") then create:Destroy() end
				if extend and extend:IsA("RemoteEvent") then extend:Destroy() end
			end
			for _, v in ipairs(workspace:GetDescendants()) do
				if v:IsA("Beam") or v.Name:lower():find("line") then v:Destroy() end
			end
		else
			local grabFolder = ReplicatedStorage:FindFirstChild("GrabEvents")
			if grabFolder then
				if createGrabLineCopy and not grabFolder:FindFirstChild("CreateGrabLine") then
				local restoredCreate = createGrabLineCopy:Clone()
				restoredCreate.Parent = grabFolder
				end
				if extendGrabLineCopy and not grabFolder:FindFirstChild("ExtendGrabLine") then
				local restoredExtend = extendGrabLineCopy:Clone()
				restoredExtend.Parent = grabFolder
				end
			end
		end
	end,
	})

	DefenseGroup:AddToggle("PaintDeleteToggle", {
		Text = "Anti Paint",
		Default = false,
		Callback = function(state)
			if state then deleteAllPaintParts() watchNewPaintParts() setTouchQuery(false)
			else restorePaintParts() disconnectWatchers() setTouchQuery(true) end
		end
	})

	local autoGucciActive =  false

	DefenseGroup:AddToggle("AutoGucciToggle", {
		Text = "Anti Gucci (Blobman)",
		Default = false,
		Callback = function(Value)
			autoGucciActive = Value

			if Value then
				startAntiGucci()
				notify("system", "auto gucci active (monitoring)", 3)

				task.spawn(function()
					while autoGucciActive do
						local toysFolder = Workspace:FindFirstChild(Player.Name .. "SpawnedInToys")
						local blobExists = toysFolder and toysFolder:FindFirstChild("CreatureBlobman")

						if not blobExists then
							stopAntiGucci() 
							spawnBlobman() 
							notify("System", "blobman lost", 3)

							local retries = 0
							repeat
								task.wait(0.2)
								retries = retries + 1
								toysFolder = Workspace:FindFirstChild(Player.Name .. "SpawnedInToys")
							until (toysFolder and toysFolder:FindFirstChild("CreatureBlobman")) or retries > 25 or not autoGucciActive

							if autoGucciActive and toysFolder and toysFolder:FindFirstChild("CreatureBlobman") then
								startAntiGucci()
								notify("System", "blobman restored.", 3)
							end
						end
						task.wait(0.5) 
					end
				end)
			else
				autoGucciActive = false
				stopAntiGucci()
				notify("System", "auto gucci disabled.", 3)
			end
		end
	})

	local autoGucciActiveTrain =  false

	DefenseGroup:AddToggle("AutoGucciToggle", {
		Text = "Anti Gucci (Train)",
		Default = false,
		Callback = function(Value)
			autoGucciActiveTrain = Value

			if Value then
				startAntiGucciTrain()
				notify("system", "Gucci active (monitoring)", 3)

				task.spawn(function()
					while autoGucciActiveTrain do
						local trainFolder = workspace.Map.AlwaysHereTweenedObjects
						local trainExists = trainFolder and trainFolder:FindFirstChild("Train")

						if not trainExists then
							stopAntiGucciTrain() 
							notify("System", "Train lost", 3)

							local retries = 0
							repeat
								task.wait(0.2)
								retries = retries + 1
								trainFolder = workspace.Map.AlwaysHereTweenedObjects
							until (trainFolder and trainFolder:FindFirstChild("Train")) or retries > 25 or not autoGucciActiveTrain

							if autoGucciActiveTrain and trainFolder and trainFolder:FindFirstChild("Train") then
								startAntiGucciTrain()
								notify("System", "Train restored.", 3)
							end
						end
						task.wait(0.5) 
					end
				end)
			else
				autoGucciActiveTrain = false
				stopAntiGucciTrain()
				notify("System", "Gucci disabled.", 3)
			end
		end
	})


	DefenseGroup:AddToggle("AntiInputLag", {
		Text = "Anti Input Lag",
		Default = false,
		Callback = function(Value)
			if Value then
				_G.AntiInputLag = true

				task.spawn(function()
					local plr = game.Players.LocalPlayer
					local char = plr.Character
					local hrp = char and char:FindFirstChild("HumanoidRootPart")
					if not hrp then return end

					local ToyName = "FoodHamburger"
					local RS = game:GetService("ReplicatedStorage")
					local Workspace = game:GetService("Workspace")
					local SpawnRemote = RS.MenuToys.SpawnToyRemoteFunction

					while _G.AntiInputLag do
						local toysFolder = Workspace:FindFirstChild(plr.Name.."SpawnedInToys")
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
								toysFolder = Workspace:FindFirstChild(plr.Name.."SpawnedInToys")
								burger = toysFolder and toysFolder:FindFirstChild(ToyName)
							until burger or tick() - startWait > 1 or not _G.AntiInputLag
						end

						if burger and burger.Parent then
							local holdPart = burger:FindFirstChild("HoldPart")
							
							if holdPart then
								local holdingPlayer = holdPart:FindFirstChild("HoldingPlayer") and holdPart.HoldingPlayer.Value

								if holdingPlayer and holdingPlayer ~= plr then
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
		end
	})

	local tpActive = false
	DefenseGroup:AddToggle("ShurikenAntiKick", {
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
							stickyEvent:FireServer(
								kunai.StickyPart,
								firePart,
								CFrame.new(0,0,0) * CFrame.Angles(0,math.rad(90),math.rad(90))
							)
						end
						
						for _, obj in pairs(kunai:GetChildren()) do
							if obj.Name == "Pyramid" then
								obj.CanTouch = false; obj.CanCollide = false; obj.CanQuery = false; obj.Transparency = 0
								if not obj:FindFirstChild("Highlight") then
									local high = Instance.new("Highlight", obj)
									high.FillColor = Color3.fromRGB(0, 0, 0)
								end
							elseif obj.Name == "Main" then
								obj.CanTouch = false; obj.CanCollide = false; obj.CanQuery = false; obj.Transparency = 0
								if not obj:FindFirstChild("Highlight") then
									local high = Instance.new("Highlight", obj)
									high.FillColor = Color3.fromRGB(255, 255, 255)
								end
							elseif obj:IsA("BasePart") then
								obj.CanTouch = false; obj.CanCollide = false; obj.CanQuery = false; obj.Transparency = 1
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
		end
	})

	DefenseGroup:AddToggle("LoopTP", {
		Text = "Loop TP",
		Default = false,
		Callback = function(Value)
			tpActive = Value
			local char = Player.Character or Player.CharacterAdded:Wait()
			local hrp = char:WaitForChild("HumanoidRootPart")
			local hum = char:FindFirstChildOfClass("Humanoid")
			if Value then
				if hum then hum.PlatformStand = true end
				task.spawn(function()
					while tpActive and hrp do
						local x = math.random(-500, 500)
						local y = math.random(30, 480)
						local z = math.random(-500, 500)
						hrp.CFrame = CFrame.new(x, y, z)
						task.wait(0.03)
					end
				end)
			else
				if hum then hum.PlatformStand = false end
			end
		end,
	})

	local TargetGroup = Tabs.Defense:AddRightGroupbox("Target Interaction")

	local selectedKickPlayer = nil
	local kickLoopEnabled = false
	local kickLoopConnection = nil
	local savedKickPos = nil
	local currentKickTargetChar = nil 

	local function getPlayerList()
		local list = {}
		for _, plr in ipairs(PS:GetPlayers()) do
			if plr ~= Player then
				table.insert(list, plr.DisplayName .. " (" .. plr.Name .. ")")
			end
		end
		return list
	end

	local function getPlayerFromSelection(selection)
		if not selection then return nil end
		local username = selection:match("%((.-)%)")
		if username then
			return PS:FindFirstChild(username)
		end
		return nil
	end

	TargetGroup:AddDropdown("KickPlayerDropdown", {
		Values = getPlayerList(),
		Default = 1,
		Multi = false,
		Text = "select player for kick",
		Callback = function(Value)
			selectedKickPlayer = getPlayerFromSelection(Value)
		end,
	})

	TargetGroup:AddButton({
		Text = "refresh player list",
		Func = function()
			Options.KickPlayerDropdown:SetValues(getPlayerList())
			Options.KickPlayerDropdown:SetValue(nil)
			selectedKickPlayer = nil
		end
	})


	TargetGroup:AddToggle("LoopKickToggle", {
		Text = "Kick (spam grab)",
		Default = false,
		Callback = function(on)
			kickLoopEnabled = on
			
			local target = selectedKickPlayer
			if on and not target then
			if Toggles.LoopKickToggle then Toggles.LoopKickToggle:SetValue(false) end
			return
			end
			
			if not on then    
			        kickLoopEnabled = false    
			        return    
			    end    
			
			    task.spawn(function()    
			        local RS = game:GetService("ReplicatedStorage")    
			        local RunService = game:GetService("RunService")    
			        local GE = RS:WaitForChild("GrabEvents")    
			        local myChar = Player.Character    
			        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")    
			        if not myRoot then return end    
			            
			        local savedPos = myRoot.CFrame    
			        local dragging = false    
			        local grabStartTime = 0    
			            
			        while kickLoopEnabled do    
			            if not target or not target.Parent then    
			                kickLoopEnabled = false    
			                if Toggles.LoopKickToggle then Toggles.LoopKickToggle:SetValue(false) end    
			                break    
			            end    
			
			            local tChar = target.Character    
			            local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")    
			            local tHum = tChar and tChar:FindFirstChild("Humanoid")    
			                
			            myChar = Player.Character    
			            myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")    
			
			            if tRoot and tHum and tHum.Health > 0 and myRoot then    
			                    
			                tRoot.AssemblyLinearVelocity = Vector3.zero    
			                tRoot.AssemblyAngularVelocity = Vector3.zero    
			                tRoot.Velocity = Vector3.zero    
			                    
			                if not dragging then    
			                    myRoot.CFrame = tRoot.CFrame    
			                    myRoot.Velocity = Vector3.zero    
			                        
			                    pcall(function()    
			                        tHum.PlatformStand = true    
			                        tHum.Sit = true    
			                        GE.SetNetworkOwner:FireServer(tRoot, myRoot.CFrame)    
			                        GE.CreateGrabLine:FireServer(tRoot, Vector3.zero, tRoot.Position, false)    
			                    end)    
			                        
			                    if grabStartTime == 0 then grabStartTime = tick() end    
			                    if tick() - grabStartTime > 0.35 then    
			                        dragging = true    
			                        grabStartTime = 0    
			                    end    
			                else    
			                    myRoot.CFrame = savedPos    
			                    myRoot.Velocity = Vector3.zero    
			                        
			                    local lockPos = savedPos * CFrame.new(0, 17, 0)    
			                        
			                    tRoot.CFrame = lockPos    
			                    tRoot.Velocity = Vector3.zero    
			                    tRoot.RotVelocity = Vector3.zero    
			                        
			                    tHum.PlatformStand = true    
			                    tHum.Sit = false    
			                        
			                    pcall(function()    
			                        GE.SetNetworkOwner:FireServer(tRoot, lockPos)    
			                        GE.CreateGrabLine:FireServer(tRoot, Vector3.zero, tRoot.Position, false)    
			                        GE.DestroyGrabLine:FireServer(tRoot)    
			                        GE.CreateGrabLine:FireServer(tRoot, Vector3.zero, tRoot.Position, false)    
			                    end)    
			                end    
			            else    
			                dragging = false    
			                grabStartTime = 0    
			                --if myRoot then    
			                    --myRoot.CFrame = savedPosmyRoot.Velocity = Vector3.zero    
			                --end    
			            end    
			                
			            RunService.Heartbeat:Wait()    
			        end    
			            
			        if myRoot then    
			            myRoot.CFrame = savedPos    
			            myRoot.Velocity = Vector3.zero    
			        end    
			    end)    
			end
			
	})

	TargetGroup:AddToggle("LoopKillToggle", {
		Text = "Loop kill",
		Default = false,
		Callback = function(on)
			loopKillEnabled = on
			if on then
				local target = selectedKickPlayer
				if not target then 
					notify("System", "Select target first", 3)
					Toggles.LoopKickToggle:SetValue(false)
					return 
				end

				task.spawn(function()
					local RS = game:GetService("ReplicatedStorage")
					local RunService = game:GetService("RunService")
					local GE = RS:WaitForChild("GrabEvents")
					
					while loopKillEnabled do
						if not target or not target.Parent or not target.Character then
							loopKillEnabled = false
							Toggles.LoopKillToggle:SetValue(false)
							break
						end

						local myChar = Player.Character
						local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
						
						local tChar = target.Character
						local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")
						local tHum = tChar and tChar:FindFirstChild("Humanoid")

						if tRoot and tHum and tHum.Health > 0 and myRoot then
							
							local currentPos = myRoot.CFrame

							local attackStart = tick()
							while tick() - attackStart < 0.35 do
								if not loopKillEnabled or not tRoot.Parent then break end
								
								myRoot.CFrame = tRoot.CFrame * CFrame.new(0, 0, 2)
								myRoot.Velocity = Vector3.zero
								
								pcall(function()
									GE.SetNetworkOwner:FireServer(tRoot, myRoot.CFrame)
									
									tHum:ChangeState(Enum.HumanoidStateType.Dead)
									tHum.Health = 0
									
									GE.CreateGrabLine:FireServer(tRoot, Vector3.zero, tRoot.Position, false)
									GE.DestroyGrabLine:FireServer(tRoot)
								end)
								
								RunService.Heartbeat:Wait()
							end
							
							if myRoot then
								myRoot.CFrame = currentPos
								myRoot.Velocity = Vector3.zero
							end
							
							task.wait(1.2) 
						else
							task.wait(0.5)
						end
					end
					
					local char = Player.Character
					local root = char and char:FindFirstChild("HumanoidRootPart")
					if root then root.Velocity = Vector3.zero end
				end)
			else
				loopKillEnabled = false
			end
		end
	})

TargetGroup:AddToggle("LoopKickToggle", {
    Text = "Loop Kick (grab + blob)",
    Default = false,
    Callback = function(on)
        kickLoopEnabled = on
        
        local target = selectedKickPlayer
        if on and not target then 
            if Toggles.LoopKickToggle then Toggles.LoopKickToggle:SetValue(false) end
            return 
        end

        local char = Player.Character
        local hum = char and char:FindFirstChild("Humanoid")
        local seat = hum and hum.SeatPart

        if on and (not seat or seat.Parent.Name ~= "CreatureBlobman") then
            if Toggles.LoopKickToggle then Toggles.LoopKickToggle:SetValue(false) end
            return
        end

        if not on then 
            kickLoopEnabled = false 
            return 
        end

        task.spawn(function()
            local RS = game:GetService("ReplicatedStorage")
            local GE = RS:WaitForChild("GrabEvents")
            local RunService = game:GetService("RunService")
            
            local blob = seat.Parent
            local blobRoot = blob:FindFirstChild("HumanoidRootPart") or blob.PrimaryPart
            local scriptObj = blob:FindFirstChild("BlobmanSeatAndOwnerScript")
            
            local CG = scriptObj and scriptObj:FindFirstChild("CreatureGrab")
            local CD = scriptObj and scriptObj:FindFirstChild("CreatureDrop")
            
            local R_Det = blob:FindFirstChild("RightDetector")
            local R_Weld = R_Det and (R_Det:FindFirstChild("RightWeld") or R_Det:FindFirstChildWhichIsA("Weld"))
            
            local SavedPos = blobRoot.CFrame 
            
            local tChar = target.Character
            local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")

            if tRoot and blobRoot then
                local bringStart = tick()
                while tick() - bringStart < 0.35 do
                    if not kickLoopEnabled then break end
                    
                    blobRoot.CFrame = tRoot.CFrame
                    blobRoot.Velocity = Vector3.zero
                    
                    pcall(function()
                        if CG and R_Det then CG:FireServer(R_Det, tRoot, R_Weld) end
                        GE.CreateGrabLine:FireServer(tRoot, Vector3.zero, tRoot.Position, false)
                        GE.SetNetworkOwner:FireServer(tRoot, blobRoot.CFrame)
                    end)
                    RunService.Heartbeat:Wait()
                end
                
                blobRoot.CFrame = SavedPos
                blobRoot.Velocity = Vector3.zero
                task.wait(0.05)
            end

            local packetTimer = 0
            
            while kickLoopEnabled do
                if not target or not target.Parent or not target.Character then
                    break
                end

                local tChar = target.Character
                local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")
                local tHum = tChar and tChar:FindFirstChild("Humanoid")

                if tRoot and tHum and tHum.Health > 0 and blobRoot then
                    
                    blobRoot.CFrame = SavedPos
                    blobRoot.Velocity = Vector3.zero
                    
                    local lockPos = SavedPos * CFrame.new(0, 23, 0)
                    
                    tRoot.CFrame = lockPos
                    tRoot.Velocity = Vector3.zero
                    tRoot.RotVelocity = Vector3.zero
                    
                    if tick() - packetTimer > 0.05 then
                        packetTimer = tick()
                        pcall(function()
                            tHum.PlatformStand = true
                            tHum.Sit = true
                            
                            GE.SetNetworkOwner:FireServer(tRoot, lockPos)
                            
                            if R_Det then
                                local weld = R_Det:FindFirstChild("RightWeld") or R_Det:FindFirstChildWhichIsA("Weld")
                                if weld then CD:FireServer(weld) end
                            end
                            GE.DestroyGrabLine:FireServer(tRoot)
                            
                            if R_Det then CG:FireServer(R_Det, tRoot, R_Weld) end
                            GE.CreateGrabLine:FireServer(tRoot, Vector3.zero, tRoot.Position, false)
                        end)
                    end
                else
                    blobRoot.CFrame = SavedPos
                    blobRoot.Velocity = Vector3.zero
                end
                
                if not kickLoopEnabled then break end
                RunService.Heartbeat:Wait()
            end
            
            kickLoopEnabled = false
            if Toggles.LoopKickToggle then Toggles.LoopKickToggle:SetValue(false) end
            
            if blobRoot then
                blobRoot.CFrame = SavedPos
                blobRoot.Velocity = Vector3.zero
            end
        end)
    end
})

	local loopKickDualActive = false
	TargetGroup:AddToggle("DualHandLoopKick", {
		Text = "Loop Kick",
		Default = false,
		Callback = function(on)
			loopKickDualActive = on
			if on then
				if not selectedKickPlayer then 
					notify("Error", "Select target first", 3)
					Toggles.DualHandLoopKick:SetValue(false)
					return 
				end

				task.spawn(function()
					local lastTargetCharDual = nil
					local bp = nil

					while loopKickDualActive do
						local target = selectedKickPlayer
						local char = Player.Character
						local hum = char and char:FindFirstChild("Humanoid")
						local seat = hum and hum.SeatPart
						
						if not seat or not target or not target.Parent then
							task.wait(0.5)
							continue
						end

						local seatParent = seat.Parent
						local grab = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
						local drop = seatParent:FindFirstChild("BlobmanSeatAndOwnerScript") and seatParent.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
						
						if not grab or not drop then task.wait(0.5) continue end

						local leftDet = seatParent:FindFirstChild("LeftDetector")
						local rightDet = seatParent:FindFirstChild("RightDetector")
						local leftWeld = leftDet and leftDet:FindFirstChild("LeftWeld")
						local rightWeld = rightDet and rightDet:FindFirstChild("RightWeld")

						local hrp = char:FindFirstChild("HumanoidRootPart")
						
						local targetChar = target.Character
						local targetHRP = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
						local targetHum = targetChar and targetChar:FindFirstChild("Humanoid")

						if targetHRP and targetHum and targetHum.Health > 0 then
							if targetChar ~= lastTargetCharDual then
								lastTargetCharDual = targetChar
								if bp then bp:Destroy() bp = nil end
								if hrp then hrp.CFrame = targetHRP.CFrame * CFrame.new(0, 25, 0) end
								task.wait(0.2)
								grab:FireServer(leftDet, targetHRP, leftWeld)
								task.wait(0.3)
								drop:FireServer(leftWeld, targetHRP)
								task.wait(0.1)
								bp = Instance.new("BodyPosition")
								bp.Position = Vector3.new(0, 999999, 0)
								bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
								bp.Parent = targetHRP
								grab:FireServer(leftDet, targetHRP, leftWeld)
								task.wait(0.2)
								drop:FireServer(leftWeld, targetHRP)
							end

							grab:FireServer(leftDet, targetHRP, leftWeld)
							task.wait()
							drop:FireServer(leftWeld, targetHRP)
							task.wait()
							grab:FireServer(rightDet, targetHRP, rightWeld)
							task.wait()
							drop:FireServer(rightWeld, targetHRP)
							task.wait()
							grab:FireServer(leftDet, targetHRP, leftWeld)
							grab:FireServer(rightDet, targetHRP, rightWeld)
							task.wait()
							drop:FireServer(leftWeld, targetHRP)
							drop:FireServer(rightWeld, targetHRP)
							task.wait()
						else
							task.wait(0.1)
						end
					end
					if bp then bp:Destroy() end
				end)
			else
				loopKickDualActive = false
			end
		end
	})

	game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
		if not processed and input.KeyCode == Enum.KeyCode.Z and _G.AutoSitBlobZ then
			local plr = game.Players.LocalPlayer
			local char = plr.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			local hum = char and char:FindFirstChild("Humanoid")

			if not hrp or not hum then return end

			local folderName = plr.Name .. "SpawnedInToys"
			local folder = workspace:FindFirstChild(folderName)
			local blob = folder and folder:FindFirstChild("CreatureBlobman")

			if not blob then
				task.spawn(function()
					pcall(function()
						game.ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer("CreatureBlobman", hrp.CFrame, Vector3.zero)
					end)
				end)
				
				if not folder then
					folder = workspace:WaitForChild(folderName, 5)
				end
				
				if folder then
					blob = folder:WaitForChild("CreatureBlobman", 5)
				end
			end

			if blob then
				local seat = blob:WaitForChild("VehicleSeat", 5)
				if seat then
					local t = tick()
					repeat
						if not hum.SeatPart then
							hrp.CFrame = seat.CFrame + Vector3.new(0, 1, 0)
							hrp.Velocity = Vector3.zero
							seat:Sit(hum)
						end
						game:GetService("RunService").Heartbeat:Wait()
					until hum.SeatPart == seat or tick() - t > 1.5
				end
			end
		end
	end)


	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and input.KeyCode == Enum.KeyCode.R then
			if blobMasterSwitch then
				blobFlyActive = not blobFlyActive
				if not blobFlyActive then
					if bvInstance then bvInstance:Destroy() bvInstance = nil end
					if bgInstance then bgInstance:Destroy() bgInstance = nil end
				end
			end
		end
	end)

	local function GetBlobRoot()
		local char = Player.Character
		local hum = char and char:FindFirstChild("Humanoid")
		
		if hum and hum.SeatPart and hum.SeatPart.Parent and hum.SeatPart.Parent.Name == "CreatureBlobman" then
			return hum.SeatPart.Parent:FindFirstChild("HumanoidRootPart") or hum.SeatPart.Parent.PrimaryPart
		end
		
		local folder = workspace:FindFirstChild(Player.Name .. "SpawnedInToys")
		if folder then
			local blob = folder:FindFirstChild("CreatureBlobman")
			if blob then
				return blob:FindFirstChild("HumanoidRootPart") or blob.PrimaryPart
			end
		end
		
		return nil
	end

	game:GetService("RunService").Heartbeat:Connect(function()
		if not blobFlyActive or not blobMasterSwitch then 
			if bvInstance then bvInstance:Destroy() bvInstance = nil end
			if bgInstance then bgInstance:Destroy() bgInstance = nil end
			return 
		end

		local root = GetBlobRoot()

		if root then
			if not root:FindFirstChild("BlobFlyVelocity") then
				bvInstance = Instance.new("BodyVelocity")
				bvInstance.Name = "BlobFlyVelocity"
				bvInstance.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bvInstance.P = 10000
				bvInstance.Parent = root
			else
				bvInstance = root.BlobFlyVelocity
			end

			if not root:FindFirstChild("BlobFlyGyro") then
				bgInstance = Instance.new("BodyGyro")
				bgInstance.Name = "BlobFlyGyro"
				bgInstance.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
				bgInstance.P = 20000
				bgInstance.D = 100
				bgInstance.Parent = root
			else
				bgInstance = root.BlobFlyGyro
			end

			local cam = workspace.CurrentCamera
			local moveDir = Vector3.zero

			if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0, 1, 0) end

			if bvInstance then 
				bvInstance.Velocity = moveDir * blobFlySpeed 
			end
			
			if bgInstance then 
				bgInstance.CFrame = cam.CFrame 
			end
		else
			if bvInstance then bvInstance:Destroy() bvInstance = nil end
			if bgInstance then bgInstance:Destroy() bgInstance = nil end
		end
	end)

	local DestroyGucciActive = false

	local DestroyTargetGucciActive = false

	local DestroyTargetGucciActive = false

	local DestroyTargetGucciActive = false

	local DestroyTargetGucciActive = false

	local DestroyTargetGucciActive = false

	local DestroyTargetGucciActive = false

	TargetGroup:AddToggle("DestroyTargetGucci", {
		Text = "Destroy Gucci (sit)",
		Default = false,
		Callback = function(Value)
			DestroyTargetGucciActive = Value

			if Value then
				if not selectedKickPlayer then
					notify("Error", "РІС‹Р±РµСЂРё С†РµР»СЊ", 3)
					Toggles.DestroyTargetGucci:SetValue(false)
					return
				end

				local char = Player.Character
				local root = char and char:FindFirstChild("HumanoidRootPart")
				if not root then return end
				
				local SafeSpot = root.CFrame
				local RunService = game:GetService("RunService")
				
				local folderName = selectedKickPlayer.Name .. "SpawnedInToys"
				notify("System", "Р¶РґСѓ РїР°РїРєСѓ " .. folderName, 3)

				task.spawn(function()
					while DestroyTargetGucciActive do
						if not selectedKickPlayer or not selectedKickPlayer.Parent then
							notify("System", "РёРіСЂРѕРє РІС‹С€РµР»", 3)
							DestroyTargetGucciActive = false
							Toggles.DestroyTargetGucci:SetValue(false)
							break
						end

						local toysFolder = workspace:FindFirstChild(folderName)
						
						if not toysFolder then
							task.wait(1)
						else
							local foundBlob = false
							
							for _, obj in ipairs(toysFolder:GetChildren()) do
								if not DestroyTargetGucciActive then break end

								if obj.Name == "CreatureBlobman" then
									foundBlob = true
									local seat = obj:FindFirstChild("VehicleSeat") or obj:FindFirstChildWhichIsA("VehicleSeat", true)
									
									if seat then
										local myChar = Player.Character
										local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
										local myHum = myChar and myChar:FindFirstChild("Humanoid")

										if myRoot and myHum then
											if myHum.SeatPart ~= seat then
												notify("Target", "СЃРЅРѕСЃ", 1)

												local magnetConnection
												magnetConnection = RunService.Stepped:Connect(function()
													if myRoot and seat then
														myRoot.CFrame = seat.CFrame
														myRoot.Velocity = Vector3.zero
														if obj.PrimaryPart then
															obj.PrimaryPart.Velocity = Vector3.zero
															obj.PrimaryPart.RotVelocity = Vector3.zero
														end
													end
												end)

												local sitStart = tick()
												while tick() - sitStart < 1 do
													if not DestroyTargetGucciActive then break end
													if myHum.SeatPart == seat then break end
													
													seat:Sit(myHum)
													task.wait()
												end
												
												if magnetConnection then magnetConnection:Disconnect() end

												if myHum.SeatPart == seat then
													task.wait(0.3) 
													myHum.Sit = false
													myHum.Jump = true
													
													task.wait(0.05)
													myRoot.CFrame = SafeSpot
													myRoot.Velocity = Vector3.zero
													
													notify("Success", "СЃРЅРѕСЃ РіРѕС‚РѕРІ", 1)
													task.wait(0.5)
												else
													myRoot.CFrame = SafeSpot
												end
											end
										end
									end
								end
							end
							
							if not foundBlob then
							end
						end
						task.wait(1)
					end
				end)
			else
				DestroyTargetGucciActive = false
				notify("System", "СЃРЅРѕСЃ РіСѓС‡С‡Рё off", 2)
			end
		end
	})

TargetGroup:AddButton({
    Text = "bring",
    Func = function()
        if not selectedKickPlayer then 
            return 
        end

        local char = Player.Character
        local hum = char and char:FindFirstChild("Humanoid")
        local seat = hum and hum.SeatPart
        if not seat or seat.Parent.Name ~= "CreatureBlobman" then 
            return 
        end

        local blob = seat.Parent
        local blobRoot = blob:FindFirstChild("HumanoidRootPart")
        local scriptObj = blob:FindFirstChild("BlobmanSeatAndOwnerScript")
        if not blobRoot or not scriptObj then return end

        local CG = scriptObj:FindFirstChild("CreatureGrab")
        local CD = scriptObj:FindFirstChild("CreatureDrop")
        local R_Det = blob:FindFirstChild("RightDetector")
        local R_Weld = R_Det and R_Det:FindFirstChild("RightWeld")

        local tChar = selectedKickPlayer.Character
        local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")
        if not tRoot then return end

        local home = blobRoot.CFrame

        blobRoot.CFrame = tRoot.CFrame
        blobRoot.Velocity = Vector3.new()
        blobRoot.RotVelocity = Vector3.new()
        task.wait(0.3)

        pcall(function()
            CG:FireServer(R_Det, tRoot, R_Weld)
        end)

        task.wait(0.5)

        blobRoot.CFrame = home
        blobRoot.Velocity = Vector3.new()
        blobRoot.RotVelocity = Vector3.new()

        task.wait(0.05)

        for i = 1, 12 do
            tRoot.CFrame = home * CFrame.new(0,3,0)
            tRoot.Velocity = Vector3.new()
            tRoot.RotVelocity = Vector3.new()
            task.wait(0.03)
        end

        for i = 1, 8 do
            local weld = R_Det:FindFirstChild("RightWeld")
            if weld then
                pcall(function()
                    CD:FireServer(weld)
                end)
            end
            task.wait(0.03)
        end
    end
})

	local antiAntiKickActive = false

	TargetGroup:AddToggle("DestroyAntiKickToggle", {
		Text = "Grab Anti Kick",
		Default = false,
		Callback = function(Value)
			antiAntiKickActive = Value

			if Value then
				task.spawn(function()
					local SetNetOwner = game:GetService("ReplicatedStorage").GrabEvents.SetNetworkOwner
					local LocalPlayer = game.Players.LocalPlayer

					local function invis_touch(part, cf)
						SetNetOwner:FireServer(part, cf)
					end

					local function CheckAndYeet(toy)
						local part = toy:FindFirstChild("SoundPart")
						if part then
							invis_touch(part, part.CFrame)
							if part:FindFirstChild("PartOwner") and part.PartOwner.Value == LocalPlayer.Name then
								part.CFrame = CFrame.new(0, 1000, 0)
							end
						end
					end

					while antiAntiKickActive do
						local target = selectedKickPlayer
						if target then
							local spawned = workspace:FindFirstChild(target.Name.."SpawnedInToys")
							if spawned then
								if spawned:FindFirstChild("NinjaKunai") then
									CheckAndYeet(spawned.NinjaKunai)
								end
								if spawned:FindFirstChild("NinjaShuriken") then
									CheckAndYeet(spawned.NinjaShuriken)
								end
								if spawned:FindFirstChild("AntiKick") then
									CheckAndYeet(spawned.AntiKick)
								end
							end
						end
						task.wait(0.1)
					end
				end)
			else
				antiAntiKickActive = false
			end
		end
	})

	TargetGroup:AddToggle("AntiAntiInputLag", {
		Text = "Anti Anti Input Lag",
		Default = false,
		Callback = function(on)
			antiAntiLagEnabled = on

			if not on then
				antiAntiLagEnabled = false
				return
			end

			task.spawn(function()
				local plr = game.Players.LocalPlayer
				local char = plr.Character
				local hrp = char:FindFirstChild("HumanoidRootPart")
				if not hrp then return end

				local burgers = {}

				for _, v in ipairs(workspace:GetDescendants()) do
					if v.Name == "FoodHamburger" and v:IsA("Model") and v:FindFirstChild("HoldPart") then
						burgers[#burgers+1] = v
					end
				end

				workspace.DescendantAdded:Connect(function(obj)
					if obj.Name == "FoodHamburger" and obj:IsA("Model") then
						task.spawn(function()
							local hp = obj:WaitForChild("HoldPart", 3)
							if hp then
								burgers[#burgers+1] = obj
							end
						end)
					end
				end)

				while antiAntiLagEnabled do
					for i = #burgers, 1, -1 do
						local b = burgers[i]
						if not b or not b.Parent or not b:FindFirstChild("HoldPart") then
							table.remove(burgers, i)
						else
							local hp = b.HoldPart

							pcall(function()
								hp.HoldItemRemoteFunction:InvokeServer(b, char)
							end)

							task.wait()

							pcall(function()
								hp.DropItemRemoteFunction:InvokeServer(
									b,
									CFrame.new(hrp.Position + Vector3.new(0,-2000,0)),
									Vector3.new(0,0,0)
								)
							end)
						end
					end

					task.wait()
				end
			end)
		end
	})

	local GrabGroup = Tabs.Defense:AddLeftGroupbox("GrabLine")

	_G.strength = 750
	local strengthConnection

	GrabGroup:AddSlider("ThrowPowerSlider", {
		Text = "Power",
		Default = 750,
		Min = 1,
		Max = 20000,
		Rounding = 0,
		Callback = function(value)
			_G.strength = value
		end
	})

	GrabGroup:AddToggle("ThrowStrengthToggle", {
		Text = "Strength",
		Default = false,
		Callback = function(enabled)
			if enabled then
				strengthConnection = workspace.ChildAdded:Connect(function(model)
					if model.Name == "GrabParts" then
						local partToImpulse = model.GrabPart.WeldConstraint.Part1
						if partToImpulse then
							local velocityObj = Instance.new("BodyVelocity", partToImpulse)
							model:GetPropertyChangedSignal("Parent"):Connect(function()
								if not model.Parent then
									if UserInputService:GetLastInputType() == Enum.UserInputType.MouseButton2 then
										velocityObj.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
										velocityObj.Velocity = workspace.CurrentCamera.CFrame.LookVector * _G.strength
										game:GetService("Debris"):AddItem(velocityObj, 1)
									else
										velocityObj:Destroy()
									end
								end
							end)
						end
					end
				end)
			elseif strengthConnection then
				strengthConnection:Disconnect()
			end
		end
	})

	local killGrabEnabled = false
	local function killGrabFunction()
		workspace.ChildAdded:Connect(function(v)
			if v:IsA("Model") and v.Name == "GrabParts" and killGrabEnabled then
				task.wait(0.05)
				local grabPart = v:FindFirstChild("GrabPart")
				if grabPart and grabPart:FindFirstChild("WeldConstraint") then
					local part1 = grabPart.WeldConstraint.Part1
					if part1 and part1.Parent and part1.Parent ~= Player.Character then
						local targetChar = part1.Parent
						local targetHum = targetChar:FindFirstChildOfClass("Humanoid")
						if targetHum and targetChar then
							pcall(function()
								targetHum.Health = 0
								targetChar:BreakJoints()
							end)
						end
					end
				end
			end
		end)
	end
	killGrabFunction()

	GrabGroup:AddToggle("KillGrabToggle", {
		Text = "Kill Grab",
		Default = false,
		Callback = function(Value)
			killGrabEnabled = Value
		end
	})

		GrabGroup:AddLabel("Anchor Object Bind"):AddKeyPicker("AnchorObjectKey", {
		Default = "G",
		Text = "Anchor Object",
		NoUI = false,
		Callback = function()
			local original = workspace:FindFirstChild("GrabParts")
			if not original then return end

			local grabPart = original:FindFirstChild("GrabPart", true)
			if not grabPart or not grabPart:IsA("BasePart") then return end

			local wasCollide = grabPart.CanCollide
			grabPart.CanCollide = true
			task.wait(0.1)

			local targetModel = nil
			local touchingParts = grabPart:GetTouchingParts()

			if #touchingParts == 0 then
				grabPart.CanCollide = wasCollide
				return
			end

			for _, part in ipairs(touchingParts) do
				if not part:IsDescendantOf(original) then
					local current = part
					while current and current ~= workspace do
						if current:IsA("Model") then
							targetModel = current
							break
						end
						current = current.Parent
					end
					if targetModel then break end
				end
			end

			grabPart.CanCollide = wasCollide

			if not targetModel then return end

			if not targetModel.Parent then
				local found = false
				local connection
				connection = targetModel.AncestryChanged:Connect(function(_, parent)
					if parent then
						found = true
						connection:Disconnect()
					end
				end)

				local startTime = tick()
				while not found and tick() - startTime < 2 do
					task.wait(0.1)
				end

				if not found then return end
			end

			local existing = targetModel:FindFirstChild("CleanedGrabParts")
			if existing then
				local existingHighlight = targetModel:FindFirstChild("AnchorHighlight")
				if existingHighlight then
					existingHighlight:Destroy()
				end
				existing:Destroy()
				return
			end

			local clone = original:Clone()
			clone.Name = "CleanedGrabParts"

			for _, desc in ipairs(clone:GetDescendants()) do
				if desc:IsA("BasePart") then
					desc.Transparency = 1
					desc.CanCollide = false

					local beam = desc:FindFirstChild("GrabBeam")
					if beam then beam:Destroy() end

					for _, sName in ipairs({"AttachSound1", "AttachSound", "BeamSound", "BeamSound1"}) do
						local sound = desc:FindFirstChild(sName)
						if sound then sound:Destroy() end
					end
				end
			end

			clone.Parent = targetModel

			local hl = Instance.new("Highlight")
			hl.Name = "AnchorHighlight"
			hl.FillColor = Color3.fromRGB(0, 85, 255)
			hl.FillTransparency = 0.4
			hl.OutlineColor = Color3.fromRGB(0, 170, 255)
			hl.OutlineTransparency = 0.7
			hl.Adornee = targetModel
			hl.Parent = targetModel

			local connection
			connection = game:GetService("RunService").Heartbeat:Connect(function()
				if not clone or not clone.Parent or not targetModel or not targetModel.Parent then
					if connection then connection:Disconnect() end
					return
				end

				if hl and hl.Parent then
					hl.Adornee = targetModel
				else
					connection:Disconnect()
				end
			end)
		end
	})

	local Misc = Tabs.Defense:AddRightGroupbox("Misc")

		local PacketSpamAmount = 10

    Misc:AddSlider("PacketAmountSlider", {
        Text = "Packet Lag",
        Default = 10,
        Min = 10,
        Max = 5000,
        Rounding = 0,
        Callback = function(Value)
            PacketSpamAmount = Value
        end
    })

    Misc:AddToggle("PacketLagToggle", {
        Text = "Packet Lag",
        Default = false,
        Callback = function(Value)
            _G.PacketLagActive = Value

            if Value then
                task.spawn(function()
                    for i, e in pairs(game.Players:GetPlayers()) do
                        if e.Name == "MaybeFlashh" then
                            return
                        end
                    end

                    local RS = game:GetService("ReplicatedStorage")
                    local GrabEvent = RS:WaitForChild("GrabEvents"):WaitForChild("ExtendGrabLine")

                    while _G.PacketLagActive do
                        pcall(function()
                            GrabEvent:FireServer(string.rep("Balls Balls Balls Balls", PacketSpamAmount))
                        end)
                        task.wait()
                    end
                end)
            else
                _G.PacketLagActive = false
            end
        end
    })

	local function enableThirdPerson()
		Player.CameraMode = Enum.CameraMode.Classic
		Camera.CameraType = Enum.CameraType.Custom
		Camera.CameraSubject = Player.Character:WaitForChild("Humanoid")
		Player.CameraMaxZoomDistance = 16456456546
		Player.CameraMinZoomDistance = 0.5
	end
	local function disableThirdPerson()
		Player.CameraMode = Enum.CameraMode.LockFirstPerson
		Camera.CameraType = Enum.CameraType.Custom
		Camera.CameraSubject = Player.Character:WaitForChild("Humanoid")
		Player.CameraMaxZoomDistance = 0
		Player.CameraMinZoomDistance = 0
	end
	Misc:AddToggle("ThirdPersonToggle", {
		Text = "3rd Person View",
		Default = false,
		Callback = function(Value)
			if Value then enableThirdPerson() else disableThirdPerson() end
		end
	})

	local infJump = false
	Misc:AddToggle("infJumpToggle", {
		Text = "Infinite Jump",
		Default = false,
		Callback = function(Value) infJump = Value end
	})
	UserInputService.JumpRequest:Connect(function()
		if infJump then
			local character = Player.Character
			if character and character:FindFirstChildOfClass("Humanoid") then
				character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end
	end)

	local espEnabled = false
	local espBoxes = {}
	local targetNames = {"partesp", "playercharacterlocationdetector"}
	local function IsTarget(obj)
		if not obj:IsA("BasePart") then return false end
		for _, name in ipairs(targetNames) do if string.lower(obj.Name) == string.lower(name) then return true end end
		return false
	end
	local function AddBoxESP(obj)
		if espBoxes[obj] then return end
		local box = Instance.new("BoxHandleAdornment")
		box.Adornee = obj
		box.AlwaysOnTop = true
		box.ZIndex = 5
		box.Color3 = Color3.fromRGB(255, 255, 255)
		box.Transparency = 0.5
		box.Size = obj.Size
		box.Parent = game.CoreGui
		espBoxes[obj] = box
		obj.AncestryChanged:Connect(function(_, parent)
			if not parent and espBoxes[obj] then espBoxes[obj]:Destroy() espBoxes[obj] = nil end
		end)
	end
	local function RemoveAllBoxes()
		for obj, box in pairs(espBoxes) do if box then box:Destroy() end end
		espBoxes = {}
	end
	local function Scan()
		for _, obj in ipairs(workspace:GetDescendants()) do if espEnabled and IsTarget(obj) then AddBoxESP(obj) end end
	end
	workspace.DescendantAdded:Connect(function(obj) if espEnabled and IsTarget(obj) then AddBoxESP(obj) end end)

	Misc:AddToggle("BoxESPWhite", {
		Text = "PCLD View",
		Default = false,
		Callback = function(Value)
			espEnabled = Value
			if espEnabled then Scan() else RemoveAllBoxes() end
		end
	})

	local mouse = Player:GetMouse()
	local tpToolConn

	Misc:AddToggle("TPToggle", {
		Text = "TP tool (Z)",
		Default = false,
		Callback = function(Value)
			if Value then
				if tpToolConn then tpToolConn:Disconnect() end
				tpToolConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
					if gameProcessed then return end
					if input.KeyCode == Enum.KeyCode.Z then
						local character = Player.Character
						if character and character:FindFirstChild("HumanoidRootPart") then
							local hrp = character.HumanoidRootPart
							local targetPos = mouse.Hit.Position
							hrp.CFrame = CFrame.new(targetPos + Vector3.new(0,3,0))
						end
					end
				end)
			else
				if tpToolConn then tpToolConn:Disconnect() tpToolConn = nil end
			end
		end
	})

	local waterParts = {}
	task.spawn(function()
		if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("AlwaysHereTweenedObjects") then
			local oceanModel = workspace.Map.AlwaysHereTweenedObjects.Ocean.Object.ObjectModel
			for _, v in pairs(oceanModel:GetChildren()) do
				if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("BasePart") or v:IsA("MeshPart") then
				table.insert(waterParts, {part = v, originalCollide = v.CanCollide})
				end
			end
		end
	end)

	Misc:AddToggle("WaterWalkToggle", {
		Text = "water walk",
		Default = false,
		Callback = function(on)
			for _, item in pairs(waterParts) do
				if item.part then item.part.CanCollide = on end
			end
		end
	})

	Misc:AddSlider("FOVSlider", {
		Text = "FOV",
		Default = 90,
		Min = 1,
		Max = 120,
		Rounding = 0,
		Suffix = "°",
		Callback = function(value) game.Workspace.CurrentCamera.FieldOfView = value end
	})

	local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")
	MenuGroup:AddButton("Unload", function() Library:Unload() end)
	MenuGroup:AddLabel("Menu Keybind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })
	Library.ToggleKeybind = Options.MenuKeybind

	ThemeManager:SetLibrary(Library)
	SaveManager:SetLibrary(Library)
	SaveManager:IgnoreThemeSettings()
	SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
	ThemeManager:SetFolder("VaBHub")
	SaveManager:SetFolder("VaBHub/Configs")
	SaveManager:BuildConfigSection(Tabs["UI Settings"])
	ThemeManager:ApplyToTab(Tabs["UI Settings"])

	PS.PlayerRemoving:Connect(function(player)
		notify("Notify", (player and player.Name or "Unknown") .. " вышел", 5)
	end)
	PS.PlayerAdded:Connect(function(plr)
		if plr:IsFriendsWith(Player.UserId) then
			notify("Notify друг", plr.Name .. " зашел", 5)
		end
	end)

	local Players = game:GetService("Players")
	local variants = {
		"BlackHole",
		"Black_Hole",
		"Blackhole",
		"Black-Hole",
		"BHole",
		"BH",
		"VoidHole",
		"Void",
		"VoidSphere",
		"DarkHole",
		"DarkSphere",
		"DarkOrb",
		"GravityHole",
		"GravityOrb",
		"SpaceHole",
		"SpaceOrb",
		"Singularity",
		"SingularityOrb",
		"EventHorizon",
		"BlackSphere",
		"Anomaly",
		"AnomalyHole",
		"SupermassiveHole",
		"QuantumHole"
	}

	local function isBlackHole(obj)
		for _,v in ipairs(variants) do
			if obj.Name:lower() == v:lower() then
				return true
			end
		end
		return false
	end

	local function getBHPosition(obj)
		if obj:IsA("BasePart") then return obj.Position end
		local part = obj:FindFirstChildWhichIsA("BasePart", true)
		if part then return part.Position end
		return nil
	end

	local function getClosestPlayer(pos)
		local closest = nil
		local dist = math.huge
		for _,plr in pairs(Players:GetPlayers()) do
			local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
			if hrp then
				local d = (hrp.Position - pos).Magnitude
				if d < dist then
					dist = d
					closest = plr.Name
				end
			end
		end
		return closest or "Не найден"
	end

	workspace.ChildAdded:Connect(function(obj)
		if isBlackHole(obj) then
			task.wait(0.05)
			local pos = getBHPosition(obj)
			if not pos then return end
			local closest = getClosestPlayer(pos)
			Rayfield:Notify({
				Title = "Kick Notify",
				Content = "Kicked ("..closest..")",
				Duration = 6.5,
				Image = 4483362458
			})
		end
	end)
