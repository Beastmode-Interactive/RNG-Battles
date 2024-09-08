local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)

export type MenuFrameProps = {
	isMobile: boolean,
	children: any,
}

return function(props)
	return React.createElement("Frame", {
		BackgroundColor3 = Themes.Colours.Background,
		Size = UDim2.new(1, 0, 1, 0),
	}, {
		React.createElement("UICorner", {
			CornerRadius = UDim.new(0, if props.isMobile then 16 else 32),
		}),
		React.createElement("UIStroke", {
			Thickness = 4,
			Color = Themes.Colours.BorderColour,
		}),
		props.children,
	})
end
