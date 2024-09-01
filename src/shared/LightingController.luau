local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local LightingController = {}

local Blur = Instance.new("BlurEffect")
Blur.Parent = Lighting
Blur.Enabled = false
Blur.Size = 0

LightingController.EnableBlur = function()
	local InBlur = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
	Blur.Enabled = true
	Blur.Size = 0
	local Tween = TweenService:Create(Blur, InBlur, { Size = 15 })
	Tween:Play()
end
LightingController.DisableBlur = function()
	local OutBlur = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
	local Tween = TweenService:Create(Blur, OutBlur, { Size = 0 })
	Tween:Play()
end

return LightingController
