local PositionFolder = game.Workspace.MeteorPositions:GetChildren()
local hZ = 1 / 60
local speed = 0.1
local start = CFrame.new(-141.306, 783.84, -100.6) 
local End = CFrame.new(0, 0, 0) --

local function movemodel(model,start,End,AddBy)
	local i = 0
	repeat
		local x = game:GetService("RunService").Heartbeat:Wait() / hZ
		i = math.clamp(i + (AddBy * x), 0, 1)
		if not model.PrimaryPart then break end
		model:SetPrimaryPartCFrame(start:Lerp(End,i))
	until model.PrimaryPart.CFrame == End
end

while task.wait(1) do
	local randomPosition = PositionFolder[math.random(1, #PositionFolder)]
	local MeteorClone = game:WaitForChild("ReplicatedStorage"):WaitForChild("Meteor"):Clone()
	MeteorClone:WaitForChild("Meteor").Anchored = false
	MeteorClone.Parent = workspace
	MeteorClone:WaitForChild("Meteor").CanCollide = false
	MeteorClone:WaitForChild("Meteor").Position = randomPosition.Position
	task.wait(0.1)
	MeteorClone:WaitForChild("Meteor").CanCollide = true

	
end






