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

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(0)
	  PlayerData = ESX.GetPlayerData()
	end
end)

-- 
-- # FORKLIFT CODE
--

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)

		if GetDistanceBetweenCoords(coords, Config.SpawnLift.x,Config.SpawnLift.y,Config.SpawnLift.z, true) <= 1.5 then
			
			if Config.Draw3D then
				DrawText3D(Config.SpawnLift, "Press [~r~E~w~] to pay for forklift [$500]", 2.0)
			else
				ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to pay for forklift [$500]")
			end
			
			if IsControlJustPressed(0, Keys['E']) then
				TriggerServerEvent('randomevent:1')
			end
		end
	end
end)
	
RegisterNetEvent('randomevent:2')
AddEventHandler('randomevent:2', function()
    RequestModel('forklift')
    while not HasModelLoaded(GetHashKey('forklift')) do
        Citizen.Wait(0)
    end
    local veh = CreateVehicle(GetHashKey('forklift'), 846.34,-2356.78,30.23, 0.0, false, true)
end)

-- 
-- # FORKLIFT CODE
--


-- 
-- # PALLET CODE
--
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)

		if GetDistanceBetweenCoords(coords, Config.SpawnPallet.x,Config.SpawnPallet.y,Config.SpawnPallet.z, true) <= 1.5 then
			
			if Config.Draw3D then
				DrawText3D(Config.SpawnPallet, "Press [~r~E~w~] to pay for pallet [$20]", 2.0)
			else
				ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to pay for pallet [$20]")
			end
			
			if IsControlJustPressed(0, Keys['E']) then
				TriggerServerEvent('randomevent:3')
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)

		if GetDistanceBetweenCoords(coords, Config.SellPallet.x,Config.SellPallet.y,Config.SellPallet.z, true) <= 1.5 then
			
			if Config.Draw3D then
				DrawText3D(Config.SellPallet, "Press [~r~E~w~] to sell pallet [$1000]", 2.0)
			else
				ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to sell pallet [$1000]")
			end
			
			if IsControlJustPressed(0, Keys['E']) then
				TriggerServerEvent('randomevent:5')
			end
		end
	end
end)
	
RegisterNetEvent('randomevent:4')
AddEventHandler('randomevent:4', function()
	local hash = GetHashKey('prop_pallet_01a')

	RequestModel(hash)
	while not HasModelLoaded(hash) 
	do 
		Citizen.Wait(0) 
	end
	
	local pos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 0.5, -1.0)
	object = CreateObject(hash, pos.x, pos.y, pos.z, true, true)
	SetEntityCanBeDamaged(object,true)
	SetEntityDynamic(object,true)
end)


RegisterNetEvent('randomevent:6')
AddEventHandler('randomevent:6', function()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1)
			local playerPed = GetEntityCoords(GetPlayerPed(-1), true)
			local pallets = GetClosestObjectOfType(playerPed, 10.0, GetHashKey("prop_pallet_01a"), false, false, false)
			
			if DoesEntityExist(pallets) then
				SetEntityAsMissionEntity(pallets, 1, 1)
				DeleteEntity(pallets)

				TriggerServerEvent('randomevent:7')
			end
		end
	end)
end)

-- 
-- # PALLET CODE
--


-- Create blips
Citizen.CreateThread(function()

	for k,v in pairs(Config.Palletline) do
  
	  local blip = AddBlipForCoord(v.Blip.Pos.x, v.Blip.Pos.y, v.Blip.Pos.z)
  
	  SetBlipSprite (blip, v.Blip.Sprite)
	  SetBlipDisplay(blip, v.Blip.Display)
	  SetBlipScale  (blip, v.Blip.Scale)
	  SetBlipColour (blip, v.Blip.Colour)
	  SetBlipAsShortRange(blip, true)
  
	  BeginTextCommandSetBlipName("STRING")
	  AddTextComponentString("Palletline")
	  EndTextCommandSetBlipName(blip)
	end
end)

-- Create blips
Citizen.CreateThread(function()

	for k,v in pairs(Config.PalletSale) do
  
	  local blip2 = AddBlipForCoord(v.Blip.Pos.x, v.Blip.Pos.y, v.Blip.Pos.z)
  
	  SetBlipSprite (blip2, v.Blip.Sprite)
	  SetBlipDisplay(blip2, v.Blip.Display)
	  SetBlipScale  (blip2, v.Blip.Scale)
	  SetBlipColour (blip2, v.Blip.Colour)
	  SetBlipAsShortRange(blip2, true)
  
	  BeginTextCommandSetBlipName("STRING")
	  AddTextComponentString("Construction Site")
	  EndTextCommandSetBlipName(blip2)
	end
end)

function DrawText3D(coords, text, size)
	local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)
	local camCoords      = GetGameplayCamCoords()
	local dist           = GetDistanceBetweenCoords(camCoords, coords.x, coords.y, coords.z, true)


	if size == nil then
		size = 1
	end

	local scale = (size / dist) * 2
	local fov   = (1 / GetGameplayCamFov()) * 100
	local scale = scale * fov

	if onScreen then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(x,y)
		local factor = (string.len(text)) / 370
		DrawRect(x,y+0.0125, 0.015+ factor, 0.03, 1, 1, 1, 68)
	end
end