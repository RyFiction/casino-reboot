local QBCore = exports['qb-core']:GetCoreObject()

-- Ped setup
local pedModel = `u_f_m_casinoshop_01` -- Change to your desired ped model
local pedCoords = {
    vector3(920.85, 45.75, 72.07), -- First ped coordinates
    vector3(933.97, 41.53, 81.09)  -- Second ped coordinates
}
local pedHeading = {
    270.0, -- First ped heading
    60.0   -- Second ped heading
}

Citizen.CreateThread(function()
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(1)
    end

    for i = 1, #pedCoords do
        local ped = CreatePed(4, pedModel, pedCoords[i].x, pedCoords[i].y, pedCoords[i].z - 1.0, pedHeading[i], false, true)
        SetEntityAsMissionEntity(ped, true, true)
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)

        exports['qb-target']:AddTargetEntity(ped, {
            options = {
                {
                    type = "client",
                    event = "casino:client:buyCasinoMember",
                    icon = "fas fa-id-card",
                    label = "Buy a Casino Membership - $5,000",
                },
                {
                    type = "client",
                    event = "casino:client:buyCasinoVIP",
                    icon = "fas fa-star",
                    label = "Buy a Casino VIP Membership - $50,000",
                },
            },
            distance = 3.0 -- Adjust to your preferred distance
        })
    end
end)

RegisterNetEvent("casino:client:buyCasinoMember")
AddEventHandler("casino:client:buyCasinoMember", function()
    TriggerServerEvent("casino:server:buyCasinoMember")
end)

RegisterNetEvent("casino:client:buyCasinoVIP")
AddEventHandler("casino:client:buyCasinoVIP", function()
    TriggerServerEvent("casino:server:buyCasinoVIP")
end)
