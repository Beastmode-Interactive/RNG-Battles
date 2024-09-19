local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ScrollingInventoryFrame = require(ReplicatedStorage.Shared.UI.Components.ScrollingInventoryFrame)
local InventoryItem = require(ReplicatedStorage.Shared.UI.Components.InventoryItem)
local React = require(ReplicatedStorage.Packages.react)
local CraftingMaterials = require(ReplicatedStorage.Shared.ResourceData.CraftingMaterials)

return function(props)
	local craftingInventory = {
		{ id = 1, amount = 4, lastAttained = 483209420 },
		{ id = 2, amount = 1244, lastAttained = 483209422 },
		{ id = 3, amount = 490, lastAttained = 483209421 },
	}

	local displayInventory, setDisplayInventory = React.useState(craftingInventory)
	React.useEffect(function()
		if props.sortType == "Rarity" then
			table.sort(craftingInventory, function(a, b)
				return CraftingMaterials[a.id].rarity > CraftingMaterials[b.id].rarity
			end)
		elseif props.sortType == "Recent" then
			table.sort(craftingInventory, function(a, b)
				return a.amount > b.amount
			end)
		elseif props.sortType == "Quantity" then
			table.sort(craftingInventory, function(a, b)
				return a.lastAttained > b.lastAttained
			end)
		elseif props.sortType == "Alphabetical" then
			table.sort(craftingInventory, function(a, b)
				return CraftingMaterials[a.id].name < CraftingMaterials[b.id].name
			end)
		end
		setDisplayInventory(craftingInventory)
	end, { props.sortType })

	local InventoryItems = {}
	for _, v in ipairs(displayInventory) do
		if v.amount > 0 then
			table.insert(
				InventoryItems,

				React.createElement(InventoryItem, {
					onClick = function() end,
					icon = CraftingMaterials[v.id].icon,
					name = CraftingMaterials[v.id].name,
					description = CraftingMaterials[v.id].description,
					rarity = CraftingMaterials[v.id].rarity,
					numberOfItems = v.amount,
					disabled = true,
					isMobile = props.isMobile,
				})
			)
		end
	end

	return React.createElement(ScrollingInventoryFrame, { InventoryItems = InventoryItems, isMobile = props.isMobile })
end
