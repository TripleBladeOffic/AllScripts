local Luxtl = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Luxware-UI-Library/main/Source.lua"))()

local Luxt = Luxtl.CreateWindow("Wisteria", 6105620301)

--#region Player Tab

local PlayerTab = Luxt:Tab("Player")
local Playerer = PlayerTab:Section("Player")
local UIS = game:GetService("UserInputService")

-- WalkSpeed
local SetSpeed = 16
Playerer:Slider("WalkSpeed", 16, 250, function(currentValue)
    SetSpeed = currentValue
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = currentValue 
end)

game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = SetSpeed
end)

-- Sprint
UIS.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.LeftShift then
        OldWalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
        SetSpeed = 100
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = SetSpeed
    end
end)

UIS.InputEnded:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.LeftShift then
        SetSpeed = OldWalkSpeed
    end
end)

-- Fly
local speeds = 1

Playerer:Slider("Fly Speed", 1, 15, function(currentValue)
    speeds = currentValue
    speed.Text = speeds
    if nowe == true then


    tpwalking = false
    for i = 1, speeds do
        spawn(function()

            local hb = game:GetService("RunService").Heartbeat


            tpwalking = true
            local chr = game.Players.LocalPlayer.Character
            local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
            while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                if hum.MoveDirection.Magnitude > 0 then
                    chr:TranslateBy(hum.MoveDirection)
                end
            end

        end)
        end
        end
end)
-- Combined Fly Function with Adjustable Speed
local Players = game.Players
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local FLYING = false

local function getRoot(char)
    return char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
end
local speaker = game:GetService("Players").LocalPlayer
game.UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Q then
        if nowe == true then
            nowe = false
    
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
            speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
        else 
            nowe = true
    
    
    
            for i = 1, speeds do
                spawn(function()
    
                    local hb = game:GetService("RunService").Heartbeat
    
    
                    tpwalking = true
                    local chr = game.Players.LocalPlayer.Character
                    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                    while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                        if hum.MoveDirection.Magnitude > 0 then
                            chr:TranslateBy(hum.MoveDirection)
                        end
                    end
    
                end)
            end
            game.Players.LocalPlayer.Character.Animate.Disabled = true
            local Char = game.Players.LocalPlayer.Character
            local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")
    
            for i,v in next, Hum:GetPlayingAnimationTracks() do
                v:AdjustSpeed(0)
            end
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
            speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
            speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
        end
    
    
    
    
        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
    
    
    
            local plr = game.Players.LocalPlayer
            local torso = plr.Character.Torso
            local flying = true
            local deb = true
            local ctrl = {f = 0, b = 0, l = 0, r = 0}
            local lastctrl = {f = 0, b = 0, l = 0, r = 0}
            local maxspeed = 50
            local speed = 0
    
    
            local bg = Instance.new("BodyGyro", torso)
            bg.P = 9e4
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.cframe = torso.CFrame
            local bv = Instance.new("BodyVelocity", torso)
            bv.velocity = Vector3.new(0,0.1,0)
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            if nowe == true then
                plr.Character.Humanoid.PlatformStand = true
            end
            while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
                game:GetService("RunService").RenderStepped:Wait()
    
                if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                    speed = speed+.5+(speed/maxspeed)
                    if speed > maxspeed then
                        speed = maxspeed
                    end
                elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                    speed = speed-1
                    if speed < 0 then
                        speed = 0
                    end
                end
                if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                    lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
                elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                else
                    bv.velocity = Vector3.new(0,0,0)
                end
                --  game.Players.LocalPlayer.Character.Animate.Disabled = true
                bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
            end
            ctrl = {f = 0, b = 0, l = 0, r = 0}
            lastctrl = {f = 0, b = 0, l = 0, r = 0}
            speed = 0
            bg:Destroy()
            bv:Destroy()
            plr.Character.Humanoid.PlatformStand = false
            game.Players.LocalPlayer.Character.Animate.Disabled = false
            tpwalking = false
    
    
    
    
        else
            local plr = game.Players.LocalPlayer
            local UpperTorso = plr.Character.UpperTorso
            local flying = true
            local deb = true
            local ctrl = {f = 0, b = 0, l = 0, r = 0}
            local lastctrl = {f = 0, b = 0, l = 0, r = 0}
            local maxspeed = 50
            local speed = 0
    
    
            local bg = Instance.new("BodyGyro", UpperTorso)
            bg.P = 9e4
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.cframe = UpperTorso.CFrame
            local bv = Instance.new("BodyVelocity", UpperTorso)
            bv.velocity = Vector3.new(0,0.1,0)
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            if nowe == true then
                plr.Character.Humanoid.PlatformStand = true
            end
            while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
                wait()
    
                if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                    speed = speed+.5+(speed/maxspeed)
                    if speed > maxspeed then
                        speed = maxspeed
                    end
                elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                    speed = speed-1
                    if speed < 0 then
                        speed = 0
                    end
                end
                if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                    lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
                elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                else
                    bv.velocity = Vector3.new(0,0,0)
                end
    
                bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
            end
            ctrl = {f = 0, b = 0, l = 0, r = 0}
            lastctrl = {f = 0, b = 0, l = 0, r = 0}
            speed = 0
            bg:Destroy()
            bv:Destroy()
            plr.Character.Humanoid.PlatformStand = false
            game.Players.LocalPlayer.Character.Animate.Disabled = false
            tpwalking = false
    
    
    
        end
    
    end
end)

-- Call Fly function
Playerer:Label("Press Q To Toggle Fly")

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
        wait()
    game:GetService("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
end)

-- No Clip
function noclip()
    Clip = false
    local function Nocl()
        if Clip == false and game.Players.LocalPlayer.Character ~= nil then
            for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
                    v.CanCollide = false
                end
            end
        end
        wait(0.21) -- basic optimization
    end
    Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
    if Noclip then Noclip:Disconnect() end
    Clip = true
end

Playerer:Toggle("No Clip", function(isToggled)
    if isToggled then
        noclip()
    else
        clip()
    end
end)
-- Hard Dragger
local CustomDragger = false

