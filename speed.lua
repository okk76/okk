local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "e",
   LoadingTitle = "e",
   LoadingSubtitle = "e", 
})

local Tab = Window:CreateTab("Player", 7992557358) -- Title, Image

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
   game.workspace.geroi345678.Character.Torso.CanCollide = Value
   game.workspace.geroi345678.Head.CanCollide = Value
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

local Tab = Window:CreateTab("FTAP", 4483362458) -- Title, Image

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
