local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local IconButton = require(ReplicatedStorage.Shared.UI.Components.IconButton)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local dash = require(ReplicatedStorage.Packages.dash)

return function(props)
	return React.createElement("Frame", {
		Position = UDim2.new(0, if props.isMobile then 10 else 20, 1, if props.isMobile then -10 else -20),
		AnchorPoint = Vector2.new(0, 1),
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(
			0,
			if props.isMobile then 120 else 240,
			if props.isMobile then 1 else 0.6,
			if props.isMobile then -40 else 0
		),
		BackgroundTransparency = 1,
	}, {
		React.createElement("UIListLayout", {
			FillDirection = "Vertical",
			SortOrder = "LayoutOrder",
			Wraps = false,
			VerticalAlignment = "Center",
			HorizontalAlignment = "Center",
			VerticalFlex = "SpaceBetween",
		}),
		React.createElement("Frame", {
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, if props.isMobile then 45 else 90),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
		}, {
			React.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, if props.isMobile then 20 else 40),
				BackgroundTransparency = 1,
			}, {
				React.createElement("UIListLayout", {
					FillDirection = "Horizontal",
					SortOrder = "LayoutOrder",
					Wraps = false,
					HorizontalFlex = "None",
					VerticalAlignment = "Center",
				}),
				React.createElement("ImageLabel", {
					Size = UDim2.new(0, if props.isMobile then 20 else 40, 1, 0),
					BackgroundTransparency = 1,
					Image = "http://www.roblox.com/asset/?id=76886867302893",
				}, {
					React.createElement(
						"TextLabel",
						dash.join(Themes.Text.SmallSubheading, {
							Size = UDim2.new(1, 0, 1, 0),
							Text = "X",
							BackgroundTransparency = 1,
						})
					),
				}),
				React.createElement("Frame", {
					Size = UDim2.new(0, 10, 1, 0),
					BackgroundTransparency = 1,
				}),
				React.createElement("TextLabel", {
					Size = UDim2.new(0, 1, 0, if props.isMobile then 12 else 24),

					Text = "230/500",
					BackgroundColor3 = Themes.Colours.Blue300,
				}, {
					React.createElement("UICorner", { CornerRadius = UDim.new(0, if props.isMobile then 6 else 12) }),
					React.createElement("UIFlexItem", {
						FlexMode = Enum.UIFlexMode.Grow,
					}),
					React.createElement(
						"UIStroke",
						{
							Thickness = if props.isMobile then 1 else 2,
							Color = Themes.Colours.Blue800,
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						}
					),
				}),
			}),
			React.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, if props.isMobile then 20 else 40),
				Position = UDim2.new(0, 0, 0, if props.isMobile then 25 else 50),
				BackgroundTransparency = 1,
			}, {
				React.createElement("UIListLayout", {
					FillDirection = "Horizontal",
					SortOrder = "LayoutOrder",
					Wraps = false,
					HorizontalFlex = "None",
				}),
				React.createElement("ImageLabel", {
					Size = UDim2.new(0, if props.isMobile then 20 else 40, 1, 0),
					BackgroundTransparency = 1,
					Image = "http://www.roblox.com/asset/?id=81568207362483",
				}),
				React.createElement("Frame", {
					Size = UDim2.new(0, 10, 1, 0),
					BackgroundTransparency = 1,
				}),
				React.createElement("TextLabel", {
					Size = UDim2.new(0, 1, 1, 0),
					Text = "Money",
					BackgroundTransparency = 1,
					TextXAlignment = "Left",
				}, {
					React.createElement("UIFlexItem", {
						FlexMode = Enum.UIFlexMode.Grow,
					}),
				}),
			}),
		}),
		React.createElement("Frame", {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, if props.isMobile then 120 else 240),
			BackgroundTransparency = 1,
		}, {
			React.createElement("UIGridLayout", {
				HorizontalAlignment = "Left",
				VerticalAlignment = "Center",
				FillDirectionMaxCells = 3,
				CellSize = UDim2.new(0, if props.isMobile then 40 else 80, 0, if props.isMobile then 40 else 80),
				CellPadding = UDim2.new(0, 0, 0, 0),
				SortOrder = Enum.SortOrder.LayoutOrder,
			}),
			React.createElement(IconButton, {
				onClick = function()
					props.setCurrentlyOpenScreen("Settings")
				end,
				icon = "http://www.roblox.com/asset/?id=89547679578496",
				LayoutOrder = 1,
			}),
			React.createElement(IconButton, {
				onClick = function()
					props.setCurrentlyOpenScreen("Inventory")
				end,
				icon = "http://www.roblox.com/asset/?id=129981074396823",
				LayoutOrder = 2,
			}),
			React.createElement(IconButton, {
				onClick = function()
					props.setCurrentlyOpenScreen("Shop")
				end,
				icon = "http://www.roblox.com/asset/?id=85808121485522",
				LayoutOrder = 3,
			}),
			React.createElement(IconButton, {
				onClick = function()
					props.setCurrentlyOpenScreen("Crafting")
				end,
				icon = "http://www.roblox.com/asset/?id=77153407870867",
				LayoutOrder = 4,
			}),
			React.createElement(IconButton, {
				onClick = function()
					props.setCurrentlyOpenScreen("QuestsBattlepass")
				end,
				icon = "rbxassetid://15736249725",
				LayoutOrder = 5,
			}),
			React.createElement(IconButton, {
				onClick = function()
					props.setCurrentlyOpenScreen("Stats")
				end,
				icon = "rbxassetid://15736249725",
				LayoutOrder = 6,
			}),
			React.createElement(IconButton, {
				onClick = function()
					props.setCurrentlyOpenScreen("Guilds")
				end,
				icon = "rbxassetid://15736249725",
				LayoutOrder = 7,
			}),
			React.createElement(IconButton, {
				onClick = function()
					props.setCurrentlyOpenScreen("Trading")
				end,
				icon = "rbxassetid://15736249725",
				LayoutOrder = 8,
			}),
			React.createElement(IconButton, {
				onClick = function()
					props.setCurrentlyOpenScreen("Index")
				end,
				icon = "rbxassetid://15736249725",
				LayoutOrder = 9,
			}),
		}),
		React.createElement(
			"Frame",
			{ LayoutOrder = 3, Size = UDim2.new(1, 0, 0, if props.isMobile then 45 else 90) },
			{
				React.createElement("TextLabel", {
					Size = UDim2.new(1, 0, 1, 0),
					Text = "Status Effects",
					BackgroundColor3 = Themes.Colours.Blue100,
					BorderSizePixel = 0,
				}),
			}
		),
	}, {})
end
