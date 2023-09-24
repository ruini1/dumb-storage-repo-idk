local LoadLibrary = game:GetObjects("rbxassetid://8299466510")[1]

--[[ 

not for trade, dont save in your inventory.

]]--


------------------
--< MAIN >--
------------------

local script = game:GetObjects("rbxassetid://14873885392")[1]

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
