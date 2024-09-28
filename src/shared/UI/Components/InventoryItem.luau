--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local dash = require(ReplicatedStorage.Packages.dash)
local Tooltip = require(ReplicatedStorage.Shared.UI.Components.Tooltip)
local TweenService = game:GetService("TweenService")
return function(props)
	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local function onMouseEnter(button)
		props.setTooltipData({
			shouldRotate = true,
			element = React.createElement(Tooltip, {
				ItemName = props.name,
				ItemDescription = props.description,
				ItemRarity = props.rarity,
				Rotation = 0,
				Position = UDim2.new(0, 0, 0, 0),
			}),
		})

		local goal = { Size = UDim2.new(1, 0, 1, 0) }
		local tween = TweenService:Create(button, tweenInfo, goal)
		tween:Play()
	end

	local function onMouseLeave(button)
		props.setTooltipData(nil)
		local goal = { Size = UDim2.new(1, -5, 1, -5) }
		local tween = TweenService:Create(button, tweenInfo, goal)
		tween:Play()
	end

	return React.createElement("Frame", {
		LayoutOrder = props.LayoutOrder,
		Size = UDim2.new(0, 101, 0, 101),
		BackgroundTransparency = 1,
	}, {
		React.createElement("ImageButton", {
			BackgroundColor3 = Themes.Colours.Blue300,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, -5, 1, -5),
			Active = not props.disabled,
			[React.Event.Activated] = props.onClick,
			[React.Event.MouseEnter] = onMouseEnter,
			[React.Event.MouseLeave] = onMouseLeave,
			AutoButtonColor = false,
			Image = props.icon,
			BackgroundTransparency = 1,
		}, {

			React.createElement(
				"TextLabel",
				dash.join(Themes.Text.Subheading, {
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, -5, 0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					TextXAlignment = Enum.TextXAlignment.Right,
					TextYAlignment = Enum.TextYAlignment.Top,
					Text = tostring(props.numberOfItems),
					BackgroundTransparency = 1,
				}),
				{}
			),
		}),
	})
end
