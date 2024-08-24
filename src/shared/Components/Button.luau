local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)

return function(props)
	return React.createElement("TextButton", {
		Position = UDim2.new(0, 0, 0, 0),
		AnchorPoint = Vector2.new(0, 0),
		Size = UDim2.new(1, 0, 0, 40),
		BackgroundColor3 = Color3.fromRGB(36, 231, 19),
		Text = "Battle",
		TextScaled = true,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextStrokeTransparency = 0,
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		FontFace = Font.fromEnum(Enum.Font.Cartoon),
		[React.Event.Activated] = props.onClick,
	}, {
		React.createElement("UICorner", {
			CornerRadius = UDim.new(0, 10),
		}),
	})
end
