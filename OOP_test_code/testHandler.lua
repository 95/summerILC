local Lobby1 = require(game:WaitForChild("ReplicatedStorage"):WaitForChild("LobbyObject"))
local Match = require(game:WaitForChild("ReplicatedStorage"):WaitForChild("Match"))
local leftPads = workspace:WaitForChild("leftPads"):GetChildren()
local rightPads = workspace:WaitForChild("rightPads"):GetChildren()
local matchBegan = game:WaitForChild("ReplicatedStorage"):WaitForChild("matchBegan")



Lobby1:new(leftPads, rightPads)

local function fireClients()
	local teamA, teamB = Lobby1:returnTeams()
	for i,v in pairs(teamA) do
		matchBegan:FireClient(v)
	end
	for i,v in pairs(teamB) do
		matchBegan:FireClient(v)
	end
end

matchBegan.OnServerEvent:Connect(function()
		Lobby1:updatePads()
		local Match = require(game:WaitForChild("ReplicatedStorage"):WaitForChild("Match"))
		local teamA, teamB = Lobby1:returnTeams()
	
		
		Match:new(teamA, teamB)
		Match:begin()
	
end)