function Dragger()
    game.Workspace.ChildAdded:connect(function(a)
        if a.Name == "Dragger" then
            local bg = a:WaitForChild("BodyGyro")
            local bp = a:WaitForChild("BodyPosition")
            repeat
                if CustomDragger then
                    task.wait()
                    bp.P = 120000
                    bp.D = 1000
                    bp.maxForce = Vector3.new(math.huge,math.huge,math.huge)
                    bg.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
                else
                    wait()
                    bp.P = 10000
                    bp.D = 800
                    bp.maxForce = Vector3.new(17000, 17000, 17000)
                    bg.maxTorque = Vector3.new(200, 200, 200)
                end
            until not a
        end
    end)
end

Dragger()

Playerer:Button("Hard Dragger", function()
    if CustomDragger == false then
        CustomDragger = true
    else
        CustomDragger = false
    end
end)

-- Walk On Water
Playerer:Toggle("Walk On Water", function(isToggled)
    for i,v in next,game.Workspace.Water:GetChildren() do
        if v.Name == "Water" then
            if isToggled then
                v.CanCollide = true
                else
                v.CanCollide = false
            end
        end
    end
end) 

--#endregion
--#region Base Mover Tab

local BaseMoverTab = Luxt:Tab("Base Mover")
local BaseMover = BaseMoverTab:Section("Base Mover")

-- Variables
local DoStructure = false
local DoGlass = false
local DoFurniture = false
local DoRedStone

local Count = 0
local PlayerModels = game.workspace.PlayerModels
local LocalPlayer = game:GetService("Players").LocalPlayer.Name

local DesiredOwner
local GivingTo

-- Needed Functions
local function RemoveOld()
    local function loadCFramesAndCreateParts()
        local fileName = "myfile.txt"
        
        -- Check if the file exists
        if not isfile(fileName) then
            warn("File does not exist: " .. fileName)
            return
        end

        -- Read the file content
        local fileContent = readfile(fileName)
        local lines = string.split(fileContent, "\n") -- Split file content by lines

        for _, line in ipairs(lines) do
            if line ~= "" then
                -- Convert the line back into a CFrame using loadstring
                local success, cframe = pcall(function()
                    return loadstring("return " .. line)()
                end)

                if success and typeof(cframe) == "CFrame" then
                    -- Create a new part and set its CFrame
                    local newPart = Instance.new("Part")
                    newPart.Size = Vector3.new(1, 1, 1) -- Adjust size as needed
                    newPart.Anchored = true
                    newPart.CFrame = cframe
                    newPart.Parent = workspace
                    print("Created part at CFrame:", cframe)
                else
                    warn("Failed to parse CFrame from line: " .. line)
                end
            end
        end
    end
    local function deleteMatchingParts()
        local PreventCrash = 0
        -- Loop through each part in the workspace
        for _, part in ipairs(workspace:GetChildren()) do
            if PreventCrash>500 then
                game:GetService("RunService").PreRender:Wait()
            else
                PreventCrash = PreventCrash + 1
            end
            -- Check if the part is a part and if it has a CFrame value
            if part:IsA("Part") then
                local partCFrame = part.CFrame

                -- Loop through PlayerModels to check for a matching part
                for _, playerModel in ipairs(game.workspace.PlayerModels:GetChildren()) do
                    -- Check if PlayerModel has a "MainCFrame" value
                    local mainCFrameValue = playerModel:FindFirstChild("MainCFrame")
                    if mainCFrameValue and mainCFrameValue.Value == partCFrame then
                        -- Delete both the part from the workspace and the matching PlayerModel part
                        print("Match found. Deleting parts...")

                        -- Delete the part from the workspace
                        part:Destroy()

                        -- Delete the corresponding part from the PlayerModels folder
                        playerModel:Destroy()
                        print("Deleted matching parts.")
                        break -- No need to check further PlayerModels once a match is found
                    end
                end
            end
        end
    end
    loadCFramesAndCreateParts()
    deleteMatchingParts()
end

local function GetOffset()
    local Properties = game.workspace.Properties
    local OriginSquare1 = nil
    local OriginSquare2 = nil
    
    for _, child in (Properties:GetChildren()) do
        if child:FindFirstChild("Owner") and child:FindFirstChild("OriginSquare") then
            local FoundOwner = tostring(child.Owner.Value):gsub("^%s*(.-)%s*$", "%1")
            local LocalPlayer = DesiredOwner:gsub("^%s*(.-)%s*$", "%1")
            local GivingToTrimmed = GivingTo:gsub("^%s*(.-)%s*$", "%1")
    
            if FoundOwner == LocalPlayer then
                OriginSquare1 = child.OriginSquare.CFrame.Position
            end
            if FoundOwner == GivingToTrimmed then
                OriginSquare2 = child.OriginSquare.CFrame.Position
            end
        end
    end
    
    if OriginSquare1 ~= nil and OriginSquare2 ~= nil then
        OffsetFound = OriginSquare2 - OriginSquare1
        X = OffsetFound.X
        Y = OffsetFound.Y
        Z = OffsetFound.Z
    end
end

local function saveCFrameToFile(cframe)
	local fileName = "myfile.txt"
	-- Convert CFrame to string, retaining all its components
	local cframeString = string.format("CFrame.new(%f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f)",
		cframe:GetComponents()
	)

	if isfile(fileName) then
		-- Append the CFrame to the file
		local existingContent = readfile(fileName)
		writefile(fileName, existingContent .. cframeString .. "\n")
	else
		-- Create the file and write the first CFrame
		writefile(fileName, cframeString .. "\n")
	end
	print("Saved CFrame to file")
end

local function clearFileContents()
    local fileName = "myfile.txt"

    -- Check if the file exists before trying to clear it
    if isfile(fileName) then
        -- Write an empty string to the file to clear its contents
        writefile(fileName, "")
        print("File cleared: " .. fileName)
    else
        warn("File does not exist: " .. fileName)
    end
end


-- Get Do Booleans

BaseMover:Toggle("Main Structures", function(isToggled)
    DoStructure = isToggled
end)
BaseMover:Toggle("Glass", function(isToggled)
    DoGlass = isToggled
end)
BaseMover:Toggle("Furniture", function(isToggled)
    DoFurniture = isToggled
end)
BaseMover:Toggle("Converyers,Sawmil,Etc", function(isToggled)
    DoRedStone = isToggled
end)

-- Tables

