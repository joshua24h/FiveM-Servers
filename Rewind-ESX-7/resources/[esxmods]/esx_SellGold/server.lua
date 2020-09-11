ESX = nil
local playersProcessing = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_SellGold:sell')
AddEventHandler('esx_SellGold:sell', function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = config.items[itemName]
	local xItem = xPlayer.getInventoryItem(itemName)

	if not price then
		return
	end

	if xItem.count < amount then
		return
	end

	price = ESX.Math.Round(price * amount)
	xPlayer.addMoney(price)

	xPlayer.removeInventoryItem(xItem.name, amount)

end)


RegisterServerEvent('esx_SellGold:process')
AddEventHandler('esx_SellGold:process', function()
	if not playersProcessing[source] then
		local _source = source
	
		playersProcessing[_source] = ESX.SetTimeout(10000, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xCannabinoid, xSpice = xPlayer.getInventoryItem('gold_o'), xPlayer.getInventoryItem('gold_t')
	
			if xSpice.limit ~= -1 and (xSpice.count + 1) >= xSpice.limit then
				TriggerClientEvent('esx:showNotification', _source, 'cant hold anymore')
			elseif xCannabinoid.count < 10 then
				TriggerClientEvent('esx:showNotification', _source, 'not enough gold')
			else
				xPlayer.removeInventoryItem('gold_o', 10)
				xPlayer.addInventoryItem('gold_t', 1)
	
				TriggerClientEvent('esx:showNotification', _source, 'gold processed')
			end
	
			playersProcessing[_source] = nil
		end)
	else
		print(('esx_drugs: %s attempted to exploit gold processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)





function CancelProcessing(playerID)
	if playersProcessing[playerID] then
		ESX.ClearTimeout(playersProcessing[playerID])
		playersProcessing[playerID] = nil
	end
end

RegisterServerEvent('esx_SellGold:cancelProcessing')
AddEventHandler('esx_SellGold:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('esx:playerDropped', function(playerID, reason)
	CancelProcessing(playerID)
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	CancelProcessing(source)
end)
