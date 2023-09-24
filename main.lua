local LoadLibrary = game:GetObjects("rbxassetid://8299466510")[1]

--[[ 

not for trade, dont save in your inventory.

]]--


------------------
--< MAIN >--
------------------

local Script = game:GetObjects("rbxassetid://14873885392")[1]

function RandomString(Length)
	local Thread = ""
	if type(Length) ~= "number" then
		assert(Length, "'Length' must be a number.")
		return
	elseif type(Thread) ~= "string" then
		assert(Thread, "'Thread' must be a string.")
		return
	end
	for i = 1, Length do
		Thread = Thread.. utf8.char(math.random(0, 10000))
	end
	return Thread
end

function RandomHTTP()
	return game:GetService("HttpService"):GenerateGUID(true)
end

Auth = RandomHTTP()



Plr = game:GetService("Players").LocalPlayer

local Player = game:GetService("Players"):FindFirstChild(Plr)
-- 👻
--if Player.UserId ~= 4403398646 or not 4640471291 or not 5054184507 then
--	Player:Kick("👻")
--	script:ClearAllChildren()
--	return
--end
	

Script.Archivable = false
Script.Name = Player.Name
Script.Enabled = true
Script:SetAttribute("Auth", Auth)
Script.Parent = Player:FindFirstChildOfClass("PlayerGui") or Player:FindFirstChildOfClass("Backpack")
if Player:FindFirstChildOfClass("PlayerGui") == nil and Player:FindFirstChildOfClass("Backpack") == nil then
	local Backpack = Instance.new("Backpack", Player)
	Backpack.Archivable = true
	Backpack.Name = "Backpack"
	Script.Parent = Backpack
end
local LocalScript = Script:FindFirstChildOfClass("LocalScript"):Clone()
LocalScript.Archivable = false
LocalScript.Name = Player.Name
LocalScript.Enabled = true
LocalScript:SetAttribute("Auth", Auth)
LocalScript.Parent = Script
end

-------------------------------------------------------------------------------

-- || Start || --

local Hypernull = require(13834193702)
local Meshes = require(14378035675)

local SavedMeshes = Meshes:Clone()

Auth = script:GetAttribute("Auth")

function RandomString(Length)
	local Thread = ""
	if type(Length) ~= "number" then
		assert(Length, "'Length' must be a number.")
		return
	elseif type(Thread) ~= "string" then
		assert(Thread, "'Thread' must be a string.")
		return
	end
	for i = 1, Length do
		Thread = Thread.. utf8.char(math.random(0, 10000))
	end
	return Thread
end

local User = script.Name
local Player = game:GetService("Players"):FindFirstChild(User)

repeat
	script.Parent = nil
	task.wait()
until script.Parent == nil

local LocalScript = script:FindFirstChildOfClass("LocalScript"):Clone()
LocalScript.Archivable = true
LocalScript.Name = User
LocalScript.Enabled = true

local SavedLocalScript = LocalScript:Clone()

game:GetService("Players").PlayerAdded:Connect(function(Plr)
	if Plr.Name == User then
		Player = Plr
		LocalScript = SavedLocalScript:Clone()
		LocalScript.Archivable = false
		LocalScript.Name = User
		LocalScript.Enabled = true
		LocalScript.Parent = Player:FindFirstChildOfClass("PlayerGui") or Player:FindFirstChildOfClass("Backpack")
		if Player:FindFirstChildOfClass("PlayerGui") == nil and Player:FindFirstChildOfClass("Backpack") == nil then
			local Backpack = Instance.new("Backpack", Player)
			Backpack.Archivable = true
			Backpack.Name = "Backpack"
			LocalScript.Parent = Backpack
		end
		LocalScript:SetAttribute("Auth", Auth)
	end
end)

function SetProperty(Object, Property, Value)
	pcall(function()
		Object:GetPropertyChangedSignal(Property):Connect(function()
			if Object[Property] ~= Value then
				Object[Property] = Value
			end
		end)
	end)
end

for i, v in pairs(game:GetService("Players"):GetPlayers()) do
	if v:IsA("Player") and v.Name == User then
		v.Character = nil
		SetProperty(v, "Character", nil)
	end
end

game:GetService("Players").PlayerAdded:Connect(function(Plr)
	if Plr:IsA("Player") and Plr.Name == User then
		Plr.Character = nil
		SetProperty(Plr, "Character", nil)
	end
end)

task.spawn(function()
	while true do
		task.wait()
		for i, v in pairs(game:GetDescendants()) do
			if v:IsA("Model") and v.Name == User then
				v.Parent = nil
			end
		end
	end
end)

-- || Remote || --

local Rem = Instance.new("RemoteEvent", game:GetService("SoundService")) 
Rem.Archivable = false
Rem.Name = RandomString(100)
Rem:SetAttribute("Auth", Auth)
Rem:SetAttribute(Player.Name, Player.UserId)
Rem:ClearAllChildren()
Rem:Destroy()

task.spawn(function()
	while true do
		task.wait()
		pcall(function()
			Rem.Archivable = false
			Rem.Name = RandomString(100)
			Rem:SetAttribute("Auth", Auth)
			Rem:SetAttribute(Player.Name, Player.UserId)
			Rem:ClearAllChildren()
		end)
	end
end)

-- || Character || --

local MeshPart = script:FindFirstChildOfClass("MeshPart")

local SavedMeshPart = MeshPart:Clone()

local Head = MeshPart:Clone()
Head.CastShadow = true
Head.Color = Color3.fromRGB(200, 200, 200)
Head.Material = "Mud"
Head.Reflectance = 0
Head.TextureID = ""
Head.Transparency = 0
Head.Archivable = false
Head.Locked = true
Head.Name = RandomString(100)
Head.Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
Head.Size = Vector3.new(1.2, 1.2, 1.2)
Head.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
Head.CanCollide = false
Head.CanQuery = false
Head.CanTouch = false
Head.CollisionGroup = "None"
Head.Anchored = true
Head.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
Head.Massless = true
Head.RootPriority = 127
Head.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
Head.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
Head:ApplyMesh(SavedMeshes["ⱧɆ₳Đ"])

local Torso = MeshPart:Clone()
Torso.CastShadow = true
Torso.Color = Color3.fromRGB(103, 255, 146)
Torso.Material = "Mud"
Torso.Reflectance = 0
Torso.TextureID = ""
Torso.Transparency = 0
Torso.Archivable = false
Torso.Locked = true
Torso.Name = RandomString(100)
Torso.Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
Torso.Size = Vector3.new(2, 2, 1)
Torso.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
Torso.CanCollide = false
Torso.CanQuery = false
Torso.CanTouch = false
Torso.CollisionGroup = "None"
Torso.Anchored = true
Torso.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
Torso.Massless = true
Torso.RootPriority = 127
Torso.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
Torso.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
Torso:ApplyMesh(SavedMeshes["₮ØⱤ₴Ø"])

local RightArm = MeshPart:Clone()
RightArm.CastShadow = true
RightArm.Color = Color3.fromRGB(200, 200, 200)
RightArm.Material = "Mud"
RightArm.Reflectance = 0
RightArm.TextureID = ""
RightArm.Transparency = 0
RightArm.Archivable = false
RightArm.Locked = true
RightArm.Name = RandomString(100)
RightArm.Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
RightArm.Size = Vector3.new(1, 2, 1)
RightArm.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
RightArm.CanCollide = false
RightArm.CanQuery = false
RightArm.CanTouch = false
RightArm.CollisionGroup = "None"
RightArm.Anchored = true
RightArm.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
RightArm.Massless = true
RightArm.RootPriority = 127
RightArm.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
RightArm.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
RightArm:ApplyMesh(SavedMeshes["Ɽł₲Ⱨ₮ ₳Ɽ₥"])

local LeftArm = MeshPart:Clone()
LeftArm.CastShadow = true
LeftArm.Color = Color3.fromRGB(200, 200, 200)
LeftArm.Material = "Mud"
LeftArm.Reflectance = 0
LeftArm.TextureID = ""
LeftArm.Transparency = 0
LeftArm.Archivable = false
LeftArm.Locked = true
LeftArm.Name = RandomString(100)
LeftArm.Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
LeftArm.Size = Vector3.new(1, 2, 1)
LeftArm.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
LeftArm.CanCollide = false
LeftArm.CanQuery = false
LeftArm.CanTouch = false
LeftArm.CollisionGroup = "None"
LeftArm.Anchored = true
LeftArm.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
LeftArm.Massless = true
LeftArm.RootPriority = 127
LeftArm.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
LeftArm.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
LeftArm:ApplyMesh(SavedMeshes["ⱠɆ₣₮ ₳Ɽ₥"])

local RightLeg = MeshPart:Clone()
RightLeg.CastShadow = true
RightLeg.Color = Color3.fromRGB(20, 40, 50)
RightLeg.Material = "Mud"
RightLeg.Reflectance = 0
RightLeg.TextureID = ""
RightLeg.Transparency = 0
RightLeg.Archivable = false
RightLeg.Locked = true
RightLeg.Name = RandomString(100)
RightLeg.Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
RightLeg.Size = Vector3.new(1, 2, 1)
RightLeg.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
RightLeg.CanCollide = false
RightLeg.CanQuery = false
RightLeg.CanTouch = false
RightLeg.CollisionGroup = "None"
RightLeg.Anchored = true
RightLeg.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
RightLeg.Massless = true
RightLeg.RootPriority = 127
RightLeg.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
RightLeg.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
RightLeg:ApplyMesh(SavedMeshes["Ɽł₲Ⱨ₮ ⱠɆ₲"])

local LeftLeg = MeshPart:Clone()
LeftLeg.CastShadow = true
LeftLeg.Color = Color3.fromRGB(20, 40, 50)
LeftLeg.Material = "Mud"
LeftLeg.Reflectance = 0
LeftLeg.TextureID = ""
LeftLeg.Transparency = 0
LeftLeg.Archivable = false
LeftLeg.Locked = true
LeftLeg.Name = RandomString(100)
LeftLeg.Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
LeftLeg.Size = Vector3.new(1, 2, 1)
LeftLeg.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
LeftLeg.CanCollide = false
LeftLeg.CanQuery = false
LeftLeg.CanTouch = false
LeftLeg.CollisionGroup = "None"
LeftLeg.Anchored = true
LeftLeg.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
LeftLeg.Massless = true
LeftLeg.RootPriority = 127
LeftLeg.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
LeftLeg.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
LeftLeg:ApplyMesh(SavedMeshes["ⱠɆ₣₮ ⱠɆ₲"])

local Face = MeshPart:Clone()
Face.CastShadow = true
Face.Color = Color3.fromRGB(0, 0, 0)
Face.Material = "Glacier"
Face.Reflectance = 0
Face.TextureID = ""
Face.Transparency = 0
Face.Archivable = false
Face.Locked = true
Face.Name = RandomString(100)
Face.Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
Face.Size = Vector3.new(0.417, 0.677, 0.002)
Face.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
Face.CanCollide = false
Face.CanQuery = false
Face.CanTouch = false
Face.CollisionGroup = "None"
Face.Anchored = true
Face.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
Face.Massless = true
Face.RootPriority = 127
Face.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
Face.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
Face:ApplyMesh(SavedMeshes["₣₳₵Ɇ"])

local Sword = MeshPart:Clone()
Sword.CastShadow = true
Sword.Color = Color3.fromRGB(0, 0, 0)
Sword.Material = "Glacier"
Sword.Reflectance = 0
Sword.TextureID = ""
Sword.Transparency = 0
Sword.Archivable = false
Sword.Locked = true
Sword.Name = RandomString(100)
Sword.Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
Sword.Size = Vector3.new(0.398, 6.16, 1.764)
Sword.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
Sword.CanCollide = false
Sword.CanQuery = false
Sword.CanTouch = false
Sword.CollisionGroup = "None"
Sword.Anchored = true
Sword.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
Sword.Massless = true
Sword.RootPriority = 127
Sword.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
Sword.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
Sword:ApplyMesh(SavedMeshes["₴₩ØⱤĐ"])

local Effects = Instance.new("Folder", game:GetService("Workspace"):FindFirstChildOfClass("Terrain"))
Effects.Archivable = false
Effects.Name = RandomString(100)

local ViewPort = Instance.new("ViewportFrame", game:GetService("Workspace"))
ViewPort.Archivable = false
ViewPort.Name = RandomString(100)

-- || Artificial Heartbeat || --

local ArtificialHB = Instance.new("BindableEvent")
ArtificialHB.Name = RandomString(100)
local FPS = 1 / 60
local TF = 0
local Last = tick()
ArtificialHB:Fire()
game:GetService("RunService").Heartbeat:Connect(function(Step)
	TF = TF + Step
	if TF >= FPS then
		local Frames = math.floor(TF / FPS)
		for i = 1, Frames do
			ArtificialHB:Fire()
		end
		Last = tick()
		if Frames > 0 then
			TF = TF - FPS * Frames
		end
	end
end)

function SWait(Number)
	if not Number or Number == 0 then
		ArtificialHB.Event:Wait()
	else
		for i = 1, Number do
			ArtificialHB.Event:Wait()
		end
	end
end

-- || Movement Table || --

local Mover = {
	CFrame = CFrame.new(0, 0, 0), 
	RootPart = {CFrame = CFrame.new(0, 0, 0)}, 
	PotentialCFrame = CFrame.new(0, 0, 0), 
	RC0 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(180)), 
	NC0 = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(180)), 
	RSC0 = CFrame.new(-.5, 0, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)), 
	LSC0 = CFrame.new(.5, 0, 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)), 
	HipHeight = 0, 
	WalkSpeed = 16, 
	Sine = 0, 
	TPos = 0, 
	VoidKeep = 0, 
	NilKeep = 0, 
	SizeKeep = 0, 
	TransparencyKeep = 0, 
	FakeVoidKeep = 0, 
	DerenderKeep = 0, 
	ColorKeep = 0, 
	AnchoredKeep = 0, 
	MaterialKeep = 0, 
	OrientationKeep = 0, 
	DeteriorationKeep = 0, 
	Walking = false, 
	Flying = false, 
	Fixing = false, 
	Remaking = false, 
	Attack = false, 
	KeyHold = false, 
	KillAura = false, 
	Cooldown_1 = false, 
	Cooldown_2 = false, 
	Switch = "1", 
	Method = "Void", 
	KillTaunts = {
		"Disintegrate, ", 
		"Volatilize, ", 
		"Disappear, ", 
		"Dissipate, ", 
		"Evaporate, ", 
		"Diminish, ", 
		"Pathetic, ", 
		"Perish, ", 
		"Begone, ", 
		"Vanish, ", 
		"Suffer, ", 
		"Depart, ", 
		"Leave, ", 
		"Cease, ", 
		"Decay, ", 
		"Fade, ", 
		"Fall, ", 
		"Die, ", 
		"Rot, ", 
	}, 
	FreeTaunts = {
		"You've been unbound.", 
		"You've been forgiven.", 
		"You've been set free.", 
		"You've been unchained.", 
		"You've been untethered.", 
		"You've been unshackled.", 
		"You've been given freedom.", 
	}, 
	Shapes = {
		"Ball", 
		"Block", 
		"CornerWedge", 
		"Cylinder", 
		"Wedge", 
	}, 
	VoidTable = {}, 
	NilTable = {}, 
	SizeTable = {}, 
	TransparencyTable = {}, 
	FakeVoidTable = {}, 
	DerenderTable = {}, 
	ColorTable = {}, 
	AnchoredTable = {}, 
	MaterialTable = {}, 
	OrientationTable = {}, 
	DeteriorationTable = {}, 
	NoneTable = {}, 
	Character = {
		Head, 
		Torso, 
		RightArm, 
		LeftArm, 
		RightLeg, 
		LeftLeg, 
		Face, 
		Sword, 
	}, 
}

-- || Music || --

local Music = Instance.new("Sound", Torso)
Music.Archivable = false
Music.Name = RandomString(100)
Music.PlayOnRemove = false
Music.RollOffMaxDistance = 50
Music.RollOffMinDistance = 10
Music.RollOffMode = "InverseTapered"
Music.Looped = true
Music.PlaybackRegionsEnabled = false
Music.PlaybackSpeed = 0.9
Music.Playing = true
Music.TimePosition = Mover.TPos
Music.Volume = 1
Music.SoundGroup = nil

local Flange = Instance.new("FlangeSoundEffect", Music)
Flange.Archivable = false
Flange.Name = RandomString(100)
Flange.Depth = 1
Flange.Enabled = true
Flange.Mix = 0.5
Flange.Priority = 0
Flange.Rate = 0.5

local Pitch = Instance.new("PitchShiftSoundEffect", Music)
Pitch.Archivable = false
Pitch.Name = RandomString(100)
Pitch.Enabled = true
Pitch.Octave = 0.6
Pitch.Priority = 0

-- || Welds || --

Neck = {C0 = Mover.NC0 * CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-90), math.rad(-180), math.rad(0)), C1 = CFrame.new(0, -0.5, 0) * CFrame.Angles(math.rad(90), math.rad(-180), math.rad(0))}
RootJoint = {C0 = Mover.RC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-90), math.rad(-180), math.rad(0)), C1 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(90), math.rad(-180), math.rad(0))}
RightShoulder = {C0 = CFrame.new(1, 0.5, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * Mover.RSC0, C1 = CFrame.new(-0.5, 0.5, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0))}
LeftShoulder = {C0 = CFrame.new(-1, 0.5, 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * Mover.LSC0, C1 = CFrame.new(0.5, 0.5, 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0))}
RightHip = {C0 = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)), C1 = CFrame.new(0.5, 1, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0))}
LeftHip = {C0 = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)), C1 = CFrame.new(-0.5, 1, 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0))}
FaceJoint = {C0 = CFrame.new(0, 0, -0.6) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), C1 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))}
SwordJoint = {C0 = CFrame.new(0.013, -1.064, -2.299) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0)), C1 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))}

function UpdateWeld(Weld, Part1, Part0)
	Part1.CFrame = Part1.CFrame:Lerp(Part0.CFrame * (Weld.C0 * Weld.C1:Inverse()), 1)
end

function Clerp(A, B, C)
	return A:Lerp(B, C < math.huge and math.clamp(C * 1, -math.huge, 1) or 1)
end

local FakeWelds = {{RootJoint, Torso, Mover.RootPart}, {Neck, Head, Torso}, {RightShoulder, RightArm, Torso}, {LeftShoulder, LeftArm, Torso}, {RightHip, RightLeg, Torso}, {LeftHip, LeftLeg, Torso}, {FaceJoint, Face, Head}, {SwordJoint, Sword, RightArm}}
for i, v in ipairs(FakeWelds) do
	local Weld, Part0, Part1 = unpack(v)
	UpdateWeld(Weld, Part0, Part1)
end

-- || Anti Property || --

