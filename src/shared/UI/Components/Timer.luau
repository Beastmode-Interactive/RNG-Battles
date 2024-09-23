--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local dash = require(ReplicatedStorage.Packages.dash)

export type TimerProps = {
	text: string,
}

return function(props)
	local textStyle = {
		Position = UDim2.new(0, 0, 0, 0),
		AnchorPoint = Vector2.new(0, 0),
		Text = props.text,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 40),
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
	}
	textStyle = dash.join(textStyle, Themes.Text.Heading)
	return React.createElement("TextButton", textStyle, {
		React.createElement("UICorner", {
			CornerRadius = UDim.new(0, 10),
		}),
	})
end
