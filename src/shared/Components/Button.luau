local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)

return function()
	return React.createElement("Frame", {
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0, 100, 0, 100),
		BackgroundColor3 = Color3.fromRGB(21, 81, 211),
	}, {
		React.createElement("UICorner", {
			CornerRadius = UDim.new(0, 30),
		}),
	})
end
