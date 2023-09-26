local http = game:GetService("HttpService")
local propertiesPlus:{GetProperties: (instance:Instance|string)->(),GetTags:(property:string)->(),IsReadOnly:(property:string)->()} = loadstring(http:GetAsync("https://dark.scriptlang.com/storage/scripts/propertyplus.lua"))()
-- make a serialize function with the above data, input is instance, output is json
local function serialize(model:Instance)
	local output = {ObjectData={},PropertyNames={},Values={},ClassNames={}}
	local properties = {}
	local descendants = model:GetDescendants()
	table.insert(descendants,1,model)
	
	local function fft(tab,v)
		for i,V in pairs(tab) do
			if v == V then
				return i
			end
		end
		return nil
	end
	local function srcnum(tab)
		local a = 0
		for _ in pairs(tab) do
			a = a + 1
		end
		return a
	end
	for _,v in pairs(descendants) do
		local self:{Properties:{string}} = properties[v.ClassName]
		if not self then
			properties[v.ClassName] = {
				Properties = propertiesPlus.GetProperties(v.ClassName),
			}
			self = properties[v.ClassName]
			for i,v in pairs(self.Properties) do
				if propertiesPlus.IsReadOnly(v) then
					table.remove(self.Properties,i)
				end
			end
		end
		if self then
			local EditInstance = Instance.new(v.ClassName)
			local cn = fft(output.ClassNames,v.ClassName)
			if not cn then
				table.insert(output.ClassNames,v.ClassName)
				cn = fft(output.ClassNames,v.ClassName)
			end
			local dt = {}
			for _,prop in pairs(self.Properties) do
				if table.find({"BrickColor"},prop) then continue end
				if v[prop] ~= EditInstance[prop] then
					local num = fft(output.PropertyNames,prop)
					if not num then
						table.insert(output.PropertyNames,prop)
						num = fft(output.PropertyNames,prop)
					end
					local typ = typeof(v[prop]):lower()
					local cval = v[prop]
					local data = nil
					if typ == "string" then
						data = "1"..cval
					elseif typ == "number" then
						data = "2"..cval
					elseif typ == "cframe" then
						data = "3"..tostring(cval):gsub(" ","")
					elseif typ == "vector3" then
						data = "4"..tostring(cval):gsub(" ","")
					elseif typ == "color3" then
						data = "5"..tostring(cval):gsub(" ","")
					elseif typ == "instance" then
						if table.find(descendants,cval) then
							data = "6"..table.find(descendants,cval)
						end
					elseif typ == "enumitem" then
						data = "7"..tostring(cval):sub(6)
					elseif typ == "boolean" then
						data = "8"..(cval and 1 or 0)
					elseif typ == "nil" then
						data = "nil"
					end
					if data then
						if data == "nil" then
							data = nil
						end
						local isdata = fft(output.Values,data)
						if not isdata then
							table.insert(output.Values,data)
							isdata = fft(output.Values,data)
						end
						table.insert(dt,{num,isdata})
					end
				end
			end
			table.insert(output.ObjectData,{cn,dt})
			EditInstance:Destroy()
		end
	end
	return http:JSONEncode(output)
end
local function deserialize(source,parent)
	local input:{ObjectData:{},PropertyNames:{},Values:{},ClassNames:{}} = http:JSONDecode(source)
	local decodedvals = {}
	for _,v in pairs(input.Values) do
		local newval = nil
		local typ = v:sub(1,1)
		local val = v:sub(2)
		if typ == "1" then
			newval = tostring(val)
		elseif typ == "2" then
			newval = tonumber(val)
		elseif typ == "3" then
			newval = CFrame.new(unpack(val:split(",")))
		elseif typ == "4" then
			newval = Vector3.new(unpack(val:split(",")))
		elseif typ == "5" then
			newval = Color3.new(unpack(val:split(",")))
		elseif typ == "6" then
			newval = {"INSTANCE",val}
		elseif typ == "7" then
			local split = val:split(".")
			newval = Enum[split[1]][split[2]]
		elseif typ == "8" then
			newval = (val == "1")
		end
		table.insert(decodedvals,newval)
	end
	local objs = {}
	for _,val in pairs(input.ObjectData) do
		local ins = Instance.new(input.ClassNames[val[1]])
		for _,v in pairs(val[2]) do
			local propname = input.PropertyNames[v[1]]
			local val = decodedvals[v[2]]
			if typeof(val) == "table" then
				if val[1] == "INSTANCE" then
					val = objs[tonumber(val[2])]
				end
			end
			ins[propname] = val
		end
		table.insert(objs,ins)
	end
	local retobj = {}
	for _,v in pairs(objs) do
		if v.Parent == nil then
			v.Parent = parent
			table.insert(retobj,v)
		end
	end
	return retobj
end
return {Serialize=serialize,Deserialize=deserialize}