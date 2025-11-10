local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "Script",
   LoadingTitle = "Script",
   LoadingSubtitle = "", 
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
   Name = "Remove Map Sounds",
   Callback = function()
   game.Workspace.Map.MapNoises:Destroy()
	print("Done!")

	Rayfield:Notify({
   Title = "Remove Map Sounds",
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

local Section = Tab:CreateSection("Map Themes")

local Button = Tab:CreateButton({
   Name = "Default",
   Callback = function()
	local group = game.Workspace.Map:FindFirstChild("BaseGround")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "Grass" and part:IsA("Part") then
            part.BrickColor = BrickColor.new("Moss")
        end
    end
end

local group = game.Workspace.Map:FindFirstChild("BaseGround")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "WasteGrass" and part:IsA("Part") then
			part.BrickColor = BrickColor.new("Mulberry")
        end
    end
end

local group = game.Workspace.Map:FindFirstChild("Hole")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "WasteGrass" and part:IsA("Part") then
			part.BrickColor = BrickColor.new("Mulberry")
        end
    end
end

local group = game.Workspace.Map:FindFirstChild("BaseGround")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "Sand" and part:IsA("Part") then
			part.BrickColor = BrickColor.new("Wheat")
        end
    end
end

local group = game.Workspace.Map:FindFirstChild("BaseGround")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "Rock" and part:IsA("Part") then
			part.BrickColor = BrickColor.new("Medium stone grey")
        end
    end
end

local group = game.Workspace.Map.CaveMountain:FindFirstChild("Mountain2rocks.1")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "Rock" and part:IsA("Part") then
			part.BrickColor = BrickColor.new("Medium stone grey")
        end
    end
end

local group = game.Workspace.Map.CaveMountain:FindFirstChild("Mountain2rocks.2")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "Rock" and part:IsA("Part") then
			part.BrickColor = BrickColor.new("Medium stone grey")
        end
    end
end

local group = game.Workspace.Map.CaveMountain:FindFirstChild("Mountain2rocks.3")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "Rock" and part:IsA("Part") then
			part.BrickColor = BrickColor.new("Medium stone grey")
        end
    end
end

local group = game.Workspace.Map.CaveMountain:FindFirstChild("Mountain2rocks.4")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "Rock" and part:IsA("Part") then
			part.BrickColor = BrickColor.new("Medium stone grey")
        end
    end
end

local group = game.Workspace.Map.CaveMountain:FindFirstChild("Mountain2rocks.5")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "Rock" and part:IsA("Part") then
			part.BrickColor = BrickColor.new("Medium stone grey")
        end
    end
end

local group = game.Workspace.Map:FindFirstChild("BaseGround")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "LushGrass" and part:IsA("Part") then
			part.BrickColor = BrickColor.new("Parsley green")
        end
    end
end

local group = game.Workspace.Map.BarnHillArea:FindFirstChild("Mountain3Grass")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "LushGrass" and part:IsA("Part") then
			part.BrickColor = BrickColor.new("Parsley green")
        end
    end
end

local group = game.Workspace.Map.BarnHillArea:FindFirstChild("Mountain3Grass")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "Rock" and part:IsA("Part") then
			part.BrickColor = BrickColor.new("Medium stone grey")
        end
    end
end

local group = game.Workspace.Map.BarnHillArea:FindFirstChild("Mountain3rocks.1")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "Rock" and part:IsA("Part") then
			part.BrickColor = BrickColor.new("Medium stone grey")
        end
    end
end

local group = game.Workspace.Map.BarnHillArea:FindFirstChild("Mountain3rocks.2")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "Rock" and part:IsA("Part") then
			part.BrickColor = BrickColor.new("Medium stone grey")
        end
    end
end

local group = game.Workspace.Map.BarnHillArea:FindFirstChild("Mountain3Wall")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "Rock" and part:IsA("Part") then
			part.BrickColor = BrickColor.new("Medium stone grey")
        end
    end
end

local group = game.Workspace.Map.BarnHillArea:FindFirstChild("Mountain3Wall")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "Dirt" and part:IsA("Part") then
			part.BrickColor = BrickColor.new("Linen")
        end
    end
end

local group = game.Workspace.Map:FindFirstChild("MountainSnowTop")
if group then
    for _, part in ipairs(group:GetChildren()) do
        if part.Name == "Snow" and part:IsA("Part") then
			part.BrickColor = BrickColor.new("Instutitutional white")
        end
    end
end


	print("Done!")

	Rayfield:Notify({
   Title = "Defalut Theme",
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
