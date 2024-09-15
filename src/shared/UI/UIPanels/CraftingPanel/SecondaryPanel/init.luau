local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local FrameWithShadow = require(ReplicatedStorage.Shared.UI.Components.FrameWithShadow)
local dash = require(ReplicatedStorage.Packages.dash)
local CraftButton = require(script.CraftButton)
local CraftingProbabilityBar = require(script.CraftingProbabilityBar)

return function(props)
	return React.createElement("Frame", {
		Position = UDim2.new(0, -200, 0.5, 0),
		--Position = UDim2.new(0,298, 0.5, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		Size = UDim2.new(0, 400, 0, 400),
		BackgroundTransparency = 1,
		ref = props.Panel,
	}, {

		React.createElement("ImageLabel", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			ImageTransparency = 0.5,
			Image = "http://www.roblox.com/asset/?id=140388049726748",
			ZIndex = -10,
		}),

		React.createElement(FrameWithShadow, {
			BackgroundColor3 = Themes.Colours.Blue100,
			ZIndex = -15,
			isMobile = props.isMobile,
			Size = UDim2.new(1, 0, 1, 0),
		}, {

			React.createElement("Frame", {
				Size = UDim2.new(1, -30, 1, -30),
				Position = UDim2.new(0, 15, 0, 15),
				BackgroundTransparency = 1,
			}, {

				React.createElement(
					"TextLabel",
					dash.join(Themes.Text.InfoHeading, {
						AnchorPoint = Vector2.new(0.5, 0),
						Position = UDim2.new(0.5, 0, 0, 5),
						AutomaticSize = Enum.AutomaticSize.XY,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Top,
						Text = props.name,
						ZIndex = -10,
						BackgroundTransparency = 1,
					}),
					{}
				),
				React.createElement(
					"TextLabel",
					dash.join(Themes.Text.SmallSubheading, {
						AnchorPoint = Vector2.new(0.5, 0),
						Position = UDim2.new(0.5, 0, 0, 35),
						AutomaticSize = Enum.AutomaticSize.XY,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Top,
						Text = "Lvl " .. props.level,
						ZIndex = -10,
						BackgroundTransparency = 1,
					}),
					{}
				),
				React.createElement(
					"TextLabel",
					dash.join(Themes.Text.SmallSubheading, {
						AnchorPoint = Vector2.new(0.5, 0),
						Position = UDim2.new(0.5, 0, 0, 60),
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.XY,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Top,
						Text = props.description,
						ZIndex = -10,
						TextWrapped = true,
						BackgroundTransparency = 1,
					}),
					{}
				),

				React.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, 60),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = 1,
				}, {

					-- React.createElement("Frame", {
					-- 	Position = UDim2.new(0.5, -54, 0.5, -20),
					-- 	AnchorPoint = Vector2.new(0.5, 0.5),
					-- 	BackgroundTransparency = 1,
					-- }, {
					-- 	React.createElement(CraftButton, {
					-- 		Disabled = false,
					-- 		Text = "Craft",
					-- 		onClick = function()
					-- 			print("clicked")
					-- 		end,
					-- 	}),
					-- }),

					React.createElement("Frame", {
						Position = UDim2.new(0, 0, 0.5, -20),
						AnchorPoint = Vector2.new(0, 0.5),
						BackgroundTransparency = 1,
					}, {
						React.createElement(CraftButton, {
							Disabled = false,
							Text = "Craft",
							onClick = function()
								print("clicked")
							end,
						}),
					}),
					React.createElement("ImageLabel", {
						Size = UDim2.new(0, 51, 0, 51),
						Position = UDim2.new(0, 115, 0.5, 0),
						AnchorPoint = Vector2.new(0, 0.5),
						BackgroundTransparency = 1,
						ImageColor3 = Themes.Colours.Blue800,
						Image = "http://www.roblox.com/asset/?id=123527400595730",
						ZIndex = -9,
					}),
					React.createElement("Frame", {
						Position = UDim2.new(0, 170, 0.5, -12),
						Size = UDim2.new(1, -170, 0, 0),
						AnchorPoint = Vector2.new(0, 0.5),
						BackgroundTransparency = 1,
					}, {
						React.createElement(CraftingProbabilityBar),
					}),
				}),
			}),
		}),
	})
end
