ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer 
end)


-- 
-- # FORKLIFT CODE
--

RegisterServerEvent('randomevent:1')
AddEventHandler('randomevent:1', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    xPlayer.removeMoney(500)

    TriggerClientEvent('randomevent:2', source)
end)

-- 
-- # FORKLIFT CODE
--


-- 
-- # PALLET CODE
--

RegisterServerEvent('randomevent:3')
AddEventHandler('randomevent:3', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    xPlayer.removeMoney(20)

    TriggerClientEvent('randomevent:4', source)
end)

RegisterServerEvent('randomevent:5')
AddEventHandler('randomevent:5', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    TriggerClientEvent('randomevent:6', source)
end)

RegisterServerEvent('randomevent:7')
AddEventHandler('randomevent:7', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addMoney(1000)
end)

-- 
-- # PALLET CODE
--

