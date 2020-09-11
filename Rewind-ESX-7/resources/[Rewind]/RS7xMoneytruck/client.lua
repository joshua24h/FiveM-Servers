
ESX =  nil

local pos = GetEntityCoords(GetPlayerPed(-1),  true)
local s1, s2 = GetStreetNameAtCoord( pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
local street1 = GetStreetNameFromHashKey(s1)
local street2 = GetStreetNameFromHashKey(s2)
local isRobbing = false
local hasRobbed = false
local looting = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

RegisterNetEvent('RS7x:Blip')
AddEventHandler('RS7x:Blip', function(x,y,z)
  Blip = AddBlipForCoord(x,y,z)
    SetBlipSprite(Blip,  477)
    SetBlipColour(Blip,  1)
    SetBlipAlpha(Blip,  250)
    SetBlipDisplay(Blip, 4)
    SetBlipScale(Blip, 0.7)
    SetBlipFlashes(Blip, true)
    SetBlipAsShortRange(Blip,  true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString('Robbery In Progress | Money Truck')
    EndTextCommandSetBlipName(Blip)
    Wait(Config.BlipTimer * 1000)
    RemoveBlip(Blip)
end)

function DrawText3Ds(x,y,z,text)
  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  SetTextScale(0.35, 0.35)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(1)
  AddTextComponentString(text)
  DrawText(_x,_y)
  local factor = (string.len(text)) / 370
  DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

RegisterNetEvent('animation:rob')
AddEventHandler('animation:rob', function()
    local pid = PlayerPedId()
    
    RequestAnimDict("mini@repair")
    
    while (not HasAnimDictLoaded("mini@repair")) do 
        Citizen.Wait(0) 
    end
    
    TaskPlayAnim(pid,"mini@repair","fixing_a_player",-1, -1, -1, 120, 1, 0, 0, 0)

    Citizen.Wait(15000)

    ClearPedTasksImmediately(pid)
    ClearPedTasks(pid)
end)

RegisterNetEvent('RS7x:getReward')
AddEventHandler('RS7x:getReward', function()
  local pos = GetEntityCoords(GetPlayerPed(-1))
  local vehicle = GetClosestVehicle(pos.x, pos.y, pos.z, 5.001, 0, 70)

    if vehicle == GetHashKey('stockade') or GetEntityModel(vehicle) then
      createped()
      pedSpawned = true
      TriggerServerEvent('RS7x:NotifyPolice', street1, street2, pos)
    end
    Citizen.Wait(0)
end)

function Timeout(hasRobbed)
    local timer = Config.Timeout
    while hasRobbed == true do
        Citizen.Wait(1000)

        if timer > 0 then
            timer = timer -1
        end

        if timer == 1 then
            hasRobbed = false
            finished = false
            break
        end
    end
end

RegisterNetEvent('RS7x:robbingtimer')
AddEventHandler('RS7x:robbingtimer', function ()

    if isRobbing == true then
        local timer = Config.Timer

        Citizen.CreateThread(function()
            while timer > 0 and isRobbing do
                Citizen.Wait (1000)

                if  timer > 0 then
                    timer = timer -1
                end

                if timer == 1 then
                    finished = true
                    break
                end
            end
        end)
    end
end)


function PlateCheck(CurPlate, CurrentPlate)
    if CurrentPlate ~= CurPlate then
        return
    else
        looting = true
        TriggerEvent('animation:rob')
        exports['progressBars']:startUI(Config.Timer * 1000, "Grabbing Cash/Items 🤑")
        TriggerServerEvent('RS7x:Payout')
        TriggerEvent('RS7x:robbingtimer')
    end
end

RobbedPlates = {}

Citizen.CreateThread(function()
  while true do

    Citizen.Wait(0)

    local pos = GetEntityCoords(GetPlayerPed(-1))
    local stockade = GetHashKey('stockade')
    local vehicle = GetClosestVehicle(pos.x, pos.y, pos.z, 5.001, stockade, 70)
    local text = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, -4.25, 0.0)
    local dstCheck = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, GetEntityCoords(vehicle), true)
    local Plate = GetVehicleNumberPlateText(vehicle)

    if DoesEntityExist(vehicle) then
        if not isRobbing then
            if dstCheck < 5.0 then

                if IsControlJustReleased(0, 38) and not hasRobbed then
                    if not RobbedPlates[Plate] then
                        CurPlate = GetVehicleNumberPlateText(vehicle)
                        TriggerServerEvent('RS7x:Itemcheck', 1)
                    else
                        exports['mythic_notify']:DoHudText('error', 'This truck appears to be empty (already hit)')
                    end
                end
            end
        end

        if not IsEntityDead(GetPlayerPed(-1)) then

            if pedSpawned == true and vehicle then

                DrawMarker(27, text.x, text.y, text.z, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 255, 0, 0, 100, 0, 0, 0, 0)
                DrawText3Ds(text.x, text.y, text.z, "~r~[E]~w~ To Rob")
                if dstCheck < 5.0 then
                    if IsControlJustReleased(0,38) and not looting then
                        CurrentPlate = GetVehicleNumberPlateText(vehicle)
                        PlateCheck(CurPlate, CurrentPlate)

                    end
                end
                if finished then
                    SetPedAsNoLongerNeeded(guard)
                    SetPedAsNoLongerNeeded(guard2)
                    SetPedAsNoLongerNeeded(guard3)
                    pedSpawned = false
                    isRobbing = false
                    looting = false
                    Timeout(true)
                    RobbedPlates[Plate] = true
                    TriggerServerEvent('RS7x:UpdatePlates', RobbedPlates, Plate)
                    TriggerServerEvent('RS7x:moneytruck_false')
                end
            end
        else
            TriggerServerEvent('RS7x:moneytruck_false')
            Citizen.Wait(Config.Timeout * 1000)
            finished = false
            isRobbing = false
            pedSpawned = false
            looting = false
        end
    else
        Citizen.Wait(500)
    end
    end
end)

