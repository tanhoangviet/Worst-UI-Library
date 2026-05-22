local Theme = require(script.Parent.Parent.core.theme)
local Utils = require(script.Parent.Parent.core.utils)

local Dashboard = {}

local function createCard(parent, title, value, xScale, y)
	local card = Utils.Create("Frame", {BackgroundColor3 = Theme.Colors.PanelSecondary, BorderSizePixel = 0, Size = UDim2.new(xScale, -8, 0, 88), Position = UDim2.new(0, 0, 0, y), Parent = parent})
	Utils.ApplyCorner(card, Theme.Corner.Medium); Utils.ApplyStroke(card, Theme.Colors.Stroke, 0.5)
	Utils.Create("TextLabel", {BackgroundTransparency = 1, Text = title, TextColor3 = Theme.Colors.TextSecondary, TextSize = 14, Font = Enum.Font.Gotham, Size = UDim2.new(1, -12, 0, 24), Position = UDim2.fromOffset(8, 6), TextXAlignment = Enum.TextXAlignment.Left, Parent = card})
	Utils.Create("TextLabel", {BackgroundTransparency = 1, Text = value, TextColor3 = Theme.Colors.TextPrimary, TextSize = 28, Font = Enum.Font.GothamBold, Size = UDim2.new(1, -12, 0, 42), Position = UDim2.fromOffset(8, 30), TextXAlignment = Enum.TextXAlignment.Left, Parent = card})
	return card
end

function Dashboard.Create(parent, mobile)
	local content = Utils.Create("Frame", {Name = "Content", BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, -8), Position = UDim2.fromOffset(0, 8), Parent = parent})
	Utils.Create("TextLabel", {BackgroundTransparency = 1, Text = "Dashboard", TextColor3 = Theme.Colors.TextPrimary, TextSize = mobile and 26 or 32, Font = Enum.Font.GothamBold, Size = UDim2.new(1, 0, 0, 36), TextXAlignment = Enum.TextXAlignment.Left, Parent = content})

	local grid = Utils.Create("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, mobile and 196 or 96), Position = UDim2.fromOffset(0, 44), Parent = content})
	if mobile then
		createCard(grid, "Players", "12/16", 1, 0)
		createCard(grid, "Ping", "42ms", 1, 96)
	else
		local c1 = createCard(grid, "Players", "12/16", 0.25, 0); c1.Position = UDim2.new(0, 0, 0, 0)
		local c2 = createCard(grid, "Ping", "42ms", 0.25, 0); c2.Position = UDim2.new(0.25, 4, 0, 0)
		local c3 = createCard(grid, "FPS", "144", 0.25, 0); c3.Position = UDim2.new(0.5, 8, 0, 0)
		local c4 = createCard(grid, "Region", "SG", 0.25, 0); c4.Position = UDim2.new(0.75, 12, 0, 0)
	end

	local toggles = Utils.Create("Frame", {BackgroundColor3 = Theme.Colors.PanelSecondary, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, mobile and 180 or 220), Position = UDim2.new(0, 0, 0, mobile and 248 or 154), Parent = content})
	Utils.ApplyCorner(toggles, Theme.Corner.Medium); Utils.ApplyStroke(toggles, Theme.Colors.Stroke, 0.5)
	Utils.Create("TextLabel", {BackgroundTransparency = 1, Text = "Quick Toggles", TextColor3 = Theme.Colors.TextPrimary, TextSize = 20, Font = Enum.Font.GothamBold, Size = UDim2.new(1, -16, 0, 28), Position = UDim2.fromOffset(8, 8), TextXAlignment = Enum.TextXAlignment.Left, Parent = toggles})

	local toggleNames = {"Noclip", "Infinite Jump", "ESP", "Speed Boost"}
	for i, n in ipairs(toggleNames) do
		Utils.Create("TextButton", {BackgroundColor3 = i <= 2 and Theme.Colors.Accent or Color3.fromRGB(55,60,72), BorderSizePixel = 0, Text = n, TextColor3 = Theme.Colors.TextPrimary, Font = Enum.Font.Gotham, TextSize = 14, Size = UDim2.new(1, -16, 0, 30), Position = UDim2.fromOffset(8, 38 + (i - 1) * 34), Parent = toggles})
	end

	return content
end

return Dashboard
