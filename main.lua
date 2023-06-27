--Variables
local Workspace = game:GetService("Workspace")
local rs = game:GetService("RunService")
local camera = game.Workspace.CurrentCamera
local w_speed = 100
local f_speed = 0.5
--Player
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Char = Player.Character
local H_R_P = Char:WaitForChild("HumanoidRootPart")
local bp = Instance.new("BodyPosition", H_R_P)
local bg = Instance.new("BodyGyro", H_R_P)
print("Variables loaded")
--Fly things
bp.MaxForce = Vector3.new()
bp.D = 10
bp.P = 10000
bg.MaxTorque = Vector3.new()
bg.D = 10
print("Fly things loaded")
--Screen Gui
local Wind = Instance.new("ScreenGui")
Wind.Name = "Wind"
Wind.Parent = game.CoreGui
print("ScreenGui loded")
--Frame
local Frame = Instance.new("Frame")
local f_ui = Instance.new("UICorner")
f_ui.Name = "UICorner_frame"
f_ui.Parent = Frame
f_ui.CornerRadius = UDim.new(0,32)
Frame.Name = "Frame"
Frame.Parent = Wind
Frame.Size = UDim2.new(0, 595, 0, 516)
Frame.Visible = false
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(77, 62, 82)
Frame.BorderSizePixel = 0
print("Frame loaded")
--Open/Close Button
local O_C = false
local O_C_B = Instance.new("TextButton")
local O_C_B_ui = Instance.new("UICorner")
O_C_B_ui.CornerRadius = UDim.new(0,32)
O_C_B_ui.Parent = O_C_B
O_C_B.Parent = Wind
O_C_B.BorderSizePixel = 0
O_C_B.BackgroundColor3 = Color3.fromRGB(196, 150, 212)
O_C_B.Name = "Open_Close"
O_C_B.Text = "Open or Close"
O_C_B.Size = UDim2.new(0, 200, 0, 100)
O_C_B.Position = UDim2.new(0, 0, 0.8, 0)
O_C_B.TextColor3 = Color3.fromRGB(255,255,255)
O_C_B.FontFace.Weight = Enum.FontWeight.Bold
O_C_B.TextSize = 15
O_C_B.Draggable = true
O_C_B.MouseButton1Click:Connect(function()
	if O_C == false then
		Frame.Visible = true
		O_C = true
	elseif O_C == true then
		Frame.Visible = false
		O_C = false
	end
end)
print("OCB laoded")
--Walkspeed changerese
local wsc = Instance.new("UICorner")
local ws_c = Instance.new("TextBox")
ws_c.Name = "Walkspeed changer"
wsc.Parent = ws_c
wsc.CornerRadius = UDim.new(0,32)
ws_c.Size = UDim2.new(0, 100, 0, 50)
ws_c.Parent = Frame
ws_c.Position = UDim2.new(0.1, 0, 0.4, 0)
ws_c.BackgroundColor3 = Color3.fromRGB(196, 150, 212)
ws_c.BorderSizePixel = 0
ws_c.Text = "Enter the speed"
ws_c.ClearTextOnFocus = true
ws_c.FocusLost:Connect(function(enter)
	if enter then
		w_speed = ws_c.Text
		print("A mers domnule"..Player.Name)
	end
end)
print("Walkspeed changer loaded")
--Change Walkspeed Label
local wsl = Instance.new("UICorner")
local ws_l = Instance.new("TextButton")
local ws = false
wsl.Parent = ws_l
wsl.CornerRadius = UDim.new(0,32)
ws_l.Name = "Walspeed"
ws_l.Text = "More Walkspeed"
ws_l.Parent = Frame
ws_l.Position = UDim2.new(0.1, 0, 0.1, 0)
ws_l.Size = UDim2.new(0, 150, 0, 100)
ws_l.BackgroundColor3 = Color3.fromRGB(196, 150, 212)
ws_l.BorderSizePixel = 0
ws_l.MouseButton1Click:Connect(function()
	if ws == false then
		if Char then
			Char.Humanoid.WalkSpeed = w_speed
		end
		ws_l.BackgroundColor3 = Color3.fromRGB(106, 91, 235)
		ws = true
	elseif ws == true then
		if Char then
			Char.Humanoid.WalkSpeed = 16
		end
		ws_l.BackgroundColor3 = Color3.fromRGB(196, 150, 212)
		ws = false
	end
end)
print("Walkspeed loaded")
--Flyspeed changer
local fsc_ui = Instance.new("UICorner")
local fs_c = Instance.new("TextBox")
fsc_ui.Parent = fs_c
fsc_ui.CornerRadius = UDim.new(0,32)
fs_c.Name = "Flyspeed changer"
fs_c.Size = UDim2.new(0, 100, 0, 50)
fs_c.Parent = Frame
fs_c.Position = UDim2.new(0.735, 0, 0.4, 0)
fs_c.BackgroundColor3 = Color3.fromRGB(196, 150, 212)
fs_c.BorderSizePixel = 0
fs_c.Text = "Enter the speed"
fs_c.ClearTextOnFocus = true
fs_c.FocusLost:Connect(function(enter)
	if enter then
		f_speed = fs_c.Text
		print("A mers domnule"..Player.Name)
	end
end)
print("Flyspeed changer loaded")
--Fly Label
local fly_ui = Instance.new("UICorner")
local f_l = Instance.new("TextButton")
local flying = false
fly_ui.Parent = f_l
fly_ui.CornerRadius = UDim.new(0, 32)
f_l.Parent = Frame
f_l.Name = "Fly"
f_l.Text = "Fly"
f_l.Position = UDim2.new(0.65, 0, 0.1, 0)
f_l.Size = UDim2.new(0, 150, 0, 100)
f_l.BackgroundColor3 = Color3.fromRGB(196, 150, 212)
f_l.BorderSizePixel = 0

