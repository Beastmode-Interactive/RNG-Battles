local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Packages:FindFirstChild("react-roblox"))
local MainPanel = require(ReplicatedStorage.Shared.UI.UIPanels.MainPanel)
local WaitingScreen = require(ReplicatedStorage.Shared.UI.UIPanels.WaitingScreen)
local Players = game:GetService("Players")

local function CoreGUIs()
	local isQueueing, setIsQueueing = React.useState(false)

	return React.createElement("Folder", {}, {
		{
			React.createElement(
				"ScreenGui",
				{ ResetOnSpawn = false, DisplayOrder = 1, ScreenInsets = Enum.ScreenInsets.None },
				{}
			),
			React.createElement(
				"ScreenGui",
				{ ResetOnSpawn = false, DisplayOrder = 2, ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets },
				{
					MainPanel({ isQueueing = isQueueing, setIsQueueing = setIsQueueing }),
					isQueueing and WaitingScreen(),
				}
			),
		},
	})
end

local handle = ReactRoblox.createRoot(Players.LocalPlayer.PlayerGui)
handle:render(React.createElement(CoreGUIs))
