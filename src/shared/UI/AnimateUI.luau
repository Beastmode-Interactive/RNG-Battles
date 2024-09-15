local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")

local SOURCE_LOCALE = "en"
local translator = nil

local AnimateUI = {}

AnimateUI.objectStatus = {}

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

function AnimateUI:typeWrite(guiObject, text, delayBetweenChars)
	self.objectStatus[guiObject] = "Opening"
	guiObject.AutoLocalize = false
	local displayText = text

	if translator then
		displayText = translator:Translate(guiObject, text)
	end

	displayText = displayText:gsub("<br%s*/>", "\n")
	displayText = displayText:gsub("<[^<>]->", "")
	guiObject.Text = displayText

	local len = 0
	for _, _ in utf8.graphemes(guiObject.Text) do
		len += 1
	end
	for i = guiObject.MaxVisibleGraphemes, len do
		if self.objectStatus[guiObject] == "Closing" then
			return
		end
		guiObject.MaxVisibleGraphemes = i
		task.wait(delayBetweenChars)
	end
	if self.objectStatus[guiObject] == "Opening" then
		self.objectStatus[guiObject] = "Opened"
	end
end

function AnimateUI:unTypeWrite(guiObject, delayBetweenChars)
	self.objectStatus[guiObject] = "Closing"
	for i = guiObject.MaxVisibleGraphemes, 0, -1 do
		if self.objectStatus[guiObject] == "Opening" then
			return
		end
		guiObject.MaxVisibleGraphemes = i

		task.wait(delayBetweenChars)
	end
	if self.objectStatus[guiObject] == "Closing" then
		guiObject.Text = ""
		self.objectStatus[guiObject] = "Closed"
	end
end

return AnimateUI
