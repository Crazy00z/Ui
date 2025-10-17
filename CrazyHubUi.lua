-- CrazyHub Library
-- Made by Crazy00z
-- Version 1.0.0

local CrazyHub = {}
CrazyHub.__index = CrazyHub

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- Theme
local theme = {
    primary = Color3.fromRGB(147, 51, 234),
    secondary = Color3.fromRGB(126, 34, 206),
    background = Color3.fromRGB(10, 10, 15),
    surface = Color3.fromRGB(20, 20, 30),
    surfaceLight = Color3.fromRGB(30, 30, 45),
    accent = Color3.fromRGB(168, 85, 247),
    text = Color3.fromRGB(255, 255, 255),
    textSecondary = Color3.fromRGB(160, 160, 180),
    success = Color3.fromRGB(34, 197, 94),
    error = Color3.fromRGB(239, 68, 68),
}

-- Utility Functions
local function tween(object, properties, duration, style, direction)
    local tweenInfo = TweenInfo.new(
        duration or 0.3,
        style or Enum.EasingStyle.Quart,
        direction or Enum.EasingDirection.Out
    )
    local tween = TweenService:Create(object, tweenInfo, properties)
    tween:Play()
    return tween
end

-- Window Constructor
function CrazyHub:Window(settings)
    local window = {}
    window.Settings = settings or {}
    
    -- Default settings
    window.Settings.Title = window.Settings.Title or "Crazy Hub"
    window.Settings.Subtitle = window.Settings.Subtitle or "Made by Crazy"
    window.Settings.Size = window.Settings.Size or UDim2.new(0, 1000, 0, 680)
    window.Settings.Keybind = window.Settings.Keybind or Enum.KeyCode.LeftAlt
    
    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CrazyHub"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.IgnoreGuiInset = true
    screenGui.DisplayOrder = 999999
    screenGui.Parent = LocalPlayer.PlayerGui
    
    window.ScreenGui = screenGui
    
    -- Create Background
    local backgroundFrame = Instance.new("Frame")
    backgroundFrame.Size = UDim2.new(1, 0, 1, 0)
    backgroundFrame.BackgroundColor3 = theme.background
    backgroundFrame.BorderSizePixel = 0
    backgroundFrame.ZIndex = 0
    backgroundFrame.Parent = screenGui
    
    window.BackgroundFrame = backgroundFrame
    
    -- Dropdown overlay
    local dropdownOverlay = Instance.new("Frame")
    dropdownOverlay.Name = "DropdownOverlay"
    dropdownOverlay.Size = UDim2.new(1, 0, 1, 0)
    dropdownOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    dropdownOverlay.BackgroundTransparency = 0.5
    dropdownOverlay.Visible = false
    dropdownOverlay.ZIndex = 100
    dropdownOverlay.Parent = screenGui
    
    window.DropdownOverlay = dropdownOverlay
    
    -- Create Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = window.Settings.Size
    mainFrame.Position = UDim2.new(0.5, -window.Settings.Size.X.Offset/2, 0.5, -window.Settings.Size.Y.Offset/2)
    mainFrame.BackgroundColor3 = theme.surface
    mainFrame.BackgroundTransparency = 0.1
    mainFrame.BorderSizePixel = 0
    mainFrame.ZIndex = 1
    
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 20)
    mainCorner.Parent = mainFrame
    
    local mainStroke = Instance.new("UIStroke")
    mainStroke.Color = theme.primary
    mainStroke.Thickness = 1
    mainStroke.Transparency = 0.3
    mainStroke.Parent = mainFrame
    
    mainFrame.Parent = screenGui
    window.MainFrame = mainFrame
    
    -- Create Header
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 80)
    header.BackgroundColor3 = theme.surface
    header.BackgroundTransparency = 0.3
    header.BorderSizePixel = 0
    header.ZIndex = 2
    
    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = UDim.new(0, 20)
    headerCorner.Parent = header
    
    local headerGradient = Instance.new("UIGradient")
    headerGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(147, 51, 234)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(126, 34, 206)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(88, 28, 135))
    }
    headerGradient.Rotation = 45
    headerGradient.Parent = header
    
    header.Parent = mainFrame
    window.Header = header
    
    -- Logo
    local logo = Instance.new("TextLabel")
    logo.Size = UDim2.new(0, 50, 0, 50)
    logo.Position = UDim2.new(0, 15, 0.5, -25)
    logo.BackgroundColor3 = theme.primary
    logo.Text = "💜"
    logo.TextSize = 28
    logo.Font = Enum.Font.GothamBold
    logo.TextColor3 = theme.text
    logo.BorderSizePixel = 0
    logo.ZIndex = 3
    
    local logoCorner = Instance.new("UICorner")
    logoCorner.CornerRadius = UDim.new(0, 12)
    logoCorner.Parent = logo
    
    logo.Parent = header
    
    -- Title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(0, 400, 0, 35)
    title.Position = UDim2.new(0, 75, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = string.upper(window.Settings.Title)
    title.TextColor3 = theme.text
    title.Font = Enum.Font.GothamBold
    title.TextSize = 26
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 3
    title.Parent = header
    
    -- Subtitle
    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(0, 400, 0, 20)
    subtitle.Position = UDim2.new(0, 75, 0, 45)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = window.Settings.Subtitle
    subtitle.TextColor3 = theme.textSecondary
    subtitle.Font = Enum.Font.Gotham
    subtitle.TextSize = 12
    subtitle.TextXAlignment = Enum.TextXAlignment.Left
    subtitle.ZIndex = 3
    subtitle.Parent = header
    
    -- Close Button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 45, 0, 45)
    closeBtn.Position = UDim2.new(1, -60, 0.5, -22.5)
    closeBtn.BackgroundColor3 = theme.error
    closeBtn.BackgroundTransparency = 0.2
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = theme.text
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 22
    closeBtn.BorderSizePixel = 0
    closeBtn.ZIndex = 3
    closeBtn.AutoButtonColor = false
    
    local closeBtnCorner = Instance.new("UICorner")
    closeBtnCorner.CornerRadius = UDim.new(0, 10)
    closeBtnCorner.Parent = closeBtn
    
    closeBtn.Parent = header
    
    closeBtn.MouseButton1Click:Connect(function()
        tween(mainFrame, {Size = UDim2.new(0, 0, 0, 0), Rotation = 180}, 0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        task.wait(0.5)
        screenGui:Destroy()
    end)
    
    -- Make draggable from header only
    local dragging, dragStart, startPos
    
    header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    -- Keybind toggle
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == window.Settings.Keybind then
            mainFrame.Visible = not mainFrame.Visible
            backgroundFrame.Visible = mainFrame.Visible
        end
    end)
    
    -- Content Frame
    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, -20, 1, -90)
    contentFrame.Position = UDim2.new(0, 10, 0, 80)
    contentFrame.BackgroundTransparency = 1
    contentFrame.ZIndex = 2
    contentFrame.Parent = mainFrame
    
    window.ContentFrame = contentFrame
    window.Tabs = {}
    window.CurrentTab = nil
    
    -- Notification Queue
    local notificationQueue = {}
    local isShowingNotification = false
    
    -- Notification function
    function window:Notify(options)
        table.insert(notificationQueue, {
            title = options.Title or "Notification",
            description = options.Description or "",
            lifetime = options.Lifetime or 3
        })
        
        if not isShowingNotification then
            task.spawn(function()
                while #notificationQueue > 0 do
                    isShowingNotification = true
                    local notifData = table.remove(notificationQueue, 1)
                    
                    local notif = Instance.new("Frame")
                    notif.Size = UDim2.new(0, 0, 0, 90)
                    notif.Position = UDim2.new(1, 20, 1, -110)
                    notif.BackgroundColor3 = theme.surface
                    notif.BackgroundTransparency = 0.1
                    notif.BorderSizePixel = 0
                    notif.ZIndex = 200
                    
                    local notifCorner = Instance.new("UICorner")
                    notifCorner.CornerRadius = UDim.new(0, 14)
                    notifCorner.Parent = notif
                    
                    local notifStroke = Instance.new("UIStroke")
                    notifStroke.Color = theme.primary
                    notifStroke.Thickness = 2
                    notifStroke.Transparency = 0.3
                    notifStroke.Parent = notif
                    
                    notif.Parent = screenGui
                    
                    local notifTitle = Instance.new("TextLabel")
                    notifTitle.Size = UDim2.new(1, -20, 0, 28)
                    notifTitle.Position = UDim2.new(0, 12, 0, 12)
                    notifTitle.BackgroundTransparency = 1
                    notifTitle.Text = notifData.title
                    notifTitle.TextColor3 = theme.accent
                    notifTitle.Font = Enum.Font.GothamBold
                    notifTitle.TextSize = 16
                    notifTitle.TextXAlignment = Enum.TextXAlignment.Left
                    notifTitle.ZIndex = 201
                    notifTitle.Parent = notif
                    
                    local notifDesc = Instance.new("TextLabel")
                    notifDesc.Size = UDim2.new(1, -24, 0, 40)
                    notifDesc.Position = UDim2.new(0, 12, 0, 40)
                    notifDesc.BackgroundTransparency = 1
                    notifDesc.Text = notifData.description
                    notifDesc.TextColor3 = theme.text
                    notifDesc.Font = Enum.Font.Gotham
                    notifDesc.TextSize = 13
                    notifDesc.TextXAlignment = Enum.TextXAlignment.Left
                    notifDesc.TextYAlignment = Enum.TextYAlignment.Top
                    notifDesc.TextWrapped = true
                    notifDesc.ZIndex = 201
                    notifDesc.Parent = notif
                    
                    tween(notif, {Size = UDim2.new(0, 350, 0, 90), Position = UDim2.new(1, -370, 1, -110)}, 0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
                    task.wait(notifData.lifetime)
                    tween(notif, {Position = UDim2.new(1, 20, 1, -110)}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
                    task.wait(0.4)
                    notif:Destroy()
                end
                isShowingNotification = false
            end)
        end
    end
    
    -- TabGroup function
    function window:TabGroup()
        local tabGroup = {}
        tabGroup.Tabs = {}
        
        -- Create Sidebar
        local sidebar = Instance.new("Frame")
        sidebar.Size = UDim2.new(0, 240, 1, -10)
        sidebar.Position = UDim2.new(0, 5, 0, 5)
        sidebar.BackgroundColor3 = theme.surface
        sidebar.BackgroundTransparency = 0.3
        sidebar.BorderSizePixel = 0
        sidebar.ZIndex = 3
        
        local sidebarCorner = Instance.new("UICorner")
        sidebarCorner.CornerRadius = UDim.new(0, 16)
        sidebarCorner.Parent = sidebar
        
        local sidebarLayout = Instance.new("UIListLayout")
        sidebarLayout.Padding = UDim.new(0, 10)
        sidebarLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        sidebarLayout.Parent = sidebar
        
        local sidebarPadding = Instance.new("UIPadding")
        sidebarPadding.PaddingTop = UDim.new(0, 15)
        sidebarPadding.PaddingBottom = UDim.new(0, 15)
        sidebarPadding.PaddingLeft = UDim.new(0, 12)
        sidebarPadding.PaddingRight = UDim.new(0, 12)
        sidebarPadding.Parent = sidebar
        
        sidebar.Parent = contentFrame
        tabGroup.Sidebar = sidebar
        
        function tabGroup:Tab(options)
            local tab = {}
            tab.Name = options.Name or "Tab"
            
            -- Create tab button
            local tabBtn = Instance.new("TextButton")
            tabBtn.Name = tab.Name .. "Tab"
            tabBtn.Size = UDim2.new(1, -24, 0, 54)
            tabBtn.BackgroundColor3 = theme.surfaceLight
            tabBtn.BackgroundTransparency = 0.4
            tabBtn.Text = ""
            tabBtn.BorderSizePixel = 0
            tabBtn.ZIndex = 4
            tabBtn.AutoButtonColor = false
            
            local tabCorner = Instance.new("UICorner")
            tabCorner.CornerRadius = UDim.new(0, 12)
            tabCorner.Parent = tabBtn
            
            local tabStroke = Instance.new("UIStroke")
            tabStroke.Color = theme.primary
            tabStroke.Thickness = 0
            tabStroke.Transparency = 0.5
            tabStroke.Parent = tabBtn
            
            local tabLabel = Instance.new("TextLabel")
            tabLabel.Size = UDim2.new(1, -55, 1, 0)
            tabLabel.Position = UDim2.new(0, 47, 0, 0)
            tabLabel.BackgroundTransparency = 1
            tabLabel.Text = tab.Name
            tabLabel.TextColor3 = theme.textSecondary
            tabLabel.Font = Enum.Font.GothamBold
            tabLabel.TextSize = 15
            tabLabel.TextXAlignment = Enum.TextXAlignment.Left
            tabLabel.ZIndex = 5
            tabLabel.Parent = tabBtn
            
            tab.Button = tabBtn
            tab.Label = tabLabel
            tab.Stroke = tabStroke
            
            tabBtn.Parent = sidebar
            
            -- Create content area for this tab
            local contentArea = Instance.new("ScrollingFrame")
            contentArea.Size = UDim2.new(1, -260, 1, -10)
            contentArea.Position = UDim2.new(0, 255, 0, 5)
            contentArea.BackgroundColor3 = theme.surface
            contentArea.BackgroundTransparency = 0.3
            contentArea.ScrollBarThickness = 8
            contentArea.ScrollBarImageColor3 = theme.primary
            contentArea.BorderSizePixel = 0
            contentArea.ZIndex = 3
            contentArea.CanvasSize = UDim2.new(0, 0, 0, 0)
            contentArea.Visible = false
            
            local contentAreaCorner = Instance.new("UICorner")
            contentAreaCorner.CornerRadius = UDim.new(0, 16)
            contentAreaCorner.Parent = contentArea
            
            local contentLayout = Instance.new("UIListLayout")
            contentLayout.Padding = UDim.new(0, 18)
            contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            contentLayout.Parent = contentArea
            
            local contentPadding = Instance.new("UIPadding")
            contentPadding.PaddingTop = UDim.new(0, 25)
            contentPadding.PaddingBottom = UDim.new(0, 25)
            contentPadding.PaddingLeft = UDim.new(0, 25)
            contentPadding.PaddingRight = UDim.new(0, 35)
            contentPadding.Parent = contentArea
            
            contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                contentArea.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 50)
            end)
            
            contentArea.Parent = contentFrame
            tab.ContentArea = contentArea
            
            -- Tab switching
            tabBtn.MouseButton1Click:Connect(function()
                -- Hide all tabs
                for _, t in pairs(tabGroup.Tabs) do
                    t.ContentArea.Visible = false
                    tween(t.Button, {BackgroundTransparency = 0.4}, 0.3)
                    tween(t.Stroke, {Thickness = 0}, 0.3)
                    t.Label.TextColor3 = theme.textSecondary
                end
                
                -- Show this tab
                contentArea.Visible = true
                tween(tabBtn, {BackgroundTransparency = 0}, 0.3)
                tween(tabStroke, {Thickness = 2}, 0.3)
                tabLabel.TextColor3 = theme.text
                window.CurrentTab = tab
            end)
            
       function tab:Select()
    -- Hide all tabs
    for _, t in pairs(tabGroup.Tabs) do
        if t.ContentArea then
            t.ContentArea.Visible = false
        end
        if t.Button then
            tween(t.Button, {BackgroundTransparency = 0.4}, 0.3)
        end
        if t.Stroke then
            tween(t.Stroke, {Thickness = 0}, 0.3)
        end
        if t.Label then
            t.Label.TextColor3 = theme.textSecondary
        end
    end
    
    -- Show this tab
    if contentArea then
        contentArea.Visible = true
    end
    if tabBtn then
        tween(tabBtn, {BackgroundTransparency = 0}, 0.3)
    end
    if tabStroke then
        tween(tabStroke, {Thickness = 2}, 0.3)
    end
    if tabLabel then
        tabLabel.TextColor3 = theme.text
    end
    window.CurrentTab = tab
