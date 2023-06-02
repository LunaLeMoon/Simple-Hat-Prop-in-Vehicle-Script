RegisterServerEvent('attachHatToPlayer')
AddEventHandler('attachHatToPlayer', function(prop)
    TriggerClientEvent('attachHatToPlayer', -1, prop) -- Broadcast the hat prop to all clients
end)

RegisterServerEvent('detachHatFromPlayer')
AddEventHandler('detachHatFromPlayer', function()
    TriggerClientEvent('detachHatFromPlayer', -1) -- Broadcast the hat detachment to all clients
end)
