local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local countings = 0

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui

-- Create Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 400)
Frame.Position = UDim2.new(0.5, -150, 0.5, -200)
Frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
Frame.BorderSizePixel = 2
Frame.BorderColor3 = Color3.new(0.8, 0.8, 0.8)
Frame.Parent = ScreenGui
Frame.Draggable = true
Frame.Active = true
Frame.Selectable = true

-- Create Title Label
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.Text = "Item Teleporter"
TitleLabel.TextSize = 20
TitleLabel.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
TitleLabel.TextColor3 = Color3.new(1, 1, 1)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Parent = Frame

-- Create Buttons
local function CreateButton(name, text, positionY)
	local Button = Instance.new("TextButton")
	Button.Name = name
	Button.Size = UDim2.new(0.8, 0, 0, 50)
	Button.Position = UDim2.new(0.1, 0, 0, positionY)
	Button.Text = text
	Button.TextSize = 18
	Button.Font = Enum.Font.SourceSans
	Button.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
	Button.TextColor3 = Color3.new(1, 1, 1)
	Button.Parent = Frame
	return Button
end

local SetCoordsButton = CreateButton("SetCoordsButton", "Set Target Coords", 70)
local SelectPlanksButton = CreateButton("SelectPlanksButton", "Select Planks", 140)
local DragAndMovePlankButton = CreateButton("DragAndMovePlankButton", "Teleport One Plank", 210)
local ContinuousDragButton = CreateButton("ContinuousDragButton", "Start Continuous Teleport", 280)
local CloseButton = CreateButton("CloseButton", "Close UI", 350)

-- Variables
local targetCoords = Vector3.zero
local selectedPlanks = {}
local maxDistance = 17
local isDragging = false -- To prevent spamming issues
local continuousDragging = false -- Flag for continuous teleporting

-- Function to set target coordinates
local function SetTargetCoords()
	if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
		targetCoords = Player.Character.HumanoidRootPart.Position
		print("Target coordinates set to:", targetCoords)
	else
		print("Player character or HumanoidRootPart not found!")
	end
end

