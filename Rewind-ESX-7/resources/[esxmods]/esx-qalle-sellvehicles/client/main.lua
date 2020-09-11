local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}

ESX = nil

PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10)

        TriggerEvent("esx:getSharedObject", function(response)
            ESX = response
        end)
    end

    if ESX.IsPlayerLoaded() then
		PlayerData = ESX.GetPlayerData()

		RemoveVehicles()

		Citizen.Wait(500)

		LoadSellPlace()

		SpawnVehicles()
    end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(response)
	PlayerData = response
	
	LoadSellPlace()

	SpawnVehicles()
end)

RegisterNetEvent("esx-qalle-sellvehicles:refreshVehicles")
AddEventHandler("esx-qalle-sellvehicles:refreshVehicles", function()
	RemoveVehicles()

	Citizen.Wait(500)

	SpawnVehicles()
end)

function LoadSellPlace()
	Citizen.CreateThread(function()

		local SellPos = Config.SellPosition

		local Blip = AddBlipForCoord(SellPos["x"], SellPos["y"], SellPos["z"])
		SetBlipSprite (Blip, 147)
		SetBlipDisplay(Blip, 4)
		SetBlipScale  (Blip, 0.7)
		SetBlipColour (Blip, 52)
		SetBlipAsShortRange(Blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("M and L Autos")
		EndTextCommandSetBlipName(Blip)

		while true do
			local sleepThread = 500

			local ped = PlayerPedId()
			local pedCoords = GetEntityCoords(ped)

			local dstCheck = GetDistanceBetweenCoords(pedCoords, SellPos["x"], SellPos["y"], SellPos["z"], true)

			if dstCheck <= 10.0 then
				sleepThread = 5

				if dstCheck <= 5.0 then

					DrawText3D(SellPos["x"], SellPos["y"], SellPos["z"], "[E] Open Menu", 0.4)

					--ESX.Game.Utils.DrawText3D(SellPos, "[E] Open Menu", 0.4)
					
					if IsControlJustPressed(0, 38) then
						if IsPedInAnyVehicle(ped, false) then
							OpenSellMenu(GetVehiclePedIsUsing(ped))
						else
							ESX.ShowNotification("You must sit in a ~g~vehicle")
						end
					end
				end
			end

			for i = 1, #Config.VehiclePositions, 1 do
				if Config.VehiclePositions[i]["entityId"] ~= nil then
					local pedCoords = GetEntityCoords(ped)
					local vehCoords = GetEntityCoords(Config.VehiclePositions[i]["entityId"])

					local dstCheck = GetDistanceBetweenCoords(pedCoords, vehCoords, true)

					if dstCheck <= 10.0 then
						sleepThread = 5

						ESX.Game.Utils.DrawText3D(vehCoords, "[E] " .. Config.VehiclePositions[i]["price"] .. "$", 1.0)

						if IsControlJustPressed(0, 38) then
							if IsPedInVehicle(ped, Config.VehiclePositions[i]["entityId"], false) then
								OpenSellMenu(Config.VehiclePositions[i]["entityId"], Config.VehiclePositions[i]["price"], true, Config.VehiclePositions[i]["owner"])
							else
								ESX.ShowNotification("You must sit in the ~g~vehicle~s~!")
							end
						end
					end
				end
			end

			Citizen.Wait(sleepThread)
		end
	end)
end

function DrawText3D(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
  
	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 255)
	SetTextOutline()
  
	AddTextComponentString(text)
	DrawText(_x, _y)
  
	local factor = (string.len(text)) / 270
	DrawRect(_x, _y + 0.015, 0.005 + factor, 0.03, 31, 31, 31, 155)
  end

function OpenSellMenu(veh, price, buyVehicle, owner)
	local elements = {}

	if not buyVehicle then
		if price ~= nil then
			table.insert(elements, { ["label"] = "Change Price - " .. price .. " $", ["value"] = "price" })
			table.insert(elements, { ["label"] = "Put out for sale", ["value"] = "sell" })
		else
			table.insert(elements, { ["label"] = "Set Price - $", ["value"] = "price" })
		end
	else
		table.insert(elements, { ["label"] = "Buy " .. price .. " - $", ["value"] = "buy" })

		if owner then
			table.insert(elements, { ["label"] = "Remove Vehicle", ["value"] = "remove" })
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'sell_veh',
		{
			title    = "Vehicle Menu",
			align    = 'right',
			elements = elements
		},
	function(data, menu)
		local action = data.current.value

		if action == "price" then
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'sell_veh_price',
				{
					title = "Vehicle Price",
					align    = 'right',
				},
			function(data2, menu2)

				local vehPrice = tonumber(data2.value)

				menu2.close()
				menu.close()

				OpenSellMenu(veh, vehPrice)
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif action == "sell" then
			local vehProps = ESX.Game.GetVehicleProperties(veh)

			ESX.TriggerServerCallback("esx-qalle-sellvehicles:isVehicleValid", function(valid)

				if valid then
					DeleteVehicle(veh)
					ESX.ShowNotification("You put out the ~g~vehicle~s~ for sale - " .. price .. " :-")
					menu.close()
				else
					ESX.ShowNotification("You must ~r~own~s~ the ~g~vehicle!~s~ / it's ~r~already~s~ " .. #Config.VehiclePositions .. " vehicles for sale!")
				end
	
			end, vehProps, price)
		elseif action == "buy" then
			ESX.TriggerServerCallback("esx-qalle-sellvehicles:buyVehicle", function(isPurchasable, totalMoney)
				if isPurchasable then
					DeleteVehicle(veh)
					ESX.ShowNotification("You ~g~bought~s~ the vehicle for " .. price .. " $")
					menu.close()
				else
					ESX.ShowNotification("You ~r~don't~s~ have enough cash, it's missing " .. price - totalMoney .. " $")
				end
			end, ESX.Game.GetVehicleProperties(veh), price)
		elseif action == "remove" then
			ESX.TriggerServerCallback("esx-qalle-sellvehicles:buyVehicle", function(isPurchasable, totalMoney)
				if isPurchasable then
					DeleteVehicle(veh)
					ESX.ShowNotification("You ~g~removed~s~ the vehicle")
					menu.close()
				end
			end, ESX.Game.GetVehicleProperties(veh), 0)
		end
		
	end, function(data, menu)
		menu.close()
	end)
end

function RemoveVehicles()
	local VehPos = Config.VehiclePositions

	for i = 1, #VehPos, 1 do
		local veh, distance = ESX.Game.GetClosestVehicle(VehPos[i])

		if DoesEntityExist(veh) and distance <= 1.0 then
			DeleteEntity(veh)
		end
	end
end

function SpawnVehicles()
	local VehPos = Config.VehiclePositions

	ESX.TriggerServerCallback("esx-qalle-sellvehicles:retrieveVehicles", function(vehicles)
		for i = 1, #vehicles, 1 do

			local vehicleProps = vehicles[i]["vehProps"]

			LoadModel(vehicleProps["model"])

			VehPos[i]["entityId"] = CreateVehicle(vehicleProps["model"], VehPos[i]["x"], VehPos[i]["y"], VehPos[i]["z"] - 0.575, VehPos[i]["h"], false)
			VehPos[i]["price"] = vehicles[i]["price"]
			VehPos[i]["owner"] = vehicles[i]["owner"]

			ESX.Game.SetVehicleProperties(VehPos[i]["entityId"], vehicleProps)

			FreezeEntityPosition(VehPos[i]["entityId"], true)

			SetEntityAsMissionEntity(VehPos[i]["entityId"], true, true)
			SetModelAsNoLongerNeeded(vehicleProps["model"])
		end
	end)

end

LoadModel = function(model)
	while not HasModelLoaded(model) do
		RequestModel(model)

		Citizen.Wait(1)
	end
end


AddEventHandler('esx_sellvehicles:hasEnteredMarker', function(zone)

	if zone == 'DealerActions' then
	  CurrentAction     = 'vehicle_actions_menu'
	  CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to access the menu.'
	  CurrentActionData = {}
	end
  
end)
  
AddEventHandler('esx_sellvehicles:hasExitedMarker', function(zone)
    
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
	  Wait(0)
	  if PlayerData.job ~= nil and PlayerData.job.name == 'dealer' then
  
		local coords = GetEntityCoords(GetPlayerPed(-1))
  
		for k,v in pairs(Config.Zone) do
		  if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
			DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
		  end
		end
	  end
	end
  end)
  
  -- Enter / Exit marker events
  Citizen.CreateThread(function()
	while true do
	  Wait(0)
	  if PlayerData.job ~= nil and PlayerData.job.name == 'dealer' then
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil
		for k,v in pairs(Config.Zone) do
		  if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
			isInMarker  = true
			currentZone = k
		  end
		end
		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
		  HasAlreadyEnteredMarker = true
		  LastZone                = currentZone
		  TriggerEvent('esx_sellvehicles:hasEnteredMarker', currentZone)
		end
		if not isInMarker and HasAlreadyEnteredMarker then
		  HasAlreadyEnteredMarker = false
		  TriggerEvent('esx_sellvehicles:hasExitedMarker', LastZone)
		end
	  end
	end
end)
 
-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if CurrentAction ~= nil then
			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			
			if IsControlJustReleased(0, 38) and PlayerData.job ~= nil and PlayerData.job.name == 'dealer' then
				
				if CurrentAction == 'vehicle_actions_menu' then
					OpenActionsMenu()
				end

				CurrentAction = nil
			end
		end
	end
end)

