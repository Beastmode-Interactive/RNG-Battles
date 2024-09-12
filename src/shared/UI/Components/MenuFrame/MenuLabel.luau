local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local MenuLabelComponent = require(script.Parent.MenuLabelComponent)

return function(props)
	return React.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, 74),
		Position = UDim2.new(0, -30, 0, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		ZIndex = 50,
		BackgroundTransparency = 1,
	}, {
		React.createElement(
			MenuLabelComponent,
			{ MenuTitle = props.MenuTitle, ZIndex = 45, Position = UDim2.new(0, 0, 0, 0), Primary = true }
		),
		React.createElement(
			MenuLabelComponent,
			{ MenuTitle = props.MenuTitle, ZIndex = 44, Position = UDim2.new(0, 2, 0, 2), Primary = false }
		),
		React.createElement(
			MenuLabelComponent,
			{ MenuTitle = props.MenuTitle, ZIndex = 43, Position = UDim2.new(0, 4, 0, 4), Primary = false }
		),
	})
end
