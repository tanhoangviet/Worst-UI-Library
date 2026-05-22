local Theme = {}

Theme.Colors = {
	Background = Color3.fromRGB(6, 10, 18),
	Panel = Color3.fromRGB(10, 14, 24),
	PanelSecondary = Color3.fromRGB(13, 18, 30),
	TextPrimary = Color3.fromRGB(244, 247, 255),
	TextSecondary = Color3.fromRGB(151, 160, 178),
	Accent = Color3.fromRGB(255, 33, 43),
	Stroke = Color3.fromRGB(35, 43, 60),
}

Theme.Corner = { Small = UDim.new(0, 8), Medium = UDim.new(0, 12), Large = UDim.new(0, 16) }

Theme.Scale = {
	Desktop = {Width = 1080, Height = 660, Sidebar = 220, Topbar = 62, Title = 28, Body = 20},
	Mobile = {Width = 360, Height = 520, Sidebar = 0, Topbar = 56, Title = 24, Body = 16},
}

return Theme
