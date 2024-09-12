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
			type = "Crafting",
			itemId = 1,
			icon = "",
		}),
		React.createElement(InventoryItem, {
			onClick = function()
				print("Clicked")
			end,
			type = "Crafting",
			itemId = 1,
			icon = "",
		}),
		React.createElement(InventoryItem, {
			onClick = function()
				print("Clicked")
			end,
			type = "Crafting",
			itemId = 1,
			icon = "",
		}),
		React.createElement(InventoryItem, {
			onClick = function()
				print("Clicked")
			end,
			type = "Crafting",
			itemId = 1,
			icon = "",
		}),
	}

	return React.createElement(ScrollingInventoryFrame, { InventoryItems = InventoryItems })
end
