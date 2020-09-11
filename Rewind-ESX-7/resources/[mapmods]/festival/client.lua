-- Nightclub Girls1

Citizen.CreateThread(function()
    RequestModel(GetHashKey("u_f_y_dancerave_01"))
	
    while not HasModelLoaded(GetHashKey("u_f_y_dancerave_01")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations2) do
			local npc = CreatePed(4, GetHashKey("u_f_y_dancerave_01"), item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			PlaceObjectOnGroundProperly(npc)
			RequestAnimDict("anim@amb@nightclub@mini@dance@dance_solo@female@var_b@")
			while not HasAnimDictLoaded("anim@amb@nightclub@mini@dance@dance_solo@female@var_b@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)	
			TaskPlayAnim(npc,"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@","high_center_up",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
			--TaskPlayAnim(ped, animDictionary, animationName, speed, speedMultiplier, duration, flag, playbackRate, lockX, lockY, lockZ)--
		end
	end
end)

-- Nightclub Girls Cheering
Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_f_y_beach_01"))
	
    while not HasModelLoaded(GetHashKey("a_f_y_beach_01")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations3) do
			local npc = CreatePed(4, 0xc79f6928, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			PlaceObjectOnGroundProperly(npc)
			RequestAnimDict("anim@amb@nightclub@mini@dance@dance_solo@female@var_b@")
			while not HasAnimDictLoaded("anim@amb@nightclub@mini@dance@dance_solo@female@var_b@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@","high_center_up",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Nightclub Girls Partying
Citizen.CreateThread(function()
    RequestModel(GetHashKey("u_m_y_dancerave_01"))
	
    while not HasModelLoaded(GetHashKey("u_m_y_dancerave_01")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations4) do
			local npc = CreatePed(4, "u_m_y_dancerave_01", item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			PlaceObjectOnGroundProperly(npc)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while (not HasAnimDictLoaded("anim@amb@nightclub@peds@")) do			
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"anim@amb@nightclub@peds@","amb_world_human_partying_male_partying_beer_base",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Nightclub Girls Slow
Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_f_y_genhot_01"))
	
    while not HasModelLoaded(GetHashKey("a_f_y_genhot_01")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations5) do
			local npc = CreatePed(4, 0x2f4aec3e, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			PlaceObjectOnGroundProperly(npc)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"anim@amb@nightclub@peds@","mini_strip_club_private_dance_idle_priv_dance_idle",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Nightclub Girls Tops
Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_f_m_beach_01"))
	
    while not HasModelLoaded(GetHashKey("a_f_m_beach_01")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations6) do
			local npc = CreatePed(4, 0x303638a7, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			PlaceObjectOnGroundProperly(npc)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"anim@amb@nightclub@peds@","mini_strip_club_lap_dance_ld_girl_a_song_a_p1",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Nightclub Mens1
Citizen.CreateThread(function()
    RequestModel(GetHashKey("ig_claypain"))
	
    while not HasModelLoaded(GetHashKey("ig_claypain")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations7) do
			local npc = CreatePed(4, 0x9d0087a8, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			PlaceObjectOnGroundProperly(npc)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)	
			TaskPlayAnim(npc,"anim@amb@nightclub@peds@","amb_world_human_partying_male_partying_beer_base",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Nightclub Mens2
Citizen.CreateThread(function()
    RequestModel(GetHashKey("ig_ramp_mex"))
	
    while not HasModelLoaded(GetHashKey("ig_ramp_mex")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations8) do
			local npc = CreatePed(4, 0xe6ac74a4, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			PlaceObjectOnGroundProperly(npc)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)	
			TaskPlayAnim(npc,"anim@amb@nightclub@peds@","amb_world_human_drinking_beer_male_base",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Nightclub Mens3
Citizen.CreateThread(function()
    RequestModel(GetHashKey("u_m_y_babyd"))
	
    while not HasModelLoaded(GetHashKey("u_m_y_babyd")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations9) do
			local npc = CreatePed(4, 0xda116e7e, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			PlaceObjectOnGroundProperly(npc)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"anim@amb@nightclub@peds@","amb_world_human_partying_male_partying_beer_base",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Nightclub Guards
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_chemsec_01"))
	
    while not HasModelLoaded(GetHashKey("s_m_m_chemsec_01")) do
        Wait(1)
    end
	
	if Config.EnableSecurity then
		for _, item in pairs(Config.Locations10) do
			local npc = CreatePed(4, 0x2EFEAFD5, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			PlaceObjectOnGroundProperly(npc)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"anim@amb@nightclub@peds@","amb_world_human_stand_guard_male_base",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

-- Nightclub Solomun
Citizen.CreateThread(function()
    RequestModel(GetHashKey("CSB_Sol"))
	
    while not HasModelLoaded(GetHashKey("CSB_Sol")) do
        Wait(1)
    end
	
	if Config.EnableSolomun then
		for _, item in pairs(Config.Locations11) do
			local npc = CreatePed(4, 0x4EF92B55, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			PlaceObjectOnGroundProperly(npc)
			RequestAnimDict("anim@amb@nightclub@djs@solomun@")
			while not HasAnimDictLoaded("anim@amb@nightclub@djs@solomun@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"anim@amb@nightclub@djs@solomun@","sol_dance_a_sol",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)