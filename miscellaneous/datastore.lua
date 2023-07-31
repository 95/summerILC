-- contains onjoin, onleave, etc for assigning data
local Players = game:GetService("Players")
local DatastoreService = game:GetService("DataStoreService")

local database = DatastoreService:GetDataStore("data")
local sessionData = {}

function PlayerAdded(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	local bites = Instance.new("IntValue")
	bites.Name = "Bites"
	bites.Parent = leaderstats
	leaderstats.Parent = player


	local success = nil
	local playerData = nil
	local attempt = 1

	repeat
		success, playerData = pcall(function()
			return database:GetAsync(player.UserId)
		end)

		attempt += 1
		if not success then
			warn(playerData)
			task.wait(3)
		end
	until success or attempt == 5

	if success then 
		print("Connected to database")
		if not playerData then
			print("Assigning default data")
			playerData = {
				["Bites"] = 0,
			}
		end
		sessionData[player.UserId] = playerData
	else
		warn("Unable to get data for ", player.UserId)
		--player:Kick("Unable to load ur data")
	end	

	bites.Value = sessionData[player.UserId].bites
	bites.Changed:Connect(function()
		sessionData[player.UserId].Dollars = bites.Value
	end)

	leaderstats.Parent = player

end


Players.PlayerAdded:Connect(PlayerAdded)


function PlayerLeaving(player)
	print("Function triggered")
	if sessionData[player.UserId] then
		local success = nil
		local errorMsg = nil
		local attempt = 1
		repeat
			print("Trying to pcall")
			success, errorMsg = pcall(function()
				database:SetAsync(player.UserId, sessionData[player.UserId])
			end)

			attempt += 1
			if not success then
				print("errored")
				warn(errorMsg)
				task.wait(3)
			end
		until success or attempt == 5

		if success then
			print("Data saved for ", player.UserId)


		else
			warn("Unable to save for ", player.UserId)
			print("Unable to do so")
		end


	end
end

Players.PlayerRemoving:Connect(PlayerLeaving)