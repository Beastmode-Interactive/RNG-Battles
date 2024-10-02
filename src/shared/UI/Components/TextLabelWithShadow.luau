--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local dash = require(ReplicatedStorage.Packages.dash)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)

return function(props)
	return {
		React.createElement(
			"TextLabel",
			dash.join({
				Text = props.Text,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.X,
				Size = UDim2.new(0, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
			}, Themes.Text.Heading),
			{
				Themes.TextStroke.Heading,
			}
		),

		React.createElement(
			"TextLabel",
			dash.join(Themes.Text.Heading, {
				Text = props.Text,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.X,
				Size = UDim2.new(0, 0, 1, 0),
				Position = UDim2.new(0, 4, 0, 4),
				TextColor3 = Themes.Colours.Blue800,
				ZIndex = -1,
			}),
			{ Themes.TextStroke.Heading }
		),
	}
end
