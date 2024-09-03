local SoundController = {
	Name = "SoundController",
}

local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local battleFadeInTween
local lobbyFadeOutTween
local battleFadeOutTween
local lobbyFadeInTween

function SoundController:BlendToBattle()
	battleFadeInTween:Play()
	lobbyFadeOutTween:Play()
end

function SoundController:BlendToLobby()
	battleFadeOutTween:Play()
	lobbyFadeInTween:Play()
end

function SoundController:KnitStart()
	local musicGroup = Instance.new("SoundGroup")
	musicGroup.Parent = SoundService
	local uiGroup = Instance.new("SoundGroup")
	uiGroup.Parent = SoundService
	local lobbyMusic = Instance.new("Sound")
	lobbyMusic.Parent = musicGroup
	local battleMusic = Instance.new("Sound")
	battleMusic.Parent = musicGroup
	lobbyMusic.SoundId = "rbxassetid://93352152422714"
	lobbyMusic.SoundGroup = musicGroup
	battleMusic.SoundId = "rbxassetid://110532166234007"
	battleMusic.SoundGroup = musicGroup
	lobbyMusic.Looped = true
	battleMusic.Looped = true
	battleMusic.Volume = 0
	lobbyMusic.Volume = 1

	local VolumeBlend = TweenInfo.new(2.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
	lobbyFadeOutTween = TweenService:Create(lobbyMusic, VolumeBlend, { Volume = 0 })
	lobbyFadeInTween = TweenService:Create(lobbyMusic, VolumeBlend, { Volume = 1 })
	battleFadeOutTween = TweenService:Create(battleMusic, VolumeBlend, { Volume = 0 })
	battleFadeInTween = TweenService:Create(battleMusic, VolumeBlend, { Volume = 1 })

	lobbyMusic:Play()
	battleMusic:Play()
end

function SoundController:KnitInit() end

return SoundController
