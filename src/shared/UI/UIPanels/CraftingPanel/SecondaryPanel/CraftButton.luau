--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local dash = require(ReplicatedStorage.Packages.dash)

return function(props)
	return React.createElement(
		"TextButton",
		dash.join({
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(if props.alignCentre then 0.5 else 0, 0),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = if props.Disabled then Themes.Colours.Red250 else Themes.Colours.Green250,
			Text = props.Text,
			Size = UDim2.new(0, 108, 0, 40),
			Interactable = not props.Disabled,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			[React.Event.Activated] = props.onClick,
		}, Themes.Text.InfoHeading),
		{
			React.createElement("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),
			React.createElement("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Thickness = 2,
				Color = Themes.Colours.Blue800,
			}),
		}
	)
end
