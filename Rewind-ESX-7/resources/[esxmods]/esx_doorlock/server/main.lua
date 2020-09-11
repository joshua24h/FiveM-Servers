ESX				= nil
local DoorInfo	= {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_doorlock:davetest')
AddEventHandler('esx_doorlock:davetest', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('chat:addMessage', -1, { template = '<div class="chat-message power"><b>LS Water & Power : </b> {1}</div>', args = { fal, " Attempted hack at the power grid stand by"  } })
	--Wait(5000)
	TriggerClientEvent('esx_doorlock:test', source, xPlayer.getInventoryItem('keycard').count)
end)

ESX.RegisterServerCallback('esx_doorlock:anycops',function(source, cb)
	local xPlayers = ESX.GetPlayers()
	local cops = 0
	for i=1, #xPlayers, 1 do
	 local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
	 if xPlayer.job.name == 'police' then
			cops = cops + 1
		end
	end
	cb(cops)
end)




RegisterServerEvent('esx_doorlock:updateState')
AddEventHandler('esx_doorlock:updateState', function(doorID, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	if type(doorID) ~= 'number' then
		print(('esx_doorlock: %s didn\'t send a number!'):format(xPlayer.identifier))
		return
	end

	-- make each door a table, and clean it when toggled
	DoorInfo[doorID] = {}

	-- assign information
	DoorInfo[doorID].state = state
	DoorInfo[doorID].doorID = doorID

	TriggerClientEvent('esx_doorlock:setState', -1, doorID, state)
end)

ESX.RegisterServerCallback('esx_doorlock:getDoorInfo', function(source, cb)
	cb(DoorInfo, #DoorInfo)
end)

function IsAuthorized(jobName, doorID)
	for i=1, #doorID.authorizedJobs, 1 do
		if doorID.authorizedJobs[i] == jobName then
			return true
		end
	end

	return false
end