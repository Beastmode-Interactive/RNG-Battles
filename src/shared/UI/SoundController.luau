local SoundController = {}

local SoundService = game:GetService("SoundService")
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
lobbyMusic:Play()
battleMusic:Play()
local TweenService = game:GetService("TweenService")
local VolumeBlend = TweenInfo.new(2.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)

local lobbyFadeOutTween = TweenService:Create(lobbyMusic, VolumeBlend, { Volume = 0 })
local lobbyFadeInTween = TweenService:Create(lobbyMusic, VolumeBlend, { Volume = 1 })
local battleFadeOutTween = TweenService:Create(battleMusic, VolumeBlend, { Volume = 0 })
local battleFadeInTween = TweenService:Create(battleMusic, VolumeBlend, { Volume = 1 })
SoundController.BlendToBattle = function()
	battleFadeInTween:Play()
	lobbyFadeOutTween:Play()
end

SoundController.BlendToLobby = function()
	battleFadeOutTween:Play()
	lobbyFadeInTween:Play()
end

SoundController.Initialize = function() end

return SoundController
