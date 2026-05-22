local a={}a.theme=(function()local b={}b.Colors={Background=Color3.fromRGB(6,10,
18),Panel=Color3.fromRGB(10,14,24),PanelSecondary=Color3.fromRGB(13,18,30),
TextPrimary=Color3.fromRGB(244,247,255),TextSecondary=Color3.fromRGB(151,160,178
),Accent=Color3.fromRGB(255,33,43),Stroke=Color3.fromRGB(35,43,60)}b.Corner={
Small=UDim.new(0,8),Medium=UDim.new(0,12),Large=UDim.new(0,16)}b.Scale={Desktop=
{Width=1080,Height=660,Sidebar=220,Topbar=62,Title=28,Body=20},Mobile={Width=360
,Height=520,Sidebar=0,Topbar=56,Title=24,Body=16}}return b end)()a.utils=(
function()local b={}function b.Create(c,d)local e=Instance.new(c)if d then for f
,g in pairs(d)do pcall(function()e[f]=g end)end end return e end function b.
ApplyCorner(c,d)local e=Instance.new'UICorner'e.CornerRadius=d e.Parent=c return
e end function b.ApplyStroke(c,d,e)local f=Instance.new'UIStroke'f.Color=d f.
Transparency=e or 0.4 f.Thickness=1 f.Parent=c return f end function b.
GetService(c)if cloneref then local d,e=pcall(function()return cloneref(game:
GetService(c))end)if d and e then return e end end return game:GetService(c)end
function b.GetGuiParent()local c,d=pcall(function()if gethui then return gethui(
)end if syn and syn.protect_gui then local c=Instance.new'ScreenGui'syn.
protect_gui(c)c.Parent=b.GetService'CoreGui'return c end return b.GetService
'CoreGui'end)if c and d then return d end local e=b.GetService'Players'.
LocalPlayer if e then return e:WaitForChild'PlayerGui'end return b.GetService
'CoreGui'end function b.IsMobile()local c=workspace.CurrentCamera local d=c and
c.ViewportSize or Vector2.new(1920,1080)return d.X<900 end return b end)()a.
sidebar=(function()local b=a.theme local c=a.utils local d={}local e={
'Dashboard','Player','Visuals','World','Combat','Misc','Settings'}function d.
Create(f,g,h)local i=c.Create('Frame',{Name='Sidebar',BackgroundColor3=b.Colors.
Panel,BorderSizePixel=0,Size=UDim2.new(0,g.Sidebar,1,-10),Position=UDim2.
fromOffset(0,10),Parent=f})c.ApplyCorner(i,b.Corner.Medium)c.ApplyStroke(i,b.
Colors.Stroke,0.5)for j,k in ipairs(e)do local l=c.Create('TextButton',{Name=k,
AutoButtonColor=false,BackgroundColor3=j==1 and b.Colors.Accent or b.Colors.
Panel,BackgroundTransparency=j==1 and 0 or 1,TextColor3=b.Colors.TextPrimary,
TextXAlignment=Enum.TextXAlignment.Left,TextSize=g.Body,Font=Enum.Font.Gotham,
Size=UDim2.new(1,-14,0,40),Position=UDim2.new(0,7,0,20+((j-1)*46)),Text='  '..k,
Parent=i})c.ApplyCorner(l,b.Corner.Medium)l.MouseButton1Click:Connect(function()
if h then h(k)end end)end return i end return d end)()a.topbar=(function()local
b=a.theme local c=a.utils local d={}function d.Create(e,f,g)local h=c.Create(
'Frame',{Name='Topbar',BackgroundTransparency=1,Size=UDim2.new(1,-20,0,g.Topbar)
,Position=UDim2.fromOffset(10,8),Parent=e})c.Create('TextLabel',{
BackgroundTransparency=1,Text=f,TextColor3=b.Colors.TextPrimary,TextXAlignment=
Enum.TextXAlignment.Left,Font=Enum.Font.GothamBold,TextSize=g.Title,Size=UDim2.
new(0.4,0,1,0),Parent=h})local i=g==b.Scale.Mobile and 130 or 280 local j=c.
Create('TextBox',{Name='SearchBox',BackgroundColor3=b.Colors.PanelSecondary,
BorderSizePixel=0,Text='',PlaceholderText='Search...',PlaceholderColor3=b.Colors
.TextSecondary,TextColor3=b.Colors.TextPrimary,ClearTextOnFocus=false,TextSize=g
.Body,Font=Enum.Font.Gotham,Size=UDim2.new(0,i,0,g.Topbar-10),Position=UDim2.
new(0.5,-i/2,0,4),Parent=h})c.ApplyCorner(j,b.Corner.Medium)c.ApplyStroke(j,b.
Colors.Stroke,0.4)return h end return d end)()a.dashboard=(function()local b=a.
theme local c=a.utils local d={}local function createCard(e,f,g,h,i)local j=c.
Create('Frame',{BackgroundColor3=b.Colors.PanelSecondary,BorderSizePixel=0,Size=
UDim2.new(h,-8,0,88),Position=UDim2.new(0,0,0,i),Parent=e})c.ApplyCorner(j,b.
Corner.Medium)c.ApplyStroke(j,b.Colors.Stroke,0.5)c.Create('TextLabel',{
BackgroundTransparency=1,Text=f,TextColor3=b.Colors.TextSecondary,TextSize=14,
Font=Enum.Font.Gotham,Size=UDim2.new(1,-12,0,24),Position=UDim2.fromOffset(8,6),
TextXAlignment=Enum.TextXAlignment.Left,Parent=j})c.Create('TextLabel',{
BackgroundTransparency=1,Text=g,TextColor3=b.Colors.TextPrimary,TextSize=28,Font
=Enum.Font.GothamBold,Size=UDim2.new(1,-12,0,42),Position=UDim2.fromOffset(8,30)
,TextXAlignment=Enum.TextXAlignment.Left,Parent=j})return j end function d.
Create(e,f)local g=c.Create('Frame',{Name='Content',BackgroundTransparency=1,
Size=UDim2.new(1,0,1,-8),Position=UDim2.fromOffset(0,8),Parent=e})c.Create(
'TextLabel',{BackgroundTransparency=1,Text='Dashboard',TextColor3=b.Colors.
TextPrimary,TextSize=f and 26 or 32,Font=Enum.Font.GothamBold,Size=UDim2.new(1,0
,0,36),TextXAlignment=Enum.TextXAlignment.Left,Parent=g})local h=c.Create(
'Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,f and 196 or 96),Position
=UDim2.fromOffset(0,44),Parent=g})if f then createCard(h,'Players','12/16',1,0)
createCard(h,'Ping','42ms',1,96)else local i=createCard(h,'Players','12/16',0.25
,0)i.Position=UDim2.new(0,0,0,0)local j=createCard(h,'Ping','42ms',0.25,0)j.
Position=UDim2.new(0.25,4,0,0)local k=createCard(h,'FPS','144',0.25,0)k.Position
=UDim2.new(0.5,8,0,0)local l=createCard(h,'Region','SG',0.25,0)l.Position=UDim2.
new(0.75,12,0,0)end local i=c.Create('Frame',{BackgroundColor3=b.Colors.
PanelSecondary,BorderSizePixel=0,Size=UDim2.new(1,0,0,f and 180 or 220),Position
=UDim2.new(0,0,0,f and 248 or 154),Parent=g})c.ApplyCorner(i,b.Corner.Medium)c.
ApplyStroke(i,b.Colors.Stroke,0.5)c.Create('TextLabel',{BackgroundTransparency=1
,Text='Quick Toggles',TextColor3=b.Colors.TextPrimary,TextSize=20,Font=Enum.Font
.GothamBold,Size=UDim2.new(1,-16,0,28),Position=UDim2.fromOffset(8,8),
TextXAlignment=Enum.TextXAlignment.Left,Parent=i})local j={'Noclip',
'Infinite Jump','ESP','Speed Boost'}for k,l in ipairs(j)do c.Create('TextButton'
,{BackgroundColor3=k<=2 and b.Colors.Accent or Color3.fromRGB(55,60,72),
BorderSizePixel=0,Text=l,TextColor3=b.Colors.TextPrimary,Font=Enum.Font.Gotham,
TextSize=14,Size=UDim2.new(1,-16,0,30),Position=UDim2.fromOffset(8,38+(k-1)*34),
Parent=i})end return g end return d end)()return(function()local b=a.theme local
c=a.utils local d=a.sidebar local e=a.topbar local f=a.dashboard local g={}
function g.CreateWindow(h,i)local j=c.IsMobile()local k=j and b.Scale.Mobile or
b.Scale.Desktop local l=c.GetGuiParent()local m=l:FindFirstChild'WorstUiLibrary'
if m then m:Destroy()end local n=c.Create('ScreenGui',{Name='WorstUiLibrary',
ResetOnSpawn=false,IgnoreGuiInset=true,Parent=l})local o=c.Create('Frame',{Name=
'Main',BackgroundColor3=b.Colors.Background,BorderSizePixel=0,AnchorPoint=
Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(k.
Width,k.Height),Parent=n})c.ApplyCorner(o,b.Corner.Large)c.ApplyStroke(o,b.
Colors.Stroke,0.2)e.Create(o,i or'TitanUI Library',k)local p=c.Create('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,-20,1,-k.Topbar-16),Position=UDim2.
fromOffset(10,k.Topbar+12),Parent=o})local q=c.Create('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,-(j and 0 or k.Sidebar+12),1,0),
Position=UDim2.fromOffset(j and 0 or k.Sidebar+12,0),Parent=p})f.Create(q,j)if
not j then d.Create(p,k)end if j then local r=c.Create('Frame',{BackgroundColor3
=b.Colors.Panel,BorderSizePixel=0,Size=UDim2.new(1,0,0,42),Position=UDim2.new(0,
0,1,-42),Parent=o})c.ApplyStroke(r,b.Colors.Stroke,0.5)for s,t in ipairs{'Home',
'Player','Visual','Settings'}do c.Create('TextButton',{BackgroundTransparency=1,
Text=t,TextColor3=s==1 and b.Colors.Accent or b.Colors.TextPrimary,Font=Enum.
Font.GothamBold,TextSize=14,Size=UDim2.new(0.25,0,1,0),Position=UDim2.new((s-1)*
0.25,0,0,0),Parent=r})end end return n end function g.Notify(h,i)print(
'[TitanUI Notify]',i)end return g end)()