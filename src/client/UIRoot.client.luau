local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Packages:FindFirstChild("react-roblox"))
local DefaultPage = require(ReplicatedStorage.Shared.UI.UIObjects.DefaultPage)
local Players = game:GetService("Players")
local handle = Instance.new("ScreenGui")

handle.Parent = Players.LocalPlayer.PlayerGui
local root = ReactRoblox.createRoot(handle)
root:render(React.createElement(DefaultPage, {}, {}))
