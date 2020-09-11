admins = {
    'steam:1100001158FFDF5',
    'steam:11000013323b893',
    'steam:110000108968cbd',
}

RegisterCommand('idsoverhead', function(source, args)
    if isAllowedToChange(source) then
        TriggerClientEvent('ids:off/on', -1)
    else
        TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1You are not allowed to use this command.')
    end
end)

function isAllowedToChange(player)
    local allowed = false
    for i,id in ipairs(admins) do
        for x,pid in ipairs(GetPlayerIdentifiers(player)) do
            if debugprint then print('admin id: ' .. id .. '\nplayer id:' .. pid) end
            if string.lower(pid) == string.lower(id) then
                allowed = true
            end
        end
    end
    return allowed
end