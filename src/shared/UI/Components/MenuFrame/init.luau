--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CloseButton = require(script.CloseButton)
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local FrameWithShadow = require(ReplicatedStorage.Shared.UI.Components.FrameWithShadow)
local TextLabelWithShadow = require(ReplicatedStorage.Shared.UI.Components.TextLabelWithShadow)

export type MenuFrameProps = {
	isMobile: boolean,
	children: any,
}

return function(props)
	local function onClose()
		props.onClose()
	end

	return {
		React.createElement(
			FrameWithShadow,
			{ BackgroundColor3 = Themes.Colours.Blue100, Size = UDim2.new(1, 0, 1, 0) },
			{

				-- Menu name topbar
			}
		),
		React.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 0, 74),
			Position = UDim2.new(0, -30, 0, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundTransparency = 1,
			ZIndex = 15,
		}, {
			React.createElement(
				FrameWithShadow,
				{ BackgroundColor3 = Themes.Colours.Blue300, isMobile = props.isMobile },
				{

					React.createElement("Frame", {
						Size = UDim2.new(1, 0, 1, -10),
						Position = UDim2.new(0, 25, 0, 0),
						BackgroundTransparency = 1,
					}, {
						React.createElement(TextLabelWithShadow, { Text = props.MenuTitle }),
					}),
				}
			),
		}),

		React.createElement("Frame", {
			Size = UDim2.new(0, 52, 0, 52),
			Position = UDim2.new(1, 0, 0, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			ZIndex = 15,
		}, {
			React.createElement(CloseButton, { onClick = onClose }),
		}),

		-- Menu content
		React.createElement("Frame", {
			Position = UDim2.new(0, 5, 0, 5),
			Size = UDim2.new(1, -10, 1, -10),
			BackgroundTransparency = 1,
			ZIndex = 10,
		}, props.children),
	}
end