local Structures = {
	-- Walls
	"Wall1",
	"Wall1Corner",
	"Wall1Short",
	"Wall1ShortCorner",
	"Wall1ShortThin",
	"Wall1Tall",
	"Wall1TallCorner",
	"Wall1TallThin",
	"Wall1Thin",

	"Wall2",
	"Wall2Corner",
	"Wall2Short",
	"Wall2ShortCorner",
	"Wall2ShortThin",
	"Wall2Tall",
	"Wall2TallCorner",
	"Wall2TallThin",
	"Wall2Thin",

	"Wall3",
	"Wall3Corner",
	"Wall3Tall",
	"Wall3TallCorner",
	"Wall3TallThin",
	"Wall3Thin",

	-- Floors
	"Floor1",
	"Floor1Large",
	"Floor1Small",
	"Floor1Tiny",

	"Floor2",
	"Floor2Large",
	"Floor2Small",
	"Floor2Tiny",

	-- Doors
	"Door1",
	"Door2",
	"Door3",

	-- Ladders
	"Ladder1",

	-- Post
	"Post",

	-- Stairs
	"Stair1",
	"Stair2",

	-- Wedges
	"Wedge1",
	"Wedge1_Thin",
	"Wedge2",
	"Wedge2_Thin",
	"Wedge3",
	"Wedge3_Thin",
	"Wedge4",
	"Wedge4_Thin",
	"Wedge5",
	"Wedge5_Thin",
	"Wedge6",
	"Wedge6_Thin",
	"Wedge7",
	"Wedge7_Thin",
	"Wedge8",
	"Wedge8_Thin",
	"Wedge9",
	"Wedge9_Thin",
	"Wedge10",
	"Wedge10_Thin"
}
local Furniture = {
	-- Cabinets
	"Cabinet1",
	"Cabinet1CornerTight",
	"Cabinet1CornerWide",
	"Cabinet1Thin",

	-- Chairs
	"Chair1",

	-- Countertops
	"CounterTop1",
	"CounterTop1Sink",
	"CounterTop1Thin",

	-- Tables
	"Table1",
	"Table2",

    -- Paintings
    "Painting1",
    "Painting2",
    "Painting3",
    "Painting4",
    "Painting5",
    "Painting6",
    "Painting7",
    "Painting8",
    "Painting9",
}
local Glass = {
	"GlassPane4",
	"GlassPane3",
	"GlassPane2",
	"GlassPane1",
	"GlassDoor1"
}
local RedStone = {
    "LogSweeper",
    "ConveyorFunnel",
    "StraightConveyor",
    "TightTurnConveyor",
    "TiltConveyor",
    "ConveyorSwitch",
    "StraightSwitchConveyorRight",
    "StraightSwitchConveyorLeft",
    "Hatch",
    "WoodChecker",
    "WallLight1",
    "WallLight2",
    "Sawmill4L",
    "ChopSaw",
    "ClockSwitch",
    "Lever0",
    "PressurePlate",
    "Refridgerator",
    "Seat_Couch",
    "Seat_Armchair",
    "SignalSustain",
    "Seat_Loveseat",
    "GateAND",
    "GateNOT",
    "GateOR",
    "GateXOR",
    "SignalDelay",
    "Laser",
    "LaserReceiver",
    "Dishwasher",
    "Bed2",
    "Bed1",
    "Toilet",
    "Pickup1",
    "Stove"
}

local NeonWires = {
    "NeonWireYellow",
    "NeonWireWhite",
    "NeonWireViolet",
    "NeonWireRed",
    "NeonWirePinky",
    "NeonWireOrange",
    "NeonWireGreen",
    "NeonWireCyan",
    "NeonWireBlue"
}
local NormalWires = {
    "Wire"
}

-- Remove Old Parts

BaseMover:Button("Remove Old Parts", function()
    RemoveOld()
end)

-- Get Names

BaseMover:TextBox("Base Owner", "Username", function(getText)
    DesiredOwner = getText
end)
BaseMover:TextBox("Base Receiver", "Username", function(getText)
    GivingTo = getText
end)

-- Main Starting Function

