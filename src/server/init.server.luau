local InitialiseGame = require(script.InitialiseGame)
InitialiseGame()

local defaultProfile = {
	cash = 0,
	xp = 0,
	inventory = {
		auras = {},
		materials = {},
	},
}

local MatchmakingService = require(script.MatchmakingService)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProfileService = require(ReplicatedStorage.Packages.ProfileService)
local Players = game:GetService("Players")
local Events = ReplicatedStorage:WaitForChild("Events")
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

Events:WaitForChild("RequestBattle").OnServerEvent:Connect(function(player)
	MatchmakingService.JoinPool(player)
end)

Events:WaitForChild("ExitBattleRequest").OnServerEvent:Connect(function(player)
	MatchmakingService.ExitPool(player)
end)
