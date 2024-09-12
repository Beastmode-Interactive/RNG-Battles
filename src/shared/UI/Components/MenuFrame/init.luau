local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local MenuLabel = require(script.MenuLabel)

export type MenuFrameProps = {
	isMobile: boolean,
	children: any,
}

return function(props)
	return React.createElement("Frame", {
		BackgroundColor3 = Themes.Colours.Blue100,
		Size = UDim2.new(1, 0, 1, 0),
	}, {
		React.createElement("UICorner", {
			CornerRadius = UDim.new(0, if props.isMobile then 12 else 24),
		}),
		React.createElement("UIStroke", {
			Thickness = 4,
			Color = Themes.Colours.Blue800,
		}),
		React.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 2, 0, 2),
			ZIndex = -1,
			BackgroundColor3 = Themes.Colours.Blue100,
		}, {
			React.createElement("UICorner", {
				CornerRadius = UDim.new(0, if props.isMobile then 12 else 24),
			}),
			React.createElement("UIStroke", {
				Thickness = 5,

				Color = Themes.Colours.Blue800,
			}),
		}),
		React.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 4, 0, 4),
			ZIndex = -2,
			BackgroundColor3 = Themes.Colours.Blue100,
		}, {
			React.createElement("UICorner", {
				CornerRadius = UDim.new(0, if props.isMobile then 12 else 24),
			}),
			React.createElement("UIStroke", {
				Thickness = 5,
				Color = Themes.Colours.Blue800,
			}),
		}),
		React.createElement(MenuLabel, { MenuTitle = props.MenuTitle, isMobile = props.isMobile }),
		React.createElement("Frame", {
			Position = UDim2.new(0, 5, 0, 5),
			Size = UDim2.new(1, -10, 1, -10),
			BackgroundTransparency = 1,
		}, props.children),
	})
end
