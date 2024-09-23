--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
return function(props)
	return React.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = 1,
	}, {
		React.createElement(
			"Frame",
			{ Size = UDim2.new(1, -50, 1, -110), Position = UDim2.new(0, 20, 0, 80), BackgroundTransparency = 1 },
			{ props.children }
		),
	})
end
