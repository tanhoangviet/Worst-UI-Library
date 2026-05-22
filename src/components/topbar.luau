local Theme = require(script.Parent.Parent.core.theme)
local Utils = require(script.Parent.Parent.core.utils)

local Topbar = {}

function Topbar.Create(parent, title, scale)
	local frame = Utils.Create("Frame", {Name = "Topbar", BackgroundTransparency = 1, Size = UDim2.new(1, -20, 0, scale.Topbar), Position = UDim2.fromOffset(10, 8), Parent = parent})

	Utils.Create("TextLabel", {BackgroundTransparency = 1, Text = title, TextColor3 = Theme.Colors.TextPrimary, TextXAlignment = Enum.TextXAlignment.Left, Font = Enum.Font.GothamBold, TextSize = scale.Title, Size = UDim2.new(0.4, 0, 1, 0), Parent = frame})

	local searchW = scale == Theme.Scale.Mobile and 130 or 280
	local search = Utils.Create("TextBox", {Name = "SearchBox", BackgroundColor3 = Theme.Colors.PanelSecondary, BorderSizePixel = 0, Text = "", PlaceholderText = "Search...", PlaceholderColor3 = Theme.Colors.TextSecondary, TextColor3 = Theme.Colors.TextPrimary, ClearTextOnFocus = false, TextSize = scale.Body, Font = Enum.Font.Gotham, Size = UDim2.new(0, searchW, 0, scale.Topbar - 10), Position = UDim2.new(0.5, -searchW / 2, 0, 4), Parent = frame})
	Utils.ApplyCorner(search, Theme.Corner.Medium); Utils.ApplyStroke(search, Theme.Colors.Stroke, 0.4)

	return frame
end

return Topbar
