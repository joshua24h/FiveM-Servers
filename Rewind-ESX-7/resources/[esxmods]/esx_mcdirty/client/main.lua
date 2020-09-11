local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local currentTask = {}
local PlayerData              = {}
local GUI                     = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local OnJob                   = false
local TargetCoords            = nil
local Blips                   = {}
local CurrentlyTowedVehicle   = nil

ESX                           = nil
GUI.Time                      = 0


local allowedTowModels = { 
  ['flatbed'] = { x = -0.4, y = -4.0, z = 1.0 }, -- default GTA V flatbed
}

local allowTowingBoats = false -- Set to true if you want to be able to tow boats.
local allowTowingPlanes = false -- Set to true if you want to be able to tow planes.
local allowTowingHelicopters = false -- Set to true if you want to be able to tow helicopters.
local allowTowingTrains = false -- Set to true if you want to be able to tow trains.
local allowTowingTrailers = true -- Disables trailers. NOTE: THIS ALSO DISABLES THE AIRTUG, TOWTRUCK, SADLER, AND ANY OTHER VEHICLE THAT IS IN THE UTILITY CLASS.

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

function OpenMobileActionsMenu()

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'mobile_mcdirty_actions',
    {
      title    = _U('mechanic'),
      align    = 'right',
      elements = {
        {label = _U('tow'),       value = 'dep_vehicle'},
      }
    },
    function(data, menu)

      if data.current.value == 'dep_vehicle' then
        
        local playerped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerped, true)
        
        local isVehicleTow = isVehicleATowTruck(vehicle)
        
        if isVehicleTow then
          
          local coordA = GetEntityCoords(playerped, 1)
          local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 5.0, 0.0)
          local targetVehicle = getVehicleInDirection(coordA, coordB)
          
          
          Citizen.CreateThread(function()
            while true do
              Citizen.Wait(0)
              
              local isVehicleTow = isVehicleATowTruck(vehicle)
              local roll = GetEntityRoll(GetVehiclePedIsIn(PlayerPedId(), true))
              
              if IsEntityUpsidedown(GetVehiclePedIsIn(PlayerPedId(), true)) and isVehicleTow or roll > 70.0 or roll < -70.0 then
                DetachEntity(currentlyTowedVehicle, false, false)
                currentlyTowedVehicle = nil
                exports['mythic_notify']:SendAlert('error', 'Cables holding the vehicle on broke!')
              end        
            end
          end)
          
          if currentlyTowedVehicle == nil then
            if targetVehicle ~= 0 then
              
              local targetVehicleLocation = GetEntityCoords(targetVehicle, true)
              local towTruckVehicleLocation = GetEntityCoords(vehicle, true)
              local distanceBetweenVehicles = GetDistanceBetweenCoords(targetVehicleLocation, towTruckVehicleLocation, false)
              
              if distanceBetweenVehicles > 12.0 then
                exports['mythic_notify']:SendAlert('error', "Your cables can't reach. Move your truck closer")
              else
                local targetModelHash = GetEntityModel(targetVehicle)
                
                if not ((not allowTowingBoats and IsThisModelABoat(targetModelHash)) or (not allowTowingHelicopters and IsThisModelAHeli(targetModelHash)) or (not allowTowingPlanes and IsThisModelAPlane(targetModelHash)) or (not allowTowingTrains and IsThisModelATrain(targetModelHash)) or (not allowTowingTrailers and isTargetVehicleATrailer(targetModelHash))) then 
                  if not IsPedInAnyVehicle(playerped, true) then
                    if vehicle ~= targetVehicle and IsVehicleStopped(vehicle) then
                  
                      TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)

                      exports['progressBars']:startUI(5000, "Attaching Vehicle")
                      Wait(5000)
                      ClearPedTasksImmediately(GetPlayerPed(-1))
                      
                      AttachEntityToEntity(targetVehicle, vehicle, 20, 0.0 + xoff, -1.5 + yoff, 0.0 + zoff, 0, 0, 0, 1, 1, 0, 1, 0, 1)
                      currentlyTowedVehicle = targetVehicle

                      exports['mythic_notify']:SendAlert('inform', _U('vehicle_success_attached'))
                    else
                      exports['mythic_notify']:SendAlert('error', "There is currently no vehicle on the flatbed.")
                    end
                  else
                    exports['mythic_notify']:SendAlert('error', "You need to be outside of your vehicle to load or unload vehicles.")
                  end
                else
                  exports['mythic_notify']:SendAlert('error', "You cannot tow this vehicle")
                end
              end
            else
              exports['mythic_notify']:SendAlert('error', "No towable vehicle detected.")
            end
          elseif IsVehicleStopped(vehicle) then

            TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)
            exports['progressBars']:startUI(5000, "Detaching Vehicle")
            Wait(5000)
            ClearPedTasksImmediately(GetPlayerPed(-1))

            DetachEntity(currentlyTowedVehicle, false, false)
            local vehiclesCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, -11.0, 0.0)
            SetEntityCoords(currentlyTowedVehicle, vehiclesCoords["x"], vehiclesCoords["y"], vehiclesCoords["z"], 1, 0, 0, 1)
            SetVehicleOnGroundProperly(currentlyTowedVehicle)
            currentlyTowedVehicle = nil
            exports['mythic_notify']:SendAlert('inform', _U('veh_det_succ'))
          end
        else
          exports['mythic_notify']:SendAlert('error', "You need a flatbed")
        end
      end

    end,
  function(data, menu)
    menu.close()
  end
  )
