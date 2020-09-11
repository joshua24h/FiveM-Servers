local hurt = false
local effect = false

Citizen.CreateThread(function()
	while true do
		Wait(0)

		local ped = GetPlayerPed(-1)

		if GetEntityHealth(ped) <= 165 then
			setHurt()
			
		elseif hurt and GetEntityHealth(ped) > 170 then
			setNotHurt()
			
		end
		
		
		if Config.UseBleed then
			if GetEntityHealth(ped) <= 160 then
				setBleedingOn(ped)
			elseif GetEntityHealth(ped) > 170 then
				setBleedingOff(ped)
			end						
		end
	end
end)
 
function setHurt()
	hurt = true
	RequestAnimSet("move_m@injured")
	SetPedMovementClipset(GetPlayerPed(-1), "move_m@injured", true)
end
 
function setNotHurt()
	hurt = false
	ResetPedMovementClipset(GetPlayerPed(-1))
	ResetPedWeaponMovementClipset(GetPlayerPed(-1))
	ResetPedStrafeClipset(GetPlayerPed(-1))
end

function setBleedingOn(ped)
	SetEntityHealth(ped,GetEntityHealth(ped) - 1 )

	ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.1)
	exports['mythic_notify']:DoHudText('error', 'You are bleeding seek help')
	SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
	Wait(8000)
end
 
function setBleedingOff(ped)
	SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
end