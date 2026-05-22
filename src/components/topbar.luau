local Theme = require(script.Parent.Parent.core.theme)
local Utils = require(script.Parent.Parent.core.utils)

local Topbar = {}

local function createIconButton(parent: Instance, emoji: string, x: number)
	local btn = Utils.Create("TextButton", {
		BackgroundColor3 = Theme.Colors.PanelSecondary,
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Text = emoji,
		TextSize = 24,
		FontFace = Font.fromName("GothamSSm", Enum.FontWeight.Bold),
		TextColor3 = Theme.Colors.TextPrimary,
		Size = UDim2.fromOffset(54, 54),
		Position = UDim2.new(1, x, 0, 0),
		Parent = parent,
	})
	Utils.ApplyCorner(btn, Theme.Corner.Medium)
	Utils.ApplyStroke(btn, Theme.Colors.Stroke, 0.4)
end

function Topbar.Create(parent: Instance, title: string)
	local frame = Utils.Create("Frame", {
		Name = "Topbar",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -40, 0, 84),
		Position = UDim2.fromOffset(20, 14),
		Parent = parent,
	})

	Utils.Create("TextLabel", {
		BackgroundTransparency = 1,
		Text = title,
		TextColor3 = Theme.Colors.TextPrimary,
		TextXAlignment = Enum.TextXAlignment.Left,
		FontFace = Font.fromName("GothamSSm", Enum.FontWeight.Bold),
		TextSize = 40,
		Size = UDim2.new(0.45, 0, 1, 0),
		Parent = frame,
	})

	local search = Utils.Create("TextBox", {
		Name = "SearchBox",
		BackgroundColor3 = Theme.Colors.PanelSecondary,
		BorderSizePixel = 0,
		Text = "",
		PlaceholderText = "Search...",
		PlaceholderColor3 = Theme.Colors.TextSecondary,
		TextColor3 = Theme.Colors.TextPrimary,
		ClearTextOnFocus = false,
		TextSize = 28,
		FontFace = Font.fromName("GothamSSm", Enum.FontWeight.Medium),
		Size = UDim2.new(0, 500, 0, 54),
		Position = UDim2.new(0.5, -180, 0, 0),
		Parent = frame,
	})
	Utils.ApplyCorner(search, Theme.Corner.Medium)
	Utils.ApplyStroke(search, Theme.Colors.Stroke, 0.4)

	createIconButton(frame, "🔔", -180)
	createIconButton(frame, "⚙", -114)
	createIconButton(frame, "✕", -48)

	return frame
end

return Topbar