local function StartTeleport()
    GetOffset()
    if DoStructure then
        for _, Structure in ipairs(Structures) do
            for _, child in ipairs(PlayerModels:GetChildren()) do
                if child.Name == Structure then
                    local FoundOwner = child:FindFirstChild("Owner")
                    if FoundOwner then
                        FoundOwner = tostring(FoundOwner.Value):gsub("^%s*(.-)%s*$", "%1")
                        LocalPlayer = DesiredOwner:gsub("^%s*(.-)%s*$", "%1")
                        if FoundOwner == DesiredOwner then
                            Count = Count + 1
                            local ItemName = child:FindFirstChild("ItemName")
                            if ItemName then
                                ItemName = ItemName.Value
                            end
                            local Type = child:FindFirstChild("Type")
                            if Type then
                                Type = Type.Value
                            end
                            local BlueprintWoodClass = child:FindFirstChild("BlueprintWoodClass")
                            if BlueprintWoodClass then
                                BlueprintWoodClass = BlueprintWoodClass.Value
                            end
                            local MainCFrame = child:FindFirstChild("MainCFrame")
                            if MainCFrame then
                                MainCFrame = MainCFrame.Value
                                saveCFrameToFile(MainCFrame)
                            end
                            local BuildDependentWood = child:FindFirstChild("BuildDependentWood")
    
                            -- Save MainCFrame to myfile.txt
                            
    
                            if BuildDependentWood then
                                BuildDependentWood.BrickColor = BrickColor.new("Lime green")
                                end
                            
                            local NewPart    = Instance.new("Part")
                            NewPart.CFrame   = child.MainCFrame.Value
                            NewPart.Position = NewPart.Position + Vector3.new(X, Y, Z)
    
                            if DesiredOwner and Type and ItemName and BlueprintWoodClass and MainCFrame and BuildDependentWood then
                                while child:IsDescendantOf(PlayerModels) do
                                    wait()
                                    local args = {
                                        [1] = ItemName,
                                        [2] = NewPart.CFrame,
                                        [3] = game:GetService("Players").LocalPlayer,
                                        [4] = BlueprintWoodClass,
                                        [5] = child,
                                        [6] = true
                                    }
                                    game:GetService("ReplicatedStorage"):WaitForChild("PlaceStructure"):WaitForChild("ClientPlacedStructure"):FireServer(unpack(args))
                                end
                            end
    
                            NewPart:Destroy()
                            print("Teleported Part Named : ")
                            print(child.Name)
                            print("Teleported Total : ")
                            print(Count)
                            print("--------------------------------")
                        end
                    end
                end
            end
        end
    end
    
    if DoFurniture then
        for _, Structure in ipairs(Furniture) do
            for _, child in ipairs(PlayerModels:GetChildren()) do
                if child.Name == Structure then
                    local FoundOwner = child:FindFirstChild("Owner")
                    if FoundOwner then
                        FoundOwner = tostring(FoundOwner.Value):gsub("^%s*(.-)%s*$", "%1")
                        LocalPlayer = DesiredOwner:gsub("^%s*(.-)%s*$", "%1")
                        if FoundOwner == DesiredOwner then
                            Count = Count + 1
                            local ItemName = child:FindFirstChild("ItemName")
                            if ItemName then
                                ItemName = ItemName.Value
                            end
                            local Type = child:FindFirstChild("Type")
                            if Type then
                                Type = Type.Value
                            end
                            local BlueprintWoodClass = child:FindFirstChild("BlueprintWoodClass")
                            if BlueprintWoodClass then
                                BlueprintWoodClass = BlueprintWoodClass.Value
                            end
                            local MainCFrame = child:FindFirstChild("Main")
                            if MainCFrame then
                                MainCFrame = MainCFrame.CFrame
                                saveCFrameToFile(MainCFrame)
                            else						
                                MainCFrame = child:FindFirstChild("MainCFrame")
                                if MainCFrame then
                                    MainCFrame = MainCFrame.Value
                                    saveCFrameToFile(MainCFrame)
                                end
                            end
                            local BuildDependentWood = child:FindFirstChild("BuildDependentWood")
    
                            -- Save MainCFrame to myfile.txt
                            
    
                            if BuildDependentWood then
                                BuildDependentWood.BrickColor = BrickColor.new("Lime green")
                            end
    
                            local NewPart    = Instance.new("Part")
                            NewPart.CFrame   = MainCFrame
                            NewPart.Position = NewPart.Position + Vector3.new(X, Y, Z)
    
                            if DesiredOwner and Type and ItemName and MainCFrame then
                                while child:IsDescendantOf(PlayerModels) do
                                    wait()
                                    local args = {
                                        [1] = ItemName,
                                        [2] = NewPart.CFrame,
                                        [3] = game:GetService("Players").LocalPlayer,
                                        [4] = BlueprintWoodClass,
                                        [5] = child,
                                        [6] = true
                                    }
                                    game:GetService("ReplicatedStorage"):WaitForChild("PlaceStructure"):WaitForChild("ClientPlacedStructure"):FireServer(unpack(args))
                                end
                            end
    
                            NewPart:Destroy()
                            print("Teleported Part Named : ")
                            print(child.Name)
                            print("Teleported Total : ")
                            print(Count)
                            print("--------------------------------")
                        end
                    end
                end
            end
        end
    end
    
    if DoGlass then
        for _, Structure in ipairs(Glass) do
            for _, child in ipairs(PlayerModels:GetChildren()) do
                if child.Name == Structure then
                    local FoundOwner = child:FindFirstChild("Owner")
                    if FoundOwner then
                        FoundOwner = tostring(FoundOwner.Value):gsub("^%s*(.-)%s*$", "%1")
                        LocalPlayer = DesiredOwner:gsub("^%s*(.-)%s*$", "%1")
                        if FoundOwner == DesiredOwner then
                            Count = Count + 1
                            local ItemName = child:FindFirstChild("ItemName")
                            if ItemName then
                                ItemName = ItemName.Value
                            end
                            local Type = child:FindFirstChild("Type")
                            if Type then
                                Type = Type.Value
                            end
                            local MainCFrame = child:FindFirstChild("MainCFrame")
                            if MainCFrame then
                                MainCFrame = MainCFrame.Value
                                saveCFrameToFile(MainCFrame)
                            else
                                MainCFrame = child.Main.CFrame
                                saveCFrameToFile(MainCFrame)
                            end
    
                            -- Save MainCFrame to myfile.txt
                            
    
                            local NewPart    = Instance.new("Part")
                            NewPart.CFrame   = MainCFrame
                            NewPart.Position = NewPart.Position + Vector3.new(X, Y, Z)
    
                            if DesiredOwner and Type and ItemName and MainCFrame then
                                while child:IsDescendantOf(PlayerModels) do
                                    wait()
                                    local args = {
                                        [1] = ItemName,
                                        [2] = NewPart.CFrame,
                                        [3] = game:GetService("Players").LocalPlayer,
                                        [5] = child,
                                        [6] = true
                                    }
                                    game:GetService("ReplicatedStorage"):WaitForChild("PlaceStructure"):WaitForChild("ClientPlacedStructure"):FireServer(unpack(args))
                                end
                            end
    
                            NewPart:Destroy()
                            print("Teleported Part Named : ")
                            print(child.Name)
                            print("Teleported Total : ")
                            print(Count)
                            print("--------------------------------")
                        end
                    end
                end
            end
        end
    end

    if DoRedStone then
        for _, Structure in ipairs(RedStone) do
            for _, child in ipairs(PlayerModels:GetChildren()) do
                if child.Name == Structure then
                    local FoundOwner = child:FindFirstChild("Owner")
                    if FoundOwner then
                        FoundOwner = tostring(FoundOwner.Value):gsub("^%s*(.-)%s*$", "%1")
                        LocalPlayer = DesiredOwner:gsub("^%s*(.-)%s*$", "%1")
                        if FoundOwner == DesiredOwner then
                            Count = Count + 1
                            local ItemName = child:FindFirstChild("ItemName")
                            if ItemName then
                                ItemName = ItemName.Value
                            end
                            local Type = child:FindFirstChild("Type")
                            if Type then
                                Type = Type.Value
                            end
                            local MainCFrame = child:FindFirstChild("MainCFrame")
                            if MainCFrame then
                                MainCFrame = MainCFrame.Value
                                saveCFrameToFile(MainCFrame)
                            elseif child:FindFirstChild("Main") then
                                MainCFrame = child.Main.CFrame
                                saveCFrameToFile(MainCFrame)
                            elseif child:FindFirstChild("SquarePos") then
                                MainCFrame = child.SquarePos.Value
                                saveCFrameToFile(MainCFrame)
                            end
    
                            -- Save MainCFrame to myfile.txt
                            
    
                            local NewPart    = Instance.new("Part")
                            NewPart.CFrame   = MainCFrame
                            NewPart.Position = NewPart.Position + Vector3.new(X, Y, Z)
    
                            if DesiredOwner and Type and ItemName and MainCFrame then
                                while child:IsDescendantOf(PlayerModels) do
                                    wait()
                                    local args = {
                                        [1] = ItemName,
                                        [2] = NewPart.CFrame,
                                        [3] = game:GetService("Players").LocalPlayer,
                                        [5] = child,
                                        [6] = true
                                    }
                                    game:GetService("ReplicatedStorage"):WaitForChild("PlaceStructure"):WaitForChild("ClientPlacedStructure"):FireServer(unpack(args))
                                end
                            end
    
                            NewPart:Destroy()
                            print("Teleported Part Named : ")
                            print(child.Name)
                            print("Teleported Total : ")
                            print(Count)
                            print("--------------------------------")
                        end
                    end
                end
            end
        end
    end
