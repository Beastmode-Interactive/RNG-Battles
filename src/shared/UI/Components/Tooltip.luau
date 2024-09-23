--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local dash = require(ReplicatedStorage.Packages.dash)

return function(props)
	return React.createElement("Frame", {
		Position = props.Position,
		AnchorPoint = Vector2.new(0, 0),
		Size = UDim2.new(0, 200, 0, 100),
		BackgroundTransparency = 1,
		ZIndex = 200,
		Rotation = props.Rotation,
		AutomaticSize = Enum.AutomaticSize.Y,
	}, {

		React.createElement("Frame", {
			BackgroundColor3 = Themes.Colours.Blue100,
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = 200,
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
				ZIndex = 199,
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
				ZIndex = 198,
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
				Position = UDim2.new(0, 5, 0, 5),
				Size = UDim2.new(1, -10, 1, -10),
				BackgroundTransparency = 1,
			}, {

				React.createElement(
					"TextLabel",
					dash.join(Themes.Text.InfoHeading, {
						ZIndex = 201,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 24),
						Position = UDim2.new(0, 0, 0, 0),
						Text = props.ItemName,
					}),
					{}
				),
				React.createElement(
					"TextLabel",
					dash.join(Themes.Text.Body, {
						ZIndex = 201,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 37),
						Position = UDim2.new(0, 0, 0, 29),
						Text = props.ItemDescription,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Top,
						TextWrapped = true,
					}),
					{}
				),
				React.createElement(
					"TextLabel",
					dash.join(Themes.Text.Accent16, {
						ZIndex = 201,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 22),
						Position = UDim2.new(0, 0, 1, -27),
						Text = "1/" .. props.ItemRarity,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Top,
						TextWrapped = true,
					}),
					{}
				),
			}),
		}),
	})
end
