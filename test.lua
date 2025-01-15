--ImportantVariabiles
local userInputService = game:WaitForChild("UserInputService")
local player = game.Players.LocalPlayer
local currentWalkspeed = player.Character.Humanoid.WalkSpeed

--BaseGUI
local CoreGUI = Instance.new("ScreenGui")
CoreGUI.Parent = game.CoreGui
CoreGUI.Name = "BaseGui"
--Main frame
local MainFrame = Instance.new("Frame")
MainFrame.Parent = CoreGUI
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Color3.fromRGB(197,196,196)
MainFrame.BackgroundTransparency = 0.75
MainFrame.Size = UDim2.new(1,0,1,0)
MainFrame.Visible = true
--Functions

local function CreateButton(text, parent, backgorund_color, text_color, isDraggable,button_type)
    local button = Instance.new(button_type)
	--Button Config
	button.Name = "Button"
    button.Text = text
    button.Parent = parent
	button.Size = UDim2.new(0.2,0,0.1,0)
	button.BorderSizePixel = 0
    button.Font = "FredokaOne"
	button.TextScaled = true
	button.Draggable = isDraggable
	--Color check
	if backgorund_color == nil then
        button.BackgroundColor3 = Color3.fromRGB(255,255,255)
    elseif backgorund_color ~= nil then
        button.BackgroundColor3 = Color3.fromRGB(tonumber(backgorund_color))
    elseif text_color == nil then
        button.TextColor3 = Color3.fromRGB(0,0,0)
    elseif text_color ~= nil then
        button.TextColor3 = Color3.fromRGB(tonumber(text_color))
    end
    return button
end

local function CreateTab(name,parent)
	--Variabiles
	local tab = Instance.new("ScrollingFrame")
	local Name_label = Instance.new("TextLabel")
	--Label
	
	--Tab
	tab.Parent = Name_label
	tab.Name = name
	tab.BorderSizePixel = 0
	tab.Visible = true
	tab.Size = UDim2.new(0.13,0,0.3,0)
	tab.Visible = false
	--Return	
	return tab
end

local MovmentTab = CreateTab("Movment", MainFrame)

local button = CreateButton("TEST",MainFrame,nil,nil,true,"TextButton")

button.MouseButton1Click:Connect(function()
	print("Yea")
end)
