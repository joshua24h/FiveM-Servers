ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer 
end)

RegisterServerEvent('randomevent:a')
AddEventHandler('randomevent:a', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    xPlayer.removeMoney(500)

    TriggerClientEvent('randomevent:b', source)
end)
