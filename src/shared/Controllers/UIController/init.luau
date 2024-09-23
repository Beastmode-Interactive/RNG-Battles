--!strict
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
	local fullscreenHandle = Instance.new("ScreenGui")
	fullscreenHandle.Parent = Players.LocalPlayer.PlayerGui
	fullscreenHandle.ResetOnSpawn = false
	fullscreenHandle.ScreenInsets = Enum.ScreenInsets.None
	fullscreenHandle.DisplayOrder = 2
	local fullscreenRoot = ReactRoblox.createRoot(fullscreenHandle)
	fullscreenRoot:render(React.createElement(FullscreenGUI))

	local insetHandle = Instance.new("ScreenGui")
	insetHandle.Parent = Players.LocalPlayer.PlayerGui
	insetHandle.ResetOnSpawn = false
	insetHandle.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets
	insetHandle.DisplayOrder = 3
	local insetRoot = ReactRoblox.createRoot(insetHandle)
	insetRoot:render(React.createElement(InsetGUI))
end

function UIController:KnitInit() end

return UIController
