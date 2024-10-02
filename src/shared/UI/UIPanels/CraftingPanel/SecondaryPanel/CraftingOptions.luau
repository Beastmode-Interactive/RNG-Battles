local ReplicatedStorage = game:GetService("ReplicatedStorage")
local react = require(ReplicatedStorage.Packages.react)
local CraftButton = require(script.Parent.CraftButton)
local CraftingProbabilityBar = require(script.Parent.CraftingProbabilityBar)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local dash = require(ReplicatedStorage.Packages.dash)
return function(props)
	local finalPosition, setFinalPosition = react.useState(0)
	react.useEffect(function()
		setFinalPosition(0)
	end, { props.name })
	return react.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 60),
		Position = UDim2.new(0, 0, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		BackgroundTransparency = 1,
	}, {
		react.createElement("Frame", {
			Position = UDim2.new(if props.isUpgrade then 0.5 else 0, 0, 0.5, -20),
			AnchorPoint = Vector2.new(if props.isUpgrade then 0.5 else 0, 0.5),
			BackgroundTransparency = 1,
		}, {
			react.createElement(CraftButton, {
				alignCentre = props.isUpgrade,
				Text = if props.maxed then "MAXED" else "Craft",
				Disabled = not props.affordable or props.maxed,
				onClick = function()
					setFinalPosition(50)
				end,
			}),
		}),
		if not props.isUpgrade
			then react.createElement("ImageLabel", {
				Size = UDim2.new(0, 51, 0, 51),
				Position = UDim2.new(0, 115, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
				ImageColor3 = Themes.Colours.Blue800,
				Image = "http://www.roblox.com/asset/?id=123527400595730",
			})
			else nil,
		if not props.isUpgrade
			then react.createElement("Frame", {
				Position = UDim2.new(0, 170, 0.5, -12),
				Size = UDim2.new(1, -170, 0, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
			}, {
				react.createElement(
					CraftingProbabilityBar,
					{ finalPosition = finalPosition, successChance = props.successChance }
				),
			})
			else nil,
		if not props.isUpgrade
			then react.createElement(
				"TextLabel",
				dash.join(Themes.Text.Body, {
					Position = UDim2.new(0, 170, 1, 0),
					Size = UDim2.new(1, -170, 0, 12),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = 1,
					Text = "Chance of Success: " .. tostring(props.successChance) .. "%",
				}),
				{}
			)
			else nil,
	})
end