end

BaseMover:Button("Start Teleport", function()
    StartTeleport()
end)

-- Caution Section

local Caution = BaseMoverTab:Section("Caution")
Caution:Button("Clear Saved Parts List", function()
    clearFileContents()
    print("Cleared Files, Hope It Wasnt a Mistake")
end)

-- Wires Section
local function StartMagenta()
    GetOffset()
    local Workspace = game.Workspace
    local PlayerModels = Workspace.PlayerModels
    local localplayer = game:GetService("Players").LocalPlayer

    for _, child in pairs(PlayerModels:GetChildren()) do
        if child.Name == "Wire" then
            local owner = child:FindFirstChild("Owner") and child.Owner.Value
            if owner == localplayer then
                while child and child:IsDescendantOf(Workspace) do
                    wait()
                    local wire = child
                    local end1 = wire:FindFirstChild("End1")
                    local end2 = wire:FindFirstChild("End2")

                    -- Ensure both ends exist before proceeding
                    if not end1 or not end2 then
                        print("Moved")
                        break
                    end

                    local end1pos = end1.Position
                    local end2pos = end2.Position

                    -- Add final1pos and store points between
                    local final1pos = end1pos + Vector3.new(X, Y, Z)
                    local final2pos = end2pos + Vector3.new(X, Y, Z)

                    -- Initialize args with only final1pos
                    local args = {
                        [1] = game:GetService("ReplicatedStorage"):WaitForChild("ClientItemInfo"):WaitForChild("IcicleWireMagenta"),
                        [2] = {
                            [1] = final1pos -- Start with final1pos
                        },
                        [3] = localplayer,
                        [4] = wire,
                        [5] = true
                    }

                    -- Add all intermediate points
                    for i = 2, 60 do
                        local endVar = wire:FindFirstChild("Point" .. i)
                        if endVar then
                            local finalPos = endVar.Position + Vector3.new(X, Y, Z)
                            table.insert(args[2], finalPos)
                        end
                    end

                    -- Add final2pos as the last point
                    table.insert(args[2], final2pos)

                    -- Fire the server event with the updated args
                    game:GetService("ReplicatedStorage"):WaitForChild("PlaceStructure"):WaitForChild("ClientPlacedWire"):FireServer(unpack(args))

                    -- Check again if the wire still exists after the remote call
                    if not child:IsDescendantOf(Workspace) then
                        print("Wire deleted. Stopping loop.")
                        break
                    end
                end
            end
        end
    end
    print("Completed")
end


local function StartNeon()
    GetOffset()
    for _, WireName in ipairs(NeonWires) do
        for _, child in ipairs(PlayerModels:GetChildren()) do
            if child.Name == "Wire" then
                local WireType = tostring(child.ItemName.Value)
                if WireType == WireName then
                    while child:IsDescendantOf(game.Workspace.PlayerModels) do
                        wait()
                        local wire = child
                        local end1 = wire:FindFirstChild("End1")
                        local end2 = wire:FindFirstChild("End2")

                        -- Ensure both ends exist before proceeding
                        if not end1 or not end2 then
                            print("Moved")
                            break
                        end

                        local end1pos = end1.Position
                        local end2pos = end2.Position

                        -- Add final1pos and store points between
                        local final1pos = end1pos + Vector3.new(X, Y, Z)
                        local final2pos = end2pos + Vector3.new(X, Y, Z)

                        -- Initialize args with only final1pos
                        local args = {
                            [1] = game:GetService("ReplicatedStorage"):WaitForChild("ClientItemInfo"):WaitForChild(WireName),
                            [2] = {
                                [1] = final1pos -- Start with final1pos
                            },
                            [3] = game:GetService("Players").LocalPlayer,
                            [4] = wire,
                            [5] = true
                        }

                        -- Add all intermediate points
                        for i = 2, 60 do
                            local endVar = wire:FindFirstChild("Point" .. i)
                            if endVar then
                                local finalPos = endVar.Position + Vector3.new(X, Y, Z)
                                table.insert(args[2], finalPos)
                            end
                        end

                        -- Add final2pos as the last point
                        table.insert(args[2], final2pos)

                        -- Fire the server event with the updated args
                        game:GetService("ReplicatedStorage"):WaitForChild("PlaceStructure"):WaitForChild("ClientPlacedWire"):FireServer(unpack(args))

                        -- Check again if the wire still exists after the remote call
                        if not child:IsDescendantOf(game.Workspace.PlayerModels) then
                            print("Wire deleted. Stopping loop.")
                            break
                        end
                    end
                end
            end
        end
    end
end


