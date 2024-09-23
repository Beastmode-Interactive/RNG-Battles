--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local dash = require(ReplicatedStorage.Packages.dash)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)

local label = function()
	local style = {
		Text = "Waiting for match",
		Size = UDim2.new(0, 200, 0, 50),
		Position = UDim2.new(0.5, 0, 0, 10),
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundTransparency = 1,
	}
	style = dash.join(style, Themes.Text.Subheading)
	return React.createElement("TextLabel", style, {})
end

return function()
	return React.createElement("Frame", {
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		BorderSizePixel = 0,
		Size = UDim2.new(0.7, 0, 0.5, 0),
		Position = UDim2.new(0.5, 0, 0.3, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
	}, { React.createElement(label) })
end
