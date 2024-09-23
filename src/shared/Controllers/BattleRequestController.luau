--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)
local MatchmakingService
local BattleRequestController = {
	Name = "BattleRequestController",
}

function BattleRequestController:KnitStart()
	MatchmakingService = Knit.GetService("MatchmakingService")
end

function BattleRequestController:KnitInit() end

function BattleRequestController:RequestBattle()
	MatchmakingService:JoinPool():andThen():catch(warn)
end

function BattleRequestController:ExitBattleRequest()
	MatchmakingService:ExitPool():andThen():catch(warn)
end

return BattleRequestController