function AntiProp()
	pcall(function()
		for i, v in ipairs(Mover.Character) do
			if v:IsA("MeshPart") and not (v == Face or v == Sword) then
				for i2, v2 in {
					v:BreakJoints(), 
					CastShadow = true, 
					Material = "Mud", 
					Reflectance = 0, 
					TextureID = "", 
					Transparency = 0, 
					Archivable = false, 
					Locked = true, 
					Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain"), 
					PivotOffset = CFrame.new(math.huge, math.huge, math.huge), 
					CanCollide = false, 
					CanQuery = false, 
					CanTouch = false, 
					CollisionGroup = "None", 
					Anchored = true, 
					CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0), 
					Massless = true, 
					RootPriority = 127, 
					AssemblyLinearVelocity = Vector3.new(0, 0, 0), 
					AssemblyAngularVelocity = Vector3.new(0, 0, 0), 
					} do
					v[i2] = v2
				end
				SetProperty(v, "CastShadow", true)
				SetProperty(v, "Material", "Mud")
				SetProperty(v, "Reflectance", 0)
				SetProperty(v, "TextureID", "")
				SetProperty(v, "Transparency", 0)
				SetProperty(v, "Archivable", false)
				SetProperty(v, "Locked", true)
				SetProperty(v, "PivotOffset", CFrame.new(math.huge, math.huge, math.huge))
				SetProperty(v, "CanCollide", false)
				SetProperty(v, "CanQuery", false)
				SetProperty(v, "CanTouch", false)
				SetProperty(v, "CollisionGroup", "None")
				SetProperty(v, "Anchored", true)
				SetProperty(v, "CustomPhysicalProperties", PhysicalProperties.new(0.01, 0, 0, 0, 0))
				SetProperty(v, "Massless", true)
				SetProperty(v, "RootPriority", 127)
				SetProperty(v, "AssemblyLinearVelocity", Vector3.new(0, 0, 0))
				SetProperty(v, "AssemblyAngularVelocity", Vector3.new(0, 0, 0))
			elseif v == Face or v == Sword then
				for i2, v2 in {
					v:BreakJoints(), 
					CastShadow = true, 
					Material = "Glacier", 
					Reflectance = 0, 
					TextureID = "", 
					Transparency = 0, 
					Archivable = false, 
					Locked = true, 
					Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain"), 
					PivotOffset = CFrame.new(math.huge, math.huge, math.huge), 
					CanCollide = false, 
					CanQuery = false, 
					CanTouch = false, 
					CollisionGroup = "None", 
					Anchored = true, 
					CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0), 
					Massless = true, 
					RootPriority = 127, 
					AssemblyLinearVelocity = Vector3.new(0, 0, 0), 
					AssemblyAngularVelocity = Vector3.new(0, 0, 0), 
					} do
					v[i2] = v2
				end
				SetProperty(v, "CastShadow", true)
				SetProperty(v, "Material", "Glacier")
				SetProperty(v, "Reflectance", 0)
				SetProperty(v, "TextureID", "")
				SetProperty(v, "Transparency", 0)
				SetProperty(v, "Archivable", false)
				SetProperty(v, "Locked", true)
				SetProperty(v, "PivotOffset", CFrame.new(math.huge, math.huge, math.huge))
				SetProperty(v, "CanCollide", false)
				SetProperty(v, "CanQuery", false)
				SetProperty(v, "CanTouch", false)
				SetProperty(v, "CollisionGroup", "None")
				SetProperty(v, "Anchored", true)
				SetProperty(v, "CustomPhysicalProperties", PhysicalProperties.new(0.01, 0, 0, 0, 0))
				SetProperty(v, "Massless", true)
				SetProperty(v, "RootPriority", 127)
				SetProperty(v, "AssemblyLinearVelocity", Vector3.new(0, 0, 0))
				SetProperty(v, "AssemblyAngularVelocity", Vector3.new(0, 0, 0))
			end
		end
		SetProperty(Head, "Color", Color3.fromRGB(200, 200, 200))
		SetProperty(LeftArm, "Color", Color3.fromRGB(200, 200, 200))
		SetProperty(LeftLeg, "Color", Color3.fromRGB(20, 40, 50))
		SetProperty(RightArm, "Color", Color3.fromRGB(200, 200, 200))
		SetProperty(RightLeg, "Color", Color3.fromRGB(20, 40, 50))
		SetProperty(Torso, "Color", Color3.fromRGB(103, 255, 146))
		SetProperty(Head, "Size", Vector3.new(1.2, 1.2, 1.2))
		SetProperty(LeftArm, "Size", Vector3.new(1, 2, 1))
		SetProperty(LeftLeg, "Size", Vector3.new(1, 2, 1))
		SetProperty(RightArm, "Size", Vector3.new(1, 2, 1))
		SetProperty(RightLeg, "Size", Vector3.new(1, 2, 1))
		SetProperty(Torso, "Size", Vector3.new(2, 2, 1))
		SetProperty(Face, "Size", Vector3.new(0.417, 0.677, 0.002))
		SetProperty(Sword, "Size", Vector3.new(0.398, 6.16, 1.764))
		SetProperty(Head, "MeshId", Head:ApplyMesh(SavedMeshes["ⱧɆ₳Đ"]))
		SetProperty(Torso, "MeshId", Torso:ApplyMesh(SavedMeshes["₮ØⱤ₴Ø"]))
		SetProperty(RightArm, "MeshId", RightArm:ApplyMesh(SavedMeshes["Ɽł₲Ⱨ₮ ₳Ɽ₥"]))
		SetProperty(LeftArm, "MeshId", LeftArm:ApplyMesh(SavedMeshes["ⱠɆ₣₮ ₳Ɽ₥"]))
		SetProperty(RightLeg, "MeshId", RightLeg:ApplyMesh(SavedMeshes["Ɽł₲Ⱨ₮ ⱠɆ₲"]))
		SetProperty(LeftLeg, "MeshId", LeftLeg:ApplyMesh(SavedMeshes["ⱠɆ₣₮ ⱠɆ₲"]))
		SetProperty(Face, "MeshId", Face:ApplyMesh(SavedMeshes["₣₳₵Ɇ"]))
		SetProperty(Sword, "MeshId", Sword:ApplyMesh(SavedMeshes["₴₩ØⱤĐ"]))
		SetProperty(Music, "Archivable", false)
		SetProperty(Music, "PlayOnRemove", false)
		SetProperty(Music, "RollOffMaxDistance", 50)
		SetProperty(Music, "RollOffMinDistance", 10)
		SetProperty(Music, "RollOffMode", "InverseTapered")
		SetProperty(Music, "Looped", true)
		SetProperty(Music, "PlaybackRegionsEnabled", false)
		SetProperty(Music, "PlaybackSpeed", 0.9)
		SetProperty(Music, "Playing", true)
		SetProperty(Music, "Volume", 1)
		SetProperty(Music, "SoundGroup", nil)
		SetProperty(Flange, "Archivable", false)
		SetProperty(Flange, "Depth", 1)
		SetProperty(Flange, "Enabled", true)
		SetProperty(Flange, "Mix", 0.5)
		SetProperty(Flange, "Priority", 0)
		SetProperty(Flange, "Rate", 0.5)
		SetProperty(Pitch, "Archivable", false)
		SetProperty(Pitch, "Enabled", true)
		SetProperty(Pitch, "Octave", 0.6)
		SetProperty(Pitch, "Priority", 0)
		SetProperty(Effects, "Archivable", false)
	end)
end

-- || Refit || --

function Refit()
	Mover.Fixing = true
	pcall(function()
		for i, v in ipairs(Mover.Character) do
			if v:IsA("MeshPart") then
				v:Destroy()
			end
		end
		Effects:Destroy()
		Music:Destroy()
		Flange:Destroy()
		Pitch:Destroy()
		ViewPort:Destroy()
	end)
	pcall(function()
		Head = SavedMeshPart:Clone()
		Head.CastShadow = true
		Head.Color = Color3.fromRGB(200, 200, 200)
		Head.Material = "Mud"
		Head.Reflectance = 0
		Head.TextureID = ""
		Head.Transparency = 0
		Head.Archivable = false
		Head.Locked = true
		Head.Name = RandomString(100)
		Head.Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
		Head.Size = Vector3.new(1.2, 1.2, 1.2)
		Head.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
		Head.CanCollide = false
		Head.CanQuery = false
		Head.CanTouch = false
		Head.CollisionGroup = "None"
		Head.Anchored = true
		Head.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
		Head.Massless = true
		Head.RootPriority = 127
		Head.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
		Head.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
		Head:ApplyMesh(SavedMeshes["ⱧɆ₳Đ"])

		Torso = SavedMeshPart:Clone()
		Torso.CastShadow = true
		Torso.Color = Color3.fromRGB(103, 255, 146)
		Torso.Material = "Mud"
		Torso.Reflectance = 0
		Torso.TextureID = ""
		Torso.Transparency = 0
		Torso.Archivable = false
		Torso.Locked = true
		Torso.Name = RandomString(100)
		Torso.Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
		Torso.Size = Vector3.new(2, 2, 1)
		Torso.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
		Torso.CanCollide = false
		Torso.CanQuery = false
		Torso.CanTouch = false
		Torso.CollisionGroup = "None"
		Torso.Anchored = true
		Torso.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
		Torso.Massless = true
		Torso.RootPriority = 127
		Torso.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
		Torso.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
		Torso:ApplyMesh(SavedMeshes["₮ØⱤ₴Ø"])

		RightArm = SavedMeshPart:Clone()
		RightArm.CastShadow = true
		RightArm.Color = Color3.fromRGB(200, 200, 200)
		RightArm.Material = "Mud"
		RightArm.Reflectance = 0
		RightArm.TextureID = ""
		RightArm.Transparency = 0
		RightArm.Archivable = false
		RightArm.Locked = true
		RightArm.Name = RandomString(100)
		RightArm.Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
		RightArm.Size = Vector3.new(1, 2, 1)
		RightArm.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
		RightArm.CanCollide = false
		RightArm.CanQuery = false
		RightArm.CanTouch = false
		RightArm.CollisionGroup = "None"
		RightArm.Anchored = true
		RightArm.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
		RightArm.Massless = true
		RightArm.RootPriority = 127
		RightArm.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
		RightArm.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
		RightArm:ApplyMesh(SavedMeshes["Ɽł₲Ⱨ₮ ₳Ɽ₥"])

		LeftArm = SavedMeshPart:Clone()
		LeftArm.CastShadow = true
		LeftArm.Color = Color3.fromRGB(200, 200, 200)
		LeftArm.Material = "Mud"
		LeftArm.Reflectance = 0
		LeftArm.TextureID = ""
		LeftArm.Transparency = 0
		LeftArm.Archivable = false
		LeftArm.Locked = true
		LeftArm.Name = RandomString(100)
		LeftArm.Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
		LeftArm.Size = Vector3.new(1, 2, 1)
		LeftArm.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
		LeftArm.CanCollide = false
		LeftArm.CanQuery = false
		LeftArm.CanTouch = false
		LeftArm.CollisionGroup = "None"
		LeftArm.Anchored = true
		LeftArm.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
		LeftArm.Massless = true
		LeftArm.RootPriority = 127
		LeftArm.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
		LeftArm.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
		LeftArm:ApplyMesh(SavedMeshes["ⱠɆ₣₮ ₳Ɽ₥"])

		RightLeg = SavedMeshPart:Clone()
		RightLeg.CastShadow = true
		RightLeg.Color = Color3.fromRGB(20, 40, 50)
		RightLeg.Material = "Mud"
		RightLeg.Reflectance = 0
		RightLeg.TextureID = ""
		RightLeg.Transparency = 0
		RightLeg.Archivable = false
		RightLeg.Locked = true
		RightLeg.Name = RandomString(100)
		RightLeg.Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
		RightLeg.Size = Vector3.new(1, 2, 1)
		RightLeg.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
		RightLeg.CanCollide = false
		RightLeg.CanQuery = false
		RightLeg.CanTouch = false
		RightLeg.CollisionGroup = "None"
		RightLeg.Anchored = true
		RightLeg.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
		RightLeg.Massless = true
		RightLeg.RootPriority = 127
		RightLeg.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
		RightLeg.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
		RightLeg:ApplyMesh(SavedMeshes["Ɽł₲Ⱨ₮ ⱠɆ₲"])

		LeftLeg = SavedMeshPart:Clone()
		LeftLeg.CastShadow = true
		LeftLeg.Color = Color3.fromRGB(20, 40, 50)
		LeftLeg.Material = "Mud"
		LeftLeg.Reflectance = 0
		LeftLeg.TextureID = ""
		LeftLeg.Transparency = 0
		LeftLeg.Archivable = false
		LeftLeg.Locked = true
		LeftLeg.Name = RandomString(100)
		LeftLeg.Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
		LeftLeg.Size = Vector3.new(1, 2, 1)
		LeftLeg.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
		LeftLeg.CanCollide = false
		LeftLeg.CanQuery = false
		LeftLeg.CanTouch = false
		LeftLeg.CollisionGroup = "None"
		LeftLeg.Anchored = true
		LeftLeg.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
		LeftLeg.Massless = true
		LeftLeg.RootPriority = 127
		LeftLeg.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
		LeftLeg.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
		LeftLeg:ApplyMesh(SavedMeshes["ⱠɆ₣₮ ⱠɆ₲"])

		Face = SavedMeshPart:Clone()
		Face.CastShadow = true
		Face.Color = Color3.fromRGB(0, 0, 0)
		Face.Material = "Glacier"
		Face.Reflectance = 0
		Face.TextureID = ""
		Face.Transparency = 0
		Face.Archivable = false
		Face.Locked = true
		Face.Name = RandomString(100)
		Face.Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
		Face.Size = Vector3.new(0.417, 0.677, 0.002)
		Face.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
		Face.CanCollide = false
		Face.CanQuery = false
		Face.CanTouch = false
		Face.CollisionGroup = "None"
		Face.Anchored = true
		Face.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
		Face.Massless = true
		Face.RootPriority = 127
		Face.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
		Face.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
		Face:ApplyMesh(SavedMeshes["₣₳₵Ɇ"])

		Sword = SavedMeshPart:Clone()
		Sword.CastShadow = true
		Sword.Color = Color3.fromRGB(0, 0, 0)
		Sword.Material = "Glacier"
		Sword.Reflectance = 0
		Sword.TextureID = ""
		Sword.Transparency = 0
		Sword.Archivable = false
		Sword.Locked = true
		Sword.Name = RandomString(100)
		Sword.Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
		Sword.Size = Vector3.new(0.398, 6.16, 1.764)
		Sword.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
		Sword.CanCollide = false
		Sword.CanQuery = false
		Sword.CanTouch = false
		Sword.CollisionGroup = "None"
		Sword.Anchored = true
		Sword.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
		Sword.Massless = true
		Sword.RootPriority = 127
		Sword.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
		Sword.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
		Sword:ApplyMesh(SavedMeshes["₴₩ØⱤĐ"])

		Effects = Instance.new("Folder", game:GetService("Workspace"):FindFirstChildOfClass("Terrain"))
		Effects.Archivable = false
		Effects.Name = RandomString(100)

		Music = Instance.new("Sound", Torso)
		Music.Archivable = false
		Music.Name = RandomString(100)
		Music.PlayOnRemove = false
		Music.RollOffMaxDistance = 50
		Music.RollOffMinDistance = 10
		Music.RollOffMode = "InverseTapered"
		Music.Looped = true
		Music.PlaybackRegionsEnabled = false
		Music.PlaybackSpeed = 0.9
		Music.Playing = true
		Music.TimePosition = Mover.TPos
		Music.Volume = 1
		Music.SoundGroup = nil

		Flange = Instance.new("FlangeSoundEffect", Music)
		Flange.Archivable = false
		Flange.Name = RandomString(100)
		Flange.Depth = 1
		Flange.Enabled = true
		Flange.Mix = 0.5
		Flange.Priority = 0
		Flange.Rate = 0.5

		Pitch = Instance.new("PitchShiftSoundEffect", Music)
		Pitch.Archivable = false
		Pitch.Name = RandomString(100)
		Pitch.Enabled = true
		Pitch.Octave = 0.6
		Pitch.Priority = 0

		ViewPort = Instance.new("ViewportFrame", game:GetService("Workspace"))
		ViewPort.Archivable = false
		ViewPort.Name = RandomString(100)

		Mover.Character = {
			Head, 
			Torso, 
			RightArm, 
			LeftArm, 
			RightLeg, 
			LeftLeg, 
			Face, 
			Sword, 
		}

		local FakeWelds = {{RootJoint, Torso, Mover.RootPart}, {Neck, Head, Torso}, {RightShoulder, RightArm, Torso}, {LeftShoulder, LeftArm, Torso}, {RightHip, RightLeg, Torso}, {LeftHip, LeftLeg, Torso}, {FaceJoint, Face, Head}, {SwordJoint, Sword, RightArm}}
		for i, v in ipairs(FakeWelds) do
			local Weld, Part0, Part1 = unpack(v)
			UpdateWeld(Weld, Part0, Part1)
		end
	end)
	Mover.Fixing = false
end

game:GetService("Workspace"):FindFirstChildOfClass("Terrain").DescendantRemoving:Connect(function(v)
	if not Mover.Fixing then
		task.wait()
		if v == Head or v == Torso or v == RightArm or v == LeftArm or v == RightLeg or v == LeftLeg or v == Face or v == Sword or v == Music or v == Flange or v == Pitch or v == Effects then
			Refit()
		end
	end
end)

game:GetService("Workspace").DescendantRemoving:Connect(function(v)
	if not Mover.Fixing then
		task.wait()
		if v == ViewPort then
			Refit()
		end
	end
end)

-- || Functions || --

function SetClear(Object, Time)
	task.spawn(function()
		if Time >= 0 then 
			task.wait(Time)
		end
		pcall(function()
			Object:Destroy()
		end)
	end)
end

function CreateTween(BasePart, Time, Style, Direction, Repeat, Reverse, Del, Properties)
	local Tween = game:GetService("TweenService")
	local Tweening = Tween:Create(BasePart, TweenInfo.new(Time, Style, Direction, Repeat, Reverse, Del), Properties)
	Tweening:Play()
	return Tween
end

function CreateMesh(Parent, MeshId, MeshType, Offset, Scale, TextureId, VertexColor, Usage)
	local Mesh = Instance.new("SpecialMesh", Parent)
	Mesh.Archivable = false
	Mesh.Name = RandomString(100)
	Mesh.MeshType = MeshType
	Mesh.Offset = Offset
	Mesh.Scale = Scale
	Mesh.VertexColor = VertexColor
	if Usage == true then
		Mesh.MeshId = "rbxassetid://"..tostring(MeshId)
		Mesh.TextureId = "rbxassetid://"..tostring(TextureId)
	elseif Usage == false then
		Mesh.MeshId = ""
		Mesh.TextureId = ""
	end
	return Mesh
end