-- Function to select planks
local function SelectPlanks()
	selectedPlanks = {}

	for _, model in pairs(game.Workspace.PlayerModels:GetChildren()) do
		if model:IsA("Model") and model.Name ~= "Plank" then
			if not model.PrimaryPart then
				local possiblePrimaryPart = model:FindFirstChild("Main") or model:FindFirstChild("WoodSection") or model:FindFirstChildWhichIsA("BasePart")
				if possiblePrimaryPart then
					model.PrimaryPart = possiblePrimaryPart
				else
					print("Plank without suitable PrimaryPart found:", model.Name)
				end
			end

			if model.PrimaryPart then
				table.insert(selectedPlanks, model)
			end
		end
	end

	print("Selected planks:", #selectedPlanks)
end

-- Function to teleport and move one plank
local function DragAndMoveOnePlank()
	if isDragging then

		return
	end
	isDragging = true

	coroutine.wrap(function()
		if #selectedPlanks == 0 then
			print("No planks selected!")
			isDragging = false
			return
		end

		local characterPosition = Player.Character.HumanoidRootPart.Position
		local remote = game:GetService("ReplicatedStorage").Interaction.ClientIsDragging

		for _, plank in ipairs(selectedPlanks) do
			local plankPosition = plank.PrimaryPart.Position
			local distance = (characterPosition - plankPosition).Magnitude

			if distance <= maxDistance then
                countings = countings + 1
                print(countings)
				remote:FireServer(plank)
				task.wait(timerthing)  -- Changed wait to 0.15 for the first delay
				plank:SetPrimaryPartCFrame(CFrame.new(targetCoords))
				task.wait(0.05)  -- Changed wait to 0.05 for the second delay
				remote:FireServer(plank)
                task.wait()
				break -- Teleport only one plank
			end
		end

		isDragging = false
	end)()
end

-- Function to continuously teleport and move planks
local function StartContinuousTeleport()
	if continuousDragging then
		
		return
	end
	continuousDragging = true
	print("Starting continuous teleport...")

	while continuousDragging do
		DragAndMoveOnePlank()  -- Teleport and move one plank at a time
		task.wait(0.05)  -- Delay between each teleport to avoid overloading the system
	end
end

-- Function to stop continuous teleporting
local function StopContinuousTeleport()
	continuousDragging = false
	print("Continuous teleport stopped!")
end

-- Add new button for Teleport Loop
local TeleportLoopButton = CreateButton("TeleportLoopButton", "Start Teleport Loop", 350)

-- Variables
local teleportLoopRunning = false -- Flag to control the teleport loop

-- Function to teleport player to the nearest plank
local function TeleportToNearestPlank()
	local humanoidRootPart = Player.Character:WaitForChild("HumanoidRootPart")
	local nearestPlank
	local nearestDistance = math.huge
	local characterPosition = humanoidRootPart.Position

	for _, plank in ipairs(selectedPlanks) do
		local plankPosition = plank.PrimaryPart.Position
		local distance = (characterPosition - plankPosition).Magnitude

		if distance < nearestDistance then
			nearestPlank = plank
			nearestDistance = distance
		end
	end

	if nearestPlank then
		humanoidRootPart.Anchored = true
		humanoidRootPart.CFrame = CFrame.new(nearestPlank.PrimaryPart.Position + Vector3.new(5, 3, 5))
		print("Teleported to nearest plank:", nearestPlank.PrimaryPart.Position)
	else
		print("No planks found to teleport to!")
	end
end

-- Function to start the teleport loop
local function StartTeleportLoop()
	if teleportLoopRunning then
		print("Teleport loop already running!")
		return
	end

	teleportLoopRunning = true
	print("Starting teleport loop...")

	coroutine.wrap(function()
		while teleportLoopRunning do
			local humanoidRootPart = Player.Character:WaitForChild("HumanoidRootPart")
			local characterPosition = humanoidRootPart.Position
			local plankFound = false

			-- Check if any plank is within 17 studs
			for _, plank in ipairs(selectedPlanks) do
				local plankPosition = plank.PrimaryPart.Position
				local distance = (characterPosition - plankPosition).Magnitude

				if distance <= maxDistance then
					plankFound = true
					break
				end
			end

			if not plankFound then
				TeleportToNearestPlank() -- Teleport if no plank is found within 17 studs
			end

			task.wait(0.5) -- Check every 0.5 seconds
		end

		-- Reset humanoid root part to unanchored when the loop stops
		local humanoidRootPart = Player.Character:FindFirstChild("HumanoidRootPart")
		if humanoidRootPart then
			humanoidRootPart.Anchored = false
		end
	end)()
end

-- Function to stop the teleport loop
local function StopTeleportLoop()
	teleportLoopRunning = false
	print("Teleport loop stopped!")
end

-- Connect the teleport loop button
TeleportLoopButton.MouseButton1Click:Connect(function()
	if teleportLoopRunning then
		StopTeleportLoop() -- Stop the loop if running
		TeleportLoopButton.Text = "Start Teleport Loop"
	else
		StartTeleportLoop() -- Start the loop if not running
		TeleportLoopButton.Text = "Stop Teleport Loop"
	end
end)


-- Connect Buttons
SetCoordsButton.MouseButton1Click:Connect(SetTargetCoords)
SelectPlanksButton.MouseButton1Click:Connect(SelectPlanks)
DragAndMovePlankButton.MouseButton1Click:Connect(DragAndMoveOnePlank)

-- Continuous drag and teleport
ContinuousDragButton.MouseButton1Click:Connect(function()
	if continuousDragging then
		StopContinuousTeleport()  -- Stop the continuous teleport
		ContinuousDragButton.Text = "Start Continuous Teleport"  -- Change button text
	else
		StartContinuousTeleport()  -- Start continuous teleporting
		ContinuousDragButton.Text = "Stop Continuous Teleport"  -- Change button text
	end
end)

CloseButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
	print("UI Closed")
end)
