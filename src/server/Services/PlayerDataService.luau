local ServerScriptService = game:GetService("ServerScriptService")
local profileservice = require(ServerScriptService.Packages.profileservice)
local DefaultProfile = require(ServerScriptService.Server.Classes.DefaultProfile)
local Players = game:GetService("Players")

local PlayerDataService = {
	Name = "PlayerDataService",
	Client = {},
}

local profileStore = profileservice.GetProfileStore("PlayerData", DefaultProfile)
local profiles = {}

function PlayerDataService:OnPlayerAdded(player: Player)
	local profile = profileStore:LoadProfileAsync("Player_" .. player.UserId)
	if profile ~= nil then
		profile:AddUserId(player.UserId)
		profile:Reconcile()
		profile:ListenToRelease(function()
			profiles[player] = nil
			player:Kick()
		end)
		if player:IsDescendantOf(Players) == true then
			profiles[player] = profile
		else
			profile:Release()
		end
	else
		player:Kick()
	end
end

function PlayerDataService:OnPlayerRemoved(player: Player)
	local profile = profiles[player]
	if profile ~= nil then
		profile:Release()
	end
end

function PlayerDataService:KnitStart() end

function PlayerDataService:KnitInit() end

return PlayerDataService
