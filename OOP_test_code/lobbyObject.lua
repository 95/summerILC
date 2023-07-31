local Class = require(game:WaitForChild("ReplicatedStorage"):WaitForChild("Class"))
local matchPlayable = game:WaitForChild("ReplicatedStorage"):WaitForChild("matchPlayable")

local LobbyObject = Class:extend()

local function usernameToObject(Name)
	local Players = game:WaitForChild("Players")
	if Players:FindFirstChild(Name) then
		return Players:FindFirstChild(Name) 
	end
end

function LobbyObject:new(leftPads, rightPads)
	-- initialize pads to not be activated
	self.leftPads = leftPads
	self.rightPads = rightPads

	for i,v in pairs(leftPads) do
		v:SetAttribute("Activated", 0)
	end

	for i,v in pairs(rightPads) do
		v:SetAttribute("Activated", 0)
	end


end

function LobbyObject:playable()
	local total = 0
	for i,v in pairs(self.leftPads) do
		if v:GetAttribute("Activated") == 1 then
			total+=1
		end
	end

	for i,v in pairs(self.rightPads) do
		if v:GetAttribute("Activated") == 1 then
			total+=1
		end
	end
	if total == 0 then
		return false
	else
		return true
	end
end

function LobbyObject:returnTeams()
	local teamA = {}
	local teamB = {}
	for i,v in pairs(self.leftPads) do
		if v:GetAttribute("Activated") == 1 and v:GetAttribute("Username") ~= nil then
			local interactionPlayer = usernameToObject(v:GetAttribute("Username")) 
			table.insert(teamA, interactionPlayer)
		end
	end
	for i,v in pairs(self.rightPads) do
		if v:GetAttribute("Activated") == 1 and v:GetAttribute("Username") ~= nil then
			local interactionPlayer = usernameToObject(v:GetAttribute("Username")) 
			table.insert(teamB, interactionPlayer)
		end
	end
	return teamA, teamB
end


function LobbyObject:updatePads()
	local leftPadTotal = 0
	local rightPadTotal = 0

	local playable = false



	coroutine.wrap(function()
		while task.wait() do

			playable = LobbyObject:playable()

			for i,v in pairs(self.rightPads) do
				local interactionPlayer = nil


				if v:GetAttribute("Activated") == 1 and v:GetAttribute("Username") ~= nil then
					interactionPlayer = usernameToObject(v:GetAttribute("Username")) 
					if playable == true and interactionPlayer ~= nil then
						matchPlayable:FireClient(interactionPlayer, 1)		
					end
					coroutine.wrap(function()
						local coThread = coroutine.running()
						while task.wait() do
							if playable == false then
								matchPlayable:FireClient(interactionPlayer, 0)	
								coroutine.yield(coThread)
								coroutine.close(coThread)

							end 
						end

					end)()
				end


			end
			for i,v in pairs(self.leftPads) do
				local interactionPlayer = nil


				if v:GetAttribute("Activated") == 1 and v:GetAttribute("Username") ~= nil then
					interactionPlayer = usernameToObject(v:GetAttribute("Username")) 
					if playable == true and interactionPlayer ~= nil then
						matchPlayable:FireClient(interactionPlayer, 1)		
					end
					coroutine.wrap(function()
						local coThread = coroutine.running()
						while task.wait() do
							if playable == false then
								matchPlayable:FireClient(interactionPlayer, 0)		
								coroutine.yield(coThread)
								coroutine.close(coThread)

							end 
						end

					end)()
				end


			end


		end
	end)()

end



return LobbyObject