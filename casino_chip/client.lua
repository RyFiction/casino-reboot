local QBCore = exports['qb-core']:GetCoreObject()

-- Ped setup
local pedModel = `U_F_M_CasinoCash_01`
local pedCoords = vector3(950.78, 33.56, 71.84)
local pedHeading = 50.0

Citizen.CreateThread(function()
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(1)
    end
    
    local ped = CreatePed(4, pedModel, pedCoords.x, pedCoords.y, pedCoords.z - 1.0, pedHeading, false, true)
    SetEntityAsMissionEntity(ped, true, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    exports['qb-target']:AddTargetEntity(ped, {
        options = {
            {
                type = "client",
                event = "casino:client:buyCasinoChip",
                icon = "fas fa-coins",
                label = "Buy Casino Chips",
            },
            {
                type = "client",
                event = "casino:client:sellCasinoChip",
                icon = "fas fa-coins",
                label = "Exchange Casino Chips",
            },
        },
        distance = 10.0
    })
end)

-- Custom input function for getting amount
function GetInput(promptText)
    local input = exports['qb-input']:ShowInput({
        header = promptText,
        submitText = "Submit",
        inputs = {
            {
                text = "Amount", -- text for label
                name = "amount", -- variable name
                type = "number", -- input type
                isRequired = true -- ensure it can't be empty
            }
        }
    })

    if input and input.amount then
        return tonumber(input.amount)
    end
    return nil
end

RegisterNetEvent("casino:client:buyCasinoChip")
AddEventHandler("casino:client:buyCasinoChip", function()
    local amount = GetInput("Enter amount to buy:")
    if amount and amount > 0 then
        TriggerServerEvent("casino:server:buyCasinoChip", amount)
    else
        QBCore.Functions.Notify("Invalid amount entered", "error")
    end
end)

RegisterNetEvent("casino:client:sellCasinoChip")
AddEventHandler("casino:client:sellCasinoChip", function()
    local amount = GetInput("Enter amount to exchange:")
    if amount and amount > 0 then
        TriggerServerEvent("casino:server:sellCasinoChip", amount)
    else
        QBCore.Functions.Notify("Invalid amount entered", "error")
    end
end)
