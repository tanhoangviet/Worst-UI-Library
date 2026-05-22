local Utils = {}

function Utils.Create(className, props)
	local instance = Instance.new(className)
	if props then
		for key, value in pairs(props) do pcall(function() instance[key] = value end) end
	end
	return instance
end

function Utils.ApplyCorner(instance, radius)
	local c = Instance.new("UICorner"); c.CornerRadius = radius; c.Parent = instance; return c
end

function Utils.ApplyStroke(instance, color, transparency)
	local s = Instance.new("UIStroke"); s.Color = color; s.Transparency = transparency or 0.4; s.Thickness = 1; s.Parent = instance; return s
end

function Utils.GetService(name)
	if cloneref then
		local ok, svc = pcall(function() return cloneref(game:GetService(name)) end)
		if ok and svc then return svc end
	end
	return game:GetService(name)
end

function Utils.GetGuiParent()
	local ok, result = pcall(function()
		if gethui then return gethui() end
		if syn and syn.protect_gui then
			local g = Instance.new("ScreenGui"); syn.protect_gui(g); g.Parent = Utils.GetService("CoreGui"); return g
		end
		return Utils.GetService("CoreGui")
	end)
	if ok and result then return result end
	local p = Utils.GetService("Players").LocalPlayer
	if p then return p:WaitForChild("PlayerGui") end
	return Utils.GetService("CoreGui")
end

function Utils.IsMobile()
	local cam = workspace.CurrentCamera
	local size = cam and cam.ViewportSize or Vector2.new(1920,1080)
	return size.X < 900
end

return Utils
