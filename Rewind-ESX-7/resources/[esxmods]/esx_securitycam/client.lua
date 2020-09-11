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


CamLocations = {
	[1] =  { ['x'] = 2809.25,['y'] = 1530.859,['z'] = 34.662,['h'] = 298.664, ['info'] = ' Power Station ', ["recent"] = false },
	[2] =  { ['x'] = 449.483,['y'] = -981.869,['z'] = 31.688 ,['h'] = 150.403, ['info'] = ' PD ', ["recent"] = false },
	[3] =  { ['x'] = 148.989,['y'] = -1036.292,['z'] = 29.342,['h'] = 325.863, ['info'] = ' Legion', ["recent"] = false },
}

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(0)
	  PlayerData = ESX.GetPlayerData()
	end
end)

RegisterCommand("polcam", function (source, args, rawCommand)

	local cam = args[1]

	local xPlayer = ESX.GetPlayerData()
	local job = xPlayer.job
	local jobname = xPlayer.job.name
	if job and jobname == 'police' then
		TriggerEvent('cctv:camera', cam)
	end

end)

inCam = false
cam = 0
RegisterNetEvent("cctv:camera")
AddEventHandler("cctv:camera", function(camNumber)
	camNumber = tonumber(camNumber)
	if inCam then
		inCam = false
		PlaySoundFrontend(-1, "HACKING_SUCCESS", false)
		Wait(250)
		ClearPedTasks(GetPlayerPed(-1))
	else
		if camNumber > 0 and camNumber < #CamLocations+1 then
			PlaySoundFrontend(-1, "HACKING_SUCCESS", false)
			TriggerEvent("cctv:startcamera",camNumber)
		else
			exports['mythic_notify']:SendAlert('error', "This camera appears to be faulty")
		end
	end
end)

RegisterNetEvent("cctv:startcamera")
AddEventHandler("cctv:startcamera", function(camNumber)
	local camNumber = tonumber(camNumber)
	local x = CamLocations[camNumber]["x"]
	local y = CamLocations[camNumber]["y"]
	local z = CamLocations[camNumber]["z"]
	local h = CamLocations[camNumber]["h"]

	inCam = true

	SetTimecycleModifier("heliGunCam")
	SetTimecycleModifierStrength(1.0)

	cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
	SetCamCoord(cam,x,y,z+1.2)						
	SetCamRot(cam, -15.0,0.0,h)
	SetCamFov(cam, 110.0)
	RenderScriptCams(true, false, 0, 1, 0)
	SetFocusArea(x, y, z, 0.0, 0.0, 0.0)

	while inCam do
		SetCamCoord(cam,x,y,z+1.2)
		FreezeEntityPosition(GetPlayerPed(-1), true)					
		Citizen.Wait(1)
	end
	
	ClearFocus()
	ClearTimecycleModifier()
	RenderScriptCams(false, false, 0, 1, 0)
	SetScaleformMovieAsNoLongerNeeded(scaleform)
	DestroyCam(cam, false)
	SetNightvision(false)
	SetSeethrough(false)
	FreezeEntityPosition(GetPlayerPed(-1), false)

end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if inCam then

			local rota = GetCamRot(cam, 2)

			if IsControlPressed(1, Keys['A']) then
				SetCamRot(cam, rota.x, 0.0, rota.z + 0.7, 2)
			end

			if IsControlPressed(1, Keys['D']) then
				SetCamRot(cam, rota.x, 0.0, rota.z - 0.7, 2)
			end

			if IsControlPressed(1, Keys['W']) then
				SetCamRot(cam, rota.x + 0.7, 0.0, rota.z, 2)
			end

			if IsControlPressed(1, Keys['S']) then
				SetCamRot(cam, rota.x - 0.7, 0.0, rota.z, 2)
			end

			if IsControlPressed(1, Keys['E']) then
				SetSeethrough(true)
			end

			if IsControlPressed(1, Keys['Q']) then
				SetNightvision(true)
			end

			if IsControlPressed(1, Keys['R']) then
				SetSeethrough(false)
				SetNightvision(false)
			end
		end
	end
end)