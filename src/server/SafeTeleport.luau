local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local ATTEMPT_LIMIT = 5
local RETRY_DELAY = 1
local FLOOD_DELAY = 15

local playerKeys = {}

local function SafeTeleport(placeId, accessCode, players)
	local attemptIndex = 0
	local success, result -- define pcall results outside of loop so results can be reported later on
	for _, player in ipairs(players) do
		playerKeys[player] = accessCode
	end
	repeat
		success, result = pcall(function()
			return TeleportService:TeleportToPrivateServer(placeId, accessCode, players) -- teleport the user in a protected call to prevent erroring
		end)
		attemptIndex += 1
		if not success then
			task.wait(RETRY_DELAY)
		end
	until success or attemptIndex == ATTEMPT_LIMIT -- stop trying to teleport if call was successful, or if retry limit has been reached

	if not success then
		warn(result) -- print the failure reason to output
	end

	return success, result
end

local function handleFailedTeleport(player, teleportResult, errorMessage, targetPlaceId, teleportOptions)
	if teleportResult == Enum.TeleportResult.Flooded then
		task.wait(FLOOD_DELAY)
	elseif teleportResult == Enum.TeleportResult.Failure then
		task.wait(RETRY_DELAY)
	else
		-- if the teleport is invalid, report the error instead of retrying
		error(("Invalid teleport [%s]: %s"):format(teleportResult.Name, errorMessage))
	end
	if playerKeys[player] then
		SafeTeleport(targetPlaceId, playerKeys[player], { player })
	end
end

Players.PlayerRemoving:Connect(function(player)
	playerKeys[player] = nil
end)

TeleportService.TeleportInitFailed:Connect(handleFailedTeleport)

return SafeTeleport
