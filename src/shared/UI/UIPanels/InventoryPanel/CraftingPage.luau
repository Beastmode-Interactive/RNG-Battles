local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ScrollingInventoryFrame = require(ReplicatedStorage.Shared.UI.Components.ScrollingInventoryFrame)
local InventoryItem = require(ReplicatedStorage.Shared.UI.Components.InventoryItem)
local React = require(ReplicatedStorage.Packages.react)
return function(props)
	local InventoryItems = {
		React.createElement(InventoryItem, {
			onClick = function()
				print("Clicked")
			end,
			icon = "rbxassetid://15736249725",
		}),
		React.createElement(InventoryItem, {
			onClick = function()
				print("Clicked")
			end,
			icon = "rbxassetid://15736249725",
		}),
		React.createElement(InventoryItem, {
			onClick = function()
				print("Clicked")
			end,
			icon = "rbxassetid://15736249725",
		}),
		React.createElement(InventoryItem, {
			onClick = function()
				print("Clicked")
			end,
			icon = "rbxassetid://15736249725",
		}),
		React.createElement(InventoryItem, {
			onClick = function()
				print("Clicked")
			end,
			icon = "rbxassetid://15736249725",
		}),
		React.createElement(InventoryItem, {
			onClick = function()
				print("Clicked")
			end,
			icon = "rbxassetid://15736249725",
		}),
		React.createElement(InventoryItem, {
			onClick = function()
				print("Clicked")
			end,
			icon = "rbxassetid://15736249725",
		}),
		React.createElement(InventoryItem, {
			onClick = function()
				print("Clicked")
			end,
			icon = "rbxassetid://15736249725",
		}),
		React.createElement(InventoryItem, {
			onClick = function()
				print("Clicked")
			end,
			icon = "rbxassetid://15736249725",
		}),
		React.createElement(InventoryItem, {
			onClick = function()
				print("Clicked")
			end,
			icon = "rbxassetid://15736249725",
		}),
		React.createElement(InventoryItem, {
			onClick = function()
				print("Clicked")
			end,
			icon = "rbxassetid://15736249725",
		}),
		React.createElement(InventoryItem, {
			onClick = function()
				print("Clicked")
			end,
			icon = "rbxassetid://15736249725",
		}),
		React.createElement(InventoryItem, {
			onClick = function()
				print("Clicked")
			end,
			icon = "rbxassetid://15736249725",
		}),
	}

	return React.createElement(ScrollingInventoryFrame, { InventoryItems = InventoryItems })
end