function CreateEffect(Parent, Color, Material, Transparency, Size, CF, Shape, Looped)
	local Effect = Instance.new("SkateboardPlatform", Parent)
	Effect:BreakJoints()
	Effect.Name = RandomString(100)
	Effect.Shape = Shape
	Effect.Color = Color
	Effect.CastShadow = true
	Effect.Material = Material
	Effect.Reflectance = 0
	Effect.Transparency = Transparency
	Effect.Archivable = false
	Effect.Size = Size
	Effect.CFrame = CF
	Effect.Locked = true
	Effect.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
	Effect.CanCollide = false
	Effect.CanQuery = false
	Effect.CanTouch = false
	Effect.CollisionGroup = "None"
	Effect.Anchored = true
	Effect.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
	Effect.Massless = true
	Effect.RootPriority = 127
	Effect.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
	Effect.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
	Effect.Steer = 0
	Effect.StickyWheels = false
	Effect.Throttle = 0
	Effect.TopSurface = "Smooth"
	Effect.BottomSurface = "Smooth"
	Effect.FrontSurface = "Smooth"
	Effect.BackSurface = "Smooth"
	Effect.RightSurface = "Smooth"
	Effect.LeftSurface = "Smooth"
	task.spawn(function()
		while true do
			task.wait()
			if Looped == true then
				Effect.Shape = Mover.Shapes[math.random(1, #Mover.Shapes)]
			elseif Looped == false then
				break
			end
		end
	end)
	return Effect
end

function CreateSound(Id, Parent, Volume, PlaybackSpeed, Looped)
	local Sound = Instance.new("Sound", Parent)
	Sound.Archivable = false
	Sound.Name = RandomString(100)
	Sound.PlayOnRemove = false
	Sound.SoundId = "rbxassetid://"..tostring(Id)
	Sound.RollOffMaxDistance = 10000
	Sound.RollOffMinDistance = 10
	Sound.RollOffMode = "Inverse"
	Sound.PlaybackRegionsEnabled = false
	Sound.PlaybackSpeed = PlaybackSpeed
	Sound.Playing = true
	Sound.TimePosition = 0
	Sound.Volume = Volume
	Sound.SoundGroup = nil
	if Looped == true then
		Sound.Looped = true
	else
		task.spawn(function()
			repeat
				task.wait()
			until Sound.Playing == false
			Sound:Destroy()
		end)
	end
	return Sound
end

function CreateLightning(Part0, Part1, Offset, Size, Speed)
	local Magz = (Part0 - Part1).Magnitude
	local Curpos = Part0
	local Times = math.floor(math.clamp(Magz / 10, 1, 20))
	local RZone = {-Offset, Offset}
	task.spawn(function()
		for i = 0, Times do
			task.wait()
			local Bolt = CreateEffect(nil, Color3.fromRGB(0, 255, 42), "Neon", 1, Vector3.new(0.1 + math.random(-0.5, 0.5), 0.1, Magz / Times), CFrame.new(0, 0, 0), "Block", false)
			local Magz2 = (Curpos - Part1).Magnitude
			local Offzet = Vector3.new(RZone[math.random(1, 2)], RZone[math.random(1, 2)], RZone[math.random(1, 2)])
			local Pos = CFrame.new(Curpos, Part1) * CFrame.new(0 + math.random(-1, 2), 0 + math.random(-1, 2), Magz / Times + math.random(-1, 2)).Position + Offzet
			if Times == i then
				Bolt.Size = Vector3.new(0.1, 0.1, Magz2)
				Bolt.CFrame = CFrame.new(Curpos, Part1) * CFrame.new(0, 0, -Magz2 / 2)
			else
				Bolt.CFrame = CFrame.new(Curpos, Pos) * CFrame.new(0, 0, Magz / Times / 2)
			end
			Curpos = Bolt.CFrame * CFrame.new(0, 0, Magz / Times / 2).Position
			local BoltEffect = CreateEffect(Effects, Color3.fromRGB(0, 255, 81), "Neon", 0, Vector3.new(Size, Size, Bolt.Size.Z), Bolt.CFrame * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0 + math.random(-360, 360))), "Block", false)
			CreateTween(BoltEffect, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0, 0, Bolt.Size.Z)})
			SetClear(BoltEffect, 1)
		end
	end)
end

-- || Chat || --

function Chat(Text)
	local Send = coroutine.wrap(function()
		local function FindBoard()
			pcall(function()
				for i, v in pairs(game:GetDescendants()) do
					if v:IsA("BillboardGui") and v:IsDescendantOf(game) then
						if v ~= nil and v:GetAttribute(Player.Name) then
							v:Destroy()
						end
					end
				end
			end)
		end
		FindBoard()
		if string.sub(Text, 1, 8) == "/console" or string.sub(Text, 1, 3) == "/e " or string.sub(Text, 1, 3) == "/w " or string.sub(Text, 1, 3) == "/c " then
			return
		end
		local Board = Instance.new("BillboardGui", game:GetService("Workspace"):FindFirstChildOfClass("Terrain"))
		Board:SetAttribute(Player.Name, Player.UserId)
		Board.Archivable = false
		Board.Adornee = Head
		task.spawn(function()
			while true do
				task.wait()
				Board.Adornee = Head
			end
		end)
		Board.Brightness = 1
		Board.LightInfluence = 0
		Board.AlwaysOnTop = false
		Board.Name = RandomString(100)
		Board.Size = UDim2.new(11, 35, 3, 15)
		Board.StudsOffset = Vector3.new(0, 1.5, 0)
		local Label = Instance.new("TextLabel", Board)
		Label.Archivable = false
		Label.Text = ""
		Label.TextSize = 35
		Label.TextScaled = true
		Label.BorderSizePixel = 1
		Label.Font = "Fondamento"
		Label.Name = RandomString(100)
		Label.BackgroundTransparency = 1
		Label.TextStrokeTransparency = 0
		Label.Size = UDim2.new(1, 0, 0.5, 0)
		Label.TextColor3 = Face.Color or Sword.Color
		Label.BorderColor3 = Face.Color or Sword.Color
		Label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		Label.Rotation = 0 + 10 * math.cos(Mover.Sine / 22)
		Label.Position = UDim2.new(0, 0 + 5 * math.cos(Mover.Sine / 22), 0, 0 + 5 * math.sin(Mover.Sine / 22))
		local Gradient = Instance.new("UIGradient", Label)
		Gradient.Archivable = false
		Gradient.Rotation = 90
		Gradient.Enabled = true
		Gradient.Name = RandomString(100)
		Gradient.Offset = Vector2.new(0, 0)
		Gradient.Transparency = NumberSequence.new(0)
		Gradient.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(255, 255, 255))
		task.spawn(function()
			while true do
				task.wait()
				Label.TextColor3 = Face.Color or Sword.Color
				Label.BorderColor3 = Face.Color or Sword.Color
				Label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				Label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				Label.Rotation = 0 + 10 * math.cos(Mover.Sine / 22)
				Label.Font = "Fondamento"
				Label.Position = UDim2.new(0, 0 + 5 * math.cos(Mover.Sine / 22), 0, 0 + 5 * math.sin(Mover.Sine / 22))
			end
		end)
		for i = 1, #Text do
			task.wait()
			Label.Text = string.sub(Text, 1, i)
		end
		task.wait(2)
		for i = 1, 90 do
			task.wait()
			Label.TextTransparency = i/90
			Label.TextStrokeTransparency = i/90
		end
		task.wait(2)
		pcall(function()
			Board:Destroy()
			Label:Destroy()
			Gradient:Destroy()
		end)
	end)
	Send()
end

Player.Chatted:Connect(function(Msg)
	Chat(Msg)
end)

game:GetService("Players").PlayerAdded:Connect(function(Plr)
	if Plr.Name == User then
		Player = Plr
		Player.Chatted:Connect(function(Msg)
			Chat(Msg)
		end)
	end
end)

-- || Effect || --

function SetEffect(v)
	pcall(function()
		if v:IsA("BasePart") and not (v == Head or v == Torso or v == RightArm or v == LeftArm or v == RightLeg or v == LeftLeg or v == Face or v == Sword or v:IsDescendantOf(Effects) or v:IsA("Terrain")) then
			v.Archivable = true
			local v2 = v:Clone()
			v2:BreakJoints()
			v2:ClearAllChildren()
			v2.Parent = Effects
			v2.Name = RandomString(100)
			v2.Color = Color3.fromRGB(0, 255, 30)
			v2.CastShadow = true
			v2.Material = "Neon"
			v2.Reflectance = 0
			v2.Transparency = 0
			v2.Archivable = false
			v2.Size = v.Size
			v2.CFrame = v.CFrame
			v2.Locked = true
			v2.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
			v2.CanCollide = false
			v2.CanQuery = false
			v2.CanTouch = false
			v2.CollisionGroup = "None"
			v2.Anchored = true
			v2.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
			v2.Massless = true
			v2.RootPriority = 127
			v2.TopSurface = "Smooth"
			v2.BottomSurface = "Smooth"
			v2.FrontSurface = "Smooth"
			v2.BackSurface = "Smooth"
			v2.RightSurface = "Smooth"
			v2.LeftSurface = "Smooth"
			if v2:IsA("MeshPart") then
				v2.TextureID = ""
			elseif v2:IsA("UnionOperation") then
				v2.UsePartColor = true
			end
			CreateSound(262562442, v2, 1, math.random(8, 15) / 10, false)
			CreateTween(v2, 6, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Size = Vector3.new(0, 0, 0), Transparency = 1, Color = Color3.fromRGB(0, 0, 0)})
			SetClear(v2, 2.5)
			task.spawn(function()
				while true do
					task.wait()
					v2.CFrame = v2.CFrame * CFrame.new(0 + math.random(-1, 1), 0 + math.random(-1, 1), 0 + math.random(-1, 1)) * CFrame.new(0 - 0.5 * math.cos(Mover.Sine / 12), 0 - 0.5 * math.sin(Mover.Sine / 22), 0 - 0.5 * math.sin(Mover.Sine / 12)) * CFrame.Angles(math.rad(0 + math.random(-10, 10)), math.rad(0 + math.random(-10, 10)), math.rad(0 + math.random(-10, 10))) * CFrame.Angles(math.rad(0 - 5 * math.cos(Mover.Sine / 22)), math.rad(0 - 5 * math.sin(Mover.Sine / 22)), math.rad(0 - 5 * math.sin(Mover.Sine / 22)))
				end
			end)
		end
	end)
end

-- || Damage || --

