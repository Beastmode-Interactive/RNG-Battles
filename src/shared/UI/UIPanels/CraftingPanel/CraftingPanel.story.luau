local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Packages:FindFirstChild("react-roblox"))
local CraftingPanel = require(ReplicatedStorage.Shared.UI.UIPanels.CraftingPanel)
return function(target)
	local root = ReactRoblox.createRoot(target)
	local example = React.createElement(CraftingPanel, {})
	root:render(example)

	return function()
		root:unmount()
	end
end
