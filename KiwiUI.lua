local Kiwi = {}

function Kiwi.Window(title)
local KiwiLibrary = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local SectionFrame = Instance.new("Frame")
local PageFrame = Instance.new("ScrollingFrame")
local PageFrameMain = Instance.new("Frame")
local MainFrameCorner = Instance.new("UICorner")
local TopBarCorner = Instance.new("UICorner")
local KiwiPageCorner = Instance.new("UICorner")
local SectionCorner = Instance.new("UICorner")
local PageStroke = Instance.new("UIStroke")
local SectionStroke = Instance.new("UIStroke")
local UIListLayout = Instance.new("UIListLayout")
local PageFolder = Instance.new("Folder")
local KiwiClose = Instance.new("TextButton")
local KiwiMinimize = Instance.new("TextButton")
local CloseIcon = Instance.new("ImageLabel")
local MinimizeIcon = Instance.new("ImageLabel")
local WindowTitle = Instance.new("TextLabel")

--[Locals]--
local UserInputService = game:GetService("UserInputService")
local Camera = workspace:WaitForChild("Camera")
local minimized = false

--[Drag Script]--
local DragMousePosition
local FramePosition
local Draggable = false
TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
	Draggable = true
	DragMousePosition = Vector2.new(input.Position.X, input.Position.Y)
	FramePosition = Vector2.new(MainFrame.Position.X.Scale, MainFrame.Position.Y.Scale)
	end
	end)
UserInputService.InputChanged:Connect(function(input)
	if Draggable == true then
	local NewPosition = FramePosition + ((Vector2.new(input.Position.X, input.Position.Y) - DragMousePosition) / Camera.ViewportSize)
	MainFrame.Position = UDim2.new(NewPosition.X, 0, NewPosition.Y, 0)
	end
	end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
	Draggable = false
	end
	end)

PageFolder.Name = "TabFolder"
PageFolder.Parent = SectionFrame

title = title or "Kiwi Library"

KiwiLibrary.Name = title or "KiwiLibrary"
KiwiLibrary.Parent = game.CoreGui
KiwiLibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = title or "KiwiFrame"
MainFrame.Parent = KiwiLibrary
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.048, 0,0.075, 0)
MainFrame.Size = UDim2.new(0, 420, 0, 280)

MainFrameCorner.Name = "Corner"
MainFrameCorner.Parent = MainFrame
MainFrameCorner.CornerRadius = UDim.new(0, 5)

TopBar.Name = "KiwiTopbar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.Size = UDim2.new(0, 420, 0, 30)

TopBarCorner.Name = "Corner"
TopBarCorner.Parent = TopBar
TopBarCorner.CornerRadius = UDim.new(0, 5)

WindowTitle.Name = title
WindowTitle.Parent = TopBar
WindowTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WindowTitle.BackgroundTransparency = 1
WindowTitle.Position = UDim2.new(0, 10, 0, 7)
WindowTitle.TextXAlignment = Enum.TextXAlignment.Left
WindowTitle.Size = UDim2.new(0, 15, 0, 15)
WindowTitle.TextColor3 = Color3.fromRGB(90, 90, 90)
WindowTitle.Font = Enum.Font.GothamBold
WindowTitle.Text = title
WindowTitle.ZIndex = 2
WindowTitle.TextSize = 15.000

SectionFrame.Name = "KiwiSectionFrame"
SectionFrame.Parent = MainFrame
SectionFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SectionFrame.Visible = true
SectionFrame.Position = UDim2.new(0, 10, 0, 40)
SectionFrame.Size = UDim2.new(0, 290, 0, 230)

SectionCorner.Name = "Corner"
SectionCorner.Parent = SectionFrame
SectionCorner.CornerRadius = UDim.new(0, 5)

KiwiClose.Name = "KiwiClose"
KiwiClose.Parent = TopBar
KiwiClose.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
KiwiClose.BackgroundTransparency = 1.000
KiwiClose.Position = UDim2.new(0, 395, 0, 5)
KiwiClose.Size = UDim2.new(0, 15,0, 15)
KiwiClose.Text = ""
KiwiClose.TextColor3 = Color3.fromRGB(190, 190, 190)
KiwiClose.Visible = true
KiwiClose.AutoButtonColor = false
KiwiClose.MouseButton1Click:Connect(function()
	KiwiLibrary:Destroy()
	end)

CloseIcon.Name = "CloseIcon"
CloseIcon.Parent = KiwiClose
CloseIcon.Position = UDim2.new(0.2, 0, 0.128935531, 0)
CloseIcon.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
CloseIcon.BackgroundTransparency = 1.000
CloseIcon.Size = UDim2.new(0, 15, 0, 15)
CloseIcon.Image = "http://www.roblox.com/asset/?id=5969992570"
CloseIcon.ImageColor3 = Color3.fromRGB(190, 190, 190)
CloseIcon.Visible = true

