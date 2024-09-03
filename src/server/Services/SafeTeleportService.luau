local TeleportService = game:GetService("TeleportService")

local ATTEMPT_LIMIT = 5
local RETRY_DELAY = 1
local FLOOD_DELAY = 15

local SafeTeleportService = {
	Name = "SafeTeleportService",
	Client = {},
	playerKeys = {},
}

function SafeTeleportService:SafeTeleport(placeId, accessCode, players)
	local attemptIndex = 0
	local success, result
	for _, player in ipairs(players) do
		self.playerKeys[player] = accessCode
	end
	repeat
		success, result = pcall(function()
			return TeleportService:TeleportToPrivateServer(placeId, accessCode, players)
		end)
		attemptIndex += 1
		if not success then
			task.wait(RETRY_DELAY)
		end
	until success or attemptIndex == ATTEMPT_LIMIT

	if not success then
		warn(result)
	end

	return success, result
end

function SafeTeleportService:handleFailedTeleport(player, teleportResult, errorMessage, targetPlaceId, _)
	if teleportResult == Enum.TeleportResult.Flooded then
		task.wait(FLOOD_DELAY)
	elseif teleportResult == Enum.TeleportResult.Failure then
		task.wait(RETRY_DELAY)
	else
		error(("Invalid teleport [%s]: %s"):format(teleportResult.Name, errorMessage))
	end
	if self.playerKeys[player] then
		SafeTeleportService:SafeTeleport(targetPlaceId, self.playerKeys[player], { player })
	end
end

function SafeTeleportService:OnPlayerRemoved(player: Player)
	self.playerKeys[player] = nil
end

function SafeTeleportService:KnitStart()
	TeleportService.TeleportInitFailed:Connect(SafeTeleportService.handleFailedTeleport)
end

function SafeTeleportService:KnitInit() end

return SafeTeleportService
