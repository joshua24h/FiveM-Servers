ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(0)
	  PlayerData = ESX.GetPlayerData()
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

Citizen.CreateThread(function()
	local entity = PlayerPedId()
	
	if PlayerData.job ~= nil and PlayerData.job.name == 'taxi' then
		
		local blip = AddBlipForEntity(entity)
		
		SetBlipSprite (blip, 198)
		SetBlipScale  (blip, 0.7)
		SetBlipColour (blip, 5)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Taxi Driver")
		EndTextCommandSetBlipName(blip)
	end
end)