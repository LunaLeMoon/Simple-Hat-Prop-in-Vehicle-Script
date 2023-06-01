RegisterServerEvent('attachHatToPlayer')
AddEventHandler('attachHatToPlayer', function(hatProp)
    TriggerClientEvent('attachHatToPlayer', -1, source, hatProp) -- Broadcast hat prop to all clients
end)

RegisterServerEvent('detachHatFromPlayer')
AddEventHandler('detachHatFromPlayer', function()
    TriggerClientEvent('detachHatFromPlayer', -1, source) -- Broadcast hat removal to all clients
end)

RegisterNetEvent('attachHatToPlayer')
AddEventHandler('attachHatToPlayer', function(source, hatProp)
    TriggerClientEvent('attachHatToPlayer', -1, source, hatProp) -- Broadcast hat prop to all clients except the sender
end)

RegisterNetEvent('detachHatFromPlayer')
AddEventHandler('detachHatFromPlayer', function(source)
    TriggerClientEvent('detachHatFromPlayer', -1, source) -- Broadcast hat removal to all clients except the sender
end)
