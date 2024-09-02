local Themes = {

	Colours = {
		Primary = Color3.fromRGB(36, 231, 19),
		Secondary = Color3.fromRGB(49, 49, 49),
		Tertiary = Color3.fromRGB(255, 255, 255),
		Disabled = Color3.fromRGB(20, 20, 20),
	},
	Text = {
		Heading = {
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextStrokeTransparency = 0,
			FontFace = Font.fromEnum(Enum.Font.Cartoon),
			TextSize = 50,
		},
		Subheading = {
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextStrokeTransparency = 0,
			FontFace = Font.fromEnum(Enum.Font.Cartoon),
			TextSize = 30,
		},
		Paragraph = {
			TextColor3 = Color3.fromRGB(0, 0, 0),
			TextStrokeTransparency = 1,
			FontFace = Font.fromEnum(Enum.Font.Cartoon),
			TextSize = 20,
		},
	},
}

return Themes
