local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Packages:FindFirstChild("react-roblox"))
local Players = game:GetService("Players")
local FullscreenGUI = require(script.FullscreenGUI)
local InsetGUI = require(script.InsetGUI)
local UIController = {
	Name = "UIController",
}

function UIController:KnitStart()
	local handle = Instance.new("ScreenGui")
	handle.Parent = Players.LocalPlayer.PlayerGui
	handle.ResetOnSpawn = false
	handle.ScreenInsets = Enum.ScreenInsets.None
	local root = ReactRoblox.createRoot(handle)
	root:render(React.createElement(FullscreenGUI))

	local handle2 = Instance.new("ScreenGui")
	handle2.Parent = Players.LocalPlayer.PlayerGui
	handle2.ResetOnSpawn = false
	handle2.ScreenInsets = Enum.ScreenInsets.None
	local root2 = ReactRoblox.createRoot(handle)
	root2:render(React.createElement(InsetGUI))
end

function UIController:KnitInit() end

return UIController
