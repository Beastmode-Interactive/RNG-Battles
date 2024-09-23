--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local dash = require(ReplicatedStorage.Packages.dash)
local TweenService = game:GetService("TweenService")

export type CraftingItemProps = {
	selected: boolean,
	onClick: (any) -> any,
	name: string,
	level: number,
	icon: string,
}

return function(props: CraftingItemProps)
	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local parentFrameRef = React.useRef(nil)

	local function onMouseEnter(button)
		local goal = { Size = UDim2.new(1, 0, 1, 0) }
		local tween = TweenService:Create(button, tweenInfo, goal)
		tween:Play()
	end

	local function onMouseLeave(button)
		if not props.selected then
			local goal = { Size = UDim2.new(1, -5, 1, -5) }
			local tween = TweenService:Create(button, tweenInfo, goal)
			tween:Play()
		end
	end

	React.useEffect(function()
		if parentFrameRef.current then
			onMouseLeave(parentFrameRef.current)
		end
	end, { props.selected })

	return React.createElement("Frame", {
		Size = UDim2.new(0, 190, 0, 64),
		BackgroundTransparency = 1,
		ZIndex = 7,
	}, {
		React.createElement("TextButton", {
			BackgroundColor3 = if props.selected then Themes.Colours.Blue300 else Themes.Colours.Blue100,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, -5, 1, -5),
			[React.Event.Activated] = props.onClick,
			[React.Event.MouseEnter] = onMouseEnter,
			[React.Event.MouseLeave] = onMouseLeave,
			AutoButtonColor = false,
			Text = "",
			BackgroundTransparency = 0,
			ref = parentFrameRef,
			ZIndex = 7,
		}, {

			React.createElement("UICorner", {
				CornerRadius = UDim.new(0, 8),
			}),
			React.createElement("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Thickness = 3,
				Color = Themes.Colours.Blue800,
			}),

			React.createElement(
				"TextLabel",
				dash.join(Themes.Text.InfoHeading, {
					AnchorPoint = Vector2.new(0.5, 0),
					Position = UDim2.new(0, 120, 0, 5),
					AutomaticSize = Enum.AutomaticSize.XY,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					Text = props.name,
					ZIndex = 20,
					BackgroundTransparency = 1,
				}),
				{}
			),
			React.createElement(
				"TextLabel",
				dash.join(Themes.Text.SmallSubheading, {
					AnchorPoint = Vector2.new(0.5, 1),
					Position = UDim2.new(0, 120, 1, -5),
					AutomaticSize = Enum.AutomaticSize.XY,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					Text = "Lvl " .. tostring(props.level),
					ZIndex = 20,
					BackgroundTransparency = 1,
				}),
				{}
			),
			React.createElement("ImageLabel", {
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 5, 0.5, 0),
				Size = UDim2.new(0, 50, 0, 50),
				AutomaticSize = Enum.AutomaticSize.XY,
				Image = props.icon,
				ZIndex = 20,
				BackgroundTransparency = 1,
			}, {}),

			if props.level ~= 0
				then React.createElement("ImageLabel", {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(1, 0, 0, 0),
					Size = UDim2.new(0, 48, 0, 48),
					ZIndex = 20,
					BackgroundTransparency = 1,
					Image = "http://www.roblox.com/asset/?id=101521489706947",
				}, {})
				else nil,
		}),
	})
end