local function StartNormalWire()
    GetOffset()
    for _, WireName in ipairs(NormalWires) do
        for _, child in ipairs(PlayerModels:GetChildren()) do
            if child.Name == "Wire" then
                local WireType = tostring(child.ItemName.Value)
                if WireType == WireName then
                    while child:IsDescendantOf(game.Workspace.PlayerModels) do
                        wait()
                        local wire = child
                        local end1 = wire:FindFirstChild("End1")
                        local end2 = wire:FindFirstChild("End2")

                        -- Ensure both ends exist before proceeding
                        if not end1 or not end2 then
                            print("Moved")
                            break
                        end

                        local end1pos = end1.Position
                        local end2pos = end2.Position

                        -- Add final1pos and store points between
                        local final1pos = end1pos + Vector3.new(X, Y, Z)
                        local final2pos = end2pos + Vector3.new(X, Y, Z)
                        
                        -- Initialize args with only final1pos
                        local args = {
                            [1] = game:GetService("ReplicatedStorage"):WaitForChild("ClientItemInfo"):WaitForChild(WireName),
                            [2] = {
                                [1] = final1pos -- Start with final1pos
                            },
                            [3] = game:GetService("Players").LocalPlayer,
                            [4] = wire,
                            [5] = true
                        }

                        -- Add all intermediate points
                        for i = 2, 60 do
                            local endVar = wire:FindFirstChild("Point" .. i)
                            if endVar then
                                local finalPos = endVar.Position + Vector3.new(X, Y, Z)
                                table.insert(args[2], finalPos)
                            end
                        end

                        -- Add final2pos as the last point
                        table.insert(args[2], final2pos)

                        -- Fire the server event with the updated args
                        game:GetService("ReplicatedStorage"):WaitForChild("PlaceStructure"):WaitForChild("ClientPlacedWire"):FireServer(unpack(args))

                        -- Check again if the wire still exists after the remote call
                        if not child:IsDescendantOf(game.Workspace.PlayerModels) then
                            break
                        end
                    end
                end
            end
        end
    end
end



local Wires = BaseMoverTab:Section("Wires")
Wires:Button("Move Magenta Icecles", function()
    StartMagenta()
end)
Wires:Button("Move Neon Wires", function()
    StartNeon()
end)
Wires:Button("Move Normal Wires", function()
    StartNormalWire()
end)

--#endregion
--#region Wood Tab
local WoodTab = Luxt:Tab("Wood")
local Wood = WoodTab:Section("Plank Teleport")

-- Variables
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Selecting = false
local RunService = game:GetService("RunService")
local Count = 0

local Remote = game:GetService("ReplicatedStorage"):WaitForChild("Interaction"):WaitForChild("ClientIsDragging")
local RootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
local SetCord

local PingDivider = 4 -- By Default
local PingController = 0.01

-- Functions

function preciseWait(duration)
    local startTime = os.clock()
    local elapsedTime = 0

    while elapsedTime < duration do
        elapsedTime = os.clock() - startTime
        RunService.Heartbeat:Wait()
    end
end

isnetworkowner = newcclosure(function(part) return part.ReceiveAge == 0 end)

-- Check If Selecting
Wood:Toggle("Select Planks", function(isToggled)
    Selecting = isToggled
end)

-- Select Planks
local SelectedPlanks = {}