function OpenActionsMenu()

	local elements = {
	  {label = "vehicle List", value = 'vehicle_list'},
	  {label = 'deposit stock', value = 'put_stock'},
	  {label = 'withdraw stock', value = 'get_stock'}
	}
	if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
	  table.insert(elements, {label = 'boss actions', value = 'boss_actions'})
	end
  
	ESX.UI.Menu.CloseAll()
  
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'dealer_actions',
	  {
		title    = 'dealer',
		align    = 'right',
		elements = elements
	  },
	  function(data, menu)
		if data.current.value == 'vehicle_list' then
  
		  if Config.EnableSocietyOwnedVehicles then
  
			  local elements = {}
  
			  ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(vehicles)
  
				for i=1, #vehicles, 1 do
				  table.insert(elements, {label = GetDisplayNameFromVehicleModel(vehicles[i].model) .. ' [' .. vehicles[i].plate .. ']', value = vehicles[i]})
				end
  
				ESX.UI.Menu.Open(
				  'default', GetCurrentResourceName(), 'vehicle_spawner',
				  {
					title    = 'service Vehicle',
					align    = 'right',
					elements = elements,
				  },
				  function(data, menu)
  
					menu.close()
  
					local vehicleProps = data.current.value
  
					ESX.Game.SpawnVehicle(vehicleProps.model, Config.Zone.VehicleSpawnPoint.Pos, Config.Zone.VehicleSpawnPoint.Heading, function(vehicle)
					  ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
					  local playerPed = GetPlayerPed(-1)
  
					  local vehNet = NetworkGetNetworkIdFromEntity(vehicle)
					  local plate = GetVehicleNumberPlateText(vehicle)
					  TriggerServerEvent("SOSAY_Locking:GiveKeys", vehNet, plate)
  
					  TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
					end)
  
					TriggerServerEvent('esx_society:removeVehicleFromGarage', 'dealer', vehicleProps)
  
				  end,
				  function(data, menu)
					menu.close()
				  end
				)
  
			  end, 'dealer')
  
			else
  
			  local elements = {
				{label = ('Pickup'), value = 'bison'},			
			  }
  
			  if Config.EnablePlayerManagement and PlayerData.job ~= nil and
				(PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'chef' or PlayerData.job.grade_name == 'experimente') then
				table.insert(elements, {label = 'SlamVan', value = 'slamvan3'})
				table.insert(elements, {label = 'Pickup', value = 'bison'})
			  end
  
			  ESX.UI.Menu.CloseAll()
  
			  ESX.UI.Menu.Open(
				'default', GetCurrentResourceName(), 'spawn_vehicle',
				{
				  title    = 'service vehicle',
				  align    = 'right',
				  elements = elements
				},
				function(data, menu)
				  for i=1, #elements, 1 do
					if Config.MaxInService == -1 then
					  ESX.Game.SpawnVehicle(data.current.value, Config.Zone.VehicleSpawnPoint.Pos, Config.Zone.VehicleSpawnPoint.Heading, function(vehicle)
						local playerPed = GetPlayerPed(-1)
  
						local vehNet = NetworkGetNetworkIdFromEntity(vehicle)
						local plate = GetVehicleNumberPlateText(vehicle)
						TriggerServerEvent("SOSAY_Locking:GiveKeys", vehNet, plate)
  
						TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
					  end)
					  break
					else
					  ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
						if canTakeService then
						  ESX.Game.SpawnVehicle(data.current.value, Config.Zone.VehicleSpawnPoint.Pos, Config.Zone.VehicleSpawnPoint.Heading, function(vehicle)
							local playerPed = GetPlayerPed(-1)
  
							local vehNet = NetworkGetNetworkIdFromEntity(vehicle)
							local plate = GetVehicleNumberPlateText(vehicle)
							TriggerServerEvent("SOSAY_Locking:GiveKeys", vehNet, plate)
  
							TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
						  end)
						else
						  ESX.ShowNotification('service full' .. inServiceCount .. '/' .. maxInService)
						end
					  end, 'dealer')
					  break
					end
				  end
				  menu.close()
				end,
				function(data, menu)
				  menu.close()
				  OpenActionsMenu()
				end
			  )
  
			end
		end
  
		if data.current.value == 'put_stock' then
		  OpenPutStocksMenu()
		end
  
		if data.current.value == 'get_stock' then
		  OpenGetStocksMenu()
		end
  
		if data.current.value == 'boss_actions' then
		  TriggerEvent('esx_society:openBossMenu', 'dealer', function(data, menu)
			menu.close()
		  end)
		end
  
	  end,
	  function(data, menu)
		menu.close()
		CurrentAction     = 'vehicle_actions_menu'
		CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to access the menu.'
		CurrentActionData = {}
	  end
	)
