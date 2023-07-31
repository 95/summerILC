-- helper script for teleportation portal module
-- initializes all buttons with "0" as the "stoodOn" attribute
local desc = game:WaitForChild("Workspace"):WaitForChild("Courses"):GetDescendants()
local Players = game:GetService("Players")
local ran = false

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(Character) 
		print(Character.Name)
		Character:SetAttribute("teleporting", 0)
	end)
end)


for i,v in desc do
	if v:IsA("Part") and (v.Name:match("buttonA") or v.Name:match("buttonB")) and ran == false then
		v:SetAttribute("stoodOn", 0)
		ran = true
	end
end