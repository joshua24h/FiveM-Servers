ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer 
end)

--
-- # buy
--

RegisterServerEvent('randomevent:e')
AddEventHandler('randomevent:e', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    xPlayer.removeMoney(2000)

    TriggerClientEvent('randomevent:f', source)
end)

--
-- # buy 
-- 

RegisterServerEvent('randomevent:lol')
AddEventHandler('randomevent:lol', function()
    TriggerClientEvent('chat:addMessage', -1, { template = '<div class="chat-message server"><b>Dispatch : </b> {1}</div>', args = { fal, "Gun shipment leaving Favelas"  } })
end)


--
-- # sell
--

RegisterServerEvent('randomevent:sell')
AddEventHandler('randomevent:sell', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent('randomevent:sell2', source)
end)

RegisterServerEvent('randomevent:pay')
AddEventHandler('randomevent:pay', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addMoney(10000)
end)

--
-- # sell
--