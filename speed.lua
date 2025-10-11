-- LocalScript в StarterPlayerScripts

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Создаем интерфейс
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SpeedButtonGui"
screenGui.Parent = player.PlayerGui

-- Создаем кнопку
local button = Instance.new("TextButton")
button.Name = "SpeedButton"
button.Size = UDim2.new(0, 100, 0, 50)
button.Position = UDim2.new(0, 50, 0, 50)
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Text = "Ускориться"
button.TextScaled = true
button.Parent = screenGui

-- Переменные для перетаскивания
local isDragging = false
local dragStartPosition
local buttonStartPosition

-- Переменная для отслеживания состояния скорости
local isSpeedBoosted = false
local originalWalkSpeed

-- Функция для получения текущей скорости персонажа
local function getCurrentWalkSpeed()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    return humanoid and humanoid.WalkSpeed or 16
end

-- Функция для установки скорости
local function setWalkSpeed(speed)
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = speed
        end
    end
end

-- Обработчик нажатия на кнопку (для переключения скорости)
button.MouseButton1Click:Connect(function()
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if not isSpeedBoosted then
                -- Сохраняем оригинальную скорость и увеличиваем в 2 раза
                originalWalkSpeed = humanoid.WalkSpeed
                humanoid.WalkSpeed = originalWalkSpeed * 2
                isSpeedBoosted = true
                button.Text = "Обычная\nскорость"
                button.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
            else
                -- Возвращаем обычную скорость
                humanoid.WalkSpeed = originalWalkSpeed
                isSpeedBoosted = false
                button.Text = "Ускориться"
                button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            end
        end
    end
end)

-- Обработчики для перетаскивания кнопки
button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        dragStartPosition = Vector2.new(input.Position.X, input.Position.Y)
        buttonStartPosition = button.Position
    end
end)

button.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStartPosition
        button.Position = UDim2.new(
            buttonStartPosition.X.Scale, 
            buttonStartPosition.X.Offset + delta.X,
            buttonStartPosition.Y.Scale, 
            buttonStartPosition.Y.Offset + delta.Y
        )
    end
end)

-- Обработчик для сброса скорости при смерти персонажа
player.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid").Died:Connect(function()
        isSpeedBoosted = false
        button.Text = "Ускориться"
        button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    end)
end)