local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local dash = require(ReplicatedStorage.Packages.dash)

export type ButtonProps = {
	style: string,
	onClick: (any) -> nil,
	text: string,
}

return function(props)
	local buttonColour: Color3
	if props.style == "Primary" then
		buttonColour = Themes.Colours.Primary
	elseif props.style == "Secondary" then
		buttonColour = Themes.Colours.Secondary
	elseif props.style == "Tertiary" then
		buttonColour = Themes.Colours.Tertiary
	end

	local buttonStyle = {
		Position = UDim2.new(0, 0, 0, 0),
		AnchorPoint = Vector2.new(0, 0),
		BackgroundColor3 = buttonColour,
		Text = props.text,
		Size = UDim2.new(1, 0, 0, 40),
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		[React.Event.Activated] = props.onClick,
	}
	buttonStyle = dash.join(buttonStyle, Themes.Text.Heading)
	return React.createElement("TextButton", buttonStyle, {
		React.createElement("UICorner", {
			CornerRadius = UDim.new(0, 10),
		}),
	})
end
