local Theme = require(script.core.theme)
local Utils = require(script.core.utils)
local Sidebar = require(script.components.sidebar)
local Topbar = require(script.components.topbar)
local Dashboard = require(script.components.dashboard)

local Library = {}

function Library:CreateWindow(title)
	local guiParent = Utils.GetGuiParent()
	local oldGui = guiParent:FindFirstChild("WorstUiLibrary")
	if oldGui then
		oldGui:Destroy()
	end

	local screenGui = Utils.Create("ScreenGui", {Name = "WorstUiLibrary", ResetOnSpawn = false, IgnoreGuiInset = true, Parent = guiParent})

	local frame = Utils.Create("Frame", {
		Name = "Main",
		BackgroundColor3 = Theme.Colors.Background,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(1540, 930),
		Parent = screenGui,
	})
	Utils.ApplyCorner(frame, Theme.Corner.Large)
	Utils.ApplyStroke(frame, Theme.Colors.Stroke, 0.2)

	Topbar.Create(frame, title or "TitanUI Library")

	local body = Utils.Create("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -20, 1, -115),
		Position = UDim2.new(0, 10, 0, 105),
		Parent = frame,
	})

	Sidebar.Create(body)
	Dashboard.Create(body)

	return screenGui
end

return Library