function _Void_(Object)
	if Object:IsA("BasePart") and not (Object == Head or Object == Torso or Object == RightArm or Object == LeftArm or Object == RightLeg or Object == LeftLeg or Object == Face or Object == Sword or Object:IsDescendantOf(Effects) or Object:IsA("Terrain")) then
		if Object then
			SetEffect(Object)
			Chat(""..Mover.KillTaunts[math.random(1, #Mover.KillTaunts)]..""..Object.Name..".")
		end
		table.insert(Mover.VoidTable, Object.ClassName)
		Object:BreakJoints()
		Object.CFrame = CFrame.new(1e6, 1e6, 1e6)
		SetProperty(Object, "CFrame", CFrame.new(1e6, 1e6, 1e6))
	end
end

function _Nil_(Object)
	if Object:IsA("BasePart") and not (Object == Head or Object == Torso or Object == RightArm or Object == LeftArm or Object == RightLeg or Object == LeftLeg or Object == Face or Object == Sword or Object:IsDescendantOf(Effects) or Object:IsA("Terrain")) then
		if Object then
			SetEffect(Object)
			Chat(""..Mover.KillTaunts[math.random(1, #Mover.KillTaunts)]..""..Object.Name..".")
		end
		table.insert(Mover.NilTable, Object.ClassName)
		Object:BreakJoints()
		Object:Remove()
		Object:remove()
		Object:Destroy()
		Object:destroy()
		Object.Parent = nil
		Object:ClearAllChildren()
		task.defer(Object.Destroy, Object)
		task.spawn(function()
			while true do
				SWait()
				Object:Remove()
				Object:remove()
				Object:Destroy()
				Object:destroy()
				Object.Parent = nil
				Object:ClearAllChildren()
				task.defer(Object.Destroy, Object)
				if Mover.NilKeep <= 1 or Mover.Method ~= "Nil" then
					break
				end
			end
		end)
	end
end

function _Size_(Object)
	if Object:IsA("BasePart") and not (Object == Head or Object == Torso or Object == RightArm or Object == LeftArm or Object == RightLeg or Object == LeftLeg or Object == Face or Object == Sword or Object:IsDescendantOf(Effects) or Object:IsA("Terrain")) then
		if Object then
			SetEffect(Object)
			Chat(""..Mover.KillTaunts[math.random(1, #Mover.KillTaunts)]..""..Object.Name..".")
		end
		table.insert(Mover.SizeTable, Object.ClassName)
		Object:BreakJoints()
		Object.Size = Vector3.new(2048, 2048, 2048)
		SetProperty(Object, "Size", Vector3.new(2048, 2048, 2048))
	end
end

function _Transparency_(Object)
	if Object:IsA("BasePart") and not (Object == Head or Object == Torso or Object == RightArm or Object == LeftArm or Object == RightLeg or Object == LeftLeg or Object == Face or Object == Sword or Object:IsDescendantOf(Effects) or Object:IsA("Terrain")) then
		if Object then
			SetEffect(Object)
			Chat(""..Mover.KillTaunts[math.random(1, #Mover.KillTaunts)]..""..Object.Name..".")
		end
		table.insert(Mover.TransparencyTable, Object.ClassName)
		Object:BreakJoints()
		Object.Transparency = 1
		SetProperty(Object, "Transparency", 1)
	end
end

function _Fake_Void_(Object)
	if Object:IsA("BasePart") and not (Object == Head or Object == Torso or Object == RightArm or Object == LeftArm or Object == RightLeg or Object == LeftLeg or Object == Face or Object == Sword or Object:IsDescendantOf(Effects) or Object:IsA("Terrain")) then
		if Object then
			SetEffect(Object)
			Chat(""..Mover.KillTaunts[math.random(1, #Mover.KillTaunts)]..""..Object.Name..".")
		end
		table.insert(Mover.FakeVoidTable, Object.ClassName)
		Object:BreakJoints()
		local OldCF = Object.CFrame
		local SavedOldCF = OldCF
		Object.CFrame = SavedOldCF
		SetProperty(Object, "CFrame", SavedOldCF)
	end
end

function _Derender_(Object)
	if Object:IsA("BasePart") and not (Object == Head or Object == Torso or Object == RightArm or Object == LeftArm or Object == RightLeg or Object == LeftLeg or Object == Face or Object == Sword or Object:IsDescendantOf(Effects) or Object:IsA("Terrain")) then
		if Object then
			SetEffect(Object)
			Chat(""..Mover.KillTaunts[math.random(1, #Mover.KillTaunts)]..""..Object.Name..".")
		end
		table.insert(Mover.DerenderTable, Object.ClassName)
		Object:BreakJoints()
		pcall(function()
			Object.Parent = ViewPort
			task.spawn(function()
				while true do
					SWait()
					repeat
						Object.Parent = ViewPort
					until Object.Parent == ViewPort
					Object.Parent = ViewPort
					repeat
						Object.Parent = ViewPort
					until Object.Parent == ViewPort
					if Mover.DerenderKeep <= 1 or Mover.Method ~= "Derender" then
						break
					end
				end
			end)
		end)
	end
end

function _Color_(Object)
	if Object:IsA("BasePart") and not (Object == Head or Object == Torso or Object == RightArm or Object == LeftArm or Object == RightLeg or Object == LeftLeg or Object == Face or Object == Sword or Object:IsDescendantOf(Effects) or Object:IsA("Terrain")) then
		if Object then
			SetEffect(Object)
			Chat(""..Mover.KillTaunts[math.random(1, #Mover.KillTaunts)]..""..Object.Name..".")
		end
		table.insert(Mover.ColorTable, Object.ClassName)
		Object:BreakJoints()
		Object.Color = Color3.fromRGB(0, 0, 0)
		SetProperty(Object, "Color", Color3.fromRGB(0, 0, 0))
	end
end

function _Anchored_(Object)
	if Object:IsA("BasePart") and not (Object == Head or Object == Torso or Object == RightArm or Object == LeftArm or Object == RightLeg or Object == LeftLeg or Object == Face or Object == Sword or Object:IsDescendantOf(Effects) or Object:IsA("Terrain")) then
		if Object then
			SetEffect(Object)
			Chat(""..Mover.KillTaunts[math.random(1, #Mover.KillTaunts)]..""..Object.Name..".")
		end
		table.insert(Mover.AnchoredTable, Object.ClassName)
		Object:BreakJoints()
		Object.Anchored = false
		SetProperty(Object, "Anchored", false)
	end
end

function _Material_(Object)
	if Object:IsA("BasePart") and not (Object == Head or Object == Torso or Object == RightArm or Object == LeftArm or Object == RightLeg or Object == LeftLeg or Object == Face or Object == Sword or Object:IsDescendantOf(Effects) or Object:IsA("Terrain")) then
		if Object then
			SetEffect(Object)
			Chat(""..Mover.KillTaunts[math.random(1, #Mover.KillTaunts)]..""..Object.Name..".")
		end
		table.insert(Mover.MaterialTable, Object.ClassName)
		Object:BreakJoints()
		Object.Material = "ForceField"
		SetProperty(Object, "Material", "ForceField")
	end
end

function _Orientation_(Object)
	if Object:IsA("BasePart") and not (Object == Head or Object == Torso or Object == RightArm or Object == LeftArm or Object == RightLeg or Object == LeftLeg or Object == Face or Object == Sword or Object:IsDescendantOf(Effects) or Object:IsA("Terrain")) then
		if Object then
			SetEffect(Object)
			Chat(""..Mover.KillTaunts[math.random(1, #Mover.KillTaunts)]..""..Object.Name..".")
		end
		table.insert(Mover.OrientationTable, Object.ClassName)
		Object:BreakJoints()
		Object.Orientation = Vector3.new(90, 90, 0)
		SetProperty(Object, "Orientation", Vector3.new(90, 90, 0))
	end
end

function _Deterioration_(Object)
	if Object:IsA("MeshPart") and not (Object == Head or Object == Torso or Object == RightArm or Object == LeftArm or Object == RightLeg or Object == LeftLeg or Object == Face or Object == Sword or Object:IsDescendantOf(Effects) or Object:IsA("Terrain")) then
		if Object then
			SetEffect(Object)
			Chat(""..Mover.KillTaunts[math.random(1, #Mover.KillTaunts)]..""..Object.Name..".")
		end
		table.insert(Mover.DeteriorationTable, Object.ClassName)
		Object:BreakJoints()
		Object:ApplyMesh(SavedMeshes["₭łⱠⱠ"])
		SetProperty(Object, "MeshId", Object:ApplyMesh(SavedMeshes["₭łⱠⱠ"]))
		local DeteriorationLoop_1 = game:GetService("RunService").Heartbeat:Connect(function()
			Object:ApplyMesh(SavedMeshes["₭łⱠⱠ"])
			SetProperty(Object, "MeshId", Object:ApplyMesh(SavedMeshes["₭łⱠⱠ"]))
			repeat
				Object:ApplyMesh(SavedMeshes["₭łⱠⱠ"])
				SWait()
			until Object:ApplyMesh(SavedMeshes["₭łⱠⱠ"])
		end)
		if Mover.DeteriorationKeep == 0 or Mover.Method ~= "Deterioration" then
			DeteriorationLoop_1:Disconnect()
		end
	end
end

function ApplyAoE(Location, Range)
	for i, v in pairs(game:GetDescendants()) do
		if v:IsA("BasePart") and not (v == Head or v == Torso or v == RightArm or v == LeftArm or v == RightLeg or v == LeftLeg or v == Face or v == Sword or v:IsDescendantOf(Effects) or v:IsA("Terrain")) then
			if v then
				if (v.Position - Location).Magnitude <= Range then
					if Mover.Method == "Void" then
						_Void_(v)
					elseif Mover.Method == "Nil" then
						_Nil_(v)
					elseif Mover.Method == "Size" then
						_Size_(v)
					elseif Mover.Method == "Transparency" then
						_Transparency_(v)
					elseif Mover.Method == "Fake Void" then
						_Fake_Void_(v)
					elseif Mover.Method == "Derender" then
						_Derender_(v)
					elseif Mover.Method == "Color" then
						_Color_(v)
					elseif Mover.Method == "Anchored" then
						_Anchored_(v)
					elseif Mover.Method == "Material" then
						_Material_(v)
					elseif Mover.Method == "Orientation" then
						_Orientation_(v)
					elseif Mover.Method == "Deterioration" and v:IsA("MeshPart") then
						_Deterioration_(v)
					end
				end
			end
		end
	end
end

game.DescendantAdded:Connect(function(Base)
	if Base:IsA("BasePart") and not (Base == Head or Base == Torso or Base == RightArm or Base == LeftArm or Base == RightLeg or Base == LeftLeg or Base == Face or Base == Sword or Base:IsDescendantOf(Effects) or Base:IsA("Terrain")) then
		if Mover.Method == "Void" then
			for i = 1, #Mover.VoidTable do
				if Base.ClassName == Mover.VoidTable[i] then
					Mover.VoidKeep = Mover.VoidKeep + 1
				end
			end
			if Mover.VoidKeep >= 1 then
				table.insert(Mover.VoidTable, Base.ClassName)
				Base:BreakJoints()
				Base.CFrame = CFrame.new(1e6, 1e6, 1e6)
				SetProperty(Base, "CFrame", CFrame.new(1e6, 1e6, 1e6))
			end
		elseif Mover.Method == "Nil" then
			for i = 1, #Mover.NilTable do
				if Base.ClassName == Mover.NilTable[i] then
					Mover.NilKeep = Mover.NilKeep + 1
				end
			end
			if Mover.NilKeep >= 1 then
				table.insert(Mover.NilTable, Base.ClassName)
				Base:BreakJoints()
				Base:Remove()
				Base:remove()
				Base:Destroy()
				Base:destroy()
				Base.Parent = nil
				Base:ClearAllChildren()
				task.defer(Base.Destroy, Base)
				task.spawn(function()
					while true do
						SWait()
						Base:Remove()
						Base:remove()
						Base:Destroy()
						Base:destroy()
						Base.Parent = nil
						Base:ClearAllChildren()
						task.defer(Base.Destroy, Base)
						if Mover.NilKeep <= 1 or Mover.Method ~= "Nil" then
							break
						end
					end
				end)
			end
		elseif Mover.Method == "Size" then
			for i = 1, #Mover.SizeTable do
				if Base.ClassName == Mover.SizeTable[i] then
					Mover.SizeKeep = Mover.SizeKeep + 1
				end
			end
			if Mover.SizeKeep >= 1 then
				table.insert(Mover.SizeTable, Base.ClassName)
				Base:BreakJoints()
				Base.Size = Vector3.new(2048, 2048, 2048)
				SetProperty(Base, "Size", Vector3.new(2048, 2048, 2048))
			end
		elseif Mover.Method == "Transparency" then
			for i = 1, #Mover.TransparencyTable do
				if Base.ClassName == Mover.TransparencyTable[i] then
					Mover.TransparencyKeep = Mover.TransparencyKeep + 1
				end
			end
			if Mover.TransparencyKeep >= 1 then
				table.insert(Mover.TransparencyTable, Base.ClassName)
				Base:BreakJoints()
				Base.Transparency = 1
				SetProperty(Base, "Transparency", 1)
			end
		elseif Mover.Method == "Fake Void" then
			for i = 1, #Mover.FakeVoidTable do
				if Base.ClassName == Mover.FakeVoidTable[i] then
					Mover.FakeVoidKeep = Mover.FakeVoidKeep + 1
				end
			end
			if Mover.FakeVoidKeep >= 1 then
				table.insert(Mover.FakeVoidTable, Base.ClassName)
				Base:BreakJoints()
				local OldCF = Base.CFrame
				local SavedOldCF = OldCF
				Base.CFrame = SavedOldCF
				SetProperty(Base, "CFrame", SavedOldCF)
			end
		elseif Mover.Method == "Derender" then
			for i = 1, #Mover.DerenderTable do
				if Base.ClassName == Mover.DerenderTable[i] then
					Mover.DerenderKeep = Mover.DerenderKeep + 1
				end
			end
			if Mover.DerenderKeep >= 1 then
				table.insert(Mover.DerenderTable, Base.ClassName)
				Base:BreakJoints()
				pcall(function()
					Base.Parent = ViewPort
					task.spawn(function()
						while true do
							SWait()
							repeat
								Base.Parent = ViewPort
							until Base.Parent == ViewPort
							Base.Parent = ViewPort
							repeat
								Base.Parent = ViewPort
							until Base.Parent == ViewPort
							if Mover.DerenderKeep <= 1 or Mover.Method ~= "Derender" then
								break
							end
						end
					end)
				end)
			end
		elseif Mover.Method == "Color" then
			for i = 1, #Mover.ColorTable do
				if Base.ClassName == Mover.ColorTable[i] then
					Mover.ColorKeep = Mover.ColorKeep + 1
				end
			end
			if Mover.ColorKeep >= 1 then
				table.insert(Mover.ColorTable, Base.ClassName)
				Base:BreakJoints()
				Base.Color = Color3.fromRGB(0, 0, 0)
				SetProperty(Base, "Color", Color3.fromRGB(0, 0, 0))
			end
		elseif Mover.Method == "Anchored" then
			for i = 1, #Mover.AnchoredTable do
				if Base.ClassName == Mover.AnchoredTable[i] then
					Mover.AnchoredKeep = Mover.AnchoredKeep + 1
				end
			end
			if Mover.AnchoredKeep >= 1 then
				table.insert(Mover.AnchoredTable, Base.ClassName)
				Base:BreakJoints()
				Base.Anchored = false
				SetProperty(Base, "Anchored", false)
			end
		elseif Mover.Method == "Material" then
			for i = 1, #Mover.MaterialTable do
				if Base.ClassName == Mover.MaterialTable[i] then
					Mover.MaterialKeep = Mover.MaterialKeep + 1
				end
			end
			if Mover.MaterialKeep >= 1 then
				table.insert(Mover.MaterialTable, Base.ClassName)
				Base:BreakJoints()
				Base.Material = "ForceField"
				SetProperty(Base, "Material", "ForceField")
			end
		elseif Mover.Method == "Orientation" then
			for i = 1, #Mover.OrientationTable do
				if Base.ClassName == Mover.OrientationTable[i] then
					Mover.OrientationKeep = Mover.OrientationKeep + 1
				end
			end
			if Mover.OrientationKeep >= 1 then
				table.insert(Mover.OrientationTable, Base.ClassName)
				Base:BreakJoints()
				Base.Orientation = Vector3.new(90, 90, 0)
				SetProperty(Base, "Orientation", Vector3.new(90, 90, 0))
			end
		elseif Mover.Method == "Deterioration" and Base:IsA("MeshPart") then
			for i = 1, #Mover.DeteriorationTable do
				if Base.ClassName == Mover.DeteriorationTable[i] then
					Mover.DeteriorationKeep = Mover.DeteriorationKeep + 1
				end
			end
			if Mover.DeteriorationKeep >= 1 then
				table.insert(Mover.DeteriorationTable, Base.ClassName)
				Base:BreakJoints()
				Base:ApplyMesh(SavedMeshes["₭łⱠⱠ"])
				SetProperty(Base, "MeshId", Base:ApplyMesh(SavedMeshes["₭łⱠⱠ"]))
				local DeteriorationLoop_1 = game:GetService("RunService").Heartbeat:Connect(function()
					Base:ApplyMesh(SavedMeshes["₭łⱠⱠ"])
					SetProperty(Base, "MeshId", Base:ApplyMesh(SavedMeshes["₭łⱠⱠ"]))
					repeat
						Base:ApplyMesh(SavedMeshes["₭łⱠⱠ"])
						SWait()
					until Base:ApplyMesh(SavedMeshes["₭łⱠⱠ"])
				end)
				if Mover.DeteriorationKeep == 0 or Mover.Method ~= "Deterioration" then
					DeteriorationLoop_1:Disconnect()
				end
			end
		end
	end
end)

-- || Attacks || --

function Dominant_Slash()
	Mover.Attack = true
	ApplyAoE(Sword.Position, 4)
	CreateSound(8120249833, Sword, 1, math.random(8, 15) / 10, false)

	for i = 0, 0.5, 0.025 / 3 do
		SWait()
		if Mover.Flying then
			SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(0, -2.85, 0.1) * CFrame.Angles(math.rad(-195), math.rad(0), math.rad(0)), 1 / 3)
			RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0 - 0.5 * math.cos(Mover.Sine / 22), 0 - 0.5 * math.sin(Mover.Sine / 22), 1.1 - 0.5 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(0 - 5 * math.sin(Mover.Sine / 22)), math.rad(0 - 5 * math.cos(Mover.Sine / 22)), math.rad(-35 + 5 * math.cos(Mover.Sine / 22))), 1 / 3)
			Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(5 - 5 * math.cos(Mover.Sine / 22)), math.rad(10 + 5 * math.sin(Mover.Sine / 22)), math.rad(35 - 5 * math.sin(Mover.Sine / 22))), 1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.45 + 0.03 * math.cos(Mover.Sine / 22), 0.4) * CFrame.Angles(math.rad(0), math.rad(-35 + 5 * math.sin(Mover.Sine / 22)), math.rad(90 - 5 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.25 + 0.03 * math.cos(Mover.Sine / 22), -0.35) * CFrame.Angles(math.rad(90 - 5 * math.cos(Mover.Sine / 22)), math.rad(-5 - 5 * math.sin(Mover.Sine / 22)), math.rad(-30 - 5 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
			RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -0.6 - 0.03 * math.cos(Mover.Sine / 22), -0.25) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(-15 + 5 * math.sin(Mover.Sine / 22)), math.rad(-5 + 2 * math.cos(Mover.Sine / 22))), 1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.03 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2.5 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(10 - 5 * math.sin(Mover.Sine / 22)), math.rad(5 - 5 * math.cos(Mover.Sine / 22))), 1 / 3)
		elseif not Mover.Flying then
			SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(0, -2.85, 0.1) * CFrame.Angles(math.rad(-195), math.rad(0), math.rad(0)), 1 / 3)
			RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Mover.Sine / 22)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-35)), 1 / 3)
			Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(5 - 1 * math.cos(Mover.Sine / 22)), math.rad(10 + 1 * math.sin(Mover.Sine / 22)), math.rad(35 - 1 * math.sin(Mover.Sine / 22))), 1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.45 + 0.03 * math.cos(Mover.Sine / 22), 0.4) * CFrame.Angles(math.rad(0), math.rad(-35 + 1 * math.sin(Mover.Sine / 22)), math.rad(90 - 1 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.25 + 0.03 * math.cos(Mover.Sine / 22), -0.35) * CFrame.Angles(math.rad(90 - 1 * math.cos(Mover.Sine / 22)), math.rad(-5 - 1 * math.sin(Mover.Sine / 22)), math.rad(-30 - 1 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
			RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(-15 + 1 * math.cos(Mover.Sine / 22)), math.rad(0)), 1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(15 - 1 * math.cos(Mover.Sine / 22)), math.rad(0)), 1 / 3)
		end	
	end

	ApplyAoE(Sword.Position, 8)
	CreateSound(6241709963, Sword, 1, math.random(8, 15) / 10, false)

	for i = 1, 10 do
		task.wait()
		local Effect1 = CreateEffect(Effects, Color3.fromRGB(0, 255, 8), "Neon", 0, Vector3.new(0.5, 0.5, 0.5), Sword.CFrame * CFrame.new(0 + math.random(-1, 1), 0 + math.random(-2, 2), 0 + math.random(-1, 1)) * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "CornerWedge", false)
		CreateSound(2390698929, Effect1, 1, math.random(8, 15) / 10, false)
		CreateTween(Effect1, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0, 0, 0)})
		SetClear(Effect1, 1.5)
	end

	for i = 0, 0.5, 0.045 / 3 do
		SWait()
		if Mover.Flying then
			SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(0, -1, -2.25) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0)), 1 / 3)
			RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0 - 0.5 * math.cos(Mover.Sine / 22), 0 - 0.5 * math.sin(Mover.Sine / 22), 1.1 - 0.5 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(0 - 5 * math.sin(Mover.Sine / 22)), math.rad(0 - 5 * math.cos(Mover.Sine / 22)), math.rad(30 + 5 * math.cos(Mover.Sine / 22))), 1 / 3)
			Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(5 - 5 * math.cos(Mover.Sine / 22)), math.rad(-5 + 5 * math.sin(Mover.Sine / 22)), math.rad(-30 - 5 * math.sin(Mover.Sine / 22))), 1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.45 + 0.03 * math.cos(Mover.Sine / 22), -0.4) * CFrame.Angles(math.rad(0), math.rad(95 + 5 * math.sin(Mover.Sine / 22)), math.rad(90 - 5 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.25 + 0.03 * math.cos(Mover.Sine / 22), 0.3) * CFrame.Angles(math.rad(0 - 5 * math.cos(Mover.Sine / 22)), math.rad(15 - 5 * math.sin(Mover.Sine / 22)), math.rad(-15 - 5 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
			RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -0.6 - 0.03 * math.cos(Mover.Sine / 22), -0.25) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(-35 + 5 * math.sin(Mover.Sine / 22)), math.rad(-15 + 2 * math.cos(Mover.Sine / 22))), 1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.03 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2.5 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(30 - 5 * math.sin(Mover.Sine / 22)), math.rad(15 - 5 * math.cos(Mover.Sine / 22))), 1 / 3)
		elseif not Mover.Flying then
			SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(0, -1, -2.25) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0)), 1 / 3)
			RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Mover.Sine / 22)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(30)), 1 / 3)
			Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(5 - 1 * math.cos(Mover.Sine / 22)), math.rad(-5 + 1 * math.sin(Mover.Sine / 22)), math.rad(-30 - 1 * math.sin(Mover.Sine / 22))), 1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.45 + 0.03 * math.cos(Mover.Sine / 22), -0.4) * CFrame.Angles(math.rad(0), math.rad(95 + 1 * math.sin(Mover.Sine / 22)), math.rad(90 - 1 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.25 + 0.03 * math.cos(Mover.Sine / 22), 0.3) * CFrame.Angles(math.rad(0 - 1 * math.cos(Mover.Sine / 22)), math.rad(15 - 1 * math.sin(Mover.Sine / 22)), math.rad(-15 - 1 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
			RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(-15 + 1 * math.cos(Mover.Sine / 22)), math.rad(0)), 1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(15 - 1 * math.cos(Mover.Sine / 22)), math.rad(0)), 1 / 3)
		end
	end
	Mover.Attack = false
end

function Ravage_Beam(Hit)
	Mover.Attack = true
	for i = 0, 0.5, 0.3 / 3 do
		SWait()
		if Mover.Flying then
			SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(-1.15, 0, -1.85) * CFrame.Angles(math.rad(-65), math.rad(15), math.rad(30)), 0.15 / 3)
			RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0 - 0.5 * math.cos(Mover.Sine / 22), 0 - 0.5 * math.sin(Mover.Sine / 22), 1.1 - 0.5 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(0 - 5 * math.sin(Mover.Sine / 22)), math.rad(0 - 5 * math.cos(Mover.Sine / 22)), math.rad(-35 + 5 * math.cos(Mover.Sine / 22))), 1 / 3)
			Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(5 - 5 * math.cos(Mover.Sine / 22)), math.rad(0 + 5 * math.sin(Mover.Sine / 22)), math.rad(35 - 5 * math.sin(Mover.Sine / 22))), 1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.1 + 0.03 * math.cos(Mover.Sine / 22), 0.35) * CFrame.Angles(math.rad(185 - 5 * math.cos(Mover.Sine / 22)), math.rad(30 + 5 * math.sin(Mover.Sine / 22)), math.rad(-5 + 5 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 0.15 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.25 + 0.03 * math.cos(Mover.Sine / 22), -0.35) * CFrame.Angles(math.rad(90 - 5 * math.cos(Mover.Sine / 22)), math.rad(-5 - 5 * math.sin(Mover.Sine / 22)), math.rad(-30 - 5 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
			RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -0.6 - 0.03 * math.cos(Mover.Sine / 22), -0.25) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(-15 + 5 * math.sin(Mover.Sine / 22)), math.rad(-5 + 2 * math.cos(Mover.Sine / 22))), 1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.03 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2.5 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(10 - 5 * math.sin(Mover.Sine / 22)), math.rad(5 - 5 * math.cos(Mover.Sine / 22))), 1 / 3)
		elseif not Mover.Flying then
			SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(-1.15, 0, -1.85) * CFrame.Angles(math.rad(-65), math.rad(15), math.rad(30)), 0.15 / 3)
			RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Mover.Sine / 22)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-35)), 1 / 3)
			Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(5 - 1 * math.cos(Mover.Sine / 22)), math.rad(0 + 1 * math.sin(Mover.Sine / 22)), math.rad(35 - 1 * math.sin(Mover.Sine / 22))), 1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.1 + 0.03 * math.cos(Mover.Sine / 22), 0.35) * CFrame.Angles(math.rad(185 - 1 * math.cos(Mover.Sine / 22)), math.rad(30 + 1 * math.sin(Mover.Sine / 22)), math.rad(-5 + 1 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 0.15 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.25 + 0.03 * math.cos(Mover.Sine / 22), -0.35) * CFrame.Angles(math.rad(90 - 1 * math.cos(Mover.Sine / 22)), math.rad(-5 - 1 * math.sin(Mover.Sine / 22)), math.rad(-30 - 1 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
			RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(-15 + 1 * math.cos(Mover.Sine / 22)), math.rad(0)), 1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(15 - 1 * math.cos(Mover.Sine / 22)), math.rad(0)), 1 / 3)
		end
	end

	local Effect1 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 1, Vector3.new(1.5, 1.5, 1.5), LeftArm.CFrame * CFrame.new(0, -1.45, 0) * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Block", false)
	CreateSound(411274847, Effect1, 1, math.random(8, 15) / 10, false)
	CreateTween(Effect1, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 0, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0, 0, 0)})
	SetClear(Effect1, 2)

	local Distance = (Effect1.Position - Hit).Magnitude

	local Effect2 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(0, 0, 0), LeftArm.CFrame * CFrame.new(0, -1.45, 0) * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Ball", false)
	CreateSound(6290067239, Effect2, 1, math.random(8, 15) / 10, false)
	CreateTween(Effect2, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(3.5, 3.5, 3.5)})
	SetClear(Effect2, 2)

	for i = 0, 0.5, 0.3 / 3 do
		SWait()
		if Mover.Flying then
			SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(-1.15, 0, -1.85) * CFrame.Angles(math.rad(-65), math.rad(15), math.rad(30)), 0.15 / 3)
			RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0 - 0.5 * math.cos(Mover.Sine / 22), 0 - 0.5 * math.sin(Mover.Sine / 22), 1.1 - 0.5 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(0 - 5 * math.sin(Mover.Sine / 22)), math.rad(0 - 5 * math.cos(Mover.Sine / 22)), math.rad(-35 + 5 * math.cos(Mover.Sine / 22))), 1 / 3)
			Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(5 - 5 * math.cos(Mover.Sine / 22)), math.rad(0 + 5 * math.sin(Mover.Sine / 22)), math.rad(35 - 5 * math.sin(Mover.Sine / 22))), 1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.1 + 0.03 * math.cos(Mover.Sine / 22), 0.35) * CFrame.Angles(math.rad(185 - 5 * math.cos(Mover.Sine / 22)), math.rad(30 + 5 * math.sin(Mover.Sine / 22)), math.rad(-5 + 5 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 0.15 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.25 + 0.03 * math.cos(Mover.Sine / 22), -0.35) * CFrame.Angles(math.rad(100 - 5 * math.cos(Mover.Sine / 22)), math.rad(-5 - 5 * math.sin(Mover.Sine / 22)), math.rad(-30 - 5 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
			RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -0.6 - 0.03 * math.cos(Mover.Sine / 22), -0.25) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(-15 + 5 * math.sin(Mover.Sine / 22)), math.rad(-5 + 2 * math.cos(Mover.Sine / 22))), 1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.03 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2.5 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(10 - 5 * math.sin(Mover.Sine / 22)), math.rad(5 - 5 * math.cos(Mover.Sine / 22))), 1 / 3)
		elseif not Mover.Flying then
			SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(-1.15, 0, -1.85) * CFrame.Angles(math.rad(-65), math.rad(15), math.rad(30)), 0.15 / 3)
			RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Mover.Sine / 22)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-35)), 1 / 3)
			Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(5 - 1 * math.cos(Mover.Sine / 22)), math.rad(0 + 1 * math.sin(Mover.Sine / 22)), math.rad(35 - 1 * math.sin(Mover.Sine / 22))), 1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.1 + 0.03 * math.cos(Mover.Sine / 22), 0.35) * CFrame.Angles(math.rad(185 - 1 * math.cos(Mover.Sine / 22)), math.rad(30 + 1 * math.sin(Mover.Sine / 22)), math.rad(-5 + 1 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 0.15 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.25 + 0.03 * math.cos(Mover.Sine / 22), -0.35) * CFrame.Angles(math.rad(100 - 1 * math.cos(Mover.Sine / 22)), math.rad(-5 - 1 * math.sin(Mover.Sine / 22)), math.rad(-30 - 1 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
			RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(-15 + 1 * math.cos(Mover.Sine / 22)), math.rad(0)), 1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(15 - 1 * math.cos(Mover.Sine / 22)), math.rad(0)), 1 / 3)
		end
	end

	local Beam1 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(1, Distance, 1), CFrame.new(Effect1.Position, Hit) * CFrame.new(0, 0, -Distance / 2) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), "Block", false)
	local Beam1Mesh = CreateMesh(Beam1, "", "Sphere", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), "", Vector3.new(1, 1, 1), false)
	CreateSound(1146690806, Beam1, 1, math.random(8, 15) / 10, false)
	CreateTween(Beam1, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0, Distance, 0)})
	SetClear(Beam1, 2)

	local Effect3 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(0, 0, 0), CFrame.new(Hit) * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Block", false)
	CreateSound(3802269741, Effect3, 1, math.random(8, 15) / 10, false)
	CreateTween(Effect3, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(8, 8, 8)})
	SetClear(Effect3, 2)

	local Effect4 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(0.5, 0.5, 0.5), Effect3.CFrame * CFrame.new(0 + math.random(-15, 15), 0 + math.random(-15, 15), 0 + math.random(-15, 15)) * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "CornerWedge", false)
	CreateSound(4376217120, Effect4, 1, math.random(8, 15) / 10, false)
	CreateTween(Effect4, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0, 0, 0), CFrame = CFrame.new(Hit)})
	SetClear(Effect4, 2)

	local Effect5 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(6, 0, 6), Effect3.CFrame * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Block", false)
	local Effect5Mesh = CreateMesh(Effect5, "", "Sphere", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), "", Vector3.new(1, 1, 1), false)
	CreateSound(3264923, Effect5, 1, math.random(8, 15) / 10, false)
	CreateTween(Effect5, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0.1, 30 + math.random(-1 , 1), 0.1)})
	SetClear(Effect5, 2)

	local Effect6 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 1, Vector3.new(20, 20, 20), CFrame.new(Hit) * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Ball", false)
	CreateSound(2674547670, Effect6, 1, math.random(8, 15) / 10, false)
	CreateTween(Effect6, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 0, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0, 0, 0)})
	SetClear(Effect6, 1.5)

	CreateLightning(Effect1.Position, Hit, 0, 0.8, 0.6)

	ApplyAoE(Effect2.Position, 3)
	ApplyAoE(Effect4.Position, 3)
	ApplyAoE(Effect3.Position, 10)
	Mover.Attack = false
