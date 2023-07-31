local buttonA = script.Parent:FindFirstChild("buttonA")
local eventModule = require(game:GetService("ServerScriptService"):WaitForChild("ModuleScript"))
local redDoor = script.Parent.Parent.Parent:WaitForChild("Doors"):WaitForChild("cyanDoor"):WaitForChild("DoorPart")
while true do
	task.wait()
	if buttonA:GetAttribute("stoodOn") == 1 then

		eventModule.vanish(redDoor)
	end
	
	if buttonA:GetAttribute("stoodOn") == 0 then

		eventModule.appear(redDoor)
	end

end