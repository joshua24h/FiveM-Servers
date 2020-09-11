local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

ESX                           = nil
local PlayerData                = {}
local menuIsShowed 				 = false
local hasAlreadyEnteredMarker 	 = false
local hasAlreadyEnteredMarkerr 	 = false
local lastZone 					 = nil
local isInJoblistingMarker 		 = false
local isInJoblistingMarkerr 		 = false
local bet = 0
local wtrakcie = false
local model = "prop_bucket_02a"
local bagModel = "prop_bucket_02a"
local bagspawned = nil
local maitem = false
local tekst = 0
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	
	Citizen.Wait(5000)

end)

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(10)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		if (GetDistanceBetweenCoords(coords, Config.CowField.x, Config.CowField.y, Config.CowField.z, true) < 30.0)  then
			
			ESX.Game.Utils.DrawText3D({ x = 2441.06, y = 4755.05, z = 33.85 }, '~y~[E] ~w~Milk a cow', 0.6)		
			ESX.Game.Utils.DrawText3D({ x = 2443.96, y = 4764.95, z = 33.85 }, '~y~[E] ~w~Milk a cow', 0.6)	
			ESX.Game.Utils.DrawText3D({ x = 2434.870, y = 4764.150, z = 33.80 }, '~y~[E] ~w~Milk a cow', 0.6)				
			ESX.Game.Utils.DrawText3D({ x = 2430.76, y = 4773.95, z = 33.85 }, '~y~[E] ~w~Milk a cow', 0.6)
		
		end
	end
end)

--[[
local blips = {
	
	{title="Cows", colour=4, id=141, Config.CowField.x, Config.CowField.y, Config.CowField.z},
--	{title="Dairy dressing room", colour=4, id=366, x = 2512.990, y = 4762.750, z = 34.90}, not in
	{title="Dairy machine", colour=4, id=402, Config.DairySell.x, Config.DairySell.y, Config.DairySell.z}

}   
]]

Citizen.CreateThread(function()
	if Config.Blips then
		for _, info in pairs(Config.BlipLocations) do
			info.blip = AddBlipForCoord(info.x, info.y, info.z)
	 		SetBlipSprite(info.blip, info.id)
	 		SetBlipDisplay(info.blip, 4)
	 		SetBlipScale(info.blip, 0.7)
	 		SetBlipColour(info.blip, info.colour)
	 		SetBlipAsShortRange(info.blip, true)
	 		BeginTextCommandSetBlipName("STRING")
	 		AddTextComponentString(info.title)
	 		EndTextCommandSetBlipName(info.blip)
		end
	end
end)

Citizen.CreateThread(function()
	while true do

		Wait(15)
		local coords      = GetEntityCoords(GetPlayerPed(-1))


		if(GetDistanceBetweenCoords(coords, Config.CowField.x, Config.CowField.y, Config.CowField.z, true) < 2.0) then


			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil
			local zaplata = 0
		
			if ESX.GetPlayerData().job.name == 'krowa' then
			
				if IsControlJustReleased(0, Keys['E']) then
					if wtrakcie == false then
						zbieranie()
					end
				end
			end
		end -- od getdistance
	end -- od while
end)

function zbieranie()
TriggerServerEvent('smerfikcraft:zlomiarzzbier2')
wtrakcie = true
end
RegisterNetEvent('wiadro:postaw')
AddEventHandler('wiadro:postaw', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	local forward   = GetEntityForwardVector(playerPed)
	local x, y, z   = table.unpack(coords + forward * 1.0)
if maitem == false then
	ESX.Game.SpawnObject(model, {
		x = x,
		y = y,
		z = z
	}, function(obj)
		SetEntityHeading(obj, GetEntityHeading(playerPed))
		PlaceObjectOnGroundProperly(obj)
		Citizen.Wait(10000)
		DeleteObject(obj)
	end)
end
end)


RegisterNetEvent('smerfik:zamrozcrft222')
AddEventHandler('smerfik:zamrozcrft222', function()
	playerPed = PlayerPedId()	
	ClearPedTasks(PlayerPedId())
	FreezeEntityPosition(playerPed, true)
end)
RegisterNetEvent('smerfik:odmrozcrft222')
AddEventHandler('smerfik:odmrozcrft222', function()
	playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, false)
	ClearPedTasks(PlayerPedId())

	

--	TriggerEvent('podlacz:propa22') -- un comment if want animation
	maitem = true

Citizen.Wait(500)
	wtrakcie = false

end)


RegisterNetEvent('smerfik:craftanimacja222')
AddEventHandler('smerfik:craftanimacja222', function()
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
Citizen.Wait(2000)
end)



function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(10)
	end
