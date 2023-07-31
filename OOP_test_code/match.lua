local Class = require(game:WaitForChild("ReplicatedStorage"):WaitForChild("Class"))
local roundObject = require(game:WaitForChild("ReplicatedStorage"):WaitForChild("roundObject"))

local Match = Class:extend()
local inProgress = false


function Match:new(teamA, teamB)
	inProgress = true
	self.MatchType = 1 -- 1 means 1v1, 2 means 2v2, etc
	self.TeamA = teamA
	self.TeamB = teamB
	self.MatchActive = true
	self.scoreA = 0
	self.scoreB = 0
	self.gamePoint = 5
	self.Map = workspace.map
	print("Match created")
	
end

function Match:printPlayers()
		
	for i,v in pairs(self.TeamA) do
		print(v.Name)
	end
	
	for i,v in pairs(self.TeamB) do
		print(v.Name)		
	end


end


function Match:terminate()
	self.MatchType = nil -- 1 means 1v1, 2 means 2v2, etc
	self.TeamA = nil
	self.TeamB = nil
	self.MatchActive = false
	self.scoreA = 0
	self.scoreB = 0
	for i,v in pairs(self.TeamA) do
		v:LoadCharacter()
	end
	for i,v in pairs(self.TeamB) do
		v:LoadCharacter()
	end


end


function Match:validate()
	-- if someone leaves, terminate the match
	--if ((#self.TeamA + #self.TeamB) ~= self.MatchType * 2) then
	--	self.MatchActive = false
	--	Match:terminate()
	--	inProgress = false
--	else
		inProgress = true
--	end
	
end

function Match:initializePlayers()
	for i,v in pairs(self.TeamA) do
		v.SpawnLocation = workspace:WaitForChild("map"):WaitForChild("teamA"):WaitForChild("Part")
		v:LoadCharacter()


	end
	for i,v in pairs(self.TeamB) do
		v.SpawnLocation = workspace:WaitForChild("map"):WaitForChild("teamA"):WaitForChild("Part")
		v:LoadCharacter()
	end


end



function Match:begin()
	Match:validate()
	local roundNumber = 1
	if inProgress == true then
	
		repeat print("Round " .. roundNumber .. " has begun")
			roundObject:new(self.TeamA, self.TeamB, roundNumber)
			roundObject:initialize(self.TeamA, self.TeamB)
			roundObject:roundHandler()
			roundNumber+=1
			repeat task.wait() until roundObject.over() == true
			
		until roundNumber == 5
		inProgress = false
		

		end
	print("began and validated")

		
end
	
	









return Match
