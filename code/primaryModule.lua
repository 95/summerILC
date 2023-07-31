
-- all of the helper functions
local module = {}

function module.roundDecimals(num, places)
    
		    places = math.pow(10, places or 0)
		    num = num * places
		   
		    if num >= 0 then 
		        num = math.floor(num + 0.5) 
		    else 
		      	num = math.ceil(num - 0.5) 
		    end
		    
		    return num / places
	
end


function module.appear(part)

	if part:IsA("Part") or part:IsA("TrussPart") then
		part.CanCollide = true
		part.CanTouch = true
		part.Transparency = 0
	end
	
	
end

function module.vanish(part)
	if part:IsA("Part") or part:IsA("TrussPart") then
		part.CanCollide = false
		part.CanTouch = false
		part.Transparency = 1

	end

end

function module.timer(part, time, textlabel)
	module.appear(part)
	local seconds = time
		while seconds >= 0 do
			seconds -= task.wait()
			textlabel.Text = module.roundDecimals(seconds, 2)
		end	
		module.vanish(part)

	
end

function module.doortimer(part, time, textlabel)
	module.vanish(part)
	local seconds = time

	while seconds > 0 do
		seconds -= task.wait()
		textlabel.Text = module.roundDecimals(seconds, 2)
	end	
	module.appear(part)

end

function module.appearFolder(folder)
	for i,v in pairs(folder:GetDescendants()) do
		if v:IsA("Part") or v:IsA("TrussPart") then
			module.appear(v)

		end
	end
end

function module.vanishFolder(folder)
	for i,v in pairs(folder:GetDescendants()) do
		if v:IsA("Part") or v:IsA("TrussPart") then
			module.vanish(v)

		end
	end
end


function module.ElevatorPart(movingPart, startingPartPosition, endingPartPosition)
	local part = movingPart
	local TweenService = game:GetService("TweenService")
	local info = TweenInfo.new(
		4,
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.Out,
		-1,
		true
	)
	local newPosition = endingPartPosition.Position
	local tween = TweenService:Create(part, info, {Position = newPosition})
	tween:Play()

end



return module
