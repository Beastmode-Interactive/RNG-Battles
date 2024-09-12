local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local dash = require(ReplicatedStorage.Packages.dash)
return function(props)
	return React.createElement("Frame", {
		Size = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = Themes.Colours.Blue300,
		AutomaticSize = Enum.AutomaticSize.X,
		ZIndex = props.ZIndex,
		Position = props.Position,
	}, {
		React.createElement("UICorner", {
			CornerRadius = UDim.new(0, if props.isMobile then 16 else 24),
		}),
		React.createElement("UIStroke", {
			Thickness = 5,
			Color = Themes.Colours.Blue800,
		}),
		React.createElement(
			"TextLabel",
			dash.join({
				ZIndex = if props.Primary then 80 else -10,
				Text = props.MenuTitle,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -50, 1, -10),
				Position = UDim2.new(0, 25, 0, 0),
			}, Themes.Text.Heading),
			{ Themes.TextStroke.Heading }
		),
		React.createElement(
			"TextLabel",
			dash.join(Themes.Text.Heading, {
				ZIndex = if props.Primary then 79 else -11,
				Text = props.MenuTitle,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -50, 1, -10),
				Position = UDim2.new(0, 29, 0, 4),
				TextColor3 = Themes.Colours.Blue800,
			}),
			{ Themes.TextStroke.Heading }
		),
	})
end
