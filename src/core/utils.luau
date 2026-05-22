local Utils = {}

function Utils.Create(className: string, props: {[string]: any}?)
	local instance = Instance.new(className)
	if props then
		for key, value in pairs(props) do
			instance[key] = value
		end
	end
	return instance
end

function Utils.ApplyCorner(instance: Instance, radius: UDim)
	local corner = Instance.new("UICorner")
	corner.CornerRadius = radius
	corner.Parent = instance
	return corner
end

function Utils.ApplyStroke(instance: Instance, color: Color3, transparency: number?)
	local stroke = Instance.new("UIStroke")
	stroke.Color = color
	stroke.Transparency = transparency or 0.4
	stroke.Thickness = 1
	stroke.Parent = instance
	return stroke
end

return Utils
