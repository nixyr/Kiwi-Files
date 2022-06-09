local Kiwi = {}

function Kiwi.Window(title)
  local KiwiLibrary = Instance.new("ScreenGui")
  local MainFrame = Instance.new("Frame")
  local TopBar = Instance.new("Frame")
  local SectionFrame = Instance.new("Frame")
  local PageFrame = Instance.new("ScrollingFrame")
  local MainFrameCorner = Instance.new("UICorner")
  local TopBarCorner = Instance.new("UICorner")
  local KiwiPageCorner = Instance.new("UICorner")
  local SectionCorner = Instance.new("UICorner")
  local UIListLayout = Instance.new("UIListLayout")
  local PageFolder = Instance.new("Folder")
  local KiwiClose = Instance.new("TextButton")
  local KiwiMinimize = Instance.new("TextButton")
  local CloseIcon = Instance.new("ImageLabel")
  local MinimizeIcon = Instance.new("ImageLabel")
  
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
  PageFolder.Parent = PageFrame

  title = title or "Kiwi Library"
  
  KiwiLibrary.Name = title or "KiwiLibrary"
  KiwiLibrary.Parent = game.CoreGui
  KiwiLibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

  MainFrame.Name = title.."Frame" or "KiwiFrame"
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
        MainFrame:TweenSize(
        UDim2.new(0, 0, 0, 0),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quart,
        .5,
        true
      )
      wait(.6)
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
        Enum.EasingStyle.Quart,
        .5,
        true
      )
      SectionFrame:TweenSize(
        UDim2.new(0, 420, 0, 0),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quart,
        .5,
        true
      )
      PageFrame:TweenSize(
        UDim2.new(0, 420, 0, 0),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quart,
        .5,
        true
      )
      minimized = true
   else
     MainFrame:TweenSize(
        UDim2.new(0, 420, 0, 280),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quart,
        .5,
        true
      )
      SectionFrame.Visible = true
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
  
  PageFrame.Name = "KiwiPages"
  PageFrame.Parent = MainFrame
  PageFrame.BorderSizePixel = 0
  PageFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
  PageFrame.Position = UDim2.new(0, 305, 0, 40)
  PageFrame.Size = UDim2.new(0, 110, 0, 230)
  PageFrame.ZIndex = 2
  PageFrame.ScrollingDirection = Enum.ScrollingDirection.Y
  PageFrame.ScrollBarThickness = 0
  
  KiwiPageCorner.Name = "Corner"
  KiwiPageCorner.Parent = PageFrame
  KiwiPageCorner.CornerRadius = UDim.new(0, 5)
  
  UIListLayout.Parent = PageFrame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)
  
  local TabHandler = {}
  
function TabHandler:NewTab(TabText)
  local tabBtnFrame = Instance.new("Frame")
  local tabBtn = Instance.new("TextButton")
  
  TabText = TabText or "Kiwi Tab"
  
  tabBtnFrame.Name = "ButtonFrame"
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
	tabBtn.Font = Enum.Font.GothamBold
	tabBtn.Text = TabText
	tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	tabBtn.TextSize = 10.000
	tabBtn.TextXAlignment = Enum.TextXAlignment.Left
 
	local NewPage = Instance.new("ScrollingFrame")
	local PageList = Instance.new("UIListLayout")
	
	NewPage.Name = TabText
	NewPage.Parent = PageFolder
	NewPage.Active = true
	NewPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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
 
local ItemHandler = {}
  
function ItemHandler:NewButton(btntext, callback)
  local Button = Instance.new("TextButton")
  local ButtonCorner = Instance.new("UICorner")
  local UIItemList = Instance.new("UIListLayout")
  local Debounce = false
  
  btntext = btntext or "KiwiButton"
  callback = callback or function() end
  
  Button.Name = "KiwiButton"..btntext
  Button.Parent = NewPage
  Button.BackgroundColor3 = Color3.fromRGB(120, 90., 60)
  Button.Size = UDim2.new(0, 380, 0, 30)
  Button.AutoButtonColor = false
  Button.TextColor3 = Color3.fromRGB(255, 255, 255)
  Button.ZIndex = 2
  Button.Text = btntext
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
  
  
  
end
return ItemHandler
end
return TabHandler
end
return Kiwi