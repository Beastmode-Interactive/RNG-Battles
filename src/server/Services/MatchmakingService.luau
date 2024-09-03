local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)
local Environment = require(ReplicatedStorage.Shared.Environment)
local ServerScriptService = game:GetService("ServerScriptService")
local SafeTeleportService = require(ServerScriptService.Server.Services.SafeTeleportService)
local TeleportService = game:GetService("TeleportService")

local MatchmakingService = {
	Name = "MatchmakingService",
	Client = {
		PlayerIsMatched = Knit.CreateSignal(),
	},
	Pool = {},
	PoolSize = 0,
	PendingLeave = {},
}

function MatchmakingService:isPlayerInPool(player: Player)
	return self.Pool[player] ~= nil
end
function MatchmakingService:isPlayerPendingLeave(player: Player)
	return self.PendingLeave[player] ~= nil
end

function MatchmakingService:ClearPlayerFromMemory(player: Player)
	if self:isPlayerInPool(player) then
		self.Pool[player] = nil
		self.PoolSize -= 1
	end
	if self:isPlayerPendingLeave(player) then
		self.PendingLeave[player] = nil
	end
end

function MatchmakingService:pairPlayers(player1: Player, player2: Player)
	if
		not self:isPlayerInPool(player1)
		or not self:isPlayerInPool(player2)
		or self:isPlayerPendingLeave(player1)
		or self:isPlayerPendingLeave(player2)
	then
		error("A player was incorrectly paired")
	end
	self.PendingLeave[player1] = true
	self.PendingLeave[player2] = true
	self.Pool[player1] = nil
	self.Pool[player2] = nil
	self.PoolSize -= 2

	self.Client.PlayerIsMatched:Fire(player1, player2)
	self.Client.PlayerIsMatched:Fire(player2, player1)
	--Inform both players that they are matched
	--Send both players to new server
	local placeID: number
	if Environment == "Dev" then
		placeID = 83959568143265
	else
		placeID = 80658509347832
	end
	local accessCode: string = TeleportService:ReserveServer(placeID)
	SafeTeleportService:SafeTeleport(placeID, accessCode, { player1, player2 })
end

local function createSortedPlayersArrayFromTable(pool)
	local players = {}

	for player, data in pairs(pool) do
		table.insert(players, { playerObject = player, elo = data.elo, queueTime = data.queueTime })
	end
	table.sort(players, function(a, b)
		if a.queueTime == b.queueTime then
			return a.elo < b.elo
		else
			return a.queueTime > b.queueTime
		end
	end)
	return players
end

--this needs some work....
function MatchmakingService:runMatchmaking()
	if self.PoolSize <= 1 then
		return
	end

	local players = createSortedPlayersArrayFromTable(self.Pool)

	-- while #players >= 2 do
	-- 	local player1 = table.remove(players, 1) -- First player (longest waiting)
	-- 	local bestMatch = nil
	-- 	local bestMatchIndex = nil
	-- 	local bestEloDifference = math.huge

	-- 	-- Find the closest elo match among the remaining players
	-- 	for i, player2 in ipairs(players) do
	-- 		local eloDifference = math.abs(player1.elo - player2.elo)

	-- 		-- Calculate the percentage difference relative to the lower Elo
	-- 		local minElo = math.min(player1.elo, player2.elo)
	-- 		local percentageDifference = (eloDifference / minElo) * 100

	-- 		-- Check if the difference is within 25% and smaller than the current best difference
	-- 		if percentageDifference <= 25 and eloDifference < bestEloDifference then
	-- 			bestEloDifference = eloDifference
	-- 			bestMatch = player2
	-- 			bestMatchIndex = i
	-- 		end
	-- 	end

	-- 	-- If a fair pairing exists, add them to the pairs table
	-- 	if bestMatch then
	-- 		pairPlayers(player1.playerObject, bestMatch.playerObject)
	-- 		table.remove(players, bestMatchIndex)
	-- 	else
	-- 		-- If no fair pairing was found, increment the queueTime for the player
	-- 		MatchmakingService.Pool[player1.playerObject].queueTime = MatchmakingService.Pool[player1.playerObject].queueTime
	-- 			+ 1
	-- 	end
	-- end

	local p1 = table.remove(players, 1)
	local p2 = table.remove(players, 1)
	self:pairPlayers(p1.playerObject, p2.playerObject)
	-- Increment wait time
	for _, player in ipairs(players) do
		self.Pool[player.playerObject].queueTime = self.Pool[player.playerObject].queueTime + 1
	end

	return
end

function MatchmakingService.Client:JoinPool(player: Player)
	if self.Server:isPlayerInPool(player) then
		error("Player is already in pool")
	end
	self.Server.Pool[player] = { elo = 1, queueTime = 1 }
	self.Server.PoolSize += 1
	self.Server:runMatchmaking()
end

function MatchmakingService.Client:ExitPool(player: Player)
	if not self.Server:isPlayerInPool(player) then
		error("Player is not in pool")
	end
	if self.Server:isPlayerPendingLeave(player) then
		error("Player cannot leave pool as is pending teleport")
	end

	self.Server.Pool[player] = nil
	self.Server.PoolSize -= 1
end

function MatchmakingService:KnitStart() end

function MatchmakingService:KnitInit() end

return MatchmakingService
