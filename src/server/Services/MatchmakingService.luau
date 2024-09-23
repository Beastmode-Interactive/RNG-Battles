--!strict
local MemoryStoreService = game:GetService("MemoryStoreService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)
local Environment = require(ReplicatedStorage.Shared.Environment)
local ServerScriptService = game:GetService("ServerScriptService")
local SafeTeleportService = require(ServerScriptService.Server.Services.SafeTeleportService)
local LeaderElection = require(ServerScriptService.Server.Services.LeaderElection)
local HttpService = game:GetService("HttpService")
local MessagingService = game:GetService("MessagingService")
local TeleportService = game:GetService("TeleportService")
local MatchmakingQueue: MemoryStoreSortedMap

local placeID: number

local MatchmakingService = {
	Name = "MatchmakingService",
	Client = {
		PlayerIsMatched = Knit.CreateSignal(),
	},
}

local function PerformMatchmaking()
	while true do
		local longestWaitingPlayers: { any } = {}
		local success, result = pcall(function()
			longestWaitingPlayers = MatchmakingQueue:GetRangeAsync(Enum.SortDirection.Ascending, 2)
		end)
		if not success then
			warn(string.format("Failed to fetch data from matchmakingQueue: %s", result))
			continue
		end
		if #longestWaitingPlayers ~= 2 then
			break
		end
		local accessCode: string
		success, result = pcall(function()
			accessCode = TeleportService:ReserveServer(placeID)
		end)
		if not success then
			warn(string.format("Failed to reserve new server because: %s", result))
			continue
		end
		local data = {
			accessCode = accessCode,
			player1Id = longestWaitingPlayers[1].key,
			player2Id = longestWaitingPlayers[2].key,
		}
		success, result = pcall(function()
			MatchmakingQueue:RemoveAsync(longestWaitingPlayers[1].key)
			MatchmakingQueue:RemoveAsync(longestWaitingPlayers[2].key)
		end)
		if not success then
			warn(string.format("Unable to remove waiting players from queue: %s", result))
		end
		MessagingService:PublishAsync("SendPlayersToServer", HttpService:JSONEncode(data))
	end
end

function MatchmakingService.Client:JoinPool(player: Player)
	pcall(function()
		MatchmakingQueue:SetAsync(tostring(player.UserId), true, 86400, time())
	end)
end

function MatchmakingService.Client:ExitPool(player: Player)
	pcall(function()
		MatchmakingQueue:RemoveAsync(tostring(player.UserId))
	end)
end

function MatchmakingService:OnPlayerRemoved(player: Player)
	pcall(function()
		MatchmakingQueue:RemoveAsync(tostring(player.UserId))
	end)
end

function MatchmakingService:KnitStart()
	local getQueueSuccess, response = pcall(function()
		MatchmakingQueue = MemoryStoreService:GetSortedMap("MatchmakingQueue")
	end)
	if not getQueueSuccess then
		warn(response)
	end

	if Environment == "Dev" then
		placeID = 83959568143265
	else
		placeID = 80658509347832
	end

	local success, result = pcall(function()
		MessagingService:SubscribeAsync("SendPlayersToServer", function(message)
			local data = HttpService:JSONDecode(message.Data)
			local p1 = Players:GetPlayerByUserId(data.player1Id)
			local p2 = Players:GetPlayerByUserId(data.player2Id)
			if p1 then
				self.Client.PlayerIsMatched:Fire(p1)
				SafeTeleportService:SafeTeleport(placeID, data.accessCode, { p1 })
			end
			if p2 then
				self.Client.PlayerIsMatched:Fire(p2)
				SafeTeleportService:SafeTeleport(placeID, data.accessCode, { p2 })
			end
		end)
	end)

	if not success then
		warn(string.format("Failed to subscribe to messaging topic because: %s", result))
	end
	LeaderElection.startLoop("PerformMatchmaking", 2, PerformMatchmaking)
end

function MatchmakingService:KnitInit() end

return MatchmakingService
