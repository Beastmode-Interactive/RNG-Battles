local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local frameShadow = require(script.frameShadow)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)

return function(props)
	local FrameSizeRef = React.useRef(nil)
	local shadowSize, setShadowSize = React.useState(UDim2.new(0, 0, 0, 0))

	React.useEffect(function()
		if FrameSizeRef.current then
			local absoluteSize = FrameSizeRef.current.AbsoluteSize
			setShadowSize(UDim2.new(0, absoluteSize.X, 0, absoluteSize.Y))
		end
	end, { FrameSizeRef.current })

	return {

		React.createElement("Frame", {
			AutomaticSize = if props.Size then Enum.AutomaticSize.None else Enum.AutomaticSize.X,
			Size = if props.Size then props.Size else UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = props.BackgroundColor3,
			ZIndex = props.ZIndex,
			Position = UDim2.new(0, 0, 0, 0),
			ref = FrameSizeRef,
		}, {
			React.createElement("UICorner", {
				CornerRadius = UDim.new(0, if props.isMobile then 16 else 24),
			}),
			React.createElement("UIStroke", {
				Thickness = 5,
				Color = Themes.Colours.Blue800,
			}),
			props.children,
		}),

		React.createElement(frameShadow, {
			Size = shadowSize,
			MenuTitle = props.MenuTitle,
			BackgroundColor3 = props.BackgroundColor3,
			ZIndex = props.ZIndex - 1,
			Position = UDim2.new(0, 2, 0, 2),
		}),
		React.createElement(frameShadow, {
			Size = shadowSize,
			MenuTitle = props.MenuTitle,
			BackgroundColor3 = props.BackgroundColor3,
			ZIndex = props.ZIndex - 2,
			Position = UDim2.new(0, 4, 0, 4),
		}),
	}
end
