local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local IconButton = require(ReplicatedStorage.Shared.UI.Components.IconButton)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)

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
					Image = "rbxassetid://15736249725",
				}, {
					React.createElement("TextLabel", {
						Size = UDim2.new(1, 0, 1, 0),
						Text = "X",
						BackgroundTransparency = 1,
					}),
				}),
				React.createElement("Frame", {
					Size = UDim2.new(0, 10, 1, 0),
					BackgroundTransparency = 1,
				}),
				React.createElement("TextLabel", {
					Size = UDim2.new(0, 1, 1, -8),

					Text = "Level/XP",
					BackgroundColor3 = Themes.Colours.ProgressBackground,
					BorderSizePixel = 0,
				}, {
					React.createElement("UIFlexItem", {
						FlexMode = Enum.UIFlexMode.Grow,
					}),
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
					Image = "rbxassetid://15736249725",
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
			}),
			IconButton({
				onClick = function()
					props.setCurrentlyOpenScreen("Settings")
				end,
				icon = "rbxassetid://15736249725",
			}),
			IconButton({
				onClick = function()
					props.setCurrentlyOpenScreen("Inventory")
				end,
				icon = "rbxassetid://15736249725",
			}),
			IconButton({
				onClick = function()
					props.setCurrentlyOpenScreen("Shop")
				end,
				icon = "rbxassetid://15736249725",
			}),
			IconButton({
				onClick = function()
					props.setCurrentlyOpenScreen("Crafting")
				end,
				icon = "rbxassetid://15736249725",
			}),
			IconButton({
				onClick = function()
					props.setCurrentlyOpenScreen("QuestsBattlepass")
				end,
				icon = "rbxassetid://15736249725",
			}),
			IconButton({
				onClick = function()
					props.setCurrentlyOpenScreen("Stats")
				end,
				icon = "rbxassetid://15736249725",
			}),
			IconButton({
				onClick = function()
					props.setCurrentlyOpenScreen("Guilds")
				end,
				icon = "rbxassetid://15736249725",
			}),
			IconButton({
				onClick = function()
					props.setCurrentlyOpenScreen("Trading")
				end,
				icon = "rbxassetid://15736249725",
			}),
			IconButton({
				onClick = function()
					props.setCurrentlyOpenScreen("Index")
				end,
				icon = "rbxassetid://15736249725",
			}),
		}),
		React.createElement(
			"Frame",
			{ LayoutOrder = 3, Size = UDim2.new(1, 0, 0, if props.isMobile then 45 else 90) },
			{
				React.createElement("TextLabel", {
					Size = UDim2.new(1, 0, 1, 0),
					Text = "Status Effects",
					BackgroundColor3 = Themes.Colours.Background,
					BorderSizePixel = 0,
				}),
			}
		),
	}, {})
end
