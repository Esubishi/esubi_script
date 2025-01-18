--ImportantVariabiles
local userInputService = game:WaitForChild("UserInputService")
local player = game.Players.LocalPlayer
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
--Test


--Functions

local function CreateButton(text, parent, isDraggable,button_type,size)
	--Error checking
	if button_type ~= "TextButton" and button_type ~= "TextLabel" then
		print("Button Creation Error: '"..button_type.."' is not a valid button type")
		return -1
	end
	--Variabiles
	local button = Instance.new(button_type)
	--Button Config
	button.Name = "Button"
	button.Text = text
	button.Parent = parent
	button.Size = UDim2.new(tonumber(size))
	button.BorderSizePixel = 0
	button.Font = "FredokaOne"
	button.TextScaled = true
	button.Draggable = isDraggable
	return button
end

local function CreateTab(name,parent)
	--Variabiles
	local tab = Instance.new("Frame")
	local Name_label = Instance.new("TextLabel")
	--Label
	Name_label.Name = name
	Name_label.Text = " "
	Name_label.Parent = parent
	Name_label.Size = UDim2.new(0.13,0,0.5,0)
	Name_label.Draggable = true
	--Tab
	tab.Parent = Name_label
	tab.Name = name
	tab.BorderSizePixel = 0
	tab.Visible = true
	tab.Size = UDim2.new(1,0,1,0)
	--Return	
	return tab
end

local MovmentTab = CreateTab("Movment", MainFrame)

local button = CreateButton("TEST",MovmentTab,false,"TextButton","1,0,1,0")
