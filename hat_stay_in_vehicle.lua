local wasInVehicle = false
local hatProp = 0
local hatObject = nil

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
                AttachHatToPlayer(playerPed, hatProp) -- Attach the hat prop to the player
            end
        elseif wasInVehicle and not inVehicle then
            wasInVehicle = false -- Left vehicle

            -- Remove the attached hat prop
            DetachHatFromPlayer()
        end
    end
end)

function AttachHatToPlayer(playerPed, hatProp)
    if not hatObject then
        local boneIndex = GetPedBoneIndex(playerPed, 0x39D7) -- Head bone index (SKEL_Head)

        if boneIndex ~= -1 then
            local propHash = GetHashKey(GetPropModelName(hatProp))

            RequestModel(propHash)
            while not HasModelLoaded(propHash) do
                Citizen.Wait(100)
            end

            hatObject = CreateObject(propHash, 0.0, 0.0, 0.0, true, true, true)
            AttachEntityToEntity(hatObject, playerPed, boneIndex, 0.09, 0.06, 0.12, 0.0, 0.0, 180.0, false, false, false, false, 2, true)
            SetModelAsNoLongerNeeded(propHash)
        end
    end
end

function DetachHatFromPlayer()
    if hatObject then
        DeleteEntity(hatObject)
        hatObject = nil
    end

    if hatProp ~= 0 then
        SetPedPropIndex(PlayerPedId(), 0, hatProp, 0, true)
        hatProp = 0
    end
end

function GetPropModelName(prop)
    local propHash = GetHashKey(GetPedPropTextureIndex(PlayerPedId(), 0))

    if propHash ~= 0 then
        local modelName = GetHashKey(GetEntityModel(propHash))
        if modelName ~= 0 then
            return GetModelNameFromHash(modelName)
        end
    end

    return ""
end
