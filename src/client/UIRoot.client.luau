local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Packages:FindFirstChild("react-roblox"))
local Players = game:GetService("Players")

local function MyTestFrame()
	return React.createElement("Frame", {
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0, 100, 0, 100),
		BackgroundColor3 = Color3.fromRGB(193, 179, 142),
	}, {
		React.createElement("UICorner", {
			CornerRadius = UDim.new(0, 30),
		}),
	})
end
local handle = Instance.new("ScreenGui", Players.LocalPlayer.PlayerGui)
local root = ReactRoblox.createRoot(handle)
root:render(React.createElement(MyTestFrame, {}, {}))
