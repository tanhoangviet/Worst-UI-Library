local Theme = {}

Theme.Colors = {
	Background = Color3.fromRGB(6, 10, 18),
	Panel = Color3.fromRGB(10, 14, 24),
	PanelSecondary = Color3.fromRGB(13, 18, 30),
	TextPrimary = Color3.fromRGB(244, 247, 255),
	TextSecondary = Color3.fromRGB(151, 160, 178),
	Accent = Color3.fromRGB(255, 33, 43),
	AccentSoft = Color3.fromRGB(73, 19, 24),
	Stroke = Color3.fromRGB(35, 43, 60),
}

Theme.Corner = {
	Small = UDim.new(0, 8),
	Medium = UDim.new(0, 12),
	Large = UDim.new(0, 16),
}

return Theme