KiwiMinimize.Name = "KiwiMinimize"
KiwiMinimize.Parent = TopBar
KiwiMinimize.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
KiwiMinimize.BackgroundTransparency = 1.000
KiwiMinimize.Position = UDim2.new(0, 370, 0, 6)
KiwiMinimize.Size = UDim2.new(0, 15,0, 15)
KiwiMinimize.Text = ""
KiwiMinimize.TextColor3 = Color3.fromRGB(190, 190, 190)
KiwiMinimize.Visible = true
KiwiMinimize.AutoButtonColor = false
KiwiMinimize.MouseButton1Click:Connect(function()
	if minimized == false then
	MainFrame:TweenSize(
		UDim2.new(0, 420, 0, 30),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quint,
		.5,
		true
	)
	SectionFrame.Visible = false
	PageFrame.Visible = false
	PageFrameMain.Visible = false
	minimized = true
	else
		MainFrame:TweenSize(
		UDim2.new(0, 420, 0, 280),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quart,
		.5,
		true
	)
	wait(.192928292)
	SectionFrame.Visible = true
	PageFrameMain.Visible = true
	PageFrame.Visible = true
	minimized = false
	end
	end)

MinimizeIcon.Name = "CloseIcon"
MinimizeIcon.Parent = KiwiMinimize
MinimizeIcon.Position = UDim2.new(0.2, 0, 0.128935531, 0)
MinimizeIcon.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MinimizeIcon.BackgroundTransparency = 1.000
MinimizeIcon.Size = UDim2.new(0, 15, 0, 15)
MinimizeIcon.Image = "http://www.roblox.com/asset/?id=6035067836"
MinimizeIcon.ImageColor3 = Color3.fromRGB(190, 190, 190)
MinimizeIcon.Visible = true

PageFrameMain.Name = "MainPage"
PageFrameMain.Parent = MainFrame
PageFrameMain.Size = UDim2.new(0, 110, 0, 230)
PageFrameMain.Position = UDim2.new(0, 305, 0, 40)
PageFrameMain.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

PageFrame.Name = "KiwiPages"
PageFrame.Active = true
PageFrame.Parent = PageFrameMain
PageFrame.BorderSizePixel = 0
PageFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
PageFrame.BackgroundTransparency = 1.000
PageFrame.Position = UDim2.new(0, 0, 0, 10)
PageFrame.Size = UDim2.new(1, 0, 1, 0)
PageFrame.ZIndex = 2
PageFrame.ScrollingDirection = Enum.ScrollingDirection.Y
PageFrame.ScrollBarThickness = 0

KiwiPageCorner.Name = "Corner"
KiwiPageCorner.Parent = PageFrameMain
KiwiPageCorner.CornerRadius = UDim.new(0, 5)

UIListLayout.Parent = PageFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

local TabHandler = {}

function TabHandler:Tab(TabText)
local tabBtnFrame = Instance.new("Frame")
local tabBtn = Instance.new("TextButton")

TabText = TabText or "Kiwi Tab"

tabBtnFrame.Name = "TabBtnFrame"
tabBtnFrame.Parent = PageFrame
tabBtnFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tabBtnFrame.BackgroundTransparency = 1.000
tabBtnFrame.Size = UDim2.new(0, 110, 0, 20)
tabBtnFrame.ZIndex = 2

tabBtn.Name = "TabButton"
tabBtn.Parent = tabBtnFrame
tabBtn.BackgroundColor3 = Color3.fromRGB(166, 248, 255)
tabBtn.BackgroundTransparency = 1.000
tabBtn.Position = UDim2.new(0.245534033, 0, 0, 0)
tabBtn.Size = UDim2.new(0, 101, 0, 20)
tabBtn.ZIndex = 2
tabBtn.Font = Enum.Font.GothamSemibold
tabBtn.Text = TabText
tabBtn.TextColor3 = Color3.fromRGB(56, 56, 56)
tabBtn.TextSize = 12.000
tabBtn.TextXAlignment = Enum.TextXAlignment.Left

local NewPage = Instance.new("ScrollingFrame")
local PageList = Instance.new("UIListLayout")

NewPage.Name = TabText
NewPage.Parent = PageFolder
NewPage.Active = true
NewPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NewPage.Position = UDim2.new(0, 0, 0, 10)
NewPage.BackgroundTransparency = 1.000
NewPage.BorderSizePixel = 0
NewPage.Size = UDim2.new(1, 0, 1, 0)
NewPage.ZIndex = 2
NewPage.ScrollBarThickness = 0
NewPage.Visible = false
NewPage.ScrollingDirection = Enum.ScrollingDirection.Y

