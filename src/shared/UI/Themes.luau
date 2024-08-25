local Themes = {

	Colours = {
		Primary = Color3.fromRGB(36, 231, 19),
		Secondary = Color3.fromRGB(95, 95, 95),
		Tertiary = Color3.fromRGB(255, 255, 255),
	},
	Text = {
		Heading = {
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextStrokeTransparency = 0,
			FontFace = Font.fromEnum(Enum.Font.Cartoon),
			TextSize = 50,
		},
		Subheading = {},
		Paragraph = {},
	},
	ApplyTheme = function(currentStyling, themeStyling)
		for key, value in pairs(themeStyling) do
			currentStyling[key] = value
		end
	end,
}

return Themes
