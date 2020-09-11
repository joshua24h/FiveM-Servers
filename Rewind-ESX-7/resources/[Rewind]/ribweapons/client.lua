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
-- # buy
--

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)

		if GetDistanceBetweenCoords(coords, Config.SpawnGuns.x,Config.SpawnGuns.y,Config.SpawnGuns.z, true) <= 8.5 then
			
			if Config.Draw3D then
				DrawText3D(Config.SpawnGuns, "Press [~r~E~w~] to pay for weapons [$2000]", 2.0)
			else
				ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to pay for weapons [$2000]")
			end
			
			if IsControlJustPressed(0, Keys['E']) then
				TriggerServerEvent('randomevent:e')
			end
		end
	end
end)

RegisterNetEvent('randomevent:f')
AddEventHandler('randomevent:f', function()
	local hash = GetHashKey('ba_prop_battle_crates_wpn_mix_01a')
	local bison = GetHashKey('bison')

	RequestModel(bison)
	RequestModel(hash)
    while not HasModelLoaded(bison) do
        Citizen.Wait(0)
	end
	while not HasModelLoaded(hash) 
	do 
		Citizen.Wait(0) 
	end

	local veh = CreateVehicle(bison, -785.33, 588.43, 126.77, 0.0, false, true)

	TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)

	local object = CreateObject(hash, -785.33, 588.43, 126.77, true, true)

	AttachEntityToEntity(object, veh, GetEntityBoneIndexByName(veh, "boot"), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 1, true)


	blip = AddBlipForCoord(Config.SellGuns.x,Config.SellGuns.y,Config.SellGuns.z)
	SetBlipSprite(blip, 108)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.7)
	SetBlipColour(blip, 2)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Delivery point")
	EndTextCommandSetBlipName(blip)
	SetBlipRoute(blip, true)
	SetBlipRouteColour(blip, 3)
	

	if Config.Announce then
		TriggerServerEvent('randomevent:lol')
	end
end)

--
-- # buy
--


--
-- # sell
--

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)

		if GetDistanceBetweenCoords(coords, Config.SellGuns.x,Config.SellGuns.y,Config.SellGuns.z, true) <= 8.5 then
			
			if Config.Draw3D then
				DrawText3D(Config.SellGuns, "Press [~r~E~w~] to sell gun crate [$10000]", 2.0)
			else
				ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to sell gun crate [$10000]")
			end
			
			if IsControlJustPressed(0, Keys['E']) then
				TriggerServerEvent('randomevent:sell')
			end
		end
	end
end)

RegisterNetEvent('randomevent:sell2')
AddEventHandler('randomevent:sell2', function()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1)
			local playerPed = GetEntityCoords(GetPlayerPed(-1), true)
			local pallets = GetClosestObjectOfType(playerPed, 5.0, GetHashKey("ba_prop_battle_crates_wpn_mix_01a"), false, false, false)
			
			if DoesEntityExist(pallets) then
				SetEntityAsMissionEntity(pallets, 1, 1)
				DeleteEntity(pallets)

				TriggerServerEvent('randomevent:pay')

				RemoveBlip(blip)
			end
		end
	end)
end)

--
-- # sell
--



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