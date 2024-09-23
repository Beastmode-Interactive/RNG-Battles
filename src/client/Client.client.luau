--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit) :: any

for _, v in ipairs(ReplicatedStorage.Shared.Controllers:GetDescendants()) do
	if v:IsA("ModuleScript") and v.Name:match("Controller$") then
		Knit.CreateController(require(v) :: any)
	end
end

Knit.Start()
	:andThen(function()
		print("Knit started")
	end)
	:catch(warn)
