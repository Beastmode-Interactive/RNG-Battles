--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local MainPanel = require(ReplicatedStorage.Shared.UI.UIPanels.MainPanel)
local WaitingText = require(ReplicatedStorage.Shared.UI.UIPanels.WaitingText)
local Knit = require(ReplicatedStorage.Packages.Knit)
local SettingsPanel = require(ReplicatedStorage.Shared.UI.UIPanels.SettingsPanel)
local InventoryPanel = require(ReplicatedStorage.Shared.UI.UIPanels.InventoryPanel)
local ShopPanel = require(ReplicatedStorage.Shared.UI.UIPanels.ShopPanel)
local CraftingPanel = require(ReplicatedStorage.Shared.UI.UIPanels.CraftingPanel)
local QuestsBattlepassPanel = require(ReplicatedStorage.Shared.UI.UIPanels.QuestsBattlepassPanel)
local StatsPanel = require(ReplicatedStorage.Shared.UI.UIPanels.StatsPanel)
local GuildsPanel = require(ReplicatedStorage.Shared.UI.UIPanels.GuildsPanel)
local TradingPanel = require(ReplicatedStorage.Shared.UI.UIPanels.TradingPanel)
local IndexPanel = require(ReplicatedStorage.Shared.UI.UIPanels.IndexPanel)
local RunService = game:GetService("RunService")
return function()
	local playerState, setPlayerState = React.useState("Unqueued")
	local isMobile, setIsMobile = React.useState(false)
	local currentlyOpenScreen, setCurrentlyOpenScreen = React.useState("None")
	React.useEffect(function()
		local connection
		connection = RunService.RenderStepped:Connect(function()
			if game.Workspace.CurrentCamera then
				setIsMobile(game.Workspace.CurrentCamera.ViewportSize.X < 1000)
				connection:Disconnect()
			end
		end)
		local signal2: RBXScriptConnection = game.Workspace.CurrentCamera
			:GetPropertyChangedSignal("ViewportSize")
			:Connect(function()
				setIsMobile(game.Workspace.CurrentCamera.ViewportSize.X < 1000)
			end)
		local MatchmakingService = Knit.GetService("MatchmakingService")
		local signal: RBXScriptConnection = MatchmakingService.PlayerIsMatched:Connect(function()
			setPlayerState("Teleporting")
		end)
		return function()
			signal2:Disconnect()
			signal:Disconnect()
		end
	end, {})

	local function setCurrentlyOpenScreenHandler(val)
		if val == currentlyOpenScreen then
			setCurrentlyOpenScreen("None")
		else
			setCurrentlyOpenScreen(val)
		end
	end

	local openScreen = nil
	if currentlyOpenScreen == "Settings" then
		openScreen = React.createElement(SettingsPanel, { isMobile = isMobile })
	elseif currentlyOpenScreen == "Inventory" then
		openScreen = React.createElement(InventoryPanel, { isMobile = isMobile })
	elseif currentlyOpenScreen == "Shop" then
		openScreen = React.createElement(ShopPanel, { isMobile = isMobile })
	elseif currentlyOpenScreen == "Crafting" then
		openScreen = React.createElement(CraftingPanel, { isMobile = isMobile })
	elseif currentlyOpenScreen == "QuestsBattlepass" then
		openScreen = React.createElement(QuestsBattlepassPanel, { isMobile = isMobile })
	elseif currentlyOpenScreen == "Stats" then
		openScreen = React.createElement(StatsPanel, { isMobile = isMobile })
	elseif currentlyOpenScreen == "Guilds" then
		openScreen = React.createElement(GuildsPanel, { isMobile = isMobile })
	elseif currentlyOpenScreen == "Trading" then
		openScreen = React.createElement(TradingPanel, { isMobile = isMobile })
	elseif currentlyOpenScreen == "Index" then
		openScreen = React.createElement(IndexPanel, { isMobile = isMobile })
	end

	return {
		if playerState ~= "Teleporting"
			then React.createElement(MainPanel, {
				isMobile = isMobile,
				playerState = playerState,
				setPlayerState = setPlayerState,
				setCurrentlyOpenScreen = setCurrentlyOpenScreenHandler,
				currentlyOpenScreen = currentlyOpenScreen,
			})
			else nil,
		if playerState == "Queued" then React.createElement(WaitingText) else nil,
		openScreen,
	}
end
