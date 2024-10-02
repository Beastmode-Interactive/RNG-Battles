--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
return function(props)
	return React.createElement("Frame", { Size = UDim2.new(1, 0, 1, 0), ZIndex = 15, BackgroundTransparency = 1 }, {
		React.createElement("ScrollingFrame", {

			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			ClipsDescendants = false,
			VerticalScrollBarInset = "Always",
			ScrollBarThickness = 24,
			ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
			AutomaticCanvasSize = "Y",
			BorderSizePixel = 0,
			BottomImage = "http://www.roblox.com/asset/?id=82686664308048",
			MidImage = "http://www.roblox.com/asset/?id=131033939850806",
			TopImage = "http://www.roblox.com/asset/?id=108469687008114",
		}, {
			React.createElement("Frame", { Size = UDim2.new(1, 0, 1, -24), BackgroundTransparency = 1 }, {
				React.createElement("UIGridLayout", {
					CellPadding = UDim2.new(0, 5, 0, 5),
					CellSize = UDim2.new(0, props.ItemSizeX, 0, props.ItemSizeY),
				}, {}),
				props.InventoryItems,
			}),
		}),

		--Backdrop of scroll bar

		React.createElement("Frame", {
			Size = UDim2.new(0, 24, 1, 0),
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 0, 0, 0),
			BackgroundColor3 = Themes.Colours.Blue800,
			BackgroundTransparency = 0.75,
		}, {
			React.createElement("UICorner", { CornerRadius = UDim.new(0, 16) }),
		}),
	})
end
