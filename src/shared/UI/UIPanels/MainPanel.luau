local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Shared.UI.Components.Button)
local React = require(ReplicatedStorage.Packages.react)
local BattleRequestController = require(ReplicatedStorage.Shared.Controllers.BattleRequestController)

return function(props)
	local onBattleClicked = function()
		if props.playerState == "Unqueued" then
			props.setPlayerState("Queued")
			BattleRequestController:RequestBattle()
		elseif props.playerState == "Queued" then
			props.setPlayerState("Unqueued")
			BattleRequestController:ExitBattleRequest()
		else
			error("Player tried to interact with battle button after teleportation began")
		end
	end

	local text, style
	if props.playerState == "Queued" then
		text = "Cancel"
		style = "Secondary"
	elseif props.playerState == "Unqueued" then
		text = "Battle"
		style = "Primary"
	end
	local child = Button({
		onClick = onBattleClicked,
		text = text,
		style = style,
	})

	return React.createElement("Frame", {
		Position = UDim2.new(0.5, 0, 1, -10),
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.new(0, 300, 0, 40),
		BackgroundTransparency = 1,
	}, child)
end
