local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Packages:FindFirstChild("react-roblox"))
local MainPanel = require(ReplicatedStorage.Shared.UI.UIPanels.MainPanel)
local WaitingScreen = require(ReplicatedStorage.Shared.UI.UIPanels.WaitingScreen)
local WaitingText = require(ReplicatedStorage.Shared.UI.UIPanels.WaitingText)
local Players = game:GetService("Players")
local Events = ReplicatedStorage:WaitForChild("Events")

local function CoreGUIs()
	local playerState, setPlayerState = React.useState("Unqueued")
	local pairedPlayerName, setPairedPlayerName = React.useState("")
	print(pairedPlayerName)
	React.useEffect(function()
		local signal: RBXScriptConnection = Events:WaitForChild("PlayerIsMatched").OnClientEvent
			:Connect(function(player: Player)
				setPlayerState("Teleporting")
				setPairedPlayerName(player.Name)
			end)
		return function()
			signal:Disconnect()
		end
	end, {})

	return React.createElement("Folder", {}, {
		{
			React.createElement(
				"ScreenGui",
				{ ResetOnSpawn = false, DisplayOrder = 1, ScreenInsets = Enum.ScreenInsets.None },
				{ (playerState == "Teleporting") and WaitingScreen() }
			),
			React.createElement(
				"ScreenGui",
				{ ResetOnSpawn = false, DisplayOrder = 2, ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets },
				{
					(playerState ~= "Teleporting" and MainPanel({
						playerState = playerState,
						setPlayerState = setPlayerState,
					})),
					(playerState == "Queued" and WaitingText()),
				}
			),
		},
	})
end

local handle = ReactRoblox.createRoot(Players.LocalPlayer.PlayerGui)
handle:render(React.createElement(CoreGUIs))
