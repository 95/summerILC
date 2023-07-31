-- moves elevators via tweening service

local buttonA = script.Parent:FindFirstChild("buttonA")
local eventModule = require(game:GetService("ServerScriptService"):WaitForChild("ModuleScript"))
local elevatorFolder = script.Parent.Parent.Parent:WaitForChild("Elevators")
local blueElevator = elevatorFolder:WaitForChild("BlueElevator")
local blueElevator2 = elevatorFolder:WaitForChild("BlueElevator2")

while true do
	task.wait()
	
	while buttonA:GetAttribute("stoodOn") == 1 do
		task.wait()		

		eventModule.ElevatorPart(blueElevator:WaitForChild("Platform"), blueElevator:WaitForChild("StartPlatform"), blueElevator:WaitForChild("EndPlatform"))
		eventModule.ElevatorPart(blueElevator2:WaitForChild("Platform"), blueElevator2:WaitForChild("StartPlatform"), blueElevator2:WaitForChild("EndPlatform"))

	end

	
	while buttonA:GetAttribute("stoodOn") == 0 do
		task.wait()
		eventModule.ElevatorPart(blueElevator:WaitForChild("Platform"),blueElevator:WaitForChild("EndPlatform"), blueElevator:WaitForChild("StartPlatform"))
		eventModule.ElevatorPart(blueElevator2:WaitForChild("Platform"),blueElevator2:WaitForChild("EndPlatform"), blueElevator2:WaitForChild("StartPlatform"))

	end
		

end
