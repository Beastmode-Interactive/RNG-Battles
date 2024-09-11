local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MenuFrame = require(ReplicatedStorage.Shared.UI.Components.MenuFrame)
local React = require(ReplicatedStorage.Packages.react)
local CraftingPage = require(script.CraftingPage)
local BuffsPage = require(script.BuffsPage)
local CosmeticsPage = require(script.CosmeticsPage)
local ConsumablesPage = require(script.ConsumablesPage)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)

return function(props)
	local PageRef = React.useRef()

	local swapPages = function(page)
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
		React.createElement("Frame", {
			Size = UDim2.new(0, 224, 0, 130),
			Position = UDim2.new(1, -250, 0, -64),
			ZIndex = -10,
			BackgroundColor3 = Themes.Colours.Blue800,
		}, {
			React.createElement("UICorner", {
				CornerRadius = UDim.new(0, 32),
			}),
			React.createElement("ImageButton", {
				Size = UDim2.new(0, 48, 0, 48),
				Position = UDim2.new(0, 16, 0, 12),
				[React.Event.Activated] = function()
					swapPages(0)
				end,
			}, {}),
			React.createElement("ImageButton", {
				Size = UDim2.new(0, 48, 0, 48),
				Position = UDim2.new(0, 64, 0, 12),
				[React.Event.Activated] = function()
					swapPages(1)
				end,
			}, {}),
			React.createElement("ImageButton", {
				Size = UDim2.new(0, 48, 0, 48),
				Position = UDim2.new(0, 112, 0, 12),
				[React.Event.Activated] = function()
					swapPages(2)
				end,
			}, {}),
			React.createElement("ImageButton", {
				Size = UDim2.new(0, 48, 0, 48),
				Position = UDim2.new(0, 160, 0, 12),
				[React.Event.Activated] = function()
					swapPages(3)
				end,
			}, {}),
		}),
	})
end
