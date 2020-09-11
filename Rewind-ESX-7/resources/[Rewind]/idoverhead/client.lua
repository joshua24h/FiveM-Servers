local playerNamesDist = 1
local displayIDHeight = 1 --Height of ID above players head(starts at center body mass)

local red = 255  --Set Default Values for Colors
local green = 0
local blue = 0

local showIDS = true

RegisterNetEvent('ids:off/on')
AddEventHandler('ids:off/on', function()
    showIDS = not showIDS
end)

Citizen.CreateThread(function()
    while true do
        for id = 0, 256 do
            if  ((NetworkIsPlayerActive( id )) and GetPlayerPed( id ) ~= GetPlayerPed( -1 )) then
                ped = GetPlayerPed( id )
 
                x1, y1, z1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
                x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
                
                if showIDS then
                    if ((distance < playerNamesDist)) then
                        red = 255
					    green = 0
                        blue = 0
                        DrawText3D(x2, y2, z2 + displayIDHeight, GetPlayerServerId(id))
                    else

                    end
                end
            end 
        end
        Citizen.Wait(0)
    end
end)

function DrawText3D(x,y,z, text) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(red, green, blue, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
		World3dToScreen2d(x,y,z, 0) --Added Here
        DrawText(_x,_y)
    end
end