local __modules={}
__modules.theme=(function()
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
end)()
__modules.utils=(function()
local Utils = {}

function Utils.Create(className, props)
	local instance = Instance.new(className)
	if props then
		for key, value in pairs(props) do pcall(function() instance[key] = value end) end
	end
	return instance
end

function Utils.ApplyCorner(instance, radius)
	local c = Instance.new("UICorner"); c.CornerRadius = radius; c.Parent = instance; return c
end

function Utils.ApplyStroke(instance, color, transparency)
	local s = Instance.new("UIStroke"); s.Color = color; s.Transparency = transparency or 0.4; s.Thickness = 1; s.Parent = instance; return s
end

function Utils.GetService(name)
	if cloneref then
		local ok, svc = pcall(function() return cloneref(game:GetService(name)) end)
		if ok and svc then return svc end
	end
	return game:GetService(name)
end

function Utils.GetGuiParent()
	local ok, result = pcall(function()
		if gethui then return gethui() end
		if syn and syn.protect_gui then
			local g = Instance.new("ScreenGui"); syn.protect_gui(g); g.Parent = Utils.GetService("CoreGui"); return g
		end
		return Utils.GetService("CoreGui")
	end)
	if ok and result then return result end
	local p = Utils.GetService("Players").LocalPlayer
	if p then return p:WaitForChild("PlayerGui") end
	return Utils.GetService("CoreGui")
end

function Utils.IsMobile()
	local cam = workspace.CurrentCamera
	local size = cam and cam.ViewportSize or Vector2.new(1920,1080)
	return size.X < 900
end

return Utils
end)()
__modules.sidebar=(function()
local Theme=__modules.theme
local Utils=__modules.utils
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
end)()
__modules.topbar=(function()
local Theme=__modules.theme
local Utils=__modules.utils
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
end)()
__modules.dashboard=(function()
local Theme=__modules.theme
local Utils=__modules.utils
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
end)()
return (function()
local Theme = __modules.theme
local Utils = __modules.utils
local Sidebar = __modules.sidebar
local Topbar = __modules.topbar
local Dashboard = __modules.dashboard

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
end)()
