local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Shared.UI.Components.Button)
local React = require(ReplicatedStorage.Packages.react)
local Events = ReplicatedStorage:WaitForChild("Events")

return function(props)
	local onBattleClicked = function()
		if props.isQueueing then
			props.setIsQueueing(false)
			Events:WaitForChild("ExitBattleRequest"):FireServer()
		else
			props.setIsQueueing(true)
			Events:WaitForChild("RequestBattle"):FireServer()
		end
	end

	local child = Button({
		onClick = onBattleClicked,
		text = props.isQueueing and "Cancel" or "Battle",
		style = props.isQueueing and "Secondary" or "Primary",
	})

	return React.createElement("Frame", {
		Position = UDim2.new(0.5, 0, 1, -10),
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.new(0, 300, 0, 40),
		BackgroundTransparency = 1,
	}, child)
end
