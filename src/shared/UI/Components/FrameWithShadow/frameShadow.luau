local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
return function(props)
	return React.createElement("Frame", {
		Size = props.Size,
		BackgroundColor3 = props.BackgroundColor3,
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
	})
end