end

--tow stuff 

function getVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, PlayerPedId(), 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end

function isTargetVehicleATrailer(modelHash)
  if GetVehicleClassFromName(modelHash) == 11 then
      return true
  else
      return false
  end
end

function isVehicleATowTruck(vehicle)
  local isValid = false
  for model,posOffset in pairs(allowedTowModels) do
      if IsVehicleModel(vehicle, model) then
          xoff = posOffset.x
          yoff = posOffset.y
          zoff = posOffset.z
          isValid = true
          break
      end
  end
  return isValid
end

local xoff = 0.0
local yoff = 0.0
local zoff = 0.0


function setEntityHeadingFromEntity ( vehicle, playerPed )
    local heading = GetEntityHeading(vehicle)
    SetEntityHeading( playerPed, heading )
end

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

AddEventHandler('esx_mcdirtyjob:hasEnteredMarker', function(zone)

  if zone == 'mcdirtyActions' then
    CurrentAction     = 'mcdirty_actions_menu'
    CurrentActionMsg  = _U('open_actions')
    CurrentActionData = {}
  end

  if zone == 'Garage' then
    CurrentAction     = 'mcdirty_harvest_menu'
    CurrentActionMsg  = _U('harvest_menu')
    CurrentActionData = {}
  end

  if zone == 'Craft' then
    CurrentAction     = 'mcdirty_craft_menu'
    CurrentActionMsg  = _U('craft_menu')
    CurrentActionData = {}
  end

  if zone == 'VehicleDeleter' then

    local playerPed = GetPlayerPed(-1)

    if IsPedInAnyVehicle(playerPed,  false) then

      local vehicle = GetVehiclePedIsIn(playerPed,  false)

      CurrentAction     = 'delete_vehicle'
      CurrentActionMsg  = _U('veh_stored')
      CurrentActionData = {vehicle = vehicle}
    end
  end

end)

AddEventHandler('esx_mcdirtyjob:hasExitedMarker', function(zone)

  if zone == 'Garage' then
    TriggerServerEvent('esx_mcdirtyjob:stopHarvest')
    TriggerServerEvent('esx_mcdirtyjob:stopHarvest2')
    TriggerServerEvent('esx_mcdirtyjob:stopHarvest3')
  end

  CurrentAction = nil
  ESX.UI.Menu.CloseAll()
end)

AddEventHandler('esx_mcdirtyjob:hasEnteredEntityZone', function(entity)

  local playerPed = GetPlayerPed(-1)

  if PlayerData.job ~= nil and PlayerData.job.name == 'mcdirty' and not IsPedInAnyVehicle(playerPed, false) then
    CurrentAction     = 'remove_entity'
    CurrentActionMsg  = _U('press_remove_obj')
    CurrentActionData = {entity = entity}
  end

end)

AddEventHandler('esx_mcdirtyjob:hasExitedEntityZone', function(entity)

  if CurrentAction == 'remove_entity' then
    CurrentAction = nil
  end

end)

-- Create Blips
Citizen.CreateThread(function()
  local blip = AddBlipForCoord(Config.Zones.mcdirtyActions.Pos.x, Config.Zones.mcdirtyActions.Pos.y, Config.Zones.mcdirtyActions.Pos.z)
  SetBlipSprite (blip, 446)
  SetBlipDisplay(blip, 4)
  SetBlipScale  (blip, 0.7)
  SetBlipColour (blip, 5)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(_U('mechanic'))
  EndTextCommandSetBlipName(blip)
end)

-- Display markers
Citizen.CreateThread(function()
  while true do
    Wait(0)
    if PlayerData.job ~= nil and PlayerData.job.name == 'mcdirty' then

      local coords = GetEntityCoords(GetPlayerPed(-1))

      for k,v in pairs(Config.Zones) do
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
    if PlayerData.job ~= nil and PlayerData.job.name == 'mcdirty' then
      local coords      = GetEntityCoords(GetPlayerPed(-1))
      local isInMarker  = false
      local currentZone = nil
      for k,v in pairs(Config.Zones) do
        if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
          isInMarker  = true
          currentZone = k
        end
      end
      if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
        HasAlreadyEnteredMarker = true
        LastZone                = currentZone
        TriggerEvent('esx_mcdirtyjob:hasEnteredMarker', currentZone)
      end
      if not isInMarker and HasAlreadyEnteredMarker then
        HasAlreadyEnteredMarker = false
        TriggerEvent('esx_mcdirtyjob:hasExitedMarker', LastZone)
      end
    end
  end
end)