PageList.Name = "KiwiList"
PageList.Parent = NewPage
PageList.SortOrder = Enum.SortOrder.LayoutOrder
PageList.Padding = UDim.new(0, 3)

local function UpdateSize()
local cS = PageList.AbsoluteContentSize

game.TweenService:Create(NewPage, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
	CanvasSize = UDim2.new(0,cS.X,0,cS.Y)
}):Play()
end
UpdateSize()
NewPage.ChildAdded:Connect(UpdateSize)
NewPage.ChildRemoved:Connect(UpdateSize)

tabBtn.MouseButton1Click:Connect(function()
	UpdateSize()
	for i,v in next, PageFolder:GetChildren() do
	UpdateSize()
	v.Visible = false
	end
	NewPage.Visible = true
	for i,v in next, PageFrame:GetChildren() do
	if v:IsA("Frame") then
	for i,v in next, v:GetChildren() do
	if v:IsA("TextButton") then
	game.TweenService:Create(v, TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
		TextColor3 = Color3.fromRGB(56, 56, 56)
	}):Play()
	end
	end
	end
	end
	game.TweenService:Create(tabBtn, TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
		TextColor3 = Color3.fromRGB(255, 255, 255)
	}):Play()
	end)

local SectionHandler = {}

function SectionHandler:Section(SectionName)

local TabFrame = Instance.new("ScrollingFrame")
local MainCorner = Instance.new("UICorner")

local sectionInnerList = Instance.new("UIListLayout")

sectionInnerList.Name = "sectionInnerList"
sectionInnerList.Parent = TabFrame
sectionInnerList.HorizontalAlignment = Enum.HorizontalAlignment.Center
sectionInnerList.SortOrder = Enum.SortOrder.LayoutOrder
sectionInnerList.Padding = UDim.new(0, 3)

SectionName = SectionName or "Kiwi Section"

TabFrame.Name = TabText.." Tab"
TabFrame.Parent = NewPage
TabFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TabFrame.BackgroundTransparency = 1.000
TabFrame.BorderSizePixel = 0
TabFrame.Position = UDim2.new(0, 0, 7.08064434e-08, 0)
TabFrame.Size = UDim2.new(1, 0, 1, 0)
TabFrame.ZIndex = 2
TabFrame.ClipsDescendants = true
TabFrame.ScrollingDirection = Enum.ScrollingDirection.Y
TabFrame.ScrollBarThickness = 0

MainCorner.CornerRadius = UDim.new(0, 5)
MainCorner.Name = "MainCorner"
MainCorner.Parent = TabFrame

local ItemHandler = {}

function ItemHandler:Button(ButtonText, callback)
local Button = Instance.new("TextButton")
local ButtonCorner = Instance.new("UICorner")
local UIItemList = Instance.new("UIListLayout")
local ButtonInfo = Instance.new("TextLabel")
local ButtonImage = Instance.new("ImageLabel")
local Debounce = false
local debounce1 = false
local isHovering = false

ButtonText = ButtonText or "KiwiButton"
callback = callback or function() end

Button.Name = ButtonText
Button.Parent = TabFrame
Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button.Size = UDim2.new(0, 280, 0, 30)
Button.AutoButtonColor = false
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.ZIndex = 2
Button.Text = ""
Button.Font = Enum.Font.GothamBold
Button.TextSize = 10
Button.MouseButton1Click:Connect(function()
	if not Debounce then
	Debounce = true
	callback()
	wait(1)
	Debounce = false
	end
	end)
Button.MouseButton1Up:Connect(function()
	Button:TweenSize(UDim2.new(0, 280,0, 30), "InOut", "Quint", 0.18, true)
	game.TweenService:Create(Button, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		TextColor3 = Color3.fromRGB(255, 255, 255)
	}):Play()
	end)

Button.MouseButton1Down:Connect(function()
	if not debounce1 then
	debounce1 = true
	Button:TweenSize(UDim2.new(0, 269,0, 30), "InOut", "Quint", 0.18, true)
	game.TweenService:Create(Button, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		TextColor3 = Color3.fromRGB(190, 190, 190)
	}):Play()
	wait(.7)
	debounce1 = false
	end
	end)

ButtonInfo.Name = ButtonText
ButtonInfo.Parent = Button
ButtonInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonInfo.BackgroundTransparency = 1
ButtonInfo.BorderSizePixel = 0
ButtonInfo.Text = ButtonText
ButtonInfo.TextColor3 = Color3.fromRGB(255,255, 255)
ButtonInfo.Font = Enum.Font.GothamBold
ButtonInfo.Position = UDim2.new(0, 10, 0, 2)
ButtonInfo.TextXAlignment = Enum.TextXAlignment.Left
ButtonInfo.TextSize = 10
ButtonInfo.Size = UDim2.new(0, 250, 0, 28)

