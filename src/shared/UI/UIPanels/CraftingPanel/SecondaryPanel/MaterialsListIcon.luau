local ReplicatedStorage = game:GetService("ReplicatedStorage")
local react = require(ReplicatedStorage.Packages.react)
local dash = require(ReplicatedStorage.Packages.dash)
local Themes = require(ReplicatedStorage.Shared.UI.Themes)
local Tooltip = require(ReplicatedStorage.Shared.UI.Components.Tooltip)
return function(props)
	local enoughMaterials, setEnoughMaterials = react.useState(false)

	react.useEffect(function()
		setEnoughMaterials(props.quantityCurrent >= props.quantityRequired)
	end, { props.quantityCurrent })

	local function onMouseEnter()
		props.setTooltipData({
			shouldRotate = false,
			element = react.createElement(Tooltip, {
				ItemName = "hi",
				ItemDescription = "hello",
				ItemRarity = 10,
				Rotation = 0.1,
				Position = UDim2.new(0, 0, 0, 0),
			}),
		})
	end

	local function onMouseLeave()
		props.setTooltipData(nil)
	end

	return {
		react.createElement("Frame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1 }, {

			react.createElement("ImageLabel", {
				Size = UDim2.new(0.5, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
				Image = props.imageId,
				ScaleType = Enum.ScaleType.Fit,
				[react.Event.MouseEnter] = onMouseEnter,
				[react.Event.MouseLeave] = onMouseLeave,
			}),
			react.createElement(
				"TextLabel",
				dash.join(Themes.Text.Subheading, {
					Size = UDim2.new(0.5, 0, 1, 0),
					Position = UDim2.new(0.5, 0, 0, 0),
					Text = tostring(props.quantityCurrent) .. "/" .. tostring(props.quantityRequired),
					BackgroundTransparency = 1,
					TextColor3 = if enoughMaterials then Themes.Colours.Green250 else Themes.Colours.Red250,
				})
			),
		}),
	}
end