Mouse.Button1Down:Connect(function()
    if Selecting == true then
            local Target = Mouse.Target
        if Target.Parent.Name == "Plank" then
            local PlankOwner = Target.Parent:FindFirstChild("Owner")
            if PlankOwner then
                PlankOwner = tostring(PlankOwner.Value)
                if PlankOwner == game:GetService("Players").LocalPlayer.Name then
                    local TreeClass = tostring(Target.Parent.TreeClass.Value)
                    for _, child in ipairs(game.Workspace.PlayerModels:GetChildren()) do
                        if child.Name == "Plank" then
                            if tostring(child.TreeClass.Value) == TreeClass then
                                table.insert(SelectedPlanks, child)
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- Set Cordinates

local function SetCords()
    SetCord = RootPart.CFrame.Position
    local Part = Instance.new("Part")
    Part.Parent = game.Workspace
    Part.Anchored = true
    Part.Shape = Enum.PartType.Ball
    Part.Size = Vector3.new(3,3,3)
    Part.Position = SetCord
    Part.Color = Color3.fromRGB(116, 255, 82)
    Part.CanCollide = false
end

Wood:Button("Set Cordinates", function()
    SetCords()
end)

-- Ping Controller

Wood:Slider("Ping Controller", 1, 10, function(currentValue)
    PingController = (currentValue/100)
    print(PingController)
end)

-- Ping Divider

Wood:Slider("Ping Divider", 4, 1, function(currentValue)
    PingDivider = currentValue
    print(PingDivider)
end)

-- Teleport Planks
local function StartPlankTP()
    local StartTimed = os.clock()
    for _, child in ipairs(SelectedPlanks) do
        RootPart.Anchored = true
        RootPart.CFrame = CFrame.new(child.WoodSection.CFrame.Position + Vector3.new(5,0,0))
        RootPart.Anchored = false

        child.PrimaryPart = child.WoodSection

        for i=1, 1 do
            Remote:FireServer(child)
            while not isnetworkowner(child.PrimaryPart) do
                preciseWait(PingController)
                Remote:FireServer(child)
                end
                child:PivotTo(CFrame.new(SetCord))
                Remote:FireServer(child)

                child.WoodSection.Velocity = Vector3.new(0, 15, 0)
                child.WoodSection.RotVelocity = Vector3.new(0, 0, 0)

                local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
                Ping = Ping/1000
                Ping = Ping/PingDivider
                preciseWait(Ping)
                Count = Count + 1
                print("Teleported : " .. Count .. "    Ping is : " .. game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
        end
    end
    print("Teleported " ..  Count .. " In " .. (os.clock() - StartTimed))
    Count = 0
    table.clear(SelectedPlanks)
end

Wood:Button("Start Teleport", function()
    StartPlankTP()
end)

--#endregion
--#region Item tab
local ItemTab = Luxt:Tab("Item")
local Item = ItemTab:Section("Item Teleport")

-- Variables
local SelectingItems = false
local PingControllerItem = 0.01
local PingDividerItem = 4

-- Functions

function preciseWait(duration)
    local startTime = os.clock()
    local elapsedTime = 0

    while elapsedTime < duration do
        elapsedTime = os.clock() - startTime
        RunService.Heartbeat:Wait()
    end
end

isnetworkowner = newcclosure(function(part) return part.ReceiveAge == 0 end)

-- Selecting Item
Item:Toggle("Select Items", function(isToggled)
    SelectingItems = isToggled
end)

-- Item Selection

local SelectedItems = {}

Mouse.Button1Down:Connect(function()
    if SelectingItems == true then
        local Target = Mouse.Target
        if Target.Name == "Main" then
            local ItemOwner = Target.Parent:FindFirstChild("Owner")
            if ItemOwner then
                ItemOwner = tostring(ItemOwner.Value)
                if ItemOwner == game:GetService("Players").LocalPlayer.Name then
                    for _, child in ipairs(game.Workspace.PlayerModels:GetChildren()) do
                        if child.Name == Target.Parent.Name then
                            child.Name = "SelectedItem"
                            table.insert(SelectedItems, child)
                        end
                    end
                end
            end
        end
    end
end)

-- Set Cordinates

local function SetCords()
    SetCord = RootPart.CFrame.Position
    local Part = Instance.new("Part")
    Part.Parent = game.Workspace
    Part.Anchored = true
    Part.Shape = Enum.PartType.Ball
    Part.Size = Vector3.new(3,3,3)
    Part.Position = SetCord
    Part.Color = Color3.fromRGB(116, 255, 82)
    Part.CanCollide = false
end

Item:Button("Set Cordinates", function()
    SetCords()
end)

-- Ping Controller

Item:Slider("Ping Controller", 1, 10, function(currentValue)
    PingControllerItem = (currentValue/100)
    print(PingController)
end)

-- Ping Divider

Item:Slider("Ping Divider", 4, 1, function(currentValue)
    PingDividerItem = currentValue
    print(PingDivider)
end)

-- Item Teleport

local function StartItemTP()
    local StartTimed = os.clock()
    for _, child in ipairs(SelectedItems) do
        RootPart.Anchored = true
        RootPart.CFrame = CFrame.new(child.Main.CFrame.Position + Vector3.new(5,0,0))
        RootPart.Anchored = false

        child.PrimaryPart = child.Main

        for i=1, 1 do
            Remote:FireServer(child)
            while not isnetworkowner(child.PrimaryPart) do
                preciseWait(PingControllerItem)
                Remote:FireServer(child)
                end
                child:PivotTo(CFrame.new(SetCord))
                Remote:FireServer(child)

                child.Main.Velocity = Vector3.new(0, 15, 0)
                child.Main.RotVelocity = Vector3.new(0, 0, 0)

                local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
                Ping = Ping/1000
                Ping = Ping/PingDividerItem
                preciseWait(Ping)
                Count = Count + 1
                print("Teleported : " .. Count .. "    Ping is : " .. game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
        end
        child.Name = tostring(child.ItemName.Value)
    end
    print("Teleported " ..  Count .. " In " .. (os.clock() - StartTimed))
    Count = 0
    table.clear(SelectedItems)
end

Item:Button("Start Teleport", function()
    StartItemTP()
end)

--#endregion
--#region Wood Tp Same Place
-- Select all from Desired Owner
local DesiredOwnerPlanks = {}
local function GetAllPlanksDesired()
    for _, child in ipairs(PlayerModels:GetChildren()) do
        if child.Name == "Plank" then
            local OwnerOnPlank = child:FindFirstChild("Owner")
            if OwnerOnPlank then
                OwnerOnPlank = tostring(OwnerOnPlank.Value)
                if OwnerOnPlank == DesiredOwner then
                    table.insert(DesiredOwnerPlanks, child)
                end
            end
        end
    end
end

-- Teleport Planks
local function StartPlankTPSameSpot()
    GetAllPlanksDesired()
    local StartTimed = os.clock()
    GetOffset()
    for _, child in ipairs(DesiredOwnerPlanks) do
        RootPart.Anchored = true
        RootPart.CFrame = CFrame.new(child.WoodSection.CFrame.Position + Vector3.new(5,0,0))
        RootPart.Anchored = false

        child.PrimaryPart = child.WoodSection

        for i=1, 1 do
            Remote:FireServer(child)
            while not isnetworkowner(child.PrimaryPart) do
                preciseWait(PingController)
                Remote:FireServer(child)
                end
                child:PivotTo(CFrame.new(child.WoodSection.Position + OffsetFound))
                Remote:FireServer(child)

                child.WoodSection.Velocity = Vector3.new(0, 15, 0)
                child.WoodSection.RotVelocity = Vector3.new(0, 0, 0)

                local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
                Ping = Ping/1000
                Ping = Ping/PingDivider
                preciseWait(Ping)
                Count = Count + 1
                print("Teleported : " .. Count .. "    Ping is : " .. game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
        end
    end
    print("Teleported " ..  Count .. " In " .. (os.clock() - StartTimed))
    Count = 0
    table.clear(DesiredOwnerPlanks)
end

local WoodSameSection = BaseMoverTab:Section("Wood")

WoodSameSection:Button("Teleport Planks (Same Spot)", function()
    StartPlankTPSameSpot()
end)

--#endregion
--#region Teleport Item to Same Spot
local DesiredOwnerAllItems = {}
local function SelectAllItems()
    for _, child in ipairs(game.Workspace.PlayerModels:GetChildren()) do
        local Owner = child:FindFirstChild("Owner")
        if Owner then
            Owner = tostring(Owner.Value)
            if Owner == DesiredOwner then
                local TypeOfChildGot = tostring(child.Type.Value)
                if TypeOfChildGot == "Loose Item" or TypeOfChildGot == "Gift" or TypeOfChildGot == "Tool" then
                    table.insert(DesiredOwnerAllItems, child)
                end
            end
        end
    end
end

local function StartAllItemTeleport()
    GetOffset()
    SelectAllItems()
    local StartTimed = os.clock()
    for _, child in ipairs(DesiredOwnerAllItems) do
        RootPart.Anchored = true
        RootPart.CFrame = CFrame.new(child.Main.CFrame.Position + Vector3.new(5,0,0))
        RootPart.Anchored = false

        child.PrimaryPart = child.Main

        for i=1, 1 do
            Remote:FireServer(child)
            while not isnetworkowner(child.PrimaryPart) do
                preciseWait(PingControllerItem)
                Remote:FireServer(child)
                end
                child:PivotTo(CFrame.new(child.Main.CFrame.Position + OffsetFound))
                Remote:FireServer(child)

                child.Main.Velocity = Vector3.new(0, 15, 0)
                child.Main.RotVelocity = Vector3.new(0, 0, 0)

                local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
                Ping = Ping/1000
                Ping = Ping/PingControllerItem
                preciseWait(Ping)
                Count = Count + 1
                print("Teleported : " .. Count .. "    Ping is : " .. game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
        end
    end
    print("Teleported " ..  Count .. " In " .. (os.clock() - StartTimed))
    Count = 0
    table.clear(DesiredOwnerAllItems)
end

local ItemSameSpot = BaseMoverTab:Section("Items")
ItemSameSpot:Button("Teleport Items", function()
    StartAllItemTeleport()
end)
--#endregion
--#region Slot Tab
local SlotTab = Luxt:Tab("Slot")
local Property = SlotTab:Section("Property")

-- Free Land
function FreeLand()
    for i,v in next, game:GetService("Workspace").Properties:GetChildren() do
        if v:FindFirstChild("Owner") and v.Owner.Value == nil then
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientPurchasedProperty:FireServer(v,v.OriginSquare.Position)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.OriginSquare.CFrame + Vector3.new(0,2,0)
            break
        end
    end
end
Property:Button("Free Land", function()
    FreeLand()
end)

-- Max Land
function MaxLand()
    for s,d in pairs(workspace.Properties:GetChildren()) do
        if d:FindFirstChild("Owner") and d:FindFirstChild("OriginSquare") and d.Owner.Value == game.Players.LocalPlayer then
            local PlotPos = d.OriginSquare.Position
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 40, PlotPos.Y, PlotPos.Z))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 40, PlotPos.Y, PlotPos.Z))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X , PlotPos.Y, PlotPos.Z + 40))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X , PlotPos.Y, PlotPos.Z - 40))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 40 , PlotPos.Y, PlotPos.Z + 40))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 40 , PlotPos.Y, PlotPos.Z - 40))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 40 , PlotPos.Y, PlotPos.Z + 40))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 40 , PlotPos.Y, PlotPos.Z - 40))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 80 , PlotPos.Y, PlotPos.Z))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 80 , PlotPos.Y, PlotPos.Z))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X , PlotPos.Y, PlotPos.Z + 80))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X , PlotPos.Y, PlotPos.Z - 80))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 80 , PlotPos.Y, PlotPos.Z + 80))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 80 , PlotPos.Y, PlotPos.Z - 80))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 80 , PlotPos.Y, PlotPos.Z + 80))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 80 , PlotPos.Y, PlotPos.Z - 80))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 40 , PlotPos.Y, PlotPos.Z + 80))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 40 , PlotPos.Y, PlotPos.Z + 80))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 80 , PlotPos.Y, PlotPos.Z + 40))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 80 , PlotPos.Y, PlotPos.Z - 40))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 80 , PlotPos.Y, PlotPos.Z + 40))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 80 , PlotPos.Y, PlotPos.Z - 40))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 40 , PlotPos.Y, PlotPos.Z - 80))
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 40 , PlotPos.Y, PlotPos.Z - 80))
        end
    end
