local ESX = nil
local robbableItems = {
 [1] = {chance = 9, id = 0, name = 'Cash', quantity = math.random(10, 900)}, -- really common
 [2] = {chance = 19, id = 'WEAPON_PISTOL', name = 'Pistol', quantity = 1}, -- rare
 [3] = {chance = 14, id = 'tuning_laptop', name = 'Tuner Laptop', quantity = 1}, -- rare
 [4] = {chance = 15, id = 'armor', name = 'Armour', quantity =  math.random(1, 2)}, -- common
 [5] = {chance = 10, id = 'bandage', name = 'Bandage', quantity = math.random(1, 2)}, -- common
 [6] = {chance = 10, id = 'armor2', name = 'Armour', quantity = math.random(1, 2)}, -- common
 [7] = {chance = 10, id = 'binoculars', name = 'Binoculars', quantity = 1}, -- common
 [8] = {chance = 10, id = 'blowpipe', name = 'Mech Lockpick', quantity = math.random(1, 2)}, -- rare
 [9] = {chance = 10, id = 'keycard', name = 'keycard', quantity = 1}, -- rare
 [10] = {chance= 10, id = 'advancedlockpick', name = 'Multi-pick', quantity = math.random(1, 2)}, -- rare
 [11] = {chance = 9, id = 'cannabinoid', name = 'chemicals', quantity = math.random(1, 5)}, -- rare
 [12] = {chance = 9, id = 'cannabis', name = 'Cannabis Plant', quantity = 2}, -- rare
 [14] = {chance = 10, id = 'coke', name = 'Cocaine', quantity = 3}, -- common
 [15] = {chance = 9, id = 'goldNecklace', name = 'Gold Necklace', quantity = 1}, -- rare
 [17] = {chance = 8, id = 'highradio', name = 'Aftermarket Radio', quantity = 1}, -- rare
 [18] = {chance = 10, id = 'jewels', name = 'Jewels', quantity = math.random(1, 5)}, -- rare
 [19] = {chance = 10, id = 'laptop', name = 'Laptop', quantity = 1}, -- rare
 [20] = {chance = 5, id = 'carokit', name = 'Body kit', quantity = math.random(1, 5)}, -- common
 [21] = {chance = 5, id = 'lowradio', name = 'Stock Radio', quantity = 2},
 [22] = {chance = 4, id = 'gold_o', name = 'scrap gold', quantity = 2}, 
 [23] = {chance = 3, id = 'marijuana', name = 'Bag of Weed', quantity = math.random(1, 5)}, 
 [25] = {chance = 9, id = 'oxygen_mask', name = 'Oxygen Mask', quantity = 1}, 
 [26] = {chance = 4, id = 'ring', name = 'Ring', quantity = 2}, 
 [27] = {chance = 7, id = 'rolex', name = 'Rolex', quantity = math.random(1, 5)}, 
 [29] = {chance = 7, id = 'samsungS10', name = 'Samsung Phone', quantity = 2}, 
 [30] = {chance = 9, id = 'spice', name = 'Bag of spice', quantity = 2}, 
 [31] = {chance = 7, id = 'copper', name = 'copper', quantity = 1},
 [32] = {chance = 10, id = 'WEAPON_KNIFE', name = 'Combat knife', quantity = 1},
 [33] = {chance = 12, id = 'WEAPON_PIPEBOMB', name = 'Homemade bomb', quantity = math.random(1, 5)}, 

}

--[[chance = 1 is very common, the higher the value the less the chance]]--

TriggerEvent('esx:getSharedObject', function(obj)
 ESX = obj
end)

ESX.RegisterUsableItem('advancedlockpick', function(source) --Hammer high time to unlock but 100% call cops
 local source = tonumber(source)
 local xPlayer = ESX.GetPlayerFromId(source)
 TriggerClientEvent('houseRobberies:attempt', source, xPlayer.getInventoryItem('advancedlockpick').count)
end)

RegisterServerEvent('houseRobberies:removeLockpick')
AddEventHandler('houseRobberies:removeLockpick', function()
 local source = tonumber(source)
 local xPlayer = ESX.GetPlayerFromId(source)
 xPlayer.removeInventoryItem('advancedlockpick', 1)
 --TriggerClientEvent('chatMessage', source, '^1Your lockpick has bent out of shape')
 TriggerClientEvent('notification', source, 'The lockpick bent out of shape.', 2)
end)

RegisterServerEvent('houseRobberies:giveMoney')
AddEventHandler('houseRobberies:giveMoney', function()
 local source = tonumber(source)
 local xPlayer = ESX.GetPlayerFromId(source)
 local cash = math.random(5000, 20000)
 xPlayer.addMoney(cash)
 --TriggerClientEvent('chatMessage', source, '^4You have found $'..cash)
 TriggerClientEvent('notification', source, 'You found $'..cash)
end)


RegisterServerEvent('houseRobberies:searchItem')
AddEventHandler('houseRobberies:searchItem', function()
 local source = tonumber(source)
 local item = {}
 local xPlayer = ESX.GetPlayerFromId(source)
 local gotID = {}


 for i=1, math.random(1, 2) do
  item = robbableItems[math.random(1, #robbableItems)]
  if math.random(1, 10) >= item.chance then
   if tonumber(item.id) == 0 and not gotID[item.id] then
    gotID[item.id] = true
    xPlayer.addMoney(item.quantity)
    --TriggerClientEvent('chatMessage', source, 'You found $'..item.quantity)
    TriggerClientEvent('notification', source, 'You found $'..item.quantity)
   elseif item.isWeapon and not gotID[item.id] then
    gotID[item.id] = true
    xPlayer.addWeapon(item.id, 50)
    --TriggerClientEvent('chatMessage', source, 'You found a '..item.name)
    TriggerClientEvent('notification', source, 'Item Added!', 2)
   elseif not gotID[item.id] then
    gotID[item.id] = true
    xPlayer.addInventoryItem(item.id, item.quantity)
    --TriggerClientEvent('chatMessage', source, 'You have found '..item.quantity..'x '..item.name)
    TriggerClientEvent('notification', source, 'Item Added!', 2)
   end
  end
 end
end)