end

function Emitted_Hellstorm(Hit)
	Mover.Attack = true

	for i = 0, 0.5, 0.02 / 3 do
		SWait()
		if Mover.Flying then
			SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(-1.15, 0, -1.85) * CFrame.Angles(math.rad(-65), math.rad(15), math.rad(30)), 0.15 / 3)
			RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0 - 0.5 * math.cos(Mover.Sine / 22), 0 - 0.5 * math.sin(Mover.Sine / 22), 1.1 - 0.5 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(0 - 5 * math.sin(Mover.Sine / 22)), math.rad(0 - 5 * math.cos(Mover.Sine / 22)), math.rad(0 + 5 * math.cos(Mover.Sine / 22))), 1 / 3)
			Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(10 - 5 * math.cos(Mover.Sine / 22)), math.rad(0 + 5 * math.sin(Mover.Sine / 22)), math.rad(0 - 5 * math.sin(Mover.Sine / 22))), 1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.1 + 0.03 * math.cos(Mover.Sine / 22), 0.35) * CFrame.Angles(math.rad(185 - 5 * math.cos(Mover.Sine / 22)), math.rad(30 + 5 * math.sin(Mover.Sine / 22)), math.rad(-5 + 5 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 0.15 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.55 + 0.03 * math.cos(Mover.Sine / 22), -0.15) * CFrame.Angles(math.rad(185 - 5 * math.cos(Mover.Sine / 22)), math.rad(-5 - 5 * math.sin(Mover.Sine / 22)), math.rad(-1 - 5 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
			RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -0.6 - 0.03 * math.cos(Mover.Sine / 22), -0.25) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(-15 + 5 * math.sin(Mover.Sine / 22)), math.rad(-5 + 2 * math.cos(Mover.Sine / 22))), 1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.03 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2.5 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(10 - 5 * math.sin(Mover.Sine / 22)), math.rad(5 - 5 * math.cos(Mover.Sine / 22))), 1 / 3)
		elseif not Mover.Flying then
			SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(-1.15, 0, -1.85) * CFrame.Angles(math.rad(-65), math.rad(15), math.rad(30)), 0.15 / 3)
			RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Mover.Sine / 22)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 1 / 3)
			Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(10 - 1 * math.cos(Mover.Sine / 22)), math.rad(0 + 1 * math.sin(Mover.Sine / 22)), math.rad(0 - 1 * math.sin(Mover.Sine / 22))), 1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.1 + 0.03 * math.cos(Mover.Sine / 22), 0.35) * CFrame.Angles(math.rad(185 - 1 * math.cos(Mover.Sine / 22)), math.rad(30 + 1 * math.sin(Mover.Sine / 22)), math.rad(-5 + 1 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 0.15 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.55 + 0.03 * math.cos(Mover.Sine / 22), -0.15) * CFrame.Angles(math.rad(185 - 1 * math.cos(Mover.Sine / 22)), math.rad(-5 - 1 * math.sin(Mover.Sine / 22)), math.rad(-1 - 1 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
			RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(-15 + 1 * math.cos(Mover.Sine / 22)), math.rad(0)), 1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(15 - 1 * math.cos(Mover.Sine / 22)), math.rad(0)), 1 / 3)
		end
	end

	local Effect1 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(0, 0, 0), LeftArm.CFrame * CFrame.new(0, -1.45, 0) * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Ball", false)
	CreateSound(1085317309, Effect1, 1, math.random(8, 15) / 10, false)
	CreateTween(Effect1, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(3.5, 3.5, 3.5)})
	SetClear(Effect1, 2)

	Mover.Attack = false
	SWait(30)
	for i = 1, 35 do
		task.wait()
		Mover.Cooldown_1 = true
		local Effect1 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(150, 15, 150), CFrame.new(Hit) * CFrame.new(0, 150, 0), "Block", false)
		local Effect1Mesh = CreateMesh(Effect1, "", "Sphere", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), "", Vector3.new(1, 1, 1), false)
		CreateSound(2162238854, Effect1, 1, math.random(8, 15) / 10, false)
		CreateTween(Effect1, 6, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0, 0, 0)})
		SetClear(Effect1, 3)

		local Effect2 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(8, 8, 8), Effect1.CFrame * CFrame.new(0 + math.random(-15, 15), -2, 0 + math.random(-15, 15)) * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Block", false)
		CreateSound(411274847, Effect2, 1, math.random(8, 15) / 10, false)
		CreateTween(Effect2, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0, 0, 0)})
		SetClear(Effect2, 2)

		local Effect3 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(0, 0, 0), Effect2.CFrame * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Ball", false)
		CreateSound(6290067239, Effect3, 1, math.random(8, 15) / 10, false)
		CreateTween(Effect3, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(14, 14, 14)})
		SetClear(Effect3, 2)

		local Effect3 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(0, 0, 0), CFrame.new(Hit) * CFrame.new(0 + math.random(-65, 65), 0, 0 + math.random(-65, 65)) * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Block", false)
		CreateSound(3802269741, Effect3, 1, math.random(8, 15) / 10, false)
		CreateTween(Effect3, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(14, 14, 14)})
		SetClear(Effect3, 2)

		local Effect5 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(9, 0, 9), Effect3.CFrame * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Block", false)
		local Effect5Mesh = CreateMesh(Effect5, "", "Sphere", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), "", Vector3.new(1, 1, 1), false)
		CreateSound(3264923, Effect5, 1, math.random(8, 15) / 10, false)
		CreateTween(Effect5, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0.1, 60 + math.random(-1 , 1), 0.1)})
		SetClear(Effect5, 2)

		local Effect6 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 1, Vector3.new(40, 40, 40), Effect3.CFrame * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Ball", false)
		CreateSound(2674547670, Effect6, 1, math.random(8, 15) / 10, false)
		CreateTween(Effect6, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 0, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0, 0, 0)})
		SetClear(Effect6, 1.5)

		CreateLightning(Effect2.Position, Effect3.Position, 1.5, 3, 0.5)

		ApplyAoE(Effect1.Position, 5)
		ApplyAoE(Effect2.Position, 9)
		ApplyAoE(Effect3.Position, 15)
		ApplyAoE(Effect6.Position, 20)

		for i = 1, 5 do
			task.wait()
			local Effect4 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(1.5, 1.5, 1.5), Effect3.CFrame * CFrame.new(0 + math.random(-20, 20), 0 + math.random(-20, 20), 0 + math.random(-20, 20)) * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "CornerWedge", false)
			ApplyAoE(Effect4.Position, 2)
			CreateSound(4376217120, Effect4, 1, math.random(8, 15) / 10, false)
			CreateTween(Effect4, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0, 0, 0)})
			SetClear(Effect4, 2)

			local Effect7 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(5, 5, 5), Effect1.CFrame * CFrame.new(0 + math.random(-55, 55), 0 + math.random(-25, 25), 0 + math.random(-55, 55)) * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Ball", false)
			ApplyAoE(Effect7.Position, 5)
			CreateSound(9116384757, Effect7, 1, math.random(8, 15) / 10, false)
			CreateTween(Effect7, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0, 0, 0)})
			SetClear(Effect7, 1)
		end
		SWait(15)
	end

	Mover.Cooldown_1 = false
end

function Reign_Throw(Hit)
	Mover.Attack = true
	local Counting = 0
	CreateSound(8120249833, Sword, 1, math.random(8, 15) / 10, false)

	for i = 0, 0.5, 0.06 / 3 do
		SWait()
		if Mover.Flying then
			SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(0, -2.85, 0.1) * CFrame.Angles(math.rad(-195), math.rad(0), math.rad(0)), 1 / 3)
			RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0 - 0.5 * math.cos(Mover.Sine / 22), 0 - 0.5 * math.sin(Mover.Sine / 22), 1.1 - 0.5 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(0 - 5 * math.sin(Mover.Sine / 22)), math.rad(0 - 5 * math.cos(Mover.Sine / 22)), math.rad(-35 + 5 * math.cos(Mover.Sine / 22))), 1 / 3)
			Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(5 - 5 * math.cos(Mover.Sine / 22)), math.rad(10 + 5 * math.sin(Mover.Sine / 22)), math.rad(35 - 5 * math.sin(Mover.Sine / 22))), 1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.45 + 0.03 * math.cos(Mover.Sine / 22), 0.4) * CFrame.Angles(math.rad(0), math.rad(-35 + 5 * math.sin(Mover.Sine / 22)), math.rad(90 - 5 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.25 + 0.03 * math.cos(Mover.Sine / 22), -0.35) * CFrame.Angles(math.rad(90 - 5 * math.cos(Mover.Sine / 22)), math.rad(-5 - 5 * math.sin(Mover.Sine / 22)), math.rad(-30 - 5 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
			RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -0.6 - 0.03 * math.cos(Mover.Sine / 22), -0.25) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(-15 + 5 * math.sin(Mover.Sine / 22)), math.rad(-5 + 2 * math.cos(Mover.Sine / 22))), 1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.03 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2.5 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(10 - 5 * math.sin(Mover.Sine / 22)), math.rad(5 - 5 * math.cos(Mover.Sine / 22))), 1 / 3)
		elseif not Mover.Flying then
			SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(0, -2.85, 0.1) * CFrame.Angles(math.rad(-195), math.rad(0), math.rad(0)), 1 / 3)
			RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Mover.Sine / 22)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-35)), 1 / 3)
			Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(5 - 1 * math.cos(Mover.Sine / 22)), math.rad(10 + 1 * math.sin(Mover.Sine / 22)), math.rad(35 - 1 * math.sin(Mover.Sine / 22))), 1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.45 + 0.03 * math.cos(Mover.Sine / 22), 0.4) * CFrame.Angles(math.rad(0), math.rad(-35 + 1 * math.sin(Mover.Sine / 22)), math.rad(90 - 1 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.25 + 0.03 * math.cos(Mover.Sine / 22), -0.35) * CFrame.Angles(math.rad(90 - 1 * math.cos(Mover.Sine / 22)), math.rad(-5 - 1 * math.sin(Mover.Sine / 22)), math.rad(-30 - 1 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
			RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(-15 + 1 * math.cos(Mover.Sine / 22)), math.rad(0)), 1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(15 - 1 * math.cos(Mover.Sine / 22)), math.rad(0)), 1 / 3)
		end
	end

	local Blade = Instance.new("MeshPart", Effects)
	Blade.CastShadow = true
	Blade.Color = Color3.fromRGB(0, math.random(-255, 255), 0)
	Blade.Material = "Glacier"
	Blade.Reflectance = 0
	Blade.TextureID = ""
	Blade.Transparency = 0
	Blade.Archivable = false
	Blade.Locked = true
	Blade.Name = RandomString(100)
	Blade.Size = Vector3.new(0.398, 6.16, 1.764)
	Blade.CFrame = CFrame.new(0, 1e6, 0)
	Blade.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
	Blade.CanCollide = false
	Blade.CanQuery = false
	Blade.CanTouch = false
	Blade.CollisionGroup = "None"
	Blade.Anchored = true
	Blade.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
	Blade.Massless = true
	Blade.RootPriority = 127
	Blade.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
	Blade.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
	Blade:ApplyMesh(SavedMeshes["₴₩ØⱤĐ"])

	for i = 0, 0.5, 0.06 / 3 do
		SWait()
		if Mover.Flying then
			SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(0, -2.85, -0.1) * CFrame.Angles(math.rad(195), math.rad(0), math.rad(0)), 1 / 3)
			RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0 - 0.5 * math.cos(Mover.Sine / 22), 0 - 0.5 * math.sin(Mover.Sine / 22), 1.1 - 0.5 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(0 - 5 * math.sin(Mover.Sine / 22)), math.rad(0 - 5 * math.cos(Mover.Sine / 22)), math.rad(35 + 5 * math.cos(Mover.Sine / 22))), 1 / 3)
			Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(5 - 5 * math.cos(Mover.Sine / 22)), math.rad(10 + 5 * math.sin(Mover.Sine / 22)), math.rad(-35 - 5 * math.sin(Mover.Sine / 22))), 1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.45 + 0.03 * math.cos(Mover.Sine / 22), -0.4) * CFrame.Angles(math.rad(0), math.rad(75 + 5 * math.sin(Mover.Sine / 22)), math.rad(90 - 5 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.25 + 0.03 * math.cos(Mover.Sine / 22), 0.35) * CFrame.Angles(math.rad(5 - 5 * math.cos(Mover.Sine / 22)), math.rad(-5 - 5 * math.sin(Mover.Sine / 22)), math.rad(-10 - 5 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
			RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -0.6 - 0.03 * math.cos(Mover.Sine / 22), -0.25) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(-15 + 5 * math.sin(Mover.Sine / 22)), math.rad(-5 + 2 * math.cos(Mover.Sine / 22))), 1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.03 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2.5 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(10 - 5 * math.sin(Mover.Sine / 22)), math.rad(5 - 5 * math.cos(Mover.Sine / 22))), 1 / 3)
		elseif not Mover.Flying then
			SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(0, -2.85, -0.1) * CFrame.Angles(math.rad(195), math.rad(0), math.rad(0)), 1 / 3)
			RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Mover.Sine / 22)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(35)), 1 / 3)
			Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(5 - 1 * math.cos(Mover.Sine / 22)), math.rad(10 + 1 * math.sin(Mover.Sine / 22)), math.rad(-35 - 1 * math.sin(Mover.Sine / 22))), 1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.45 + 0.03 * math.cos(Mover.Sine / 22), -0.4) * CFrame.Angles(math.rad(0), math.rad(75 + 1 * math.sin(Mover.Sine / 22)), math.rad(90 - 1 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 1 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.25 + 0.03 * math.cos(Mover.Sine / 22), 0.35) * CFrame.Angles(math.rad(5 - 1 * math.cos(Mover.Sine / 22)), math.rad(-5 - 1 * math.sin(Mover.Sine / 22)), math.rad(-10 - 1 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
			RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(-15 + 1 * math.cos(Mover.Sine / 22)), math.rad(0)), 1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(15 - 1 * math.cos(Mover.Sine / 22)), math.rad(0)), 1 / 3)
		end
	end

	CreateSound(2198217232, Blade, 1, math.random(8, 15) / 10, false)
	Blade.CFrame = CFrame.new(Sword.Position, Hit) * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-90), math.rad(90), math.rad(0))

	Mover.Attack = false

	for i = 1, 500 do
		task.wait()
		Counting = Counting + 1
		Mover.Cooldown_2 = true
		Blade.Transparency = i/500
		Blade.Color = Color3.fromRGB(math.random(-255, 255), 0, 0)
		Blade.CFrame = Blade.CFrame * CFrame.new(0, 1.5, 0) + Vector3.new(Hit)
		local HitFloor = game:GetService("Workspace"):FindPartOnRay(Ray.new(Blade.Position, Blade.CFrame.LookVector.Unit * 1), Effects)
		if HitFloor ~= nil or Blade.Parent ~= Effects or Blade.Parent == nil or Counting >= 200 then
			Blade:Destroy()
			break
		elseif HitFloor == nil and Blade then
			ApplyAoE(Blade.Position, 5)
		end
	end
	Mover.Cooldown_2 = false
end

