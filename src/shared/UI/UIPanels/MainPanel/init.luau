-- Battle button
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Shared.UI.Components.Button)
local React = require(ReplicatedStorage.Packages.react)
local SoundController = require(ReplicatedStorage.Shared.Controllers.SoundController)
local LightingController = require(ReplicatedStorage.Shared.Controllers.LightingController)
local BattleRequestController = require(ReplicatedStorage.Shared.Controllers.BattleRequestController)
local LHSGuiContainer = require(script.LHSGuiContainer)

return function(props)
	local onBattleClicked = function()
		if props.playerState == "Unqueued" then
			SoundController:BlendToBattle()
			LightingController:EnableBlur()
			props.setPlayerState("Queued")
			BattleRequestController:RequestBattle()
		elseif props.playerState == "Queued" then
			SoundController:BlendToLobby()
			LightingController:DisableBlur()
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

	return React.createElement("Frame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1 }, {
		React.createElement(
			"Frame",
			{
				Position = UDim2.new(0.5, 0, 1, -20),
				AnchorPoint = Vector2.new(0.5, 1),
				Size = UDim2.new(0, 300, 0, 40),
				BackgroundTransparency = 1,
			},
			Button({
				onClick = onBattleClicked,
				text = text,
				style = style,
			})
		),
		LHSGuiContainer({
			currentlyOpenScreen = props.currentlyOpenScreen,
			setCurrentlyOpenScreen = props.setCurrentlyOpenScreen,
			isMobile = props.isMobile,
		}),
	})
end
