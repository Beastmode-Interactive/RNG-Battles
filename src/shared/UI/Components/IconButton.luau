--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local MenuTooltip = require(ReplicatedStorage.Shared.UI.Components.MenuTooltip)
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

export type ButtonProps = {
	icon: any,
	onClick: (any) -> nil,
}

return function(props)
	local tooltipActive, setTooltipActive = React.useState(false)
	local mousePosition, setMousePosition = React.useState(Vector2.new(0, 0))
	local parentFrameRef = React.useRef(nil)

	React.useEffect(function()
		local function updateMousePosition(input)
			if input.UserInputType == Enum.UserInputType.MouseWheel then
				setTooltipActive(false)
			end
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				local parentFrame = parentFrameRef.current
				if parentFrame then
					local absolutePosition = parentFrame.AbsolutePosition
					local inputPosition = Vector2.new(input.Position.X, input.Position.Y)
					local relativeMousePos = inputPosition - absolutePosition
					setMousePosition(relativeMousePos)
				end
			end
		end

		local mousePositionSignal: RBXScriptConnection = UserInputService.InputChanged:Connect(updateMousePosition)

		return function()
			mousePositionSignal:Disconnect()
		end
	end, {})

	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

	local function onMouseEnter(button)
		setTooltipActive(true)
		local goal = { Size = UDim2.new(1, 0, 1, 0) }
		local tween = TweenService:Create(button, tweenInfo, goal)
		tween:Play()
	end

	local function onMouseLeave(button)
		setTooltipActive(false)
		local goal = { Size = UDim2.new(1, -5, 1, -5) }
		local tween = TweenService:Create(button, tweenInfo, goal)
		tween:Play()
	end

	return React.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = props.LayoutOrder,
		ref = parentFrameRef,
		ZIndex = if tooltipActive then 1000 else 1,
	}, {

		if tooltipActive
			then React.createElement(MenuTooltip, {
				Text = props.name,
				Position = UDim2.new(0, mousePosition.X + 22, 0, mousePosition.Y + 30),
			})
			else nil,

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
