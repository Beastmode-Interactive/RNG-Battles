--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)

export type FrameShadowProps = {
	Size: UDim2,
	BackgroundColor3: Color3,
	ZIndex: number,
	Position: UDim2,
	isMobile: boolean,
}

return function(props: FrameShadowProps)
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
