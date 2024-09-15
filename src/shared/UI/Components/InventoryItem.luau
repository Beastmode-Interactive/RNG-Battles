local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local dash = require(ReplicatedStorage.Packages.dash)
local Tooltip = require(ReplicatedStorage.Shared.UI.Components.Tooltip)
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
return function(props)
	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tooltipActive, setTooltipActive = React.useState(false)
	local mousePosition, setMousePosition = React.useState(Vector2.new(0, 0))
	local parentFrameRef = React.useRef(nil)
	local sensibleRotation, setSensibleRotation = React.useState(0.01)

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
					local r = (10 * (inputPosition.X / game.Workspace.CurrentCamera.ViewportSize.X) - 5) * -10
					if r == 0 then
						r = 0.001
					end
					setSensibleRotation(r)
					setMousePosition(relativeMousePos)
				end
			end
		end

		local mousePositionSignal: RBXScriptConnection = UserInputService.InputChanged:Connect(updateMousePosition)

		return function()
			mousePositionSignal:Disconnect()
		end
	end, {})

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
		Size = UDim2.new(0, 101, 0, 101),
		BackgroundTransparency = 1,
		ZIndex = if tooltipActive then 10 else 7,
	}, {
		React.createElement("ImageButton", {
			BackgroundColor3 = Themes.Colours.Blue300,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, -5, 1, -5),
			[React.Event.Activated] = props.onClick,
			[React.Event.MouseEnter] = onMouseEnter,
			[React.Event.MouseLeave] = onMouseLeave,
			AutoButtonColor = false,
			Image = props.icon,
			ref = parentFrameRef,
			ZIndex = if tooltipActive then 10 else 7,
		}, {

			if tooltipActive
				then React.createElement(Tooltip, {
					Rotation = sensibleRotation,
					Position = UDim2.new(0, mousePosition.X + 30, 0, mousePosition.Y + 30),
				})
				else nil,

			React.createElement("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),
			React.createElement("UIStroke", {
				Thickness = 3,
				Color = Themes.Colours.Blue800,
			}),

			React.createElement(
				"TextLabel",
				dash.join(Themes.Text.Subheading, {
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, -5, 0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					TextXAlignment = Enum.TextXAlignment.Right,
					TextYAlignment = Enum.TextYAlignment.Top,
					Text = "12",
					ZIndex = 20,
					BackgroundTransparency = 1,
				}),
				{}
			),
		}),
	})
end
