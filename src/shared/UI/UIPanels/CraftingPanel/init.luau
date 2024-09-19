local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MenuFrame = require(ReplicatedStorage.Shared.UI.Components.MenuFrame)
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local ButtonWithTextTooltip = require(ReplicatedStorage.Shared.UI.Components.ButtonWithTextTooltip)
local CraftingList = require(script.CraftingList)
local CraftingPageWrapper = require(script.CraftingPageWrapper)
local SecondaryPanel = require(script.SecondaryPanel)
local Upgrades = require(ReplicatedStorage.Shared.ResourceData.Upgrades)
local Debuffs = require(ReplicatedStorage.Shared.ResourceData.Debuffs)
local Buffs = require(ReplicatedStorage.Shared.ResourceData.Buffs)
local MockCraftingInventoryData = require(script.MockCraftingInventoryData)
local TweenService = game:GetService("TweenService")
return function(props)
	local SecondaryPanelRef = React.useRef(nil)
	local MainPanelRef = React.useRef(nil)
	local PageRef = React.useRef(nil)
	local upgradesRef = React.useRef(nil)
	local buffsRef = React.useRef(nil)
	local debuffsRef = React.useRef(nil)
	local currentItemSelection, setCurrentItemSelection = React.useState(nil)
	local currentPageSelection, setCurrentPageSelection = React.useState(nil)
	local currentPage, setCurrentPage = React.useState(0)

	local secondaryScreenOut, setSecondaryScreenOut = React.useState(false)

	local swapPages = function(page)
		setCurrentPage(page)
		if PageRef.current then
			PageRef.current:JumpToIndex(page)
		end
	end

	React.useEffect(function()
		if secondaryScreenOut then
			if SecondaryPanelRef.current then
				local screenIn = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
				local Tween =
					TweenService:Create(SecondaryPanelRef.current, screenIn, { Position = UDim2.new(0, 298, 0.5, 0) })

				Tween:Play()

				Tween = TweenService:Create(MainPanelRef.current, screenIn, { Position = UDim2.new(0.5, -210, 0.5, 0) })

				Tween:Play()
			end
		end
	end, { secondaryScreenOut })

	local selectedPageData, setSelectedPageData = React.useState(Upgrades)
	React.useEffect(function()
		if currentPageSelection == 0 then
			setSelectedPageData(Upgrades)
		elseif currentPageSelection == 1 then
			setSelectedPageData(Buffs)
		elseif currentPageSelection == 2 then
			setSelectedPageData(Debuffs)
		end
	end, { currentItemSelection, currentPage })

	return React.createElement("Frame", {
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0, 268, 0, 520),
		BackgroundTransparency = 1,
		ref = MainPanelRef,
	}, {

		--###################
		--PAGE CONTAINER
		--###################

		React.createElement("ImageLabel", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			ImageTransparency = 0.5,
			Image = "http://www.roblox.com/asset/?id=140388049726748",
			ZIndex = 5,
		}),

		React.createElement(MenuFrame, {
			MenuTitle = "Crafting",
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
					React.createElement(CraftingPageWrapper, {}, {
						React.createElement(CraftingList, {
							currentItemSelection = currentItemSelection,
							setCurrentItemSelection = setCurrentItemSelection,
							currentPageSelection = currentPageSelection,
							setCurrentPageSelection = setCurrentPageSelection,
							setSecondaryScreenOut = setSecondaryScreenOut,
							page = 0,
							isMobile = props.isMobile,
						}),
					}),
					React.createElement(CraftingPageWrapper, {}, {
						React.createElement(CraftingList, {
							currentItemSelection = currentItemSelection,
							setCurrentItemSelection = setCurrentItemSelection,
							currentPageSelection = currentPageSelection,
							setCurrentPageSelection = setCurrentPageSelection,
							setSecondaryScreenOut = setSecondaryScreenOut,
							page = 1,
							isMobile = props.isMobile,
						}),
					}),
					React.createElement(CraftingPageWrapper, {}, {
						React.createElement(CraftingList, {
							currentItemSelection = currentItemSelection,
							setCurrentItemSelection = setCurrentItemSelection,
							currentPageSelection = currentPageSelection,
							setCurrentPageSelection = setCurrentPageSelection,
							setSecondaryScreenOut = setSecondaryScreenOut,
							page = 2,
							isMobile = props.isMobile,
						}),
					}),
				}
			),
		}),

		--#################
		-- BOTTOM MENU OPTIONS
		--#################
		React.createElement("Frame", {

			Position = UDim2.new(0.5, 0, 1, -65),
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.new(0, 176, 0, 130),
			ZIndex = -10,
			BackgroundColor3 = Themes.Colours.Blue800,
		}, {
			React.createElement("UICorner", {
				CornerRadius = UDim.new(0, 32),
			}),
			React.createElement(ButtonWithTextTooltip, {
				Size = 48,
				selected = currentPage == 0,
				onClick = function()
					swapPages(0)
				end,
				Position = UDim2.new(0, 16, 0, 72),
				Image = "http://www.roblox.com/asset/?id=79138194214078",
				Label = "upgrades",
				animRef = upgradesRef,
				positioning = "bottom",
			}),
			React.createElement(ButtonWithTextTooltip, {
				Size = 48,
				selected = currentPage == 1,
				onClick = function()
					swapPages(1)
				end,
				Position = UDim2.new(0, 64, 0, 72),
				Image = "http://www.roblox.com/asset/?id=71525083923537",
				Label = "buffs",
				animRef = buffsRef,
				positioning = "bottom",
			}),
			React.createElement(ButtonWithTextTooltip, {
				Size = 48,
				selected = currentPage == 2,
				onClick = function()
					swapPages(2)
				end,
				Position = UDim2.new(0, 112, 0, 72),
				Image = "http://www.roblox.com/asset/?id=136008214658243",
				Label = "debuffs",
				animRef = debuffsRef,
				positioning = "bottom",
			}),
		}),

		React.createElement("Frame", {
			Size = UDim2.new(0, 800, 0, 420),
			Position = UDim2.new(0, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			ClipsDescendants = true,
			BackgroundTransparency = 1,
		}, {
			if currentItemSelection
				then React.createElement(SecondaryPanel, {
					description = selectedPageData[currentItemSelection].description,
					name = selectedPageData[currentItemSelection].name,
					level = MockCraftingInventoryData[currentItemSelection],
					Panel = SecondaryPanelRef,
				})
				else nil,
		}),
	})
end
