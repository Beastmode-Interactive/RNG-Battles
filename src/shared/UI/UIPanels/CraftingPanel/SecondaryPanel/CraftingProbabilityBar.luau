--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)

return function(props)
	return React.createElement("Frame", {
		ZIndex = -10,
		Size = UDim2.new(1, 0, 0, if props.isMobile then 12 else 24),
		BackgroundColor3 = Themes.Colours.Red250,
	}, {
		React.createElement("UICorner", { CornerRadius = UDim.new(0, if props.isMobile then 6 else 12) }),
		React.createElement("UIStroke", {
			Thickness = if props.isMobile then 1 else 2,
			Color = Themes.Colours.Blue800,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		}),
	})
end
