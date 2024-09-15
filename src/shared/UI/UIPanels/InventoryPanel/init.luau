local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MenuFrame = require(ReplicatedStorage.Shared.UI.Components.MenuFrame)
local React = require(ReplicatedStorage.Packages.react)
local CraftingPage = require(script.CraftingPage)
local BuffsPage = require(script.BuffsPage)
local CosmeticsPage = require(script.CosmeticsPage)
local ConsumablesPage = require(script.ConsumablesPage)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local ButtonWithTextTooltip = require(script.ButtonWithTextTooltip)
local InventoryPageWrapper = require(script.InventoryPageWrapper)

return function(props)
	local PageRef = React.useRef()
	local craftingButonRef = React.useRef()
	local consumablesButtonRef = React.useRef()
	local cosmeticsButtonRef = React.useRef()
	local buffsButtonRef = React.useRef()
	local rarityButtonRef = React.useRef()
	local recentButtonRef = React.useRef()
	local quantityButtonRef = React.useRef()
	local alphabeticalButtonRef = React.useRef()
	local currentPage, setCurrentPage = React.useState(0)
	local currentSort, setCurrentSort = React.useState("Rarity")

	local swapPages = function(page)
		setCurrentPage(page)
		if PageRef.current then
			PageRef.current:JumpToIndex(page)
		end
	end

	local swapSorts = function(page)
		setCurrentSort(page)
	end

	return React.createElement("Frame", {
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0, 620, 0, 520),
		BackgroundTransparency = 1,
	}, {

		--###################
		--PAGE CONTAINER
		--###################

		React.createElement("ImageLabel", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			ImageTransparency = 0.5,
			Image = "http://www.roblox.com/asset/?id=100877265561001",
			ZIndex = 5,
		}),

		React.createElement(MenuFrame, {
			MenuTitle = "Inventory",
			isMobile = props.isMobile,
		}, {
			React.createElement(
				"Frame",
				{ Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, ClipsDescendants = true },
				{
					React.createElement("UIPageLayout", {
						Animated = true,
						TweenTime = 0.5,
						GamepadInputEnabled = false,
						ScrollWheelInputEnabled = false,
						ref = PageRef,
					}),
					React.createElement(
						InventoryPageWrapper,
						{},
						{ React.createElement(CraftingPage, { sortType = currentSort, isMobile = props.isMobile }) }
					),
					React.createElement(
						InventoryPageWrapper,
						{},
						{ React.createElement(ConsumablesPage, { isMobile = props.isMobile }) }
					),
					React.createElement(
						InventoryPageWrapper,
						{},
						{ React.createElement(CosmeticsPage, { isMobile = props.isMobile }) }
					),
					React.createElement(
						InventoryPageWrapper,
						{},
						{ React.createElement(BuffsPage, { isMobile = props.isMobile }) }
					),
				}
			),
		}),

		--###################
		--BOTTOM MENU SORTING
		--###################
		React.createElement("Frame", {
			Size = UDim2.new(0, 160, 0, 96),
			Position = UDim2.new(0.5, 0, 1, -48),
			AnchorPoint = Vector2.new(0.5, 0),
			ZIndex = -10,
			BackgroundColor3 = Themes.Colours.Blue800,
		}, {
			React.createElement("UICorner", {
				CornerRadius = UDim.new(0, 32),
			}),
			React.createElement(ButtonWithTextTooltip, {
				selected = currentSort == "Rarity",
				onClick = function()
					swapSorts("Rarity")
				end,
				Position = UDim2.new(0, 16, 0, 56),
				Image = "http://www.roblox.com/asset/?id=83245492910183",
				Label = "rarity",
				animRef = rarityButtonRef,
				positioning = "bottom",
			}),
			React.createElement(ButtonWithTextTooltip, {
				selected = currentSort == "Recent",
				onClick = function()
					swapSorts("Recent")
				end,
				Position = UDim2.new(0, 48, 0, 56),
				Image = "http://www.roblox.com/asset/?id=102691074631157",
				Label = "recent",
				animRef = recentButtonRef,
				positioning = "bottom",
			}),
			React.createElement(ButtonWithTextTooltip, {
				selected = currentSort == "Quantity",
				onClick = function()
					swapSorts("Quantity")
				end,
				Position = UDim2.new(0, 80, 0, 56),
				Image = "http://www.roblox.com/asset/?id=91074144017769",
				Label = "quantity",
				animRef = quantityButtonRef,
				positioning = "bottom",
			}),
			React.createElement(ButtonWithTextTooltip, {
				selected = currentSort == "Alphabetical",
				onClick = function()
					swapSorts("Alphabetical")
				end,
				Position = UDim2.new(0, 112, 0, 56),
				Image = "http://www.roblox.com/asset/?id=124394236692137",
				Label = "alphabetical",
				animRef = alphabeticalButtonRef,
				positioning = "bottom",
			}),
		}),

		--#################
		-- TOP MENU OPTIONS
		--#################
		React.createElement("Frame", {
			Size = UDim2.new(0, 224, 0, 130),
			Position = UDim2.new(1, -250, 0, -64),
			ZIndex = -10,
			BackgroundColor3 = Themes.Colours.Blue800,
		}, {
			React.createElement("UICorner", {
				CornerRadius = UDim.new(0, 32),
			}),
			React.createElement(ButtonWithTextTooltip, {
				selected = currentPage == 0,
				onClick = function()
					swapPages(0)
				end,
				Position = UDim2.new(0, 16, 0, 12),
				Image = "http://www.roblox.com/asset/?id=77739754042364",
				Label = "crafting materials",
				animRef = craftingButonRef,
				positioning = "top",
			}),
			React.createElement(ButtonWithTextTooltip, {
				selected = currentPage == 1,
				onClick = function()
					swapPages(1)
				end,
				Position = UDim2.new(0, 64, 0, 12),
				Image = "http://www.roblox.com/asset/?id=139863050881990",
				Label = "consumables",
				animRef = consumablesButtonRef,
				positioning = "top",
			}),
			React.createElement(ButtonWithTextTooltip, {
				selected = currentPage == 2,
				onClick = function()
					swapPages(2)
				end,
				Position = UDim2.new(0, 112, 0, 12),
				Image = "http://www.roblox.com/asset/?id=77073269656169",
				Label = "cosmetics",
				animRef = cosmeticsButtonRef,
				positioning = "top",
			}),
			React.createElement(ButtonWithTextTooltip, {
				selected = currentPage == 3,
				onClick = function()
					swapPages(3)
				end,
				Position = UDim2.new(0, 160, 0, 12),
				Image = "http://www.roblox.com/asset/?id=73812354996194",
				Label = "buffs/debuffs",
				animRef = buffsButtonRef,
				positioning = "top",
			}),
		}),
	})
end
