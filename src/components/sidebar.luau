local Theme = require(script.Parent.Parent.core.theme)
local Utils = require(script.Parent.Parent.core.utils)

local Sidebar = {}
local ITEMS = {"Dashboard", "Player", "Visuals", "World", "Combat", "Misc", "Settings"}

function Sidebar.Create(parent, scale, onTab)
	local bar = Utils.Create("Frame", {Name = "Sidebar", BackgroundColor3 = Theme.Colors.Panel, BorderSizePixel = 0, Size = UDim2.new(0, scale.Sidebar, 1, -10), Position = UDim2.fromOffset(0, 10), Parent = parent})
	Utils.ApplyCorner(bar, Theme.Corner.Medium); Utils.ApplyStroke(bar, Theme.Colors.Stroke, 0.5)

	for i, label in ipairs(ITEMS) do
		local b = Utils.Create("TextButton", {Name = label, AutoButtonColor = false, BackgroundColor3 = i == 1 and Theme.Colors.Accent or Theme.Colors.Panel, BackgroundTransparency = i == 1 and 0 or 1, TextColor3 = Theme.Colors.TextPrimary, TextXAlignment = Enum.TextXAlignment.Left, TextSize = scale.Body, Font = Enum.Font.Gotham, Size = UDim2.new(1, -14, 0, 40), Position = UDim2.new(0, 7, 0, 20 + ((i - 1) * 46)), Text = "  " .. label, Parent = bar})
		Utils.ApplyCorner(b, Theme.Corner.Medium)
		b.MouseButton1Click:Connect(function() if onTab then onTab(label) end end)
	end
	return bar
end

return Sidebar