f_l.MouseButton1Click:Connect(function()
	 if flying == false then
			flying = true
		bp.MaxForce = Vector3.new(400000,400000,400000)
		bg.MaxTorque = Vector3.new(400000,400000,400000)
		f_l.BackgroundColor3 = Color3.fromRGB(106, 91, 235)
		while flying == true do
			rs.RenderStepped:wait()
			bp.Position = H_R_P.Position +((H_R_P.Position - camera.CFrame.p).unit * f_speed)
			bg.CFrame = CFrame.new(camera.CFrame.p, H_R_P	.Position)
		end
	 elseif flying == true then
	 	f_l.BackgroundColor3 = Color3.fromRGB(196, 150, 212)
	 	 bp.MaxForce = Vector3.new()
		 bg.MaxTorque = Vector3.new()
		 flying = false
	 end
end)
print("Fly loaded")
--Noclip
local noclip_ui = Instance.new("UICorner")
local noct = false
local noclip = false
local noc = Instance.new("TextButton")
local helper_noclip = false
noclip_ui.CornerRadius = UDim.new(0,32)
noclip_ui.Parent = noc
noc.Parent = Frame
noc.Text = "Noclip"
noc.Name = "Esp"
noc.Position = UDim2.new(0.1, 0, 0.6, 0)
noc.Size = UDim2.new(0, 150, 0 ,100)
noc.BackgroundColor3 = Color3.fromRGB(196, 150, 212)
noc.BorderSizePixel = 0
noc.MouseButton1Click:Connect(function()
	if noct == false then
		noclip = true
		noct = true
		noc.BackgroundColor3 = Color3.fromRGB(106, 91, 235)
		Stepped = rs.Stepped:Connect(function ()
			if noclip == true then
				for a,b in pairs(Workspace:GetChildren()) do
					if b.Name == Player.Name then
						for i,v in pairs(Workspace[Player.Name]:GetChildren()) do
							if v:isA("BasePart") then
								v.CanCollide = false
							end
						end
					end
				end
			else
				Stepped:Disconnect()
			end
		end)
	elseif noct == true then
		noc.BackgroundColor3 = Color3.fromRGB(196, 150, 212)
		noct = false
		noclip = false
	end
end)
