-- for driving styles https://www.vespura.com/fivem/drivingstyle/

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(0)
	  PlayerData = ESX.GetPlayerData()
	end
end)

RegisterCommand("driveme", function()
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)
	local waypoint = GetFirstBlipInfoId(8)

	if DoesBlipExist(waypoint) then

		local coords = GetBlipInfoIdCoord(waypoint)
		
		if (GetPedInVehicleSeat(veh, -1) == ped) then -- if is driver
			TaskVehicleDriveToCoordLongrange(ped, veh, coords["x"], coords["y"], coords["z"], 45.0, 524719, 1.0) -- speed, drivingStyle, stoppingdistance

			Wait(120000) -- wait before auto stopping 

			ClearPedTasks(ped)
		else
			ESX.ShowNotification("Not the driver.")
		end

	else
		ESX.ShowNotification("Please place your waypoint.")
	end
end, false)