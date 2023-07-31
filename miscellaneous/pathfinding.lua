local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local MaxPower = 100
local MaxDist = 10
local MinDist = 5
local ragdollModule = require(game:WaitForChild("ServerScriptService"):WaitForChild("RagdollModule"))
local tornado = workspace:WaitForChild("Model")


local lady = script.Parent
local Players = game:GetService("Players")
local maxDistance = 100
local dmgDistance = 20
local nearestPlayer, nearestDistance
local part = script.Parent:WaitForChild("HumanoidRootPart")
local ragdollModule = require(game:WaitForChild("ServerScriptService"):WaitForChild("RagdollModule"))



while true do
	for _, player in pairs(Players:GetPlayers()) do
		local character = player.Character
		local distance = player:DistanceFromCharacter(part.Position)
		if not character or distance > maxDistance then
			continue
		end
		if not nearestDistance or distance < nearestDistance then
			nearestDistance = distance
			nearestPlayer = player
		end
		
		if distance < dmgDistance then
			local hum = player.Character:WaitForChild("Humanoid")
			hum.Health -= 20
		end
	end
	print("The nearest player is", nearestPlayer)

	if nearestPlayer then
		part.Parent.Humanoid:MoveTo(nearestPlayer.Character.PrimaryPart.Position)
		task.wait()
		
	end
	task.wait(0.05)
end










