local GUI = require("esubi_gui.luau")

local asteriosbutton = gui.CreateButton({
	Text = "AutoComplete Asterios",
	Name = "Asterios",
	Type = TB,
	Parent = MainFrame,
	Rounded = setSize1D(0.1,1),
	Draggable = true,
	Size = setSize2D(0.13,0,0.30,0),
	Func = function()
		print(humanoidrootpart.CFrame)
		humanoidrootpart.CFrame = cframe(9996.89, 10046.5, 9767.48)
		wait(0.01)
		humanoidrootpart.CFrame = cframe(10020.5488, 10039, 9746.51855)
		wait(0.01)
		humanoidrootpart.CFrame = cframe(9993.2168, 10080.5801, 9767.34277)
		wait(0.01)
		humanoidrootpart.CFrame = cframe(9970.54102, 10109.0264, 9784.78711)
		wait(0.01)
		humanoidrootpart.CFrame = cframe(9925.05078, 10120.5693, 9789.31543)
		wait(0.01)
		humanoidrootpart.CFrame = cframe(9917.47461, 10160.2148, 9851.33008)
	end
})

local decompile = gui.CreateButton({
	Text = "Decompile",
	Name = Text,
	Type = TB,
	Parent = MainFrame,
	Size = setSize2D(0.05,0,0.1,0),
	Func = function()
	 CoreGUI:Destroy()
	end
})