end
            
            -- Section function
            function tab:Section(options)
                local section = {}
                section.Side = options.Side or "Left"
                section.Elements = {}
                
                -- Header
                function section:Header(options)
                    local sectionFrame = Instance.new("Frame")
                    sectionFrame.Size = UDim2.new(1, -20, 0, 40)
                    sectionFrame.BackgroundTransparency = 1
                    sectionFrame.ZIndex = 4
                    sectionFrame.Parent = contentArea
                    
                    local sectionTitle = Instance.new("TextLabel")
                    sectionTitle.Size = UDim2.new(1, 0, 1, 0)
                    sectionTitle.BackgroundTransparency = 1
                    sectionTitle.Text = string.upper(options.Name or options.Text or "Header")
                    sectionTitle.TextColor3 = theme.primary
                    sectionTitle.Font = Enum.Font.GothamBold
                    sectionTitle.TextSize = 18
                    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
                    sectionTitle.ZIndex = 5
                    sectionTitle.Parent = sectionFrame
                    
                    local line = Instance.new("Frame")
                    line.Size = UDim2.new(1, 0, 0, 3)
                    line.Position = UDim2.new(0, 0, 1, -3)
                    line.BackgroundColor3 = theme.primary
                    line.BorderSizePixel = 0
                    line.ZIndex = 5
                    
                    local lineCorner = Instance.new("UICorner")
                    lineCorner.CornerRadius = UDim.new(1, 0)
                    lineCorner.Parent = line
                    
                    line.Parent = sectionFrame
                    
                    return sectionFrame
                end
                
                -- Label
                function section:Label(options)
                    local label = Instance.new("TextLabel")
                    label.Size = UDim2.new(1, -20, 0, 28)
                    label.BackgroundTransparency = 1
                    label.Text = options.Text or "Label"
                    label.TextColor3 = theme.text
                    label.Font = Enum.Font.GothamSemibold
                    label.TextSize = 14
                    label.TextXAlignment = Enum.TextXAlignment.Left
                    label.TextWrapped = true
                    label.ZIndex = 4
                    label.Parent = contentArea
                    return label
                end
                
                -- SubLabel
                function section:SubLabel(options)
                    local label = Instance.new("TextLabel")
                    label.Size = UDim2.new(1, -20, 0, 28)
                    label.BackgroundTransparency = 1
                    label.Text = options.Text or "SubLabel"
                    label.TextColor3 = theme.textSecondary
                    label.Font = Enum.Font.Gotham
                    label.TextSize = 13
                    label.TextXAlignment = Enum.TextXAlignment.Left
                    label.TextWrapped = true
                    label.ZIndex = 4
                    label.Parent = contentArea
                    return label
                end
                
                -- Paragraph
                function section:Paragraph(options)
                    local container = Instance.new("Frame")
                    container.Size = UDim2.new(1, -20, 0, 70)
                    container.BackgroundTransparency = 1
                    container.ZIndex = 4
                    container.Parent = contentArea
                    
                    local headerLabel = Instance.new("TextLabel")
                    headerLabel.Size = UDim2.new(1, 0, 0, 25)
                    headerLabel.BackgroundTransparency = 1
                    headerLabel.Text = options.Header or "Paragraph"
                    headerLabel.TextColor3 = theme.text
                    headerLabel.Font = Enum.Font.GothamBold
                    headerLabel.TextSize = 15
                    headerLabel.TextXAlignment = Enum.TextXAlignment.Left
                    headerLabel.ZIndex = 5
                    headerLabel.Parent = container
                    
                    local bodyLabel = Instance.new("TextLabel")
                    bodyLabel.Size = UDim2.new(1, 0, 1, -25)
                    bodyLabel.Position = UDim2.new(0, 0, 0, 25)
                    bodyLabel.BackgroundTransparency = 1
                    bodyLabel.Text = options.Body or ""
                    bodyLabel.TextColor3 = theme.textSecondary
                    bodyLabel.Font = Enum.Font.Gotham
                    bodyLabel.TextSize = 13
                    bodyLabel.TextXAlignment = Enum.TextXAlignment.Left
                    bodyLabel.TextYAlignment = Enum.TextYAlignment.Top
                    bodyLabel.TextWrapped = true
                    bodyLabel.ZIndex = 5
                    bodyLabel.Parent = container
                    
                    return container
                end
                
                -- Divider
                function section:Divider()
                    local divider = Instance.new("Frame")
                    divider.Size = UDim2.new(1, -20, 0, 1)
                    divider.BackgroundColor3 = theme.primary
                    divider.BackgroundTransparency = 0.7
                    divider.BorderSizePixel = 0
                    divider.ZIndex = 4
                    divider.Parent = contentArea
                    return divider
                end
                
                -- Button
                function section:Button(options)
                    local container = Instance.new("Frame")
                    container.Size = UDim2.new(1, -20, 0, 50)
                    container.BackgroundTransparency = 1
                    container.ZIndex = 4
                    container.Parent = contentArea
                    
                    local btn = Instance.new("TextButton")
                    btn.Size = UDim2.new(1, 0, 1, 0)
                    btn.BackgroundColor3 = theme.primary
                    btn.BackgroundTransparency = 0.1
                    btn.Text = options.Name or "Button"
                    btn.TextColor3 = theme.text
                    btn.Font = Enum.Font.GothamBold
                    btn.TextSize = 15
                    btn.BorderSizePixel = 0
                    btn.ZIndex = 5
                    btn.AutoButtonColor = false
                    btn.Parent = container
                    
                    local btnCorner = Instance.new("UICorner")
                    btnCorner.CornerRadius = UDim.new(0, 12)
                    btnCorner.Parent = btn
                    
                    btn.MouseEnter:Connect(function()
                        tween(btn, {BackgroundTransparency = 0}, 0.2)
                    end)
                    
                    btn.MouseLeave:Connect(function()
                        tween(btn, {BackgroundTransparency = 0.1}, 0.2)
                    end)
                    
                    btn.MouseButton1Click:Connect(function()
                        tween(btn, {Size = UDim2.new(0.98, 0, 0.95, 0)}, 0.1)
                        task.wait(0.1)
                        tween(btn, {Size = UDim2.new(1, 0, 1, 0)}, 0.1)
                        if options.Callback then
                            options.Callback()
                        end
                    end)
                    
                    return container
                end
                
                -- Toggle
                function section:Toggle(options)
                    local container = Instance.new("Frame")
                    container.Size = UDim2.new(1, -20, 0, 50)
                    container.BackgroundColor3 = theme.surfaceLight
                    container.BackgroundTransparency = 0.3
                    container.BorderSizePixel = 0
                    container.ZIndex = 4
                    
                    local containerCorner = Instance.new("UICorner")
                    containerCorner.CornerRadius = UDim.new(0, 12)
                    containerCorner.Parent = container
                    
                    container.Parent = contentArea
                    
                    local label = Instance.new("TextLabel")
                    label.Size = UDim2.new(1, -80, 1, 0)
                    label.Position = UDim2.new(0, 18, 0, 0)
                    label.BackgroundTransparency = 1
                    label.Text = options.Name or "Toggle"
                    label.TextColor3 = theme.text
                    label.Font = Enum.Font.GothamSemibold
                    label.TextSize = 14
                    label.TextXAlignment = Enum.TextXAlignment.Left
                    label.ZIndex = 5
                    label.Parent = container
                    
                    local toggleBg = Instance.new("Frame")
                    toggleBg.Size = UDim2.new(0, 56, 0, 30)
                    toggleBg.Position = UDim2.new(1, -70, 0.5, -15)
                    toggleBg.BackgroundColor3 = options.Default and theme.primary or theme.background
                    toggleBg.BackgroundTransparency = options.Default and 0.2 or 0.5
                    toggleBg.BorderSizePixel = 0
                    toggleBg.ZIndex = 5
                    
                    local toggleCorner = Instance.new("UICorner")
                    toggleCorner.CornerRadius = UDim.new(1, 0)
                    toggleCorner.Parent = toggleBg
                    
                    toggleBg.Parent = container
                    
                    local toggleBtn = Instance.new("Frame")
                    toggleBtn.Size = UDim2.new(0, 24, 0, 24)
                    toggleBtn.Position = options.Default and UDim2.new(1, -27, 0.5, -12) or UDim2.new(0, 3, 0.5, -12)
                    toggleBtn.BackgroundColor3 = theme.text
                    toggleBtn.BorderSizePixel = 0
                    toggleBtn.ZIndex = 6
                    
                    local toggleBtnCorner = Instance.new("UICorner")
                    toggleBtnCorner.CornerRadius = UDim.new(1, 0)
                    toggleBtnCorner.Parent = toggleBtn
                    
                    toggleBtn.Parent = toggleBg
                    
                    local state = options.Default or false
                    
                    container.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            state = not state
                            tween(toggleBg, {
                                BackgroundColor3 = state and theme.primary or theme.background,
                                BackgroundTransparency = state and 0.2 or 0.5
                            }, 0.3)
                            tween(toggleBtn, {
                                Position = state and UDim2.new(1, -27, 0.5, -12) or UDim2.new(0, 3, 0.5, -12)
                            }, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
                            if options.Callback then
                                options.Callback(state)
                            end
                        end
                    end)
                    
                    return container
                end
                
                -- Slider
                function section:Slider(options)
                    local container = Instance.new("Frame")
                    container.Size = UDim2.new(1, -20, 0, 70)
                    container.BackgroundTransparency = 1
                    container.ZIndex = 4
                    container.Parent = contentArea
                    
                    local min = options.Minimum or 0
                    local max = options.Maximum or 100
                    local default = options.Default or 50
                    
                    local label = Instance.new("TextLabel")
                    label.Size = UDim2.new(1, 0, 0, 25)
                    label.BackgroundTransparency = 1
                    label.Text = (options.Name or "Slider") .. ": " .. default
                    label.TextColor3 = theme.text
                    label.Font = Enum.Font.GothamSemibold
                    label.TextSize = 14
                    label.TextXAlignment = Enum.TextXAlignment.Left
                    label.ZIndex = 5
                    label.Parent = container
                    
                    local sliderBg = Instance.new("Frame")
                    sliderBg.Size = UDim2.new(1, 0, 0, 32)
                    sliderBg.Position = UDim2.new(0, 0, 0, 32)
                    sliderBg.BackgroundColor3 = theme.surfaceLight
                    sliderBg.BackgroundTransparency = 0.3
                    sliderBg.BorderSizePixel = 0
                    sliderBg.ZIndex = 5
                    
                    local sliderCorner = Instance.new("UICorner")
                    sliderCorner.CornerRadius = UDim.new(0, 12)
                    sliderCorner.Parent = sliderBg
                    
                    sliderBg.Parent = container
                    
                    local sliderFill = Instance.new("Frame")
                    sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
                    sliderFill.BackgroundColor3 = theme.primary
                    sliderFill.BackgroundTransparency = 0.2
                    sliderFill.BorderSizePixel = 0
                    sliderFill.ZIndex = 6
                    
                    local fillCorner = Instance.new("UICorner")
                    fillCorner.CornerRadius = UDim.new(0, 12)
                    fillCorner.Parent = sliderFill
                    
                    sliderFill.Parent = sliderBg
                    
                    local sliderKnob = Instance.new("Frame")
                    sliderKnob.Size = UDim2.new(0, 24, 0, 24)
                    sliderKnob.Position = UDim2.new(1, -12, 0.5, -12)
                    sliderKnob.BackgroundColor3 = theme.text
                    sliderKnob.BorderSizePixel = 0
                    sliderKnob.ZIndex = 7
                    
                    local knobCorner = Instance.new("UICorner")
                    knobCorner.CornerRadius = UDim.new(1, 0)
                    knobCorner.Parent = sliderKnob
                    
                    sliderKnob.Parent = sliderFill
                    
                    local sliding = false
                    
                    sliderBg.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            sliding = true
                        end
                    end)
                    
                    UserInputService.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            sliding = false
                        end
                    end)
                    
                    UserInputService.InputChanged:Connect(function(input)
                        if sliding and input.UserInputType == Enum.UserInputType.MouseMovement then
                            local mousePos = UserInputService:GetMouseLocation().X
                            local relativePos = mousePos - sliderBg.AbsolutePosition.X
                            local percent = math.clamp(relativePos / sliderBg.AbsoluteSize.X, 0, 1)
                            local value = math.floor(min + (max - min) * percent)
                            
                            sliderFill.Size = UDim2.new(percent, 0, 1, 0)
                            label.Text = (options.Name or "Slider") .. ": " .. value
                            if options.Callback then
                                options.Callback(value)
                            end
                        end
                    end)
                    
                    return container
                end
                
                -- Dropdown (simplified version)
                function section:Dropdown(options)
                    local container = Instance.new("Frame")
                    container.Size = UDim2.new(1, -20, 0, 50)
                    container.BackgroundColor3 = theme.surfaceLight
                    container.BackgroundTransparency = 0.3
                    container.BorderSizePixel = 0
                    container.ZIndex = 4
                    
                    local containerCorner = Instance.new("UICorner")
                    containerCorner.CornerRadius = UDim.new(0, 12)
                    containerCorner.Parent = container
                    
                    container.Parent = contentArea
                    
                    local dropBtn = Instance.new("TextButton")
                    dropBtn.Size = UDim2.new(1, 0, 1, 0)
                    dropBtn.BackgroundTransparency = 1
                    dropBtn.Text = "▼  " .. (options.Name or "Dropdown")
                    dropBtn.TextColor3 = theme.text
                    dropBtn.Font = Enum.Font.GothamSemibold
                    dropBtn.TextSize = 14
                    dropBtn.TextXAlignment = Enum.TextXAlignment.Left
                    dropBtn.ZIndex = 5
                    
                    local dropBtnPadding = Instance.new("UIPadding")
                    dropBtnPadding.PaddingLeft = UDim.new(0, 18)
                    dropBtnPadding.Parent = dropBtn
                    
                    dropBtn.Parent = container
                    
                    return container
                end
                
                return section
            end
            
            table.insert(tabGroup.Tabs, tab)
            return tab
        end
        
        return tabGroup
    end
    
    return window
end

return CrazyHub
