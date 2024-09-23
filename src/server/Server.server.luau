--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local Knit = require(ReplicatedStorage.Packages.Knit)
local Players = game:GetService("Players")

for _, v in ipairs(ServerScriptService.Server.Services:GetDescendants()) do
	if v:IsA("ModuleScript") and v.Name:match("Service$") then
		Knit.CreateService(require(v) :: any)
	end
end

Knit.Start()
	:andThen(function()
		print("Knit started")
	end)
	:catch(warn)

local function RunServiceFunction(functionName: string, ...)
	for _, service in pairs(Knit.GetServices()) do
		if (type(service) == "table") and (type(service[functionName]) == "function") then
			service[functionName](service, ...)
		end
	end
end

-- Adding and removing binding

for _, player in ipairs(Players:GetPlayers()) do
	RunServiceFunction("OnPlayerAdded", player)
end

Players.PlayerAdded:Connect(function(player)
	RunServiceFunction("OnPlayerAdded", player)
end)

Players.PlayerRemoving:Connect(function(player)
	RunServiceFunction("OnPlayerRemoved", player)
end)

game:BindToClose(function()
	for _, player in pairs(Players:GetPlayers()) do
		RunServiceFunction("OnPlayerRemoved", player)
	end
end)
