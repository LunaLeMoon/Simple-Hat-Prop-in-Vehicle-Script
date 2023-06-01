RegisterServerEvent('attachHatToPlayer')
AddEventHandler('attachHatToPlayer', function(prop)
    TriggerClientEvent('attachHatToPlayer', -1, prop) -- Broadcast hat prop to all clients
end)

RegisterServerEvent('detachHatFromPlayer')
AddEventHandler('detachHatFromPlayer', function()
    TriggerClientEvent('detachHatFromPlayer', -1) -- Broadcast hat removal to all clients
end)
