local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")

local SOURCE_LOCALE = "en"
local translator = nil

local AnimateUI = {}

function AnimateUI.loadTranslator()
	pcall(function()
		translator = LocalizationService:GetTranslatorForPlayerAsync(Players.LocalPlayer)
	end)
	if not translator then
		pcall(function()
			translator = LocalizationService:GetTranslatorForLocaleAsync(SOURCE_LOCALE)
		end)
	end
end

function AnimateUI.typeWrite(guiObject, text, delayBetweenChars)
	print("Typewriting")
	guiObject.Visible = true
	guiObject.AutoLocalize = false
	local displayText = text

	-- Translate text if possible
	if translator then
		displayText = translator:Translate(guiObject, text)
	end

	-- Replace line break tags so grapheme loop will not miss those characters
	displayText = displayText:gsub("<br%s*/>", "\n")
	-- Remove RichText tags since char-by-char animation will break the tags
	displayText = displayText:gsub("<[^<>]->", "")

	-- Set translated/modified text on parent
	guiObject.Text = displayText

	local index = 0
	for _, _ in utf8.graphemes(displayText) do
		index += 2
		guiObject.MaxVisibleGraphemes = index
		task.wait(delayBetweenChars)
	end
end

function AnimateUI.unTypeWrite(guiObject, delayBetweenChars)
	local len = 0
	for _, _ in utf8.graphemes(guiObject.Text) do
		len += 1
	end
	for i = len, 0, -1 do
		if i == -1 then
			guiObject.MaxVisibleGraphemes = 0
		else
			guiObject.MaxVisibleGraphemes = i
		end

		task.wait(delayBetweenChars)
	end
	guiObject.Text = ""
end

return AnimateUI
