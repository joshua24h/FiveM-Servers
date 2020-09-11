ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx:lol')
AddEventHandler('esx:lol', function(type, itemName, itemCount)
	local _source = source

	local xPlayer = ESX.GetPlayerFromId(source)
	local playerCash = xPlayer.getMoney()

	if (itemCount > playerCash or playerCash < 1) then
		print("no drop")
	else
		xPlayer.removeMoney(itemCount)

		local pickupLabel = ('~y~%s~s~ [~g~%s~s~]'):format(_U('cash'), _U('locale_currency', ESX.Math.GroupDigits(itemCount)))
		ESX.CreatePickup('item_money', 'money', itemCount, pickupLabel, _source)
	end
end)