end

function OpenGetStocksMenu()

	ESX.TriggerServerCallback('esx_sellvehicles:getStockItems', function(items)
  
	  print(json.encode(items))
  
	  local elements = {}
  
	  for i=1, #items, 1 do
		table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
	  end
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'stocks_menu',
		{
		  title    = 'stock',
		  align    = 'right',
		  elements = elements
		},
		function(data, menu)
  
		  local itemName = data.current.value
  
		  ESX.UI.Menu.Open(
			'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
			{
			  title = _U('quantity')
			},
			function(data2, menu2)
  
			  local count = tonumber(data2.value)
  
			  if count == nil then
				ESX.ShowNotification('invalid quantity')
			  else
				menu2.close()
				menu.close()
				OpenGetStocksMenu()
  
				TriggerServerEvent('esx_sellvehicles:getStockItem', itemName, count)
			  end
  
			end,
			function(data2, menu2)
			  menu2.close()
			end
		  )
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
  
	end)
  
  end
  
  function OpenPutStocksMenu()
  
   ESX.TriggerServerCallback('esx_sellvehicles:getPlayerInventory', function(inventory)
  
	  local elements = {}
  
	  for i=1, #inventory.items, 1 do
  
		local item = inventory.items[i]
  
		if item.count > 0 then
		  table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
		end
  
	  end
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'stocks_menu',
		{
		  title    = 'inventory',
		  align    = 'right',
		  elements = elements
		},
		function(data, menu)
  
		  local itemName = data.current.value
  
		  ESX.UI.Menu.Open(
			'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
			{
			  title = 'quantity'
			},
			function(data2, menu2)
  
			  local count = tonumber(data2.value)
  
			  if count == nil then
				ESX.ShowNotification('invalid quantity')
			  else
				menu2.close()
				menu.close()
				OpenPutStocksMenu()
  
				TriggerServerEvent('esx_sellvehicles:putStockItems', itemName, count)
			  end
  
			end,
			function(data2, menu2)
			  menu2.close()
			end
		  )
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
  
	end)
  
  end