ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)


function OpenHeadlightMenu()
    local elems = {
        {label = 'Open list', value = 'open_list'},

}
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ColourMenu',{
        title = 'Headlight Colours',
        align = 'right',
        elements = elems
    },
    function(data, menu)
        if data.current.value == 'open_list' then 
            ColourList()
        end

    end,
    function(data, menu)
        menu.close()
    end)
end

--[[
    All Colours
]]

function ColourList()
        local elems = {
            {label = 'Darkblue', value = '1'},
            {label = 'Lightblue', value = '2'},
            {label = 'Turquoise', value = '3'},
            {label = 'Green', value = '4'},
            {label = 'Yellow', value = '5'},
            {label = 'Gold', value = '6'},
            {label = 'Orange', value = '7'},
            {label = 'Red', value = '8'},
            {label = 'Pink', value = '9'},
            {label = 'Violet', value = '10'},
            {label = 'Purple', value = '11'},
            {label = 'Ultraviolet', value = '12'},

        }
    
        ESX.UI.Menu.CloseAll()
    
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ColourMenu',{
            title = 'Headlight Colours',
            align = 'right',
            elements = elems
        },
        function(data, menu)
            if data.current.value == '1' then
                TriggerServerEvent('sync:lights1')
            end

            if data.current.value == '2' then
                TriggerServerEvent('sync:lights2')
            end
            
            if data.current.value == '3' then
                TriggerServerEvent('sync:lights3')
            end
            
            if data.current.value == '4' then
                TriggerServerEvent('sync:lights4')
            end

            if data.current.value == '5' then
                TriggerServerEvent('sync:lights5')
            end
            
            if data.current.value == '6' then
                TriggerServerEvent('sync:lights6')
            end

            if data.current.value == '7' then
                TriggerServerEvent('sync:lights7')
            end

            if data.current.value == '8' then
                TriggerServerEvent('sync:lights8')
            end

            if data.current.value == '9' then
                TriggerServerEvent('sync:lights9')
            end

            if data.current.value == '10' then
                TriggerServerEvent('sync:lights10')
            end

            if data.current.value == '11' then
                TriggerServerEvent('sync:lights11')
            end

            if data.current.value == '12' then
                TriggerServerEvent('sync:lights12')
            end
    end,
    function(data, menu)
        menu.close()
    end)
end

RegisterNetEvent('lights:Darkblue')
AddEventHandler('lights:Darkblue', function()

    local veh = GetVehiclePedIsUsing(PlayerPedId())
    ToggleVehicleMod(veh, 22, true) -- Xenon
    SetVehicleHeadlightsColour(veh, 1)

end)

RegisterNetEvent('lights:Lightblue')
AddEventHandler('lights:Lightblue', function()

    local veh = GetVehiclePedIsUsing(PlayerPedId())
    ToggleVehicleMod(veh, 22, true) -- Xenon
    SetVehicleHeadlightsColour(veh, 2)

end)

RegisterNetEvent('lights:Turquoise')
AddEventHandler('lights:Turquoise', function()

    local veh = GetVehiclePedIsUsing(PlayerPedId())
    ToggleVehicleMod(veh, 22, true) -- Xenon
    SetVehicleHeadlightsColour(veh, 3)

end)

RegisterNetEvent('lights:Green')
AddEventHandler('lights:Green', function()

    local veh = GetVehiclePedIsUsing(PlayerPedId())
    ToggleVehicleMod(veh, 22, true) -- Xenon
    SetVehicleHeadlightsColour(veh, 4)

end)

RegisterNetEvent('lights:Yellow')
AddEventHandler('lights:Yellow', function()

    local veh = GetVehiclePedIsUsing(PlayerPedId())
    ToggleVehicleMod(veh, 22, true) -- Xenon
    SetVehicleHeadlightsColour(veh, 5)

end)

RegisterNetEvent('lights:Gold')
AddEventHandler('lights:Gold', function()

    local veh = GetVehiclePedIsUsing(PlayerPedId())
    ToggleVehicleMod(veh, 22, true) -- Xenon
    SetVehicleHeadlightsColour(veh, 6)

end)

RegisterNetEvent('lights:Orange')
AddEventHandler('lights:Orange', function()

    local veh = GetVehiclePedIsUsing(PlayerPedId())
    ToggleVehicleMod(veh, 22, true) -- Xenon
    SetVehicleHeadlightsColour(veh, 7)

end)

RegisterNetEvent('lights:Red')
AddEventHandler('lights:Red', function()

    local veh = GetVehiclePedIsUsing(PlayerPedId())
    ToggleVehicleMod(veh, 22, true) -- Xenon
    SetVehicleHeadlightsColour(veh, 8)

end)

RegisterNetEvent('lights:Pink')
AddEventHandler('lights:Pink', function()

    local veh = GetVehiclePedIsUsing(PlayerPedId())
    ToggleVehicleMod(veh, 22, true) -- Xenon
    SetVehicleHeadlightsColour(veh, 9)

end)

RegisterNetEvent('lights:Violet')
AddEventHandler('lights:Violet', function()

    local veh = GetVehiclePedIsUsing(PlayerPedId())
    ToggleVehicleMod(veh, 22, true) -- Xenon
    SetVehicleHeadlightsColour(veh, 10)

end)

RegisterNetEvent('lights:Purple')
AddEventHandler('lights:Purple', function()

    local veh = GetVehiclePedIsUsing(PlayerPedId())
    ToggleVehicleMod(veh, 22, true) -- Xenon
    SetVehicleHeadlightsColour(veh, 11)

end)

RegisterNetEvent('lights:Ultraviolet')
AddEventHandler('lights:Ultraviolet', function()

    local veh = GetVehiclePedIsUsing(PlayerPedId())
    ToggleVehicleMod(veh, 22, true) -- Xenon
    SetVehicleHeadlightsColour(veh, 12)

end)

--[[
    Marker, Blip and help text
]]

local location = {
    {x = -223.773, y = -1323.365, z = 30.249},

}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(location) do
            DrawMarker(20, location[k].x, location[k].y, location[k].z, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 255, 50, 255, 100, true, true, 2, true, false, false, false)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(location) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, location[k].x, location[k].y, location[k].z)

            if dist <= 1.5 then
                ESX.ShowHelpNotification("Press ~INPUT_TALK~ to change the ~p~Colour~s~")
				if IsControlJustPressed(1,51) then 
					OpenHeadlightMenu()
				end
            end
        end
    end
end)


	-- Create blips
	Citizen.CreateThread(function()
        for k in pairs(location) do
			local blip = AddBlipForCoord(-223.773,-1323.365,29.0)

			SetBlipSprite (blip, 643)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 0.7)
			SetBlipColour (blip, 8)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Headlight Changer")
			EndTextCommandSetBlipName(blip)
		end
	end)
