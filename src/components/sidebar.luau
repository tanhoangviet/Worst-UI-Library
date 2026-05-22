local Theme = require(script.Parent.Parent.core.theme)
local Utils = require(script.Parent.Parent.core.utils)

local Sidebar = {}

local ITEMS = {"Dashboard", "Player", "Visuals", "World", "Combat", "Miscellaneous", "Settings"}

function Sidebar.Create(parent)
	local sidebar = Utils.Create("Frame", {
		Name = "Sidebar",
		BackgroundColor3 = Theme.Colors.Panel,
		BorderSizePixel = 0,
		Size = UDim2.new(0, 290, 1, -20),
		Position = UDim2.fromOffset(0, 10),
		Parent = parent,
	})
	Utils.ApplyCorner(sidebar, Theme.Corner.Medium)
	Utils.ApplyStroke(sidebar, Theme.Colors.Stroke, 0.5)

	local header = Utils.Create("TextLabel", {BackgroundTransparency = 1, Text = "☠ TitanUI", TextColor3 = Theme.Colors.TextPrimary, TextSize = 34, Font = Enum.Font.GothamBold, Size = UDim2.new(1, -20, 0, 70), Position = UDim2.fromOffset(14, 8), TextXAlignment = Enum.TextXAlignment.Left, Parent = sidebar})

	for index, label in ipairs(ITEMS) do
		local y = 88 + ((index - 1) * 76)
		local button = Utils.Create("TextButton", {
			Name = label,
			AutoButtonColor = false,
			BackgroundColor3 = index == 1 and Theme.Colors.Accent or Theme.Colors.Panel,
			BackgroundTransparency = index == 1 and 0 or 1,
			TextColor3 = Theme.Colors.TextPrimary,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextSize = 30,
			Font = Enum.Font.Gotham,
			Size = UDim2.new(1, -20, 0, 60),
			Position = UDim2.new(0, 10, 0, y),
			Text = "    " .. label,
			Parent = sidebar,
		})
		Utils.ApplyCorner(button, Theme.Corner.Medium)
	end

	Utils.Create("TextLabel", {
		BackgroundTransparency = 1,
		Text = "Username\nPremium",
		TextColor3 = Theme.Colors.TextPrimary,
		TextSize = 28,
		Font = Enum.Font.Gotham,
		Size = UDim2.new(1, -20, 0, 100),
		Position = UDim2.new(0, 16, 1, -120),
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		Parent = sidebar,
	})

	return sidebar
end

return Sidebar
