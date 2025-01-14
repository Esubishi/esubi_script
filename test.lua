--ImportantVariabiles
local userInputService = game:WaitForChild("UserInputService")
local player = game.Players.LocalPlayer
local currentWalkspeed = player.Character.Humanoid.WalkSpeed
--Functions

local function CreateButton(text, parent, backgorund_color, text_color)
    local button = Instance.new("TextButton")
    button.Name = "Button"
    button.Text = text
    button.Parent = parent
    button.Size = UDim2.new(0.2,0,0.1,0)
    button.Font = "FredokaOne"
    button.TextScaled = true
    if backgorund_color == nil then
        button.BackgroundColor3 = Color3.fromRGB(255,255,255)
    elseif backgorund_color ~= nil then
        button.BackgroundColor3 = Color3.fromRGB(tonumber(backgorund_color))
    elseif text_color == nil then
        button.TextColor3 = Color3.fromRGB(0,0,0)
    elseif backgorund_color ~= nil then
        button.TextColor3 = Color3.fromRGB(tonumber(text_color))
    end
    return button
end

--BaseGUI
local CoreGUI = Instance.new("ScreenGui")
CoreGUI.Parent = game.CoreGui
CoreGUI.Name = "BaseGui"
--Frame
local B_Frame = Instance.new("Frame")
local B_FrameCornerUI = Instance.new("UICorner")
B_FrameCornerUI.Parent = B_Frame
B_FrameCornerUI.CornerRadius = UDim.new(0.1,0)
B_Frame.Parent = CoreGUI
B_Frame.Name = "BaseFrame"
B_Frame.Visible = false
B_Frame.Size = UDim2.new(0.3,0,0.7,0)
B_Frame.BackgroundColor3 = Color3.fromRGB(24,193,255)
B_Frame.Draggable = true
B_Frame.Position = UDim2.new(0.349,0,0.149)
--Test

local test = CreateButton("test",B_Frame,"0,0,0","255,255,255")
test.Visible = true

--Destroy button
local Destroy_button = Instance.new("TextButton")
local Destroy_buttonCornerUI = Instance.new("UICorner")
Destroy_button.Parent = B_Frame
Destroy_buttonCornerUI.Parent = Destroy_button
Destroy_button.Text = 'X'
Destroy_button.TextScaled = true
Destroy_button.Font = "FredokaOne"
Destroy_button.Size = UDim2.new(0.1,0,0.1,0)
Destroy_button.Visible = true
Destroy_button.Position = UDim2.new(0.1,0,0.1,0)
Destroy_button.BackgroundColor3 = Color3.fromRGB(255,0,0)
Destroy_button.TextColor3 = Color3.fromRGB(255,255,255)
--Shift to sprint button
local STS_button = Instance.new("TextButton")
local STS_buttonCornerUI = Instance.new("UICorner")
local status = "Disabled"
STS_button.Parent = B_Frame
STS_buttonCornerUI.Parent = STS_button
STS_button.Text = "Shift to run: "..status
STS_button.TextScaled = true
STS_button.Font = "FredokaOne"
STS_button.Size = UDim2.new(0.2,0,0.1,0)
STS_button.Visible = true
STS_button.Position = UDim2.new(0.4,0,0.4,0)
STS_button.BackgroundColor3 = Color3.fromRGB(7, 218, 255)
STS_button.TextColor3 = Color3.fromRGB(255,255,255)
--Gui function
local open = false
local function CheckInput(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.P then
		if open == false then
			open = true
			B_Frame.Visible = true
		else
			open = false
			B_Frame.Visible = false
		end
	end
    
end
local function destroy()
    CoreGUI:Destroy()
    status = "Disabled"
end
--Character Function
 
--Input
userInputService.InputBegan:Connect(CheckInput)
Destroy_button.MouseButton1Click:Connect(destroy)
