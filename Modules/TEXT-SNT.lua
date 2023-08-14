-- TEXT-SNT.LUA
-- Author: saintyboy1

local HttpServiceModule = {}
local HttpService = game:GetService("HttpService")

local ModuleConfigurations = script.Configurations

local Parameters = require(ModuleConfigurations.Parameters)
local Fail = require(ModuleConfigurations.Fail)

local function buildQueryString(params)
	local queryString = ""
	for key, value in pairs(params) do
		queryString = queryString .. key .. "=" .. value .. "&"
	end
	return queryString:sub(1, -2)
end

function HttpServiceModule:NewCompletion()
	if Parameters.KEY == "" or Parameters.INPUT == "" or Parameters.ENDPOINT == "" then
		warn("API: Please update your model parameters in the module.")
		return false
	end

	local params = {
		key = Parameters.KEY,
		input = Parameters.INPUT,
	}
	
	local url = Parameters.ENDPOINT .. "/" .. "?" .. buildQueryString(params)

	local success, result = pcall(function()
		return HttpService:GetAsync(url)
	end)

	if success then
		local response = HttpService:JSONDecode(result)
		print(response)
		if response.error then
			warn("API ERROR: " .. response.error)
			return false
		end
		return response
	else
		warn("API: Couldn't establish a connection to the model. Retrying!")
		if Fail.ATTEMPTS <= Fail.MAX_RETRIES then
			Fail.ATTEMPTS += 1
			return HttpServiceModule:NewCompletion()
		else
			Fail.ATTEMPTS = 0
			error("API ERROR: Max retries reached! Couldn't establish a connection to the model. Please troubleshoot!")
			return false
		end
	end
end

return HttpServiceModule
