local Theme = require(script.core.theme)
local Utils = require(script.core.utils)
local Sidebar = require(script.components.sidebar)
local Topbar = require(script.components.topbar)
local Dashboard = require(script.components.dashboard)

local Library = {}

function Library:CreateWindow(title)
	local mobile = Utils.IsMobile()
	local scale = mobile and Theme.Scale.Mobile or Theme.Scale.Desktop
	local guiParent = Utils.GetGuiParent()
	local old = guiParent:FindFirstChild("WorstUiLibrary") if old then old:Destroy() end

	local sg = Utils.Create("ScreenGui", {Name = "WorstUiLibrary", ResetOnSpawn = false, IgnoreGuiInset = true, Parent = guiParent})
	local frame = Utils.Create("Frame", {Name = "Main", BackgroundColor3 = Theme.Colors.Background, BorderSizePixel = 0, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(scale.Width, scale.Height), Parent = sg})
	Utils.ApplyCorner(frame, Theme.Corner.Large); Utils.ApplyStroke(frame, Theme.Colors.Stroke, 0.2)

	Topbar.Create(frame, title or "TitanUI Library", scale)
	local body = Utils.Create("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, -20, 1, -scale.Topbar - 16), Position = UDim2.fromOffset(10, scale.Topbar + 12), Parent = frame})

	local contentHolder = Utils.Create("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, -(mobile and 0 or scale.Sidebar + 12), 1, 0), Position = UDim2.fromOffset(mobile and 0 or scale.Sidebar + 12, 0), Parent = body})
	Dashboard.Create(contentHolder, mobile)

	if not mobile then Sidebar.Create(body, scale) end
	if mobile then
		local tabBar = Utils.Create("Frame", {BackgroundColor3 = Theme.Colors.Panel, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 42), Position = UDim2.new(0,0,1,-42), Parent = frame})
		Utils.ApplyStroke(tabBar, Theme.Colors.Stroke, 0.5)
		for i, t in ipairs({"Home","Player","Visual","Settings"}) do
			Utils.Create("TextButton", {BackgroundTransparency = 1, Text = t, TextColor3 = i==1 and Theme.Colors.Accent or Theme.Colors.TextPrimary, Font = Enum.Font.GothamBold, TextSize = 14, Size = UDim2.new(0.25,0,1,0), Position = UDim2.new((i-1)*0.25,0,0,0), Parent = tabBar})
		end
	end
	return sg
end

function Library:Notify(text)
	print("[TitanUI Notify]", text)
end

return Library
