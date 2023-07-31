-- for teleporting the player from one portal to another
local doorPart = script.Parent
local otherPoral = game.Workspace:WaitForChild("Lobby"):WaitForChild("teleportPart")
doorPart.Touched:Connect(function(hit)
	if game.Players:FindFirstChild(hit.Parent.Name) then 
		local playerCharacter = game.Workspace:FindFirstChild(hit.Parent.Name)
		if playerCharacter:GetAttribute("teleporting") == 0 then
			playerCharacter:SetAttribute("teleporting", 1)

			local player = game:WaitForChild("Workspace"):FindFirstChild(hit.Parent.Name)
			print("doing")
			-- actually the player character
			player:WaitForChild("HumanoidRootPart").Position = otherPoral.Position
			print("done")
			task.wait(1)
			playerCharacter:SetAttribute("teleporting", 0)
		end

	end


end)