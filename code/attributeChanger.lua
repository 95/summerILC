local part = script.Parent
local beingStoodOn = false
local hitPartDetect = "HumanoidRootPart" -- change to whatever we want 2 listen for


part.Touched:Connect(function(hit)

	if hit.Name == hitPartDetect then
		print("fired")

		part:SetAttribute("stoodOn", 1)
	end
end)


part.TouchEnded:Connect(function(hit)


	if hit.Name == hitPartDetect then

		part:SetAttribute("stoodOn", 0)
	end

end)