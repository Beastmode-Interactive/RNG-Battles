local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local LightingController = {
	Name = "LightingController",
}
local Blur

function LightingController:EnableBlur()
	local InBlur = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
	Blur.Enabled = true
	Blur.Size = 0
	local Tween = TweenService:Create(Blur, InBlur, { Size = 15 })
	Tween:Play()
end
function LightingController:DisableBlur()
	local OutBlur = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
	local Tween = TweenService:Create(Blur, OutBlur, { Size = 0 })
	Tween:Play()
end

function LightingController:KnitStart()
	Blur = Instance.new("BlurEffect")
	Blur.Enabled = false
	Blur.Size = 0
	Blur.Parent = Lighting
end

function LightingController:KnitInit() end

return LightingController
