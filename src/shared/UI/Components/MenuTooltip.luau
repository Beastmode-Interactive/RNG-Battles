--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local dash = require(ReplicatedStorage.Packages.dash)
return function(props)
	return React.createElement(
		"TextLabel",
		dash.join(Themes.Text.Accent24, {
			Position = props.Position,
			AnchorPoint = Vector2.new(0, 0),
			Size = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			ZIndex = 200,
			Rotation = 0.01,
			Text = props.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y,
		}),
		{}
	)
end