end
Citizen.CreateThread(function()
  
	RequestModel(GetHashKey("a_c_cow"))
	while not HasModelLoaded(GetHashKey("a_c_cow")) do
		Wait(155)
	end

		local ped =  CreatePed(4, GetHashKey("a_c_cow"), 2441.06, 4755.95, 33.35, -149.404, false, true)
	 -- FreezeEntityPosition(ped, true)
		SetEntityInvincible(ped, true)
	--	SetBlockingOfNonTemporaryEvents(ped, true)
		while true do
			Citizen.Wait(10000)
			TaskPedSlideToCoord(ped, 2441.76, 4755.95, 33.45, -149.404, 10)
		end
end)
Citizen.CreateThread(function()

RequestModel(GetHashKey("a_c_cow"))
while not HasModelLoaded(GetHashKey("a_c_cow")) do
	Wait(155)
end

	local ped =  CreatePed(4, GetHashKey("a_c_cow"), 2443.96, 4764.95, 33.35, -349.404, false, true)
	--FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
--	SetBlockingOfNonTemporaryEvents(ped, true)
	while true do
		Citizen.Wait(10000)
		TaskPedSlideToCoord(ped, 2443.76, 4764.95, 33.45, -349.404, 10)
	end
end)
Citizen.CreateThread(function()

RequestModel(GetHashKey("a_c_cow"))
while not HasModelLoaded(GetHashKey("a_c_cow")) do
	Wait(155)
end

	local ped =  CreatePed(4, GetHashKey("a_c_cow"), 2434.76, 4764.95, 33.35, 149.404, false, true)
--	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
--	SetBlockingOfNonTemporaryEvents(ped, true)
	while true do
		Citizen.Wait(10000)
		TaskPedSlideToCoord(ped, 2434.76, 4764.95, 33.45, 749.404, 10)
	end
end)
Citizen.CreateThread(function()

RequestModel(GetHashKey("a_c_cow"))
while not HasModelLoaded(GetHashKey("a_c_cow")) do
	Wait(155)
end

	local ped =  CreatePed(4, GetHashKey("a_c_cow"), 2430.76, 4773.95, 33.45, 749.404, false, true)
--	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
--	SetBlockingOfNonTemporaryEvents(ped, true)
	while true do
		Citizen.Wait(10000)
		TaskPedSlideToCoord(ped, 2430.76, 4773.95, 33.45, 749.404, 10)
	end
end)

Citizen.CreateThread(function()
	while true do

		Wait(5)
		local coords  = GetEntityCoords(GetPlayerPed(-1))


	if(GetDistanceBetweenCoords(coords, Config.DairySell.x, Config.DairySell.y, Config.DairySell.z, true) < 5.0) then

		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local zaplata = 0

		if(GetDistanceBetweenCoords(coords, Config.DairySell.x, Config.DairySell.y, Config.DairySell.z, true) < 3.0) then
			ESX.ShowAdvancedNotification('Selling milk', '~y~Costa-Fortune', '~y~[E] ~w~Sell milk to business', 'CHAR_PROPERTY_SONAR_COLLECTIONS', 3)
				if IsControlJustReleased(0, Keys['E']) then
					skup()
				end
			end
		end
	end
end)

RegisterNetEvent('podlacz:propa22')
AddEventHandler('podlacz:propa22', function()
	local ad = "anim@heists@box_carry@"
	loadAnimDict( ad )
	TaskPlayAnim( PlayerPedId(), ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )

	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))

	if maitem == false then
		bagspawned = CreateObject(GetHashKey(bagModel), x, y, z+0.2,  true,  true, true)
		AttachEntityToEntity(bagspawned, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.025, -0.24, 0.355, -75.0, 470.0, 0.0, true, true, false, true, 1, true)	
	end
	Citizen.Wait(10000)
end)
RegisterNetEvent('sprzedawanie:jablekanim22')
AddEventHandler('sprzedawanie:jablekanim22', function()

	local playerPed = PlayerPedId()
	local lib, anim = 'gestures@m@standing@casual', 'gesture_easy_now'
	FreezeEntityPosition(playerPed, true)
	ESX.Streaming.RequestAnimDict(lib, function()
	TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
end)
end)
function skup()

	TriggerServerEvent('smerfikcraft:skup22')

Citizen.Wait(3500)
	Citizen.Wait(13000)
	FreezeEntityPosition(PlayerPedId(), false)

	wtrakcie = false
end
	
RegisterNetEvent('odlacz:propa3')
AddEventHandler('odlacz:propa3', function()
	DetachEntity(bagspawned, 1, 1)
	ClearPedSecondaryTask(PlayerPedId())

end)
RegisterNetEvent('odlacz:propa2')
AddEventHandler('odlacz:propa2', function()
	DeleteObject(bagspawned)

	maitem = false

	FreezeEntityPosition(PlayerPedId(), false)
end)



local UI = { 

	x =  0.000 ,	-- Base Screen Coords 	+ 	 x
	y = -0.001 ,	-- Base Screen Coords 	+ 	-y

}
RegisterNetEvent('smerfik:tekstjab22')
AddEventHandler('smerfik:tekstjab22', function()
while true do
	Citizen.Wait(1)
	if wtrakcie == true then

	drawTxt(UI.x + 0.9605, UI.y + 0.962, 1.0,0.98,0.4, "~y~[~w~".. tekst .. "%~y~]", 255, 255, 255, 255)

end
end
end)
function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(2, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end
RegisterNetEvent('smerfik:zdejmijznaczek22')
AddEventHandler('smerfik:zdejmijznaczek22', function()
wtrakcie = false
end)
RegisterNetEvent('zacznijtekst22')
AddEventHandler('zacznijtekst22', function()
	Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1
Citizen.Wait(74)
tekst = tekst + 1

Citizen.Wait(1500)
tekst = 0
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

