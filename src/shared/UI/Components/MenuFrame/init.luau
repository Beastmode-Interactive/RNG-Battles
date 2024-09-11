local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local dash = require(ReplicatedStorage.Packages.dash)

export type MenuFrameProps = {
	isMobile: boolean,
	children: any,
}

local TopBanner = function(props)
	local textStyle = Themes.Text.Heading
	local blackStyle = dash.join({
		ZIndex = 9,
		Text = props.MenuTitle,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -30, 1, -10),
		Position = UDim2.new(0, 19, 0, 4),
	}, textStyle)
	blackStyle.TextColor3 = Themes.Colours.Blue800

	return React.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, 74),
		Position = UDim2.new(0, -30, 0, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		ZIndex = 5,
		BackgroundTransparency = 1,
	}, {
		React.createElement("Frame", {
			Size = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = Themes.Colours.Blue300,
			AutomaticSize = Enum.AutomaticSize.X,
			ZIndex = 5,
		}, {
			React.createElement("UICorner", {
				CornerRadius = UDim.new(0, if props.isMobile then 16 else 24),
			}),
			React.createElement("UIStroke", {
				Thickness = 5,
				Color = Themes.Colours.Blue800,
			}),
			React.createElement(
				"TextLabel",
				dash.join({
					ZIndex = 10,
					Text = props.MenuTitle,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -30, 1, -10),
					Position = UDim2.new(0, 15, 0, 0),
				}, textStyle),
				{ Themes.TextStroke.Heading }
			),
			React.createElement("TextLabel", blackStyle, { Themes.TextStroke.Heading }),
		}),

		React.createElement("Frame", {
			Size = UDim2.new(0, 0, 1, 0),
			Position = UDim2.new(0, 2, 0, 2),
			BackgroundColor3 = Themes.Colours.Blue300,
			AutomaticSize = Enum.AutomaticSize.X,
			ZIndex = 4,
		}, {
			React.createElement("UICorner", {
				CornerRadius = UDim.new(0, if props.isMobile then 16 else 24),
			}),
			React.createElement("UIStroke", {
				Thickness = 5,
				Color = Themes.Colours.Blue800,
			}),
			React.createElement(
				"TextLabel",
				dash.join({
					ZIndex = -10,
					Text = props.MenuTitle,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -30, 1, -10),
					Position = UDim2.new(0, 15, 0, 0),
				}, textStyle)
			),
		}),

		React.createElement("Frame", {
			Size = UDim2.new(0, 0, 1, 0),
			Position = UDim2.new(0, 4, 0, 4),
			BackgroundColor3 = Themes.Colours.Blue300,
			AutomaticSize = Enum.AutomaticSize.X,
			ZIndex = 3,
		}, {
			React.createElement("UICorner", {
				CornerRadius = UDim.new(0, if props.isMobile then 16 else 24),
			}),
			React.createElement("UIStroke", {
				Thickness = 5,
				Color = Themes.Colours.Blue800,
			}),
			React.createElement(
				"TextLabel",
				dash.join({
					ZIndex = -10,
					Text = props.MenuTitle,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -30, 1, -10),
					Position = UDim2.new(0, 15, 0, 0),
				}, textStyle)
			),
		}),
	})
end

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
		React.createElement("Frame", { Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 2, 0, 2), ZIndex = -1 }, {
			React.createElement("UICorner", {
				CornerRadius = UDim.new(0, if props.isMobile then 12 else 24),
			}),
			React.createElement("UIStroke", {
				Thickness = 5,
				Color = Themes.Colours.Blue800,
			}),
		}),
		React.createElement("Frame", { Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 4, 0, 4), ZIndex = -2 }, {
			React.createElement("UICorner", {
				CornerRadius = UDim.new(0, if props.isMobile then 12 else 24),
			}),
			React.createElement("UIStroke", {
				Thickness = 5,
				Color = Themes.Colours.Blue800,
			}),
		}),
		React.createElement(TopBanner, { MenuTitle = props.MenuTitle, isMobile = props.isMobile }),
		React.createElement("Frame", {
			Position = UDim2.new(0, 5, 0, 5),
			Size = UDim2.new(1, -10, 1, -10),
			BackgroundTransparency = 1,
		}, props.children),
	})
end
