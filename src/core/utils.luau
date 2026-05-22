local Utils = {}

function Utils.Create(className, props)
	local instance = Instance.new(className)
	if props then
		for key, value in pairs(props) do
			pcall(function()
				instance[key] = value
			end)
		end
	end
	return instance
end

function Utils.ApplyCorner(instance, radius)
	local corner = Instance.new("UICorner")
	corner.CornerRadius = radius
	corner.Parent = instance
	return corner
end

function Utils.ApplyStroke(instance, color, transparency)
	local stroke = Instance.new("UIStroke")
	stroke.Color = color
	stroke.Transparency = transparency or 0.4
	stroke.Thickness = 1
	stroke.Parent = instance
	return stroke
end

function Utils.GetGuiParent()
	local success, result = pcall(function()
		if gethui then
			return gethui()
		end
		if syn and syn.protect_gui then
			local gui = Instance.new("ScreenGui")
			syn.protect_gui(gui)
			gui.Parent = game:GetService("CoreGui")
			return gui
		end
		return game:GetService("CoreGui")
	end)

	if success and result then
		return result
	end

	local players = game:GetService("Players")
	local localPlayer = players.LocalPlayer
	if localPlayer then
		return localPlayer:WaitForChild("PlayerGui")
	end

	return game:GetService("CoreGui")
end

return Utils
