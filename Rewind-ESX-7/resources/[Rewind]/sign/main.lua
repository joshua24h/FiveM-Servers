local holdingSign = false
local signModel = "prop_cs_protest_sign_01"
local sign_net = nil

RegisterCommand("ribsign",function(source, args)
	ClearPedBloodDamage(PlayerPedId())
	local ad1 = "amb@code_human_wander_drinking@beer@male@base"
	local ad1a = "static"
	local player = GetPlayerPed(-1)
	local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
	local sign = CreateObject(GetHashKey(signModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
	local netid = ObjToNet(sign)


	if (DoesEntityExist(player) and not IsEntityDead(player)) then
		loadAnimDict(ad1)
		RequestModel(GetHashKey(signModel))
		if holdingSign then
			Wait(100)
			ClearPedSecondaryTask(GetPlayerPed(-1))
			DetachEntity(NetToObj(sign_net), 1, 1)
			DeleteEntity(NetToObj(sign_net))
			sign_net = nil
			holdingSign = false
        else
			holdingSign = true
			TaskPlayAnim(player, ad1, ad1a, 8.0, 1.0, -1, 49, 0, 0, 0, 0)
            Wait(500)
			SetNetworkIdExistsOnAllMachines(netid, true)
            SetNetworkIdCanMigrate(netid, false)
			AttachEntityToEntity(sign,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422),0.0,0.0,0.3,0.0,5.0,180.0,1,1,0,1,0,1)
			Wait(120)
			sign_net = netid
		end
	end
end, false)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end
