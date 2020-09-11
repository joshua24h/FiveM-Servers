ESX                = nil

TriggerEvent('esx_phone:registerNumber', 'lizard', _U('lizard_client'), true, true)
TriggerEvent('esx_society:registerSociety', 'lizard', 'Lizard', 'society_lizard', 'society_lizard', 'society_lizard', {type = 'private'})

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'lizard', Config.MaxInService)
end