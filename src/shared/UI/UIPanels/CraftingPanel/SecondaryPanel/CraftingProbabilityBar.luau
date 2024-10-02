--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local TweenService = game:GetService("TweenService")
return function(props)
	local CraftArrow = React.useRef(nil)
	React.useEffect(function()
		CraftArrow.current.Position = UDim2.new(0, 0, 0, 10)
		if props.finalPosition then
			local screenIn = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
			local Tween = TweenService:Create(
				CraftArrow.current,
				screenIn,
				{ Position = UDim2.new(props.finalPosition / 100, 0, 0, 10) }
			)
			Tween:Play()
		end
	end, { props.finalPosition })

	return {
		React.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0, 0, 0, 10),
			Size = UDim2.new(0, 30, 0, 30),
			ImageColor3 = Themes.Colours.Blue800,
			Image = "http://www.roblox.com/asset/?id=88722635931796",
			ref = CraftArrow,
			ZIndex = 2,
		}),
		React.createElement("CanvasGroup", {
			BackgroundColor3 = Themes.Colours.Red250,
			Size = UDim2.new(1, 0, 0, if props.isMobile then 12 else 24),
		}, {

			React.createElement("Frame", {
				BackgroundColor3 = Themes.Colours.Green250,
				BackgroundTransparency = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(-1 + props.successChance / 100, 0, 0, 0),
			}, {
				React.createElement("UICorner", {
					CornerRadius = UDim.new(0, if props.isMobile then 6 else 12),
				}),
			}),

			React.createElement("UICorner", { CornerRadius = UDim.new(0, if props.isMobile then 6 else 12) }),
			React.createElement("UIStroke", {
				Thickness = if props.isMobile then 1 else 2,
				Color = Themes.Colours.Blue800,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			}),
		}),
	}
end
