--ImportantVariabiles
local userInputService = game:WaitForChild("UserInputService")
local player = game.Players.LocalPlayer
local open = false

--Functions
local function run(func) func() end
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
--Gui function
local function openFrame(input,_gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard then
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
end

userInputService.InputBegan:Connect(openFrame)
