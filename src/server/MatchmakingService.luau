local Environment = require(script.Parent.Environment)
local SafeTeleport = require(script.Parent.SafeTeleport)
local MatchmakingService = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local Events = ReplicatedStorage:WaitForChild("Events")

MatchmakingService.Pool = {}
MatchmakingService.PoolSize = 0
MatchmakingService.PendingLeave = {}

local function isPlayerInPool(player: Player)
	return MatchmakingService.Pool[player] ~= nil
end
local function isPlayerPendingLeave(player: Player)
	return MatchmakingService.PendingLeave[player] ~= nil
end

function MatchmakingService.ClearPlayerFromMemory(player: Player)
	if isPlayerInPool(player) then
		MatchmakingService.Pool[player] = nil
		MatchmakingService.PoolSize -= 1
	end
	if isPlayerPendingLeave(player) then
		MatchmakingService.PendingLeave[player] = nil
	end
end

local function pairPlayers(player1: Player, player2: Player)
	if
		not isPlayerInPool(player1)
		or not isPlayerInPool(player2)
		or isPlayerPendingLeave(player1)
		or isPlayerPendingLeave(player2)
	then
		error("A player was incorrectly paired")
	end
	MatchmakingService.PendingLeave[player1] = true
	MatchmakingService.PendingLeave[player2] = true
	MatchmakingService.Pool[player1] = nil
	MatchmakingService.Pool[player2] = nil
	MatchmakingService.PoolSize -= 2

	Events.PlayerIsMatched:FireClient(player1, player2)
	Events.PlayerIsMatched:FireClient(player2, player1)
	--Inform both players that they are matched
	--Send both players to new server
	local placeID: number
	if Environment == "Dev" then
		placeID = 83959568143265
	else
		placeID = 80658509347832
	end
	local accessCode: string = TeleportService:ReserveServer(placeID)
	SafeTeleport(placeID, accessCode, { player1, player2 })
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
local function runMatchmaking()
	if MatchmakingService.PoolSize <= 1 then
		return
	end

	local players = createSortedPlayersArrayFromTable(MatchmakingService.Pool)

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
	pairPlayers(p1.playerObject, p2.playerObject)
	-- Increment wait time
	for _, player in ipairs(players) do
		MatchmakingService.Pool[player.playerObject].queueTime = MatchmakingService.Pool[player.playerObject].queueTime
			+ 1
	end

	return
end

function MatchmakingService.JoinPool(player: Player)
	if isPlayerInPool(player) then
		error("Player is already in pool")
	end

	MatchmakingService.Pool[player] = { elo = 1, queueTime = 1 }
	MatchmakingService.PoolSize += 1
	runMatchmaking()
end

function MatchmakingService.ExitPool(player: Player)
	if not isPlayerInPool(player) then
		error("Player is not in pool")
	end
	if isPlayerPendingLeave(player) then
		error("Player cannot leave pool as is pending teleport")
	end

	MatchmakingService.Pool[player] = nil
	MatchmakingService.PoolSize -= 1
end

return MatchmakingService
