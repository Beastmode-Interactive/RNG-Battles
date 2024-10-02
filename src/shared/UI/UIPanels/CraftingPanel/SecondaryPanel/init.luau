--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local FrameWithShadow = require(ReplicatedStorage.Shared.UI.Components.FrameWithShadow)
local dash = require(ReplicatedStorage.Packages.dash)
local MaterialsListIcon = require(script.MaterialsListIcon)
local CraftingMaterials = require(ReplicatedStorage.Shared.ResourceData.CraftingMaterials)
local MockInventoryData = require(ReplicatedStorage.Shared.ResourceData.MockInventoryData)
local CraftingOptions = require(script.CraftingOptions)

return function(props)
	local affordable, setAffordable = React.useState(true)
	local itemDisplay, setItemDisplay = React.useState({})
	local width, setWidth = React.useState(170)
	local height, setHeight = React.useState(50)
	React.useEffect(function()
		if #props.Recipe == 1 or #props.Recipe == 2 then
			setWidth(250)
			setHeight(100)
		elseif #props.Recipe == 3 or #props.Recipe == 4 then
			setWidth(170)
			setHeight(100)
		elseif #props.Recipe == 5 or #props.Recipe == 6 then
			setWidth(170)
			setHeight(66)
		else
			setWidth(170)
			setHeight(50)
		end

		local tempItemDisplay = {}
		local tempAffordable = true
		for _, v in pairs(props.Recipe) do
			if MockInventoryData[v.materialId] < v.quantity then
				tempAffordable = false
			end
			table.insert(
				tempItemDisplay,
				React.createElement("Frame", { Size = UDim2.new(0, width, 0, height), BackgroundTransparency = 1 }, {
					React.createElement(MaterialsListIcon, {
						setTooltipData = props.setTooltipData,
						imageId = CraftingMaterials[v.materialId].icon,
						quantityCurrent = MockInventoryData[v.materialId],
						quantityRequired = v.quantity,
					}),
				})
			)
		end
		setAffordable(tempAffordable)
		setItemDisplay(tempItemDisplay)
	end, { props.Recipe })

	return React.createElement("Frame", {
		Position = UDim2.new(0, -200, 0.5, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		Size = UDim2.new(0, 400, 0, 400),
		BackgroundTransparency = 1,
		ref = props.Panel,
	}, {

		--Background
		React.createElement("ImageLabel", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			ImageTransparency = 0.5,
			ZIndex = 10,
			Image = "http://www.roblox.com/asset/?id=140388049726748",
		}),

		React.createElement(FrameWithShadow, {
			BackgroundColor3 = Themes.Colours.Blue100,
			isMobile = props.isMobile,
			Size = UDim2.new(1, 0, 1, 0),
		}, {}),

		React.createElement("Frame", {
			Size = UDim2.new(1, -30, 1, -30),
			Position = UDim2.new(0, 15, 0, 15),
			BackgroundTransparency = 1,
			ZIndex = 15,
		}, {

			--Name
			React.createElement(
				"TextLabel",
				dash.join(Themes.Text.InfoHeading, {
					AnchorPoint = Vector2.new(0.5, 0),
					Position = UDim2.new(0.5, 0, 0, 5),
					AutomaticSize = Enum.AutomaticSize.XY,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Top,
					Text = props.name,
					BackgroundTransparency = 1,
				}),
				{}
			),
			--Level
			React.createElement(
				"TextLabel",
				dash.join(Themes.Text.SmallSubheading, {
					AnchorPoint = Vector2.new(0.5, 0),
					Position = UDim2.new(0.5, 0, 0, 35),
					AutomaticSize = Enum.AutomaticSize.XY,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Top,
					Text = "Lvl " .. props.level,
					BackgroundTransparency = 1,
				}),
				{}
			),
			--Description
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
					TextWrapped = true,
					BackgroundTransparency = 1,
				}),
				{}
			),
			if not props.maxed
				then React.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, 220),
					Position = UDim2.new(0, 0, 1, -60),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = 1,
				}, {

					React.createElement("UIGridLayout", {
						CellPadding = UDim2.new(0, 5, 0, 5),
						CellSize = UDim2.new(0, width, 0, height),
						HorizontalAlignment = "Center",
						VerticalAlignment = "Center",
						FillDirectionMaxCells = 2,
					}),

					itemDisplay,
				})
				else nil,
			React.createElement(CraftingOptions, {
				isUpgrade = props.isUpgrade,
				name = props.name,
				successChance = 45,
				affordable = affordable,
				maxed = props.maxed,
			}),
		}),
	})
end
