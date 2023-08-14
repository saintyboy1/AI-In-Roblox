-- COMPLETION.LUA
-- Author: saintyboy1

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Model = require(ReplicatedStorage["MODEL_TYPE_HERE"])


local Output = Model:NewCompletion() -- It's as simple as this ! Note that this is for a simple completion with the model's defaults. It takes input as the parameters in this usage.

--[[ If you'd like to create a proper text completion with parameters then
	please look below for an example. You can adjust the parameters to how you'd like.
	
	
	DISCLAIMER: You will need an API key for this to work. You can get one for free in our discord:
	https://discord.gg/nzC23ABzkT
	
]]

--]]
print(Output)
