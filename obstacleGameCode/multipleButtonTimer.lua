-- use multiple buttons in order to update the gui value

local buttonA = script.Parent:FindFirstChild("buttonA")
local buttonB = script.Parent:FindFirstChild("buttonB")
local orangeParts = script.Parent.Parent.Parent:WaitForChild("Paths"):WaitForChild("brightBlueParts")
local eventModule = require(game:GetService("ServerScriptService"):WaitForChild("ModuleScript"))
local time = 10

local function fire()
	buttonA:WaitForChild("BillboardGui").TextLabel.Text = "2/2"
	buttonB:WaitForChild("BillboardGui").TextLabel.Text = "2/2"

	coroutine.wrap(function()
		eventModule.appearFolder(orangeParts)
	
	end)()

	task.wait(time)
	coroutine.wrap(function()
		eventModule.vanishFolder(orangeParts)

	end)()

	buttonA:WaitForChild("BillboardGui").TextLabel.Text = "0/2"
	buttonB:WaitForChild("BillboardGui").TextLabel.Text = "0/2"
end

while true do
	task.wait()
	if (buttonA:GetAttribute("stoodOn") == 1 or buttonB:GetAttribute("stoodOn") == 1)
	then
		buttonA:WaitForChild("BillboardGui").TextLabel.Text = "1/2"
		buttonB:WaitForChild("BillboardGui").TextLabel.Text = "1/2"

	end
	if buttonA:GetAttribute("stoodOn") == 1 and buttonB:GetAttribute("stoodOn") == 1 then
		
		fire()

	end
	if buttonA:GetAttribute("stoodOn") == 0 and buttonB:GetAttribute("stoodOn") == 0 then
		buttonA:WaitForChild("BillboardGui").TextLabel.Text = "0/2"
		buttonB:WaitForChild("BillboardGui").TextLabel.Text = "0/2"

	end


end