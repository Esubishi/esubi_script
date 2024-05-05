--ImportantVariabiles
local userInputService = game:WaitForChild("UserInputService")
local player = game.Players.LocalPlayer
local OpenFrame = false
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
B_Frame.Visible = false
B_Frame.Name = "BaseFrame"
B_Frame.Size = UDim2.new(0.3,0,0.7,0)
B_Frame.BackgroundColor3 = Color3.fromRGB(24,193,255)
--Functions
local function openFrame(input, _gameProcessed)
	if input.KeyCode == Enum.KeyCode.P then
		if OpenFrame == false then
			OpenFrame = true
			B_Frame.Visible = true
		elseif OpenFrame == true then
			OpenFrame = false
			B_Frame.Visible = false
		end
	end
end
userInputService.InputBegan:Connect(openFrame)
