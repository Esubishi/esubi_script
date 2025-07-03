--ImportantVariabiles
local userInputService = game:WaitForChild("UserInputService")
local player = game.Players.LocalPlayer
local char = player.Character
local humanoidrootpart = char.HumanoidRootPart
local TL = "TextLabel"
local TB = "TextButton"
local IL = "ImageLabel"
local IB = "ImageButton"
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

local function cframe(x,y,z)
	return CFrame.new(x,y,z)
end

local function setSize2D(scalex,offsetx,scaley,offsety)
	return UDim2.new(scalex,offsetx,scaley,offsety)
end

local function setSize1D(scale, offset)
  return UDim.new(scale,offset)
end

local function CreateButton(conf)
	--First hand Error checking
	if not conf.Parent then
		print("Error: Button '"..conf.Name.."' needs a parent")
		return -1
	end
	
	if conf.Type ~= "TextLabel" and conf.Type ~= "TextButton" then
		print("Error: '"..conf.Type.."' is not a valid button type")
		return -1
	end
  --Button Creation
	local button = Instance.new(conf.Type)
	button.Parent = conf.Parent	
	button.TextScaled = true
	button.BorderSizePixel = 0
	button.Font = "FredokaOne"

	--Second hand error checking
	if conf.Type == "ImageLabel" or conf.Type == "ImageButton" then
		if not conf.Image then
			print("Error: '"..conf.Name.."' doesn't have an image")
		end
	end

	if not conf.Draggable then
	else
		button.Draggable = conf.Draggable
	end

	if not conf.Size then
		button.Size = setSize2D(1,0,1,0)
	else
		button.Size = conf.Size
	end
	
	if not conf.Name then
		button.Name = "Button"
	else
		button.Name = conf.Name
	end
	
	if not conf.Text then
		button.Text = "Button"
	else
		button.Text = conf.Text
	end
	
	if not conf.Func then	
	else
		button.MouseButton1Click:Connect(conf.Func)
	end

  if not conf.Rounded then
  else
    local cornerui = Instance.new("UICorner")
    cornerui.CornerRadius = conf.Rounded
    cornerui.Parent = button
  end

	return button
end
