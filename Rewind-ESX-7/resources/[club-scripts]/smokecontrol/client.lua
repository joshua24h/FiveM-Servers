local effect_time = 30   -- how long it lasts in seconds
local spam_timer = 29    -- prevent spam ( in seconds )
local SIZE = 1.0         -- size of smoke 




local particleDict = "core"
local particleName = "exp_grd_flare"


local timer_finished = true
local coords
local ped
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        ped = GetPlayerPed(PlayerId())
        coords = GetEntityCoords(ped)

        if GetDistanceBetweenCoords(coords, Config.SmokeSwitch.x,Config.SmokeSwitch.y,Config.SmokeSwitch.z, true) <= 2.5 then
            DrawText3D(Config.SmokeSwitch, "Press [~r~E~w~] for smoke", 2.5)

            
            if IsControlJustPressed(0, 38) then
                timer_finished = false
                TriggerServerEvent("flare:SyncStartParticles")
                timer()
            end
        end
    end
end)


RegisterNetEvent("flare:StartParticles")
AddEventHandler("flare:StartParticles", function()
    local loopAmount = 80
    local particleEffects = {}

    for x=0,loopAmount do

        UseParticleFxAssetNextCall(particleDict)
        local particle = StartParticleFxLoopedAtCoord(particleName, 189.836, -972.735, 29.727, 0, 0, 0, SIZE, false, false, false, 0)        
         
        SetParticleFxLoopedEvolution(particle, particleName, SIZE, true)

        table.insert(particleEffects, 1, particle)
        Citizen.Wait(0)
    end
    

    Citizen.Wait(effect_time * 1000)
    for _,particle in pairs(particleEffects) do
        StopParticleFxLooped(particle, true)
    end
end)

RegisterNetEvent("flare:StartParticles2")
AddEventHandler("flare:StartParticles2", function()
    local loopAmount2 = 80
    local particleEffects2 = {}

    for x=0,loopAmount2 do

        UseParticleFxAssetNextCall(particleDict)
        local particle2 = StartParticleFxLoopedAtCoord(particleName, 186.327, -975.194, 29.727, 0, 0, 0, SIZE, false, false, false, 0)        
         
        SetParticleFxLoopedEvolution(particle2, particleName, SIZE, true)

        table.insert(particleEffects2, 1, particle2)
        Citizen.Wait(0)
    end
    

    Citizen.Wait(effect_time * 1000)
    for _,particle2 in pairs(particleEffects2) do
        StopParticleFxLooped(particle2, true)
    end
end)

RegisterNetEvent("flare:StartParticles3")
AddEventHandler("flare:StartParticles3", function()
    local loopAmount3 = 80
    local particleEffects3 = {}

    for x=0,loopAmount3 do

        UseParticleFxAssetNextCall(particleDict)
        local particle3 = StartParticleFxLoopedAtCoord(particleName, 185.656, -969.868, 29.635, 0, 0, 0, SIZE, false, false, false, 0)        
         
        SetParticleFxLoopedEvolution(particle3, particleName, SIZE, true)

        table.insert(particleEffects3, 1, particle3)
        Citizen.Wait(0)
    end
    

    Citizen.Wait(effect_time * 1000)
    for _,particle3 in pairs(particleEffects3) do
        StopParticleFxLooped(particle3, true)
    end
end)

function timer()
    local timer = spam_timer
    for i = 1, timer do
        Citizen.Wait(1000)
    end
    timer_finished = true
end

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