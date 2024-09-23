--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MenuFrame = require(ReplicatedStorage.Shared.UI.Components.MenuFrame)
local React = require(ReplicatedStorage.Packages.react)
return function(props)
	local screen = React.createElement("TextLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Text = "QuestsBattlepassPanel Example",
		TextScaled = true,
	})

	return React.createElement("Frame", {
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.5, 0, 0.5, 0),
		AutomaticSize = Enum.AutomaticSize.XY,
	}, { React.createElement(MenuFrame, { isMobile = props.isMobile, children = screen }) })
end
