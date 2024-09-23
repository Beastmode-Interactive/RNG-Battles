--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)

local TweenService = game:GetService("TweenService")

export type ButtonProps = {
	icon: any,
	onClick: (any) -> nil,
}

return function(props)
	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

	local function onMouseEnter(button)
		local goal = { Size = UDim2.new(1, 0, 1, 0) }
		local tween = TweenService:Create(button, tweenInfo, goal)
		tween:Play()
	end

	local function onMouseLeave(button)
		local goal = { Size = UDim2.new(1, -5, 1, -5) }
		local tween = TweenService:Create(button, tweenInfo, goal)
		tween:Play()
	end

	return React.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = props.LayoutOrder,
	}, {
		React.createElement("ImageButton", {
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, -5, 1, -5),
			[React.Event.Activated] = props.onClick,
			[React.Event.MouseEnter] = onMouseEnter,
			[React.Event.MouseLeave] = onMouseLeave,
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Image = props.icon,
		}),
	})
end
