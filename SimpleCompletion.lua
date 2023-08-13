-- COMPLETION.LUA
-- Author: saintyboy1

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Model = require(ReplicatedStorage["TEXT-SNT"])


local Output = Model:NewCompletion() -- It's as simple as this !

--[[ If you'd like to create a text completion with hyperparameters then
	please look below for an example. You can adjust the parameters to how you'd like.
	
	
	DISCLAIMER: You will need an API key for this to work. You can get one for free in our discord:
	https://discord.gg/nzC23ABzkT
	
]]

--]]
print(Output)
