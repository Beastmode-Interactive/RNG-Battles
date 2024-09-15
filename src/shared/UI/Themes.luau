local Colours = {
	Primary = Color3.fromRGB(36, 231, 19),
	Secondary = Color3.fromRGB(49, 49, 49),
	Tertiary = Color3.fromRGB(255, 255, 255),
	White = Color3.fromRGB(255, 255, 255),
	Disabled = Color3.fromRGB(20, 20, 20),
	Blue100 = Color3.fromRGB(240, 247, 255),
	Blue300 = Color3.fromRGB(177, 209, 255),
	Blue600 = Color3.fromRGB(82, 143, 247),
	ProgressPrimary = Color3.fromRGB(85, 151, 251),
	Blue800 = Color3.fromRGB(4, 13, 26),
	LobbyRed = Color3.fromRGB(255, 118, 117),
	BattleGreen = Color3.fromRGB(85, 239, 196),
}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)

local Themes = {

	Colours = Colours,
	TextStroke = {
		Heading = React.createElement("UIStroke", {
			Thickness = 4,
			Color = Colours.Blue800,
		}),
	},
	Text = {
		Heading = {
			TextColor3 = Colours.Blue100,
			TextStrokeColor3 = Colours.Blue800,
			TextStrokeTransparency = 0,
			FontFace = Font.fromEnum(Enum.Font.FredokaOne),
			TextSize = 54,
		},
		Subheading = {
			TextColor3 = Colours.Blue100,
			TextStrokeColor3 = Colours.Blue800,
			TextStrokeTransparency = 0,

			FontFace = Font.fromEnum(Enum.Font.FredokaOne),
			TextSize = 32,
		},
		SmallSubheading = {
			TextColor3 = Colours.Blue100,
			TextStrokeColor3 = Colours.Blue800,
			TextStrokeTransparency = 0,

			FontFace = Font.fromEnum(Enum.Font.FredokaOne),
			TextSize = 18,
		},
		InfoHeading = {
			TextColor3 = Colours.Blue800,
			TextStrokeTransparency = 1,
			FontFace = Font.fromEnum(Enum.Font.FredokaOne),
			TextSize = 24,
		},
		Accent16 = {
			TextColor3 = Colours.Blue100,
			TextStrokeColor3 = Colours.Blue800,
			TextStrokeTransparency = 0,
			FontFace = Font.fromEnum(Enum.Font.FredokaOne),
			TextSize = 16,
		},
		Body = {
			TextColor3 = Colours.Blue800,
			TextStrokeTransparency = 1,
			FontFace = Font.fromEnum(Enum.Font.FredokaOne),
			TextSize = 12,
		},
	},
}

return Themes
