--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local dash = require(ReplicatedStorage.Packages.dash)
local TweenService = game:GetService("TweenService")

return function(props)
	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local function onMouseEnter(button)
		local goal = { Size = UDim2.new(1, 0, 1, 0) }
		local tween = TweenService:Create(button, tweenInfo, goal)
		tween:Play()
	end

	local function onMouseLeave(button)
		local goal = { Size = UDim2.new(1, -3, 1, -3) }
		local tween = TweenService:Create(button, tweenInfo, goal)
		tween:Play()
	end

	return React.createElement("Frame", {
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, -3, 1, -3),
		BackgroundColor3 = Themes.Colours.White,
		ZIndex = 100,
		[React.Event.MouseEnter] = onMouseEnter,
		[React.Event.MouseLeave] = onMouseLeave,
	}, {
		React.createElement("UIGradient", {
			Rotation = 90,
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 118, 117)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(214, 48, 49)),
			}),
		}, {}),
		React.createElement("UICorner", {
			CornerRadius = UDim.new(0.5, 0),
		}),
		React.createElement("UIStroke", {
			Thickness = 3,
			Color = Themes.Colours.Blue800,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		}),
		React.createElement(
			"TextButton",
			dash.join(Themes.Text.Subheading, {
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				Text = "X",
				ZIndex = 100,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				AutoButtonColor = false,
				[React.Event.Activated] = props.onClick,
			})
		),
	})
end
