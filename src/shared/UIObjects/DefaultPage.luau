local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Shared.Components.Button)
local React = require(ReplicatedStorage.Packages.react)

return function()
	return React.createElement("Frame", {
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0, 300, 0, 300),
		BackgroundColor3 = Color3.fromRGB(223, 223, 223),
	}, Button())
end