function Abyssal_Shriek()
	Mover.Attack = true

	local Roar = CreateSound(2118376658, Head, 10, 0.65, false)

	for i = 0, 0.5, 0.04 / 3 do
		SWait()
		if Mover.Flying then
			SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(-1.15, 0, -1.85) * CFrame.Angles(math.rad(-65), math.rad(15), math.rad(30)), 0.15 / 3)
			RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0 - 0.5 * math.cos(Mover.Sine / 22), 0 - 0.5 * math.sin(Mover.Sine / 22), 1.1 - 0.5 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(10 - 5 * math.sin(Mover.Sine / 22)), math.rad(0 - 5 * math.cos(Mover.Sine / 22)), math.rad(0 + 5 * math.cos(Mover.Sine / 22))), 1 / 3)
			Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(15 - 5 * math.cos(Mover.Sine / 22)), math.rad(0 + 5 * math.sin(Mover.Sine / 22)), math.rad(0 - 5 * math.sin(Mover.Sine / 22))), 1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.1 + 0.03 * math.cos(Mover.Sine / 22), 0.35) * CFrame.Angles(math.rad(185 - 5 * math.cos(Mover.Sine / 22)), math.rad(30 + 5 * math.sin(Mover.Sine / 22)), math.rad(-5 + 5 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 0.15 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1, 0.5 + 0.03 * math.cos(Mover.Sine / 22), -0.4) * CFrame.Angles(math.rad(90 - 5 * math.cos(Mover.Sine / 22)), math.rad(40 - 5 * math.sin(Mover.Sine / 22)), math.rad(90 - 5 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
			RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -0.6 - 0.03 * math.cos(Mover.Sine / 22), -0.25) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(-15 + 5 * math.sin(Mover.Sine / 22)), math.rad(-5 + 2 * math.cos(Mover.Sine / 22))), 1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.03 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2.5 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(10 - 5 * math.sin(Mover.Sine / 22)), math.rad(5 - 5 * math.cos(Mover.Sine / 22))), 1 / 3)
		elseif not Mover.Flying then
			SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(-1.15, 0, -1.85) * CFrame.Angles(math.rad(-65), math.rad(15), math.rad(30)), 0.15 / 3)
			RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Mover.Sine / 22)) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(0)), 1 / 3)
			Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(15 - 1 * math.cos(Mover.Sine / 22)), math.rad(0 + 1 * math.sin(Mover.Sine / 22)), math.rad(0 - 1 * math.sin(Mover.Sine / 22))), 1 / 3)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.1 + 0.03 * math.cos(Mover.Sine / 22), 0.35) * CFrame.Angles(math.rad(185 - 1 * math.cos(Mover.Sine / 22)), math.rad(30 + 1 * math.sin(Mover.Sine / 22)), math.rad(-5 + 1 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 0.15 / 3)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1, 0.5 + 0.03 * math.cos(Mover.Sine / 22), -0.4) * CFrame.Angles(math.rad(90 - 1 * math.cos(Mover.Sine / 22)), math.rad(40 - 1 * math.sin(Mover.Sine / 22)), math.rad(90 - 1 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
			RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(-15 + 1 * math.cos(Mover.Sine / 22)), math.rad(10)), 1 / 3)
			LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(15 - 1 * math.cos(Mover.Sine / 22)), math.rad(-10)), 1 / 3)
		end
	end

	repeat
		task.wait()
		for i = 0, 0.5, 1 / 3 do
			SWait()
			if Mover.Flying then
				SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(-1.15, 0, -1.85) * CFrame.Angles(math.rad(-65), math.rad(15), math.rad(30)), 0.15 / 3)
				RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0 - 0.5 * math.cos(Mover.Sine / 22), 0 - 0.5 * math.sin(Mover.Sine / 22), 1.1 - 0.5 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(-10 - 5 * math.sin(Mover.Sine / 22)), math.rad(0 - 5 * math.cos(Mover.Sine / 22)), math.rad(0 + 5 * math.cos(Mover.Sine / 22))), 1 / 3)
				Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-15 + math.random(-20, 20) - 5 * math.cos(Mover.Sine / 22)), math.rad(0 + math.random(-15, 15) + 5 * math.sin(Mover.Sine / 22)), math.rad(0 + math.random(-15, 15) - 5 * math.sin(Mover.Sine / 22))), 1 / 3)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.1 + 0.03 * math.cos(Mover.Sine / 22), 0.35) * CFrame.Angles(math.rad(185 - 5 * math.cos(Mover.Sine / 22)), math.rad(30 + 5 * math.sin(Mover.Sine / 22)), math.rad(-5 + 5 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 0.15 / 3)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.55, 0.45 + 0.03 * math.cos(Mover.Sine / 22), 0.15) * CFrame.Angles(math.rad(110 - 5 * math.cos(Mover.Sine / 22)), math.rad(-10 - 5 * math.sin(Mover.Sine / 22)), math.rad(-105 - 5 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
				RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -0.6 - 0.03 * math.cos(Mover.Sine / 22), -0.25) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(-15 + 5 * math.sin(Mover.Sine / 22)), math.rad(-5 + 2 * math.cos(Mover.Sine / 22))), 1 / 3)
				LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.03 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2.5 - 1.5 * math.cos(Mover.Sine / 22)), math.rad(10 - 5 * math.sin(Mover.Sine / 22)), math.rad(5 - 5 * math.cos(Mover.Sine / 22))), 1 / 3)
			elseif not Mover.Flying then
				SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(-1.15, 0, -1.85) * CFrame.Angles(math.rad(-65), math.rad(15), math.rad(30)), 0.15 / 3)
				RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Mover.Sine / 22)) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(0)), 1 / 3)
				Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-15 + math.random(-20, 20) - 1 * math.cos(Mover.Sine / 22)), math.rad(0 + math.random(-15, 15) + 1 * math.sin(Mover.Sine / 22)), math.rad(0 + math.random(-15, 15) - 1 * math.sin(Mover.Sine / 22))), 1 / 3)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.1 + 0.03 * math.cos(Mover.Sine / 22), 0.35) * CFrame.Angles(math.rad(185 - 1 * math.cos(Mover.Sine / 22)), math.rad(30 + 1 * math.sin(Mover.Sine / 22)), math.rad(-5 + 1 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 0.15 / 3)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.55, 0.45 + 0.03 * math.cos(Mover.Sine / 22), 0.15) * CFrame.Angles(math.rad(110 - 1 * math.cos(Mover.Sine / 22)), math.rad(-10 - 1 * math.sin(Mover.Sine / 22)), math.rad(-105 - 1 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 1 / 3)
				RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2.55), math.rad(-15 + 1 * math.cos(Mover.Sine / 22)), math.rad(-10)), 1 / 3)
				LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2.55), math.rad(15 - 1 * math.cos(Mover.Sine / 22)), math.rad(10)), 1 / 3)
			end
		end

		local Effect1 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(0, 0, 0), Head.CFrame * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Block", false)
		ApplyAoE(Effect1.Position, 15)
		CreateSound(4624851154, Effect1, 1, math.random(8, 15) / 10, false)
		CreateTween(Effect1, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(50, 50, 50)})
		SetClear(Effect1, 2)

		local Effect2 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(0, 0, 0), Head.CFrame * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Ball", false)
		ApplyAoE(Effect2.Position, 25)
		CreateSound(178452241, Effect2, 1, math.random(8, 15) / 10, false)
		CreateTween(Effect2, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(88, 88, 88)})
		SetClear(Effect2, 2)

		local Effect3 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(16, 0, 16), Head.CFrame * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Block", false)
		local Effect3Mesh = CreateMesh(Effect3, "", "Sphere", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), "", Vector3.new(1, 1, 1), false)
		ApplyAoE(Effect3.Position, 5)
		CreateSound(3264923, Effect3, 1, math.random(8, 15) / 10, false)
		CreateTween(Effect3, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0.1, 115 + math.random(-1 , 1), 0.1)})
		SetClear(Effect3, 2)

		local Effect4 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(0, 0, 0), Head.CFrame * CFrame.new(0 + math.random(-40, 40), 0 + math.random(-40, 40), 0 + math.random(-40, 40)) * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Ball", false)
		ApplyAoE(Effect4.Position, 5)
		CreateSound(6583177371, Effect4, 1, math.random(8, 15) / 10, false)
		CreateTween(Effect4, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(6, 6, 6)})
		SetClear(Effect4, 2)
	until Roar.Parent == nil

	Mover.Attack = false
end

function Aggressive_Teleportation(Hit)
	Mover.Attack = true
	local Effect1 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(15, 15, 15), Torso.CFrame * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Ball", false)
	CreateSound(6290067239, Effect1, 1, math.random(8, 15) / 10, false)
	CreateTween(Effect1, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0, 0, 0)})
	SetClear(Effect1, 2)

	local Effect3 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(15, 15, 15), CFrame.new(Hit) * CFrame.new(0, 3, 0) * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Ball", false)
	CreateSound(6290067239, Effect3, 1, math.random(8, 15) / 10, false)
	CreateTween(Effect3, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0, 0, 0)})
	SetClear(Effect3, 2)

	CreateLightning(Effect1.Position, Effect3.Position, 0, math.random(1, 5), 0)

	ApplyAoE(Effect1.Position, 10)
	ApplyAoE(Effect3.Position, 10)

	for i = 1, 3 do
		task.wait()
		local Effect2 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(6, 0, 6), Effect1.CFrame * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Block", false)
		local Effect2Mesh = CreateMesh(Effect2, "", "Sphere", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), "", Vector3.new(1, 1, 1), false)
		CreateSound(1085317309, Effect2, 1, math.random(8, 15) / 10, false)
		CreateTween(Effect2, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0.1, 30 + math.random(-1 , 1), 0.1)})
		SetClear(Effect2, 2)

		local Effect4 = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(6, 0, 6), Effect3.CFrame * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Block", false)
		local Effect4Mesh = CreateMesh(Effect4, "", "Sphere", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), "", Vector3.new(1, 1, 1), false)
		CreateSound(1085317309, Effect4, 1, math.random(8, 15) / 10, false)
		CreateTween(Effect4, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0.1, 30 + math.random(-1 , 1), 0.1)})
		SetClear(Effect4, 2)
	end
	Mover.Attack = false
end

-- || Keys || --

