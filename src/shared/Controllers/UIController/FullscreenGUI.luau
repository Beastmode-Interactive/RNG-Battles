local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local WaitingScreen = require(ReplicatedStorage.Shared.UI.UIPanels.WaitingScreen)
local Knit = require(ReplicatedStorage.Packages.Knit)

return function()
	local playerState, setPlayerState = React.useState("Unqueued")

	React.useEffect(function()
		local MatchmakingService = Knit.GetService("MatchmakingService")
		local signal: RBXScriptConnection = MatchmakingService.PlayerIsMatched:Connect(function()
			setPlayerState("Teleporting")
		end)
		return function()
			signal:Disconnect()
		end
	end, {})

	return { if playerState == "Teleporting" then React.createElement(WaitingScreen) else nil }
end