-- Enter / Exit entity zone events
Citizen.CreateThread(function()
	local trackedEntities = {
    'prop_roadcone02a',
    'prop_toolchest_01',
    'prop_barrier_work06a',
	}

	while true do
		Citizen.Wait(500)

		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		local closestDistance = -1
		local closestEntity   = nil

		for i=1, #trackedEntities, 1 do
			local object = GetClosestObjectOfType(coords, 3.0, GetHashKey(trackedEntities[i]), false, false, false)

			if DoesEntityExist(object) then
				local objCoords = GetEntityCoords(object)
				local distance  = GetDistanceBetweenCoords(coords, objCoords, true)

				if closestDistance == -1 or closestDistance > distance then
					closestDistance = distance
					closestEntity   = object
				end
			end
		end

		if closestDistance ~= -1 and closestDistance <= 3.0 then
			if LastEntity ~= closestEntity then
				TriggerEvent('esx_mcdirtyjob:hasEnteredEntityZone', closestEntity)
				LastEntity = closestEntity
			end
		else
			if LastEntity then
				TriggerEvent('esx_mcdirtyjob:hasExitedEntityZone', LastEntity)
				LastEntity = nil
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

          if IsControlJustReleased(0, 38) and PlayerData.job ~= nil and PlayerData.job.name == 'mcdirty' then

            if CurrentAction == 'mcdirty_actions_menu' then
                OpenmcdirtyActionsMenu()
            end

            if CurrentAction == 'delete_vehicle' then
              
              ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
            end

            if CurrentAction == 'remove_entity' then
              DeleteEntity(CurrentActionData.entity)
            end

            CurrentAction = nil
          end
        end

        if IsControlJustReleased(0, Keys['F6']) and PlayerData.job ~= nil and PlayerData.job.name == 'mcdirty' then
            OpenMobileActionsMenu()
        end
    end
end)

function openMechanic()
  if PlayerData.job ~= nil and PlayerData.job.name == 'mcdirty' then
    OpenMobileActionsMenu()
  end
end

function OpenmcdirtyActionsMenu()

  local elements = {
    {label = _U('vehicle_list'), value = 'vehicle_list'},
  }
  if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
    table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
  end

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'mcdirty_actions',
    {
      title    = _U('mechanic'),
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
                  title    = _U('service_vehicle'),
                  align    = 'right',
                  elements = elements,
                },
                function(data, menu)

                  menu.close()

                  local vehicleProps = data.current.value

                  ESX.Game.SpawnVehicle(vehicleProps.model, Config.Zones.VehicleSpawnPoint.Pos, Config.Zones.VehicleSpawnPoint.Heading, function(vehicle)
                    ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
                    local playerPed = GetPlayerPed(-1)

                    local vehNet = NetworkGetNetworkIdFromEntity(vehicle)
                    local plate = GetVehicleNumberPlateText(vehicle)
                    TriggerServerEvent("SOSAY_Locking:GiveKeys", vehNet, plate)

                    TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
                  end)

                  TriggerServerEvent('esx_society:removeVehicleFromGarage', 'mcdirty', vehicleProps)

                end,
                function(data, menu)
                  menu.close()
                end
              )

            end, 'mcdirty')

          else

            local elements = {
              {label = _U('flat_bed'), value = 'flatbed'},
              
            }

            if Config.EnablePlayerManagement and PlayerData.job ~= nil and
              (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'chef' or PlayerData.job.grade_name == 'experimente') then

            end

            ESX.UI.Menu.CloseAll()

            ESX.UI.Menu.Open(
              'default', GetCurrentResourceName(), 'spawn_vehicle',
              {
                title    = _U('service_vehicle'),
                align    = 'right',
                elements = elements
              },
              function(data, menu)
                for i=1, #elements, 1 do
                  if Config.MaxInService == -1 then
                    ESX.Game.SpawnVehicle(data.current.value, Config.Zones.VehicleSpawnPoint.Pos, Config.Zones.VehicleSpawnPoint.Heading, function(vehicle)
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
                        ESX.Game.SpawnVehicle(data.current.value, Config.Zones.VehicleSpawnPoint.Pos, Config.Zones.VehicleSpawnPoint.Heading, function(vehicle)
                          local playerPed = GetPlayerPed(-1)

                          local vehNet = NetworkGetNetworkIdFromEntity(vehicle)
                          local plate = GetVehicleNumberPlateText(vehicle)
                          TriggerServerEvent("SOSAY_Locking:GiveKeys", vehNet, plate)

                          TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
                        end)
                      else
                        ESX.ShowNotification(_U('service_full') .. inServiceCount .. '/' .. maxInService)
                      end
                    end, 'mcdirty')
                    break
                  end
                end
                menu.close()
              end,
              function(data, menu)
                menu.close()
                OpenmcdirtyActionsMenu()
              end
            )

          end
      end
    end,
    function(data, menu)
      menu.close()
      CurrentAction     = 'mcdirty_actions_menu'
      CurrentActionMsg  = _U('open_actions')
      CurrentActionData = {}
    end
  )
end