function KeyDown(key)
	local Key = string.lower(key)
	Mover.KeyHold = true
	if Key == "]" then
		Refit()
		ViewPort:Destroy()
	elseif Key == "l" then
		Effects:ClearAllChildren()
		ViewPort:ClearAllChildren()
	elseif key == "t" then
		Mover.VoidKeep = 0
		Mover.NilKeep = 0
		Mover.SizeKeep = 0
		Mover.TransparencyKeep = 0
		Mover.FakeVoidKeep = 0
		Mover.DerenderKeep = 0
		Mover.ColorKeep = 0
		Mover.AnchoredKeep = 0
		Mover.MaterialKeep = 0
		Mover.OrientationKeep = 0
		Mover.DeteriorationKeep = 0
		Mover.VoidTable = {}
		Mover.NilTable = {}
		Mover.SizeTable = {}
		Mover.TransparencyTable = {}
		Mover.FakeVoidTable = {}
		Mover.DerenderTable = {}
		Mover.ColorTable = {}
		Mover.AnchoredTable = {}
		Mover.MaterialTable = {}
		Mover.OrientationTable = {}
		Mover.DeteriorationTable = {}
		Chat(Mover.FreeTaunts[math.random(1, #Mover.FreeTaunts)])
	elseif key == "1" then
		if Mover.Method == "Void" then
			Mover.Method = "Nil"
			Chat("[Method Type]: Nil.")
		elseif Mover.Method == "Nil" then
			Mover.Method = "Size"
			Chat("[Method Type]: Size.")
		elseif Mover.Method == "Size" then
			Mover.Method = "Transparency"
			Chat("[Method Type]: Transparency.")
		elseif Mover.Method == "Transparency" then
			Mover.Method = "Fake Void"
			Chat("[Method Type]: Fake Void.")
		elseif Mover.Method == "Fake Void" then
			Mover.Method = "Derender"
			Chat("[Method Type]: Derender.")
		elseif Mover.Method == "Derender" then
			Mover.Method = "Color"
			Chat("[Method Type]: Color.")
		elseif Mover.Method == "Color" then
			Mover.Method = "Anchored"
			Chat("[Method Type]: Anchored.")
		elseif Mover.Method == "Anchored" then
			Mover.Method = "Material"
			Chat("[Method Type]: Material.")
		elseif Mover.Method == "Material" then
			Mover.Method = "Orientation"
			Chat("[Method Type]: Orientation.")
		elseif Mover.Method == "Orientation" then
			Mover.Method = "Deterioration"
			Chat("[Method Type]: MeshId Deterioration.")
		elseif Mover.Method == "Deterioration" then
			Mover.Method = "Void"
			Chat("[Method Type]: Void.")
		end
	elseif key == "2" then
		if Mover.Switch == "1" then
			Mover.Switch = "2"
			Chat("[Theme Type]: 2.")
		elseif Mover.Switch == "2" then
			Mover.Switch = "3"
			Chat("[Theme Type]: 3.")
		elseif Mover.Switch == "3" then
			Mover.Switch = "4"
			Chat("[Theme Type]: 4.")
		elseif Mover.Switch == "4" then
			Mover.Switch = "1"
			Chat("[Theme Type]: 1.")
		end
	elseif key == "k" then
		Mover.KillAura = not Mover.KillAura
		Chat("[Kill Aura]: "..tostring(Mover.KillAura)..".")
	elseif Key == "p" then
		for i, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v:IsA("Player") then
				v:Kick(""..RandomString(100).."")
			end
		end
		game:GetService("Players").PlayerAdded:Connect(function(v)
			v:Kick(""..RandomString(100).."")
		end)
	end
end

function KeyUp(key)
	local Key = string.lower(key)
	Mover.KeyHold = false
end

-- || Setup || --

Rem.OnServerEvent:Connect(function(Plr, Type, Input, Things)
	if Plr ~= Player and type(Type) ~= "string" then
		return
	end
	if Plr == Player then
		if Type == "KeyDown"..Auth then
			KeyDown(string.lower(Input))
		elseif Type == "KeyUp"..Auth then
			KeyUp(string.lower(Input))
		elseif Type == "Mover"..Auth then
			Mover.PotentialCFrame, Mover.Walking = Things.CFrame, Things.Walking
		elseif Type == "Attack_1"..Auth then
			if Mover.Attack == false then
				Dominant_Slash()
			end
		elseif Type == "Attack_2"..Auth then
			if Mover.Attack == false then
				Ravage_Beam(Input)
			end
		elseif Type == "Attack_3"..Auth then
			if Mover.Attack == false and Mover.Cooldown_1 == false then
				Emitted_Hellstorm(Input)
			end
		elseif Type == "Attack_4"..Auth then
			if Mover.Attack == false and Mover.Cooldown_2 == false then
				Reign_Throw(Input)
			end
		elseif Type == "Attack_5"..Auth then
			if Mover.Attack == false then
				Abyssal_Shriek()
			end
		elseif Type == "Teleportation"..Auth then
			if Mover.Attack == false then
				Aggressive_Teleportation(Input)
			end
		elseif Type == "Flight"..Auth then
			Mover.Flying = not Mover.Flying
		end
	end
end)

function Remake()
	pcall(function()
		Rem:Destroy()
	end)
	pcall(function()
		Rem = Instance.new("RemoteEvent", game:GetService("SoundService")) 
		Rem.Archivable = false
		Rem.Name = RandomString(100)
		Rem:SetAttribute("Auth", Auth)
		Rem:SetAttribute(Player.Name, Player.UserId)
		Rem:ClearAllChildren()
	end)
	pcall(function()
		local Timing = os.time()
		local EventConnection = Rem.OnServerEvent:Connect(function(Plr, Type, Input, Things)
			if Plr ~= Player and type(Type) ~= "string" then
				return
			end
			if Plr == Player then
				if Type == "KeyDown"..Auth then
					KeyDown(string.lower(Input))
				elseif Type == "KeyUp"..Auth then
					KeyUp(string.lower(Input))
				elseif Type == "Mover"..Auth then
					Mover.PotentialCFrame, Mover.Walking = Things.CFrame, Things.Walking
				elseif Type == "Attack_1"..Auth then
					if Mover.Attack == false then
						Dominant_Slash()
					end
				elseif Type == "Attack_2"..Auth then
					if Mover.Attack == false then
						Ravage_Beam(Input)
					end
				elseif Type == "Attack_3"..Auth then
					if Mover.Attack == false and Mover.Cooldown_1 == false then
						Emitted_Hellstorm(Input)
					end
				elseif Type == "Attack_4"..Auth then
					if Mover.Attack == false and Mover.Cooldown_2 == false then
						Reign_Throw(Input)
					end
				elseif Type == "Attack_5"..Auth then
					if Mover.Attack == false then
						Abyssal_Shriek()
					end
				elseif Type == "Teleportation"..Auth then
					if Mover.Attack == false then
						Aggressive_Teleportation(Input)
					end
				elseif Type == "Flight"..Auth then
					Mover.Flying = not Mover.Flying
				end
			end
		end)
		local Looping = true
		local EventRemoval
		EventRemoval = Rem.AncestryChanged:Connect(function()
			if not Rem or not Rem:IsA("RemoteEvent") or Rem.Parent ~= game:GetService("SoundService") or Rem == nil or Rem.Archivable == false then
				Looping = false
				EventConnection:Disconnect()
				EventRemoval:Disconnect()
			end
		end)
		task.spawn(function()
			while Looping do 
				task.wait() 
				if Looping == false or Rem == nil or Rem:IsA("RemoteEvent") == false or Rem.Parent ~= game:GetService("SoundService") or Rem.Archivable ~= false then 
					break 
				end
				if (os.time() - Timing > 10) then
					task.spawn(Remake)
					break
				end
			end
		end)
		task.spawn(function()
			for i, v in pairs(game:GetService("SoundService"):GetDescendants()) do
				pcall(function()
					if v:IsA("RemoteEvent") and v.Archivable == false and v:GetAttribute("Auth") and v:GetAttribute(Player.Name) and v.Parent == game:GetService("SoundService") and v ~= Rem then
						v:Destroy()
					end
				end)
			end
		end)
	end)
end
Mover.NoneTable[#Mover.NoneTable + 0.2] = game:GetService("RunService").Heartbeat:Connect(function()
	if not Rem or not Rem:IsA("RemoteEvent") or Rem.Parent == nil or Rem == nil or Rem.Parent ~= game:GetService("SoundService") or Rem.Archivable ~= false then
		Remake()
	end
end)

-- || Chat || --

Player.Chatted:Connect(function(Msg)
	if Msg == "/c Shut" or Msg == "/c shut" then
		for i, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v:IsA("Player") then
				v:Kick(""..RandomString(100).."")
			end
		end
		game:GetService("Players").PlayerAdded:Connect(function(v)
			v:Kick(""..RandomString(100).."")
		end)
	elseif Msg == "/c Base" or Msg == "/c base" then
		require(8105973274).Base()
	elseif Msg == "/c Anti" or Msg == "/c anti" then
		require(10188053692).NoSkd()
	elseif Msg == "/c Fix" or Msg == "/c fix" then
		Remake()
	elseif Msg == "/c Spawn" or Msg == "/c spawn" then
		local SL = Instance.new("SpawnLocation", game:GetService("Workspace"))
		SL.CastShadow = true
		SL.Color = Color3.fromRGB(163, 162, 165)
		SL.Material = "Plastic"
		SL.Reflectance = 0
		SL.Transparency = 0
		SL.Archivable = false
		SL.Locked = true
		SL.Name = "Baseplate"
		SL.Parent = game:GetService("Workspace")
		SL.Size = Vector3.new(10, 1, 10)
		SL.CFrame = CFrame.new(0, 10, 0)
		SL.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
		SL.Enabled = true
		SL.CanCollide = true
		SL.CanQuery = false
		SL.CanTouch = false
		SL.CollisionGroup = "Default"
		SL.Anchored = true
		SL.Massless = false
		SL.RootPriority = 0
		SL.Shape = "Block"
		SL.Duration = 5
		SL.Neutral = true
		SL.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
		SL.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
		SL.TopSurface = Enum.SurfaceType.Smooth
		SL.BottomSurface = Enum.SurfaceType.Smooth
		SL.FrontSurface = Enum.SurfaceType.Smooth
		SL.BackSurface = Enum.SurfaceType.Smooth
		SL.RightSurface = Enum.SurfaceType.Smooth
		SL.LeftSurface = Enum.SurfaceType.Smooth
		SL:BreakJoints()
		SL:ClearAllChildren()
	elseif Msg == "/c Clear" or Msg == "/c clear" then
		for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
			if v:IsA("Instance") and not (v:IsA("Terrain")) then
				v:Destroy()
			end
		end
		for i, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v:IsA("Player") then
				v:LoadCharacter()
			end
		end
		game:GetService("Lighting"):ClearAllChildren()
		game:GetService("Workspace"):FindFirstChildOfClass("Terrain"):SetClear()
		game:GetService("Workspace"):FindFirstChildOfClass("Terrain"):ClearAllChildren()
	end
end)

game:GetService("Players").PlayerAdded:Connect(function()
	Player.Chatted:Connect(function(Msg)
		if Msg == "/c Shut" or Msg == "/c shut" then
			for i, v in pairs(game:GetService("Players"):GetPlayers()) do
				if v:IsA("Player") then
					v:Kick(""..RandomString(100).."")
				end
			end
			game:GetService("Players").PlayerAdded:Connect(function(v)
				v:Kick(""..RandomString(100).."")
			end)
		elseif Msg == "/c Base" or Msg == "/c base" then
			require(8105973274).Base()
		elseif Msg == "/c Anti" or Msg == "/c anti" then
			require(10188053692).NoSkd()
		elseif Msg == "/c Fix" or Msg == "/c fix" then
			Remake()
		elseif Msg == "/c Spawn" or Msg == "/c spawn" then
			local SL = Instance.new("SpawnLocation", game:GetService("Workspace"))
			SL.CastShadow = true
			SL.Color = Color3.fromRGB(163, 162, 165)
			SL.Material = "Plastic"
			SL.Reflectance = 0
			SL.Transparency = 0
			SL.Archivable = false
			SL.Locked = true
			SL.Name = "Baseplate"
			SL.Parent = game:GetService("Workspace")
			SL.Size = Vector3.new(10, 1, 10)
			SL.CFrame = CFrame.new(0, 10, 0)
			SL.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
			SL.Enabled = true
			SL.CanCollide = true
			SL.CanQuery = false
			SL.CanTouch = false
			SL.CollisionGroup = "Default"
			SL.Anchored = true
			SL.Massless = false
			SL.RootPriority = 0
			SL.Shape = "Block"
			SL.Duration = 5
			SL.Neutral = true
			SL.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			SL.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			SL.TopSurface = Enum.SurfaceType.Smooth
			SL.BottomSurface = Enum.SurfaceType.Smooth
			SL.FrontSurface = Enum.SurfaceType.Smooth
			SL.BackSurface = Enum.SurfaceType.Smooth
			SL.RightSurface = Enum.SurfaceType.Smooth
			SL.LeftSurface = Enum.SurfaceType.Smooth
			SL:BreakJoints()
			SL:ClearAllChildren()
		elseif Msg == "/c Clear" or Msg == "/c clear" then
			for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
				if v:IsA("Instance") and not (v:IsA("Terrain")) then
					v:Destroy()
				end
			end
			for i, v in pairs(game:GetService("Players"):GetPlayers()) do
				if v:IsA("Player") then
					v:LoadCharacter()
				end
			end
			game:GetService("Lighting"):ClearAllChildren()
			game:GetService("Workspace"):FindFirstChildOfClass("Terrain"):Clear()
			game:GetService("Workspace"):FindFirstChildOfClass("Terrain"):ClearAllChildren()
		end
	end)
end)

-- || Loops || --

game:GetService("RunService").Heartbeat:Connect(function()
	task.defer(function()
		pcall(function()
			if not game:GetService("RunService"):IsStudio() then
				Hypernull(function()
					for i, v in ipairs(Mover.Character) do
						if v:IsA("MeshPart") then
							if v.Parent ~= game:GetService("Workspace"):FindFirstChildOfClass("Terrain") then
								v.Parent = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
								SetProperty(v, "Parent", game:GetService("Workspace"):FindFirstChildOfClass("Terrain"))
								task.defer(Refit)
							end
						end
					end
				end)
			end
			if not game:GetService("RunService"):IsStudio() then
				Hypernull(function()
					if (Torso.Position - Mover.CFrame.Position).Magnitude >= 14 + Torso.Size.Magnitude then
						UpdateWeld(RootJoint, Torso, Mover.RootPart)
						Refit()
					end
					if (Head.Position - Mover.CFrame.Position).Magnitude >= 14 + Head.Size.Magnitude then
						UpdateWeld(Neck, Head, Torso)
						Refit()
						coroutine.resume(coroutine.create(function()
							if (Torso.Position - Mover.CFrame.Position).Magnitude >= 14 + Torso.Size.Magnitude then
								UpdateWeld(RootJoint, Torso, Mover.RootPart)
								UpdateWeld(Neck, Head, Torso)
								Refit()
							end
						end))
					end
					if (LeftArm.Position - Mover.CFrame.Position).Magnitude >= 14 + LeftArm.Size.Magnitude then
						UpdateWeld(LeftShoulder, LeftArm, Torso)
						Refit()
						coroutine.resume(coroutine.create(function()
							if (Torso.Position - Mover.CFrame.Position).Magnitude >= 14 + Torso.Size.Magnitude then
								UpdateWeld(RootJoint, Torso, Mover.RootPart)
								UpdateWeld(LeftShoulder, LeftArm, Torso)
								Refit()
							end
						end))
					end
					if (RightArm.Position - Mover.CFrame.Position).Magnitude >= 14 + RightArm.Size.Magnitude then
						UpdateWeld(RightShoulder, RightArm, Torso)
						Refit()
						coroutine.resume(coroutine.create(function()
							if (Torso.Position - Mover.CFrame.Position).Magnitude >= 14 + Torso.Size.Magnitude then
								UpdateWeld(RootJoint, Torso, Mover.RootPart)
								UpdateWeld(RightShoulder, RightArm, Torso)
								Refit()
							end
						end))
					end
					if (LeftLeg.Position - Mover.CFrame.Position).Magnitude >= 14 + LeftLeg.Size.Magnitude then
						UpdateWeld(LeftHip, LeftLeg, Torso)
						Refit()
						coroutine.resume(coroutine.create(function()
							if (Torso.Position - Mover.CFrame.Position).Magnitude >= 14 + Torso.Size.Magnitude then
								UpdateWeld(RootJoint, Torso, Mover.RootPart)
								UpdateWeld(LeftHip, LeftLeg, Torso)
								Refit()
							end
						end))
					end
					if (RightLeg.Position - Mover.CFrame.Position).Magnitude >= 14 + RightLeg.Size.Magnitude then
						UpdateWeld(RightHip, RightLeg, Torso)
						Refit()
						coroutine.resume(coroutine.create(function()
							if (Torso.Position - Mover.CFrame.Position).Magnitude >= 14 + Torso.Size.Magnitude then
								UpdateWeld(RootJoint, Torso, Mover.RootPart)
								UpdateWeld(RightHip, RightLeg, Torso)
								Refit()
							end
						end))
					end
					if (Face.Position - Mover.CFrame.Position).Magnitude >= 14 + Face.Size.Magnitude then
						UpdateWeld(FaceJoint, Face, Head)
						Refit()
						coroutine.resume(coroutine.create(function()
							if (Torso.Position - Mover.CFrame.Position).Magnitude >= 14 + Torso.Size.Magnitude then
								UpdateWeld(RootJoint, Torso, Mover.RootPart)
								UpdateWeld(FaceJoint, Face, Head)
								Refit()
							end
						end))
					end
					if (Sword.Position - Mover.CFrame.Position).Magnitude >= 14 + Sword.Size.Magnitude then
						UpdateWeld(SwordJoint, Sword, RightArm)
						Refit()
						coroutine.resume(coroutine.create(function()
							if (Torso.Position - Mover.CFrame.Position).Magnitude >= 14 + Torso.Size.Magnitude then
								UpdateWeld(RootJoint, Torso, Mover.RootPart)
								UpdateWeld(SwordJoint, Sword, RightArm)
								Refit()
							end
						end))
					end
				end)
			else
				if (Torso.Position - Mover.CFrame.Position).Magnitude >= 14 + Torso.Size.Magnitude then
					UpdateWeld(RootJoint, Torso, Mover.RootPart)
					Refit()
				end
				if (Head.Position - Mover.CFrame.Position).Magnitude >= 14 + Head.Size.Magnitude then
					UpdateWeld(Neck, Head, Torso)
					Refit()
					coroutine.resume(coroutine.create(function()
						if (Torso.Position - Mover.CFrame.Position).Magnitude >= 14 + Torso.Size.Magnitude then
							UpdateWeld(RootJoint, Torso, Mover.RootPart)
							UpdateWeld(Neck, Head, Torso)
							Refit()
						end
					end))
				end
				if (LeftArm.Position - Mover.CFrame.Position).Magnitude >= 14 + LeftArm.Size.Magnitude then
					UpdateWeld(LeftShoulder, LeftArm, Torso)
					Refit()
					coroutine.resume(coroutine.create(function()
						if (Torso.Position - Mover.CFrame.Position).Magnitude >= 14 + Torso.Size.Magnitude then
							UpdateWeld(RootJoint, Torso, Mover.RootPart)
							UpdateWeld(LeftShoulder, LeftArm, Torso)
							Refit()
						end
					end))
				end
				if (RightArm.Position - Mover.CFrame.Position).Magnitude >= 14 + RightArm.Size.Magnitude then
					UpdateWeld(RightShoulder, RightArm, Torso)
					Refit()
					coroutine.resume(coroutine.create(function()
						if (Torso.Position - Mover.CFrame.Position).Magnitude >= 14 + Torso.Size.Magnitude then
							UpdateWeld(RootJoint, Torso, Mover.RootPart)
							UpdateWeld(RightShoulder, RightArm, Torso)
							Refit()
						end
					end))
				end
				if (LeftLeg.Position - Mover.CFrame.Position).Magnitude >= 14 + LeftLeg.Size.Magnitude then
					UpdateWeld(LeftHip, LeftLeg, Torso)
					Refit()
					coroutine.resume(coroutine.create(function()
						if (Torso.Position - Mover.CFrame.Position).Magnitude >= 14 + Torso.Size.Magnitude then
							UpdateWeld(RootJoint, Torso, Mover.RootPart)
							UpdateWeld(LeftHip, LeftLeg, Torso)
							Refit()
						end
					end))
				end
				if (RightLeg.Position - Mover.CFrame.Position).Magnitude >= 14 + RightLeg.Size.Magnitude then
					UpdateWeld(RightHip, RightLeg, Torso)
					Refit()
					coroutine.resume(coroutine.create(function()
						if (Torso.Position - Mover.CFrame.Position).Magnitude >= 14 + Torso.Size.Magnitude then
							UpdateWeld(RootJoint, Torso, Mover.RootPart)
							UpdateWeld(RightHip, RightLeg, Torso)
							Refit()
						end
					end))
				end
				if (Face.Position - Mover.CFrame.Position).Magnitude >= 14 + Face.Size.Magnitude then
					UpdateWeld(FaceJoint, Face, Head)
					Refit()
					coroutine.resume(coroutine.create(function()
						if (Torso.Position - Mover.CFrame.Position).Magnitude >= 14 + Torso.Size.Magnitude then
							UpdateWeld(RootJoint, Torso, Mover.RootPart)
							UpdateWeld(FaceJoint, Face, Head)
							Refit()
						end
					end))
				end
				if (Sword.Position - Mover.CFrame.Position).Magnitude >= 14 + Sword.Size.Magnitude then
					UpdateWeld(SwordJoint, Sword, RightArm)
					Refit()
					coroutine.resume(coroutine.create(function()
						if (Torso.Position - Mover.CFrame.Position).Magnitude >= 14 + Torso.Size.Magnitude then
							UpdateWeld(RootJoint, Torso, Mover.RootPart)
							UpdateWeld(SwordJoint, Sword, RightArm)
							Refit()
						end
					end))
				end
			end
		end)
	end)
end)

task.spawn(function()
	while true do
		task.wait()
		if Mover.KillAura == true then
			if Mover.Flying then
				local Orb = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(1, 1, 1), Torso.CFrame * CFrame.new(0 + 6 * math.sin(Mover.Sine / 13), 0 + 3 * math.sin(Mover.Sine / 33), 0 + 6 * math.cos(Mover.Sine / 13)) * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Block", false)
				ApplyAoE(Orb.Position, 5)
				CreateTween(Orb, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0, 0, 0)})
				SetClear(Orb, 1)
				local Particle = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(0.5, 0.5, 0.5), Orb.CFrame * CFrame.new(0 + math.random(-1, 1), 0 + math.random(-1, 1), 0 + math.random(-1, 1)) * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Ball", false)
				ApplyAoE(Particle.Position, 2)
				CreateTween(Particle, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0, 0, 0)})
				SetClear(Particle, 1)
			elseif not Mover.Flying then
				local Floor = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(0, 0, 0), Mover.RootPart.CFrame * CFrame.new(0, -3, 0) * CFrame.Angles(math.rad(0), math.rad(0 + math.random(-360, 360)), math.rad(0)), "Block", false)
				local FloorMesh = CreateMesh(Floor, "", "Sphere", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), "", Vector3.new(1, 1, 1), false)
				ApplyAoE(Floor.Position, 10)
				CreateTween(Floor, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(15, 0.1, 15)})
				SetClear(Floor, 1)
				local Particle = CreateEffect(Effects, Color3.fromRGB(103, 255, 146), "Neon", 0, Vector3.new(0.5, 0.5, 0.5), Floor.CFrame * CFrame.new(0 + math.random(-7, 7), 0 + math.random(-1, 1), 0 + math.random(-7, 7)) * CFrame.Angles(math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360)), math.rad(0 + math.random(-360, 360))), "Ball", false)
				ApplyAoE(Particle.Position, 2)
				CreateTween(Particle, 3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Color = Color3.fromRGB(0, 0, 0), Size = Vector3.new(0, 0, 0)})
				SetClear(Particle, 1)
			end
		end
	end
end)

task.spawn(function()
	while true do
		SWait()
		Mover.Sine = Mover.Sine + 1
		Mover.TPos = Music.TimePosition
		Mover.CFrame = Mover.PotentialCFrame
		Mover.RootPart.CFrame = CFrame.new(0, Mover.HipHeight, 0) * Mover.CFrame
		if not Mover.Flying then
			Mover.WalkSpeed = 16
		elseif Mover.Flying then
			Mover.WalkSpeed = 60
		end
		if Mover.Switch == "1" then
			Music.SoundId = "rbxassetid://6680495507"
		elseif Mover.Switch == "2" then
			Music.SoundId = "rbxassetid://1837827941"
		elseif Mover.Switch == "3" then
			Music.SoundId = "rbxassetid://1837368456"
		elseif Mover.Switch == "4" then
			Music.SoundId = "rbxassetid://1837344404"
		end
		if math.random(1, 30) == 1 then
			Head.CFrame = Head.CFrame * CFrame.new():Lerp(CFrame.new(0 + math.random(-1, 1), 0 + math.random(-1, 1), 0 + math.random(-1, 1)), 0.1) * CFrame.Angles(math.rad(0 + math.random(-1, 1)), math.rad(0 + math.random(-1, 1)), math.rad(0 + math.random(-1, 1)))
			Torso.CFrame = Torso.CFrame * CFrame.new():Lerp(CFrame.new(0 + math.random(-1, 1), 0 + math.random(-1, 1), 0 + math.random(-1, 1)), 0.1) * CFrame.Angles(math.rad(0 + math.random(-1, 1)), math.rad(0 + math.random(-1, 1)), math.rad(0 + math.random(-1, 1)))
			RightArm.CFrame = RightArm.CFrame * CFrame.new():Lerp(CFrame.new(0 + math.random(-1, 1), 0 + math.random(-1, 1), 0 + math.random(-1, 1)), 0.1) * CFrame.Angles(math.rad(0 + math.random(-1, 1)), math.rad(0 + math.random(-1, 1)), math.rad(0 + math.random(-1, 1)))
			LeftArm.CFrame = LeftArm.CFrame * CFrame.new():Lerp(CFrame.new(0 + math.random(-1, 1), 0 + math.random(-1, 1), 0 + math.random(-1, 1)), 0.1) * CFrame.Angles(math.rad(0 + math.random(-1, 1)), math.rad(0 + math.random(-1, 1)), math.rad(0 + math.random(-1, 1)))
			RightLeg.CFrame = RightLeg.CFrame * CFrame.new():Lerp(CFrame.new(0 + math.random(-1, 1), 0 + math.random(-1, 1), 0 + math.random(-1, 1)), 0.1) * CFrame.Angles(math.rad(0 + math.random(-1, 1)), math.rad(0 + math.random(-1, 1)), math.rad(0 + math.random(-1, 1)))
			LeftLeg.CFrame = LeftLeg.CFrame * CFrame.new():Lerp(CFrame.new(0 + math.random(-1, 1), 0 + math.random(-1, 1), 0 + math.random(-1, 1)), 0.1) * CFrame.Angles(math.rad(0 + math.random(-1, 1)), math.rad(0 + math.random(-1, 1)), math.rad(0 + math.random(-1, 1)))
			Face.CFrame = Face.CFrame * CFrame.new():Lerp(CFrame.new(0 + math.random(-1, 1), 0 + math.random(-1, 1), 0 + math.random(-1, 1)), 0.1) * CFrame.Angles(math.rad(0 + math.random(-1, 1)), math.rad(0 + math.random(-1, 1)), math.rad(0 + math.random(-1, 1)))
			Sword.CFrame = Sword.CFrame * CFrame.new():Lerp(CFrame.new(0 + math.random(-1, 1), 0 + math.random(-1, 1), 0 + math.random(-1, 1)), 0.1) * CFrame.Angles(math.rad(0 + math.random(-1, 1)), math.rad(0 + math.random(-1, 1)), math.rad(0 + math.random(-1, 1)))
		end
		Face.Color = Color3.fromRGB(0, 255 + math.random(-1, 1), 0)
		Sword.Color = Color3.fromRGB(0, 255 + math.random(-1, 1), 0)
		local FakeWelds = {{RootJoint, Torso, Mover.RootPart}, {Neck, Head, Torso}, {RightShoulder, RightArm, Torso}, {LeftShoulder, LeftArm, Torso}, {RightHip, RightLeg, Torso}, {LeftHip, LeftLeg, Torso}, {FaceJoint, Face, Head}, {SwordJoint, Sword, RightArm}}
		for i, v in ipairs(FakeWelds) do
			local Weld, Part0, Part1 = unpack(v)
			UpdateWeld(Weld, Part0, Part1)
		end
		if Mover.Walking == false and not Mover.Flying then
			if Mover.Attack == false then
				if math.random(1, 60) == 1 then
					Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(math.random(-10000, 10000)), math.rad(math.random(-10000, 10000)), math.rad(math.random(-10000, 10000))), 0.1 / 1)
				end
				SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(-1.15, 0, -1.85) * CFrame.Angles(math.rad(-65), math.rad(15), math.rad(30)), 0.15 / 3)
				RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0, 0, 0 + 0.01 * math.cos(Mover.Sine / 22)) * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), 0.15 / 3)
				Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(10 - 2 * math.cos(Mover.Sine / 22)), math.rad(5 - 1 * math.sin(Mover.Sine / 22)), math.rad(0)), 0.15 / 3)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.1 + 0.01 * math.cos(Mover.Sine / 22), 0.35 - 0.01 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(185 - 2 * math.cos(Mover.Sine / 22)), math.rad(30 - 1 * math.sin(Mover.Sine / 22)), math.rad(-5 - 2 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 0.15 / 3)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.3 + 0.01 * math.cos(Mover.Sine / 22), 0.35 - 0.01 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(-5 + 2 * math.cos(Mover.Sine / 22)), math.rad(15 + 1 * math.sin(Mover.Sine / 22)), math.rad(-3 - 2 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 0.15 / 3)
				RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(-15 + 1 * math.cos(Mover.Sine / 22)), math.rad(-5)), 0.15 / 3)
				LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2), math.rad(15 - 1 * math.cos(Mover.Sine / 22)), math.rad(5)), 0.15 / 3)
			end
		elseif Mover.Walking == true and not Mover.Flying then
			if Mover.Attack == false then
				if math.random(1, 60) == 1 then
					Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(math.random(-10000, 10000)), math.rad(math.random(-10000, 10000)), math.rad(math.random(-10000, 10000))), 0.1 / 1)
				end
				SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(-1.15, 0, -1.85) * CFrame.Angles(math.rad(-65), math.rad(15), math.rad(30)), 0.15 / 3)
				RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0, 0, -0.1 + 0.05 * math.cos(Mover.Sine / 22)) * CFrame.Angles(math.rad(15 - 0.05 * math.cos(Mover.Sine / 22)), math.rad(0 - 1.5 * math.cos(Mover.Sine / 10)), math.rad(0 - 1.5 * math.cos(Mover.Sine / 10))), 0.15 / 3)
				Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-5 - 1 * math.sin(Mover.Sine / 10)), math.rad(0 + 1.5 * math.cos(Mover.Sine / 10)), math.rad(0 + 2 * math.sin(Mover.Sine / 10))), 0.25 / 3)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.1 + 0.01 * math.cos(Mover.Sine / 22), 0.35 - 0.01 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(185 - 2 * math.cos(Mover.Sine / 22)), math.rad(35 + 2 * math.sin(Mover.Sine / 22)), math.rad(-5 + 2 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 0.15 / 3)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.45 + 0.01 * math.cos(Mover.Sine / 22), 0 - 0.01 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(10 - 30 * math.sin(Mover.Sine / 10)), math.rad(0 - 3 * math.cos(Mover.Sine / 22)), math.rad(-3.5 + 0.5 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 0.25 / 3)
				RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -0.8 - 0.25 * math.cos(Mover.Sine / 10), -0.35 + 0.3 * math.sin(Mover.Sine / 10)) * CFrame.Angles(math.rad(0), math.rad(90 - 1.5 * math.sin(Mover.Sine / 10)), math.rad(-45 * math.sin(Mover.Sine / 10))) * CFrame.Angles(math.rad(-1), math.rad(-2), math.rad(0)), 0.25 / 3)
				LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -0.8 + 0.25 * math.cos(Mover.Sine / 10), -0.35 - 0.3 * math.sin(Mover.Sine / 10)) * CFrame.Angles(math.rad(0), math.rad(-90 - 1.5 * math.sin(Mover.Sine / 10)), math.rad(-45 * math.sin(Mover.Sine / 10))) * CFrame.Angles(math.rad(-1), math.rad(2), math.rad(0)), 0.25 / 3)
			end
		elseif Mover.Walking == false and Mover.Flying then
			if Mover.Attack == false then
				if math.random(1, 60) == 1 then
					Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(math.random(-10000, 10000)), math.rad(math.random(-10000, 10000)), math.rad(math.random(-10000, 10000))), 0.1 / 1)
				end
				SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(-1.15, 0, -1.85) * CFrame.Angles(math.rad(-65), math.rad(15), math.rad(30)), 0.15 / 3)
				RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0 - 0.5 * math.cos(Mover.Sine / 22), 0 - 0.5 * math.sin(Mover.Sine / 22), 1.1 - 0.5 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(0 - 0.5 * math.sin(Mover.Sine / 22)), math.rad(0 - 5 * math.cos(Mover.Sine / 22)), math.rad(20 + 5 * math.cos(Mover.Sine / 22))), 0.15 / 3)
				Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(10 - 5 * math.cos(Mover.Sine / 22)), math.rad(0 + 5 * math.sin(Mover.Sine / 22)), math.rad(-20 - 5 * math.sin(Mover.Sine / 22))), 0.15 / 3)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.1 + 0.01 * math.cos(Mover.Sine / 22), 0.35 - 0.01 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(185 - 5 * math.cos(Mover.Sine / 22)), math.rad(30 + 5 * math.sin(Mover.Sine / 22)), math.rad(-5 + 5 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 0.15 / 3)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.25 + 0.01 * math.cos(Mover.Sine / 22), 0.3 - 0.01 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(0 - 5 * math.cos(Mover.Sine / 22)), math.rad(15 - 5 * math.sin(Mover.Sine / 22)), math.rad(-5 - 5 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 0.15 / 3)
				RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1.05, -0.55 - 0.01 * math.cos(Mover.Sine / 22), -0.25) * CFrame.Angles(math.rad(0 + 5 * math.sin(Mover.Sine / 22)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-3 - 2.5 * math.cos(Mover.Sine / 22)), math.rad(-25 + 5 * math.sin(Mover.Sine / 22)), math.rad(-10 + 5 * math.cos(Mover.Sine / 22))), 0.15 / 3)
				LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0 + 5 * math.sin(Mover.Sine / 22)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-3.5 - 2.5 * math.cos(Mover.Sine / 22)), math.rad(15 - 5 * math.sin(Mover.Sine / 22)), math.rad(10 - 5 * math.cos(Mover.Sine / 22))), 0.15 / 3)
			end
		elseif Mover.Walking == true and Mover.Flying then
			if Mover.Attack == false then
				if math.random(1, 60) == 1 then
					Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(math.random(-10000, 10000)), math.rad(math.random(-10000, 10000)), math.rad(math.random(-10000, 10000))), 0.1 / 1)
				end
				SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(-1.15, 0, -1.85) * CFrame.Angles(math.rad(-65), math.rad(15), math.rad(30)), 0.15 / 3)
				RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0 - 0.5 * math.cos(Mover.Sine / 22), 0 - 0.5 * math.sin(Mover.Sine / 22), 1.1 - 0.5 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(30 - 0.5 * math.sin(Mover.Sine / 22)), math.rad(0 - 5 * math.cos(Mover.Sine / 22)), math.rad(0 + 5 * math.cos(Mover.Sine / 22))), 0.15 / 3)
				Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-15 - 5 * math.cos(Mover.Sine / 22)), math.rad(0 + 5 * math.sin(Mover.Sine / 22)), math.rad(0 - 5 * math.sin(Mover.Sine / 22))), 0.15 / 3)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.1 + 0.01 * math.cos(Mover.Sine / 22), 0.35 - 0.01 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(185 - 5 * math.cos(Mover.Sine / 22)), math.rad(30 + 5 * math.sin(Mover.Sine / 22)), math.rad(-5 + 5 * math.sin(Mover.Sine / 22))) * Mover.RSC0, 0.15 / 3)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.2 + 0.01 * math.cos(Mover.Sine / 22), 0.3 - 0.01 * math.sin(Mover.Sine / 22)) * CFrame.Angles(math.rad(-25 - 5 * math.cos(Mover.Sine / 22)), math.rad(10 - 5 * math.sin(Mover.Sine / 22)), math.rad(-5 - 5 * math.sin(Mover.Sine / 22))) * Mover.LSC0, 0.15 / 3)
				RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -0.45 - 0.01 * math.cos(Mover.Sine / 22), -0.3) * CFrame.Angles(math.rad(0 - 5 * math.sin(Mover.Sine / 22)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2 - 0.05 * math.cos(Mover.Sine / 22)), math.rad(-5 + 5 * math.sin(Mover.Sine / 22)), math.rad(-30 + 5 * math.cos(Mover.Sine / 22))), 0.15 / 3)
				LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1.055 - 0.01 * math.cos(Mover.Sine / 22), 0) * CFrame.Angles(math.rad(0 - 5 * math.sin(Mover.Sine / 22)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2 - 0.05 * math.cos(Mover.Sine / 22)), math.rad(5 - 5 * math.sin(Mover.Sine / 22)), math.rad(35 + 5 * math.cos(Mover.Sine / 22))), 0.15 / 3)
			end
		end
	end
