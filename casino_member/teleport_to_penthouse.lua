-- Initialize QBCore
local QBCore = exports['qb-core']:GetCoreObject()

local pedCoords = vector3(929.01, 34.93, 81.09) -- NPC coordinates in the lobby
local penthouseCoords = vector3(963.62, 59.29, 111.55) -- Penthouse coordinates
local pedModel = "S_M_Y_Doorman_01"

-- Load Ped Model and Spawn NPC
CreateThread(function()
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(1)
    end
    local npc = CreatePed(4, pedModel, pedCoords.x, pedCoords.y, pedCoords.z - 1.0, 325.0, false, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    FreezeEntityPosition(npc, true)
    exports['qb-target']:AddTargetEntity(npc, {
        options = {
            {
                type = "client",
                event = "casino:teleportToPenthouse",
                icon = "fas fa-door-open",
                label = "Go to the Penthouse",
            },
        },
        distance = 2.5,
    })
end)

-- Teleport to Penthouse Event
RegisterNetEvent('casino:teleportToPenthouse', function()
    QBCore.Functions.TriggerCallback('casino:checkVIPStatus', function(hasVIP)
        if hasVIP then
            -- Teleport the player to the penthouse
            SetEntityCoords(PlayerPedId(), penthouseCoords.x, penthouseCoords.y, penthouseCoords.z)
            QBCore.Functions.Notify("Welcome to the Penthouse!", "success")
        else
            QBCore.Functions.Notify("You need a VIP pass to access the Penthouse.", "error")
        end
    end)
end)
