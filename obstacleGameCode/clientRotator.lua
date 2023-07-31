-- when the deathPart spinners need to spin, this rotates the parts locally to reduce server lag

local PartsToRotate = game:WaitForChild("Workspace"):WaitForChild("Courses"):WaitForChild("SpinnerCourse"):WaitForChild("Spinners"):GetChildren() 
local PerfectTiming = game:WaitForChild("Workspace"):WaitForChild("Courses"):WaitForChild("PerfectTimingCourse"):WaitForChild("Spinners"):GetDescendants() 
local ChaosCourse = game:WaitForChild("Workspace"):WaitForChild("Courses"):WaitForChild("ChaosCourse"):WaitForChild("Spinner&Water"):GetDescendants()
local function fire(parts)
	local moving = false
	if moving == false then
		moving = true

		while moving == true do
			for x,o in pairs(parts) do
				if o.Name == "DeathPart" then
					o.CFrame = o.CFrame * CFrame.fromEulerAnglesXYZ(0,0.05,0) 
					task.wait(0.001)
				end

			end
		end

	end

end

coroutine.wrap(function()
	fire(PerfectTiming)
end)()
coroutine.wrap(function()
	fire(PartsToRotate)
end)()
coroutine.wrap(function()
	fire(ChaosCourse)
end)()
