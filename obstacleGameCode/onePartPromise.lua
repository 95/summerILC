-- for when you only want to appear/dissappear a singular set of parts

local buttonA = script.Parent:FindFirstChild("buttonA")
local eventModule = require(game:GetService("ServerScriptService"):WaitForChild("ModuleScript"))
local targetParts = script.Parent.Parent.Parent:WaitForChild("Paths,Box,Truss"):WaitForChild("blackParts")

while true do
	task.wait()
	
	while buttonA:GetAttribute("stoodOn") == 1 do
		task.wait()		
		coroutine.wrap(function()
			eventModule.appearFolder(targetParts)
		end)()
	
	end

	
	while buttonA:GetAttribute("stoodOn") == 0 do
		task.wait()
		coroutine.wrap(function()
			eventModule.vanishFolder(targetParts)
		end)()
		
		
	end
		

end
