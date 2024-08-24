local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Shared.Components.Button)
local React = require(ReplicatedStorage.Packages.react)
local Events = ReplicatedStorage:WaitForChild("Events")

return function()
	local isQueueing, setIsQueueing = React.useState(false)
	local onBattleClicked = function()
		setIsQueueing(true)
		Events:WaitForChild("RequestBattle"):FireServer()
	end

	local child = not isQueueing and Button({ onClick = onBattleClicked })

	return React.createElement("Frame", {
		Position = UDim2.new(0.5, 0, 1, -10),
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.new(0, 300, 0, 40),
		BackgroundTransparency = 1,
	}, child)
end
