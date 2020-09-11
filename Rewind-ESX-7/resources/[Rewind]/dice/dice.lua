TriggerEvent('chat:addSuggestion', '/dice')

RegisterCommand('dice', function(source, args, rawCommand)
    local number = math.random(1,6)
    loadAnimDict("anim@mp_player_intcelebrationmale@wank")
    TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@wank", "wank", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Citizen.Wait(1500)
    ClearPedSecondaryTask(GetPlayerPed(-1))

    TriggerServerEvent('3dme:shareDisplay', 'Dice Rolled: '..number..'/6')
end)
   
   function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
     RequestAnimDict( dict )
     Citizen.Wait(5)
    end
   end