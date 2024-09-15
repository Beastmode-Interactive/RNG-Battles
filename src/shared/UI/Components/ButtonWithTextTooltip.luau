local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local dash = require(ReplicatedStorage.Packages.dash)
local AnimateUI = require(ReplicatedStorage.Shared.UI.AnimateUI)

return function(props)
	return React.createElement("ImageButton", {
		ImageColor3 = if props.selected then Themes.Colours.Blue600 else Themes.Colours.White,
		Image = props.Image,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, props.Size, 0, props.Size),
		Position = props.Position,
		[React.Event.Activated] = function()
			props.onClick()
		end,
		[React.Event.MouseEnter] = function()
			if props.animRef.current then
				AnimateUI:typeWrite(props.animRef.current, props.Label, 0.01)
			end
		end,
		[React.Event.MouseLeave] = function()
			AnimateUI:unTypeWrite(props.animRef.current, 0.005)
		end,
	}, {
		React.createElement("Frame", {
			Size = UDim2.new(0, 0, 0, 0),
			Position = UDim2.new(
				0.5,
				0,
				if props.positioning == "top" then 0 else 1,
				if props.positioning == "top" then -20 else 20
			),
			AnchorPoint = Vector2.new(0, if props.positioning == "top" then 1 else 0),
			Rotation = if props.positioning == "top" then -60 else 60,
			BackgroundTransparency = 1,
		}, {

			React.createElement(
				"TextLabel",
				dash.join(Themes.Text.SmallSubheading, {
					ref = props.animRef,
					Position = UDim2.new(1, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 0.5),
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = "",
					BackgroundTransparency = 1,
				})
			),
		}),
	})
end
