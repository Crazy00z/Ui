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
    
    -- Notification function
    function window:Notify(options)
        -- Add notification implementation here
        print("Notification:", options.Title, options.Description)
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
                end
                
                -- Show this tab
                contentArea.Visible = true
                window.CurrentTab = tab
            end)
            
            function tab:Select()
                tabBtn.MouseButton1Click:Fire()
            end
            
            -- Section function
            function tab:Section(options)
                local section = {}
                section.Side = options.Side or "Left"
                section.Elements = {}
                
                -- Add section implementation with all your UI elements here
                -- (Button, Toggle, Slider, Dropdown, etc.)
                
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