end
Property:Button("Max Land", function()
    MaxLand()
end)

-- Sell Sold Sign
function SellSoldSign()
    for i,v in next, game:GetService("Workspace").PlayerModels:GetChildren() do
        if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
            if v:FindFirstChild("ItemName") and v.ItemName.Value == "PropertySoldSign" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Main.CFrame.p) + Vector3.new(0,0,2)
                game:GetService("ReplicatedStorage").Interaction.ClientInteracted:FireServer(v,"Take down sold sign")
                for i = 1,30 do
                    game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
                    v.Main.CFrame = CFrame.new(314.54, -0.5, 86.823)
                    task.wait()
                end
            end
        end
    end
end
Property:Button("Sell Sign", function()
    SellSoldSign()
end)

--#endregion
--#region World tab
local WorldTab = Luxt:Tab("World")
local World = WorldTab:Section("Misc")

World:Button("Better Graphics", function()
    local Lighting = game.Lighting
    local ColorCorrection = game.Lighting.ColorCorrection
    local Blur = Instance.new("BlurEffect")
    local SunRays = Instance.new("SunRaysEffect")
    local Bloom = Instance.new("BloomEffect")
  
    Blur.Parent = Lighting
    SunRays.Parent = Lighting
    Bloom.Parent = Lighting
  
    Blur.Enabled = true
    Blur.Size = 3
  
    SunRays.Enabled = true
    SunRays.Intensity = 0.2
    SunRays.Spread = 1
  
    Bloom.Enabled = true
    Bloom.Intensity = 1
    Bloom.Size = 32
    Bloom.Threshold = 1
    
    Lighting.FogColor = Color3.fromRGB(120, 150, 200)
    Lighting.GeographicLatitude = 500
    Lighting.Brightness = 0.1
    Lighting.FogEnd = 750
    Lighting.FogStart = 0
    Lighting.OutdoorAmbient = Color3.fromRGB(112, 117, 128)
    
    ColorCorrection.Brightness = 0.1
    ColorCorrection.Contrast = 0.15
    ColorCorrection.Enabled = true
    ColorCorrection.Saturation = 0.25
    ColorCorrection.TintColor = Color3.fromRGB(255, 222, 211)
    
    --delete--
    Lighting.Owner:Destroy()
    Lighting.Spook:Destroy()
    Lighting.SunPos:Destroy()
end)

-- No Fog
World:Button("Remove Fog", function()
    game.Lighting.FogStart = 9999
    game.Lighting.FogEnd = 9999
end)

-- Day Time
local Day
    World:Toggle("Day", function(isToggled)
    Day = isToggled
end)

local lighting = game:GetService("Lighting")
function updateLighting()
        lighting.TimeOfDay = "12:00:00"
        lighting.SunPos.Value = 1
        lighting.Ambient = Color3.new(1, 1, 1)

        lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
        lighting.ColorShift_Top = Color3.new(1, 1, 1)
end
game.Lighting.Changed:Connect(function()
    if Day then
        updateLighting()
    end
end)

--#endregion
