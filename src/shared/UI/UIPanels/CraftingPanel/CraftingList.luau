local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ScrollingInventoryFrame = require(ReplicatedStorage.Shared.UI.Components.ScrollingInventoryFrame)
local CraftingItem = require(ReplicatedStorage.Shared.UI.Components.CraftingItem)
local React = require(ReplicatedStorage.Packages.react)
local Upgrades = require(ReplicatedStorage.Shared.ResourceData.Upgrades)
local Buffs = require(ReplicatedStorage.Shared.ResourceData.Buffs)
local Debuffs = require(ReplicatedStorage.Shared.ResourceData.Debuffs)
local MockCraftingInventoryData = require(script.Parent.MockCraftingInventoryData)
return function(props)
	local pageData
	if props.page == 0 then
		pageData = Upgrades
	elseif props.page == 1 then
		pageData = Buffs
	elseif props.page == 2 then
		pageData = Debuffs
	end

	local CraftingItems = {}

	for i, v in ipairs(MockCraftingInventoryData) do
		table.insert(
			CraftingItems,

			React.createElement(CraftingItem, {
				onClick = function()
					props.setSecondaryScreenOut(true)
					props.setCurrentItemSelection(i)
					props.setCurrentPageSelection(props.page)
				end,
				level = v,
				selected = i == props.currentItemSelection and props.page == props.currentPageSelection,
				icon = pageData[i].icon,
				name = pageData[i].name,
				isMobile = props.isMobile,
			})
		)
	end

	return React.createElement(
		ScrollingInventoryFrame,
		{ ItemSizeX = 190, ItemSizeY = 64, InventoryItems = CraftingItems, isMobile = props.isMobile }
	)
end
