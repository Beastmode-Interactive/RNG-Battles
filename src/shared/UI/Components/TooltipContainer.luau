local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local react = require(ReplicatedStorage.Packages.react)
return function(props)
	local tooltipActive, setTooltipActive = react.useState(false)
	local mousePosition, setMousePosition = react.useState(Vector2.new(0, 0))
	local sensibleRotation, setSensibleRotation = react.useState(0.01)
	local parentFrameRef = react.useRef(nil)
	react.useEffect(function()
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

					local r = (10 * (inputPosition.X / game.Workspace.CurrentCamera.ViewportSize.X) - 5) * -10
					if r == 0 then
						r = 0.001
					end
					setSensibleRotation(r)
				end
			end
		end

		local mousePositionSignal: RBXScriptConnection = UserInputService.InputChanged:Connect(updateMousePosition)

		return function()
			mousePositionSignal:Disconnect()
		end
	end, {})
	react.useEffect(function()
		if props.tooltipData == nil then
			setTooltipActive(false)
		else
			local parentFrame = parentFrameRef.current
			if parentFrame then
				local absolutePosition = parentFrame.AbsolutePosition
				local input = Players.LocalPlayer:GetMouse()
				local inputPosition = Vector2.new(input.X, input.Y)
				local relativeMousePos = inputPosition - absolutePosition
				setMousePosition(relativeMousePos)
			end
			setTooltipActive(true)
		end
	end, { props.tooltipData })

	return {

		react.createElement(
			"Frame",
			{ Size = UDim2.new(1, 0, 1, 0), ZIndex = 1000, BackgroundTransparency = 1, ref = parentFrameRef },
			{
				if tooltipActive and props.tooltipData
					then react.createElement("Frame", {
						Size = UDim2.new(0, 0, 0, 0),
						Position = UDim2.new(0, mousePosition.x + 30, 0, mousePosition.y + 30),
						BackgroundTransparency = 1,
						Rotation = if props.tooltipData.shouldRotate then sensibleRotation else 0,
					}, { props.tooltipData.element })
					else nil,
			}
		),
	}
end
