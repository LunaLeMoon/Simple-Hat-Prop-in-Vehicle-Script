local wasInVehicle = false
local hatProp = -1

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local playerPed = PlayerPedId()
        local inVehicle = IsPedInAnyVehicle(playerPed, false)

        if inVehicle and not wasInVehicle then
            wasInVehicle = true -- Entered vehicle

            -- Check if the player is wearing a hat prop
            local currentProp = GetPedPropIndex(playerPed, 0)

            if currentProp ~= -1 then
                hatProp = currentProp -- Store the hat prop
            end
        elseif wasInVehicle and not inVehicle then
            wasInVehicle = false -- Left vehicle

            -- Re-equip the hat prop if it was previously stored
            if hatProp ~= -1 then
                SetPedPropIndex(playerPed, 0, hatProp, 0, true)
            end
        end
    end
end)