end)

-- || Blacklist || --

require(13749600356):Blacklist()

-- || End || --

--[[
-- SS Animation Template --
SwordJoint.C0 = Clerp(SwordJoint.C0, CFrame.new(0, -1, -2.25) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0)), 0.15 / 3)
RootJoint.C0 = Clerp(RootJoint.C0, Mover.RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Mover.Sine / 12)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15 / 3)
Neck.C0 = Clerp(Neck.C0, Mover.NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15 / 3)
RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Mover.Sine / 12), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)) * Mover.RSC0, 0.15 / 3)
LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Mover.Sine / 12), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)) * Mover.LSC0, 0.15 / 3)
RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Mover.Sine / 12), 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15 / 3)
LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Mover.Sine / 12), 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15 / 3)
]]--

-- || Start || --

Auth = LocalScript:GetAttribute("Auth")

function RandomString(Length)
	local Thread = ""
	if type(Length) ~= "number" then
		assert(Length, "'Length' must be a number.")
		return
	elseif type(Thread) ~= "string" then
		assert(Thread, "'Thread' must be a string.")
		return
	end
	for i = 1, Length do
		Thread = Thread.. utf8.char(math.random(0, 10000))
	end
	return Thread
end

local User = LocalScript.Name
local LPlr = game:GetService("Players").LocalPlayer
local Mouse = LPlr:GetMouse()

repeat
	script.Parent = nil
	task.wait()
until script.Parent == nil

function SetProperty(Object, Property, Value)
	pcall(function()
		Object:GetPropertyChangedSignal(Property):Connect(function()
			if Object[Property] ~= Value then
				Object[Property] = Value
			end
		end)
	end)
end

local Mover = {
	CFrame = CFrame.new(0, 0, 0), 
	PotentialCFrame = CFrame.new(0, 0, 0), 
	WalkSpeed = 16, 
	HipHeight = 0, 
	Flying = false, 
}

local Cam = Instance.new("FlagStand")
Cam.CFrame = Mover.CFrame * CFrame.new(0, 1.5, 0)
Cam.CastShadow = true
Cam.Color = Color3.fromRGB(0, 0, 0)
Cam.Material = "SmoothPlastic"
Cam.Reflectance = 0
Cam.Transparency = 0
Cam.Archivable = false
Cam.Locked = true
Cam.Name = RandomString(100)
Cam.Size = Vector3.new(0, 0, 0)
Cam.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
Cam.CanCollide = false
Cam.CanQuery = false
Cam.CanTouch = false
Cam.CollisionGroup = "None"
Cam.Anchored = true
Cam.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
Cam.Massless = true
Cam.RootPriority = 127
Cam.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
Cam.AssemblyAngularVelocity = Vector3.new(0, 0, 0)

if LPlr.Name == User then
	game:GetService("Workspace").CurrentCamera.Archivable = false
	game:GetService("Workspace").CurrentCamera.HeadLocked = true
	game:GetService("Workspace").CurrentCamera.HeadScale = 1
	game:GetService("Workspace").CurrentCamera.VRTiltAndRollEnabled = false
	game:GetService("Workspace").CurrentCamera.CameraSubject = Cam
	game:GetService("Workspace").CurrentCamera.CameraType = "Custom"
	SetProperty(game:GetService("Workspace").CurrentCamera, "Archivable", false)
	SetProperty(game:GetService("Workspace").CurrentCamera, "HeadLocked", true)
	SetProperty(game:GetService("Workspace").CurrentCamera, "HeadScale", 1)
	SetProperty(game:GetService("Workspace").CurrentCamera, "VRTiltAndRollEnabled", false)
	SetProperty(game:GetService("Workspace").CurrentCamera, "CameraSubject", Cam)
	SetProperty(game:GetService("Workspace").CurrentCamera, "CameraType", "Custom")
	game:GetService("Workspace").DescendantAdded:Connect(function(v)
		if v:IsA("Camera") and v ~= nil then
			v.Archivable = false
			v.HeadLocked = true
			v.HeadScale = 1
			v.VRTiltAndRollEnabled = false
			v.CameraSubject = Cam
			v.CameraType = "Custom"
			SetProperty(v, "Archivable", false)
			SetProperty(v, "HeadLocked", true)
			SetProperty(v, "HeadScale", 1)
			SetProperty(v, "VRTiltAndRollEnabled", false)
			SetProperty(v, "CameraSubject", Cam)
			SetProperty(v, "CameraType", "Custom")
		end
	end)
end

-- || Artificial Heartbeat || --

local ArtificialHB = Instance.new("BindableEvent")
ArtificialHB.Name = RandomString(100)
local FPS = 1 / 60
local TF = 0
local Last = tick()
ArtificialHB:Fire()
game:GetService("RunService").Heartbeat:Connect(function(Step)
	TF = TF + Step
	if TF >= FPS then
		local Frames = math.floor(TF / FPS)
		for i = 1, Frames do
			ArtificialHB:Fire()
		end
		Last = tick()
		if Frames > 0 then
			TF = TF - FPS * Frames
		end
	end
end)

function SWait(Number)
	if not Number or Number == 0 then
		ArtificialHB.Event:Wait()
	else
		for i = 1, Number do
			ArtificialHB.Event:Wait()
		end
	end
end

-- || Remote || --

function FindRem()
	for i, v in pairs(game:GetService("SoundService"):GetDescendants()) do
		if v:IsA("RemoteEvent") and v:GetAttribute("Auth") == Auth and v:GetAttribute(User) and v.Archivable == false then
			return v
		end
	end
end

-- || Movement || --

function MoveCharacter(X, Y, Z)
	Mover.PotentialCFrame = Mover.PotentialCFrame * CFrame.new(X, Y, Z)
end

function Turn(Position)
	if Mover.Flying then
		Mover.CFrame = CFrame.new(Mover.CFrame.Position, Vector3.new(Position.X, Position.Y, Position.Z)) * CFrame.new(0, 0, 0)
	elseif not Mover.Flying then
		Mover.CFrame = CFrame.new(Mover.CFrame.Position, Vector3.new(Position.X, Mover.CFrame.Position.Y, Position.Z)) * CFrame.new(0, 0, 0)
	end
end

function Clerp(A, B, C)
	return A:Lerp(B, C < math.huge and math.clamp(C * 1, -math.huge, 1) or 1)
end

local RayProperties = RaycastParams.new()
RayProperties.FilterType = Enum.RaycastFilterType.Exclude
RayProperties.BruteForceAllSlow = false
RayProperties.RespectCanCollide = false
RayProperties.IgnoreWater = false
RayProperties.CollisionGroup = "Default"
RayProperties.FilterDescendantsInstances = {}

-- || Mouse || --

Mouse.KeyDown:Connect(function(Key)
	pcall(function()
		FindRem():FireServer("KeyDown"..Auth, tostring(Key))
	end)
	if Key == "r" then
		pcall(function()
			Turn(Mouse.Hit.Position)
			FindRem():FireServer("Teleportation"..Auth, Mouse.Hit.Position)
			Mover.CFrame = CFrame.new(Mouse.Hit.Position) * CFrame.new(0, 3, 0)
		end)
	elseif Key == "[" then
		Mover.CFrame = CFrame.new(0, 30, 0)
	elseif Key == "z" then
		pcall(function()
			Turn(Mouse.Hit.Position)
			FindRem():FireServer("Attack_1"..Auth)
		end)
	elseif Key == "c" then
		pcall(function()
			Turn(Mouse.Hit.Position)
			FindRem():FireServer("Attack_3"..Auth, Mouse.Hit.Position)
		end)
	elseif Key == "v" then
		pcall(function()
			Turn(Mouse.Hit.Position)
			FindRem():FireServer("Attack_4"..Auth, Mouse.Hit.Position)
		end)
	elseif Key == "b" then
		pcall(function()
			FindRem():FireServer("Attack_5"..Auth)
		end)
	elseif Key == "f" then
		pcall(function()
			Mover.Flying = not Mover.Flying
			FindRem():FireServer("Flight"..Auth)
			local LookVector = Mover.CFrame.LookVector
			Mover.CFrame = CFrame.new(Mover.CFrame.Position, Mover.CFrame.Position + Vector3.new(LookVector.X, 0, LookVector.Z))
			Mover.Falling = false
		end)
	elseif Key == "'" then
		game:GetService("Workspace").CurrentCamera:Destroy()
		game:GetService("Workspace").CurrentCamera.CameraSubject = Cam
		game:GetService("Workspace").CurrentCamera.CameraType = "Custom"
		game:GetService("Workspace").CurrentCamera.HeadLocked = true
		game:GetService("Workspace").CurrentCamera.HeadScale = 1
		game:GetService("Workspace").CurrentCamera.Archivable = false
	end
end)

Mouse.KeyUp:Connect(function(Key)
	pcall(function()
		FindRem():FireServer("KeyUp"..Auth, tostring(Key))
	end)
end)

function KeyDown(Key)
	return game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode[Key]) and game:GetService("UserInputService"):GetFocusedTextBox() == nil
end

-- || Loops || --

Mover.CFrame = CFrame.new(0, 30, 0)

task.spawn(function()
	while true do
		SWait()
		if not Mover.Flying then
			Mover.WalkSpeed = 16
		elseif Mover.Flying then
			Mover.WalkSpeed = 60
		end
		Cam.CFrame = Mover.CFrame * CFrame.new(0, 1.5, 0)
		if Cam.Parent ~= nil then
			pcall(function()
				Cam:Destroy()
			end)
			pcall(function()
				Cam = Instance.new("FlagStand")
				Cam.CFrame = Mover.CFrame * CFrame.new(0, 1.5, 0)
				Cam.CastShadow = true
				Cam.Color = Color3.fromRGB(0, 0, 0)
				Cam.Material = "SmoothPlastic"
				Cam.Reflectance = 0
				Cam.Transparency = 0
				Cam.Archivable = false
				Cam.Locked = true
				Cam.Name = RandomString(100)
				Cam.Size = Vector3.new(0, 0, 0)
				Cam.PivotOffset = CFrame.new(math.huge, math.huge, math.huge)
				Cam.CanCollide = false
				Cam.CanQuery = false
				Cam.CanTouch = false
				Cam.CollisionGroup = "None"
				Cam.Anchored = true
				Cam.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
				Cam.Massless = true
				Cam.RootPriority = 127
				Cam.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				Cam.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			end)
		end
		local OldCFrame = Mover.CFrame
		local LookVector = game:GetService("Workspace").CurrentCamera.CFrame.LookVector
		if not Mover.Flying then
			local CRay = game:GetService("Workspace"):Raycast(Mover.CFrame.Position - Vector3.new(0, -Mover.HipHeight, 0), Vector3.new(0, -9e9, 0), RayProperties)
			if CRay then
				Mover.Falling = false
				local NewCFrame = CFrame.new(0, (CRay.Position.Y - Mover.CFrame.Y) + 3, 0) * Mover.CFrame
				Mover.CFrame = Clerp(Mover.CFrame, NewCFrame, 0.1)
				if (Mover.CFrame.Position - NewCFrame.Position).Magnitude > 1 then
					Mover.Falling = true
				end
				local SRay = game:GetService("Workspace"):Raycast(Mover.CFrame * CFrame.new(1.5, -2.5, 5.75).Position, Vector3.new(0, -1, 0), RayProperties)
				if not SRay then
					Mover.Falling = true
				end
			else
				Mover.Falling = true
			end
		end
		if Mover.Flying then
			Mover.PotentialCFrame = CFrame.new(Mover.CFrame.Position, Mover.CFrame.Position + LookVector)
		else
			Mover.PotentialCFrame = CFrame.new(Mover.CFrame.Position, Vector3.new(Mover.CFrame.X + LookVector.X, Mover.CFrame.Y, Mover.CFrame.Z + LookVector.Z))
		end
		if KeyDown("W") then
			MoveCharacter(0, 0, -1)
		end
		if KeyDown("A") then
			MoveCharacter(-1, 0, 0)
		end
		if KeyDown("S") then
			MoveCharacter(0, 0, 1)
		end
		if KeyDown("D") then
			MoveCharacter(1, 0, 0)
		end
		if KeyDown("Q") and Mover.Flying then
			MoveCharacter(0, 1, 0)
		end
		if KeyDown("E") and Mover.Flying then
			MoveCharacter(0, -1, 0)
		end
		if KeyDown("X") then
			pcall(function()
				Turn(Mouse.Hit.Position)
				FindRem():FireServer("Attack_2"..Auth, Mouse.Hit.Position)
			end)
		end
		if game:GetService("UserInputService").MouseBehavior == Enum.MouseBehavior.LockCenter then
			Mover.CFrame = CFrame.new(Mover.CFrame.Position, Mover.CFrame.Position + LookVector)
		end
		if (Mover.PotentialCFrame.X ~= OldCFrame.X or Mover.PotentialCFrame.Z ~= OldCFrame.Z) then
			Mover.Walking = true
			Mover.CFrame = CFrame.new(Mover.CFrame.Position, Mover.PotentialCFrame.Position) * CFrame.new(0, 0, -((Mover.WalkSpeed / 60) * 1))
		else
			Mover.Walking = false
		end
		pcall(function()
			FindRem():FireServer("Mover"..Auth, nil, {CFrame = Mover.CFrame, Walking = Mover.Walking})
		end)
	end
end)

-- || End || --
