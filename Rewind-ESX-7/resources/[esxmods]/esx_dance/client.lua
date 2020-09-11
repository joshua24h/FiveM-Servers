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


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)

		if GetDistanceBetweenCoords(coords, Config.BuyDance.x,Config.BuyDance.y,Config.BuyDance.z, true) <= 1.5 then
			
			if Config.Draw3D then
				DrawText3D(Config.BuyDance, "Press [~r~E~w~] to pay for lapdance [$500]", 2.0)
			else
				ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to pay for lapdance [$500]")
			end
			
			if IsControlJustPressed(0, Keys['E']) then
				TriggerServerEvent('randomevent:a')
			end
		end
	end
end)

RegisterNetEvent('randomevent:b')
AddEventHandler('randomevent:b', function()
	local ped = PlayerPedId()
	local dict = "timetable@ron@ig_5_p3"
	local dict2 = "mp_safehouse"
	local modelHash = GetHashKey("s_f_y_stripper_01")

	TaskGoStraightToCoord(ped, 118.85, -1302.156, 29.269, 1.0, -1, 33.343, 0)


	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Wait(100)
	end

	RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        RequestModel(modelHash)
        Citizen.Wait(500)
	end

	RequestAnimDict(dict2)
	while not HasAnimDictLoaded(dict2) do
		Wait(100)
	end

	dancer = CreatePed(25, modelHash, 114.553, -1294.932, 29.269, 28.264, 0, 0)

	Wait(5100)

	TaskPlayAnim(ped, dict, "ig_5_p3_base", 8.0, -8.0, -1, 1, 0, false, false, false)
	SetEntityHeading(ped, 33.343)
	
	TaskGoStraightToCoord(dancer, 118.582, -1301.612, 29.27, 1.0, -1, 205.564, 0)

	Wait(10000)
	
	TaskPlayAnim(dancer, dict2, "lap_dance_girl", 8.0, -8.0, -1, 1, 0, false, false, false)

	Wait(Config.DanceTime)
	ClearPedTasks(dancer)
	DeleteEntity(dancer)

	ClearPedTasks(ped)
	ESX.ShowNotification("Dance is over perv get outta here!")
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