ButtonImage.Name = "ClickImage"
ButtonImage.Parent = Button
ButtonImage.Size = UDim2.new(0, 20, 0, 20)
ButtonImage.Position = UDim2.new(0, 250, 0, 5)
ButtonImage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ButtonImage.BackgroundTransparency = 1
ButtonImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
ButtonImage.Image = "rbxassetid://7839505809"
ButtonImage.Visible = true

ButtonCorner.Name = "Corner"
ButtonCorner.Parent = Button
ButtonCorner.CornerRadius = UDim.new(0, 3)

end

function ItemHandler:Toggle(ToggleText, callback)
local switchactions = {}
local ToggleButton = Instance.new("TextButton")
local ToggleCorner = Instance.new("UICorner")
local Switch1 = Instance.new("ImageLabel")
local Switch2 = Instance.new("ImageLabel")

local ToggleInfo = Instance.new("TextLabel")
local debounce = false
ToggleText = ToggleText or "KiwiToggle"
callback = callback or function() end

ToggleButton.Name = ToggleText
ToggleButton.Parent = TabFrame
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleButton.Size = UDim2.new(0, 280, 0, 30)
ToggleButton.AutoButtonColor = false
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.ZIndex = 2
ToggleButton.Text = ""
ToggleButton.Font = Enum.Font.GothamBold

Switch1.Name = "Frame"
Switch1.Parent = ToggleButton
Switch1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Switch1.BackgroundTransparency = 1.000
Switch1.Position = UDim2.new(0, 245, 0, 8)
Switch1.Size = UDim2.new(0, 27, 0, 13)
Switch1.Image = "rbxassetid://3570695787"
Switch1.ImageColor3 = Color3.fromRGB(26,26,26)
Switch1.ScaleType = Enum.ScaleType.Slice
Switch1.SliceCenter = Rect.new(100, 100, 100, 100)
Switch1.SliceScale = 0.250

Switch2.Name = "Frame_2"
Switch2.Parent = Switch1
Switch2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Switch2.BackgroundTransparency = 1.000
Switch2.Position = UDim2.new(0, 3, 0.150000006, 0)
Switch2.Size = UDim2.new(0, 9, 0, 9)
Switch2.Image = "rbxassetid://3570695787"
Switch2.ScaleType = Enum.ScaleType.Slice
Switch2.SliceCenter = Rect.new(100, 100, 100, 100)
Switch2.SliceScale = 0.250

ToggleCorner.Name = "Corner"
ToggleCorner.Parent = ToggleButton
ToggleCorner.CornerRadius = UDim.new(0, 3)

ToggleInfo.Name = ToggleText
ToggleInfo.Parent = ToggleButton
ToggleInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleInfo.BackgroundTransparency = 1
ToggleInfo.BorderSizePixel = 0
ToggleInfo.Text = ToggleText
ToggleInfo.TextColor3 = Color3.fromRGB(255,255, 255)
ToggleInfo.Font = Enum.Font.GothamBold
ToggleInfo.Position = UDim2.new(0, 10, 0, 2)
ToggleInfo.TextXAlignment = Enum.TextXAlignment.Left
ToggleInfo.TextSize = 10
ToggleInfo.Size = UDim2.new(0, 250, 0, 28)

local togstate = false
local toolight = true

function trigger()
togstate = not togstate
callback(togstate)
if togstate then
Switch1.ImageColor3 = Color3.fromRGB(255, 255, 255)
if toolight then
Switch2.ImageColor3 = Color3.fromRGB(26,26,26)
end
Switch2.Position = UDim2.new(0.59, 0, 0.150000006, 0)
else
	Switch1.ImageColor3 = Color3.fromRGB(26,26,26)
if toolight then
Switch2.ImageColor3 = Color3.fromRGB(255, 255, 255)
end
Switch2.Position = UDim2.new(0, 3, 0.150000006, 0)
end
end

ToggleButton.MouseButton1Click:Connect(trigger)

function switchactions:Set(state)
togstate = state
if togstate then
Switch1.ImageColor3 = Color3.fromRGB(176, 148, 255)
if toolight then
Switch2.ImageColor3 = Color3.fromRGB(26,26,26)
end
Switch2.Position = UDim2.new(0.59, 0, 0.150000006, 0)
else
	Switch1.ImageColor3 = Color3.fromRGB(26,26,26)
if toolight then
Switch2.ImageColor3 = Color3.fromRGB(176, 148, 255)
end
Switch2.Position = UDim2.new(0, 3, 0.150000006, 0)
end
callback(togstate)
end
return switchactions

end

function ItemHandler:Dropdown(DropdownText)


end

return ItemHandler
end
return SectionHandler
end
return TabHandler
end
return Kiwi