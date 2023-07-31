local Class = require(game:WaitForChild("ReplicatedStorage"):WaitForChild("Class"))
local roundObject = Class:extend()
local inProgress = true
local roundNumber = 1

function roundObject:new(teamA, teamB, roundNumber)
	print("Round" .. roundNumber .. " has started")
	self.inProgress = true
	self.roundNumber = roundNumber
	self.teamA = teamA
	self.teamB = teamB

end

function roundObject:over()
	if inProgress == true then 
		return false
	else
		return true
	end
	
end

function roundObject:initialize(teamA, teamB)
	for i,v in pairs(self.teamA) do
		v:LoadCharacter()
		v.Character:PivotTo(workspace:WaitForChild("map"):WaitForChild("teamA"):WaitForChild("Part"):GetPivot())
	end
	for i,v in pairs(self.teamB) do
		v:LoadCharacter()
		v.Character:PivotTo(workspace:WaitForChild("map"):WaitForChild("teamA"):WaitForChild("Part"):GetPivot())
	end
end

function roundObject:scoreAgent()
	 self.teamB_alive = #self.teamB
	 self.teamA_alive = #self.teamA
	
	
end
function roundObject:setActive(boolean)
	inProgress = boolean
end



function roundObject:roundHandler()

	local teamA_alive = false
	local teamB_alive = false
	while task.wait() and inProgress == true do
			print("checking")

			for i,v in pairs(self.teamA) do
				if v.Character and v.Character.Parent ~= nil and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health >= 0 then
					teamA_alive = true 
				else
					teamA_alive = false 
				end
			end

			for i,v in pairs(self.teamB) do
				if v.Character and v.Character.Parent ~= nil and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health >= 0 then
					teamB_alive = true 
				else
					teamB_alive = false
				end
			end
			
			if teamA_alive == false then
				print("teamA has lost round " .. self.roundNumber)
				inProgress = false
				return
			end
			if teamB_alive == false then
				print("teamB has lost round " .. self.roundNumber)
				inProgress = false
				return
			end

	end
	

	
end




return roundObject
