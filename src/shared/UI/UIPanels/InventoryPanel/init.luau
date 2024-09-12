local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MenuFrame = require(ReplicatedStorage.Shared.UI.Components.MenuFrame)
local React = require(ReplicatedStorage.Packages.react)
local CraftingPage = require(script.CraftingPage)
local BuffsPage = require(script.BuffsPage)
local CosmeticsPage = require(script.CosmeticsPage)
local ConsumablesPage = require(script.ConsumablesPage)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local MenuTag = require(script.MenuTag)

return function(props)
	local PageRef = React.useRef()
	local label1Ref = React.useRef()
	local label2Ref = React.useRef()
	local label3Ref = React.useRef()
	local label4Ref = React.useRef()
	local bottomlabel1Ref = React.useRef()
	local bottomlabel2Ref = React.useRef()
	local bottomlabel3Ref = React.useRef()
	local bottomlabel4Ref = React.useRef()
	local currentPage, setCurrentPage = React.useState(0)
	local swapPages = function(page)
		setCurrentPage(page)
		if PageRef.current then
			PageRef.current:JumpToIndex(page)
		end
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
			Image = "http://www.roblox.com/asset/?id=93425279586528",
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
					React.createElement(CraftingPage, { isMobile = props.isMobile }),
					React.createElement(ConsumablesPage, { isMobile = props.isMobile }),
					React.createElement(CosmeticsPage, { isMobile = props.isMobile }),
					React.createElement(BuffsPage, { isMobile = props.isMobile }),
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
			React.createElement(MenuTag, {
				PageNum = 0,
				Position = UDim2.new(0, 16, 0, 56),
				Image = "http://www.roblox.com/asset/?id=77739754042364",
				Label = "rarity",
				swapPages = swapPages,
				animRef = bottomlabel1Ref,
				currentPage = currentPage,
				positioning = "bottom",
			}),
			React.createElement(MenuTag, {
				PageNum = 1,
				Position = UDim2.new(0, 48, 0, 56),
				Image = "http://www.roblox.com/asset/?id=139863050881990",
				Label = "recent",
				swapPages = swapPages,
				animRef = bottomlabel2Ref,
				currentPage = currentPage,
				positioning = "bottom",
			}),
			React.createElement(MenuTag, {
				PageNum = 2,
				Position = UDim2.new(0, 80, 0, 56),
				Image = "http://www.roblox.com/asset/?id=77073269656169",
				Label = "quantity",
				swapPages = swapPages,
				animRef = bottomlabel3Ref,
				currentPage = currentPage,
				positioning = "bottom",
			}),
			React.createElement(MenuTag, {
				PageNum = 3,
				Position = UDim2.new(0, 112, 0, 56),
				Image = "http://www.roblox.com/asset/?id=73812354996194",
				Label = "alphabetical",
				swapPages = swapPages,
				animRef = bottomlabel4Ref,
				currentPage = currentPage,
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
			React.createElement(MenuTag, {
				PageNum = 0,
				Position = UDim2.new(0, 16, 0, 12),
				Image = "http://www.roblox.com/asset/?id=77739754042364",
				Label = "crafting materials",
				swapPages = swapPages,
				animRef = label1Ref,
				currentPage = currentPage,
				positioning = "top",
			}),
			React.createElement(MenuTag, {
				PageNum = 1,
				Position = UDim2.new(0, 64, 0, 12),
				Image = "http://www.roblox.com/asset/?id=139863050881990",
				Label = "consumables",
				swapPages = swapPages,
				animRef = label2Ref,
				currentPage = currentPage,
				positioning = "top",
			}),
			React.createElement(MenuTag, {
				PageNum = 2,
				Position = UDim2.new(0, 112, 0, 12),
				Image = "http://www.roblox.com/asset/?id=77073269656169",
				Label = "cosmetics",
				swapPages = swapPages,
				animRef = label3Ref,
				currentPage = currentPage,
				positioning = "top",
			}),
			React.createElement(MenuTag, {
				PageNum = 3,
				Position = UDim2.new(0, 160, 0, 12),
				Image = "http://www.roblox.com/asset/?id=73812354996194",
				Label = "buffs/debuffs",
				swapPages = swapPages,
				animRef = label4Ref,
				currentPage = currentPage,
				positioning = "top",
			}),
		}),
	})
end
