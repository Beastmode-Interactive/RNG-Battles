local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local dash = require(ReplicatedStorage.Packages.dash)

return function(props)
	local buttonStyle = {
		Position = UDim2.new(0, 0, 0, 0),
		AnchorPoint = Vector2.new(0, 0),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = if props.Disabled then Themes.Colours.LobbyRed else Themes.Colours.BattleGreen,
		ZIndex = 100,
		Text = props.Text,
		Size = UDim2.new(0, 108, 0, 40),
		Interactable = not props.Disabled,
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		[React.Event.Activated] = props.onClick,
	}
	buttonStyle = dash.join(buttonStyle, Themes.Text.InfoHeading)
	return React.createElement("TextButton", buttonStyle, {
		React.createElement("UICorner", {
			CornerRadius = UDim.new(0, 8),
		}),
		React.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Thickness = 2,
			Color = Themes.Colours.Blue800,
		}),
	})
end
