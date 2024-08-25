local ReplicatedStorage = game:GetService("ReplicatedStorage")

local events = Instance.new("Folder")
events.Parent = ReplicatedStorage
events.Name = "Events"

local remoteEventNames = {
	"RequestBattle",
	"ExitBattleRequest",
	"PlayerIsMatched",
}

local function createRemoteEvent(name)
	local remoteEvent = Instance.new("RemoteEvent")
	remoteEvent.Name = name
	remoteEvent.Parent = events
end

return function()
	for _, eventName in ipairs(remoteEventNames) do
		createRemoteEvent(eventName)
	end
end
