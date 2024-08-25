local defaultProfile = {
	cash = 0,
	xp = 0,
	inventory = {
		auras = {},
		materials = {},
	},
}

local ProfileService = require(script.ProfileService)
local MatchmakingService = require(script.MatchmakingService)
local InitialiseGame = require(script.InitialiseGame)
local Players = game:GetService("Players")

local profileStore = ProfileService.GetProfileStore("PlayerData", defaultProfile)

local profiles = {}

local function playerRemoved(player: Player)
	MatchmakingService.ClearPlayerFromMemory(player)
	local profile = profiles[player]
	if profile ~= nil then
		profile:Release()
	end
end

local function playerAdded(player: Player)
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

-- Ensure all added players run through playerAdded/playerRemoved
for _, player in ipairs(Players:GetPlayers()) do
	task.spawn(playerAdded, player)
end
Players.PlayerAdded:Connect(playerAdded)
Players.PlayerRemoving:Connect(playerRemoved)

InitialiseGame()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:WaitForChild("Events")
Events:WaitForChild("RequestBattle").OnServerEvent:Connect(function(player)
	MatchmakingService.JoinPool(player)
end)

Events:WaitForChild("ExitBattleRequest").OnServerEvent:Connect(function(player)
	MatchmakingService.ExitPool(player)
end)