RegisterNetEvent('RS7x:newTable')
AddEventHandler('RS7x:newTable', function(UpdatedTable)
    RobbedPlates = UpdatedTable
end)

RegisterNetEvent('RS7x:NotifyPolice')
AddEventHandler('RS7x:NotifyPolice', function(msg)
    exports['mythic_notify']:DoHudText('error', msg)
end)

--[[
function cb1(success, timeremaining)
    if success then
        TriggerEvent('RS7x:getReward')
        Hacking = false
    else
        exports['mythic_notify']:DoHudText('error', 'You failed to hack you need to wait 30 seconds')
        TriggerEvent('mhacking:hide')
        TriggerServerEvent('RS7x:NotifyPolice', street1, street2, pos)
        Hacking = false
        Wait(30 * 1000) -- add a time penalty if failed, so it gives police more time to arrive // feel free to remove
        isRobbing = false
        exports['mythic_notify']:DoHudText('success', 'you can now hit the truck again')
        TriggerServerEvent('RS7x:moneytruck_false')
    end
end
]]

function createped()

    local pos = GetEntityCoords(GetPlayerPed(-1))
    local hashKey = GetHashKey("ig_casey")
    local vehicle = GetClosestVehicle(pos.x, pos.y, pos.z, 5.001, 0, 70)
    local pedType = 5

    RequestModel(hashKey)
    while not HasModelLoaded(hashKey) do
        RequestModel(hashKey)
        Citizen.Wait(500)
    end

    print('Spawning Peds?')

    guard = CreatePedInsideVehicle(vehicle, pedType, hashKey, 0, 1, 1)
    guard2 = CreatePedInsideVehicle(vehicle, pedType, hashKey, 1, 1, 1)
    guard3 =  CreatePedInsideVehicle(vehicle, pedType, hashKey, 2, 1, 1)

  --////////////
  --  Guard 1
  --///////////

    SetPedShootRate(guard,  1)
    SetPedCombatAttributes(guard, 46, true)
    SetPedFleeAttributes(guard, 0, 0)
    SetPedAsEnemy(guard,true)
    SetPedMaxHealth(guard, 100)
    SetPedAlertness(guard, 1)
    SetPedCombatRange(guard, 0)
    SetPedCombatMovement(guard, 3)
    TaskCombatPed(guard, GetPlayerPed(-1), 0,16)
    TaskLeaveVehicle(guard, vehicle, 0)
    GiveWeaponToPed(guard, GetHashKey("WEAPON_STUNGUN"), 5000, true, true)
    SetPedRelationshipGroupHash( guard, GetHashKey("HATES_PLAYER"))

    --////////////
    --  Guard 2
    --///////////
    SetPedShootRate(guard2,  1)
    SetPedCombatAttributes(guard2, 46, true)
    SetPedFleeAttributes(guard2, 0, 0)
    SetPedAsEnemy(guard2,true)
    SetPedMaxHealth(guard2, 100)
    SetPedAlertness(guard2, 1)
    SetPedCombatRange(guard2, 0)
    SetPedCombatMovement(guard2, 3)
    TaskCombatPed(guard2, GetPlayerPed(-1), 0,16)
    TaskLeaveVehicle(guard2, vehicle, 0)
    GiveWeaponToPed(guard2, GetHashKey("WEAPON_STUNGUN"), 5000, true, true)
    SetPedRelationshipGroupHash( guard2, GetHashKey("HATES_PLAYER"))
  
    --////////////
    --  Guard3
    --///////////
    
    SetPedShootRate(guard3,  1)
    SetPedCombatAttributes(guard3, 46, true)
    SetPedFleeAttributes(guard3, 0, 0)
    SetPedAsEnemy(guard3,true)
    SetPedMaxHealth(guard3, 100)
    SetPedAlertness(guard3, 1)
    SetPedCombatRange(guard3, 0)
    SetPedCombatMovement(guard3, 3)
    TaskCombatPed(guard3, GetPlayerPed(-1), 0,16)
    TaskLeaveVehicle(guard3, vehicle, 0)
    GiveWeaponToPed(guard3, GetHashKey("WEAPON_STUNGUN"), 5000, true, true)
    SetPedRelationshipGroupHash( guard3, GetHashKey("HATES_PLAYER"))
end