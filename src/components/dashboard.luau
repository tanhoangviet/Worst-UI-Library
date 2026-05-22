local Theme = require(script.Parent.Parent.core.theme)
local Utils = require(script.Parent.Parent.core.utils)

local Dashboard = {}

local function createStatCard(parent, title, value, position)
	local card = Utils.Create("Frame", {
		BackgroundColor3 = Theme.Colors.PanelSecondary,
		BorderSizePixel = 0,
		Size = UDim2.new(0, 248, 0, 140),
		Position = position,
		Parent = parent,
	})
	Utils.ApplyCorner(card, Theme.Corner.Medium)
	Utils.ApplyStroke(card, Theme.Colors.Stroke, 0.5)

	Utils.Create("TextLabel", {
		BackgroundTransparency = 1,
		Text = title,
		TextColor3 = Theme.Colors.TextSecondary,
		TextSize = 24,
		Font = Enum.Font.Gotham,
		Size = UDim2.new(1, -20, 0, 34),
		Position = UDim2.new(0, 18, 0, 14),
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = card,
	})

	Utils.Create("TextLabel", {
		BackgroundTransparency = 1,
		Text = value,
		TextColor3 = Theme.Colors.TextPrimary,
		TextSize = 46,
		Font = Enum.Font.GothamBold,
		Size = UDim2.new(1, -20, 0, 58),
		Position = UDim2.new(0, 18, 0, 54),
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = card,
	})
end

local function createToggle(parent, label, enabled, y)
	Utils.Create("TextLabel", {
		BackgroundTransparency = 1,
		Text = label,
		TextColor3 = Theme.Colors.TextPrimary,
		TextSize = 20,
		Font = Enum.Font.Gotham,
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.new(1, -150, 0, 42),
		Position = UDim2.new(0, 22, 0, y),
		Parent = parent,
	})

	local toggle = Utils.Create("Frame", {
		BackgroundColor3 = enabled and Theme.Colors.Accent or Color3.fromRGB(55, 60, 72),
		BorderSizePixel = 0,
		Size = UDim2.fromOffset(82, 42),
		Position = UDim2.new(1, -104, 0, y),
		Parent = parent,
	})
	Utils.ApplyCorner(toggle, UDim.new(1, 0))
	local knob = Utils.Create("Frame", {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderSizePixel = 0,
		Size = UDim2.fromOffset(32, 32),
		Position = enabled and UDim2.fromOffset(46, 5) or UDim2.fromOffset(5, 5),
		Parent = toggle,
	})
	Utils.ApplyCorner(knob, UDim.new(1, 0))
end

function Dashboard.Create(parent)
	local content = Utils.Create("Frame", {
		Name = "Content",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -320, 1, -140),
		Position = UDim2.new(0, 310, 0, 116),
		Parent = parent,
	})

	Utils.Create("TextLabel", {
		BackgroundTransparency = 1,
		Text = "Dashboard",
		TextColor3 = Theme.Colors.TextPrimary,
		TextSize = 56,
		Font = Enum.Font.GothamBold,
		Size = UDim2.new(1, 0, 0, 66),
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = content,
	})

	Utils.Create("TextLabel", {
		BackgroundTransparency = 1,
		Text = "Overview of your game stats.",
		TextColor3 = Theme.Colors.TextSecondary,
		TextSize = 30,
		Font = Enum.Font.Gotham,
		Size = UDim2.new(1, 0, 0, 40),
		Position = UDim2.fromOffset(0, 60),
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = content,
	})

	createStatCard(content, "Players", "12 / 16", UDim2.new(0, 0, 0, 112))
	createStatCard(content, "Ping", "42ms", UDim2.new(0, 266, 0, 112))
	createStatCard(content, "FPS", "144", UDim2.new(0, 532, 0, 112))
	createStatCard(content, "Region", "Singapore", UDim2.new(0, 798, 0, 112))

	local performance = Utils.Create("Frame", {
		BackgroundColor3 = Theme.Colors.PanelSecondary,
		BorderSizePixel = 0,
		Size = UDim2.new(0, 920, 0, 440),
		Position = UDim2.new(0, 0, 0, 270),
		Parent = content,
	})
	Utils.ApplyCorner(performance, Theme.Corner.Medium)
	Utils.ApplyStroke(performance, Theme.Colors.Stroke, 0.5)

	Utils.Create("TextLabel", {BackgroundTransparency = 1, Text = "Performance", TextColor3 = Theme.Colors.TextPrimary, TextSize = 48, Font = Enum.Font.GothamBold, Size = UDim2.new(1, -20, 0, 64), Position = UDim2.fromOffset(18, 14), TextXAlignment = Enum.TextXAlignment.Left, Parent = performance})
	Utils.Create("TextLabel", {BackgroundTransparency = 1, Text = "144 FPS", TextColor3 = Theme.Colors.Accent, TextSize = 44, Font = Enum.Font.GothamBold, Size = UDim2.new(0, 180, 0, 58), Position = UDim2.new(1, -190, 0, 22), TextXAlignment = Enum.TextXAlignment.Right, Parent = performance})

	local toggles = Utils.Create("Frame", {
		BackgroundColor3 = Theme.Colors.PanelSecondary,
		BorderSizePixel = 0,
		Size = UDim2.new(0, 430, 0, 440),
		Position = UDim2.new(0, 940, 0, 270),
		Parent = content,
	})
	Utils.ApplyCorner(toggles, Theme.Corner.Medium)
	Utils.ApplyStroke(toggles, Theme.Colors.Stroke, 0.5)

	Utils.Create("TextLabel", {BackgroundTransparency = 1, Text = "Quick Toggles", TextColor3 = Theme.Colors.TextPrimary, TextSize = 48, FontFace = Font.fromName("GothamSSm", Enum.FontWeight.Bold), Size = UDim2.new(1, -20, 0, 64), Position = UDim2.fromOffset(18, 14), TextXAlignment = Enum.TextXAlignment.Left, Parent = toggles})
	createToggle(toggles, "Noclip", true, 94)
	createToggle(toggles, "Infinite Jump", true, 162)
	createToggle(toggles, "God Mode", true, 230)
	createToggle(toggles, "Fly", false, 298)
	createToggle(toggles, "Speed Boost", false, 366)

	return content
end

return Dashboard
