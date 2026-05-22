local a=require(script.core.theme)
local b=require(script.core.utils)
local c=require(script.components.sidebar)
local d=require(script.components.topbar)
local e=require(script.components.dashboard)

local f={}

function f.CreateWindow(g,h:string)
local i=game:GetService"Players".LocalPlayer:WaitForChild"PlayerGui"
local j=i:FindFirstChild"WorstUiLibrary"
if j then
j:Destroy()
end

local k=b.Create("ScreenGui",{Name="WorstUiLibrary",ResetOnSpawn=false,IgnoreGuiInset=true,Parent=i})

local l=b.Create("Frame",{
Name="Main",
BackgroundColor3=a.Colors.Background,
BorderSizePixel=0,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),
Size=UDim2.fromOffset(1540,930),
Parent=k,
})
b.ApplyCorner(l,a.Corner.Large)
b.ApplyStroke(l,a.Colors.Stroke,0.2)

d.Create(l,h or"TitanUI Library")

local m=b.Create("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,-20,1,-115),
Position=UDim2.new(0,10,0,105),
Parent=l,
})

c.Create(m)
e.Create(m)

return k
end

return f